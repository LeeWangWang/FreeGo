package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/3 19:39
 * @Description: 游记图片关系
 */
public class TravelNotePictureInfo {
    private int travelNoteId;       //游记Id
    private String picturePath;     //图片路径
    private int pictureOrder;       //图片顺序

    public TravelNotePictureInfo() {}

    public TravelNotePictureInfo(int travelNoteId, String picturePath, int pictureOrder) {
        this.travelNoteId = travelNoteId;
        this.picturePath = picturePath;
        this.pictureOrder = pictureOrder;
    }

    public int getTravelNoteId() {
        return travelNoteId;
    }

    public void setTravelNoteId(int travelNoteId) {
        this.travelNoteId = travelNoteId;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public int getPictureOrder() {
        return pictureOrder;
    }

    public void setPictureOrder(int pictureOrder) {
        this.pictureOrder = pictureOrder;
    }

    @Override
    public String toString() {
        return "游记图片关系{" +
                "游记Id=" + travelNoteId +
                ", 图片路径='" + picturePath + '\'' +
                ", 图片顺序=" + pictureOrder +
                '}';
    }
}
