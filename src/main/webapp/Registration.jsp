<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
   <style>
    body {
        background: #76b852;
        font-family: 'Roboto', sans-serif;
    }

    h1 {
        font-size: 3em;
        text-align: center;
        color: #fff;
        font-weight: 100;
        text-transform: capitalize;
        letter-spacing: 4px;
        font-family: 'Roboto', sans-serif;
    }

    .main-w3layouts {
        padding: 3em 0 1em;
    }

    .main-agileinfo {
        width: 35%;
        margin: 3em auto;
        background: rgba(0, 0, 0, 0.18);
        background-size: cover;
        border-radius: 15px;
        padding: 20px;
    }

    input[type="text"], input[type="password"] {
        font-size: 0.9em;
        color: #000; /* Changed to black */
        font-weight: 100;
        width: 100%;
        display: block;
        border: none;
        padding: 0.8em;
        border: solid 1px rgba(255, 255, 255, 0.37);
        background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #fff 4%);
        background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #fff 4%);
        background-position: -800px 0;
        background-size: 100%;
        background-repeat: no-repeat;
        color: #000; /* Changed to black */
        font-family: 'Roboto', sans-serif;
    }

    input[type="submit"] {
        font-size: .9em;
        color: #fff;
        background: #76b852;
        outline: none;
        border: 1px solid #76b852;
        cursor: pointer;
        padding: 0.9em;
        width: 100%;
        margin: 2em 0;
        letter-spacing: 4px;
        border-radius: 5px;
    }

    input[type="submit"]:hover {
        transition: .5s all;
        background: #8DC26F;
    }
    
     input[type="text"]::placeholder,
     input[type="password"]::placeholder {
        color: white; 
    }

    p {
        font-size: 0.9em;
        color: #fff;
        text-align: center;
        letter-spacing: 1px;
        font-weight: 300;
    }

    a {
        color: #fff;
        text-decoration: underline;
        cursor: pointer;
    }

    a:hover {
        color: #76b852;
    }
</style>
</head>
<body>
    <div class="main-w3layouts wrapper">
        <h1>SignUp Form</h1>
        <div class="main-agileinfo">
            <form action="RegistrationServlet" method="post">
                <input class="text" type="text" name="username" placeholder="Username" required="">
                <input class="text" type="password" name="password" placeholder="Password" required="">
                <input class="text" type="text" name="name" placeholder="Name" required="">
                <input class="text" type="text" name="domain" placeholder="Domain" required="">
                <input type="submit" value="SIGNUP">
            </form>
            <p>Have an Account? <a href="Login.jsp"> Login Now!</a></p>
        </div>
    </div>
</body>
</html>
