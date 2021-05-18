package domain;

import java.util.ArrayList;
import java.util.List;

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
    private String country;         //国家
    private String province;        //省
    private String downtown;        //市
    private String county;          //县/区
    private float lng;              //经度
    private float lat;              //维度
    private float overallScore;     //酒店评分
    private String openTime;        //建成时间
    private String fitmentTime;     //翻修时间
    private String brand;           //酒店品牌
    private int level;              //酒店星级
    private int hot;                //酒店热度
    private String sketch;          //酒店描述
    private Boolean flag;           //酒店状态(是否删除)
    private String overPicture;    //封面路径

    public HotelInfo() {}

    public HotelInfo(int hotelId, String hotelName, String hotelAddress, String hotelTele, String country,
                     String province, String downtown, String county, float lng, float lat, float overallScore,
                     String openTime, String fitmentTime, String brand, int level, int hot, String sketch, Boolean flag,
                     String overPicture){
        this.hotelId = hotelId;
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
        this.overPicture = overPicture;
    }

    public String getOverPicture() {
        return overPicture;
    }

    public void setOverPicture(String overPicture) {
        this.overPicture = overPicture;
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

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getFitmentTime() {
        return fitmentTime;
    }

    public void setFitmentTime(String fitmentTime) {
        this.fitmentTime = fitmentTime;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
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
        return "HotelInfo{" +
                "hotelId=" + hotelId +
                ", hotelName='" + hotelName + '\'' +
                ", hotelAddress='" + hotelAddress + '\'' +
                ", hotelTele='" + hotelTele + '\'' +
                ", country='" + country + '\'' +
                ", province='" + province + '\'' +
                ", downtown='" + downtown + '\'' +
                ", county='" + county + '\'' +
                ", lng=" + lng +
                ", lat=" + lat +
                ", overallScore=" + overallScore +
                ", openTime='" + openTime + '\'' +
                ", fitmentTime='" + fitmentTime + '\'' +
                ", brand='" + brand + '\'' +
                ", level=" + level +
                ", hot=" + hot +
                ", sketch='" + sketch + '\'' +
                ", flag=" + flag +
                ", overPicture='" + overPicture + '\'' +
                '}';
    }


    public static List<String> queryCountyList(List<HotelInfo> hotelList) {
        List<String> countyList = new ArrayList<String>();
        if(hotelList.size() != 0){
            if(hotelList.size() == 1){
                 countyList.add(hotelList.get(0).getCounty());
                 return countyList;
            }else{
                for(int i = 0;i < hotelList.size();i++){
                    if(!countyList.contains(hotelList.get(i).getCounty())){
                        countyList.add(hotelList.get(i).getCounty());
                    }
                }
                return countyList;
            }
        }else{
            return countyList;
        }
    }
}