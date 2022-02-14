<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="urlHome" value="/" />
<c:set var="path" value="${pageContext.request.contextPath}"/>
<center>
<br><br>
	<table>
		<tr>
			<td align="center">
				<div class="slider">
					<input type="radio" name="slide" id="slide1" checked> 
					<input type="radio" name="slide" id="slide2"> 
					<input type="radio" name="slide" id="slide3"> 
					<input type="radio" name="slide" id="slide4">
					<ul id="imgholder" class="imgs">
						<%-- <li><img src="${urlHome }resources/img/풍경1 - 복사본.jpeg"></li>
						<li><img src="${urlHome }resources/img/풍경2 - 복사본.jpeg"></li>
						<li><img src="${urlHome }resources/img/풍경3 - 복사본.jpeg"></li>
						<li><img src="${urlHome }resources/img/풍경4 - 복사본.jpeg"></li> --%>
						<li>
							<a href="${urlHome }region/detail?title=가로수길">
								<img src="${path }/img/가로수길 - 복사본.jpeg">
								<b>가로수길</b>
								<p>서울 데이트 장소</p>
							</a>
						</li>
						<li>
							<a href="${urlHome }region/detail?title=감성타코 신사점">
								<img src="${path }/img/감성타코 - 복사본.jpeg">
								<b>감성타코</b>
								<p>멕시칸 케쥬얼 레스토랑 감성타코</p>
							</a>
						</li>
						<li>
							<a href="${urlHome }region/detail?title=더풋샵 강남구청점">
								<img src="${path }/img/더풋샵 - 복사본.jpeg">
								<b>더풋샵</b>
								<p>발관리</p>
							</a>
						</li>
						<li>
							<a href="${urlHome }region/detail?title=매우매오 강남역본점">
								<img src="${path }/img/매우매오 - 복사본.jpeg">
								<b>매우매오</b>
								<p>크림갈비찜과 빨간갈비찜 치즈볶음밥까지!!</p>
							</a>
						</li>
					</ul>
					<br><p></p>
					<div class="bullets">
						<label for="slide1">&nbsp;</label> 
						<label for="slide2">&nbsp;</label>
						<label for="slide3">&nbsp;</label> 
						<label for="slide4">&nbsp;</label>
					</div>
				</div>
			</td>
		</tr>
	</table>
</center>
