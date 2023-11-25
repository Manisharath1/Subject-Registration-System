<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>University Home Page</title>
    <!-- Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-image: url('images/info.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            color: #fff;
        }

        .navbar {
            background-color: #343a40;
            z-index: 1;
        }

        .content-container {
            flex-grow: 1;
            padding-top: 70px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .footer {
            background-color: #343a40;
            color: #fff;
            padding: 20px 0;
        }

        .description-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            color: #000;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Distribute space evenly between title and paragraph */
        }

        /* Ensure all description containers have the same height */
        .description-container h2, .description-container p {
            margin: 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Centurion University Technology and Management</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Registration.jsp">Registration</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Content Container -->
<div class="content-container container">
    <div class="row justify-content-center align-items-stretch">
        <!-- Description Container 1 -->
        <div class="col-md-4">
            <div class="description-container">
                <h2>Learn the World</h2>
                <p>Lifelong learning is an extension of classrooms, books and theories. The DNA of Centurion is to offer ramps and ladders for multiple entry and exit by adopting and adapting National Credit Framework.</p>
            </div>
        </div>
        <!-- Description Container 2 -->
        <div class="col-md-4">
            <div class="description-container">
                <h2>Experience the World</h2>
                <p>The appropriate balance of knowledge and skills is the key to making a real difference. Centurion learning labs are real-time market linked production hubs for immersive and competency linked education deliveries.</p>
            </div>
        </div>
        <!-- Description Container 3 -->
        <div class="col-md-4">
            <div class="description-container">
                <h2>Change the World</h2>
                <p>The university and our students must transform societies and communities within which it exists change begins with us and from within. The Centurion survives and thrives on disruptions and relevant innovations to co-create a holistic learning ecosystem.</p>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container text-center">
        <p>Contact Number: +123456789</p>
        <p>Address: HIG-4, Floor 1 and 2, Jaydev Vihar, Opp Pal Heights, Bhubaneswar, Dist: Khurda, Odisha, India.</p>
    </div>
</footer>

<!-- Bootstrap JS scripts (required for Bootstrap components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
