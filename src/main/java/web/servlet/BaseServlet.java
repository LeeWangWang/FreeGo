package web.servlet;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import domain.ResultInfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/11 19:48
 * @Description: 父类Servlet，提供别人继承
 */
public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //完成方法的分发
        //1.获取请求路径
        String requestURI = req.getRequestURI();
        //2.获取方法名称
        String methodName = requestURI.substring(requestURI.lastIndexOf('/') + 1);
        System.out.println("请求URI: " + requestURI);
        //3.获取方法对象的method，谁调用我?我代表谁
        try {
            //4.获取执行方法，暴力反射
            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, req, resp);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * 直接将传入的对象序列化为Json，并且写回客户端
     */
    public void writeValue(Object object, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(), object);
    }

    /**
     * 将传入的对象序列化为Json，并且返回给调用者
     */
    public String writeValueAsString(Object object) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(object);
    }

    public void getWriterWrite(Object object, HttpServletResponse response) throws IOException {
        //将info对象序列化为json
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(object);
        //将json数据写回客户端，设置content-type
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    /**
     * 校验验证码，从客户端提交过来
     */
    public boolean checkCodeIsError(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String check = request.getParameter("check");

        System.out.println("BaseServlet---check1:" + check);

        //从session中获取验证码
        HttpSession session = request.getSession();
        String chechCode_Server = (String) session.getAttribute("CHECKCODE_SERVER");

        System.out.println("BaseServlet---check2:" + chechCode_Server);

        //保护验证码唯一性
        session.removeAttribute("CHECKCODE_SERVER");
        //比较（为空、不一致）
        if (chechCode_Server == null || !chechCode_Server.equalsIgnoreCase(check)) {
            //验证码错误
            ResultInfo info = new ResultInfo();
            info.setFlag(false);
            info.setErrorMsg("验证码错误");

            System.out.println("BaseServlet:验证码错误");

            //将info序列化为json，将json数据写回客户端
            writeValue(info, response);
            return false;
        }
        System.out.println("BaseServlet:验证码正确");
        return true;
    }
}
