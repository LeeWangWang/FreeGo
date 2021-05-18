package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:07
 * @Description: 位置信息实体类
 */
public class LocateInfo {
    private int locateId;                   //位置id
    private String locateName;              //位置名称
    private float lng;                      //经度
    private float lag;                      //纬度
    private String introduce;               //介绍
    public LocateInfo() {
    }
    public LocateInfo(int locateId, String locateName, float lng, float lag, String introduce) {
        this.locateId = locateId;
        this.locateName = locateName;
        this.lng = lng;
        this.lag = lag;
        this.introduce = introduce;
    }

    public int getLocateId() {
        return locateId;
    }

    public void setLocateId(int locateId) {
        this.locateId = locateId;
    }

    public String getLocateName() {
        return locateName;
    }

    public void setLocateName(String locateName) {
        this.locateName = locateName;
    }

    public float getLng() {
        return lng;
    }

    public void setLng(float lng) {
        this.lng = lng;
    }

    public float getLag() {
        return lag;
    }

    public void setLag(float lag) {
        this.lag = lag;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Override
    public String toString() {
        return "LocateInfo{" +
                "locateId=" + locateId +
                ", locateName='" + locateName + '\'' +
                ", lng=" + lng +
                ", lag=" + lag +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
