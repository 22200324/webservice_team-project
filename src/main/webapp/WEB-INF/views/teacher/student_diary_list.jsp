<%--
  Created by IntelliJ IDEA.
  User: yooneerum
  Date: 25. 12. 20.
  Time: 오후 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
  <title>학생 일기 목록</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/app.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/navbar.jsp" />

<div class="section">
  <h2>📘 ${student.username} 학생의 일기</h2>
  <p style="color:#666;">총 ${fn:length(diaries)}개의 일기</p>
</div>

<div class="section">
  <c:if test="${empty diaries}">
    <p>아직 작성된 일기가 없습니다.</p>
  </c:if>

  <table style="width:100%; border-collapse:collapse;">
    <thead>
    <tr style="border-bottom:1px solid #ddd;">
      <th style="text-align:left; padding:10px;">제목</th>
      <th style="width:100px;">조회수</th>
      <th style="width:160px;">작성일</th>
      <th style="width:80px;"></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="d" items="${diaries}">
      <tr style="border-bottom:1px solid #eee;">
        <td style="padding:10px;">
          <a href="${pageContext.request.contextPath}/teacher/diary/${d.postId}">
              ${d.title}
          </a>
        </td>
        <td style="text-align:center;">${d.views}</td>
        <td style="text-align:center;">${d.createdAt}</td>
        <td style="text-align:center;">
          <form method="post"
                action="${pageContext.request.contextPath}/teacher/diary/delete"
                onsubmit="return confirm('이 일기를 삭제할까요?');">
            <input type="hidden" name="postId" value="${d.postId}">
            <button style="background:#e74c3c; color:white;
                                       border:none; padding:6px 10px;
                                       border-radius:6px;">
              삭제
            </button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
