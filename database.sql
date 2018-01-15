-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 01 2016 г., 17:23
-- Версия сервера: 5.5.49-0+deb8u1-log
-- Версия PHP: 7.0.6-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(1) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin`
--

INSERT INTO `admin` (`id`, `login`, `password`, `secret`) VALUES
(1, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `auth`
--

CREATE TABLE `auth` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `meta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bad_auth`
--

CREATE TABLE `bad_auth` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `banner`
--

CREATE TABLE `banner` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `date_add` int(255) NOT NULL,
  `last_view` int(255) NOT NULL,
  `views` int(255) NOT NULL,
  `balance` float(11,4) NOT NULL,
  `active` int(1) NOT NULL,
  `price` float(11,4) NOT NULL,
  `frame` int(1) NOT NULL DEFAULT '1',
  `to_next` int(255) NOT NULL,
  `vip` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `banner_configs`
--

CREATE TABLE `banner_configs` (
  `id` int(255) NOT NULL,
  `banner_id` int(255) NOT NULL,
  `one_time` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `banner_history`
--

CREATE TABLE `banner_history` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `block_id` int(255) NOT NULL,
  `time` int(255) NOT NULL,
  `to_next` int(255) NOT NULL,
  `money` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_blocked`
--

CREATE TABLE `chat_blocked` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cause` varchar(200) NOT NULL,
  `blocker_id` int(11) NOT NULL,
  `date_block` int(11) NOT NULL,
  `hidden` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `text` varchar(500) NOT NULL,
  `date_add` int(11) NOT NULL,
  `freezed` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_moderators`
--

CREATE TABLE `chat_moderators` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `competition`
--

