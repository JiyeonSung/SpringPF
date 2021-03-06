package com.jayymall.persistence;

import com.jayymall.domain.AdminVO;
import com.jayymall.dto.AdminDTO;

public interface AdminDAO {
	
	// 로그인
	public AdminVO login(AdminDTO dto) throws Exception;
	
	// 최근 로그인 시간 업데이트
	public void loginUpdate(String admin_id) throws Exception;
}
