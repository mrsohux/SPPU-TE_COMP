<?php
$conn=mysqli_connect('localhost','root','','db');//db is name of database created in mysqlphpmyadmin
if(!$conn)
{
die(mysqli_connect_error());
}
echo "connect successfully";
echo "<br>";
$tname= $_POST["name"]; 
$tadd=$_POST["address"];
$sql1="insert into stud values ('$tname','$tadd')";

mysqli_query($conn,$sql1);

$sql= ' select * from stud ' ;
$rs=mysqli_query($conn,$sql);
$nrows = mysqli_num_rows($rs);
if( $nrows> 0)
{
while($row=mysqli_fetch_assoc($rs))
	{
	echo "Name: {$row['name']}<br>";
	echo "Address: {$row['address']}<br>";
	echo "-------------------------<br>";
	}
}
else
{
echo "Record not found";
}
mysqli_close($conn);

?>

