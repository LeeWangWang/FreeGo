package domain;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/5/4 20:27
 * @Description:
 */
public class PageBean<T> {
    private int totalCount;                 //总记录数
    private int totalPage;                  //总页数
    private int currentPage;                //当前页码
    private List<TravelNoteInfo> headRow;   //轮播图显示的数据
    private List<TravelNoteInfo> list;      //每页显示的数据集合
    private List<String> locate;            //位置信息集合
    private List<UserInfo> userList;        //用户信息集合
    private List<Integer> collectNum;       //收藏数量集合
    private List<Integer> likeNum;          //点赞数量集合

    public PageBean() {
    }

    public PageBean(int totalCount, int totalPage, int currentPage, List<TravelNoteInfo> headRow, List<TravelNoteInfo> list, List<String> locate, List<UserInfo> userList, List<Integer> collectNum, List<Integer> likeNum) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.headRow = headRow;
        this.list = list;
        this.locate = locate;
        this.userList = userList;
        this.collectNum = collectNum;
        this.likeNum = likeNum;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<TravelNoteInfo> getHeadRow() {
        return headRow;
    }

    public void setHeadRow(List<TravelNoteInfo> headRow) {
        this.headRow = headRow;
    }

    public List<TravelNoteInfo> getList() {
        return list;
    }

    public void setList(List<TravelNoteInfo> list) {
        this.list = list;
    }

    public List<String> getLocate() {
        return locate;
    }

    public void setLocate(List<String> locate) {
        this.locate = locate;
    }

    public List<UserInfo> getUserList() {
        return userList;
    }

    public void setUserList(List<UserInfo> userList) {
        this.userList = userList;
    }

    public List<Integer> getCollectNum() {
        return collectNum;
    }

    public void setCollectNum(List<Integer> collectNum) {
        this.collectNum = collectNum;
    }

    public List<Integer> getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(List<Integer> likeNum) {
        this.likeNum = likeNum;
    }
}
