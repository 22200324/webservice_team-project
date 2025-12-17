<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>전체 일기</title></head>
<body>

<h2>🌍 전체 일기</h2>

<ul>
    <c:forEach var="d" items="${diaries}">
        <li>${d}</li>
    </c:forEach>
</ul>

<a href="${pageContext.request.contextPath}/student/home">← 돌아가기</a>

</body>
</html>
