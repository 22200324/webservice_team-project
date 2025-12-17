<%@ page contentType="text/html; charset=UTF-8" %>
<h2>📔 내 일기</h2>

<a href="/diary/write">✍️ 새 일기 쓰기</a>

<ul>
  <c:forEach var="d" items="${diaries}">
    <li>
      <b>${d.title}</b><br/>
        ${d.content}
    </li>
  </c:forEach>
</ul>
