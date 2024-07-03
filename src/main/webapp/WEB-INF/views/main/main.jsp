<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<style>
	/*화면에 양 옆의 공백 없이 꽉 차게 하려면, CSS를 사용하여 요소들의 너비를 100%로 설정하고, 기본적인 브라우저의 여백과 패딩을 제거해야 합니다. */
	body, html {
	    margin: 0;
	    padding: 0;
	    height: 100%;
	}

	.navbar {
	           margin: 0;
	           padding: 0;
	           width: 100%;
	       }
		   
	.container {
	    display: grid;
	    grid-template-rows: auto 1fr auto;
	    height: 100%;
	}

	.header {
	    padding: 20px;
	    width: auto;
	    height: auto;
	}

	.content {
	    padding: 20px;
	    width: auto;
	    height: auto;
	}

	.footer {
	    padding: 20px;
	    width: auto;
	    height: auto;
	}
</style>
</head>
<body>
	<div class="container">
	      <div class="header">
	          <jsp:include page="main-header.jsp" />
	      </div>
	      <div class="content">
	          <jsp:include page="main-content.jsp" />
	      </div>
	      <div class="footer">
	          <jsp:include page="main-footer.jsp" />
	      </div>
	  </div>
</body>
	
</html>


