<!-- http://localhost:8089/challenge -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="jquery-3.6.0.min.js"></script>
		<script type="text/javascript">
			//location.href="http://localhost:8089/challenge"
			$(document).ready(function () {
			});
		</script>
		<link rel="stylesheet" href="css/challenge.css">
		<script src="js/challenge.js" type="text/javascript"></script>
		<script src='https://unpkg.co/gsap@3/dist/gsap.min.js'></script>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Source+Sans+Pro&display=swap"
			rel="stylesheet">
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	</head>

	<body>
		<%@ include file="/WEB-INF/views/main_header.jsp" %>
			<img id="challenge1" src="img/challenge/challenge1.svg">
			<div class="container">
				<div class="header"></div>
				<div class="section">
					<!-- 현재 시간을 가져옴 -->
					<c:set var="today" value="<%=new java.util.Date()%>" />
					<!-- 챌린지 리스트 -->
					<img class="titlesvg" src="img/challenge/title1.svg">
					<div class="containerflex">
						<c:forEach items="${challengelist }" var="dto">
							<!-- String을 date로 변환 -->
							<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
							<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
							<!-- 기부조건에 도달하지 않았을때 -->
							<c:if test="${dto.checknum != dto.chdonate}">
								<c:if test="${sdate < today}">
									<c:if test="${edate > today}">
										<div class="item">
											<div class="chimg">
												<img class="img" src="/image/${dto.chimg }">
											</div>
											<div class="chdetail">
												<div class="text1">${dto.chname }</div>
												<div class="text2">${dto.chsdate} ~ ${dto.chedate}</div>
												<div class="text3">경험치 <div class="text7">${dto.chexp} P</div></div>
												<div class="text4">성공조건 <div class="text7">${dto.chsuccess } 회</div></div>				
												<div class="text5">기부금액 <div class="text7"><fmt:formatNumber value="${dto.donatepay}" pattern="#,###" /> 원</div> </div>
										 		<div class="text6">기부처 <div class="text7">${dto.donateco} </div> </div>
										</div>
										<!-- chdetail -->
										<div class="chdetail2">

											<div>
												기부조건 : ${dto.checknum } / ${dto.chdonate }
												<div>
													<progress value="${dto.checknum }"
														max="${dto.chdonate }"></progress>
												</div>
											</div>
											<c:forEach items="${challcount }" var="dto2">

												<c:if test="${dto.chnum == dto2.chnum}">
													<div>
														최대모집 : ${dto2.nickname }/ ${dto.chmaxp}
														<div>
															<progress value="${dto2.nickname }"
																max="${dto.chmaxp}"></progress>
														</div>
														
														<c:if test="${dto2.nickname == dto.chmaxp}">
															<div>**참여불가**</div>
														</c:if>
													</div>
												</c:if>
											</c:forEach>
												<form class="buttonout" action="/challenge/${dto.chnum }" method="get">
												<input class="button" type="submit"
																value="참가하기">
												<input type="hidden" name="chnumdetail"
																value="${dto.chnum }">
											</form>
										</div>
										<!-- chdetail2 -->
					</div>
					<!-- item -->
					</c:if>
					</c:if>
					</c:if>
					</c:forEach>
				</div>
				<!-- containerflex -->
				<!-- ======================================================================== -->
				<img class="titlesvg" src="img/challenge/title2.svg">
				<div class="containerflex">
					<c:forEach items="${challengelist }" var="dto">
						<!-- String을 date로 변환 -->
						<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
						<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
						<!-- 기부조건에 도달하지 않았을때 -->
						<c:if test="${dto.checknum != dto.chdonate}">
							<c:if test="${sdate > today}">
								<div class="item">
											<div class="chimg">
												<img class="img" src="/image/${dto.chimg }">
											</div>
											<div class="chdetail">
												<div class="text1">${dto.chname }</div>
												<div class="text2">${dto.chsdate} ~ ${dto.chedate}</div>
												<div class="text3">경험치 - ${dto.chexp}P</div>
												<div class="text4">성공조건 - ${dto.chsuccess }회</div>				
												<div class="text5">기부금액 : ${dto.donatepay}</div>
										 		<div class="text6">기부처 : ${dto.donateco}</div>
										</div>
										<!-- chdetail -->
										<div class="chdetail2">

											<div>
												기부조건 : ${dto.checknum } / ${dto.chdonate }
												<div>
													<progress value="${dto.checknum }"
														max="${dto.chdonate }"></progress>
												</div>
											</div>
											<c:forEach items="${challcount }" var="dto2">

												<c:if test="${dto.chnum == dto2.chnum}">
													<div>
														최대모집 : ${dto2.nickname }/ ${dto.chmaxp}
														<div>
															<progress value="${dto2.nickname }"
																max="${dto.chmaxp}"></progress>
														</div>
														
														<c:if test="${dto2.nickname == dto.chmaxp}">
															<div>**참여불가**</div>
														</c:if>
													</div>
												</c:if>
											</c:forEach>
												<div class="buttonout">
												<input class="button" type="submit"
																value="오픈예정">
												
											</div>
										</div>
										<!-- chdetail2 -->
					</div>
								<!-- item -->
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				<!-- containerflex -->
				<!-- ======================================================================== -->
				<img class="titlesvg" src="img/challenge/title3.svg">
				<div class="containerflex">
					<c:forEach items="${challengelist }" var="dto">
						<!-- String을 date로 변환 -->
						<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
						<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
						<!-- 기부조건에 도달하지 않았을때 -->
						<c:if test="${dto.checknum == dto.chdonate}">
							<c:if test="${sdate < today}">
								<div class="item">
											<div class="chimg">
												<img class="img" src="/image/${dto.chimg }">
											</div>
											<div class="chdetail">
												<div class="text1">${dto.chname }</div>
												<div class="text2">${dto.chsdate} ~ ${dto.chedate}</div>
												<div class="text3">경험치 - ${dto.chexp}P</div>
												<div class="text4">성공조건 - ${dto.chsuccess }회</div>				
												<div class="text5">기부금액 : ${dto.donatepay}</div>
										 		<div class="text6">기부처 : ${dto.donateco}</div>
										</div>
										<!-- chdetail -->
										<div class="chdetail2">

											<div>
												기부조건 : ${dto.checknum } / ${dto.chdonate }
												<div>
													<progress value="${dto.checknum }"
														max="${dto.chdonate }"></progress>
												</div>
											</div>
											<c:forEach items="${challcount }" var="dto2">

												<c:if test="${dto.chnum == dto2.chnum}">
													<div>
														최대모집 : ${dto2.nickname }/ ${dto.chmaxp}
														<div>
															<progress value="${dto2.nickname }"
																max="${dto.chmaxp}"></progress>
														</div>
														
													</div>
												</c:if>
											</c:forEach>
										</div>
										<!-- chdetail2 -->
					</div>
								<!-- item -->
							</c:if>
						</c:if>
					</c:forEach>
				</div>
				<!-- containerflex -->
				<hr>
				<!-- ======================================================================== -->
				<%-- <h1>실패한 챌린지</h1>
					<div class="containerflex">
						<c:forEach items="${challengelist }" var="dto">
							<!-- String을 date로 변환 -->
							<fmt:parseDate var="sdate" value="${dto.chsdate}" pattern="yyyy-MM-dd" />
							<fmt:parseDate var="edate" value="${dto.chedate}" pattern="yyyy-MM-dd" />
							<!-- 기부조건에 도달하지 않았을때 -->
							<c:if test="${dto.checknum != dto.chdonate}">
								<c:if test="${edate < today}">
									<div class="item">
										<div class="chimg">
											<img class="img" src="/image/${dto.chimg }">
										</div>
										<div class="chdetail">
											<div>
												<span>${dto.chnum }</span> <span>${dto.chname }</span>
											</div>
											<div>경험치 : ${dto.chexp}</div>
											<div>개인성공조건 : ${dto.chsuccess }</div>
											<div>chsdate ${dto.chsdate}</div>
											<div>chedate ${dto.chedate}</div>
											<div>기부금액 : ${dto.donatepay}</div>
											<div>기부처 : ${dto.donateco}</div>

										</div>
										<!-- chdetail -->
										<div class="chdetail2">

											<div>
												기부조건 : ${dto.checknum } / ${dto.chdonate }
												<div>
													<progress value="${dto.checknum }"
														max="${dto.chdonate }"></progress>
												</div>
											</div>
											<c:forEach items="${challcount }" var="dto2">

												<c:if test="${dto.chnum == dto2.chnum}">
													<div>
														최대모집 : ${dto2.nickname }/ ${dto.chmaxp}
														<div>
															<progress value="${dto2.nickname }"
																max="${dto.chmaxp}"></progress>
														</div>
														<c:if test="${dto2.nickname == dto.chmaxp}">
															<div>**참여불가**</div>
														</c:if>
													</div>
												</c:if>
											</c:forEach>
										</div>
										<!-- chdetail2 -->
									</div>
									<!-- item -->
								</c:if>
							</c:if>
						</c:forEach>
					</div> --%>
					<!-- containerflex -->
					<!-- ======================================================================== -->
			</div>
			</div>
			<%@ include file="/WEB-INF/views/main_footer.jsp" %>

	</body>

	</html>