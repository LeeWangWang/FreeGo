package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 20:30
 * @Description: 酒店评论信息实体类
 */
public class HotelCommentInfo {
    private int commentId;          //评论id
    private int parentId;           //父id
    private int parentCommentId;    //祖宗id
    private int userId;             //用户id
    private int hotelId;            //酒店id
    private String commentWord;     //评论内容
    private int allScore;           //总评分
    private int locateScore;        //位置评分
    private int cleanScore;         //卫生评分
    private int facilitiesScore;    //设备评分
    private int serviceScore;       //服务评分
    private int comfortScore;       //舒适度评分
    private int eatScore;           //饮食评分
    private Boolean flag;           //酒店评论状态(是否删除)

    public HotelCommentInfo() {

    }

    public HotelCommentInfo(int commentId, int parentId, int parentCommentId, int userId, int hotelId,
                            String commentWord, int allScore, int locateScore, int cleanScore, int facilitiesScore,
                            int serviceScore, int comfortScore, int eatScore, Boolean flag) {
        this.commentId = commentId;
        this.parentId = parentId;
        this.parentCommentId = parentCommentId;
        this.userId = userId;
        this.hotelId = hotelId;
        this.commentWord = commentWord;
        this.allScore = allScore;
        this.locateScore = locateScore;
        this.cleanScore = cleanScore;
        this.facilitiesScore = facilitiesScore;
        this.serviceScore = serviceScore;
        this.comfortScore = comfortScore;
        this.eatScore = eatScore;
        this.flag = flag;
    }

    public int getParentCommentId() {
        return parentCommentId;
    }

    public void setParentCommentId(int parentCommentId) {
        this.parentCommentId = parentCommentId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getCommentWord() {
        return commentWord;
    }

    public void setCommentWord(String commentWord) {
        this.commentWord = commentWord;
    }

    public int getAllScore() {
        return allScore;
    }

    public void setAllScore(int allScore) {
        this.allScore = allScore;
    }

    public int getLocateScore() {
        return locateScore;
    }

    public void setLocateScore(int locateScore) {
        this.locateScore = locateScore;
    }

    public int getCleanScore() {
        return cleanScore;
    }

    public void setCleanScore(int cleanScore) {
        this.cleanScore = cleanScore;
    }

    public int getFacilitiesScore() {
        return facilitiesScore;
    }

    public void setFacilitiesScore(int facilitiesScore) {
        this.facilitiesScore = facilitiesScore;
    }

    public int getServiceScore() {
        return serviceScore;
    }

    public void setServiceScore(int serviceScore) {
        this.serviceScore = serviceScore;
    }

    public int getComfortScore() {
        return comfortScore;
    }

    public void setComfortScore(int comfortScore) {
        this.comfortScore = comfortScore;
    }

    public int getEatScore() {
        return eatScore;
    }

    public void setEatScore(int eatScore) {
        this.eatScore = eatScore;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "酒店评论信息{" +
                "评论id=" + commentId +
                ", 父id=" + parentId +
                ", 用户id=" + userId +
                ", 酒店id=" + hotelId +
                ", 评论内容='" + commentWord + '\'' +
                ", 总评分=" + allScore +
                ", 位置评分=" + locateScore +
                ", 卫生评分=" + cleanScore +
                ", 设备评分=" + facilitiesScore +
                ", 服务评分=" + serviceScore +
                ", 舒适度评分=" + comfortScore +
                ", 饮食评分=" + eatScore +
                ", 酒店评论状态(是否删除)=" + flag +
                '}';
    }
}