package service.impl;

import dao.TravelNoteInfoDao;
import dao.impl.TravelNoteInfoDaoImpl;
import domain.TravelNoteInfo;
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
    public List<TravelNoteInfo> recommendTravelNoteInfoNote(String userId) {
        return null;
    }

    @Override
    public List<String> getLocate() {
        return noteInfoDao.getLocate();
    }

    @Override
    public TravelNoteInfo addTravelNote(TravelNoteInfo travelNote) {
        return noteInfoDao.addTravelNote(travelNote);
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
}
