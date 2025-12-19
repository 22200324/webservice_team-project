<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/app.css">


    <title>학급 생성</title>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/navbar.jsp" />
<div class="box">
    <h2>🏫 학급 생성</h2>

    <form method="post" action="${pageContext.request.contextPath}/teacher/class/new">
        <input type="text" name="className" placeholder="학급 이름" required>
        <button type="submit">학급 만들기</button>
    </form>
</div>

</body>
</html>
