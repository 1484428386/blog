package org.blog.service.flink;

import java.util.List;

import javax.annotation.Resource;

import org.blog.dao.flink.FlinkMapper;
import org.blog.pojo.Flink;
import org.blog.pojo.User;
import org.springframework.stereotype.Service;

@Service
public class FlinkServiceImpl implements FlinkService {

	@Resource
	private FlinkMapper flinkMapper;

	@Override
	public int count(User user) throws Exception {
		return flinkMapper.count(user);
	}

	@Override
	public List<Flink> getFlinkList(Flink flink) throws Exception {
		return flinkMapper.getFlinkList(flink);
	}

	@Override
	public int getcount() throws Exception {
		return flinkMapper.getcount();
	}

	@Override
	public Flink getFlinkByid(Flink flink) {
		return flinkMapper.getFlinkByid(flink);
	}

	@Override
	public boolean modifyFlink(Flink flink) {
		boolean falg = false;
		if (flinkMapper.modifyFlink(flink) > 0) {
			falg = true;
		}
		return falg;
	}

	@Override
	public boolean addFlink(Flink flink) {
		boolean falg = false;
		if (flinkMapper.addFlink(flink) > 0) {
			falg = true;
		}
		return falg;
	}

	@Override
	public boolean delFlink(Flink flink) {
		boolean falg = false;
		if (flinkMapper.delFlink(flink) > 0) {
			falg = true;
		}
		return falg;
	}
}
