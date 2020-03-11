<?php 
session_unset();
session_destroy();
setcookie('pass', '', time ()-3600*24*30*12, '/');
setcookie('user_id', '', time ()-3600*24*30*12, '/');
header ('Location: /');
exit();