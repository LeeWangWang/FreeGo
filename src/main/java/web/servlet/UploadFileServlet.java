package web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utils.UuidUtil;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/28 15:25
 * @Description:
 */
@WebServlet("/uploadFile")
public class UploadFileServlet extends HttpServlet {

    public String filename = null;

    private final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response){
    }

    @Override
    @SuppressWarnings("rawtypes")
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        /**上传文件处理内容**/
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");  // 处理中文问题
        factory.setSizeThreshold(1024 * 1024);  // 限制文件大小
        List items = null;
        try {
            items = upload.parseRequest(request);   // 解码请求
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator iter = items.iterator();
        while(iter.hasNext()){
            FileItem item = (FileItem) iter.next();
            if(!item.isFormField()){
                // 文件名32位随机字母
                filename = UuidUtil.getUuid() + ".jpeg";
                System.out.println("正确1：" + filename);
                // File f = new File(getServletContext().getRealPath("upload"));
                File f = new File("D://freegoImg/li/travelnote");
                if (!f.exists()) {
                    f.mkdir();
                }
                String imgsrc = f + "/" + filename;
                // 复制文件
                InputStream is = item.getInputStream();
                FileOutputStream fos = new FileOutputStream(imgsrc);
                byte b[] = new byte[1024 * 1024];
                int length = 0;
                while (-1 != (length = is.read(b))) {
                    fos.write(b, 0, length);
                }
                fos.flush();
                fos.close();
            }else {
                System.out.println(item.getFieldName());
                String value = item.getString();
                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                System.out.println(value);
            }
        }
        String result = "{ \"code\": 0 ,\"data\": { \"src\": \"/FreegoImg/li/travelnote/" + filename + "\" } }";
        JSONObject json = JSONObject.fromObject(result);
        System.out.println(json.toString());
        response.setContentType("text/text;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(json);  //返回url地址
        out.flush();
        out.close();
    }
}




