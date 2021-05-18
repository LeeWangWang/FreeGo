package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 20:20
 * @Description: 设备信息实体类
 */
public class FacilitiesInfo {
    private int facilitiesId;       //设备id
    private String facilitiesName;  //设备名称

    public FacilitiesInfo() {
    }

    public FacilitiesInfo(String facilitiesName) {
        this.facilitiesName = facilitiesName;
    }

    public int getFacilitiesId() {
        return facilitiesId;
    }

    public void setFacilitiesId(int facilitiesId) {
        this.facilitiesId = facilitiesId;
    }

    public String getFacilitiesName() {
        return facilitiesName;
    }

    public void setFacilitiesName(String facilitiesName) {
        this.facilitiesName = facilitiesName;
    }

    @Override
    public String toString() {
        return "设备信息{" +
                "设备id=" + facilitiesId +
                ", 设备名称='" + facilitiesName + '\'' +
                '}';
    }
}
