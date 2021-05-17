package com.jayymall.persistence;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jayymall.domain.GoogleChartVO;

@Repository
public class GoogleChartDAOImpl implements GoogleChartDAO {

	/*
	private final static String NS = "GoogleChartMapper";
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<GoogleChartDTO> cartProduct_price() {
		return session.selectList(NS + ".product_price");
	}
	*/

	
	@Inject
	private SqlSession session;
	
	private final static String NS = "com.jayymall.mappers.googleChartMapper";

	// 1차 카테고리 별 매출(전체)
	@Override
	public List<GoogleChartVO> primaryChart() throws Exception {
		return session.selectList(NS + ".primaryChart");
	}
	
	// 1차 카테고리 별 매출(월별)
	@Override
	public List<GoogleChartVO> primaryChartByMonth(Timestamp ord_date) throws Exception {
		return session.selectList(NS +".primaryChartByMonth", ord_date);
	}

	// 2차 카테고리 별 매출(전체)
	@Override
	public List<GoogleChartVO> secondaryChart() throws Exception {
		return session.selectList(NS + ".secondaryChart");
	}
	
	// 2차 카테고리 별 매출(월별)
	@Override
	public List<GoogleChartVO> secondaryChartByMonth(Timestamp ord_date) throws Exception {
		return session.selectList(NS + ".secondaryChartByMonth", ord_date);
	}

	// 월별 매출
	@Override
	public List<GoogleChartVO> monthlyChart(Timestamp ord_date) throws Exception {
		return session.selectList(NS + ".monthlyChart", ord_date);
	}

	// 매년 총 매출
	@Override
	public List<GoogleChartVO> yearlySales() throws Exception {
		return session.selectList(NS + ".yearlySales");
	}
}
