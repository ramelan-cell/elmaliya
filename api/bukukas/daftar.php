<?php

include "koneksi.php";
$nama_lengkap  = trim($_POST['nama_lengkap']);
$no_hp = $_POST['no_hp'];
$alamat = $_POST['alamat'];
$username = trim($_POST['username']);
$password = md5($_POST['password']);

$query = "SELECT COUNT(*) as jml FROM users WHERE username ='$username' ";
// print_r($query);
$result = mysqli_query($KONEKSI, $query);
$data = mysqli_fetch_assoc($result);
$count = $data['jml'];

if ($count > 0) {
	$json = array('value' => 0, 'message' => 'Username sudah ada');
} else {
	$query = "INSERT INTO users (username,`password`,nama_lengkap,no_hp,alamat)
              VALUES ('$username','$password','$nama_lengkap','$no_hp','$alamat') ";

	$result = mysqli_query($KONEKSI, $query);
	if ($result) {
		$json = array('value' => 1, 'message' => 'Registrasi berhasil', 'query' => $query);
	} else {
		$json = array('value' => 0, 'message' => 'Registrasi gagal', 'query' => $query);
	}
}


echo json_encode($json);
mysqli_close($KONEKSI);
