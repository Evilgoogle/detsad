<script>
  hide();
</script>
<div class="header">Авторизаций</div>
  <div class="content">
  
  <form action="" method="post" enctype="multipart/form-data">
    <div class="table_block_title">
      <div class="table_block_title_info">Логин</div>
      <input type="text" name="login" class="table_block_title_text" value="<?php echo @hc($_POST['login']);?>">
    </div>
    <div class="table_block_title_error">
      <?php if(isset($error['login'])) {?>
        <div class="table_block_title_error_text"><?php echo $error['login'];?></div>
      <?php } else {?>
        <div class="table_block_title_info_text">Введите логин</div>
      <?php } ?>
    </div>
    <div class="claer"></div>
    
    <div class="table_block_meta">
      <div class="table_block_title_info">Пароль</div>
      <input type="password" name="pass" class="table_block_title_text" value="<?php echo @hc($_POST['pass']);?>">
    </div>
    <div class="table_block_title_error">
      <?php if(isset($error['pass'])) {?>
        <div class="table_block_title_error_text"><?php echo $error['pass'];?></div>
      <?php } else {?>
        <div class="table_block_title_info_text">Введите пароль</div>
      <?php } ?>
    </div>
    <div class="claer"></div>
    
    <div class="table_block_meta">
      <div class="table_block_title_info">Запомнить?</div>
      <input type="checkbox" name="check" class="check_save">
    </div>
    <div class="table_block_title_error">
        <div class="table_block_title_info_text">Галочка для автоматической авторизаций</div>
    </div>
    <div class="claer"></div>
    
    <div class="table_block_button">
      <input type="submit" name="ok" class="button_form" value="Войти">
    </div>
  </form>
    
  </div>
</div>