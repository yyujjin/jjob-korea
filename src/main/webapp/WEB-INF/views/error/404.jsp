<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            .error_cont {
                background-image: url("../../resources/img/심슨DOH.avif");
                width: 100%;
                height: 100%;
                background-size: 100% 100%;
                font-weight: bold;
                font-size: 50px;
            }

            .error_cont a:hover {
                color: #00ff00;
            }

            .error_cont a {
                border: solid 5px;
                background-color: rgba(255, 255, 255, 0);
                text-decoration: none;
                border-radius: 3px;
            }

            .error_cont span {
                color: blue;
            }
        </style>

    <body>
        <div class="error_cont">
            <span>404 ERROR</span>
            <br>
            <a href="/">BACK MAIN</a>
        </div>
    </body>

    </html>