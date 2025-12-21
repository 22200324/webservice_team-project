<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>일기 상세</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/app.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/navbar.jsp" />

<div class="section">
  <h2>📖 ${diary.title}</h2>
  <p style="color:#777;">
    작성일 ${diary.createdAt} · 조회수 ${diary.views}
  </p>
</div>

<div class="section">
  <div style="line-height:1.8; white-space:pre-wrap;">
    ${diary.content}
  </div>
</div>

<div class="section">
  <form method="post"
        action="${pageContext.request.contextPath}/teacher/diary/delete"
        onsubmit="return confirm('이 일기를 삭제할까요?');">
    <input type="hidden" name="postId" value="${diary.postId}">
    <button style="background:#e74c3c; color:white;
                       border:none; padding:10px 16px;
                       border-radius:8px;">
      🗑️ 일기 삭제
    </button>
  </form>
</div>

</body>
</html>
