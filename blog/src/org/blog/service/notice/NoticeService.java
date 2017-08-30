package org.blog.service.notice;

import java.util.List;

import org.blog.pojo.Notice;

public interface NoticeService {
	// 分页查询
	List<Notice> getNoticeList(Notice notice);

	// 求总数
	int getNoticeCount();

	// 删除公告
	boolean delNoticeById(Notice notice);

	// 获得单个公告信息
	Notice getNotice(Notice notice);

	// 增加公告
	boolean addNotice(Notice notice);
}
