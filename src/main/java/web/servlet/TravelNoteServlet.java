package web.servlet;

import java.io.*;

import domain.*;
import net.sf.json.JSONObject;
import service.TravelNoteInfoService;
import service.UserInfoService;
import service.impl.TravelNoteInfoServiceImpl;
import service.impl.UserInfoServiceImpl;
import utils.DeBugUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/14 09:42
 * @Description:
 */
@WebServlet("/travelnote/*")
public class TravelNoteServlet extends BaseServlet{

    public String filename = null;

    TravelNoteInfoService noteInfoService = new TravelNoteInfoServiceImpl();
    UserInfoService userInfoService = new UserInfoServiceImpl();

    /**
     * 获取地址
     */
    public void getLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.调用service查询TravelNote对象集合
        List<String> list = noteInfoService.getLocate();
        if (list.isEmpty()) {
            System.out.println("查询地址信息为空");
        }
        String result = "[";
        for (String item : list) {
            result = result + "{title:\"" + item + "\"},";
//            result = result + "{\"title\":\"" + item + "\"},";
        }
        result = result.substring(0, result.length()-1);
        result = result + "]";
        System.out.println("后台查询数据库中的游记地址: " + result);
        response.setContentType("text/text;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(result);
        out.flush();
        out.close();
    }

