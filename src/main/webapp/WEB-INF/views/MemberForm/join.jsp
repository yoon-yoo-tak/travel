<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="urlHome" value="/"/>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${path }/resources/css/signup.css" rel="stylesheet">
    <title>회원가입</title>
    <style type="text/css">
    	.id_ok{color:#6A82FB; display:none;}
    	.id_already{color:red; display:none;}
    	.pass_ok{color:#6A82FB; display:none;}
    	.pass_not{color:red; display:none;}
    </style>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	function checkId(){
        var id = $('#id').val();
    $.ajax({
        url:'/travel_kh/membership/idCheck',
        type:'post',
        data:{id:id},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
            if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                $('.id_ok').css("display","inline-block"); 
                $('.id_already').css("display", "none");
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.id_already').css("display","inline-block");
                $('.id_ok').css("display", "none");
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
    };
    function checkpass(){
    	let pass = $('#inputPassword').val();
    	let pass2 = $('#inputPassword4').val();
    	if (pass == pass2){
    		$('.pass_ok').css("display","inline-block"); 
            $('.pass_not').css("display", "none");
    	}else{
    		$('.pass_ok').css("display","none"); 
            $('.pass_not').css("display", "inline-block");
    	}
    }
	</script>
    
</head>
<body>
    <center>
    <div class = "start">
        <h1>회원 가입</h1>
        <hr>
        <form class="row g-3" action="${urlHome }membership/memberProc" method="post">
            <div class="col-12">
                <label class="form-label">아이디</label>
                <input type="text" class="form-control" name="id" required onchange="checkId()" id="id">
                <span class="id_ok">사용 가능한 아이디 입니다.</span>
                <span class="id_already">이미 존재하는 아이디 입니다.</span>
            </div>
            <div class="col-md-6">
            <label for="inputPassword4" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="inputPassword" name="pw" required>
            <sapn class="pass_ok">비밀번호가 일치합니다.</sapn>
            <sapn class="pass_not">비밀번호가 일치하지 않습니다.</sapn>
            </div>
            <div class="col-md-6">
            <label for="inputPassword4" class="form-label">비밀번호(확인)</label>
            <input type="password" class="form-control" id="inputPassword4" required onchange="checkpass()">
            </div>
            <div class="col-12">
                <label class="form-label">이름</label>
                <input type="text" class="form-control" name="name" required>
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">이메일</label>
                <input type="email" class="form-control" id="inputEmail4" name="email" required>
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">관심지역</label>
                <select id="inputState" class="form-select" name="interestedRegion">
                    <option selected>선택</option>
                    <option>서울</option>
                    <option>경기</option>
                    <option>강원</option>
                    <option>인천</option>
                    <option>충북</option>
                    <option>충남</option>
                    <option>대전</option>
                    <option>전북</option>
                    <option>전남</option>
                    <option>경북</option>
                    <option>경남</option>
                    <option>제주</option>
                </select>
            </div>
            <div></div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">우편번호</label>
                <input type="text" class="form-control" id="inputZip" name="zipcode" required>
            </div>
            <div class="col-lg-2">
                <button class="btn btn-danger" id="search" onClick="findAddr()" type="button">검색</button>
            </div>
            <div class="col-12">
            <label for="inputAddress" class="form-label">주소</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="주소" name="addr1" required>
            </div>
            <div class="col-12">
            <label for="inputAddress2" class="form-label">상세주소</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="상세 주소" name="addr2" required>
            </div>
            <div class="d-grid gap-2" style="margin-top: 50px;">
            <button type="submit" class="btn btn-danger">회원 가입</button>
            </div>
            <input type="text" value="${msg }" id="msg">
        </form>
    </div>
</center>
<script type="text/javascript">
	function findAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {    	
	        	console.log(data);
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('inputZip').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("inputAddress").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("inputAddress").value = jibunAddr;
	            }
	        }
	    }).open();
	}
	
	
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>