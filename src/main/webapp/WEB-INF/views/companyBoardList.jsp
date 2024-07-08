<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <!-- 후일 경로수정이 되면 고쳐야한다. --> 
    <style>
        .div_page ul {
            display: flex;
            list-style: none;
        }
        
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

        .header, .content, .footer {
            padding: 20px;
            width: auto;
            height: auto;
        }
        
        .center-table {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh; /* 예시를 위해 전체 높이를 100%로 설정 */
        }

        #searchForm {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 20vh; /* 예시를 위해 전체 높이를 100%로 설정 */
        }

        .div_page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 0vh; /* 예시를 위해 전체 높이를 100%로 설정 */
        }
        
        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 12px;
            min-width: 500px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        
        .styled-table thead tr {
            background-color: #3f86d6;
            color: #ffffff;
            text-align: left;
        }
        
        .styled-table th,
        .styled-table td {
            padding: 12px 10px;
        }
        
        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }
        
        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }
        
        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #3f86d6;
        }
        
        .styled-table tbody tr.active-row {
            font-weight: bold;
            color: #3f86d6;
        }
    </style>
</head>

<body>
    
    <div class="center-table">
        <table width="500" border="1" class="styled-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>히트</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="dto">
                    <tr>
                        <td>${dto.companyCommunityBoardNum}</td>
                        <td>
                            <a href="companyBoardContent_view?companyCommunityBoardNum=${dto.companyCommunityBoardNum}">${dto.companyCommunityBoardTitle}</a>
                        </td>
                        <td>${dto.companyUserName}</td>
                        <td>${dto.companyCommunityBoardDate}</td>
                        <td>${dto.companyCommunityBoardHit}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="5">
                        <a href="companyBoardWrite_view">글작성</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <form method="get" id="searchForm">
        <select name="type">
            <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':''}"/> >전체</option>
            <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/> >제목</option>
            <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/> >내용</option>
            <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/> >작성자</option>
            <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/> >제목 or 내용</option>
            <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/> >제목 or 작성자</option>
            <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected':''}"/> >제목 or 내용 or 작성자</option>
        </select>
        <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
        <input type="hidden" name="pageNum" value="1">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <button>Search</button>
    </form>
    
    <h3>${pageMaker}</h3>
    <div class="div_page">
        <ul>
            <c:if test="${pageMaker.prev}">
                <li class="paginate_button">
                    <a href="${pageMaker.startpage - 1}">
                        [Previous]
                    </a>
                </li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
                <li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color: yellow'" : ""}>
                    <a href="${num}">
                        [${num}]
                    </a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next}">
                <li class="paginate_button">
                    <a href="${pageMaker.endpage + 1}">
                        [Next]
                    </a>
                </li>
            </c:if>
        </ul>
    </div>

    <form id="actionForm" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="type" value="${pageMaker.cri.type}">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
    </form>
    
  

    <script>
        var actionForm = $("#actionForm");

        $(".paginate_button a").on("click", function (e) {
            e.preventDefault();
            var bno = actionForm.find("input[name='boardNo']").val();
            if(bno != "") {
                actionForm.find("input[name='boardNo']").remove();
            }
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.attr("action","list").submit();
        });

        $(".move_link").on("click", function(e) {
            e.preventDefault();
            var targetBno = $(this).attr("href");
            var bno = actionForm.find("input[name='boardNo']").val();
            if(bno != "") {
                actionForm.find("input[name='boardNo']").remove();
            }
            actionForm.append("<input type='hidden' name='boardNo' value='"+targetBno+"'>");
            actionForm.attr("action","content_view").submit();
        });

        var searchForm = $("#searchForm");
        $("#searchForm button").on("click", function() {
            if(searchForm.find("option:selected").val() != "" && !searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요.");
                return false;
            }
            searchForm.attr("action","list").submit();
        });

        $("#searchForm select").on("change", function() {
            if(searchForm.find("option:selected").val() == "") {
                searchForm.find("input[name='keyword']").val("");
            }
        });
    </script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>
