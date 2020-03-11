<?php 
if (isset($_SESSION['user'])) {
	
   $res_session = q("
       SELECT *
       FROM   `users`
       WHERE `id` = ".ms($_SESSION['user']['id'])."
       LIMIT 1
   ");
	
	$_SESSION['user'] = mysqli_fetch_assoc($res_session);
	q("UPDATE `users` SET
		`time_user` = NOW()
		WHERE `login` = '".$_SESSION['user']['login']."'
	");
	
} elseif (isset($_COOKIE['pass'])) {
	$res_cookie = q("
		SELECT *
		FROM   `users`
		WHERE  `MyHash` = '".ms($_COOKIE['pass'])."'
		AND  `id` = '".intAll($_COOKIE['user_id'])."'
		LIMIT 1
	");
			 
	if (mysqli_num_rows($res_cookie)) {
		$_SESSION['user'] = mysqli_fetch_assoc($res_cookie);
	} else {
		header ('Location: /cab/exit');
		exit();
	}
}