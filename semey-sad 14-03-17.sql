
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 14 2017 г., 03:13
-- Версия сервера: 10.1.21-MariaDB
-- Версия PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `u216864292_sad`
--

-- --------------------------------------------------------

--
-- Структура таблицы `data_resurse`
--

CREATE TABLE IF NOT EXISTS `data_resurse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `data_resurse`
--

INSERT INTO `data_resurse` (`id`, `title`, `text`, `date`, `img`) VALUES
(2, 'Конкурс по приобретению продуктов питания на 2017', '<p><img alt="" src="http://s48.radikal.ru/i122/1703/e6/4690b764d47c.jpg" style="width: 1050px; height: 1545px;" /></p>\r\n\r\n<p><img alt="" src="http://s010.radikal.ru/i313/1703/f6/d3c326996d2e.jpg" style="width: 1050px; height: 713px;" /></p>\r\n\r\n<p><img alt="" src="http://s020.radikal.ru/i709/1703/e4/17c3b7517d36.jpg" style="width: 1050px; height: 762px;" /></p>\r\n\r\n<p><img alt="" src="http://s020.radikal.ru/i718/1703/1d/5eaaa8859d7c.jpg" style="width: 1050px; height: 808px;" /></p>\r\n\r\n<p><img alt="" src="http://s019.radikal.ru/i608/1703/fe/b192b06ff4a2.jpg" style="width: 1050px; height: 870px;" /></p>\r\n\r\n<p><img alt="" src="http://s008.radikal.ru/i304/1703/d2/f21378e04d47.jpg" style="width: 1050px; height: 884px;" /></p>\r\n\r\n<p><img alt="" src="http://s018.radikal.ru/i504/1703/b3/27268cb51bf3.jpg" style="width: 1050px; height: 895px;" /></p>\r\n\r\n<p><img alt="" src="http://s019.radikal.ru/i641/1703/98/d1f9c57e4a8a.jpg" style="width: 1050px; height: 884px;" /></p>\r\n\r\n<p>&nbsp;</p>', '2017-02-10', '/uploaded/adminsad@mail.ru20170212-033122img341388.png');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `time_user` datetime NOT NULL,
  `acces` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `active`, `time_user`, `acces`, `email`) VALUES
(2, 'Admin-sad', 'c2M730BHBgfmU', 1, '2017-03-02 09:39:13', 5, 'adminsad@mail.ru');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
