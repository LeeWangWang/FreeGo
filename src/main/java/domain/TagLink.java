package domain;

/**
 * @Author: 李旺旺
 * @Date: 2021/5/3 21:09
 * @Description: 标签关联信息
 */
public class TagLink {
    int linkId;     //关联id
    int tagId;      //标签Id
    String type;    //类型:(0)游记、(1)酒店、(2)景点

    public TagLink(int linkId, int tagId, String type) {
        this.linkId = linkId;
        this.tagId = tagId;
        this.type = type;
    }

    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "标签关联信息{" +
                "关联id=" + linkId +
                ", 标签Id=" + tagId +
                ", 类型:(0)游记、(1)酒店、(2)景点='" + type + '\'' +
                '}';
    }
}
