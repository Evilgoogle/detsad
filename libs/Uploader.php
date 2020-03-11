<?php
class Uploader {
	static $val               = array();
	static $uploadDir         = '/uploaded/';
	static $maxSize           = 5000000;
	static $array_type        = array('image/jpeg','image/jpg','image/gif','image/png');
    static $array_mat         = array('jpeg','jpg','gif','png');
	static $error             = 'Ошибка';
	static $uploadDir_Resize  = '/uploaded/';
	static $match             = '';
	static $format            = '';
	
	static function fileUpload($val, $x, $y) {
		if($val['size'] < 1000 || $val['size'] > self::$maxSize) {
        	self::$error = 'Размер файла не подходит. Можно загружать максимально 2.5Мб';
			return false;
    	} else {
			preg_match('#\.([a-z]+)$#ui',$val['name'],$match);
			if(isset($match[1])) {
				self::$match[1] = mb_strtolower($match[1]);
				
				$temp = getimagesize($val['tmp_name']);
				
				if(!in_array($temp['mime'],self::$array_type)) {
					self::$error = 'Не подходит тип файла, можно загружать только изображений';
					return false;
				} elseif(!in_array($match[1],self::$array_mat)) {
					self::$error = 'Разширение картины не подходит. Можно загружать jpeg,jpg,gif,png';
					return false;
				} elseif(($temp[0] < $x) && ($temp[1] < $y)) {
					self::$error = 'Ширина и высота загружаемой картины меньше '.$x.'x'.$y.'px';
					return false;
				} elseif(($match[1] == 'jpg') || ($match[1] == 'jpeg')) {  
					if(!move_uploaded_file($val['tmp_name'],'.'.self::$uploadDir.'.jpg')) {
						self::$error = 'Изображения не загрузилась';
						return false;
					} else {
						self::$format = '.jpg';
						return true;
					}
				} elseif($match[1] == 'gif') {  
					if(!move_uploaded_file($val['tmp_name'],'.'.self::$uploadDir.'.gif')) {
						self::$error = 'Изображения не загрузилась';
						return false;
					} else {
						self::$format = '.gif';
						return true;
					}
				} elseif($match[1] == 'png') {  
					if(!move_uploaded_file($val['tmp_name'],'.'.self::$uploadDir.'.png')) {
						self::$error = 'Изображения не загрузилась';
						return false;
					} else {
						self::$format = '.png';
						return true;
					}
				}
					
			} else {
				self::$error = 'Разширение картины не подходит. Можно загружать jpeg,jpg,gif,png';
				return false;
			}
		}
	}
	
	static function copyResize($x, $y) {
		if(self::$format == '.jpg') {
			list($width, $height) = getimagesize('.'.self::$uploadDir.self::$format);
		} elseif(self::$format == '.gif') {
			list($width, $height) = getimagesize('.'.self::$uploadDir.self::$format);
		} elseif(self::$format == '.png') {
			list($width, $height) = getimagesize('.'.self::$uploadDir.self::$format);
		} 
		
		$newWidth = ($width - $x)/2;
		$newHeight = ($height - $y)/2;
		
		$newWidth = intval($newWidth);
		$newHeight = intval($newHeight);
		
		$image_p = imagecreatetruecolor($x, $y);
		if((self::$match[1] == 'jpg') || (self::$match[1] == 'jpeg')) {
			$image = imagecreatefromjpeg('.'.self::$uploadDir.self::$format);
			if(!imagecopyresampled($image_p, $image, 0, 0, $newWidth, $newHeight, $width, $height, $width, $height)) {
				self::$error = 'Резайз прошел неудачно';
				return false;
			} else {
				imagejpeg($image_p, '.'.self::$uploadDir_Resize.self::$format,100);
				return true;
			}
		} elseif(self::$match[1] == 'gif') {
			$image = imagecreatefromgif('.'.self::$uploadDir.self::$format);
			imagealphablending($image_p, false);
			imagesavealpha($image_p, true);
			if(!imagecopyresampled($image_p, $image, 0, 0, $newWidth, $newHeight, $width, $height, $width, $height)) {
				self::$error = 'Резайз прошел неудачно';
				return false;
			} else {
				$black = imagecolorallocatealpha($image_p, 0, 0, 0, 127);
				imagecolortransparent($image_p, $black);
				imagegif($image_p, '.'.self::$uploadDir_Resize.self::$format,100);
				return true;
			}
		} elseif(self::$match[1] == 'png') {
			$image = imagecreatefrompng('.'.self::$uploadDir.self::$format);
			imagealphablending($image_p, false);
			imagesavealpha($image_p, true);
			if(!imagecopyresampled($image_p, $image, 0, 0, $newWidth, $newHeight, $width, $height, $width, $height)) {
				self::$error = 'Резайз прошел неудачно';
				return false;
			} else {
				$black = imagecolorallocatealpha($image_p, 0, 0, 0, 127);
				imagecolortransparent($image_p, $black);
				imagegif($image_p, '.'.self::$uploadDir_Resize.self::$format,100);
				return true;
			}
		}

	}
  
}