package web.servlet;

import domain.*;
import org.apache.commons.beanutils.BeanUtils;
import service.TravelNoteInfoService;
import service.UserInfoService;
import service.impl.TravelNoteInfoServiceImpl;
import service.impl.UserInfoServiceImpl;
import utils.DeBugUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/11 21:19
 * @Description: 用户Servlet
 */
@WebServlet("/user/*")
public class UserServlet extends BaseServlet {

    //声明一个UserInfoService成员变量
    UserInfoService userInfoService = new UserInfoServiceImpl();
    TravelNoteInfoService travelNoteInfoService = new TravelNoteInfoServiceImpl();

    /**
     * 用户注册功能
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isError = checkCodeIsError(request, response);
        ResultInfo resultInfo = new ResultInfo();
        if (!isError) {
            resultInfo.setFlag(false);
            resultInfo.setErrorMsg("验证码错误");
            System.out.println("UserServlet---register:验证码错误");
            return;
        }
        //1.获取数据
        Map<String, String[]> map1 = request.getParameterMap();

        System.out.println("UserServlet---register:" + map1);

        //2.封装对象
        UserInfo userInfo = new UserInfo();
        try {
            BeanUtils.populate(userInfo, map1);
        }catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //3.调用Service，完成注册，不存在返回true，存在返回false
        UserInfo user = userInfoService.register(userInfo);
        //4.响应结果
        if (user != null) {
            request.getSession().setAttribute("user", user);
            resultInfo.setFlag(true);
        } else {
            resultInfo.setFlag(false);
            resultInfo.setErrorMsg("手机号已被注册");
        }
        getWriterWrite(resultInfo, response);
    }

    /**
     * 用户登录功能
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.判断验证码是否正确
        boolean isError = checkCodeIsError(request, response);
        ResultInfo resultInfo = new ResultInfo();
        if (!isError) {
            return;
        }
        //2.获取用户账号
        String account = request.getParameter("userAccount");
        String password = request.getParameter("userPassword");
        UserInfoService service = new UserInfoServiceImpl();
        UserInfo user = service.login(account, password);
        if (user == null) {
            //登录失败
            resultInfo.setFlag(false);
            resultInfo.setErrorMsg("账号或密码错误");
        } else {
            //登录成功
            user.toString();
            resultInfo.setFlag(true);
            //登录成功标记，在session中保存user对象
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("loginUserId",user.getUserId());
            request.getSession().setAttribute("user", user);
        }
        writeValue(resultInfo, response);
    }

    /**
     * 在session中查询用户信息
     */
    public void findOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从session中获取登录用户
        Object user = request.getSession().getAttribute("user");

        if (user != null) {
            System.out.println("查找当前登录的用户信息：");
            System.out.println(user);
        } else {
            System.out.println("当前没有用户登录");
        }
        //将user返回客户端
        writeValue(user,response);
    }

    /**
     * 退出登录
     */
    public void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.销毁session
        request.getSession().invalidate();
        //2.跳转页面
        response.sendRedirect(request.getContextPath() + "/lww/login.jsp");
    }

    /**
     * 查询用户关注与粉丝信息
     */
    public void queryFollowAndFans(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PageUser pageUser = new PageUser();
        // 1.接收参数
        String id = request.getParameter("userId");
        if (DeBugUtils.debug_flag == 1){
            System.out.println("接收参数:" + id);
        }
        // 2.处理参数
        int userId = Integer.valueOf(id);
        // 3.1 调用Service获取关注信息
        List<UserInfo> followList = userInfoService.queryConcernInfo(userId);
        List<Integer> followTravelNoteNumList = new ArrayList<>();
        List<Integer> followNumList = new ArrayList<>();
        for (int i = 0; i < followList.size(); i++) {
            int travelNum = travelNoteInfoService.countTravelNoteNum( followList.get(i).getUserId() );
            int FollowNum = userInfoService.countFollowNum( followList.get(i).getUserId() );
            followTravelNoteNumList.add(travelNum);
            followNumList.add(FollowNum);
        }
        pageUser.setFollowTravelNoteNumList(followTravelNoteNumList);
        pageUser.setFollowNumList(followNumList);
        // 3.2 调用Service获取粉丝信息
        List<UserInfo> fansList = userInfoService.queryFollowInfo(userId);
        List<Integer> fansTravelNoteNumList = new ArrayList<>();
        List<Integer> fansNumList = new ArrayList<>();
        for (int i = 0; i < fansList.size(); i++) {
            int travelNum = travelNoteInfoService.countTravelNoteNum(fansList.get(i).getUserId());
            int FollowNum = userInfoService.countFollowNum(fansList.get(i).getUserId());
            fansTravelNoteNumList.add(travelNum);
            fansNumList.add(FollowNum);
        }
        pageUser.setFansTravelNoteNumList(fansTravelNoteNumList);
        pageUser.setFansNumList(fansNumList);
        // 4.设置显示的关注信息集合
        pageUser.setFollowList(followList);
        // 5.设置显示的粉丝信息集合
        pageUser.setFansList(fansList);
        writeValue(pageUser, response);
    }

}






