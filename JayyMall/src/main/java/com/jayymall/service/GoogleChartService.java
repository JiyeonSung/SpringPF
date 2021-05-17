package com.jayymall.service;

import java.sql.Timestamp;
import java.util.List;

import com.jayymall.domain.GoogleChartVO;

public interface GoogleChartService {

	//public JSONObject getChartData(); //json 타입으로 리턴
	//public List<GoogleChartVO> primaryChart();
	
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
	
	/*
	 * JSON 형태로 보낼때는 아래 코드들로 처리
	 * 
	// 1차 카테고리 별 매출(전체)
	public JSONObject primaryChartData() throws Exception;
	
	// 1차 카테고리 별 매출 비율(월별)
	public JSONObject primaryChartByMonthData(Timestamp ord_date) throws Exception;
	
	// 2차 카테고리 별 매출(전체)
	public JSONObject secondaryChartData() throws Exception;
	
	// 2차 카테고리 별 매출(월별)
	public JSONObject secondaryChartByMonthData(Timestamp ord_date) throws Exception;
	
	// 월별 매출
	public JSONObject monthlyChartData(Timestamp ord_date) throws Exception; 
	 */
}
