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

    /**
     * @Author:  李旺旺
     * @Date:    2021/4/26 21:02
     * @param:   [userId]
     * @Description: 系统根据用户编号userId查询用户偏好表（UserPreferList）和用户关注表（UserConcernList）,获取到用户偏好信息和用户关注信息,
     *               通过用户偏好信息和用户关注信息查询标签关联表（TagLinkList）、游记信息表（TravelNoteList）、游记图片关系表(TravelNotePictureList),
     *               查询成功返回游记信息实例集合List<TravelNoteInfo>,若查询失败，返回 null。
     */
    @Override
    public List<TravelNoteInfo> recommendTravelNoteInfoNote(String userId) {
        return null;
    }
}
