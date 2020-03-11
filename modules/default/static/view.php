<?php
$view = q("SELECT * FROM `data_resurse` WHERE `id` = '".(int)$_GET['id']."'");
$set_view = mysqli_fetch_assoc($view);

Core::$meta['title'] = $set_view['title'];
Core::$meta['meta_d'] = $set_view['title'];
Core::$meta['meta_k'] = $set_view['title'];