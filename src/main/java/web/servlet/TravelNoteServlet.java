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
import javax.servlet.http.HttpSession;
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
     * 获取地址
     */
    public void getLocate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locate = "{\"data\":[{\"id\":1,\"title\":\"北京市\"},{\"id\":2,\"title\":\"天津市\"},{\"id\":3,\"title\":\"石家庄市\"},{\"id\":4,\"title\":\"唐山市\"},{\"id\":5,\"title\":\"秦皇岛市\"},{\"id\":6,\"title\":\"邯郸市\"},{\"id\":7,\"title\":\"邢台市\"},{\"id\":8,\"title\":\"保定市\"},{\"id\":9,\"title\":\"张家口市\"},{\"id\":10,\"title\":\"承德市\"},{\"id\":11,\"title\":\"沧州市\"},{\"id\":12,\"title\":\"廊坊市\"},{\"id\":13,\"title\":\"衡水市\"},{\"id\":14,\"title\":\"太原市\"},{\"id\":15,\"title\":\"大同市\"},{\"id\":16,\"title\":\"阳泉市\"},{\"id\":17,\"title\":\"长治市\"},{\"id\":18,\"title\":\"晋城市\"},{\"id\":19,\"title\":\"朔州市\"},{\"id\":20,\"title\":\"晋中市\"},{\"id\":21,\"title\":\"运城市\"},{\"id\":22,\"title\":\"忻州市\"},{\"id\":23,\"title\":\"临汾市\"},{\"id\":24,\"title\":\"吕梁市\"},{\"id\":25,\"title\":\"呼和浩特市\"},{\"id\":26,\"title\":\"包头市\"},{\"id\":28,\"title\":\"乌海市\"},{\"id\":29,\"title\":\"赤峰市\"},{\"id\":31,\"title\":\"通辽市\"},{\"id\":32,\"title\":\"鄂尔多斯市\"},{\"id\":33,\"title\":\"呼伦贝尔市\"},{\"id\":34,\"title\":\"巴彦淖尔市\"},{\"id\":35,\"title\":\"兴安盟\"},{\"id\":36,\"title\":\"锡林郭勒盟\"},{\"id\":37,\"title\":\"阿拉善盟\"},{\"id\":38,\"title\":\"沈阳市\"},{\"id\":39,\"title\":\"大连市\"},{\"id\":40,\"title\":\"鞍山市\"},{\"id\":41,\"title\":\"抚顺市\"},{\"id\":42,\"title\":\"本溪市\"},{\"id\":43,\"title\":\"丹东市\"},{\"id\":44,\"title\":\"锦州市\"},{\"id\":45,\"title\":\"营口市\"},{\"id\":46,\"title\":\"阜新市\"},{\"id\":47,\"title\":\"辽阳市\"},{\"id\":48,\"title\":\"盘锦市\"},{\"id\":49,\"title\":\"铁岭市\"},{\"id\":50,\"title\":\"朝阳市\"},{\"id\":51,\"title\":\"葫芦岛市\"},{\"id\":52,\"title\":\"长春市\"},{\"id\":53,\"title\":\"吉林市\"},{\"id\":54,\"title\":\"四平市\"},{\"id\":55,\"title\":\"辽源市\"},{\"id\":56,\"title\":\"通化市\"},{\"id\":57,\"title\":\"白山市\"},{\"id\":58,\"title\":\"松原市\"},{\"id\":59,\"title\":\"白城市\"},{\"id\":60,\"title\":\"延边朝鲜族自治州\"},{\"id\":61,\"title\":\"哈尔滨市\"},{\"id\":62,\"title\":\"齐齐哈尔市\"},{\"id\":63,\"title\":\"鸡西市\"},{\"id\":64,\"title\":\"鹤岗市\"},{\"id\":65,\"title\":\"双鸭山市\"},{\"id\":66,\"title\":\"大庆市\"},{\"id\":67,\"title\":\"伊春市\"},{\"id\":68,\"title\":\"佳木斯市\"},{\"id\":69,\"title\":\"七台河市\"},{\"id\":70,\"title\":\"牡丹江市\"},{\"id\":71,\"title\":\"黑河市\"},{\"id\":72,\"title\":\"绥化市\"},{\"id\":73,\"title\":\"大兴安岭地区\"},{\"id\":74,\"title\":\"上海市\"},{\"id\":75,\"title\":\"南京市\"},{\"id\":76,\"title\":\"无锡市\"},{\"id\":77,\"title\":\"徐州市\"},{\"id\":78,\"title\":\"苏州市\"},{\"id\":79,\"title\":\"南通市\"},{\"id\":80,\"title\":\"连云港市\"},{\"id\":81,\"title\":\"淮安市\"},{\"id\":82,\"title\":\"盐城市\"},{\"id\":83,\"title\":\"扬州市\"},{\"id\":84,\"title\":\"镇江市\"},{\"id\":85,\"title\":\"泰州市\"},{\"id\":86,\"title\":\"宿迁市\"},{\"id\":87,\"title\":\"杭州市\"},{\"id\":88,\"title\":\"宁波市\"},{\"id\":89,\"title\":\"温州市\"},{\"id\":90,\"title\":\"嘉兴市\"},{\"id\":91,\"title\":\"湖州市\"},{\"id\":92,\"title\":\"绍兴市\"},{\"id\":93,\"title\":\"金华市\"},{\"id\":94,\"title\":\"衢州市\"},{\"id\":95,\"title\":\"舟山市\"},{\"id\":96,\"title\":\"台州市\"},{\"id\":97,\"title\":\"丽水市\"},{\"id\":98,\"title\":\"合肥市\"},{\"id\":99,\"title\":\"芜湖市\"},{\"id\":100,\"title\":\"蚌埠市\"},{\"id\":101,\"title\":\"淮南市\"},{\"id\":102,\"title\":\"马鞍山市\"},{\"id\":103,\"title\":\"淮北市\"},{\"id\":104,\"title\":\"铜陵市\"},{\"id\":105,\"title\":\"安庆市\"},{\"id\":106,\"title\":\"黄山市\"},{\"id\":107,\"title\":\"滁州市\"},{\"id\":108,\"title\":\"阜阳市\"},{\"id\":109,\"title\":\"宿州市\"},{\"id\":110,\"title\":\"六安市\"},{\"id\":111,\"title\":\"亳州市\"},{\"id\":112,\"title\":\"池州市\"},{\"id\":113,\"title\":\"宣城市\"},{\"id\":114,\"title\":\"福州市\"},{\"id\":115,\"title\":\"厦门市\"},{\"id\":116,\"title\":\"莆田市\"},{\"id\":117,\"title\":\"三明市\"},{\"id\":118,\"title\":\"泉州市\"},{\"id\":119,\"title\":\"漳州市\"},{\"id\":120,\"title\":\"南平市\"},{\"id\":121,\"title\":\"龙岩市\"},{\"id\":122,\"title\":\"宁德市\"},{\"id\":123,\"title\":\"南昌市\"},{\"id\":124,\"title\":\"景德镇市\"},{\"id\":125,\"title\":\"萍乡市\"},{\"id\":126,\"title\":\"九江市\"},{\"id\":127,\"title\":\"鹰潭市\"},{\"id\":128,\"title\":\"赣州市\"},{\"id\":129,\"title\":\"吉安市\"},{\"id\":130,\"title\":\"宜春市\"},{\"id\":131,\"title\":\"抚州市\"},{\"id\":132,\"title\":\"上饶市\"},{\"id\":133,\"title\":\"济南市\"},{\"id\":134,\"title\":\"青岛市\"},{\"id\":135,\"title\":\"淄博市\"},{\"id\":136,\"title\":\"枣庄市\"},{\"id\":137,\"title\":\"东营市\"},{\"id\":138,\"title\":\"烟台市\"},{\"id\":139,\"title\":\"潍坊市\"},{\"id\":140,\"title\":\"济宁市\"},{\"id\":141,\"title\":\"泰安市\"},{\"id\":142,\"title\":\"威海市\"},{\"id\":143,\"title\":\"日照市\"},{\"id\":144,\"title\":\"临沂市\"},{\"id\":145,\"title\":\"德州市\"},{\"id\":146,\"title\":\"聊城市\"},{\"id\":147,\"title\":\"滨州市\"},{\"id\":148,\"title\":\"菏泽市\"},{\"id\":149,\"title\":\"郑州市\"},{\"id\":150,\"title\":\"开封市\"},{\"id\":151,\"title\":\"洛阳市\"},{\"id\":152,\"title\":\"平顶山市\"},{\"id\":153,\"title\":\"安阳市\"},{\"id\":154,\"title\":\"鹤壁市\"},{\"id\":155,\"title\":\"新乡市\"},{\"id\":156,\"title\":\"焦作市\"},{\"id\":157,\"title\":\"濮阳市\"},{\"id\":158,\"title\":\"许昌市\"},{\"id\":159,\"title\":\"漯河市\"},{\"id\":160,\"title\":\"三门峡市\"},{\"id\":161,\"title\":\"南阳市\"},{\"id\":162,\"title\":\"商丘市\"},{\"id\":163,\"title\":\"信阳市\"},{\"id\":164,\"title\":\"周口市\"},{\"id\":165,\"title\":\"驻马店市\"},{\"id\":166,\"title\":\"省直辖县级行政区划\"},{\"id\":167,\"title\":\"武汉市\"},{\"id\":168,\"title\":\"黄石市\"},{\"id\":169,\"title\":\"十堰市\"},{\"id\":170,\"title\":\"宜昌市\"},{\"id\":171,\"title\":\"襄阳市\"},{\"id\":172,\"title\":\"鄂州市\"},{\"id\":173,\"title\":\"荆门市\"},{\"id\":174,\"title\":\"孝感市\"},{\"id\":175,\"title\":\"荆州市\"},{\"id\":176,\"title\":\"黄冈市\"},{\"id\":177,\"title\":\"咸宁市\"},{\"id\":178,\"title\":\"随州市\"},{\"id\":179,\"title\":\"恩施土家族苗族自治州\"},{\"id\":180,\"title\":\"省直辖县级行政区划\"},{\"id\":181,\"title\":\"长沙市\"},{\"id\":182,\"title\":\"株洲市\"},{\"id\":183,\"title\":\"湘潭市\"},{\"id\":184,\"title\":\"衡阳市\"},{\"id\":185,\"title\":\"邵阳市\"},{\"id\":186,\"title\":\"岳阳市\"},{\"id\":187,\"title\":\"常德市\"},{\"id\":188,\"title\":\"张家界市\"},{\"id\":189,\"title\":\"益阳市\"},{\"id\":190,\"title\":\"郴州市\"},{\"id\":191,\"title\":\"永州市\"},{\"id\":192,\"title\":\"怀化市\"},{\"id\":193,\"title\":\"娄底市\"},{\"id\":194,\"title\":\"湘西土家族苗族自治州\"},{\"id\":195,\"title\":\"广州市\"},{\"id\":196,\"title\":\"韶关市\"},{\"id\":197,\"title\":\"深圳市\"},{\"id\":198,\"title\":\"珠海市\"},{\"id\":199,\"title\":\"汕头市\"},{\"id\":200,\"title\":\"佛山市\"},{\"id\":201,\"title\":\"江门市\"},{\"id\":202,\"title\":\"湛江市\"},{\"id\":203,\"title\":\"茂名市\"},{\"id\":204,\"title\":\"肇庆市\"},{\"id\":205,\"title\":\"惠州市\"},{\"id\":206,\"title\":\"梅州市\"},{\"id\":207,\"title\":\"汕尾市\"},{\"id\":208,\"title\":\"河源市\"},{\"id\":209,\"title\":\"阳江市\"},{\"id\":210,\"title\":\"清远市\"},{\"id\":211,\"title\":\"东莞市\"},{\"id\":212,\"title\":\"中山市\"},{\"id\":213,\"title\":\"潮州市\"},{\"id\":214,\"title\":\"云浮市\"},{\"id\":215,\"title\":\"南宁市\"},{\"id\":216,\"title\":\"柳州市\"},{\"id\":217,\"title\":\"桂林市\"},{\"id\":218,\"title\":\"梧州市\"},{\"id\":219,\"title\":\"北海市\"},{\"id\":220,\"title\":\"防城港市\"},{\"id\":221,\"title\":\"钦州市\"},{\"id\":222,\"title\":\"贵港市\"},{\"id\":223,\"title\":\"玉林市\"},{\"id\":224,\"title\":\"百色市\"},{\"id\":225,\"title\":\"贺州市\"},{\"id\":226,\"title\":\"河池市\"},{\"id\":227,\"title\":\"来宾市\"},{\"id\":228,\"title\":\"崇左市\"},{\"id\":229,\"title\":\"海口市\"},{\"id\":230,\"title\":\"三亚市\"},{\"id\":231,\"title\":\"三沙市\"},{\"id\":232,\"title\":\"儋州市\"},{\"id\":233,\"title\":\"海南省\"},{\"id\":234,\"title\":\"重庆市\"},{\"id\":235,\"title\":\"成都市\"},{\"id\":236,\"title\":\"自贡市\"},{\"id\":237,\"title\":\"攀枝花市\"},{\"id\":238,\"title\":\"泸州市\"},{\"id\":239,\"title\":\"德阳市\"},{\"id\":240,\"title\":\"广元市\"},{\"id\":241,\"title\":\"遂宁市\"},{\"id\":242,\"title\":\"内江市\"},{\"id\":243,\"title\":\"乐山市\"},{\"id\":244,\"title\":\"南充市\"},{\"id\":245,\"title\":\"眉山市\"},{\"id\":246,\"title\":\"宜宾市\"},{\"id\":247,\"title\":\"广安市\"},{\"id\":248,\"title\":\"达州市\"},{\"id\":249,\"title\":\"雅安市\"},{\"id\":250,\"title\":\"巴中市\"},{\"id\":251,\"title\":\"资阳市\"},{\"id\":252,\"title\":\"阿坝藏族羌族自治州\"},{\"id\":253,\"title\":\"甘孜藏族自治州\"},{\"id\":254,\"title\":\"凉山彝族自治州\"},{\"id\":255,\"title\":\"贵阳市\"},{\"id\":256,\"title\":\"六盘水市\"},{\"id\":257,\"title\":\"遵义市\"},{\"id\":258,\"title\":\"安顺市\"},{\"id\":259,\"title\":\"毕节市\"},{\"id\":260,\"title\":\"铜仁市\"},{\"id\":261,\"title\":\"黔西南布依族苗族自治州\"},{\"id\":262,\"title\":\"黔东南苗族侗族自治州\"},{\"id\":263,\"title\":\"黔南布依族苗族自治州\"},{\"id\":264,\"title\":\"昆明市\"},{\"id\":265,\"title\":\"曲靖市\"},{\"id\":266,\"title\":\"玉溪市\"},{\"id\":267,\"title\":\"保山市\"},{\"id\":268,\"title\":\"昭通市\"},{\"id\":269,\"title\":\"丽江市\"},{\"id\":270,\"title\":\"普洱市\"},{\"id\":271,\"title\":\"临沧市\"},{\"id\":272,\"title\":\"楚雄彝族自治州\"},{\"id\":273,\"title\":\"红河哈尼族彝族自治州\"},{\"id\":274,\"title\":\"文山壮族苗族自治州\"},{\"id\":275,\"title\":\"西双版纳傣族自治州\"},{\"id\":276,\"title\":\"大理白族自治州\"},{\"id\":277,\"title\":\"德宏傣族景颇族自治州\"},{\"id\":278,\"title\":\"迪庆藏族自治州\"},{\"id\":279,\"title\":\"拉萨市\"},{\"id\":280,\"title\":\"日喀则市\"},{\"id\":281,\"title\":\"昌都市\"},{\"id\":282,\"title\":\"林芝市\"},{\"id\":283,\"title\":\"山南市\"},{\"id\":284,\"title\":\"那曲市\"},{\"id\":285,\"title\":\"阿里地区\"},{\"id\":286,\"title\":\"西安市\"},{\"id\":287,\"title\":\"铜川市\"},{\"id\":288,\"title\":\"宝鸡市\"},{\"id\":289,\"title\":\"咸阳市\"},{\"id\":290,\"title\":\"渭南市\"},{\"id\":291,\"title\":\"延安市\"},{\"id\":292,\"title\":\"汉中市\"},{\"id\":293,\"title\":\"榆林市\"},{\"id\":294,\"title\":\"安康市\"},{\"id\":295,\"title\":\"商洛市\"},{\"id\":296,\"title\":\"兰州市\"},{\"id\":297,\"title\":\"嘉峪关市\"},{\"id\":298,\"title\":\"金昌市\"},{\"id\":299,\"title\":\"白银市\"},{\"id\":300,\"title\":\"天水市\"},{\"id\":301,\"title\":\"武威市\"},{\"id\":302,\"title\":\"张掖市\"},{\"id\":303,\"title\":\"平凉市\"},{\"id\":304,\"title\":\"酒泉市\"},{\"id\":305,\"title\":\"庆阳市\"},{\"id\":306,\"title\":\"定西市\"},{\"id\":309,\"title\":\"陇南市\"},{\"id\":310,\"title\":\"临夏回族自治州\"},{\"id\":311,\"title\":\"甘南藏族自治州\"},{\"id\":312,\"title\":\"西宁市\"},{\"id\":313,\"title\":\"海东市\"},{\"id\":314,\"title\":\"海北藏族自治州\"},{\"id\":315,\"title\":\"黄南藏族自治州\"},{\"id\":316,\"title\":\"海南藏族自治州\"},{\"id\":317,\"title\":\"果洛藏族自治州\"},{\"id\":318,\"title\":\"玉树藏族自治州\"},{\"id\":319,\"title\":\"海西蒙古族藏族自治州\"},{\"id\":320,\"title\":\"银川市\"},{\"id\":321,\"title\":\"石嘴山市\"},{\"id\":322,\"title\":\"吴忠市\"},{\"id\":323,\"title\":\"固原市\"},{\"id\":324,\"title\":\"中卫市\"},{\"id\":325,\"title\":\"乌鲁木齐市\"},{\"id\":326,\"title\":\"克拉玛依市\"},{\"id\":327,\"title\":\"吐鲁番市\"},{\"id\":328,\"title\":\"哈密市\"},{\"id\":329,\"title\":\"昌吉回族自治州\"},{\"id\":330,\"title\":\"博尔塔拉蒙古自治州\"},{\"id\":331,\"title\":\"巴音郭楞蒙古自治州\"},{\"id\":332,\"title\":\"阿克苏地区\"},{\"id\":333,\"title\":\"克孜勒苏柯尔克孜自治州\"},{\"id\":334,\"title\":\"喀什地区\"},{\"id\":335,\"title\":\"和田地区\"},{\"id\":336,\"title\":\"伊犁哈萨克自治州\"},{\"id\":337,\"title\":\"塔城地区\"},{\"id\":338,\"title\":\"阿勒泰地区\"},{\"id\":339,\"title\":\"自治区直辖县级行政区划\"},{\"id\":340,\"title\":\"石河子市\"},{\"id\":341,\"title\":\"阿拉尔市\"},{\"id\":342,\"title\":\"图木舒克市\"},{\"id\":343,\"title\":\"五家渠市\"},{\"id\":344,\"title\":\"铁门关市\"},{\"id\":350,\"title\":\"西藏\"},{\"id\":500,\"title\":\"捷克\"},{\"id\":501,\"title\":\"西双版纳\"}]}";
        //2.将TravelNote对象集合序列化为json，返回
        HttpSession session = request.getSession();
        session.setAttribute("locate",locate);
        writeValue(locate, response);
    }

    /**
     * 上传图片
     */
    /*public void uploadFile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //上传文件处理内容
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
    }*/

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
