package domain;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/5/7 18:56
 * @Description:
 */
public class PageUser {
    private List<UserInfo> followList;//关注用户列表
    private List<Integer> followTravelNoteNumList;//关注用户游记数量
    private List<Integer> followNumList;//关注用户的粉丝数量
    private List<UserInfo> fansList;//粉丝用户列表
    private List<Integer> fansTravelNoteNumList;//粉丝用户游记数量
    private List<Integer> fansNumList;//粉丝用户的粉丝数量

    public PageUser() {
    }

    public PageUser(List<UserInfo> followList, List<Integer> followTravelNoteNumList, List<Integer> followNumList, List<UserInfo> fansList, List<Integer> fansTravelNoteNumList, List<Integer> fansNumList) {
        this.followList = followList;
        this.followTravelNoteNumList = followTravelNoteNumList;
        this.followNumList = followNumList;
        this.fansList = fansList;
        this.fansTravelNoteNumList = fansTravelNoteNumList;
        this.fansNumList = fansNumList;
    }

    public List<UserInfo> getFollowList() {
        return followList;
    }

    public void setFollowList(List<UserInfo> followList) {
        this.followList = followList;
    }

    public List<Integer> getFollowTravelNoteNumList() {
        return followTravelNoteNumList;
    }

    public void setFollowTravelNoteNumList(List<Integer> followTravelNoteNumList) {
        this.followTravelNoteNumList = followTravelNoteNumList;
    }

    public List<Integer> getFollowNumList() {
        return followNumList;
    }

    public void setFollowNumList(List<Integer> followNumList) {
        this.followNumList = followNumList;
    }

    public List<UserInfo> getFansList() {
        return fansList;
    }

    public void setFansList(List<UserInfo> fansList) {
        this.fansList = fansList;
    }

    public List<Integer> getFansTravelNoteNumList() {
        return fansTravelNoteNumList;
    }

    public void setFansTravelNoteNumList(List<Integer> fansTravelNoteNumList) {
        this.fansTravelNoteNumList = fansTravelNoteNumList;
    }

    public List<Integer> getFansNumList() {
        return fansNumList;
    }

    public void setFansNumList(List<Integer> fansNumList) {
        this.fansNumList = fansNumList;
    }
}
