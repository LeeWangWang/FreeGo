package service.impl;

import dao.TravelNoteInfoDao;
import dao.impl.TravelNoteInfoDaoImpl;
import domain.PageBean;
import domain.TravelNoteInfo;
import domain.UserInfo;
import service.TravelNoteInfoService;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/12 12:28
 * @Description: 游记信息处理
 */
public class TravelNoteInfoServiceImpl implements TravelNoteInfoService {

    private TravelNoteInfoDao noteInfoDao = new TravelNoteInfoDaoImpl();

    @Override
    public List<TravelNoteInfo> recommendTravelNoteInfo(int userId) {
        return noteInfoDao.recommendTravelNoteInfo(userId);
    }

    @Override
    public List<String> getLocate() {
        return noteInfoDao.getLocate();
    }

    @Override
    public TravelNoteInfo addTravelNote(TravelNoteInfo travelNote, int userId) {
        return noteInfoDao.addTravelNote(travelNote, userId);
    }

    @Override
    public int checkLocate(String locateName) {
        return noteInfoDao.checkLocate(locateName);
    }

    @Override
    public TravelNoteInfo queryTravelNoteInfoById(int noteId) {
        return noteInfoDao.queryTravelNoteInfoById(noteId);
    }

    @Override
    public String matchLocate(int locateId) {
        return noteInfoDao.matchLocate(locateId);
    }

    @Override
    public String matchPeople(int peopleId) {
        return noteInfoDao.matchPeople(peopleId);
    }

    @Override
    public Boolean isMyTravelNote(int userId, int noteId) {
        return noteInfoDao.isMyTravelNote(userId, noteId);
    }

    @Override
    public Boolean isUserFollowedByTravelNoteId(int userId, int noteId) {
        return noteInfoDao.isUserFollowedByTravelNoteId(userId, noteId);
    }

    @Override
    public Boolean isTravelNoteCollect(int userId, int noteId) {
        return noteInfoDao.isTravelNoteCollect(userId, noteId);
    }

    @Override
    public Boolean isTravelNoteLike(int userId, int noteId) {
        return noteInfoDao.isTravelNoteLike(userId, noteId);
    }

    @Override
    public int queryTravelNoteCollectionNum(int noteId) {
        return noteInfoDao.queryTravelNoteCollectionNum(noteId);
    }

    @Override
    public int queryTravelNoteLikeNum(int noteId) {
        return noteInfoDao.queryTravelNoteLikeNum(noteId);
    }

    @Override
    public Boolean updateUserFollowByTravelNoteId(int userId, int noteId) {
        return noteInfoDao.updateUserFollowByTravelNoteId(userId, noteId);
    }

    @Override
    public Boolean updateTravelNoteCollect(int userId, int noteId) {
        return noteInfoDao.updateTravelNoteCollect(userId, noteId);
    }

    @Override
    public Boolean updateTravelNoteLike(int userId, int noteId) {
        return noteInfoDao.updateTravelNoteLike(userId, noteId);
    }

    @Override
    public Boolean updateTravelNoteView(int noteId) {
        return noteInfoDao.updateTravelNoteView(noteId);
    }
}
