package web.servlet;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/20 14:52<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

import dao.impl.DateCalculator;
import dao.impl.HotelInfoDaoImpl;
import domain.HotelInfo;
import domain.LocateInfo;
import domain.RoomInfo;
import service.impl.HotelInfoServiceImpl;

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
import java.util.Date;
import java.util.List;
import java.util.Map;

import static dao.impl.QueryLike.queryLike;

/**
 * ClassName: HotelServlet <br/>
 * Description: <br/>
 * date: 2021/4/20 14:52<br/>
 * @author hp<br />
 */
@WebServlet("/HotelServlet")
public class HotelServlet extends HttpServlet {
    private String methods;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        methods = request.getParameter("methods");

        /*从查询酒店 过来的*/
        if(methods.equals("queryLocation")){
            HttpSession hs = request.getSession();
            List<LocateInfo> locateList= (List<LocateInfo>) hs.getAttribute("locateList");
            //System.out.println("hotelServlet："+locateList.get(0).toString());
        }else if(methods.equals("toHotel")) {
            String userId = request.getParameter("userId");
            Map<String, List<HotelInfo>> returnMap = queryLike(Integer.parseInt(userId));
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            session.setAttribute("returnMap", returnMap);
            request.getRequestDispatcher("/mu/ViewHotelMainInterface.jsp").forward(request, response);
        }else if(methods.equals("updateRoomInfo")){
            HotelInfoDaoImpl hotelImpl = new HotelInfoDaoImpl();
            String hotelIdStr = request.getParameter("hotelId");
            String userIdStr = request.getParameter("userId");
            //String overPicture = req.getParameter("overPicture");
            int hotelId = Integer.parseInt(hotelIdStr);
            int userId = Integer.parseInt(userIdStr);
            String ruzhu = request.getParameter("ruzhu");
            String likai = request.getParameter("likai");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
            Date ruzhuDate = new Date();
            try {
                ruzhuDate = simpleDateFormat.parse(ruzhu);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Date likaiDate = new Date();
            try {
                likaiDate = simpleDateFormat.parse(ruzhu);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            HotelInfo hotel = hotelImpl.queryOneHotel(hotelId);
            HotelInfoDaoImpl impl = new HotelInfoDaoImpl();
            //获得  酒店 信息
            HotelInfo hotelInfo = impl.queryOneHotel(hotelId);
            //获得  酒店 图片
            List<String> hotelPicture = impl.queryHotelInPicture(hotelId);
            List<RoomInfo> roomList = new ArrayList<RoomInfo>();
            HttpSession hs = request.getSession();
            System.out.println("ruzhuDate"+ruzhuDate.toString());

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
            request.getRequestDispatcher("/mu/ViewHotelInfoInterface.jsp").forward(request,response);
        }else if(methods.equals("ReserveHotel")){
            int userId = Integer.parseInt(request.getParameter("userId"));
            int hotelId = Integer.parseInt(request.getParameter("hotelId"));
            String moveIntoTime = request.getParameter("moveIntoTime");
            String departureTime = request.getParameter("departureTime");
            int peopleNum = Integer.parseInt(request.getParameter("people"));
            List<String> peopleList = new ArrayList<String>();
            String fapiaoUse = request.getParameter("fapiaoUse");
            String fapiaoTime = request.getParameter("fapiaoTime");
            String roomId = request.getParameter("roomId");

            //System.out.println("发票是否使用："+fapiaoUse);
            //System.out.println("发票是否使用："+fapiaoTime);
            for(int i = 0;i < peopleNum;i++){
                String one = request.getParameter("xing"+i);
                String two = request.getParameter("ming" + i);
                peopleList.add(one+two);
                //System.out.println(peopleList.get(i));
            }

            String xingming = request.getParameter("xingming");
            String shouji = request.getParameter("shouji");
            String youxiang = request.getParameter("youxiang");
            String daodianshijian = request.getParameter("daodianshijian");
            String teshuyaoqiu = request.getParameter("teshuyaoqiu");
            String leixing = request.getParameter("leixing");
            String taitou = "";
            String nasuirenshibiehao = "";
            String isNotTime = "";
            if(fapiaoUse != null){
                 leixing = request.getParameter("leixing");
                 taitou = request.getParameter("taitou");
                 nasuirenshibiehao = request.getParameter("nasuirenshibiehao");
                 isNotTime = request.getParameter("isNotTime");
                 if(isNotTime == null){
                     isNotTime = "false";
                 }
            }else{
                 leixing = "";
                 taitou = "";
                 nasuirenshibiehao = "";
                 isNotTime = "";
            }
            //System.out.println();

            /*System.out.println("userId:"+userId+" hotelId:"+hotelId+" 进入时间："+moveIntoTime+" 离开时间"+departureTime+" 姓名"+xingming+" 手机"+shouji+" 邮箱"+youxiang+" "+daodianshijian
                    +" 特殊要求"+teshuyaoqiu+" 类型"
                    +leixing+" 抬头"+taitou+" 纳税人编号"+nasuirenshibiehao+" 是否"+isNotTime+" ");*/
            HotelInfoDaoImpl hd = new HotelInfoDaoImpl();
            Boolean pd = hd.saveHotelOrderInfo(userId,hotelId,peopleList,xingming,shouji,youxiang,daodianshijian,teshuyaoqiu,leixing,
                    taitou,nasuirenshibiehao,moveIntoTime,departureTime,isNotTime,Integer.parseInt(roomId));
                HttpSession hs = request.getSession();
                hs.setAttribute("userId",userId);
                request.getRequestDispatcher("/mu/ReserveSuccessInterface.jsp").forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        methods = req.getParameter("methods");
        if(methods.equals("Class")){ //酒店分地区
            String county = req.getParameter("county");
            String ye = req.getParameter("ye");
            String userId = req.getParameter("userId");
            req.setAttribute("userId",userId);
            req.setAttribute("county",county);
            req.setAttribute("ye",ye);
            req.getRequestDispatcher("/mu/ViewHotelFitRequireInterface.jsp").forward(req,resp);
        }else if(methods.equals("toHotel")){
            String userId = req.getParameter("userId");
            Map<String,List<HotelInfo>> returnMap = queryLike(Integer.parseInt(userId));
            HttpSession session = req.getSession();
            session.setAttribute("userId",userId);
            session.setAttribute("returnMap",returnMap);
            req.getRequestDispatcher("/mu/ViewHotelMainInterface.jsp").forward(req,resp);
        }else if(methods.equals("toViewHotel")){
            HotelInfoDaoImpl hotelImpl = new HotelInfoDaoImpl();
            String hotelIdStr = req.getParameter("hotelId");
            String userIdStr = req.getParameter("userId");

            int hotelId = Integer.parseInt(hotelIdStr);
            int userId = Integer.parseInt(userIdStr);
            String ruzhu = req.getParameter("ruzhu");
            String likai = req.getParameter("likai");
            //System.out.println("updateRuzhu:");
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
            Date ruzhuDate = new Date();
            try {
                ruzhuDate = simpleDateFormat.parse(ruzhu);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Date likaiDate = new Date();
            try {
                likaiDate = simpleDateFormat.parse(ruzhu);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            HotelInfo hotel = hotelImpl.queryOneHotel(hotelId);
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

            hs.setAttribute("hotelPicture",hotelPicture);
            hs.setAttribute("userId",userId);
            hs.setAttribute("ruzhu",ruzhu);
            hs.setAttribute("likai",likai);
            hs.setAttribute("hotelInfo",hotelInfo);
            hs.setAttribute("roomList",roomList);
            hs.setAttribute("roomNumList",roomNumList);
            req.getRequestDispatcher("/mu/ViewHotelInfoInterface.jsp").forward(req,resp);
        } else if (methods.equals("toReserveRoom")) {
            int hotelId = Integer.parseInt(req.getParameter("hotelId"));
            int userId = Integer.parseInt(req.getParameter("userId"));
            String hotelName = req.getParameter("hotelName");
            int roomId = Integer.parseInt(req.getParameter("roomId"));
            String roomName = req.getParameter("roomName");
            float roomPrice = Float.parseFloat(req.getParameter("roomPrice"));
            String ruzhu = req.getParameter("ruzhu");
            String likai = req.getParameter("likai");
            int peopleNum = Integer.parseInt(req.getParameter("peopleNum"));
            String address = req.getParameter("address");
            /*向ReserveHotelInterface传数据*/
            String hotelPicture = req.getParameter("hotelPicture");
            List<String> dateList;
            DateCalculator t = new DateCalculator();
            dateList = t.process(ruzhu, likai);
            System.out.println("日期"+dateList.size());
            HttpSession session = req.getSession();
            session.setAttribute("hotelId",hotelId);
            session.setAttribute("hotelName",hotelName);
            session.setAttribute("userId",userId);
            session.setAttribute("roomId",roomId);
            session.setAttribute("roomPrice",roomPrice);
            session.setAttribute("tian",dateList.size());
            session.setAttribute("ruzhu",ruzhu);
            session.setAttribute("likai",likai);
            session.setAttribute("roomName",roomName);
            session.setAttribute("peopleNum",peopleNum);
            session.setAttribute("address",address);
            session.setAttribute("hotelPicture",hotelPicture);
            req.getRequestDispatcher("/mu/ReserveHotelInterface.jsp").forward(req,resp);
        }
    }

    /*查询酒店*/
    List<HotelInfo> queryHotel(String userInput){
        HotelInfoServiceImpl Impl = new HotelInfoServiceImpl();
        List<HotelInfo> hotel;
        hotel = Impl.recommendHotel(userInput);
        return hotel;
    }
}

