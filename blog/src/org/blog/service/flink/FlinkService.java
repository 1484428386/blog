package org.blog.service.flink;

import java.util.List;

import org.blog.pojo.Flink;
import org.blog.pojo.User;

public interface FlinkService {

	// 查询友链总记录数
	public int count(User user) throws Exception;

	// 分页查询
	public List<Flink> getFlinkList(Flink flink) throws Exception;

	// 分页查询总记录数
	public int getcount() throws Exception;

	// 根据编号查询
	public Flink getFlinkByid(Flink flink);

	// 修改
	public boolean modifyFlink(Flink flink);

	// 添加
	public boolean addFlink(Flink flink);

	// 删除
	public boolean delFlink(Flink flink);

}
