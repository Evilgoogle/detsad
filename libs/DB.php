<?php
class DB {
	static public $mysqli  = array();
	static public $connect = array();
	
	static public function _($key = 0) {
		if(!isset(self::$mysqli[$key])) {
			if(!isset(self::$connect['server'])) 
				self::$connect['server'] = Core::$host;
			if(!isset(self::$connect['user']))
				self::$connect['user'] = Core::$user;
			if(!isset(self::$connect['pass'])) 
				self::$connect['pass'] = Core::$pass;
			if(!isset(self::$connect['db'])) 
				self::$connect['db'] = Core::$database;
			
			self::$mysqli[$key] = @new MySQLi(self::$connect['server'], self::$connect['user'], self::$connect['pass'], self::$connect['db']);
			
			if(mysqli_connect_errno()) {
				echo 'Не удалось подключится к базе данных';
				exit;
			}
			
			if(!self::$mysqli[$key] -> set_charset("utf8")) {
				echo 'Ошибка при загрузке символов UTF8:'.self::$mysqli[$key]->error.'';
				exit;
			}
		}
		return self::$mysqli[$key];
	}
	static public function close($key) {
		self::$mysqli[$key] -> close();
		unset(self::$mysqli[$key]);
	}
}