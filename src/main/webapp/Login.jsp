<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginPage</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-image: url('images/back3.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 12px;
            padding: 100px; 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            color: #007BFF;
            font-size: 2.5em; 
            margin-bottom: 20px; 
        }

        .btn-group {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            margin: 0 20px; 
            font-size: 1.2em; 
        }

        #loginForm {
            display: none;
            margin-top: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-label {
            margin-bottom: 10px;
            color: #007BFF;
        }

        .form-control {
            margin-bottom: 15px;
        }

        #backBtn {
            display: none;
            margin-top: 20px;
        }

        #loginBtn {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h1>Login</h1>
                <div id="buttonGroup" class="btn-group">
                    <button class="btn btn-primary" id="adminBtn">Admin</button>
                    <button class="btn btn-primary" id="studentBtn">Student</button>
                </div>
                <div id="loginForm">
                     <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">User ID</label>
                            <input type="text" class="form-control" id="username" name="username">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <button type="submit" class="btn btn-primary" id="loginBtn">Login</button>
                    </form>
                </div>
                <button id="backBtn" class="btn btn-secondary">Back</button>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#adminBtn, #studentBtn").click(function () {
                $("#buttonGroup").hide();
                $("#loginForm").slideDown();
                $("#backBtn").show();
                $("#loginBtn").show();
            });

            $("#backBtn").click(function () {
                $("#buttonGroup").show();
                $("#loginForm").slideUp();
                $("#backBtn").hide();
                $("#loginBtn").hide();
            });
        });
    </script>
</body>
</html>