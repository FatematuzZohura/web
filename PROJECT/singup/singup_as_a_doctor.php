<?php
$servername = "localhost";
$username = "root";
$password = "";
$myDb= "php";


$conn = new mysqli($servername, $username, $password,$myDb);
if (!$conn) {
    die("Database Connect Error");
}
$ID=$_POST['ID'];
$Username=$_POST['Username'];
$Password=$_POST['Password'];
$Email=$_POST['Email'];

$sql_query="INSERT INTO doctors (ID,Username,Password,Email) VALUES ('$ID','$Username','$Password','$Email')";

if (mysqli_query($conn,$sql_query)) {
  echo"<script type='text/javascript'>window.alert('successfully completed');window.location='/PROJECT/index.html';</script>";
}
else{
  echo"<script type='text/javascript'>window.alert('Something went wrong,Please Try again after some time');window.location='signup/signup_as_a_doctor.html';</script>";
}

      
?>