CREATE TABLE `competition` (
  `id` int(11) NOT NULL,
  `active_id` int(11) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `competition`
--

INSERT INTO `competition` (`id`, `active_id`, `active`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `competitions`
--

CREATE TABLE `competitions` (
  `id` int(11) NOT NULL,
  `money_1` int(11) NOT NULL,
  `money_2` int(11) NOT NULL,
  `money_3` int(11) NOT NULL,
  `winner_1` int(11) NOT NULL,
  `winner_2` int(11) NOT NULL,
  `winner_3` int(11) NOT NULL,
  `time_close` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `competition_users`
--

CREATE TABLE `competition_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `money` float NOT NULL,
  `competition_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `pay_type` int(1) NOT NULL,
  `min_pay` int(11) NOT NULL,
  `back_auto` int(11) NOT NULL,
  `margin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`id`, `pay_type`, `min_pay`, `back_auto`, `margin`) VALUES
(1, 3, 1, 50, 30);

-- --------------------------------------------------------

--
-- Структура таблицы `inserts`
--

CREATE TABLE `inserts` (
  `id` int(11) NOT NULL,
  `op_id` int(11) NOT NULL,
  `money` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `date_op` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `inserts_ops`
--

CREATE TABLE `inserts_ops` (
  `id` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `date_op` int(11) NOT NULL,
  `type_op` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `link`
--

CREATE TABLE `link` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `balance` float(11,2) NOT NULL,
  `views` int(255) NOT NULL,
  `last_view` int(255) NOT NULL,
  `date_add` int(255) NOT NULL,
  `active` int(1) NOT NULL,
  `price` double(22,4) NOT NULL,
  `frame` int(1) NOT NULL DEFAULT '1',
  `to_next` int(255) NOT NULL,
  `vip` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `link_configs`
--

CREATE TABLE `link_configs` (
  `id` int(255) NOT NULL,
  `link_id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `link_history`
--

CREATE TABLE `link_history` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `block_id` int(11) NOT NULL,
  `time` int(255) NOT NULL,
  `to_next` int(255) NOT NULL,
  `money` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `packages`
--

CREATE TABLE `packages` (
  `id` int(255) NOT NULL,
  `price` float NOT NULL,
  `count` int(255) NOT NULL,
  `category` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `money` float NOT NULL,
  `purse` varchar(255) NOT NULL,
  `date_op` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `recovery`
--

CREATE TABLE `recovery` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `support`
--

CREATE TABLE `support` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `theme` varchar(100) NOT NULL,
  `date_add` int(11) NOT NULL,
  `last_msg` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `support_msg`
--

CREATE TABLE `support_msg` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `author` int(1) NOT NULL,
  `date_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `temporary_buy`
--

CREATE TABLE `temporary_buy` (
  `id` int(11) NOT NULL,
  `op_id` int(11) NOT NULL,
  `type` varchar(55) NOT NULL,
  `money` float NOT NULL,
  `item_id` int(11) NOT NULL,
  `date_buy` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ref` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_reg` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `last` int(11) NOT NULL DEFAULT '0',
  `c_o` int(11) NOT NULL,
  `ban` int(1) NOT NULL DEFAULT '1',
  `refs` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_conf`
--

CREATE TABLE `users_conf` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `b_pur` float(10,4) NOT NULL,
  `b_out` float(10,4) NOT NULL,
  `payeer` varchar(11) NOT NULL DEFAULT '0',
  `httpref` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_ref`
--

CREATE TABLE `users_ref` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_1` int(11) NOT NULL,
  `ref_2` int(11) NOT NULL,
  `ref_3` int(11) NOT NULL,
  `to_ref_1` float NOT NULL,
  `to_ref_2` float NOT NULL,
  `to_ref_3` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth`
--
ALTER TABLE `auth`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id` (`id`);

--
-- Индексы таблицы `bad_auth`
--
ALTER TABLE `bad_auth`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `banner`
--
ALTER TABLE `banner`
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Индексы таблицы `banner_configs`
--
ALTER TABLE `banner_configs`
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Индексы таблицы `banner_history`
--
ALTER TABLE `banner_history`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id6` (`id`);

--
-- Индексы таблицы `chat_blocked`
--
ALTER TABLE `chat_blocked`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id7` (`id`);

--
-- Индексы таблицы `chat_moderators`
--
ALTER TABLE `chat_moderators`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `competition_users`
--
ALTER TABLE `competition_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `inserts`
--
ALTER TABLE `inserts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `inserts_ops`
--
ALTER TABLE `inserts_ops`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `link`
--
ALTER TABLE `link`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id2` (`id`);

--
-- Индексы таблицы `link_configs`
--
ALTER TABLE `link_configs`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id3` (`id`);

--
-- Индексы таблицы `link_history`
--
ALTER TABLE `link_history`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id5` (`id`);

--
-- Индексы таблицы `packages`
--
ALTER TABLE `packages`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `index_id1` (`id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recovery`
--
ALTER TABLE `recovery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `support_msg`
--
ALTER TABLE `support_msg`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `temporary_buy`
--
ALTER TABLE `temporary_buy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Индексы таблицы `users_conf`
--
ALTER TABLE `users_conf`
  ADD UNIQUE KEY `unique_id` (`id`),
  ADD KEY `index_id4` (`id`);

--
-- Индексы таблицы `users_ref`
--
ALTER TABLE `users_ref`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `bad_auth`
--
ALTER TABLE `bad_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `banner_configs`
--
ALTER TABLE `banner_configs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `banner_history`
--
ALTER TABLE `banner_history`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `chat_blocked`
--
ALTER TABLE `chat_blocked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `chat_moderators`
--
ALTER TABLE `chat_moderators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `competition`
--
ALTER TABLE `competition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `competition_users`
--
ALTER TABLE `competition_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `inserts`
--
ALTER TABLE `inserts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `inserts_ops`
--
ALTER TABLE `inserts_ops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `link`
--
ALTER TABLE `link`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `link_configs`
--
ALTER TABLE `link_configs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `link_history`
--
ALTER TABLE `link_history`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `recovery`
--
ALTER TABLE `recovery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `support_msg`
--
ALTER TABLE `support_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `temporary_buy`
--
ALTER TABLE `temporary_buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users_conf`
--
ALTER TABLE `users_conf`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users_ref`
--
ALTER TABLE `users_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
