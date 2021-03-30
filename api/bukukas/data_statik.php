<?php
include "koneksi.php";

$json = array();

$user_id = $_POST['user_id'];

$query = "SELECT  (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 1 AND created_by ='$user_id' ) AS in_1,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 2 AND created_by ='$user_id') AS in_2,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 3 AND created_by ='$user_id') AS in_3,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 4 AND created_by ='$user_id') AS in_4,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 5 AND created_by ='$user_id') AS in_5,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 6 AND created_by ='$user_id') AS in_6,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 7 AND created_by ='$user_id') AS in_7,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 8 AND created_by ='$user_id') AS in_8,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 9 AND created_by ='$user_id') AS in_9,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 10 AND created_by ='$user_id') AS in_10,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 11 AND created_by ='$user_id') AS in_11,
        (SELECT IFNULL(SUM(nominal),0) FROM pemasukan WHERE MONTH(tanggal) = 12 AND created_by ='$user_id') AS in_12,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 1 AND created_by ='$user_id') AS out_1,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 2 AND created_by ='$user_id') AS out_2,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 3 AND created_by ='$user_id') AS out_3,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 4 AND created_by ='$user_id') AS out_4,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 5 AND created_by ='$user_id') AS out_5,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 6 AND created_by ='$user_id') AS out_6,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 7 AND created_by ='$user_id') AS out_7,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 8 AND created_by ='$user_id') AS out_8,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 9 AND created_by ='$user_id') AS out_9,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 10 AND created_by ='$user_id') AS out_10,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 11 AND created_by ='$user_id') AS out_11,
        (SELECT IFNULL(SUM(nominal),0) FROM pengeluaran WHERE MONTH(tanggal) = 12 AND created_by ='$user_id') AS out_12 ";

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