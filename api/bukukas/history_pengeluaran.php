<?php
include "koneksi.php";

$user_id = $_POST['user_id'];

$json = array();

$query = "SELECT * FROM pengeluaran WHERE created_by ='$user_id' order by id desc limit 50 ";

$execute = mysqli_query($KONEKSI, $query);
$count = mysqli_num_rows($execute);

if($count > 0){
    while($row=mysqli_fetch_assoc($execute)){
        $json[] = $row;
    }
}else{
    $json = array();
}

echo json_encode($json);
mysqli_close($KONEKSI);

?>