-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 31 2020 г., 14:56
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `g982257e_iot`
--
CREATE DATABASE IF NOT EXISTS `g982257e_iot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `g982257e_iot`;

-- --------------------------------------------------------

--
-- Структура таблицы `analysis`
--
-- Создание: Май 07 2020 г., 11:37
--

DROP TABLE IF EXISTS `analysis`;
CREATE TABLE `analysis` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `mean` decimal(10,5) NOT NULL,
  `var` decimal(10,5) NOT NULL,
  `CoefficientVariation` decimal(10,5) NOT NULL,
  `model` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `homes`
--
-- Создание: Апр 30 2020 г., 09:08
--

DROP TABLE IF EXISTS `homes`;
CREATE TABLE `homes` (
  `HomeId` int(11) NOT NULL,
  `Area` decimal(15,5) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `homes`
--

INSERT INTO `homes` (`HomeId`, `Area`, `Description`, `Created_at`) VALUES
(1, '98.00000', 'Тестовый дом № 1', '2020-04-30 13:32:30');

-- --------------------------------------------------------

--
-- Структура таблицы `mqtt_client`
--
-- Создание: Мар 27 2020 г., 19:45
--

DROP TABLE IF EXISTS `mqtt_client`;
CREATE TABLE `mqtt_client` (
  `clientId` int(11) NOT NULL,
  `connected_at` datetime NOT NULL,
  `diconnected_at` datetime NOT NULL,
  `keep_alive` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `residents`
--
-- Создание: Апр 30 2020 г., 08:35
--

DROP TABLE IF EXISTS `residents`;
CREATE TABLE `residents` (
  `ResidentId` int(11) NOT NULL,
  `Gender` int(1) NOT NULL,
  `Age` int(3) NOT NULL,
  `HomeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `residents`
--

