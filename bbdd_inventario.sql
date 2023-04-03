-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2023 a las 05:25:48
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bbdd_inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add facturas', 7, 'add_facturas'),
(26, 'Can change facturas', 7, 'change_facturas'),
(27, 'Can delete facturas', 7, 'delete_facturas'),
(28, 'Can view facturas', 7, 'view_facturas'),
(29, 'Can add usuario', 8, 'add_usuario'),
(30, 'Can change usuario', 8, 'change_usuario'),
(31, 'Can delete usuario', 8, 'delete_usuario'),
(32, 'Can view usuario', 8, 'view_usuario'),
(33, 'Can add historial facturas', 9, 'add_historialfacturas'),
(34, 'Can change historial facturas', 9, 'change_historialfacturas'),
(35, 'Can delete historial facturas', 9, 'delete_historialfacturas'),
(36, 'Can view historial facturas', 9, 'view_historialfacturas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backendapi_facturas`
--

CREATE TABLE `backendapi_facturas` (
  `ID_Facturas` int(11) NOT NULL,
  `Monto_Solicitado` decimal(10,2) NOT NULL,
  `Tasa` decimal(10,2) NOT NULL,
  `Cuotas` decimal(10,2) NOT NULL,
  `Cuotas_Mensuales` decimal(10,2) NOT NULL,
  `Monto_Pagar` decimal(10,2) NOT NULL,
  `Capital` decimal(10,2) NOT NULL,
  `Interes` decimal(10,2) NOT NULL,
  `Fecha` date NOT NULL,
  `Nombre_Apellido` varchar(150) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Cedula` varchar(20) DEFAULT NULL,
  `Usuario_ID_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `backendapi_facturas`
--

INSERT INTO `backendapi_facturas` (`ID_Facturas`, `Monto_Solicitado`, `Tasa`, `Cuotas`, `Cuotas_Mensuales`, `Monto_Pagar`, `Capital`, `Interes`, `Fecha`, `Nombre_Apellido`, `Telefono`, `Cedula`, `Usuario_ID_id`) VALUES
(1, '20000.00', '20.00', '20.00', '20000.00', '20000.00', '1000.00', '18000.00', '2023-03-04', 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0', 1),
(2, '80000.00', '8.00', '20.00', '12800.00', '32000.00', '4000.00', '8800.00', '2023-03-24', 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0', 2),
(3, '800.00', '8.00', '20.00', '128.00', '320.00', '40.00', '88.00', '2023-03-12', 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0', 1),
(4, '800.00', '8.00', '20.00', '128.00', '325.00', '40.00', '88.00', '2023-03-05', 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0', 1),
(5, '1600.00', '16.00', '2.00', '102400.00', '12800.00', '800.00', '101600.00', '2023-03-11', 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0', 2),
(6, '80000.00', '8.00', '30.00', '12800.00', '32000.00', '4098.00', '8800.00', '2023-03-17', 'Junior Carmona', '809-000-0000', '111-1111111-1', 3),
(7, '10000.00', '10.00', '10.00', '10000.00', '10000.00', '1000.00', '9000.00', '2023-03-07', 'Ericka Castillo Encarnacion', '829-633--4911', '222-2222222-2', 4),
(8, '20000.00', '1.50', '10.00', '450.00', '1500.00', '2000.00', '350.00', '2023-03-10', 'Hector Lavoe', '809-222-2222', '402-2970588-2', 5),
(9, '5000.00', '1.50', '10.00', '112.50', '754.00', '500.00', '357.00', '2023-03-29', 'Mon Laferte', '809-590-3080', '402-2980566-0', 6),
(10, '25.00', '1.00', '5.00', '1.00', '5.00', '5.00', '4.00', '2023-03-29', 'Mon Laferte', '809-590-3080', '402-2980566-0', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backendapi_historialfacturas`
--

CREATE TABLE `backendapi_historialfacturas` (
  `ID_HistorialFactura` int(11) NOT NULL,
  `Monto_Solicitado` decimal(10,2) NOT NULL,
  `Tasa` decimal(10,2) NOT NULL,
  `Cuotas` decimal(10,2) NOT NULL,
  `Cuotas_Mensuales` decimal(10,2) NOT NULL,
  `Monto_Pagar` decimal(10,2) NOT NULL,
  `Capital` decimal(10,2) NOT NULL,
  `Interes` decimal(10,2) NOT NULL,
  `Fecha` date NOT NULL,
  `Nombre_Apellido` varchar(150) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Cedula` varchar(20) DEFAULT NULL,
  `Factura_ID_id` int(11) NOT NULL,
  `Usuario_ID_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `backendapi_historialfacturas`
--

INSERT INTO `backendapi_historialfacturas` (`ID_HistorialFactura`, `Monto_Solicitado`, `Tasa`, `Cuotas`, `Cuotas_Mensuales`, `Monto_Pagar`, `Capital`, `Interes`, `Fecha`, `Nombre_Apellido`, `Telefono`, `Cedula`, `Factura_ID_id`, `Usuario_ID_id`) VALUES
(1, '20000.00', '20.00', '20.00', '20000.00', '20000.00', '1000.00', '1900.00', '2023-03-04', 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0', 1, 1),
(2, '80000.00', '8.00', '20.00', '12800.00', '32000.00', '4100.00', '8800.00', '2023-03-24', 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0', 2, 2),
(3, '80000.00', '8.00', '20.00', '12800.00', '32000.00', '4000.00', '8800.00', '2023-03-24', 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0', 2, 2),
(4, '80000.00', '8.00', '20.00', '12800.00', '32000.00', '4100.00', '8800.00', '2023-03-24', 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0', 2, 2),
(5, '80000.00', '8.00', '20.00', '12800.00', '32000.00', '4000.00', '8800.00', '2023-03-24', 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0', 2, 2),
(6, '20000.00', '20.00', '20.00', '20000.00', '20000.00', '1000.00', '18000.00', '2023-03-04', 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0', 1, 1),
(7, '80000.00', '8.00', '30.00', '12800.00', '32000.00', '4000.00', '8800.00', '2023-03-10', 'Junior Carmona', '809-000-0000', '111-1111111-1', 6, 3),
(8, '80000.00', '8.00', '30.00', '12800.00', '32000.00', '4098.00', '8800.00', '2023-03-17', 'Junior Carmona', '809-000-0000', '111-1111111-1', 6, 3),
(9, '80000.00', '8.00', '30.00', '12800.00', '32000.00', '4098.00', '8800.00', '2023-03-17', 'Junior Carmona', '809-000-0000', '111-1111111-1', 6, 3),
(10, '800.00', '8.00', '20.00', '128.00', '325.00', '40.00', '88.00', '2023-03-05', 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0', 4, 1),
(11, '20000.00', '1.50', '10.00', '450.00', '1500.00', '2000.00', '350.00', '2023-03-10', 'Hector Lavoe', '809-222-2222', '402-2970588-2', 8, 5),
(12, '5000.00', '1.50', '10.00', '112.50', '754.00', '500.00', '357.00', '2023-03-29', 'Mon Laferte', '809-590-3080', '402-2980566-0', 9, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backendapi_usuario`
--

CREATE TABLE `backendapi_usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `Nombre_Apellido` varchar(150) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Cedula` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `backendapi_usuario`
--

INSERT INTO `backendapi_usuario` (`ID_USUARIO`, `Nombre_Apellido`, `Telefono`, `Cedula`) VALUES
(1, 'Jeremy Encarnacion Basilio', '829-722-3118', '402-2970588-0'),
(2, 'Erimer Castillo Encarnacion', '829-915-0930', '000-0000000-0'),
(3, 'Junior Carmona', '809-000-0000', '111-1111111-1'),
(4, 'Ericka Castillo Encarnacion', '829-633--4911', '222-2222222-2'),
(5, 'Hector Lavoe', '809-222-2222', '402-2970588-2'),
(6, 'Mon Laferte', '809-590-3080', '402-2980566-0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'BackendAPI', 'facturas'),
(9, 'BackendAPI', 'historialfacturas'),
(8, 'BackendAPI', 'usuario'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'BackendAPI', '0001_initial', '2023-03-05 02:34:38.171127'),
(2, 'contenttypes', '0001_initial', '2023-03-05 02:34:39.677300'),
(3, 'auth', '0001_initial', '2023-03-05 02:34:53.492004'),
(4, 'admin', '0001_initial', '2023-03-05 02:34:55.836701'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-03-05 02:34:55.919701'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-05 02:34:56.014701'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-03-05 02:34:56.775876'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-03-05 02:34:58.319955'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-03-05 02:34:58.509170'),
(10, 'auth', '0004_alter_user_username_opts', '2023-03-05 02:34:58.602170'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-03-05 02:34:59.331175'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-03-05 02:34:59.387169'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-03-05 02:34:59.496169'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-03-05 02:34:59.804220'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-03-05 02:35:00.408526'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-03-05 02:35:00.641517'),
(17, 'auth', '0011_update_proxy_permissions', '2023-03-05 02:35:00.700443'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-03-05 02:35:00.911443'),
(19, 'sessions', '0001_initial', '2023-03-05 02:35:01.513864');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `backendapi_facturas`
--
ALTER TABLE `backendapi_facturas`
  ADD PRIMARY KEY (`ID_Facturas`),
  ADD KEY `BackendAPI_facturas_Usuario_ID_id_611ad4e9_fk_BackendAP` (`Usuario_ID_id`);

--
-- Indices de la tabla `backendapi_historialfacturas`
--
ALTER TABLE `backendapi_historialfacturas`
  ADD PRIMARY KEY (`ID_HistorialFactura`),
  ADD KEY `BackendAPI_historial_Factura_ID_id_30bf3886_fk_BackendAP` (`Factura_ID_id`),
  ADD KEY `BackendAPI_historial_Usuario_ID_id_c8afca00_fk_BackendAP` (`Usuario_ID_id`);

--
-- Indices de la tabla `backendapi_usuario`
--
ALTER TABLE `backendapi_usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `backendapi_facturas`
--
ALTER TABLE `backendapi_facturas`
  MODIFY `ID_Facturas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `backendapi_historialfacturas`
--
ALTER TABLE `backendapi_historialfacturas`
  MODIFY `ID_HistorialFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `backendapi_usuario`
--
ALTER TABLE `backendapi_usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `backendapi_facturas`
--
ALTER TABLE `backendapi_facturas`
  ADD CONSTRAINT `BackendAPI_facturas_Usuario_ID_id_611ad4e9_fk_BackendAP` FOREIGN KEY (`Usuario_ID_id`) REFERENCES `backendapi_usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `backendapi_historialfacturas`
--
ALTER TABLE `backendapi_historialfacturas`
  ADD CONSTRAINT `BackendAPI_historial_Factura_ID_id_30bf3886_fk_BackendAP` FOREIGN KEY (`Factura_ID_id`) REFERENCES `backendapi_facturas` (`ID_Facturas`),
  ADD CONSTRAINT `BackendAPI_historial_Usuario_ID_id_c8afca00_fk_BackendAP` FOREIGN KEY (`Usuario_ID_id`) REFERENCES `backendapi_usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
