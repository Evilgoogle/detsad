<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?php echo hc(Core::$meta['title']);?></title>
<meta name="description" content="<?php echo hc(Core::$meta['meta_d']);?>">
<meta name="keywords" content="<?php echo hc(Core::$meta['meta_k']);?>">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<!--JQuery-->
<script src="/vendor/public/jquery/dist/jquery.min.js"></script>
<!--ckeditor-->
<script src="/vendor/ckeditor/ckeditor/ckeditor.js"></script>
<!---->
    <script>
        show();
    </script>
    <!--Funcybox-->
    <!-- Добавляем плагин для управления мышкой -->
    <script type="text/javascript" src="/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Файлы скрипта fancyBox -->
    <link rel="stylesheet" href="/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <script type="text/javascript" src="/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $("a[rel=galery]").fancybox({
                'transitionIn' : 'none',
                'transitionOut' : 'none',
                'titlePosition' : 'over',
                'titleFormat' : function(title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        });
    </script>
    <!---->
<script src="/skins/default/js/js_code.js"></script>
<?php if(count(Core::$css)) {echo implode("\n", Core::$css);}?>
<?php if(count(Core::$js)) {echo implode("\n", Core::$js);}?>
</head>

<body>
<div  id="disp_ok" class="disp_ok">
    <div>
        <div id="disp_info_ok" class="disp_info_ok"></div>
        <div id="disp_x" class="disp_x_ok" onClick="cls();"></div>
    </div>
</div>
<div id="disp_error" class="disp_error">
    <div>
        <div id="disp_info_error" class="disp_info_error"></div>
        <div id="disp_x" class="disp_x_error" onClick="cls();"></div>
    </div>
</div>

<header>
    <div class="block">
        <div class="block_left">
            <div>
                <img src="/img/logo.png">
                <a href="/">Semey-Sad</a>
                <p>Город <span class="green">Семей</span></p>
            </div>
            <div class="text">
                Коммунальное Государственное дошкольное учреждение
                <span>ДЕТСКИЙ САД 15</span>
            </div>
        </div>
        <div class="block_right">
            <div class="text">Контакты:</div>
            <div class="block_fon">
                <img src="/img/fon100.png">
                <p>77-10-18</p>
            </div>
            <div class="block_mail">
                <a  href="mailto:gdy_15@mail.ru" src="/img/mail100.png"></a>
                <p>gdy_15@mail.ru</p>
            </div>
            <?php if(!isset($_SESSION['user'])) {?>
                <a href="/cab/authorization" class="login">Войти</a>
            <?php } elseif($_SESSION['user']['acces'] == 5) {?>
                <div class="log">Режим CMS</div>
                <a href="/cab/exit" class="login">Выход</a>
            <?php } ?>
        </div>
    </div>
</header>

<div id="content" class="content">
    <div class="img">
        <img src="/img/cont1.jpg">
        <img src="/img/cont3.jpg">
        <img src="/img/cont2.jpg">
        <img src="/img/cont4.jpg">
    </div>
    <div class="block">
        <div class="block1">
            <p class="header_p">
                Фиксированная
                цена
            </p>
            <div>Не изменится за время обучения</div>
            <img src="/img/icon1-100.png">
        </div>
        <div class="block2">
            <p class="header_p">Время работы</p>
            <div>
                C 7/00 до 19/00
            </div>
            <img src="/img/icon2-100.png">
        </div>
        <div class="block3">
            <p class="header_p">Питания</p>
            <div>
                5-разовое
                здоровое
                питание
            </div>
            <img src="/img/icon3-100.png">
        </div>
        <div class="block4">
            <p class="header_p">Воспитатели</P>
            <div>
                Воспитатели с высшим пед.образованием
                ведут на 2 языках
                (казахский, русский)
            </div>
            <img src="/img/icon4-100.png">
        </div>
    </div>
</div>

<main>
    <div id="block_content1" class="block_content">
        <div class="block">
            <div class="float1">
                <div class="header"><img src="/img/logo.png"> <span>Наша учреждения</span></div>
                <div class="text">
                    <p>
                        <b>КГДУ "Детский сад № 15"</b>  санаторно-туберкулезного типа.
                        Дети поступают по направлению областного противотуберкулезного диспансера для оздоровления,
                        сроком  от 3-6 месяцев до 1 года с диагнозом: инфицированный контакт, вираж туберкулиновых проб,
                        гиперпроба, перенесенный туберкулез.
                        Таким образом, в детском саду находятся дети из  малообеспеченных,
                        многодетных семей и семей, где  родители  больны различными формами туберкулеза и находятся на лечении в ОПТД.
                    </p>
                    <p>
                        Все дети, посещающие детский сад, состоят на учете  в областном противотуберкулезном диспансере.
                        Плановый набор детей - 120 детей
                        Фактически количество детей  на 01. 01.2016  составляет – 120 детей.
                        Детей стоящих  в очереди нет. Наполняемость групп осуществляет областной противотуберкулезный диспансер.
                        Прием детей с 2,8 до 6 лет. Режим работы КГДУ "Детский сад № 15"  - пятидневный , 12 часов.
                    </p>
                    <p>
                        <span>Родительской оплаты не существует т.к. деятельность учреждения полностью финансируется из бюджета.</span>
                    </p>
                </div>
            </div>
            <div class="float2">
                <img src="/img/con_base.jpg">
                <div class="text">
                    <p class="header">3 группы с государственным языком обучения:</p>
                    <p>младший возраст  - группа «<b>Балбөбек</b>»;</p>
                    <p>средний возраст – группа  «<b>Айгөлек</b>»;</p>
                    <p>старший возраст – группа «<b>Ақ бота</b>».</p>

                    <p class="header">3 группы с русским языком обучения:</p>
                    <p>младший возраст  - группа «<b>Арлекино</b>»;</p>
                    <p>средний возраст – группа  «<b>Звездочка</b>»;</p>
                    <p>старший возраст – группа «<b>Улыбка</b>».</p>
                </div>
            </div>
        </div>
    </div>
    <div id="block_content2" class="block_content2">
        <div class="header">Проектная мощность</div>
        <div class="text">
            До 1999 г. санаторное дошкольное учреждение располагалось в неприспособленном
            для детского сада помещении. В августе 1999 г.
            получили типовое здание бывшего детского сада «Вишенка», построенного в 1968 год.
            Это здание старого типа, рассчитанное на 280 мест (12 групп) с дневным пребыванием,
            находится по адресу: 20 квартал д. 5 «А».
            В котором,  не предусмотрены отдельные помещения для спальных комнат.
            Уменьшение количества групп произошло за счет выделения отдельных помещений
            для сна детей, согласно Санитарно-эпидемиологических
            требований к содержанию и эксплуатации дошкольных учреждений организаций образования
        </div>
    </div>
    <div id="block_content3" class="block_content3">
        <div class="block">
            <div class="float1">
                <div class="header">Финансирование</div>
                <div class="text">
                    <p>
                        <b>Основным</b> - для оздоровления детей является полноценное, сбалансированное, рациональное питание.
                        На основании  санитарных правил   и принимая во внимание примерное меню для тубинфицированных
                        детей дошкольного возраста на оздоровительный период, и норм питания для санаторных садов
                        РК диетсестрой разрабатывается 10-дневное перспективное меню и утверждается  в УГСЭН .
                    </p>
                    <p>
                        Ежедневно в рационе питания ослабленных детей фрукты, соки.
                        В летний период дополнительно включаем – кумыс, который необходим для детей,
                        подверженных риску заболевания туберкулёзом.  Выделенной суммы из бюджета на питание достаточно
                    </p>
                    <p>
                        Для улучшения материально-технической базы в  <b>КГДУ "Детский сад № 15"</b> создана инициативная
                        группа «<b>Болашак</b>» из администрации, сотрудников и родителей детского сада, которая
                        проводит большую работу по проектам. Все проекты  успешно реализованы через посольства Японии,
                        Швейцарии, Ассоциацию деловых женщин г. Семей.
                    </p>
                    <p>
                        Благодаря этой деятельности в <b>КГДУ "Детский сад № 15"</b> полностью заменена система отопления,
                        заменено кухонное и прачечное оборудование.
                        В 2012 году сделан капитальный ремонт.
                        За май-июнь 2012г. было заменено 102 деревянных окна морально и физически
                        устаревших на новые пластиковые окна с 3- камерными пакетами со сложными и простыми открываниями,
                        с сетками и отливами на каждое окно. В каждом окне сделаны откосы из влагоустойчивого гипсокартона.
                    </p>
                    <p>
                        Во всех групповых и приемных помещениях
                        детского сада установлены стационарные и передвижные кварцевые лампы для  обеззараживания воздуха.
                    </p>
                </div>
            </div>
            <div class="float2">
                <img src="/img/con_base3.jpg">
                <div class="text">
                    <p class="header"><b>В 2012 году  бюджетом на содержание</b> <br>
                        дошкольного учреждения выделено<br>
                        <b>56 168 000</b> тенге<br>
                        (в том числе соц. налог, оплата ком. услуг, зарплата)
                    </p>
                    <p p class="header"><b>В 2012 году на питание выделено <br>14 381 000</b>  тенге</p>
                    <p>Фактически расходуется в среднем в день  на одного ребенка – 500 тенге.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="block_mvc"><?php echo $content; ?></div>
</main>

<div id="gallery" class="gallery">
    <div class="header">ГАЛЕРЕЯ</div>
    <div class="block">
        <a rel="galery" href="/img/kat1.jpg" class="a1"><img src="/img/kat1.jpg" alt="pic" class="pic1"></a>
        <a rel="galery" href="/img/kat2.jpg" class="a2"><img src="/img/kat2.jpg" alt="pic" class="pic2"></a>
    </div>
</div>

<footer>
    <div class="block">
        <div class="header">КОНТАКТЫ</div>
        <div class="block1">
            <div class="text">
                <p><span>Заведующая:</span> Шакшаева Нурсулу Муслинаева</p>
                <div class="text_block">
                    <img src="/img/fon100.png">
                    <p> 77-18-44</p>
                </div>
                <div class="text_block">
                    <img src="/img/home100.png">
                    <p> 35-15-37</p>
                </div>
                <div class="text_block">
                    <img src="/img/tel100.png">
                    <p> 8 705 443 76 07</p>
                </div>
            </div>
        </div>
        <div class="block2">
            <div class="text">
                <p><span>Бухгалтер:</span> Нурмадиева Жамал Закаьяновна</p>
                <div class="text_block">
                    <img src="/img/fon100.png">
                    <p> 77-10-87 (факс)</p>
                </div>
                <div class="text_block">
                    <img src="/img/home100.png">
                    <p> 33-61-51</p>
                </div>
                <div class="text_block">
                    <img src="/img/tel100.png">
                    <p> 8 705 460 30 52</p>
                </div>
            </div>
        </div>

    </div>
    <div class="down">
        <b>Адрес:</b> г. СЕМЕЙ, 20 квартал, дом 5а. <b>Почта:</b> индекс 071407
    </div>
</footer>
</body>

</html>