package dao;

import domain.*;

import java.util.List;

public interface TravelNoteInfoDao {

    List<TravelNoteInfo> recommendTravelNoteInfoNote(int userId);

    List<TravelNotePictureInfo> queryTravelNotePicture(int travelNoteId);

    int queryTravelNoteLike(int userId, int travelNoteId);

    int queryTravelNoteCollection(int userId, int travelNoteId);

    List<TravelNoteInfo> queryTravelNoteInfoBySearch(String search);

    TravelNoteInfo queryTravelNoteInfoById(int travelNoteId);

    List<TravelNoteCommentInfo> queryTravelNoteComment(int travelNoteId);

    List<TravelNoteCommentPictureInfo> queryTravelNoteCommentPicture(int travelNoteId);

    Boolean updateTravelNoteLike(int userId, int travelNoteId);

    Boolean updateTravelNoteCollect(int userId, int travelNoteId);

    Boolean addTravelNoteComment(TravelNoteCommentInfo comment);

    Boolean addTravelNoteCommentPicture(TravelNoteCommentPictureInfo commentPicture);

    Boolean addReport(ReportTravelNoteInfo report);

    Boolean addTravelNote(TravelNoteInfo travelNote);

    Boolean addTravelNotePicture(TravelNotePictureInfo travelNotePicture);

    Boolean addTravelNoteTag(int travelNoteId, int tagId);

    List<TravelNoteInfo> queryCollectedTravelNoteInfoByUserId(int userId);

    List<TravelNoteInfo> queryAllTravelNoteInfo(int userId);

    Boolean banShare(int travelNoteId);
}
