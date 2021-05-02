package web.servlet;

import java.io.*;

import domain.TravelNoteInfo;
import org.apache.commons.beanutils.BeanUtils;
import service.TravelNoteInfoService;
import service.impl.TravelNoteInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.InvocationTargetException;
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
        String result = noteInfoService.getLocate();
        System.out.println("后台查询数据库中的游记地址: " + result);
        //2.将TravelNote对象集合序列化为json，返回
//        writeValue(list, response);
        response.setContentType("text/text;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(result);
        out.flush();
        out.close();
    }

    public void checkLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locateName = request.getParameter("name");
        System.out.println("后台获取到的地址信息: "+locateName);
        int locateId = noteInfoService.checkLocate(locateName);
        writeValue(locateId, response);
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

        String userId = request.getParameter("travelnote");
        System.out.println("后台获取到的游记对象: "+userId);

        Map<String, String[]> map = request.getParameterMap();
        TravelNoteInfo noteInfo = new TravelNoteInfo();
        try {
            BeanUtils.populate(noteInfo, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        TravelNoteInfo travelNoteInfo = noteInfoService.addTravelNote(noteInfo);
        writeValue(travelNoteInfo, response);
    }
}
