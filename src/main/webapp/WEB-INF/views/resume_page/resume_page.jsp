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
                    height: 700px;
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

                .resume_title {
                    display: flex;
                    justify-content: space-around;
                    /* 가로 중앙 정렬 */
                    align-items: center;
                    /* 세로 중앙 정렬 */
                    background-color: rgb(242, 241, 241);
                    /* border: solid 1px black; */
                    height: 50px;
                }

                .resume_title p {
                    padding: 5px;
                    font-size: 15px;
                    font-weight: bold;
                    text-align: center;
                    line-height: 1.5;
                    /* 적절한 줄 간격 설정 */
                    margin: 0;
                    /* 여백 제거 */
                }

                .resume_list {
                    /* border: solid; */
                    height: 428px;
                }

                .resume_list li {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 10px;
                    width: 475px;
                    margin-left: 130px;
                    font-size: 15px;
                    height: 30px;
                    /* border: 1px solid #000; */
                }

                .button_container {
                    display: flex;
                    gap: 5px;
                }

                .resume_list button {
                    padding: 5px 10px;
                    border: none;
                    border-radius: 3px;
                    cursor: pointer;
                }


                .resume_list button.edit {
                    background-color: white;
                    color: black;
                }

                .resume_list button.delete {
                    background-color: white;
                    color: black;
                }

                .resume_list button.edit:hover {
                    background-color: blue;
                    color: white;
                    border-radius: 3px;
                }

                .resume_list button.delete:hover {
                    background-color: blue;
                    color: white;
                    border-radius: 3px;
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
                            <a class="resume-link" href="<%=request.getContextPath()%>/resume_write">이력서 등록</a>
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
                            onclick="location.href='<%=request.getContextPath()%>/resume_write'">이력서 등록</button>

                    </div>

                    <div class="resume_title">
                        <p>이력서 제목</p>
                        <p>이력서 관리</p>
                    </div>
                    <ul class="resume_list">
                        <!-- Resume items will be inserted here -->
                        <!-- <li>
                            <a href="#">이력서 1</a>
                            <div class="button_container">
                                <button class="edit">수정</button>
                                <button class="delete">삭제</button>
                            </div>
                        </li>
                        <li>
                            <a href="#">이력서 2</a>
                            <div class="button_container">
                                <button class="edit">수정</button>
                                <button class="delete">삭제</button>
                            </div>
                        </li> -->
                    </ul>
                    <!-- 예시임 나중에 지워야됨 -->

                    <script>
                        const maxResumes = 5;
                        let resumeCount = 0;
                        const resumeList = document.querySelector('.resume_list');
                        const addResumeButton = document.getElementById('add_resume_button');
                        const loggedInUserId = 'user123'; // 예시로 사용된 로그인한 사용자 ID

                        // 이력서를 리스트에 추가하는 함수
                        function addResume(title, resumeId) {
                            if (resumeCount < maxResumes) {
                                resumeCount++;

                                const listItem = document.createElement('li');

                                const linkItem = document.createElement('a');
                                linkItem.href = '#';
                                linkItem.textContent = title;

                                const buttonContainer = document.createElement('div');
                                buttonContainer.className = 'button_container';

                                const editButton = document.createElement('button');
                                editButton.textContent = '수정';
                                editButton.onclick = function () {
                                    // Add edit functionality here
                                    alert(`Editing resume ${resumeId}`);
                                };

                                const deleteButton = document.createElement('button');
                                deleteButton.textContent = '삭제';
                                deleteButton.onclick = function () {
                                    // Add delete functionality here
                                    resumeList.removeChild(listItem);
                                    resumeCount--;
                                };

                                buttonContainer.appendChild(editButton);
                                buttonContainer.appendChild(deleteButton);
                                listItem.appendChild(linkItem);
                                listItem.appendChild(buttonContainer);
                                resumeList.appendChild(listItem);
                            } else {
                                alert('최대 5개의 이력서를 생성할 수 있습니다.');
                            }
                        }

                        // 서버에서 이력서를 가져오는 함수
                        async function fetchResumes() {
                            try {
                                const response = await fetch(`/api/resumes?userId=${loggedInUserId}`);
                                const resumes = await response.json();
                                resumes.forEach(resume => {
                                    addResume(resume.title, resume.id);
                                });
                            } catch (error) {
                                console.error('Error fetching resumes:', error);
                            }
                        }

                        // 페이지 로드 시 이력서 가져오기
                        window.onload = fetchResumes;

                        // 새 이력서를 추가하는 이벤트 리스너
                        addResumeButton.addEventListener('click', () => {
                            const title = `이력서 ${resumeCount + 1}`;
                            addResume(title, `new_${resumeCount + 1}`);
                        });
                    </script>

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