<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="./resources/css/resume_css/write.css">
</head>
<body>
    <div class="scroll"> <!-- 부모 div -->
        <div class="container"> <!-- 자식 div -->
            <header> <!-- 자식 태그 -->
                <div class="logo"> <!-- 자식 div -->
                    <img src="./resources/img/jjobkorea_logo.png" width="200px">
                </div> <!-- logo div 닫힘 -->
            </header> <!-- header 닫힘 -->
        </div> <!-- 첫 번째 container div 닫힘 -->
        
        <h3>인적 사항</h3>
        <div class="container2"> <!-- 자식 div -->
            <div class="resumeinform"> <!-- 자식 div -->
                <input type="text" placeholder="이름" required  style="width: 100px;height:40px;">
                <input type="text" placeholder="생년월일'-'제외" required  style="width:100px;height:40px;">
                <select size="1"  style="width:100px;height:40px;">
                    <option value="0">성별</option>
                    <option value="1"></option>
                    <option value="2">남자</option>
                    <option value="3">여자</option>
                </select>
                <input type="text" placeholder="이메일" required style="width:600px;height:40px;"><br>
                <input type="text" placeholder="전화번호"  style="width:200px;height:40px;">
                <input type="text" placeholder="휴대폰번호" required  style="width:200px;height:40px;">
                <input type="text" placeholder="주소" required  style="width:500px;height:40px;">
            </div> <!-- resumeinform div 닫힘 -->
            <div class="profilephoto"> <!-- 자식 div -->
                <div> <!-- 자식 div -->
                    사진 크기는<br>
                    150x210만 가능합니다.
                </div>
            </div> <!-- profilephoto div 닫힘 -->
            <label for="file">
                <div class="btn-upload">사진 업로드</div>
            </label>
            <input type="file" name="file" id="file">
        </div> <!-- 두 번째 container div 닫힘 -->
        <div class="sidebar">
            <ul>
                <li>인적 사항</li>
                <li>기술 스택</li>
                <li>포트폴리오</li>
            </ul>
        </div>
        
        <h3>기술 스택(최대 3개 선택 가능)</h3>
        <div class="container3"> <!-- 자식 div -->
            <div class="skill"> <!-- 자식 div -->
                <button>Java</button>
                <button>Spring</button>
                <button>HTML</button>
                <button>JavaScript</button>
                <button>SQL</button>
                <button>Android</button>
                <button>React</button>
                <button>Node.js</button>
                <button>Express</button>
                <!-- 포트폴리오 div가 skill div의 자식 div가 맞는지 확인 필요 -->
            </div> <!-- skill div 닫힘 -->
        </div>
        <h3>포트폴리오</h3>
        <div class="portpolio"> <!-- 자식 div -->
            URL을 입력하세요: <input id="url" type="url" style="width:500px;height:20px;margin-top: 11px;">
        </div> <!-- portpolio div 닫힘 -->
</div> <!-- scroll div 닫힘 -->
</body>
</html>
