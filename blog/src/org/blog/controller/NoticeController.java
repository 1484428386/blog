package org.blog.controller;

import java.util.Date;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.blog.common.JsonDateValueProcessor;
import org.blog.common.PageSupport;
import org.blog.pojo.Notice;
import org.blog.service.notice.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController {
	
	@Resource
	private NoticeService noticeService;
	
	//去公告页面
	@RequestMapping(value="/toNotice.html")
	public String toNotice(@RequestParam(value="startNum",required=false)String startNum,
			Model model) {
		PageSupport page=new PageSupport();
		Notice notice=new Notice();
		if (StringUtils.isNullOrEmpty(startNum)) {
			startNum="1";
		}
		page.setPage(Integer.parseInt(startNum));
		page.setTotalCount(noticeService.getNoticeCount());
		notice.setStartNum((page.getPage()-1)*page.getPageSize());
		notice.setPageSize(page.getPageSize());
		page.setItems(noticeService.getNoticeList(notice));
		model.addAttribute("page",page);
		return "/notice/notice";
	}
	
	//去添加公告页面
	@RequestMapping(value="/add-notice.html")
	public String toAddNotice(@ModelAttribute(value="notice")Notice notice) {
		return "/notice/add-notice";
	}
	
	//添加公告
	@RequestMapping(value="/saveNotice.html")
	public String saveNotice(Notice notice) {
		/*Notice notice=new Notice();
		notice.setContent(content);
		notice.setTitle(title);*/
		notice.setCreateDate(new Date());
		if (noticeService.addNotice(notice)) {
			return "redirect: /toNotice.html";
		}else {
			return "redirect: /add-notice.html";
		}
	}
	
	//查询单个公告对象
	@RequestMapping(value="/getNotice.html",produces={"text/html;charset=UTF-8"})
	@ResponseBody
	public String getNotice(@RequestParam String id) {
		Notice notice=new Notice();
		notice.setId(Integer.parseInt(id));
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		notice=noticeService.getNotice(notice);
		return JSONObject.fromObject(notice,jsonConfig).toString();
	}
	
	//删除公告
	@RequestMapping(value="/delNotice.html")
	@ResponseBody
	public String delNotice(@RequestParam String id) {
		Notice notice=new Notice();
		notice.setId(Integer.parseInt(id));
		if (noticeService.delNoticeById(notice)) {
			return "success";
		}else {
			return "error";
		}
	}
}
