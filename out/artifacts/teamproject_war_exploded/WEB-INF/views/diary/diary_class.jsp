<%@ page contentType="text/html; charset=UTF-8" %>
<h2>🏫 우리반 일기</h2>

<ul>
    <c:forEach var="d" items="${diaries}">
        <li>
            <b>${d.title}</b> - ${d.writer}<br/>
                ${d.content}
        </li>
    </c:forEach>
</ul>
