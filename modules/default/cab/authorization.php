<?php 
if (isset($_POST['ok'], $_POST['login'], $_POST['pass'])) {

	$error = array();
	
	if (empty($_POST['login'])) {
		$error['login'] = 'Вы не заполнили поля Ник'; 
	}
	
	if (empty($_POST['pass'])) {
		$error['pass'] = 'Вы не ввели пароль';	
	}
		
		
	if(!count($error))	{
		
		$res = q("
   			SELECT *
   			FROM   `users`
   			WHERE  `login` = '".ms($_POST['login'])."'
   			AND `pass` = '".MyHash($_POST['pass'])."'
   			AND `active` = 1
   			LIMIT 1
   		");
   		
		if (mysqli_num_rows($res)) {
	   		$_SESSION['user'] = mysqli_fetch_assoc($res);
			
			if (isset($_POST['check'])) {
				setcookie('pass', MyHash($_POST['pass'].$_POST['login']), time ()+3600*24*30*12, '/');
				setcookie('user_id', $_SESSION['user']['id'], time ()+3600*24*30*12, '/');
				
				q("
					UPDATE `users` SET
					`MyHash`       = '".MyHash($_POST['pass'].$_POST['login'])."',
					`id`           = '".ms($_SESSION['user']['id'])."'
					WHERE  `login` = '".ms($_POST['login'])."'
   					AND `pass`     = '".MyHash($_POST['pass'])."'
					LIMIT 1
				");
			}
			if($_SESSION['user']['acces'] == 5) {
				header ('Location: /');
				exit();
			} else {
				header ('Location: /');
				exit();
			}
			
	   	} else {
			$error ['login'] = 'Вы не верно ввели Логин или не прошли активацию';
		}
	}
}