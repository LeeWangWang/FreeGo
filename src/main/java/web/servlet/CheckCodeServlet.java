package web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/11 16:17
 * @Description: 产生4位随机验证码
 */
@WebServlet("/checkCode")
public class CheckCodeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //服务器通知浏览器不要缓存
        resp.setHeader("pragma", "no-cache");
        resp.setHeader("cache-control", "no-cache");
        resp.setHeader("expires", "0");

        //在内存中创建一个长90，宽30的图片，默认黑色背景   参数：长、宽、颜色
        int width = 90;
        int height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

        //获取画笔、设置画笔灰色、填充图片
        Graphics g = image.getGraphics();
        g.setColor(Color.GRAY);
        g.fillRect(0, 0, width, height);

        //产生4个随机验证码，将验证码放入HttpSession中
        String checkCode = getCheckCode();
        req.getSession().setAttribute("CHECKCODE_SERVER", checkCode);

        //设置画笔黄色、设置字体大小、向图片中写入验证码
        g.setColor(Color.YELLOW);
        g.setFont(new Font("黑体", Font.BOLD, 24));
        g.drawString(checkCode, 15, 25);

        //将内存中的图片输出到浏览器，参数：图片对象、图片的格式、图片输出到哪里去
        ImageIO.write(image, "PNG", resp.getOutputStream());
    }

    private String getCheckCode() {
        String base = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        int size = base.length();
        Random random = new Random();
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            //产生0到size-1的随机值，在base字符串中获取下标为index的字符，将c放入到StringBuffer中去
            int index = random.nextInt(size);
            char c = base.charAt(index);
            stringBuffer.append(c);
        }
        return stringBuffer.toString();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