INSERT INTO `residents` (`ResidentId`, `Gender`, `Age`, `HomeId`) VALUES
(1, 0, 28, 1),
(2, 1, 31, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--
-- Создание: Апр 30 2020 г., 09:09
-- Последнее обновление: Май 25 2020 г., 11:12
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `RoomId` int(11) NOT NULL,
  `RoomType` int(11) NOT NULL,
  `Length` decimal(8,5) NOT NULL,
  `Width` decimal(8,5) NOT NULL,
  `Height` decimal(8,5) NOT NULL,
  `HomeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`RoomId`, `RoomType`, `Length`, `Width`, `Height`, `HomeId`) VALUES
(1, 1, '4.00000', '3.00000', '2.20000', 1),
(2, 9, '8.00000', '4.00000', '2.20000', 1),
(3, 16, '3.60000', '4.20000', '2.30000', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `room_types`
--
-- Создание: Мар 27 2020 г., 13:27
--

DROP TABLE IF EXISTS `room_types`;
CREATE TABLE `room_types` (
  `RoomTypeId` int(11) NOT NULL,
  `RoomName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `room_types`
--

INSERT INTO `room_types` (`RoomTypeId`, `RoomName`) VALUES
(1, 'Кухня'),
(2, 'Кабинет'),
(3, 'Гардеробная'),
(4, 'Кладовая'),
(5, 'Прачечная'),
(6, 'Мастерская'),
(7, 'Игровая комната'),
(8, 'Тренажерный зал'),
(9, 'Гостиная'),
(10, 'Гостевая комната'),
(11, 'Кинозал'),
(12, 'Домик в саду'),
(13, 'Столовая'),
(14, 'Спальня'),
(15, 'Чердак'),
(16, 'Ванная комната'),
(17, 'Подвал'),
(18, 'Библиотека'),
(19, 'Балкон'),
(20, 'Гараж'),
(21, 'Уборная'),
(22, 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `sensors`
--
-- Создание: Май 31 2020 г., 11:12
-- Последнее обновление: Май 31 2020 г., 11:09
--

DROP TABLE IF EXISTS `sensors`;
CREATE TABLE `sensors` (
  `SensorId` int(11) NOT NULL,
  `SensorName` varchar(30) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `SensorType` int(11) NOT NULL,
  `RoomId` int(11) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `url_image` varchar(300) NOT NULL,
  `url_csv` varchar(100) NOT NULL,
  `frequency` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sensors`
--

INSERT INTO `sensors` (`SensorId`, `SensorName`, `Description`, `SensorType`, `RoomId`, `Topic`, `url_image`, `url_csv`, `frequency`, `isActive`) VALUES
(1, 'Датчик температуры', 'Датчик, отслеживающий температуру воздуха на уровне потолка.', 1, 1, 'home1/kitchen/Temperature/T1', 'null', 'Temperature_kitchen', 5, 1),
(2, 'Датчик освещённости', 'Датчик освещённости настенной лампы.', 5, 2, 'home1/kitchen/Light/L2', 'null', 'Light_living_room', 5, 0),
(3, 'Датчик влажности', 'Датчик, отслеживающий влажность в ванной комнате', 2, 3, 'home1/bathroom/Humidity/H1', 'null', 'Humidity_bathroom', 10, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `sensor_actions`
--
-- Создание: Апр 30 2020 г., 06:54
--

DROP TABLE IF EXISTS `sensor_actions`;
CREATE TABLE `sensor_actions` (
  `ActionId` int(11) NOT NULL,
  `ActionName` varchar(50) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `SensorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sensor_types`
--
-- Создание: Мар 27 2020 г., 13:43
--

DROP TABLE IF EXISTS `sensor_types`;
CREATE TABLE `sensor_types` (
  `SensorTypeId` int(11) NOT NULL,
  `SensorTypeName` varchar(50) NOT NULL,
  `isActuator` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sensor_types`
--

INSERT INTO `sensor_types` (`SensorTypeId`, `SensorTypeName`, `isActuator`) VALUES
(1, 'Temperature', 0),
(2, 'Humidity', 0),
(3, 'Power', 0),
(4, 'Light 1', 1),
(5, 'Light 2', 1),
(6, 'Light 3', 1),
(7, 'Air Condition', 1),
(8, 'TV', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `analysis`
--
ALTER TABLE `analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_analysis_sensorid` (`sensor_id`);

--
-- Индексы таблицы `homes`
--
ALTER TABLE `homes`
  ADD PRIMARY KEY (`HomeId`);

--
-- Индексы таблицы `mqtt_client`
--
ALTER TABLE `mqtt_client`
  ADD PRIMARY KEY (`clientId`);

--
-- Индексы таблицы `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`ResidentId`),
  ADD KEY `FK_residents_homeid` (`HomeId`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`RoomId`),
  ADD KEY `FK_rooms_rmtype` (`RoomType`),
  ADD KEY `FK_rooms_homeid` (`HomeId`);

--
-- Индексы таблицы `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`RoomTypeId`);

--
-- Индексы таблицы `sensors`
--
ALTER TABLE `sensors`
  ADD PRIMARY KEY (`SensorId`),
  ADD KEY `FK_sensors_roomid` (`RoomId`),
  ADD KEY `FK_sensors_senstype` (`SensorType`);

--
-- Индексы таблицы `sensor_actions`
--
ALTER TABLE `sensor_actions`
  ADD PRIMARY KEY (`ActionId`),
  ADD KEY `FK_sensor_actions_sensId` (`SensorId`);

--
-- Индексы таблицы `sensor_types`
--
ALTER TABLE `sensor_types`
  ADD PRIMARY KEY (`SensorTypeId`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `analysis`
--
ALTER TABLE `analysis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `homes`
--
ALTER TABLE `homes`
  MODIFY `HomeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mqtt_client`
--
ALTER TABLE `mqtt_client`
  MODIFY `clientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `residents`
--
ALTER TABLE `residents`
  MODIFY `ResidentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rooms`
--
ALTER TABLE `rooms`
  MODIFY `RoomId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `room_types`
--
ALTER TABLE `room_types`
  MODIFY `RoomTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `sensors`
--
ALTER TABLE `sensors`
  MODIFY `SensorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sensor_actions`
--
ALTER TABLE `sensor_actions`
  MODIFY `ActionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sensor_types`
--
ALTER TABLE `sensor_types`
  MODIFY `SensorTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `analysis`
--
ALTER TABLE `analysis`
  ADD CONSTRAINT `FK_analysis_sensorid` FOREIGN KEY (`sensor_id`) REFERENCES `sensors` (`SensorId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `residents`
--
ALTER TABLE `residents`
  ADD CONSTRAINT `FK_residents_homeid` FOREIGN KEY (`HomeId`) REFERENCES `homes` (`HomeId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK_rooms_homeid` FOREIGN KEY (`HomeId`) REFERENCES `homes` (`HomeId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_rooms_rmtype` FOREIGN KEY (`RoomType`) REFERENCES `room_types` (`RoomTypeId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sensors`
--
ALTER TABLE `sensors`
  ADD CONSTRAINT `FK_sensors_roomid` FOREIGN KEY (`RoomId`) REFERENCES `rooms` (`RoomId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_sensors_senstype` FOREIGN KEY (`SensorType`) REFERENCES `sensor_types` (`SensorTypeId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sensor_actions`
--
ALTER TABLE `sensor_actions`
  ADD CONSTRAINT `FK_sensor_actions_sensId` FOREIGN KEY (`SensorId`) REFERENCES `sensors` (`SensorId`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
