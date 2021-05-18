package domain;
/**
 * ClassName: tagLinkInfo <br/>
 * Description: <br/>
 * date: 2021/4/28 15:14<br/>
 * @author hp<br />
 */
public class TagLinkInfo {
    private int linkId;
    private int tagId;
    private String type;

    public TagLinkInfo() {
    }

    public TagLinkInfo(int linkId, int tagId, String type) {
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
}