    /**
     * 检查地址编号
     */
    public void checkLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locateName = request.getParameter("name");
        System.out.println("后台获取到的地址名称: " + locateName);
        int locateId = noteInfoService.checkLocate(locateName);
        System.out.println("后台返回的地址编号: " + locateId);
        writeValue(locateId, response);
    }

    /**
     * 匹配地址名称
     */
    public void matchLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locateId = Integer.parseInt(request.getParameter("locateId"));
        System.out.println("后台获取到的地址编号: " + locateId);
        String locateName = noteInfoService.matchLocate(locateId);
        System.out.println("后台返回的地址名称: " + locateName);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(locateName);
        out.flush();
        out.close();
    }

    /**
     * 匹配人物名称
     */
    public void matchPeople(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int peopleId = Integer.parseInt(request.getParameter("peopleId"));
        System.out.println("后台获取到的人物编号: " + peopleId);
        String peopleName = noteInfoService.matchPeople(peopleId);
        System.out.println("后台返回的人物名称: " + peopleName);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(peopleName);
        out.flush();
        out.close();
    }

    /**
     * 游记推荐
     */
    public void recommendTravelNoteInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PageBean<TravelNoteInfo> pageBean = new PageBean<>();
        //1.接收参数
        String id = request.getParameter("userId");
        String currentPageStr = request.getParameter("currentPage");
        System.out.println("1.后台获取到的参数: 用户Id:  " + id + " currentPage " + currentPageStr);
        //2.处理参数
        int userId = 0;//用户编号，如果不传递，默认为0
        if (id != "") {
            userId = Integer.valueOf(id);
        }
        int currentPage = 0;//当前页码，如果不传递，则默认为第一页
        if (currentPageStr != null && currentPageStr.length() > 0){
            currentPage = Integer.parseInt(currentPageStr);
        }else {
            currentPage = 1;
        }
        pageBean.setCurrentPage(currentPage);

        //3.调用service查询PageBean对象
        System.out.println("3.后台获取到的参数: 用户Id:  " + userId + " currentPage " + currentPage);
        List<TravelNoteInfo> list = noteInfoService.recommendTravelNoteInfo(userId);

        // 4.设置总记录数
        int totalCount = list.size()-4;
        pageBean.setTotalCount(totalCount);

        // 5.设置总页码
        int totalPage = totalCount%10==0 ? (totalCount/10) : (totalCount/10)+1;
        pageBean.setTotalPage(totalPage);

        // 6.设置轮播图显示的数据集合 0~3
        List<TravelNoteInfo> head = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            if (list.get(i) != null){
                head.add(list.get(i));
                System.out.print(" " + list.get(i).getTravelNoteId() + ",");
            }
        }
        pageBean.setHeadRow(head);

        // 7.设置当前页显示的游记数据集合 4~13   14~23   24~33   34~43   44~53
        int start = (currentPage - 1)*10;
        List<TravelNoteInfo> noteInfoList = new ArrayList<>();
        for (int i = start+4; i < (start+14); i++) {
            if (list.get(i) != null){
                noteInfoList.add(list.get(i));
            }
        }
        pageBean.setList(noteInfoList);

        // 8.设置当前页显示的位置信息集合
        List<String> locateList = new ArrayList<>();
        for (int i = 0; i < noteInfoList.size(); i++) {
            if (noteInfoList.get(i) != null) {
                locateList.add( noteInfoService.matchLocate( noteInfoList.get(i).getLocateId() ) );
            }
        }
        pageBean.setLocate(locateList);

        // 9.设置当前页显示的用户信息集合
        List<UserInfo> userList = new ArrayList<>();
        for (int i = 0; i < noteInfoList.size(); i++) {
            if (noteInfoList.get(i) != null) {
                userList.add( userInfoService.queryUserInfoByTravelNoteId( noteInfoList.get(i).getTravelNoteId() ) );
            }
        }
        pageBean.setUserList(userList);

        // 10.设置当前页显示的收藏数量集合
        List<Integer> collectList = new ArrayList<>();
        for (int i = 0; i < noteInfoList.size(); i++) {
            if (noteInfoList.get(i) != null) {
                collectList.add( noteInfoService.queryTravelNoteCollectionNum( noteInfoList.get(i).getTravelNoteId() ) );
            }
        }
        pageBean.setCollectNum(collectList);

        // 11.设置当前页显示的点赞数量集合
        List<Integer> likeList = new ArrayList<>();
        for (int i = 0; i < noteInfoList.size(); i++) {
            if (noteInfoList.get(i) != null) {
                likeList.add( noteInfoService.queryTravelNoteLikeNum( noteInfoList.get(i).getTravelNoteId() ) );
            }
        }
        pageBean.setLikeNum(likeList);
        System.out.println();
        System.out.println("11.Servlet获取到的游记推荐数量:  " + list.size());

        // 12.将pageBean对象集合序列化为json，返回
        writeValue(pageBean, response);
    }

    /**
     * 根据搜索内容搜索游记
     */
    public void queryTravelNoteInfoBySearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // 1.接收参数
        String search = request.getParameter("search");
        // 2.调用service查询PageBean对象
        System.out.println("3.后台获取到的参数,搜索内容:  " + search);
        List<TravelNoteInfo> list = noteInfoService.queryTravelNoteInfoBySearch(search);
        // 3.将list对象集合序列化为json，返回
        writeValue(list, response);

    }

    /**
     * 添加游记信息
     */
    public void addTravelNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String json = request.getParameter("travelnote");
        int userId = Integer.valueOf(request.getParameter("userId"));
        System.out.println("后台获取到的游记对象长度: " + json.length() +"  用户Id: " + userId);
        if (json.equals("")) {
            System.out.println("后台没有接收到游记对象信息");
        } else {
            // 1.先将json字符串转换为json对象，再将json对象转换为java对象，如下所示
            JSONObject object = JSONObject.fromObject(json);
            // 2.将游记信息保存
            TravelNoteInfo noteInfo = new TravelNoteInfo();
            noteInfo.setTravelNoteTitle(object.getString("travelNoteTitle"));
            noteInfo.setTravelNoteCover(object.getString("travelNoteCover"));
            noteInfo.setTravelNoteText(object.getString("travelNoteText"));
            noteInfo.setPublishDate(Date.valueOf(object.getString("publishDate")));
            noteInfo.setTravelTime(Date.valueOf(object.getString("travelTime")));
            noteInfo.setTravelDays(object.getInt("travelDays"));
            noteInfo.setTravelPerson(object.getInt("travelPerson"));
            noteInfo.setTravelPrice(object.getInt("travelPrice"));
            noteInfo.setLocateId(object.getInt("locateId"));
            System.out.println("后台实例化游记对象: " + noteInfo.toString());;
            // 3.将游记信息保存进数据库
            TravelNoteInfo travelNoteInfo = noteInfoService.addTravelNote(noteInfo, userId);
            System.out.println("数据库操作后返回游记对象: " + travelNoteInfo.toString());;
            writeValue(travelNoteInfo, response);
        }
    }

    /**
     * 根据游记Id查询游记
     */
    public void queryTravelNoteInfoById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收id
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的游记Id: " + noteId);
        //2.调用service查询route对象
        TravelNoteInfo travelNoteInfo = noteInfoService.queryTravelNoteInfoById(noteId);
        //3.转为json写回客户端
        writeValue(travelNoteInfo, response);
    }

    /**
     * 查询该游记是否是自己的
     */
    public void isMyTravelNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的用户Id: "+userId+" 游记Id: " + noteId);
        //2.调用service查询route对象
        Boolean flag = noteInfoService.isMyTravelNote(userId, noteId);
        //3.转为json写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 判断是否已经关注
     */
    public void isUserFollowedByTravelNoteId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的登录用户Id: " + userId + " 游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.isUserFollowedByTravelNoteId(userId, noteId);
        if (flag) {
            System.out.println("该用户已关注");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 判断是否已经收藏
     */
    public void isTravelNoteCollect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的登录用户Id: " + userId + " 游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.isTravelNoteCollect(userId, noteId);
        if (flag) {
            System.out.println("该游记已收藏");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 判断是否已经点赞
     */
    public void isTravelNoteLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的登录用户Id: " + userId + " 游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.isTravelNoteLike(userId, noteId);
        if (flag) {
            System.out.println("该游记已点赞");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 查询游记收藏数量
     */
    public void queryTravelNoteCollectionNum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到当前游记Id: " + noteId);
        // 2.调用service查询route对象
        int number = noteInfoService.queryTravelNoteCollectionNum(noteId);
        System.out.println("后台获取的游记收藏数量:" + number);
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(number);
        out.flush();
        out.close();
    }

    /**
     * 查询游记点赞数量
     */
    public void queryTravelNoteLikeNum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到当前游记Id: " + noteId);
        // 2.调用service查询route对象
        int number = noteInfoService.queryTravelNoteLikeNum(noteId);
        System.out.println("后台获取的游记点赞数量:" + number);
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(number);
        out.flush();
        out.close();
    }

    /**
     * 更新关注信息
     */
    public void updateUserFollowByTravelNoteId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的登录用户Id: " + userId + " 游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.updateUserFollowByTravelNoteId(userId, noteId);
        if (flag) {
            System.out.println("更新关注成功");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 更新收藏信息
     */
    public void updateTravelNoteCollect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的登录用户Id: " + userId + " 游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.updateTravelNoteCollect(userId, noteId);
        if (flag) {
            System.out.println("更新收藏成功");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 更新点赞信息
     */
    public void updateTravelNoteLike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int userId = Integer.valueOf(request.getParameter("userId"));
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的登录用户Id: " + userId + " 游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.updateTravelNoteLike(userId, noteId);
        if (flag) {
            System.out.println("更新点赞成功");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 更新浏览量信息
     */
    public void updateTravelNoteView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.接收id
        int noteId = Integer.valueOf(request.getParameter("noteId"));
        System.out.println("后台获取到的游记Id: " + noteId);
        // 2.调用service查询route对象
        Boolean flag = noteInfoService.updateTravelNoteView(noteId);
        if (flag) {
            System.out.println("更新浏览量成功");
        }
        // 3.写回客户端
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 查询个人所有游记信息
     */
    public void queryAllTravelNoteInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PageBean<TravelNoteInfo> pageBean = new PageBean<>();
        // 1.接收参数
        String id = request.getParameter("userId");
        if (DeBugUtils.debug_flag == 1){
            System.out.println("接收参数:" + id);
        }
        // 2.处理参数
        int userId = Integer.valueOf(id);
        // 3.调用Service获取游记信息
        List<TravelNoteInfo> noteInfoList = noteInfoService.queryAllTravelNoteInfo(userId);
        if (DeBugUtils.debug_flag == 1){
            System.out.println("我的游记查询结果:");
            for (int i = 0; i < noteInfoList.size(); i++) {
                System.out.print(noteInfoList.get(i).getTravelNoteId() + "   ");
            }
        }
        // 4.设置显示的游记信息集合
        pageBean.setList(noteInfoList);
        // 5.设置显示的点赞数据集合
        List<Integer> likeList = new ArrayList<>();
        for (int i = 0; i < noteInfoList.size(); i++) {
            if (noteInfoList.get(i) != null) {
                likeList.add( noteInfoService.queryTravelNoteLikeNum( noteInfoList.get(i).getTravelNoteId() ) );
            }
        }
        pageBean.setLikeNum(likeList);
        // 6.设置显示的收藏数据集合
        List<Integer> collectList = new ArrayList<>();
        for (int i = 0; i < noteInfoList.size(); i++) {
            if (noteInfoList.get(i) != null) {
                collectList.add( noteInfoService.queryTravelNoteCollectionNum( noteInfoList.get(i).getTravelNoteId() ) );
            }
        }
        pageBean.setCollectNum(collectList);
        // 7.将pageBean对象集合序列化为json，返回
        writeValue(pageBean, response);
    }

}

