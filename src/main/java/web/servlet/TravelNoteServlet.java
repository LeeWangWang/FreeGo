package web.servlet;

import java.io.*;

import domain.TravelNoteInfo;
import net.sf.json.JSONObject;
import org.apache.commons.beanutils.BeanUtils;
import service.TravelNoteInfoService;
import service.impl.TravelNoteInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/14 09:42
 * @Description:
 */
@WebServlet("/travelnote/*")
public class TravelNoteServlet extends BaseServlet{

    public String filename = null;

    TravelNoteInfoService noteInfoService = new TravelNoteInfoServiceImpl();

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
    * @author:  李旺旺
    * @date:    2021/5/2 16:46
    * @param:   [request, response]
    * @return:  void
    * @exception:
    * @description: 检查地址编号
    */
    public void checkLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locateName = request.getParameter("name");
        System.out.println("后台获取到的地址名称: " + locateName);
        int locateId = noteInfoService.checkLocate(locateName);
        System.out.println("后台返回的地址编号: " + locateId);
        writeValue(locateId, response);
    }

    /**
     * @author:  李旺旺
     * @date:    2021/5/2 16:46
     * @param:   [request, response]
     * @return:  void
     * @exception:
     * @description: 匹配地址名称
     */
    public void matchLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int locateId = Integer.parseInt(request.getParameter("locateid"));
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
     * @author:  李旺旺
     * @date:    2021/5/2 16:46
     * @param:   [request, response]
     * @return:  void
     * @exception:
     * @description: 匹配人物名称
     */
    public void matchPeople(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int peopleId = Integer.parseInt(request.getParameter("peopleid"));
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
    public void recommendTravelNoteInfoNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.调用service查询TravelNote对象集合
        String userId = request.getParameter("userId");
        System.out.println("后台获取到的用户Id: "+userId);
        List<TravelNoteInfo> list = noteInfoService.recommendTravelNoteInfoNote(userId);
        System.out.println("游记推荐");
        for (TravelNoteInfo noteInfo : list) {
            noteInfo.toString();
        }
        //2.将TravelNote对象集合序列化为json，返回
        writeValue(list, response);
    }

    public void addTravelNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String json = request.getParameter("travelnote");
        System.out.println("后台获取到的游记对象: " + json);
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
            noteInfo.setTravelLocate(object.getInt("travelLocate"));
            System.out.println("后台实例化游记对象: " + noteInfo.toString());;
            // 3.将游记信息保存进数据库
            TravelNoteInfo travelNoteInfo = noteInfoService.addTravelNote(noteInfo);
            System.out.println("数据库操作后返回游记对象: " + travelNoteInfo.toString());;
            writeValue(travelNoteInfo, response);
        }
    }

    public void queryTravelNoteInfoById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.接收id
        int noteId = Integer.valueOf(request.getParameter("noteid"));
        System.out.println("后台获取到的游记Id: " + noteId);
        //2.调用service查询route对象
        TravelNoteInfo travelNoteInfo = noteInfoService.queryTravelNoteInfoById(noteId);
        //3.转为json写回客户端
        writeValue(travelNoteInfo, response);
    }

}
