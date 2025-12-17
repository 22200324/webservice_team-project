<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>참!잘했어요</title>
    <style>
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
        .menu {
            display: flex;
            gap: 25px;
            align-items: center;
        }
        .menu a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            opacity: 0.9;
        }
        .menu a:hover {
            opacity: 1;
        }
        .card-container {
            margin-top: 60px;
            display: flex;
            justify-content: center;
            gap: 40px;
        }
        .card {
            background-color: #f2dd70;
            width: 300px;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
            text-align: center;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .card:hover {
            transform: translateY(-7px);
            box-shadow: 0px 14px 26px rgba(0,0,0,0.15);
        }
        .card-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 12px;
        }
        .card-desc {
            font-size: 15px;
            color: #444;
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

<div class="card-container">
    <div class="card"
         onclick="location.href='${pageContext.request.contextPath}/diary/all'">
        <div class="card-title">🌍모두의 일기</div>
        <div class="card-desc">전체에게 공개된 일기를 볼 수 있어요 😊</div>
    </div>

    <div class="card"
         onclick="location.href='${pageContext.request.contextPath}/diary/class'">
        <div class="card-title">🏫 우리반 일기</div>
        <div class="card-desc">우리 반 친구들이 작성한 일기 🧑‍🤝‍🧑</div>
    </div>

    <div class="card"
         onclick="location.href='${pageContext.request.contextPath}/diary/mine'">
        <div class="card-title">📔 내 일기</div>
        <div class="card-desc">내가 쓴 일기들을 모아볼 수 있어요 ✨</div>
    </div>
</div>

</body>
</html>
