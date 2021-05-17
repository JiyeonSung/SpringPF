package com.jayymall.persistence;

import java.sql.Timestamp;
import java.util.List;

import com.jayymall.domain.GoogleChartVO;

public interface GoogleChartDAO {

	//public List<GoogleChartDTO> cartProduct_price();
	
	// 1차 카테고리 별 매출(전체)
	public List<GoogleChartVO> primaryChart() throws Exception;
	
	// 1차 카테고리 별 매출 비율(월별)
	public List<GoogleChartVO> primaryChartByMonth(Timestamp ord_date) throws Exception;
	
	// 2차 카테고리 별 매출(전체)
	public List<GoogleChartVO> secondaryChart() throws Exception;
	
	// 2차 카테고리 별 매출(월별)
	public List<GoogleChartVO> secondaryChartByMonth(Timestamp ord_date) throws Exception;
	
	// 월별 매출
	public List<GoogleChartVO> monthlyChart(Timestamp ord_date) throws Exception;
	
	// 매년 총 매출
	public List<GoogleChartVO> yearlySales() throws Exception;
}
