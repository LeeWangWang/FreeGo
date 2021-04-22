package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/6 18:36
 * @Description: 景点图片关系
 */
public class ScenicPictureInfo {
    private int scenicId;           //景点Id
    private String picturePath;     //图片路径
    private int pictureOrder;       //景点图片顺序

    public ScenicPictureInfo(int scenicId, String picturePath, int pictureOrder) {
        this.scenicId = scenicId;
        this.picturePath = picturePath;
        this.pictureOrder = pictureOrder;
    }

    public int getScenicId() {
        return scenicId;
    }

    public void setScenicId(int scenicId) {
        this.scenicId = scenicId;
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
        return "景点图片关系{" +
                "景点Id=" + scenicId +
                ", 图片路径='" + picturePath + '\'' +
                ", 景点图片顺序=" + pictureOrder +
                '}';
    }
}
