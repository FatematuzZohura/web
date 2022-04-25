<?php
$conn=mysqli_connect("localhost", "root", "", "php");


//$conn = new mysqli($servername, $username, $password,$myDb);
if (!$conn) {
    die("Database Connect Error");
}

$Username=$_POST['Username'];
$Password=$_POST['Password'];
$Email=$_POST['Email'];
$Age=$_POST['Age'];

$sql_query="INSERT INTO patient (Username,Password,Email,Age) VALUES ('$Username','$Password','$Email','$Age')";

if (mysqli_query($conn,$sql_query)) {
  echo"<script type='text/javascript'>window.alert('successfully completed');window.location='/PROJECT/index.html';</script>";
}
else{
  echo"<script type='text/javascript'>window.alert('Something went wrong,Please Try again after some time');window.location='signup/singup as a patient.html';</script>";
}



      
?>