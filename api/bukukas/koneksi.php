
<?php

$KONEKSI = mysqli_connect('192.168.1.87', 'root', '');
$DATABASE = mysqli_select_db($KONEKSI, 'bukukas');

if (!$KONEKSI) {
    die("Koneksi Gagal : " . mysqli_connect_error());
}
echo "Koneksi berhasil";

?>