<?php

if($_POST['username']=="admin" && $_POST['password']=="admin"){
    echo "Berhasil Login";
}else{
    echo "Gagal Login";
}

?>