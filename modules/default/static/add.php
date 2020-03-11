<?php
if (isset($_POST['ok'], $_POST['title'], $_POST['text'])) {

	$_POST = trimALL($_POST);

	$error = array();

	if (empty ($_POST['title'])) {
		$error['title'] = 'Вы не ввели названия записи';
	}

	if (empty ($_POST['text'])) {
		$error['text'] = 'Вы не ввели основной текст';
	}

	if($_FILES['file']['error'] != 0) {
		$error['file_not'] = 'Вы не загрузили картину';
	} else {

		Uploader::$uploadDir = '/uploaded/'.$_SESSION['user']['email'].date('Ymd-his').'img'.rand(100000,999999).'';
		Uploader::$uploadDir_Resize = '/uploaded/'.$_SESSION['user']['email'].date('Ymd-his').'img'.rand(100000,999999).'';

	}

	if (!count($error)) {
		////
		$files = array();
		if(count($_FILES)) {
			foreach($_FILES as $files => $val) {
				$file = Uploader::fileUpload($val, 270, 170);
				if($file) {
					////
					$resize = Uploader::copyResize(270, 170);
					if(!$resize) {
						$error['file'] = Uploader::$error;
					}
					////
				} else {
					$error['file'] = Uploader::$error;
				}
			}
			@unlink('.'.Uploader::$uploadDir.Uploader::$format);
		}
		////
	}

	if (!count($error)) {

		q("INSERT INTO `data_resurse` SET
			`title`       = '".ms($_POST['title'])."',
			`text`        = '".ms($_POST['text'])."',
			`date`        = NOW(),
			`img`         = '".ms(Uploader::$uploadDir_Resize.Uploader::$format)."'
		");

		$_SESSION['info'] = 'Запись успешно добавлена';
		header ("location: /static");
		exit();
	}
}