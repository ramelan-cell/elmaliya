<?php

include "koneksi.php";

$username = trim($_POST['username']);
$password = $_POST['password'];

$myusername = mysqli_real_escape_string($KONEKSI, $username);
$mypassword = mysqli_real_escape_string($KONEKSI, $password);

$myusername = str_replace(" ", "", $myusername);

$json = array();

$query = "SELECT *
        FROM users a
        where a.username ='$myusername' and a.password=md5('$mypassword')  ";


$result = mysqli_query($KONEKSI, $query);
$data = mysqli_fetch_assoc($result);
$row = mysqli_num_rows($result);

if ($row > 0) {
        $user_id = $data['id'];
        $nama = $data['nama_lengkap'];
        $username = $data['username'];
        $no_hp = $data['no_hp'];
        $alamat = $data['alamat'];
        $foto = $data['foto'];

        if (empty($foto)) {
                $foto =  'https://kreditmandiri.co.id/api_test/absensi/profile/photo.jpg';
        } else {
                $foto =  'http://192.168.1.87/api/bukukas/profile/' . $foto;
        }

        $json = array(
                'value' => 1, 'message' => 'login berhasil', 'nama' => $nama,
                'user_id' => $user_id, 'user' => $username, 'no_hp' => $no_hp, 'alamat' => $alamat, 'foto' => $foto
        );
} else {
        $json = array('value' => 0, 'message' => 'login gagal', 'query' => $query);
}


echo json_encode($json);
mysqli_close($KONEKSI);
