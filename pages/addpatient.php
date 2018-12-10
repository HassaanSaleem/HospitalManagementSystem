<?php 

session_start();

if (!isset($_SESSION['id'])) 
{
    exit();
}


$db = new mysqli("localhost","root","","hospital");


    if($db->connect_error)	
    {
        echo "Error";
        die("Connection Failed" .$db->connect_error);
    }
    else
    {
        //echo "Connected Sucessful";
    }

    if(isset($_POST['sub']))
    {
        $id= mysqli_real_escape_string($db,$_POST['id']);
        $pass= mysqli_real_escape_string($db,$_POST['pass']);
        $pass1= mysqli_real_escape_string($db,$_POST['pass1']);




        $query="INSERT INTO PATIENT VALUES('$id','$pass','$pass1')";

        if ($db->query($query) === TRUE) 
        {
    
            header("Location:addpatient.php?err=".urldecode("Sucessfully added"));
        }
        else
        {
            header("Location:addpatient.php?err=".urldecode("Unsucessful"));
            exit();
        }
    }


?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""
    <meta name="author" content="">

    <title>Tartaros Hospital</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">

    
</head>

<style> 


</style>

<body >

<div class="">

      <div id="wrapper" >

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class=" navbar-brand" href="index.html" >Welcome To Tartaros</a>
            </div>
            <!-- /.navbar-header -->

            <ul class=" nav navbar-top-links navbar-right">
                
                <!-- /.dropdown -->

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>

                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <!-- /input-group -->
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            
                        </li>
                        <li>
                            <a href="index.php"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o2 fa-fw"></i> Patient<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="addpatient.php"> Add Patient</a>
                                </li>
                                <li>
                                    <a href="patientlist.php"> Patient List</a>
                                </li>
                                <li>
                                    <a href="treatmemtadd.php">Treatmemt Add</a>
                                </li>
                                <li>
                                    <a href="treatmemtview.php">Treatmemt View</a>
                                </li>
                                <li>
                                    <a href="bill.php">Bill</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o1 fa-fw"></i> Department<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="addepartment.php">Add Department</a>
                                </li>
                                <li>
                                    <a href="viewDepartment.php">View Department</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        

                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Doctor<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="adddoctor.php"> Add Doctor</a>
                                </li>
                                <li>
                                    <a href="doctorlist.php"> Doctor List</a>
                                </li>
                            </ul>
                            
                        </li>

                        <li>
                         <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Perception<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="prec.php"> Add perception</a>
                                </li>
                                <li>
                                    <a href="preclist.php"> View Perception</a>
                                </li>                     
                            </ul>
                            
                        </li>


                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o1 fa-fw"></i> Staff<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="staffadd.php">Add Staff</a>
                                </li>
                                <li>
                                    <a href="staffview.php">View Staff</a>
                                </li>
                                <li>
                                    <a href="nursesadd.php">Add nurses</a>
                                </li>
                                <li>
                                    <a href="nursesview.php">View nurses</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> Enquiry</a>
                        </li>

                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

       
    </div>
    <!-- /#wrapper -->

    <div class="container lead " style=" position: relative;">
        <!--code here-->
         <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Enter Patient Details</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" role="form">
                            <fieldset>
                                <div class="form-group">
                                	<h4>Patient Id:</h4>
                                    <input class="form-control" type="text" name="id" id="id" autofocus required>
                                </div>
                                <div class="form-group">
                                	<h4>Patient Name:</h4>
                                    <input class="form-control" type="text" id="pass" name="pass" requred>
                                </div>
                                <div class="form-group">
                                	<h4>Patient History:</h4>
                                    <input class="form-control" type="text" id="pass1" name="pass1" requred>
                                </div>
                                
                                 <button type="submit" class="btn btn-lg btn-success btn-block" id="sub" name="sub">Add Patient</button>
                            </fieldset>
                        </form>
                        <br>
                    </div>
                </div>
            </div>
        </div>

    </div>


    </div>

   
</div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
