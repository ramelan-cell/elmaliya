<?php

include "koneksi.php";

date_default_timezone_set('Asia/Jakarta');
$tanggal  = $_POST['tanggal'];
$kategori = $_POST['kategori'];
$jenis_dana = $_POST['jenis_dana'];
$nominal = $_POST['nominal'];
$created_by = $_POST['user_id'];

$query = "SELECT COUNT(*) as jml FROM pemasukan where tanggal ='$tanggal' AND created_by ='$created_by' ";
$result = mysqli_query($KONEKSI, $query);
$data = mysqli_fetch_assoc($result);
$count = $data['jml'];

if ($count > 0) {
    $json = array('value' => 0, 'message' => 'Pemasukan di tanggal tersebut sudah ada ');
} else {

    $query = "INSERT INTO pemasukan (tanggal,kategori,jenis_dana,nominal,created_by)
          VALUES ('$tanggal','$kategori','$jenis_dana','$nominal','$created_by') ";

    $result = mysqli_query($KONEKSI, $query);
    if ($result) {
        $json = array('value' => 1, 'message' => 'Proses berhasil', 'query' => $query);
    } else {
        $json = array('value' => 0, 'message' => 'Proses gagal', 'query' => $query);
    }
}

echo json_encode($json);
mysqli_close($KONEKSI);
