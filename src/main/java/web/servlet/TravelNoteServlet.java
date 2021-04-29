package web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import domain.TravelNoteInfo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.TravelNoteInfoService;
import service.impl.TravelNoteInfoServiceImpl;
import utils.UuidUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
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

    /**
     * 上传图片
     */
    public void uploadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
                System.out.println(request.getContextPath());
                // File f = new File(getServletContext().getRealPath("upload"));
                File f = new File("D://freegoImg/li/travelnote");
                // File f = new File("D://IntelliJ IDEA 2019.2/Project/FreeGo/src/main/webapp/images/li/travelnote");
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
        System.out.println("D://freegoImg/li/travelnote/"+filename);
        writeValue(filename, response);
    }

    /**
     * 游记推荐
     */
    public void recommendTravelNoteInfoNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.调用service查询TravelNote对象集合
        String userId = request.getParameter("userId");
        List<TravelNoteInfo> list = noteInfoService.recommendTravelNoteInfoNote(userId);
        System.out.println("游记推荐");
        for (TravelNoteInfo noteInfo : list) {
            noteInfo.toString();
        }
        //2.将TravelNote对象集合序列化为json，返回
        writeValue(list, response);
    }
}
