<?php
function wtf($array, $stop = false) {
	echo '<pre>'.print_r($array,1).'</pre>';
	if(!$stop) {
		exit();
	}
}

function q ($query, $key = 0) {
	$resq = DB::_()->query($query);
	if ($resq === false) {
		$info = debug_backtrace();
		$error_q[] = 'Ошибка mysql: '.$query.'<br>';
		$error_q[] = 'Описания ошибки: '.DB::_($key)->error.'<br>';
		$error_q[] = 'Где произошла ошибка: '.$info['0']['file'].'<br>';
		$error_q[] = 'На какой линий: '.$info['0']['line'].'<br>';
		$error_q[] = 'Когда произошло ошибка: '.date('Y-M-D, h:i:s').'<br>';
		$error_q[] = '====================================================';
		// Отправить в почту
		foreach ($error_q as $v) {
			file_put_contents('./logs/log_mysql.log', strip_tags($v)."\n\r\n\r\n", FILE_APPEND);
			echo $v;
		}
		exit();
	} else {
		return $resq;
	}
}

function trimAll ($trim) {
	if (!is_array($trim)) {
		$trim = trim($trim);
	} else {
		$trim = array_map('trimAll',$trim);
	}
	return $trim;
}

function hc ($hc) {
	if (!is_array($hc)) {
		$hc = htmlspecialchars($hc);
	} else {
		$hc = array_map('hc',$hc);
	}
	return $hc;
}

function intALL ($int) {
	if (!is_array($int)) {
		$int = (int)($int);
	} else {
		$int = array_map('intALL',$int);
	}
	return $int;
}

function floatAll ($float) {
	if (!is_array($float)) {
		$float = (float)($float);
	} else {
		$float = array_map('floatAll',$float);
	}
	return $float;
}

function ms ($ms, $key =0) {
	return DB::_($key)->real_escape_string($ms);
}

// функция __autoload перехвачивает любые классы
function __autoload($class) {
	include './libs/'.$class.'.php';
}

//Защита пароля
function MyHash ($var) {
	$salt1 = 'MyComp';
	$salt2 = 'Expo';
	$var = crypt(md5($salt1.$var), md5($salt2));
	return $var;
}
