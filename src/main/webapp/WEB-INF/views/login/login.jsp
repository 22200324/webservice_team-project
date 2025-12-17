<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        body {
            font-family: Arial;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f6f7fb;
        }
        .box {
            background: white;
            padding: 40px;
            border-radius: 12px;
            width: 300px;
            box-shadow: 0px 4px 14px rgba(0,0,0,0.15);
        }
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 15px;
            font-size: 15px;
        }
        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background-color: #0d0d2b;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover { background-color: #15153f; }
    </style>
</head>

<body>
<div class="box">
    <h2 style="text-align:center; margin-bottom:20px;">로그인</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <input type="text" name="username" placeholder="아이디 (student / parent / teacher)" required>
        <input type="password" name="password" placeholder="비밀번호 (1234)" required>
        <button type="submit">로그인</button>
    </form>

</div>
</body>
</html>
