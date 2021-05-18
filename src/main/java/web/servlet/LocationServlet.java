package web.servlet;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/18 16:32<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

import dao.impl.HotelInfoDaoImpl;
import domain.HotelInfo;
import domain.LocateInfo;
import domain.RoomInfo;
import service.impl.HotelInfoServiceImpl;
import service.impl.LocationInfoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: LocationServlet <br/>
 * Description: <br/>
 * date: 2021/4/18 16:32<br/>
 * @author hp<br />
 */

@WebServlet("/LocationServlet")
public class LocationServlet extends HttpServlet {
    private List<HotelInfo> hotelList = new ArrayList<HotelInfo>();      //查询酒店列表
    private List<LocateInfo> locateList = new ArrayList<LocateInfo>();    //地点列表
    private Map<Integer,List<RoomInfo>> MapRoomList = new HashMap<Integer, List<RoomInfo>>();  //酒店房间

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置request编码格式
        //System.out.println(methods);
        request.setCharacterEncoding("utf-8");
        String methods = request.getParameter("methods");

        if(methods.equals("queryLocation")) {
            /*ViewHotelMainInterface传过来的数据*/
            String userId = request.getParameter("userId");
            String mudidi = request.getParameter("mudidi");
            String ruzhu = request.getParameter("ruzhu");
            String likai = request.getParameter("likai");
            //System.out.println("userId:"+userId);
            locateList = queryLocation(mudidi);//查询地点
            HotelServlet hotelServlet = new HotelServlet();
            hotelList = hotelServlet.queryHotel(mudidi);
            /*待更新因为景点信息并没有获取*/
            if ((ruzhu.equals("") && likai.equals(""))) {
                //都为空 把所有房间都找出来
                HttpSession session = request.getSession();
                //获取其他信息
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
                HotelInfoServiceImpl hotelInfoImpl = new HotelInfoServiceImpl();
                //System.out.println("1");
                MapRoomList = hotelInfoImpl.queryHotelofRoomByHotelId(hotelList);
                //System.out.println("2");
                session.setAttribute("userId", userId);
                session.setAttribute("hotelList", hotelList);
                session.setAttribute("locateList", locateList);
                session.setAttribute("MapRoomList", MapRoomList);   //每个酒店对应的在规定时间内可以住的房间
                session.setAttribute("mudidi",mudidi);
                session.setAttribute("ruzhu",ruzhu);
                session.setAttribute("likai",likai);
                //System.out.println("既有地点又有景点");
                request.getRequestDispatcher("/mu/ViewHotelFitRequireInterface.jsp").forward(request, response);
            }else if ((!ruzhu.equals("")) && (!likai.equals(""))) {  //离开 入住都有
                //System.out.println("成功");
                HttpSession session = request.getSession();
                //已知道和用户输入的相同的酒店列表
                //酒店已经存在了hotelList
                //获取其他信息
                System.out.println("非空时likai:"+likai);
                System.out.println("非空时ruzhu:"+ruzhu);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date likaiDate = null;
                java.util.Date ruzhuDate = null;
                try {
                    likaiDate = formatter.parse(likai);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                try {
                    ruzhuDate = formatter.parse(ruzhu);
                }catch (ParseException e) {
                    e.printStackTrace();
                }
                System.out.println("ruzhuDate:"+ruzhuDate.toString());
                String renshu = request.getParameter("renshu");
                //对所有酒店对应的可用的房间进行接收
                HotelInfoServiceImpl hotelInfoImpl = new HotelInfoServiceImpl();
                //酒店id 对应下面可以入住的房间
                MapRoomList = hotelInfoImpl.queryHotelofRoomByHotelId(hotelList, ruzhuDate, likaiDate);
                //System.out.println(hotelList.get(0).toString());
                //System.out.println("MapList:" + MapRoomList.keySet());
                int ye = 1;
                session.setAttribute("userId", userId);
                session.setAttribute("MapRoomList", MapRoomList);   //每个酒店对应的在规定时间内可以住的房间
                session.setAttribute("hotelList", hotelList);       //符合输入的酒店列表
                session.setAttribute("locateList",locateList);
                session.setAttribute("mudidi",mudidi);
                session.setAttribute("ruzhu",ruzhu);
                session.setAttribute("likai",likai);
                session.setAttribute("renshu",renshu);
                //第几页
                request.getRequestDispatcher("/mu/ViewHotelFitRequireInterface.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        req.setCharacterEncoding("utf-8");
        String methods = req.getParameter("methods");

        //System.out.print("methods:"+methods+" ye:"+ye);
        //更新ViewHotelFitRequireInterface中的数据
        if(methods.equals("updateFitInterface")){
            int ye = Integer.parseInt(req.getParameter("ye"));
            String mudidi = req.getParameter("mudidi");
            String likai = req.getParameter("likai");
            String ruzhu = req.getParameter("ruzhu");

            HttpSession session = req.getSession();
            session.setAttribute("ye",ye);
            session.setAttribute("mudidi",mudidi);
            session.setAttribute("likai",likai);
            session.setAttribute("ruzhu",ruzhu);
            req.getRequestDispatcher("/mu/ViewHotelFitRequireInterface.jsp").forward(req,resp);
        }else if(methods.equals("updateRoomInfo")){
            HotelInfoDaoImpl hotelImpl = new HotelInfoDaoImpl();
            String hotelIdStr = req.getParameter("hotelId");
            String userIdStr = req.getParameter("userId");
            int hotelId = Integer.parseInt(hotelIdStr);
            int userId = Integer.parseInt(userIdStr);
            String ruzhu = req.getParameter("ruzhu");
            String likai = req.getParameter("likai");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
            java.util.Date ruzhuDate = new java.util.Date();
            try {
                ruzhuDate = simpleDateFormat.parse(ruzhu);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            java.util.Date likaiDate = new java.util.Date();
            try {
                likaiDate = simpleDateFormat.parse(ruzhu);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            HotelInfoDaoImpl impl = new HotelInfoDaoImpl();
            //获得  酒店 信息
            HotelInfo hotelInfo = impl.queryOneHotel(hotelId);
            //获得  酒店 图片
            List<String> hotelPicture = impl.queryHotelInPicture(hotelId);
            List<RoomInfo> roomList = new ArrayList<RoomInfo>();
            HttpSession hs = req.getSession();
            if(ruzhu.equals("") && likai.equals("")){  //用户没输入日期
                roomList = impl.queryAllRoomByHotelId(hotelId);
            }else{//用户输入日期
                roomList = impl.queryOneHotelofRoomByHotelId(hotelId,ruzhuDate,likaiDate);
            }
            List<Integer> roomNumList = impl.queryRoomNumByHotelId(hotelId,ruzhuDate,likaiDate);
            //System.out.println("hotelId:"+hotelId);
            //System.out.println("overPicture:"+overPictureInt);

            hs.setAttribute("hotelPicture",hotelPicture);
            hs.setAttribute("userId",userId);
            hs.setAttribute("ruzhu",ruzhu);
            hs.setAttribute("likai",likai);
            hs.setAttribute("hotelInfo",hotelInfo);
            hs.setAttribute("roomList",roomList);
            hs.setAttribute("roomNumList",roomNumList);
            //hs.setAttribute("");
            req.getRequestDispatcher("/mu/ViewHotelInfoInterface.jsp").forward(req,resp);
        }
    }

    private String JudgeMethods(String userInput){
        /*地点 酒店 景点 三类*/
        locateList = queryLocation(userInput);
        /*穆正阳使用周天乐部分*/
        //scenicList = queryScenicInfoBySearch(userInput);
    return "";
    }
    /*用户输入查询地点*/
    private List<LocateInfo> queryLocation(String userInput){
        LocationInfoServiceImpl locateImpl = new LocationInfoServiceImpl();
        List<LocateInfo> locate;
        locate = locateImpl.queryLocation(userInput);
        return locate;
    }
}


