package org.blog.controller;

import java.util.List;

import javax.annotation.Resource;

import org.blog.common.PageSupport;
import org.blog.pojo.Flink;
import org.blog.service.flink.FlinkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FlinkController  extends BaseController{
	@Resource
	private FlinkService flinkService;
	
	@RequestMapping(value="/flink/filnkList.html")
	public String flinkList(@RequestParam(value="currentpage",required=false)String currentpage,Model model){
		PageSupport page = new PageSupport();
		Flink flink = new Flink();
		List<Flink> flinkList =null;
		try {
			page.setTotalCount(flinkService.getcount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(page.getTotalCount()>0){
			if(currentpage!=null){
		    	page.setPage(Integer.parseInt(currentpage));
		    }
		    if(page.getPage()<0){
		    	page.setPage(1);
		    }
			if(page.getPage()>page.getPageCount()){
				page.setPage(page.getPageCount());
			}
		}
		flink.setStartNum((page.getPage()-1)*page.getPageSize());
		flink.setPageSize(page.getPageSize());
		try {
			 flinkList  =flinkService.getFlinkList(flink);
			page.setItems(flinkList);
		} catch (Exception e1) {
			e1.fillInStackTrace();
		}
		model.addAttribute("page", page);
		return "/flink/flinklist";
	}
	//根据编号精确查询
	@RequestMapping(value="/flink/flinkbyid.html")
	public String flinkById(@RequestParam(value="id",required=false)String id,Model model){
		Flink flink = new Flink();
		flink.setId(Integer.parseInt(id));
		flink = flinkService.getFlinkByid(flink);
		model.addAttribute("flink", flink);
		return "/flink/update-flink";
	}
	
	//修改
	@RequestMapping(value="/flink/modifyflink.html")
	public String modifyFlink(@ModelAttribute("modifyflink")Flink flink){
		try {
            flinkService.modifyFlink(flink);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/flink/filnkList.html";
	}
   //去添加页面
	@RequestMapping(value="/flink/toaddflink.html")
	public String toAddFlink(){
		return "flink/add-flink";
	}
	//添加
	@RequestMapping(value="/flink/addflink.html")
	public String addFlink(@ModelAttribute("addflink")Flink flink){
		try {
			Integer userid =this.getCurrUser().getId();
			flink.setCreateId(userid);
			flinkService.addFlink(flink);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/flink/filnkList.html";
	}
	//删除
	@RequestMapping(value="/flink/delflink.html")
	@ResponseBody
	public String delFlink(@RequestParam(value="id")String id){
		if(id==null || "".equals(id)){
			return "nodata";
		}
		try {
		 Flink flink = new Flink();
		 flink.setId(Integer.parseInt(id));
		 flinkService.delFlink(flink);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
    @RequestMapping(value="/flink/fordelfink.html",method=RequestMethod.POST)
    @ResponseBody
    public String forDelFink(@RequestParam(value="ids",required=false)String ids){
    	
    	if(ids==null|| "".equals(ids)){
    		return "nodata";
    	}
    	String[] idslength =ids.split("-");
    	Flink flink = new Flink();
    	try {
    		for (int i = 0; i < idslength.length; i++) {
        		flink.setId(Integer.parseInt(idslength[i]));
                flinkService.delFlink(flink);	
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
    	
    	 
    }
}
