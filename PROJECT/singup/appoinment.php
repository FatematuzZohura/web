<?php
$servername = "localhost";
$username = "root";
$password = "";
$myDb= "php";


$conn = new mysqli($servername, $username, $password,$myDb);
if (!$conn) {
    die("Database Connect Error");
}

$Password=$_POST['Password'];
$Phone=$_POST['Phone'];
$Age=$_POST['Age'];
$Date=$_POST['Date'];
$Time=$_POST['Time'];
$Disease=$_POST['Disease'];
$Doctor_Name=$_POST['Doctor_Name'];


$sql_query="INSERT INTO appointment (Password,Phone,Age,Date,Time,Disease,Doctor_Name) VALUES ('$Password','$Phone','$Age','$Date','$Time','$Disease','$Doctor_Name')";

if (mysqli_query($conn,$sql_query)) {
  echo"<script type='text/javascript'>window.alert('successfully completed');window.location='/PROJECT/index.html';</script>";
}

else{

  echo"<script type='text/javascript'>window.alert('Something went wrong,Please Try again after some time');window.location='signup/singup.html';</script>";
}

      
?>