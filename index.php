<?php
error_reporting(-1);
ini_set('display_errors', '1');
header('Content-Type: text/html; charset=utf-8');
session_start();

// Конфиг сайта
include_once './config.php';
include_once './libs/default.php';
include_once './variables.php';

// Роутер
ob_start ();
include './modules/'.Core::$module.'/allpage.php';
if(!file_exists('./modules/'.Core::$module.'/'.$_GET['module'].'/'.$_GET['page'].'.php') || !file_exists('./skins/'.Core::$skin.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl')) {
	header("Location: /errors/404");
	exit();
}
include './modules/'.Core::$module.'/'.$_GET['module'].'/'.$_GET['page'].'.php';
include './skins/'.Core::$skin.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl';
$content = ob_get_contents();
ob_end_clean();

include './skins/'.Core::$skin.'/index.tpl';
?>