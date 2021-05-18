package dao.impl;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/18 13:52<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

import dao.LocationInfoDao;
import domain.LocateInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.List;

/**
 * ClassName: LocationDao <br/>
 * Description: <br/>
 * date: 2021/4/18 13:52<br/>
 * @author hp<br />
 */
public class LocationDaoImpl implements LocationInfoDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<LocateInfo> queryLocation(String userInput) {
        List<LocateInfo> locateList = null;
        System.out.println("用户输入为"+userInput);
        try {
            //1.定义sql语句
            String sql = "select * from locate where locateName like ?";
            //2.执行
            locateList = template.query(sql, new BeanPropertyRowMapper<LocateInfo>(LocateInfo.class), "%"+userInput+"%");
        } catch (Exception e){
            System.out.println("捕获错误");
        }
        if (locateList.size() != 0){
            return locateList;
        }else{
            System.out.println("queryLocation读取失败");
            //System.out.println(locate.getIntroduce());
        }
        //return false;
        return null;
    }
    public static void main(String[] args){
        LocationDaoImpl ss = new LocationDaoImpl();
        ss.queryLocation("深圳");
    }
}
