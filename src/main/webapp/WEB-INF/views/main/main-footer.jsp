<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>

        <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet"> -->


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <style>
        @font-face {
            font-family: 'PTBandocheB';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/PTBandocheB.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        body {
            font-family: "PTBandocheB", sans-serif;
            /* font-family: "Noto Sans KR", sans-serif; */
        }

        .text-body-secondary a {
            font-size: 18px;
            color: black;
            font-weight: bold;
            text-decoration: none;
            /* 밑줄 제거 */
        }

        /* .text-body-secondary a:hover {
            color: blue;
            text-decoration: none;
        } */

        /* transition을 위한 디자인 */

        .col-md-4 .mb-3 a {
            transition: color 0.5s;
            transition-timing-function: steps(5, end);
        }

        .col-md-4 .mb-3 a:hover {
            color: #9eec2a;
            font-size: 19px;
        }
    </style>

    <body>
        <div class="container">
            <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">

                <div class="col-md-4 d-flex align-items-center">
                    <span class="mb-3 mb-md-0 text-body-secondary">
                        <a href="https://www.notion.so/2-00b302e4e6964d91b05737af8ba58004"
                            target="_blank">회사소개</a>&nbsp;
                        <a href="https://www.notion.so/2-00b302e4e6964d91b05737af8ba58004"
                            target="_blank">브랜드스토리</a>&nbsp;
                        <a href="https://www.notion.so/2-00b302e4e6964d91b05737af8ba58004"
                            target="_blank">이용약관</a>&nbsp;
                        <a href="https://www.notion.so/2-00b302e4e6964d91b05737af8ba58004" target="_blank">고객센터</a><br>
                        대표 : 박유진<br>
                        팀원 : 한도훈 조해욱 문균호 차혜영 서민정<br>
                        <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">© 2024 Inc.JJobKorea Corporation</font>
                        </font>
                    </span>
                </div>

            </footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    </body>

    </html>