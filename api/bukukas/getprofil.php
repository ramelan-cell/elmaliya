<?php
include "koneksi.php";

$json = array();

$id = $_POST['id'];

$query = "SELECT  * ,(select sum(nominal) from pemasukan  
                      WHERE created_by = users.id and MONTH(tanggal) = MONTH(CURDATE()) AND YEAR(tanggal) = YEAR(CURDATE()) ) as total_pemasukan,
                      (select sum(nominal) from pengeluaran  
                      WHERE created_by = users.id and MONTH(tanggal) = MONTH(CURDATE()) AND YEAR(tanggal) = YEAR(CURDATE())) as total_pengeluaran,
                      (select sum(nominal) from pemasukan WHERE created_by = users.id and MONTH(tanggal) = MONTH(CURDATE()) AND YEAR(tanggal) = YEAR(CURDATE()) ) -
                      (select sum(nominal) from pengeluaran WHERE created_by = users.id and MONTH(tanggal) = MONTH(CURDATE()) AND YEAR(tanggal) = YEAR(CURDATE())) as saldo
          from users WHERE id ='$id'   ";

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