<%@ page contentType="text/html; charset=UTF-8" %>
<h2>✍️ 일기 쓰기</h2>

<form action="/diary/write" method="post">
    <input type="text" name="title" placeholder="제목" required><br/><br/>
    <textarea name="content" rows="5" placeholder="오늘의 일기" required></textarea><br/><br/>

    <select name="scope">
        <option value="ALL">전체 공개</option>
        <option value="CLASS">우리반</option>
        <option value="MINE">나만 보기</option>
    </select><br/><br/>

    <button type="submit">저장</button>
</form>
