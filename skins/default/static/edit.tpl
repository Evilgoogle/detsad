<script>
  hide();
</script>
<div class="header">Редактирования записи - <?php echo hc($set['title']);?></span></div>
<div class="content">

  <form action="" method="post" enctype="multipart/form-data">
    <div class="table_block_title">
      <div class="table_block_title_info">Названия</div>
      <input type="text" name="title" class="table_block_title_text" value="<?php echo @hc($set['title']);?>">
    </div>
    <div class="table_block_title_error">
      <?php if(isset($error['title'])) {?>
        <div class="table_block_title_error_text"><?php echo $error['title'];?></div>
      <?php } else {?>
        <div class="table_block_title_info_text">Редактируйте названия записи</div>
      <?php } ?>
    </div>
    <div class="claer"></div>

    <div class="table_block_text">
      <div class="table_block_title_info">Основной текст</div>
      <textarea id="editor_text" name="text" class="new_add_blockn_des"><?php echo @$set['text'];?></textarea>
      <script>
        CKEDITOR.replace( 'editor_text', {
          extraPlugins: 'magicline',	// Ensure that magicline plugin, which is required for this sample, is loaded.
          allowedContent: true		// Switch off the ACF, so very complex content created to
          // show magicline's power isn't filtered.
        } );
      </script>
    </div>
    <?php if(isset($error['text'])) {?>
      <div class="table_block_title_error_text_text"><?php echo $error['text'];?></div>
    <?php } else {?>
      <div class="table_block_title_info_text_text">Основной текст записи</div>
    <?php } ?>
    <div class="clear"></div>

    <div class="table_block_title">
      <div class="table_block_title_info">Превью рисунок</div>
      <input type="file" name="file">
    </div>
    <div class="table_block_title_error">
      <?php if(isset($error['file_not'])) {?>
        <div class="table_block_title_error_text"><?php echo $error['file_not'];?></div>
      <?php } elseif(isset($error['file'])) {?>
        <div class="table_block_title_error_text"><?php echo $error['file'];?></div>
      <?php } else {?>
        <div class="table_block_title_info_text">Не обязательно! Новая загруженная картина сменит предведущую</div>
      <?php } ?>
    </div>
    <div class="claer"></div>

    <div class="table_block_button">
      <input type="submit" name="ok" class="button_form" value="Редактировать">
    </div>
  </form>

</div>