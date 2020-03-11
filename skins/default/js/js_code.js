//Basic
function show_del() {
	var del = confirm('Вы хотите удалить выбранное');
	if(del) {
		return true;
	} else {
		return false;
	}
}

function show_info_ok(info) {
	document.getElementById('disp_ok').style.display = 'block';
	document.getElementById('disp_info_ok').innerHTML = info;
}

function show_info_error(info) {
	document.getElementById('disp_error').style.display = 'block';
	document.getElementById('disp_info_error').innerHTML = info;
}

function cls() {
	document.getElementById('disp_ok').style.display = 'none';
	document.getElementById('disp_info_ok').innerHTML = '';
	document.getElementById('disp_error').style.display = 'none';
	document.getElementById('disp_info_error').innerHTML = '';
}

function show() {
	document.getElementById('content').style.display = 'block';
	document.getElementById('block_content1').style.display = 'block';
	document.getElementById('block_content2').style.display = 'block';
	document.getElementById('block_content3').style.display = 'block';
}

function hide() {
	document.getElementById('content').style.display = 'none';
	document.getElementById('block_content1').style.display = 'none';
	document.getElementById('block_content2').style.display = 'none';
	document.getElementById('block_content3').style.display = 'none';
}