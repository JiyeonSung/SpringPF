<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<script src="/resources/vendor/jquery/jquery.min.js"></script>

<%-- Handlebar Template --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script id="subCGListTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<li><a href="/product/list?cat_code={{cat_code}}">{{cat_name}}</a></li>
	{{/each}}
</script>

<%-- 2차 카테고리 템플릿 적용함수 --%>
<script>
	$(document).ready(function(){
		/* 1차 카테고리에 따른 2차 카테고리 작업.   on()메서드: 매번진행 one()메서드: 단1회만 진행 */
		$(".mainCategory").one("mouseover", function(){
			var mainCGCode= $(this).val();
			var url = "/product/subCateList/" + mainCGCode;
			
						
			// REST 방식으로 전송
			$.getJSON(url, function(data){
				
				// 받은 데이터로 subCategory에 템플릿 적용
				subCGList(data, $("#" +"mainCategory_"+mainCGCode) ,$("#subCGListTemplate"));
				
			});

		});	
	});

	var subCGList = function(subCGStr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());
		var options = template(subCGStr);
		
		// 기존 option 제거(누적방지)
		//$("#subCategory option").remove();
		target.append(options);
	}
</script>

<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        <p>Free shipping, 30-day return or refund guarantee.</p>
                    </div>
                </div>
                
                
                <div class="col-lg-6 col-md-5">
                
                <!-- User Account Menu -->
                
				<%-- 로그인 안 한 상태 --%>
				<c:if test="${sessionScope.user == null}">
				
                    <div class="header__top__right">                        
                        <div class="header__top__hover">
                            <span>MEMEBER<i class="arrow_carrot-down"></i></span>
			                <ul>
			                    <li><a href = "/member/login">LOGIN</a></li>
                                <li><a href = "/member/join">JOIN</a></li>
                                <li><a href = "/member/lostpass">LOST_PASS</a></li>
                            </ul>
                        </div>
                        <div class="header__top__links">
                        	<a href="/order/list">ORDER</a>
                        </div>
                        <div class="header__top__hover">
                            <span>FAQ<i class="arrow_carrot-down"></i></span>
			                <ul>
			                    <li><a href = "#">FAQ</a></li>
								<li><a href = "#">Q&A</a></li>
								<li><a href = "#">NOTICE</a></li>
                            </ul>
                        </div>
                    </div>               
				</c:if>
				
				<%-- 로그인 한 상태 --%>
				<c:if test="${sessionScope.user != null}"> 
					
					<div class="header__top__right">                        
                        <div class="header__top__hover">
                        <span>MEMEBER<i class="arrow_carrot-down"></i></span>
						<ul>
							<li><a href = "/member/logout">LOG OUT</a></li>
						    <li><a href = "/member/checkPw?url=modify">MODIFY</a></li>
						    <li><a href = "/member/checkPw?url=changePw">CHANGE PW</a></li>
						    <li><a href = "/member/checkPw?url=delete">MEBER DELETE</a></li>
						</ul>
					</div>
                    <div class="header__top__links">
                    	<a href="/order/list">ORDER</a>
                    </div>
                    <div class="header__top__hover">
                        <span>FAQ<i class="arrow_carrot-down"></i></span>
						<ul>
							<li><a href = "#">FAQ</a></li>
							<li><a href = "#">Q&A</a></li>
							<li><a href = "#">NOTICE</a></li>
                        </ul>
                    </div>
	                    
                    <div class="header__top__right">
						<p class="hidden-xs" style="color:white; margin-top:14px; margin-left:15px; margin-right:15px;">
							${sessionScope.user.mem_name}님 &nbsp; | &nbsp;
						
							최근 접속 시간: 
							<fmt:formatDate value="${sessionScope.user.mem_lastlogin}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</p>
					</div>  
					</div>  
				</c:if>
                    
                </div>
            </div>
        </div>
    </div>
    			
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="/"><img src="/resources/img/logo.png" alt=""></a>
                </div>
            </div>            
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                	<ul>
	                	<c:forEach items="${userCategoryList}" var="list">
	                		<li class="mainCategory" value="${list.cat_code}">
	                			<a href="#">${list.cat_name}</a>
	                			<!--  2차카테고리 자식수준으로 추가작업 -->
	                           	<ul class="dropdown" id="mainCategory_${list.cat_code}"></ul>
	                        </li>
	                    </c:forEach>
                    </ul>
                </nav>
            </div>
            
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="/resources/img/icon/search.png" alt=""></a>
                    <a href="#"><img src="/resources/img/icon/heart.png" alt=""></a>
                    <a href="/cart/list"><img src="/resources/img/icon/cart.png" alt=""> <span></span></a>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>