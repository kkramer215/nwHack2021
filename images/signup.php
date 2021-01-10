<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "fit_buddy";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
$FName=$_POST['FName'];
$SNumber=intval($_POST['SNumber']);
$Phone_number=$_POST['Phone_number'];
$Location=$_POST['Location'];
if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
}
$query = "INSERT INTO students(Student_ID,Name,Location, Phone_number ) VALUES($SNumber, '$FName', '$Location', '$Phone_number')";
$result = $conn->query($query);
 // output data of each row
 echo "<h1>Registration Successful</h1>";
 echo "<ul>
 <li>Name = $FName</li>
 <li>Student ID = $SNumber</li>
 <li>Location = $Location</li>
 <li>Phone Number = $Phone_number</li>
 </ul>";
$conn->close();
?>
