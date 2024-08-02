<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 양식</title>
<style>
    .container02 {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 95%;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-bottom: 20px;
        width: 100%;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 5px;
    }

    .radio-Box {
        padding: 0px 10px;
    }

    .radio-Box input[type=radio] {
        display: none;
    }

    .radio-Box input[type=radio]+label {
        border-radius: 4px;
        box-sizing: border-box;
        display: inline-block;
        cursor: pointer;
        padding: 10px;
        border: 1px solid #ccc;
        text-align: center;
        font-size: 12px;
        margin-right: 10px;
    }

    .radio-Box input[type=radio]:checked+label {
        background-color: white;
        border-color: black;
    }

    button[type="submit"] {
        background-color: #0057ff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        height: 60px;
        margin-top: 20px;
    }

    button[type="submit"]:hover {
        background-color: #0047d4;
    }
</style>
</head>
<body>
    <div id="individualForm" class="container02">
        <form id="signup-form" method="post" action="${pageContext.request.contextPath}/userInfo">
           <tr>
				<td>${userId}</td>
		   </tr>
        </form>
    </div>
</body>
</html>
