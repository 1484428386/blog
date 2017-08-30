package org.blog.service.notice;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.notice.NoticeMapper;
import org.blog.pojo.Notice;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Resource
	private NoticeMapper noticeMapper;
	
	//分页查询
	@Override
	public List<Notice> getNoticeList(Notice notice) {
		return noticeMapper.getNoticeList(notice);
	}

	//求总数
	@Override
	public int getNoticeCount() {
		return noticeMapper.getNoticeCount();
	}

	//删除公告
	@Override
	public boolean delNoticeById(Notice notice) {
		if (noticeMapper.delNoticeById(notice)>0) {
			return true;
		}
		return false;
	}

	//获取单个公告
	@Override
	public Notice getNotice(Notice notice) {
		return noticeMapper.getNotice(notice);
	}

	//添加公告
	@Override
	public boolean addNotice(Notice notice) {
		if (noticeMapper.addNotice(notice)>0) {
			return true;
		}
		return false;
	}

}
