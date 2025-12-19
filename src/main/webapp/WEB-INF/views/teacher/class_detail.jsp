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

<!-- 🏫 학급 정보 -->
<div class="section">
  <h2>🏫 ${clazz.className}</h2>
  <p>학급 코드</p>
  <div class="code">${clazz.classCode}</div>
  <p style="color:#777;">학생/학부모에게 이 코드를 알려주세요</p>
</div>

<!-- 👧👦 학생 명단 -->
<div class="section">
  <h3>👧👦 학생 명단</h3>
  <c:if test="${empty students}">
    <p>아직 학생이 없습니다.</p>
  </c:if>
  <ul>
    <c:forEach var="s" items="${students}">
      <li>${s.username} (${s.email})</li>
    </c:forEach>
  </ul>
</div>

<!-- 👨‍👩‍👧 학부모 명단 -->
<div class="section">
  <h3>👨‍👩‍👧 학부모 명단</h3>
  <c:if test="${empty parents}">
    <p>아직 학부모가 없습니다.</p>
  </c:if>
  <ul>
    <c:forEach var="p" items="${parents}">
      <li>${p.username} (${p.email})</li>
    </c:forEach>
  </ul>
</div>

<!-- 📢 공지 -->
<div class="section">
  <h3>📢 공지사항</h3>

  <a href="${pageContext.request.contextPath}/teacher/notice/new?classId=${clazz.id}">
    ➕ 공지 작성
  </a>

  <hr>

  <c:if test="${empty notices}">
    <p>아직 공지가 없습니다.</p>
  </c:if>

  <ul>
    <c:forEach var="n" items="${notices}">
      <li>
        <strong>${n.title}</strong><br>
        <span style="color:#666;">${n.createdAt}</span>
      </li>
    </c:forEach>
  </ul>
</div>

</body>
</html>
