<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>main-content</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <style>
                .card-title {
                    font-size: 25px;
                    font-size: 25px;
                    /* 글자 크기 조절 */
                    text-align: left;
                    /* 왼쪽 정렬 */
                }

                /*사진 크기 조절*/
                .fixed-size-image {
                    width: 200px;
                    height: 150px;
                    object-fit: cover;
                }

                .card-text {
                    text-align: left;
                    /* 왼쪽 정렬 */
                }

                #updateTime {
                    color: #565e64;
                    font-size: xx-small;
                }

                #hotPosting-icon {
                    margin-left: -15px;
                }

                .col>a {
                    text-decoration: none;
                    /* 하이퍼링크의 밑줄 제거 */
                }

                .main-adv {
                    /* border: solid 1px black;
                    width: 300px;
                    height: 200px; */
                    margin-bottom: 50px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                }

                .adv-images {
                    width: 1260px;
                    height: 160px;
                    border: solid 1px rgba(0, 0, 0, 0.1);
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

                    /* transition: opacity 1s ease-in-out, visibility 1s ease-in-out; */
                    /* 1초 동안 부드러운 페이드 효과와 visibility 변경 */
                }

                .fade-out {
                    opacity: 0;
                    transition: opacity 0.7s;
                }

                .fade-in {
                    opacity: 1;
                    transition: opacity 0.7s;
                }
            </style>
        </head>

        <body>
            <!-- 반응형 -->
            <!-- //.row-cols-1한 열에 카드를 배치하고, .row-cols-md-3중간 중단점에서 위로 여러 행에 걸쳐 g-4 4장의 카드를 동일한 너비로 분할합니다. -->
            <!-- row-cols-md-3   중간 크기 화면(medium screen) 이상에서 한 행에 세 개의 열이 포함되도록 설정합니다. -->

            <div class="main-adv">
                <img src="../../resources/img/main_adv/검사무료체험.png" class="adv-images fade-in">
            </div>
            
            <script>
                $(document).ready(function () {
                    var images = [
                        "../../resources/img/main_adv/검사무료체험.png",
                        "../../resources/img/main_adv/디지털유닛.png",
                        "../../resources/img/main_adv/반도체설계.png",
                        "../../resources/img/main_adv/아카데미훈련생모집.png",
                        "../../resources/img/main_adv/이력서서비스.png",
                        "../../resources/img/main_adv/채용지원서비스.png"
                    ];
            
                    var index = 0;
            
                    function changeImage() {
                        var $img = $(".main-adv > img");
                        $img.removeClass('fade-in').addClass('fade-out'); // 현재 이미지를 페이드 아웃
            
                        setTimeout(function () {
                            index = (index + 1) % images.length;
                            $img.attr("src", images[index]);
                            $img.removeClass('fade-out').addClass('fade-in'); // 새로운 이미지를 페이드 인
                        }, 700); 
                    }
            
                    setInterval(changeImage, 3000); // 3초마다 이미지 변경
                });
            </script>


            <div style="font-weight: bold;"> 지금 <span style="color: #00FF00;">HOT</span>한 채용공고 <span
                    style="color: blue;">TOP8</span>
                <span id="updateTime">(매일 오전 09:00 ~ 익일 오전 09:00 기준)</span>
            </div>
            <br>

            <div class="row row-cols-2 row-cols-md-4 g-4 ">

                <c:forEach items="${postingList}" var="postingList">

                    <div class="col">
                        <a href="/jobPost">
                            <div class="card h-100 w-90 text-center">
                                <img src="<c:out value='${postingList.postingImage}'/>"
                                    class="card-img-top fixed-size-image" alt="..." />
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <c:out value='${postingList.companyName}' />
                                    </h5>
                                    <p class="card-text">
                                        <c:out value='${postingList.postingTitle}' />
                                    </p>
                                </div>
                            </div>
                        </a>
                    </div>

                </c:forEach>


            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
        </body>

        </html>