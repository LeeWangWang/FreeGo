package service.impl;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/18 16:51<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

import dao.impl.LocationDaoImpl;
import domain.LocateInfo;
import service.LocationInfoService;

import java.util.List;

/**
 * ClassName: LocationInfoServiceImpl <br/>
 * Description: <br/>
 * date: 2021/4/18 16:51<br/>
 * @author hp
 */
public class LocationInfoServiceImpl implements LocationInfoService {
    @Override
    public List<LocateInfo> queryLocation(String userInput) {
        LocationDaoImpl locateImpl = new LocationDaoImpl();
        List<LocateInfo> locate;
        locate = locateImpl.queryLocation(userInput);
        return locate;
    }
}
