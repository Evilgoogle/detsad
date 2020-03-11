<?php
if (isset($_POST['ok'], $_POST['title'], $_POST['text'])) {

	$_POST = trimALL($_POST);

	$error = array();

	if (empty ($_POST['title'])) {
		$error ['title'] = 'Названия не может быть пустым';
	}

	if (empty ($_POST['text'])) {
		$error ['text'] = 'Основной текст не может быть пустым';
	}

	if($_FILES['file']['error'] == 0) {
		Uploader::$uploadDir = '/uploaded/'.$_SESSION['user']['email'].date('Ymd-his').'img'.rand(100000,999999).'';
		Uploader::$uploadDir_Resize = '/uploaded/'.$_SESSION['user']['email'].date('Ymd-his').'img'.rand(100000,999999).'';

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
						} else {
							$dell = q("SELECT `img` FROM `data_resurse` WHERE `id` = '".(int)$_GET['id']."' LIMIT 1");
							$set_dell = mysqli_fetch_assoc($dell);
							@unlink('.'.$set_dell['img']);

							q("UPDATE `data_resurse` SET
								`img`       = '".ms(Uploader::$uploadDir_Resize.Uploader::$format)."'
								WHERE `id`    = '".(int)$_GET['id']."'
							");
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

	}

	if (!count($error)) {

		q("UPDATE `data_resurse` SET
			`title`       = '".ms($_POST['title'])."',
			`text`        = '".ms($_POST['text'])."',
			`date`        = NOW()
			WHERE `id`    = '".(int)$_GET['id']."'
		");

		$_SESSION['info'] = 'Запись успешно отредактировано';
		header ("location: /static");
		exit();
	}
}

$res = q("
	SELECT *
	FROM `data_resurse`
	WHERE `id` = '".(int)$_GET['id']."'
	LIMIT 1
");

if (!mysqli_num_rows($res)) {
	$_SESSION['info'] = 'Данной страницы не существует';
	header ("location: /static");
	exit();
} else {
	$set = mysqli_fetch_assoc($res);
}