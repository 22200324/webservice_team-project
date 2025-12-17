<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>선생님 홈</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f6fb;
            padding: 40px;
        }
        h2 { margin-bottom: 30px; }
        .menu {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            max-width: 600px;
        }
        .menu a{
            display: block;
            padding: 25px;
            background: white;
            border-radius: 12px;
            text-align: center;
            text-decoration: none;
            color: #222;
            font-size: 18px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        a:hover { background: #eef1ff; }

        body {
            margin: 0;
            font-family: 'Pretendard', sans-serif;
            background-color: #f7f8fa;
        }
        .navbar {
            width: 100%;
            background-color: #0d0d2b;
            padding: 18px 40px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-sizing: border-box;
        }
        .navbar .logo {
            font-size: 26px;
            font-weight: 700;
            letter-spacing: -1px;
        }

    </style>
</head>

<body>

<div class="navbar">
    <div class="logo">참!잘했어요</div>
    <div class="menu">
        <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
    </div>
</div>

<div class="menu">
    <a href="${pageContext.request.contextPath}/teacher/class/new">🏫 학급 생성</a>
    <a href="${pageContext.request.contextPath}/teacher/class">📚 내 학급 조회</a>
    <a href="${pageContext.request.contextPath}/teacher/notice/new">📝 공지 작성</a>
    <a href="${pageContext.request.contextPath}/teacher/notice">📢 내가 쓴 공지</a>
</div>

</body>
</html>
