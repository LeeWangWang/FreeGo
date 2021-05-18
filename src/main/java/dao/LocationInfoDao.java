package dao;



import domain.LocateInfo;

import java.util.List;

public interface LocationInfoDao {
    /**
     * 穆正阳
     * 用来查询用户输入地点的信息
     * @param userInput
     * @return
     */
    public List<LocateInfo> queryLocation(String userInput);
}
