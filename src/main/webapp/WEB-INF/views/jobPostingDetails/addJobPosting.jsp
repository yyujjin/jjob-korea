<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>채용 공고 등록</title>
        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                padding: 20px;
            }

            .addPosting {
                max-width: 1000px;
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin: 0 auto; /* 수평 중앙 정렬 */
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                font-size: 1.75rem;
                color: #343a40;
            }

            label {
                font-weight: bold;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-control {
                border-radius: 5px;
                padding: 10px;
            }

            .form-check-label {
                margin-right: 15px;
            }

            .form-check-input {
                margin-right: 5px;
            }

            #experience_years {
                margin-top: 10px;
            }

            .btn-primary {
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                font-weight: bold;
                border-radius: 3px;
                background-color: blue;
            }

            .btn-primary:hover {
                background-color: #9eec2a;
                border: solid 1px #9eec2a;
            }
        </style>
    </head>

    <body>
        <div class="addPosting">
            <h1>채용 공고 등록</h1>
            <form action="/jobPost/create" method="post" enctype="multipart/form-data">
                <!--        <form action="/jobPost/create" method="post">-->
                <div class="form-group">
                    <label for="jobTitle">직무</label>
                    <select id="jobTitle" name="jobTitle" class="form-control">
                        <option value="" selected disabled>선택안함</option>
                        <option value="개발자">개발자</option>
                        <option value="디자이너">디자이너</option>
                        <option value="매니저">매니저</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>경력</label><br>
                    <div class="form-check form-check-inline">
                        <input type="radio" id="jobExperience" name="jobExperience" class="form-check-input"
                            value="경력무관">
                        <label class="form-check-label" for="none-Experience">경력무관</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" id="newbie" name="jobExperience" class="form-check-input" value="신입">
                        <label class="form-check-label" for="newbie">신입</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input type="radio" id="jobExperience" name="jobExperience" class="form-check-input" value="경력">
                        <label class="form-check-label" for="Experience">경력</label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="workLocation">근무지</label>
                    <input type="text" id="workLocation" name="workLocation" class="form-control" placeholder="근무지">
                </div>

                <div class="form-group">
                    <label for="employmentType">고용 형태</label>
                    <select id="employmentType" name="employmentType" class="form-control">
                        <option value="" selected disabled>선택안함</option>
                        <option value="계약직">계약직</option>
                        <option value="정규직">정규직</option>
                        <option value="인턴">인턴</option>
                        <option value="프리랜서">프리랜서</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="postingTitle">공고 제목</label>
                    <input type="text" id="postingTitle" name="postingTitle" class="form-control" placeholder="공고 제목">
                </div>

                <div class="form-group">
                    <label for="money">급여</label>
                    <input type="text" id="money" name="money" class="form-control" placeholder="급여 (숫자만 입력)">
                </div>

                <div class="form-group">
                    <label for="deadline">채용 마감 날짜</label>
                    <input type="date" id="deadline" name="deadline" class="form-control">
                </div>

                <form action="${pageContext.request.contextPath}/uploadImage" method="post"
                    enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="postingImage">회사 이미지</label>
                        <input type="file" id="postingImage" name="postingImage" class="form-control-file">
                    </div>
                </form>


                <!-- <div class="form-group">
                <label for="postingImage">회사 이미지</label>
                <input type="file" id="postingImage" name="postingImage" class="form-control-file">
            </div> -->

                <!-- <div class="form-group">
                <label for="details">상세 정보:</label>
                <textarea id="details" name="details" rows="5" class="form-control"
                    placeholder="상세 정보를 입력하세요"></textarea>
            </div> -->

                <button type="submit" class="btn btn-primary">등록</button>
            </form>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

    </html>