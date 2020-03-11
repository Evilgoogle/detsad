<div class="header">Объявлений</div>

<?php if (isset($add)) {?>
<script>
var info = '<?php echo $add?>';
show_info_ok(info);
</script>
<?php }
      if (isset($def)) {?>
<script>
var info = '<?php echo $def?>';
show_info_error(info);
</script>
<?php } ?>

<div class="content">
    <?php if (isset($_SESSION['user']) && ($_SESSION['user']['acces'] == 5)) {?>
        <a href="/static/add" class="button_add">Добавить</a>
    <?php }
    while($set_res = mysqli_fetch_assoc($res)) {?>

        <?php if (isset($_SESSION['user']) && ($_SESSION['user']['acces'] == 5||$_SESSION['user']['acces'] == 3)) {?>
            <a href="/static/edit?id=<?php echo hc($set_res['id']);?>" class="button_redak"></a>
            <form action="" method="post">
                <input type="checkbox" name="ids[]" value="<?php echo hc($set_res['id']);?>" class="chek">
                <div class="clear"></div>
        <?php } ?>

        <div class="content_block">
            <div class="pic"><img src="<?php echo hc($set_res['img']);?>"></div>
            <div class="text">
                <h3 class="header"><?php echo hc($set_res['title']);?></h3>
                <div class="block">
                    <img src="/img/cal.jpg">
                </div>
                <a href="/static/view?id=<?php echo hc($set_res['id']);?>">Подробнее</a>
             </div>
         </div>
    <?php }
        if (isset($_SESSION['user']) && ($_SESSION['user']['acces'] == 5||$_SESSION['user']['acces'] == 3)) {?>
            <input type="submit" name="del" value="Удалить" class="button_form">
        <?php } ?>
        </form>
</div>