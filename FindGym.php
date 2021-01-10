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
$Price = intval($_POST['Price']);
$Timing = $_POST['24h'];
if($Price == NULL){
    $Price = 100;
}
$query = "SELECT * FROM gyms WHERE monthly_membership <= $Price AND 24h = 'Yes'";
if($Timing == "No"){
    $query = "SELECT * FROM gyms WHERE monthly_membership <= $Price";
}
$result = $conn->query($query);
if ($result->num_rows > 0) {
 // output data of each row
 echo "<table align=\"center\"
 border= \"1\">";
 echo "<tr>
 <th>ID</th>
 <th>Name</th>
 <th>Location</th>
 <th>24h</th>
 <th>Phone number</th>
 <th>Membership ($/month)</th>
 </tr>";
 while($row = $result->fetch_assoc()) {
    echo "<tr>
    <td>". $row["ID"]. "</td>
    <td> ". $row["Name"]. "</td>
    <td>". $row["Location"] . "</td>
    <td>". $row["24h"] . "</td>
    <td>". $row["Phone_number"] . "</td>
    <td>". $row["monthly_membership"] . "</td>
    <tr>";

 }
} else {
 echo "No results found";
}
$conn->close();
?>