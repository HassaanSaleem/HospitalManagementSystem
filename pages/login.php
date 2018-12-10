<?php

session_start();

$db = new mysqli("localhost","root","","login");


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

     //   echo $name;
     //   echo $pass;

        $query="SELECT * FROM ids WHERE id='$id' AND password='$pass'";
        $result=$db->query($query);



        if($row = $result->fetch_assoc())
        {
           // echo "found";

            $_SESSION['id']=$row['id'];
            header("Location:index.php");        


        }
        else
        {
            // echo "Not Found";
            header("Location:login.php?err=".urldecode("Wrong Password or Email"));
            exit();
        }
    }
?>


<!DOCTYPE html>
<html>
<head>
  <title>Login</title>

    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form method="post" role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" type="text" name="id" id="id" placeholder="10K0000" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="password" id="pass" name="pass" placeholder="***********">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                 <button type="submit" class="btn btn-lg btn-success btn-block" id="sub" name="sub" onclick="check()">Login</button>
                            </fieldset>
                        </form>
                        <br>
                  <?php
                      if(isset($_GET['err'])) 
                      {
                          ?>
                          <div class="alert-danger">
                           <h4 class="lead">Wrong Password or Email</h4>
                            </div>
                            <?php
                        }
                    ?>
                
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

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>
</html>