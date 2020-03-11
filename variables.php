<?php
//rewrite
if (isset($_GET['route'])) {
	$route = explode('/',$_GET['route']);
	
	$i = 0;
	foreach ($route as $k=>$v) {
		if ($i == 0) {
			if (!empty($v)) {
				$_GET['module'] = $v;
			}
		} elseif ($i == 1) {
			if (!empty($v)) {
				$_GET['page'] = $v;
			}
		} else {
			$_GET['key'.($i-1)] = $v;
		}
		$i++;
	}
	unset($_GET['route']);
}

//navigate
$admin = array('static','tovar', 'users', 'sets','doc');
$allowed = array('static','contacts','news','errors', 'cab', 'abouts', 'vakansi', 'search','cat');
if(!isset($_GET['module'])) {
	$_GET['module'] = 'static';
} elseif(!in_array($_GET['module'],$allowed) && Core::$skin != 'admin') {
	header("Location: /errors/404");
	exit();
}

if(!isset($_GET['page'])) {
	$_GET['page'] = 'main';
}
