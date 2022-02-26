package core.dao;

import java.util.List;

import com.activity_attend.model.ActivityAttendVO;

public interface CoreDao<P, I> {

	int insert(P pojo);

	int deleteById(I id);

	int update(P pojo);

	P selectById(I id);

	List<P> selectAll();
}
