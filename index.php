<?php
// include './logger.php';
session_start();
ob_start();
if(isset($_SERVER['HTTP_REFERER']) && !empty($_SERVER['HTTP_REFERER'])){
	$host = parse_url($_SERVER['HTTP_REFERER']);
$host = $host['host'];
	if ($host != $_SERVER['HTTP_HOST']) {
		$time_cookie = time() + (86400 * 15);
		setcookie('httpref', $host, $time_cookie, '/');
	}
}
function __autoload($name)
{
	require 'classes/_'.$name.'.class.php';
}
$db = new db();
new router($db);
?>