package domain;

import java.time.Year;
import java.util.Date;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 20:21
 * @Description: 酒店信息实体类
 */
public class HotelInfo {
    private int hotelId;            //酒店id
    private String hotelName;       //酒店名称
    private String hotelAddress;    //酒店地址
    private String hotelTele;       //酒店电话
    private String hotelPicture;    //酒店图片
    private String country;         //国家
    private String province;        //省
    private String downtown;        //市
    private String county;          //县/区
    private float lng;              //经度
    private float lat;              //维度
    private float overallScore;     //酒店评分
    private Year openTime;          //建成时间
    private Year fitmentTime;       //翻修时间
    private float brand;            //酒店品牌
    private int level;              //酒店星级
    private int hot;                //酒店热度
    private String sketch;          //酒店描述
    private Boolean flag;           //酒店状态(是否删除)

    public HotelInfo() {}

    public HotelInfo(String hotelName, String hotelAddress, String hotelTele, String country, String province,
                     String downtown, String county, float lng, float lat, float overallScore, Year openTime, Year fitmentTime,
                     float brand, int level, int hot, String sketch, Boolean flag) {
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
        this.hotelTele = hotelTele;
        this.country = country;
        this.province = province;
        this.downtown = downtown;
        this.county = county;
        this.lng = lng;
        this.lat = lat;
        this.overallScore = overallScore;
        this.openTime = openTime;
        this.fitmentTime = fitmentTime;
        this.brand = brand;
        this.level = level;
        this.hot = hot;
        this.sketch = sketch;
        this.flag = flag;
    }

    public HotelInfo(String hotelName, String hotelAddress, String hotelTele, String hotelPicture, String country,
                     String province, String downtown, String county, float lng, float lat, float overallScore,
                     Year openTime, Year fitmentTime, float brand, int level, int hot, String sketch, Boolean flag) {
        this.hotelName = hotelName;
        this.hotelAddress = hotelAddress;
        this.hotelTele = hotelTele;
        this.hotelPicture = hotelPicture;
        this.country = country;
        this.province = province;
        this.downtown = downtown;
        this.county = county;
        this.lng = lng;
        this.lat = lat;
        this.overallScore = overallScore;
        this.openTime = openTime;
        this.fitmentTime = fitmentTime;
        this.brand = brand;
        this.level = level;
        this.hot = hot;
        this.sketch = sketch;
        this.flag = flag;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelAddress() {
        return hotelAddress;
    }

    public void setHotelAddress(String hotelAddress) {
        this.hotelAddress = hotelAddress;
    }

    public String getHotelTele() {
        return hotelTele;
    }

    public void setHotelTele(String hotelTele) {
        this.hotelTele = hotelTele;
    }

    public String getHotelPicture() {
        return hotelPicture;
    }

    public void setHotelPicture(String hotelPicture) {
        this.hotelPicture = hotelPicture;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDowntown() {
        return downtown;
    }

    public void setDowntown(String downtown) {
        this.downtown = downtown;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public float getLng() {
        return lng;
    }

    public void setLng(float lng) {
        this.lng = lng;
    }

    public float getLat() {
        return lat;
    }

    public void setLat(float lat) {
        this.lat = lat;
    }

    public float getOverallScore() {
        return overallScore;
    }

    public void setOverallScore(float overallScore) {
        this.overallScore = overallScore;
    }

    public Year getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Year openTime) {
        this.openTime = openTime;
    }

    public Year getFitmentTime() {
        return fitmentTime;
    }

    public void setFitmentTime(Year fitmentTime) {
        this.fitmentTime = fitmentTime;
    }

    public float getBrand() {
        return brand;
    }

    public void setBrand(float brand) {
        this.brand = brand;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getSketch() {
        return sketch;
    }

    public void setSketch(String sketch) {
        this.sketch = sketch;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "酒店信息{" +
                "酒店id=" + hotelId +
                ", 酒店名称='" + hotelName + '\'' +
                ", 酒店地址='" + hotelAddress + '\'' +
                ", 酒店电话='" + hotelTele + '\'' +
                ", 酒店图片='" + hotelPicture + '\'' +
                ", 国家='" + country + '\'' +
                ", 省份='" + province + '\'' +
                ", 城市='" + downtown + '\'' +
                ", 县/区='" + county + '\'' +
                ", 经度=" + lng +
                ", 维度=" + lat +
                ", 酒店评分=" + overallScore +
                ", 建成时间=" + openTime +
                ", 翻修时间=" + fitmentTime +
                ", 酒店品牌=" + brand +
                ", 酒店星级=" + level +
                ", 酒店热度=" + hot +
                ", 酒店描述='" + sketch + '\'' +
                ", 酒店状态(是否删除)=" + flag +
                '}';
    }
}