<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/app.css">

    <title>학급 상세</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/navbar.jsp" />


<h2>🏫 내 학급</h2>

<a href="${pageContext.request.contextPath}/teacher/class/new">
    ➕ 새 학급 만들기
</a>

<hr>

<c:forEach var="c" items="${classList}">
    <div style="padding:15px; border:1px solid #ddd; margin-bottom:10px;
                display:flex; justify-content:space-between; align-items:center;">

        <div>
            <h3>${c.className}</h3>
            <p>학급 코드: <strong>${c.classCode}</strong></p>
            <a href="${pageContext.request.contextPath}/teacher/class/${c.id}">
                학급 들어가기 →
            </a>
        </div>

        <form method="post"
              action="${pageContext.request.contextPath}/teacher/class/delete"
              onsubmit="return confirm('정말 이 학급을 삭제할까요?');">
            <input type="hidden" name="classId" value="${c.id}">
            <button type="submit"
                    style="background:#e74c3c; color:white; border:none;
                           padding:8px 12px; border-radius:6px;">
                삭제
            </button>
        </form>
    </div>
</c:forEach>



</body>