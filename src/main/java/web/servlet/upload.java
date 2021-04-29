package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/28 16:25
 * @Description:
 */
@WebServlet("/uploadPhoto")
public class upload extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
    }

    @Override
    @SuppressWarnings("rawtypes")
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

    }
}
