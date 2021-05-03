package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/5/3 20:52
 * @Description:
 */
public class UserPrefer {
    int userId;             //用户编号
    int tagId;              //编号Id
    float preferWeight;     //偏好权重

    public UserPrefer() {
    }

    public UserPrefer(int userId, int tagId, float preferWeight) {
        this.userId = userId;
        this.tagId = tagId;
        this.preferWeight = preferWeight;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public float getPreferWeight() {
        return preferWeight;
    }

    public void setPreferWeight(float preferWeight) {
        this.preferWeight = preferWeight;
    }

    @Override
    public String toString() {
        return "用户偏好信息{" +
                "用户编号=" + userId +
                ", 编号Id=" + tagId +
                ", 偏好权重=" + preferWeight +
                '}';
    }
}
