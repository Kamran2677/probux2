<?php
header("Content-type: image/png");
session_start();
$first = mt_rand(1,10);
$second = mt_rand(1,10);
$code = $first + $second;
$_SESSION['captcha'] = $code;
$sub_code = $first.' + '.$second.' =';
$im = imagecreate(100,20);
imagecolorallocatealpha($im,  255, 255, 255, 127);
$black = imagecolorallocate($im, 111, 191,77);
imagettftext($im, 23, 0, 0,19, $black, "./cap.ttf",$sub_code);
imagepng($im);
?>