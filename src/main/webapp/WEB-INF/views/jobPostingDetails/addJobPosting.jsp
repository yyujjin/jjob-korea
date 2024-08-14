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
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 600px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
    <div class="container">
        <h1>채용 공고 등록</h1>
        <form action="JobPostServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="position">직무:</label>
                <select id="position" name="position" class="form-control">
                    <option value="" selected disabled>선택안함</option>
                    <option value="developer">개발자</option>
                    <option value="designer">디자이너</option>
                    <option value="manager">매니저</option>
                </select>
            </div>

            <div class="form-group">
                <label>경력:</label><br>
                <div class="form-check form-check-inline">
                    <input type="radio" id="no_experience" name="experience" value="no_experience"
                        class="form-check-input" onclick="toggleExperienceInput(false)">
                    <label class="form-check-label" for="no_experience">경력무관</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="newbie" name="experience" value="newbie" class="form-check-input"
                        onclick="toggleExperienceInput(false)">
                    <label class="form-check-label" for="newbie">신입</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="experienced" name="experience" value="experienced"
                        class="form-check-input" onclick="toggleExperienceInput(true)">
                    <label class="form-check-label" for="experienced">경력</label>
                </div>
            </div>

            <div id="experience_years" style="display:none;">
                <div class="form-group">
                    <label for="experience_start">경력 연도:</label>
                    <input type="text" id="experience_start" name="experience_start" class="form-control"
                        placeholder="시작 연도">
                </div>
                <div class="form-group">
                    <input type="text" id="experience_end" name="experience_end" class="form-control"
                        placeholder="종료 연도">
                </div>
            </div>

            <div class="form-group">
                <label for="location">근무지:</label>
                <input type="text" id="location" name="location" class="form-control" placeholder="근무지">
            </div>

            <div class="form-group">
                <label for="employment_type">고용 형태:</label>
                <select id="employment_type" name="employment_type" class="form-control">
                    <option value="" selected disabled>선택안함</option>
                    <option value="contract">계약직</option>
                    <option value="permanent">정규직</option>
                    <option value="intern">인턴</option>
                    <option value="freelance">프리랜서</option>
                </select>
            </div>

            <div class="form-group">
                <label for="post_title">공고 제목:</label>
                <input type="text" id="post_title" name="post_title" class="form-control" placeholder="공고 제목">
            </div>

            <div class="form-group">
                <label for="salary">급여:</label>
                <input type="text" id="salary" name="salary" class="form-control" placeholder="급여 (숫자만 입력)">
            </div>

            <div class="form-group">
                <label for="closing_date">채용 마감 날짜:</label>
                <input type="date" id="closing_date" name="closing_date" class="form-control">
            </div>

            <div class="form-group">
                <label for="company_logo">회사 이미지:</label>
                <input type="file" id="company_logo" name="company_logo" class="form-control-file">
            </div>

            <div class="form-group">
                <label for="details">상세 정보:</label>
                <textarea id="details" name="details" rows="5" class="form-control"
                    placeholder="상세 정보를 입력하세요"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">등록</button>
        </form>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>
