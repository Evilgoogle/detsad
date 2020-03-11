<?php
if (isset($_POST['del'])) {
	
	if (isset($_POST['ids'])) {

		$_POST['ids'] = intALL($_POST['ids']);
		$ids = implode(',', $_POST['ids']);

		//Удаления картины что находиться в паке в папке /uploaded/
		$dell = q("SELECT `img` FROM `data_resurse` WHERE `id` IN (".$ids.")");
		while($set_dell = mysqli_fetch_assoc($dell)) {
			@unlink('.'.$set_dell['img']);
		}
		//Удаления
		q("DELETE FROM `data_resurse` WHERE `id` IN (".$ids.")");
		$_SESSION['info'] = 'Удаление прошла успешно';
		header ('Location: /static');
		exit();
			
	} else {
		$_SESSION['def'] = 'Для удаления нужна отметка';
	}
}

$res = q("SELECT * FROM `data_resurse` ORDER BY `id` DESC");

if (isset($_SESSION['info'])) {
	$add = $_SESSION['info'];
	unset($_SESSION['info']);
}
if (isset($_SESSION['def'])) {
	$def = $_SESSION['def'];
	unset($_SESSION['def']);
}