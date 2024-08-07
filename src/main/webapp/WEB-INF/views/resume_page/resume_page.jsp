<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <style>
                .resume_all {
                    display: flex;
                    width: 100%;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                }

                .resume_sidebar,
                .resume_detail {
                    margin-top: 1%;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                }

                .resume_sidebar {
                    /* border: 1px solid black; */
                    width: 200px;
                    background-color: white;
                    position: fixed;
                    top: 45%;
                    left: 0;
                    margin-left: 360px;
                    transform: translateY(-50%);
                }

                .resume_sidebar a {
                    /* border: 1px solid black; */
                    color: black;
                    text-align: center;
                    text-decoration: none;
                    margin-right: 7px;
                    line-height: 10px;
                    height: 10px;
                }

                .resume_sidebar a:hover {
                    color: blue;
                    font-weight: bold;
                }

                .resume_slist {
                    display: flex;
                    flex-direction: column;
                    padding-left: 0;
                    margin-bottom: 0;
                    list-style: none;
                    font-size: 20px;
                    text-align: center;
                    padding: 15px 0;
                    justify-content: space-between;
                }

                .resume-item {
                    padding: 8px 0;
                }

                .resume-item a {
                    font-size: 15px;
                }

                .resume_stitle {
                    padding: 15px 0;
                }

                .resume_detail {
                    width: 800px;
                    margin: 150px auto;
                    margin-left: 250px;
                    margin-top: 50px;
                    overflow: hidden;
                    height: 660px;
                    /* border: solid 1px black; */
                }

                .tabs {
                    display: flex;
                    cursor: pointer;
                    gap: 10px;
                }

                .tabs button {
                    cursor: pointer;
                    color: white;
                    background-color: blue;
                    border: 1px solid blue;
                    width: 120px;
                    height: 40px;
                    margin-top: 8px;
                    border-radius: 3px;
                    font-size: 13px;
                    margin-right: 10px;
                    transition: width 0.5s, background-color 0.5s, border-radius 0.5s;
                }

                .tabs button:hover {
                    background-color: #9eec2a;
                    border: 1px solid #9eec2a;
                }

                .tab {
                    /* border: 1px solid black; */
                    flex: 1;
                    padding: 15px 20px;
                    text-align: center;
                    color: gray;
                    font-weight: bold;
                    margin-right: 100px;
                    font-size: 20px;
                }

                .tab.active {
                    color: black;
                }

                .resume_detail a {
                    display: flex;
                    flex-direction: column;
                    color: black;
                    text-align: center;
                }

                .resume_list {
                    height: 428px;
                }

                .resume_title {
                    font-weight: bold;
                    background-color: rgb(245, 243, 243);
                }

                .resume_list table {
                    text-align: center;
                    width: 810px;
                    border-collapse: collapse;
                    font-size: 15px;
                    margin-left: -34px;
                }

                .resume_list th,
                .resume_list td {
                    padding: 10px;
                    width: 100px;
                }

                .resume_list button {
                    padding: 5px 10px;
                    border: none;
                    border-radius: 3px;
                    cursor: pointer;
                    align-items: center;
                    background-color: white;
                }
                .resume_list button:hover {
                    color: white;
                    background-color: blue;
                }

                .resume_img {
                    width: 800px;
                    /* border: solid 1px black; */
                    height: 140px;
                    object-fit: cover;
                    object-position: bottom;
                }
            </style>

        </head>

        <body>
            <div class="resume_all">
                <div class="resume_sidebar">
                    <ul class="resume_slist flex-column">
                        <li class="resume_stitle" style="font-weight: bold;">
                            이력서 관리
                        </li>
                        <li class="resume-item">
                            <a class="resume-link" href="<%=request.getContextPath()%>/resume/create">이력서 등록</a>
                        </li>
                        <li class="resume-item">
                            <a class="resume-link" href="#">이력서 리스트</a>
                        </li>
                        <li class="resume-item">
                            <a class="resume-link" href="#">첨부파일 관리</a>
                        </li>
                    </ul>
                </div>

                <div class="resume_detail">
                    <div class="tabs">
                        <div class="tab active" href="#1">이력서 관리 </div>
                        <div class="tab" href="#2">첨부파일 관리</div>
                        <button id="add_resume_button"
                            onclick="location.href='<%=request.getContextPath()%>/resume/create'">이력서 등록</button>
                    </div>

                    <script type="text/javascript">
                        // 이력서 등록 후 localStorage를 지우는 스크립트
                        <c:if test="${not empty clearLocalStorage}">
                            localStorage.removeItem('resumeData');
                        </c:if>
                    </script>
                    <ul class="resume_list">
                        <c:choose>
                            <c:when test="${empty resumes}">
                                <p style="text-align: center;">등록된 이력서가 없습니다.</p>
                            </c:when>
                            <c:otherwise>
                                <table>
                                    <thead class="resume_title">
                                        <tr>
                                            <td>이력서 제목</td>
                                            <td>이력서 관리</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="resume" items="${resumes}">
                                            <tr>
                                                <td>${resume.resumePageTitle}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/resume/update"
                                                        method="get" style="display:inline;">
                                                        <input type="hidden" name="id" value="${resume.id}">
                                                        <button type="submit">수정</button>
                                                    </form>
                                                    <form action="${pageContext.request.contextPath}/resume/delete"
                                                        method="post" style="display:inline;">
                                                        <input type="hidden" name="id" value="${resume.id}">
                                                        <button type="submit">삭제</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </c:otherwise>
                        </c:choose>
                    </ul>

                    <div>
                        <img class="resume_img" src="../../resources/img/이력서를부탁해.png">
                    </div>
                </div>
            </div>



            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const tabs = document.querySelectorAll('.tab');
                    const individualForm = document.getElementById('individualForm');
                    const companyForm = document.getElementById('companyForm');
                    const registerLinks = document.querySelectorAll('.register-link');

                    tabs.forEach(tab => {
                        tab.addEventListener('click', () => {
                            tabs.forEach(t => t.classList.remove('active'));
                            tab.classList.add('active');

                            if (tab.dataset.tab === 'enterprise') {
                                individualForm.style.display = 'none';
                                companyForm.style.display = 'block';
                            } else {
                                individualForm.style.display = 'block';
                                companyForm.style.display = 'none';
                            }
                        });
                    });
                });
            </script>
        </body>

        </html>