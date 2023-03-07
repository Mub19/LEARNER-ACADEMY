<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">        

        <title>Learning System</title>
        <link href="../css/style.css" rel='stylesheet' type='text/css' media="all">
        <!-- Custom fonts for this template-->
        <link href="../css/all.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
        <style>  
            li a span{
                color:#f6d76d;
                text-transform: uppercase;                    
            }
        </style>
        <script src="../js/jquery-3.4.1.js" type="text/javascript"></script>
    </head>

    <body id="page-top">

        <nav class="navbar navbar-expand navbar-dark static-top" style="background-color:#f6d76d">
            <%
                String uname = "";
                if (session.getAttribute("uname") != null &&
                         session.getAttribute("role").equals("lecturer")) {
                    uname = session.getAttribute("uname").toString();
                } else {
                    session.setAttribute("msg", "Please login first");
                    response.sendRedirect("../index.jsp");
            %>
            <script>
                location.href = "../index.jsp";
            </script>          
            <% }
            %>
            <a class="navbar-brand mr-1" href="index.jsp">Welcome ! <%= uname%></a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

        </nav>
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav"  style="background-color: #004085;">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">
                        <i class="fas fa-fw fa-layer-group"></i>
                        <span>Category</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="material.jsp">
                        <i class="fas fa-fw fa-book"></i>
                        <span>Material</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="announcement.jsp">
                        <i class="fas fa-satellite-dish"></i>
                        <span>Announcement</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tests.jsp">
                        <i class="fas fa-satellite-dish"></i>
                        <span>Tests</span></a>
                </li>            
                <li class="nav-item">
                    <a class="nav-link" href="#content2">
                        <i class="fas fa-fw fa-key"></i>
                        <span>Change Password</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../Logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span></a>
                </li>
            </ul>

            <div id="content-wrapper" style="background:linear-gradient( rgba(255, 255, 255, 0.8) 100%, rgba(255, 0, 0, 0.4) 100%),url('../images/lect.jpg');
                 width:100vw; background-size: 100% 100%; height:calc(100vh - 56px);">

                <div class="container-fluid">
                    <jsp:include page="../msg.jsp" />

