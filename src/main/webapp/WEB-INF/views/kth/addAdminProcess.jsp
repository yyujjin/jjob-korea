<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 정보 추가 처리</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">관리자 정보 추가 처리</h1>
        <%
            String adminId = request.getParameter("admin_id");
            String adminName = request.getParameter("admin_name");
            String adminEmail = request.getParameter("admin_email");

            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db_name", "your_db_user", "your_db_password");
                String sql = "INSERT INTO admin_table (admin_id, admin_name, admin_email) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, adminId);
                pstmt.setString(2, adminName);
                pstmt.setString(3, adminEmail);
                int result = pstmt.executeUpdate();
                if (result > 0) {
        %>
        <div class="alert alert-success mt-3" role="alert">
            관리자 정보가 성공적으로 추가되었습니다.
        </div>
        <%
                } else {
        %>
        <div class="alert alert-danger mt-3" role="alert">
            관리자 정보 추가에 실패하였습니다.
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <div class="alert alert-danger mt-3" role="alert">
            오류가 발생하였습니다: <%= e.getMessage() %>
        </div>
        <%
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
        <button class="btn btn-primary mt-3" onclick="location.href='main.jsp'">메인 페이지로 돌아가기</button>
    </div>
</body>
</html>
