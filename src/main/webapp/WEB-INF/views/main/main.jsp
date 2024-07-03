<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>
<style>
	body, html {
	    margin: 0;
	    padding: 0;
	    height: 100%;
	}

	.container {
	    display: grid;
	    grid-template-rows: auto 1fr auto;
	    height: 100%;
	}

	.header {
	    background-color: aqua;
	    padding: 20px;
	    width: auto;
	    height: auto;
	}

	.content {
	    background-color: lightgray;
	    padding: 20px;
	    width: auto;
	    height: auto;
	}

	.footer {
	    background-color: lightblue;
	    padding: 20px;
	    width: auto;
	    height: auto;
	}
</style>
</head>
<body>
	<div class="container">
	      <div class="header">
	          <jsp:include page="main-content.jsp" />
	      </div>
	      <div class="content">
	          <jsp:include page="main-footer.jsp" />
	      </div>
	      <div class="footer">
	          <jsp:include page="main-header.jsp" />
	      </div>
	  </div>
</body>
	
</html>


