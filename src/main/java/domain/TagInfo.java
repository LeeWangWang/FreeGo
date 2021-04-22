package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/3/30 21:27
 * @Description: 标签信息实体类
 */
public class TagInfo {
    private int tagId;          //标签id
    private String tagName;     //标签内容

    public TagInfo() {}

    public TagInfo(String tagName) {
        this.tagName = tagName;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    @Override
    public String toString() {
        return "标签信息{" +
                "标签id=" + tagId +
                ", 标签内容='" + tagName + '\'' +
                '}';
    }
}
