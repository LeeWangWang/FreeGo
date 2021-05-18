package service;

import domain.LocateInfo;

import java.util.List;

/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/4/18 16:51<br/>
 *
 * @author hp<br />
 * @since JDK 1.8
 */
public interface LocationInfoService {
    public List<LocateInfo> queryLocation(String userInput);
}
