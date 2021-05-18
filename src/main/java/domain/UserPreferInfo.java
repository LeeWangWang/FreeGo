package domain;/**
 * 一些声明信息
 * Description: <br/>
 * date: 2021/5/1 13:04<br/>
 *
 * @author hp<br />
 * @version
 * @since JDK 1.8
 */

/**
 * ClassName: UserPreferInfo <br/>
 * Description: <br/>
 * date: 2021/5/1 13:04<br/>
 * @author hp<br />
 */
public class UserPreferInfo {
    private int userId;
    private int tagId;
    private float preferWeight;

    public UserPreferInfo() {
    }

    public UserPreferInfo(int userId, int tagId, float preferWeight) {
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
        return "UserPreferInfo{" +
                "userId=" + userId +
                ", tagId=" + tagId +
                ", preferWeight=" + preferWeight +
                '}';
    }
}
