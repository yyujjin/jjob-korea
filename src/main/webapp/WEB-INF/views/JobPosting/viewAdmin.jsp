<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 정보 조회</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="mt-5">관리자 정보 조회</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>관리자 ID</th>
                    <th>이름</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db_name", "your_db_user", "your_db_password");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM admin_table";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String adminId = rs.getString("admin_id");
                            String adminName = rs.getString("admin_name");
                            String adminEmail = rs.getString("admin_email");
                %>
                <tr>
                    <td><%= adminId %></td>
                    <td><%= adminName %></td>
                    <td><%= adminEmail %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
