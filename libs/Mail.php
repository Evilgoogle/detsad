<?php
class Mail {
	static $subject = 'protect.96.lt';
	static $from = 'evil@protect.96.lt';
	static $to = 'evilgoogle@mail.ru';
	static $text = 'Текст';
	static $headers = '';
	   
	static function send() {
		self::$subject = '=?utf-8?b?'. base64_encode(self::$subject) . '?=';
		self::$headers = "Content-type: text/html; charset=\"utf-8\"\r\n"; 
		self::$headers .= "From: ".self::$from."\r\n";
		self::$headers .= "MIME_Version: 1.0\r\n";
		self::$headers .= "Date: ". date('D, d M Y h:i:s O'). "\r\n"; 
		self::$headers .= "Precedence: bulk\r\n";
			
		return mail (self::$to, self::$subject, self::$text, self::$headers);  
	}
	     
	static function testMail() {
		return mail(self::$to, self::$subject, self::$text); 
	}
  
}