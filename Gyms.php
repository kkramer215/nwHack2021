<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "fit_buddy";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
// $PName=$_POST['PName'];
if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
}
$query = "SELECT * FROM gyms";
$result = $conn->query($query);
if ($result->num_rows > 0) {
 // output data of each row
 echo "<table align=\"center\"
 border= \"1\">";
 echo "<tr>
 <th>ID</th>
 <th>Name</th>
 <th>Location</th>
 <th>24h?</th>
 <th>Phone number</th>
 </tr>";
 while($row = $result->fetch_assoc()) {
    echo "<tr>
    <td>". $row["ID"]. "</td>
    <td> ". $row["Name"]. "</td>
    <td>". $row["Location"] . "</td>
    <td>". $row["Timings"] . "</td>
    <td>". $row["Phone_number"] . "</td>
    <tr>";

 }
} else {
 echo "0 results";
}
$conn->close();
?>