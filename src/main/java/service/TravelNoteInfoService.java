package service;

import domain.TravelNoteInfo;

import java.util.List;

public interface TravelNoteInfoService {

    List<TravelNoteInfo> recommendTravelNoteInfoNote(String userId);
}
