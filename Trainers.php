<?php
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "fit_buddy";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
 die("Connection failed: " . $conn->connect_error);
}
$query = "SELECT * FROM Trainers";

$result = $conn->query($query);
if ($result->num_rows > 0) {
 // output data of each row
 echo "<table align=\"center\"
 border= \"1\">";
 echo "<tr>
 <th>ID</th>
 <th>Name</th>
 <th>Focus</th>
 <th>Rating</th>
 <th>Gym</th>
 <th>GymID</th>
 </tr>";
 while($row = $result->fetch_assoc()) {
    echo "<tr>
    <td>". $row["TrainerID"]. "</td>
    <td> ". $row["Name"]. "</td>
    <td> ". $row["focus"]. "</td>
    <td>". $row["Rating"] . "</td>
    <td>". $row["Gym"] . "</td>
    <td>". $row["GymID"] . "</td>
    <tr>";

 }
} else {
 echo "0 results";
}
$conn->close();
?>