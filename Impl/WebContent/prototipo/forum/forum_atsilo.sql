-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Dic 18, 2012 alle 14:25
-- Versione del server: 5.5.27
-- Versione PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbforum`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_acl_groups`
--

INSERT INTO `phpbb_acl_groups` (`group_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`) VALUES
(1, 0, 85, 0, 1),
(1, 0, 93, 0, 1),
(1, 0, 111, 0, 1),
(5, 0, 0, 5, 0),
(5, 0, 0, 1, 0),
(2, 0, 0, 6, 0),
(3, 0, 0, 6, 0),
(4, 0, 0, 5, 0),
(4, 0, 0, 10, 0),
(7, 0, 0, 23, 0),
(5, 2, 0, 15, 0),
(6, 2, 0, 15, 0),
(4, 2, 0, 15, 0),
(7, 2, 0, 15, 0),
(2, 2, 0, 15, 0),
(2, 9, 0, 15, 0),
(5, 9, 0, 15, 0),
(6, 9, 0, 15, 0),
(4, 9, 0, 15, 0),
(7, 9, 0, 15, 0),
(2, 7, 0, 15, 0),
(5, 7, 0, 15, 0),
(6, 7, 0, 15, 0),
(4, 7, 0, 15, 0),
(7, 7, 0, 15, 0),
(2, 6, 0, 15, 0),
(5, 6, 0, 15, 0),
(6, 6, 0, 15, 0),
(4, 6, 0, 15, 0),
(7, 6, 0, 15, 0),
(5, 1, 0, 15, 0),
(1, 1, 0, 17, 0),
(7, 1, 0, 15, 0),
(2, 1, 0, 15, 0),
(6, 1, 0, 15, 0),
(4, 1, 0, 15, 0),
(2, 8, 0, 15, 0),
(5, 8, 0, 15, 0),
(6, 8, 0, 15, 0),
(4, 8, 0, 15, 0),
(7, 8, 0, 15, 0),
(1, 8, 0, 17, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_options`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auth_option` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_local` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `founder_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=118 ;

--
-- Dump dei dati per la tabella `phpbb_acl_options`
--

INSERT INTO `phpbb_acl_options` (`auth_option_id`, `auth_option`, `is_global`, `is_local`, `founder_only`) VALUES
(1, 'f_', 0, 1, 0),
(2, 'f_announce', 0, 1, 0),
(3, 'f_attach', 0, 1, 0),
(4, 'f_bbcode', 0, 1, 0),
(5, 'f_bump', 0, 1, 0),
(6, 'f_delete', 0, 1, 0),
(7, 'f_download', 0, 1, 0),
(8, 'f_edit', 0, 1, 0),
(9, 'f_email', 0, 1, 0),
(10, 'f_flash', 0, 1, 0),
(11, 'f_icons', 0, 1, 0),
(12, 'f_ignoreflood', 0, 1, 0),
(13, 'f_img', 0, 1, 0),
(14, 'f_list', 0, 1, 0),
(15, 'f_noapprove', 0, 1, 0),
(16, 'f_poll', 0, 1, 0),
(17, 'f_post', 0, 1, 0),
(18, 'f_postcount', 0, 1, 0),
(19, 'f_print', 0, 1, 0),
(20, 'f_read', 0, 1, 0),
(21, 'f_reply', 0, 1, 0),
(22, 'f_report', 0, 1, 0),
(23, 'f_search', 0, 1, 0),
(24, 'f_sigs', 0, 1, 0),
(25, 'f_smilies', 0, 1, 0),
(26, 'f_sticky', 0, 1, 0),
(27, 'f_subscribe', 0, 1, 0),
(28, 'f_user_lock', 0, 1, 0),
(29, 'f_vote', 0, 1, 0),
(30, 'f_votechg', 0, 1, 0),
(31, 'm_', 1, 1, 0),
(32, 'm_approve', 1, 1, 0),
(33, 'm_chgposter', 1, 1, 0),
(34, 'm_delete', 1, 1, 0),
(35, 'm_edit', 1, 1, 0),
(36, 'm_info', 1, 1, 0),
(37, 'm_lock', 1, 1, 0),
(38, 'm_merge', 1, 1, 0),
(39, 'm_move', 1, 1, 0),
(40, 'm_report', 1, 1, 0),
(41, 'm_split', 1, 1, 0),
(42, 'm_ban', 1, 0, 0),
(43, 'm_warn', 1, 0, 0),
(44, 'a_', 1, 0, 0),
(45, 'a_aauth', 1, 0, 0),
(46, 'a_attach', 1, 0, 0),
(47, 'a_authgroups', 1, 0, 0),
(48, 'a_authusers', 1, 0, 0),
(49, 'a_backup', 1, 0, 0),
(50, 'a_ban', 1, 0, 0),
(51, 'a_bbcode', 1, 0, 0),
(52, 'a_board', 1, 0, 0),
(53, 'a_bots', 1, 0, 0),
(54, 'a_clearlogs', 1, 0, 0),
(55, 'a_email', 1, 0, 0),
(56, 'a_fauth', 1, 0, 0),
(57, 'a_forum', 1, 0, 0),
(58, 'a_forumadd', 1, 0, 0),
(59, 'a_forumdel', 1, 0, 0),
(60, 'a_group', 1, 0, 0),
(61, 'a_groupadd', 1, 0, 0),
(62, 'a_groupdel', 1, 0, 0),
(63, 'a_icons', 1, 0, 0),
(64, 'a_jabber', 1, 0, 0),
(65, 'a_language', 1, 0, 0),
(66, 'a_mauth', 1, 0, 0),
(67, 'a_modules', 1, 0, 0),
(68, 'a_names', 1, 0, 0),
(69, 'a_phpinfo', 1, 0, 0),
(70, 'a_profile', 1, 0, 0),
(71, 'a_prune', 1, 0, 0),
(72, 'a_ranks', 1, 0, 0),
(73, 'a_reasons', 1, 0, 0),
(74, 'a_roles', 1, 0, 0),
(75, 'a_search', 1, 0, 0),
(76, 'a_server', 1, 0, 0),
(77, 'a_styles', 1, 0, 0),
(78, 'a_switchperm', 1, 0, 0),
(79, 'a_uauth', 1, 0, 0),
(80, 'a_user', 1, 0, 0),
(81, 'a_userdel', 1, 0, 0),
(82, 'a_viewauth', 1, 0, 0),
(83, 'a_viewlogs', 1, 0, 0),
(84, 'a_words', 1, 0, 0),
(85, 'u_', 1, 0, 0),
(86, 'u_attach', 1, 0, 0),
(87, 'u_chgavatar', 1, 0, 0),
(88, 'u_chgcensors', 1, 0, 0),
(89, 'u_chgemail', 1, 0, 0),
(90, 'u_chggrp', 1, 0, 0),
(91, 'u_chgname', 1, 0, 0),
(92, 'u_chgpasswd', 1, 0, 0),
(93, 'u_download', 1, 0, 0),
(94, 'u_hideonline', 1, 0, 0),
(95, 'u_ignoreflood', 1, 0, 0),
(96, 'u_masspm', 1, 0, 0),
(97, 'u_masspm_group', 1, 0, 0),
(98, 'u_pm_attach', 1, 0, 0),
(99, 'u_pm_bbcode', 1, 0, 0),
(100, 'u_pm_delete', 1, 0, 0),
(101, 'u_pm_download', 1, 0, 0),
(102, 'u_pm_edit', 1, 0, 0),
(103, 'u_pm_emailpm', 1, 0, 0),
(104, 'u_pm_flash', 1, 0, 0),
(105, 'u_pm_forward', 1, 0, 0),
(106, 'u_pm_img', 1, 0, 0),
(107, 'u_pm_printpm', 1, 0, 0),
(108, 'u_pm_smilies', 1, 0, 0),
(109, 'u_readpm', 1, 0, 0),
(110, 'u_savedrafts', 1, 0, 0),
(111, 'u_search', 1, 0, 0),
(112, 'u_sendemail', 1, 0, 0),
(113, 'u_sendim', 1, 0, 0),
(114, 'u_sendpm', 1, 0, 0),
(115, 'u_sig', 1, 0, 0),
(116, 'u_viewonline', 1, 0, 0),
(117, 'u_viewprofile', 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_roles`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_bin NOT NULL,
  `role_type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

--
-- Dump dei dati per la tabella `phpbb_acl_roles`
--

INSERT INTO `phpbb_acl_roles` (`role_id`, `role_name`, `role_description`, `role_type`, `role_order`) VALUES
(1, 'ROLE_ADMIN_STANDARD', 0x524f4c455f4445534352495054494f4e5f41444d494e5f5354414e44415244, 'a_', 1),
(2, 'ROLE_ADMIN_FORUM', 0x524f4c455f4445534352495054494f4e5f41444d494e5f464f52554d, 'a_', 3),
(3, 'ROLE_ADMIN_USERGROUP', 0x524f4c455f4445534352495054494f4e5f41444d494e5f5553455247524f5550, 'a_', 4),
(4, 'ROLE_ADMIN_FULL', 0x524f4c455f4445534352495054494f4e5f41444d494e5f46554c4c, 'a_', 2),
(5, 'ROLE_USER_FULL', 0x524f4c455f4445534352495054494f4e5f555345525f46554c4c, 'u_', 3),
(6, 'ROLE_USER_STANDARD', 0x524f4c455f4445534352495054494f4e5f555345525f5354414e44415244, 'u_', 1),
(7, 'ROLE_USER_LIMITED', 0x524f4c455f4445534352495054494f4e5f555345525f4c494d49544544, 'u_', 2),
(8, 'ROLE_USER_NOPM', 0x524f4c455f4445534352495054494f4e5f555345525f4e4f504d, 'u_', 4),
(9, 'ROLE_USER_NOAVATAR', 0x524f4c455f4445534352495054494f4e5f555345525f4e4f415641544152, 'u_', 5),
(10, 'ROLE_MOD_FULL', 0x524f4c455f4445534352495054494f4e5f4d4f445f46554c4c, 'm_', 3),
(11, 'ROLE_MOD_STANDARD', 0x524f4c455f4445534352495054494f4e5f4d4f445f5354414e44415244, 'm_', 1),
(12, 'ROLE_MOD_SIMPLE', 0x524f4c455f4445534352495054494f4e5f4d4f445f53494d504c45, 'm_', 2),
(13, 'ROLE_MOD_QUEUE', 0x524f4c455f4445534352495054494f4e5f4d4f445f5155455545, 'm_', 4),
(14, 'ROLE_FORUM_FULL', 0x524f4c455f4445534352495054494f4e5f464f52554d5f46554c4c, 'f_', 7),
(15, 'ROLE_FORUM_STANDARD', 0x524f4c455f4445534352495054494f4e5f464f52554d5f5354414e44415244, 'f_', 5),
(16, 'ROLE_FORUM_NOACCESS', 0x524f4c455f4445534352495054494f4e5f464f52554d5f4e4f414343455353, 'f_', 1),
(17, 'ROLE_FORUM_READONLY', 0x524f4c455f4445534352495054494f4e5f464f52554d5f524541444f4e4c59, 'f_', 2),
(18, 'ROLE_FORUM_LIMITED', 0x524f4c455f4445534352495054494f4e5f464f52554d5f4c494d49544544, 'f_', 3),
(19, 'ROLE_FORUM_BOT', 0x524f4c455f4445534352495054494f4e5f464f52554d5f424f54, 'f_', 9),
(20, 'ROLE_FORUM_ONQUEUE', 0x524f4c455f4445534352495054494f4e5f464f52554d5f4f4e5155455545, 'f_', 8),
(21, 'ROLE_FORUM_POLLS', 0x524f4c455f4445534352495054494f4e5f464f52554d5f504f4c4c53, 'f_', 6),
(22, 'ROLE_FORUM_LIMITED_POLLS', 0x524f4c455f4445534352495054494f4e5f464f52554d5f4c494d495445445f504f4c4c53, 'f_', 4),
(23, 'ROLE_USER_NEW_MEMBER', 0x524f4c455f4445534352495054494f4e5f555345525f4e45575f4d454d424552, 'u_', 6),
(24, 'ROLE_FORUM_NEW_MEMBER', 0x524f4c455f4445534352495054494f4e5f464f52554d5f4e45575f4d454d424552, 'f_', 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_roles_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_acl_roles_data`
--

INSERT INTO `phpbb_acl_roles_data` (`role_id`, `auth_option_id`, `auth_setting`) VALUES
(1, 44, 1),
(1, 46, 1),
(1, 47, 1),
(1, 48, 1),
(1, 50, 1),
(1, 51, 1),
(1, 52, 1),
(1, 56, 1),
(1, 57, 1),
(1, 58, 1),
(1, 59, 1),
(1, 60, 1),
(1, 61, 1),
(1, 62, 1),
(1, 63, 1),
(1, 66, 1),
(1, 68, 1),
(1, 70, 1),
(1, 71, 1),
(1, 72, 1),
(1, 73, 1),
(1, 79, 1),
(1, 80, 1),
(1, 81, 1),
(1, 82, 1),
(1, 83, 1),
(1, 84, 1),
(2, 44, 1),
(2, 47, 1),
(2, 48, 1),
(2, 56, 1),
(2, 57, 1),
(2, 58, 1),
(2, 59, 1),
(2, 66, 1),
(2, 71, 1),
(2, 79, 1),
(2, 82, 1),
(2, 83, 1),
(3, 44, 1),
(3, 47, 1),
(3, 48, 1),
(3, 50, 1),
(3, 60, 1),
(3, 61, 1),
(3, 62, 1),
(3, 72, 1),
(3, 79, 1),
(3, 80, 1),
(3, 82, 1),
(3, 83, 1),
(4, 44, 1),
(4, 45, 1),
(4, 46, 1),
(4, 47, 1),
(4, 48, 1),
(4, 49, 1),
(4, 50, 1),
(4, 51, 1),
(4, 52, 1),
(4, 53, 1),
(4, 54, 1),
(4, 55, 1),
(4, 56, 1),
(4, 57, 1),
(4, 58, 1),
(4, 59, 1),
(4, 60, 1),
(4, 61, 1),
(4, 62, 1),
(4, 63, 1),
(4, 64, 1),
(4, 65, 1),
(4, 66, 1),
(4, 67, 1),
(4, 68, 1),
(4, 69, 1),
(4, 70, 1),
(4, 71, 1),
(4, 72, 1),
(4, 73, 1),
(4, 74, 1),
(4, 75, 1),
(4, 76, 1),
(4, 77, 1),
(4, 78, 1),
(4, 79, 1),
(4, 80, 1),
(4, 81, 1),
(4, 82, 1),
(4, 83, 1),
(4, 84, 1),
(5, 85, 1),
(5, 86, 1),
(5, 87, 1),
(5, 88, 1),
(5, 89, 1),
(5, 90, 1),
(5, 91, 1),
(5, 92, 1),
(5, 93, 1),
(5, 94, 1),
(5, 95, 1),
(5, 96, 1),
(5, 97, 1),
(5, 98, 1),
(5, 99, 1),
(5, 100, 1),
(5, 101, 1),
(5, 102, 1),
(5, 103, 1),
(5, 104, 1),
(5, 105, 1),
(5, 106, 1),
(5, 107, 1),
(5, 108, 1),
(5, 109, 1),
(5, 110, 1),
(5, 111, 1),
(5, 112, 1),
(5, 113, 1),
(5, 114, 1),
(5, 115, 1),
(5, 116, 1),
(5, 117, 1),
(6, 85, 1),
(6, 86, 1),
(6, 87, 1),
(6, 88, 1),
(6, 89, 1),
(6, 92, 1),
(6, 93, 1),
(6, 94, 1),
(6, 96, 1),
(6, 97, 1),
(6, 98, 1),
(6, 99, 1),
(6, 100, 1),
(6, 101, 1),
(6, 102, 1),
(6, 103, 1),
(6, 106, 1),
(6, 107, 1),
(6, 108, 1),
(6, 109, 1),
(6, 110, 1),
(6, 111, 1),
(6, 112, 1),
(6, 113, 1),
(6, 114, 1),
(6, 115, 1),
(6, 117, 1),
(7, 85, 1),
(7, 87, 1),
(7, 88, 1),
(7, 89, 1),
(7, 92, 1),
(7, 93, 1),
(7, 94, 1),
(7, 99, 1),
(7, 100, 1),
(7, 101, 1),
(7, 102, 1),
(7, 105, 1),
(7, 106, 1),
(7, 107, 1),
(7, 108, 1),
(7, 109, 1),
(7, 114, 1),
(7, 115, 1),
(7, 117, 1),
(8, 85, 1),
(8, 87, 1),
(8, 88, 1),
(8, 89, 1),
(8, 92, 1),
(8, 93, 1),
(8, 94, 1),
(8, 96, 0),
(8, 97, 0),
(8, 109, 0),
(8, 114, 0),
(8, 115, 1),
(8, 117, 1),
(9, 85, 1),
(9, 87, 0),
(9, 88, 1),
(9, 89, 1),
(9, 92, 1),
(9, 93, 1),
(9, 94, 1),
(9, 99, 1),
(9, 100, 1),
(9, 101, 1),
(9, 102, 1),
(9, 105, 1),
(9, 106, 1),
(9, 107, 1),
(9, 108, 1),
(9, 109, 1),
(9, 114, 1),
(9, 115, 1),
(9, 117, 1),
(10, 31, 1),
(10, 32, 1),
(10, 33, 1),
(10, 34, 1),
(10, 35, 1),
(10, 36, 1),
(10, 37, 1),
(10, 38, 1),
(10, 39, 1),
(10, 40, 1),
(10, 41, 1),
(10, 42, 1),
(10, 43, 1),
(11, 31, 1),
(11, 32, 1),
(11, 34, 1),
(11, 35, 1),
(11, 36, 1),
(11, 37, 1),
(11, 38, 1),
(11, 39, 1),
(11, 40, 1),
(11, 41, 1),
(11, 43, 1),
(12, 31, 1),
(12, 34, 1),
(12, 35, 1),
(12, 36, 1),
(12, 40, 1),
(13, 31, 1),
(13, 32, 1),
(13, 35, 1),
(14, 1, 1),
(14, 2, 1),
(14, 3, 1),
(14, 4, 1),
(14, 5, 1),
(14, 6, 1),
(14, 7, 1),
(14, 8, 1),
(14, 9, 1),
(14, 10, 1),
(14, 11, 1),
(14, 12, 1),
(14, 13, 1),
(14, 14, 1),
(14, 15, 1),
(14, 16, 1),
(14, 17, 1),
(14, 18, 1),
(14, 19, 1),
(14, 20, 1),
(14, 21, 1),
(14, 22, 1),
(14, 23, 1),
(14, 24, 1),
(14, 25, 1),
(14, 26, 1),
(14, 27, 1),
(14, 28, 1),
(14, 29, 1),
(14, 30, 1),
(15, 1, 1),
(15, 3, 1),
(15, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(15, 9, 1),
(15, 11, 1),
(15, 13, 1),
(15, 14, 1),
(15, 15, 1),
(15, 17, 1),
(15, 18, 1),
(15, 19, 1),
(15, 20, 1),
(15, 21, 1),
(15, 22, 1),
(15, 23, 1),
(15, 24, 1),
(15, 25, 1),
(15, 27, 1),
(15, 29, 1),
(15, 30, 1),
(16, 1, 0),
(17, 1, 1),
(17, 7, 1),
(17, 14, 1),
(17, 19, 1),
(17, 20, 1),
(17, 23, 1),
(17, 27, 1),
(18, 1, 1),
(18, 4, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(18, 13, 1),
(18, 14, 1),
(18, 15, 1),
(18, 17, 1),
(18, 18, 1),
(18, 19, 1),
(18, 20, 1),
(18, 21, 1),
(18, 22, 1),
(18, 23, 1),
(18, 24, 1),
(18, 25, 1),
(18, 27, 1),
(18, 29, 1),
(19, 1, 1),
(19, 7, 1),
(19, 14, 1),
(19, 19, 1),
(19, 20, 1),
(20, 1, 1),
(20, 3, 1),
(20, 4, 1),
(20, 7, 1),
(20, 8, 1),
(20, 9, 1),
(20, 13, 1),
(20, 14, 1),
(20, 15, 0),
(20, 17, 1),
(20, 18, 1),
(20, 19, 1),
(20, 20, 1),
(20, 21, 1),
(20, 22, 1),
(20, 23, 1),
(20, 24, 1),
(20, 25, 1),
(20, 27, 1),
(20, 29, 1),
(21, 1, 1),
(21, 3, 1),
(21, 4, 1),
(21, 5, 1),
(21, 6, 1),
(21, 7, 1),
(21, 8, 1),
(21, 9, 1),
(21, 11, 1),
(21, 13, 1),
(21, 14, 1),
(21, 15, 1),
(21, 16, 1),
(21, 17, 1),
(21, 18, 1),
(21, 19, 1),
(21, 20, 1),
(21, 21, 1),
(21, 22, 1),
(21, 23, 1),
(21, 24, 1),
(21, 25, 1),
(21, 27, 1),
(21, 29, 1),
(21, 30, 1),
(22, 1, 1),
(22, 4, 1),
(22, 7, 1),
(22, 8, 1),
(22, 9, 1),
(22, 13, 1),
(22, 14, 1),
(22, 15, 1),
(22, 16, 1),
(22, 17, 1),
(22, 18, 1),
(22, 19, 1),
(22, 20, 1),
(22, 21, 1),
(22, 22, 1),
(22, 23, 1),
(22, 24, 1),
(22, 25, 1),
(22, 27, 1),
(22, 29, 1),
(23, 96, 0),
(23, 97, 0),
(23, 114, 0),
(24, 15, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_acl_users`
--

CREATE TABLE IF NOT EXISTS `phpbb_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_acl_users`
--

INSERT INTO `phpbb_acl_users` (`user_id`, `forum_id`, `auth_option_id`, `auth_role_id`, `auth_setting`) VALUES
(2, 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_attachments`
--

CREATE TABLE IF NOT EXISTS `phpbb_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `in_message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_orphan` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `physical_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `real_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_comment` text COLLATE utf8_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mimetype` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `filetime` int(11) unsigned NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_banlist`
--

CREATE TABLE IF NOT EXISTS `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ban_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_end` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_give_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_bbcodes`
--

CREATE TABLE IF NOT EXISTS `phpbb_bbcodes` (
  `bbcode_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bbcode_tag` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_helpline` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_match` text COLLATE utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_bookmarks`
--

CREATE TABLE IF NOT EXISTS `phpbb_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_bots`
--

CREATE TABLE IF NOT EXISTS `phpbb_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bot_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `bot_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bot_agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bot_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=52 ;

--
-- Dump dei dati per la tabella `phpbb_bots`
--

INSERT INTO `phpbb_bots` (`bot_id`, `bot_active`, `bot_name`, `user_id`, `bot_agent`, `bot_ip`) VALUES
(1, 1, 'AdsBot [Google]', 3, 'AdsBot-Google', ''),
(2, 1, 'Alexa [Bot]', 4, 'ia_archiver', ''),
(3, 1, 'Alta Vista [Bot]', 5, 'Scooter/', ''),
(4, 1, 'Ask Jeeves [Bot]', 6, 'Ask Jeeves', ''),
(5, 1, 'Baidu [Spider]', 7, 'Baiduspider+(', ''),
(6, 1, 'Bing [Bot]', 8, 'bingbot/', ''),
(7, 1, 'Exabot [Bot]', 9, 'Exabot/', ''),
(8, 1, 'FAST Enterprise [Crawler]', 10, 'FAST Enterprise Crawler', ''),
(9, 1, 'FAST WebCrawler [Crawler]', 11, 'FAST-WebCrawler/', ''),
(10, 1, 'Francis [Bot]', 12, 'http://www.neomo.de/', ''),
(11, 1, 'Gigabot [Bot]', 13, 'Gigabot/', ''),
(12, 1, 'Google Adsense [Bot]', 14, 'Mediapartners-Google', ''),
(13, 1, 'Google Desktop', 15, 'Google Desktop', ''),
(14, 1, 'Google Feedfetcher', 16, 'Feedfetcher-Google', ''),
(15, 1, 'Google [Bot]', 17, 'Googlebot', ''),
(16, 1, 'Heise IT-Markt [Crawler]', 18, 'heise-IT-Markt-Crawler', ''),
(17, 1, 'Heritrix [Crawler]', 19, 'heritrix/1.', ''),
(18, 1, 'IBM Research [Bot]', 20, 'ibm.com/cs/crawler', ''),
(19, 1, 'ICCrawler - ICjobs', 21, 'ICCrawler - ICjobs', ''),
(20, 1, 'ichiro [Crawler]', 22, 'ichiro/', ''),
(21, 1, 'Majestic-12 [Bot]', 23, 'MJ12bot/', ''),
(22, 1, 'Metager [Bot]', 24, 'MetagerBot/', ''),
(23, 1, 'MSN NewsBlogs', 25, 'msnbot-NewsBlogs/', ''),
(24, 1, 'MSN [Bot]', 26, 'msnbot/', ''),
(25, 1, 'MSNbot Media', 27, 'msnbot-media/', ''),
(26, 1, 'NG-Search [Bot]', 28, 'NG-Search/', ''),
(27, 1, 'Nutch [Bot]', 29, 'http://lucene.apache.org/nutch/', ''),
(28, 1, 'Nutch/CVS [Bot]', 30, 'NutchCVS/', ''),
(29, 1, 'OmniExplorer [Bot]', 31, 'OmniExplorer_Bot/', ''),
(30, 1, 'Online link [Validator]', 32, 'online link validator', ''),
(31, 1, 'psbot [Picsearch]', 33, 'psbot/0', ''),
(32, 1, 'Seekport [Bot]', 34, 'Seekbot/', ''),
(33, 1, 'Sensis [Crawler]', 35, 'Sensis Web Crawler', ''),
(34, 1, 'SEO Crawler', 36, 'SEO search Crawler/', ''),
(35, 1, 'Seoma [Crawler]', 37, 'Seoma [SEO Crawler]', ''),
(36, 1, 'SEOSearch [Crawler]', 38, 'SEOsearch/', ''),
(37, 1, 'Snappy [Bot]', 39, 'Snappy/1.1 ( http://www.urltrends.com/ )', ''),
(38, 1, 'Steeler [Crawler]', 40, 'http://www.tkl.iis.u-tokyo.ac.jp/~crawler/', ''),
(39, 1, 'Synoo [Bot]', 41, 'SynooBot/', ''),
(40, 1, 'Telekom [Bot]', 42, 'crawleradmin.t-info@telekom.de', ''),
(41, 1, 'TurnitinBot [Bot]', 43, 'TurnitinBot/', ''),
(42, 1, 'Voyager [Bot]', 44, 'voyager/1.0', ''),
(43, 1, 'W3 [Sitesearch]', 45, 'W3 SiteSearch Crawler', ''),
(44, 1, 'W3C [Linkcheck]', 46, 'W3C-checklink/', ''),
(45, 1, 'W3C [Validator]', 47, 'W3C_*Validator', ''),
(46, 1, 'WiseNut [Bot]', 48, 'http://www.WISEnutbot.com', ''),
(47, 1, 'YaCy [Bot]', 49, 'yacybot', ''),
(48, 1, 'Yahoo MMCrawler [Bot]', 50, 'Yahoo-MMCrawler/', ''),
(49, 1, 'Yahoo Slurp [Bot]', 51, 'Yahoo! DE Slurp', ''),
(50, 1, 'Yahoo [Bot]', 52, 'Yahoo! Slurp', ''),
(51, 1, 'YahooSeeker [Bot]', 53, 'YahooSeeker/', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_config`
--

CREATE TABLE IF NOT EXISTS `phpbb_config` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_config`
--

INSERT INTO `phpbb_config` (`config_name`, `config_value`, `is_dynamic`) VALUES
('active_sessions', '0', 0),
('allow_attachments', '1', 0),
('allow_autologin', '1', 0),
('allow_avatar', '1', 0),
('allow_avatar_local', '0', 0),
('allow_avatar_remote', '0', 0),
('allow_avatar_remote_upload', '0', 0),
('allow_avatar_upload', '1', 0),
('allow_bbcode', '1', 0),
('allow_birthdays', '1', 0),
('allow_bookmarks', '1', 0),
('allow_emailreuse', '0', 0),
('allow_forum_notify', '1', 0),
('allow_mass_pm', '1', 0),
('allow_name_chars', 'USERNAME_CHARS_ANY', 0),
('allow_namechange', '0', 0),
('allow_nocensors', '0', 0),
('allow_pm_attach', '0', 0),
('allow_pm_report', '1', 0),
('allow_post_flash', '1', 0),
('allow_post_links', '1', 0),
('allow_privmsg', '1', 0),
('allow_quick_reply', '1', 0),
('allow_sig', '1', 0),
('allow_sig_bbcode', '1', 0),
('allow_sig_flash', '0', 0),
('allow_sig_img', '1', 0),
('allow_sig_links', '1', 0),
('allow_sig_pm', '1', 0),
('allow_sig_smilies', '1', 0),
('allow_smilies', '1', 0),
('allow_topic_notify', '1', 0),
('attachment_quota', '52428800', 0),
('auth_bbcode_pm', '1', 0),
('auth_flash_pm', '0', 0),
('auth_img_pm', '1', 0),
('auth_method', 'db', 0),
('auth_smilies_pm', '1', 0),
('avatar_filesize', '6144', 0),
('avatar_gallery_path', 'images/avatars/gallery', 0),
('avatar_max_height', '90', 0),
('avatar_max_width', '90', 0),
('avatar_min_height', '20', 0),
('avatar_min_width', '20', 0),
('avatar_path', 'images/avatars/upload', 0),
('avatar_salt', 'a31de61acbbe757ef051d96e7d504012', 0),
('board_contact', 'a@tin.it', 0),
('board_disable', '0', 0),
('board_disable_msg', '', 0),
('board_dst', '0', 0),
('board_email', 'a@tin.it', 0),
('board_email_form', '0', 0),
('board_email_sig', 'Grazie, l’amministrazione', 0),
('board_hide_emails', '1', 0),
('board_startdate', '1354998540', 0),
('board_timezone', '0', 0),
('browser_check', '1', 0),
('bump_interval', '10', 0),
('bump_type', 'd', 0),
('cache_gc', '7200', 0),
('cache_last_gc', '1355655347', 1),
('captcha_gd', '1', 0),
('captcha_gd_3d_noise', '1', 0),
('captcha_gd_fonts', '1', 0),
('captcha_gd_foreground_noise', '0', 0),
('captcha_gd_wave', '0', 0),
('captcha_gd_x_grid', '25', 0),
('captcha_gd_y_grid', '25', 0),
('captcha_plugin', 'phpbb_captcha_gd', 0),
('check_attachment_content', '1', 0),
('check_dnsbl', '0', 0),
('chg_passforce', '0', 0),
('confirm_refresh', '1', 0),
('cookie_domain', 'localhost', 0),
('cookie_name', 'phpbb3_r35ga', 0),
('cookie_path', '/', 0),
('cookie_secure', '0', 0),
('coppa_enable', '0', 0),
('coppa_fax', '', 0),
('coppa_mail', '', 0),
('cron_lock', '0', 1),
('database_gc', '604800', 0),
('database_last_gc', '1355655388', 1),
('dbms_version', '5.5.27', 0),
('default_dateformat', '|d/m/Y|, G:i', 0),
('default_lang', 'it', 0),
('default_style', '4', 0),
('delete_time', '0', 0),
('display_last_edited', '1', 0),
('display_order', '0', 0),
('edit_time', '0', 0),
('email_check_mx', '1', 0),
('email_enable', '1', 0),
('email_function_name', 'mail', 0),
('email_max_chunk_size', '50', 0),
('email_package_size', '20', 0),
('enable_confirm', '0', 0),
('enable_pm_icons', '1', 0),
('enable_post_confirm', '1', 0),
('feed_enable', '1', 0),
('feed_forum', '1', 0),
('feed_http_auth', '0', 0),
('feed_item_statistics', '1', 0),
('feed_limit_post', '15', 0),
('feed_limit_topic', '10', 0),
('feed_overall', '1', 0),
('feed_overall_forums', '0', 0),
('feed_topic', '1', 0),
('feed_topics_active', '0', 0),
('feed_topics_new', '1', 0),
('flood_interval', '15', 0),
('force_server_vars', '0', 0),
('form_token_lifetime', '7200', 0),
('form_token_mintime', '0', 0),
('form_token_sid_guests', '1', 0),
('forward_pm', '1', 0),
('forwarded_for_check', '0', 0),
('full_folder_action', '2', 0),
('fulltext_mysql_max_word_len', '254', 0),
('fulltext_mysql_min_word_len', '4', 0),
('fulltext_native_common_thres', '5', 0),
('fulltext_native_load_upd', '1', 0),
('fulltext_native_max_chars', '14', 0),
('fulltext_native_min_chars', '3', 0),
('gzip_compress', '0', 0),
('hot_threshold', '25', 0),
('icons_path', 'images/icons', 0),
('img_create_thumbnail', '0', 0),
('img_display_inlined', '1', 0),
('img_imagick', '', 0),
('img_link_height', '0', 0),
('img_link_width', '0', 0),
('img_max_height', '0', 0),
('img_max_thumb_width', '400', 0),
('img_max_width', '0', 0),
('img_min_thumb_filesize', '12000', 0),
('ip_check', '3', 0),
('ip_login_limit_max', '50', 0),
('ip_login_limit_time', '21600', 0),
('ip_login_limit_use_forwarded', '0', 0),
('jab_enable', '0', 0),
('jab_host', '', 0),
('jab_package_size', '20', 0),
('jab_password', '', 0),
('jab_port', '5222', 0),
('jab_use_ssl', '0', 0),
('jab_username', '', 0),
('last_queue_run', '0', 1),
('ldap_base_dn', '', 0),
('ldap_email', '', 0),
('ldap_password', '', 0),
('ldap_port', '', 0),
('ldap_server', '', 0),
('ldap_uid', '', 0),
('ldap_user', '', 0),
('ldap_user_filter', '', 0),
('limit_load', '0', 0),
('limit_search_load', '0', 0),
('load_anon_lastread', '0', 0),
('load_birthdays', '1', 0),
('load_cpf_memberlist', '0', 0),
('load_cpf_viewprofile', '1', 0),
('load_cpf_viewtopic', '0', 0),
('load_db_lastread', '1', 0),
('load_db_track', '1', 0),
('load_jumpbox', '1', 0),
('load_moderators', '1', 0),
('load_online', '1', 0),
('load_online_guests', '1', 0),
('load_online_time', '5', 0),
('load_onlinetrack', '1', 0),
('load_search', '', 0),
('load_tplcompile', '0', 0),
('load_unreads_search', '1', 0),
('load_user_activity', '1', 0),
('max_attachments', '3', 0),
('max_attachments_pm', '1', 0),
('max_autologin_time', '0', 0),
('max_filesize', '262144', 0),
('max_filesize_pm', '262144', 0),
('max_login_attempts', '3', 0),
('max_name_chars', '20', 0),
('max_num_search_keywords', '10', 0),
('max_pass_chars', '100', 0),
('max_poll_options', '10', 0),
('max_post_chars', '60000', 0),
('max_post_font_size', '200', 0),
('max_post_img_height', '0', 0),
('max_post_img_width', '0', 0),
('max_post_smilies', '0', 0),
('max_post_urls', '0', 0),
('max_quote_depth', '3', 0),
('max_reg_attempts', '5', 0),
('max_sig_chars', '255', 0),
('max_sig_font_size', '200', 0),
('max_sig_img_height', '0', 0),
('max_sig_img_width', '0', 0),
('max_sig_smilies', '0', 0),
('max_sig_urls', '5', 0),
('mime_triggers', 'body|head|html|img|plaintext|a href|pre|script|table|title', 0),
('min_name_chars', '3', 0),
('min_pass_chars', '6', 0),
('min_post_chars', '1', 0),
('min_search_author_chars', '3', 0),
('new_member_group_default', '0', 0),
('new_member_post_limit', '3', 0),
('newest_user_colour', '', 1),
('newest_user_id', '58', 1),
('newest_username', 'genitore1', 1),
('num_files', '0', 1),
('num_posts', '2', 1),
('num_topics', '1', 1),
('num_users', '4', 1),
('override_user_style', '0', 0),
('pass_complex', 'PASS_TYPE_ANY', 0),
('pm_edit_time', '0', 0),
('pm_max_boxes', '4', 0),
('pm_max_msgs', '50', 0),
('pm_max_recipients', '0', 0),
('posts_per_page', '10', 0),
('print_pm', '1', 0),
('questionnaire_unique_id', 'c84f693ab7f8e808', 0),
('queue_interval', '60', 0),
('rand_seed', '6882488568b7b71063f730b92374feca', 1),
('rand_seed_last_update', '1355657408', 1),
('ranks_path', 'images/ranks', 0),
('record_online_date', '1354999932', 1),
('record_online_users', '2', 1),
('referer_validation', '1', 0),
('require_activation', '0', 0),
('script_path', '/phpbb3', 0),
('search_anonymous_interval', '0', 0),
('search_block_size', '250', 0),
('search_gc', '7200', 0),
('search_indexing_state', '', 1),
('search_interval', '0', 0),
('search_last_gc', '1355655404', 1),
('search_store_results', '1800', 0),
('search_type', 'fulltext_native', 0),
('secure_allow_deny', '1', 0),
('secure_allow_empty_referer', '1', 0),
('secure_downloads', '0', 0),
('server_name', 'localhost', 0),
('server_port', '80', 0),
('server_protocol', 'http://', 0),
('session_gc', '3600', 0),
('session_last_gc', '1355655471', 1),
('session_length', '3600', 0),
('site_desc', 'Un breve testo per descrivere il tuo forum', 0),
('sitename', 'tuodominio.it', 0),
('smilies_path', 'images/smilies', 0),
('smilies_per_page', '50', 0),
('smtp_auth_method', 'PLAIN', 0),
('smtp_delivery', '0', 0),
('smtp_host', '', 0),
('smtp_password', '', 0),
('smtp_port', '25', 0),
('smtp_username', '', 0),
('topics_per_page', '25', 0),
('tpl_allow_php', '0', 0),
('upload_dir_size', '0', 1),
('upload_icons_path', 'images/upload_icons', 0),
('upload_path', 'files', 0),
('version', '3.0.11', 0),
('warnings_expire_days', '90', 0),
('warnings_gc', '14400', 0),
('warnings_last_gc', '1355655378', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_confirm`
--

CREATE TABLE IF NOT EXISTS `phpbb_confirm` (
  `confirm_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `confirm_type` tinyint(3) NOT NULL DEFAULT '0',
  `code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seed` int(10) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_disallow`
--

CREATE TABLE IF NOT EXISTS `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_drafts`
--

CREATE TABLE IF NOT EXISTS `phpbb_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `save_time` int(11) unsigned NOT NULL DEFAULT '0',
  `draft_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `draft_message` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `phpbb_drafts`
--

INSERT INTO `phpbb_drafts` (`draft_id`, `user_id`, `topic_id`, `forum_id`, `save_time`, `draft_subject`, `draft_message`) VALUES
(1, 2, 0, 1, 1355090745, 'RECITA DI FINE ANNO 2012', 0x4563636f207475747465206c6520696e666f726d617a696f6e69206368652072696775617264616e6f206c61207265636974612064692066696e6520616e6e6f2021212120436f7374756d692c207472616d6120652074616e746f20616c74726f20616e636f72612e2e2e);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_extensions`
--

CREATE TABLE IF NOT EXISTS `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

--
-- Dump dei dati per la tabella `phpbb_extensions`
--

INSERT INTO `phpbb_extensions` (`extension_id`, `group_id`, `extension`) VALUES
(1, 1, 'gif'),
(2, 1, 'png'),
(3, 1, 'jpeg'),
(4, 1, 'jpg'),
(5, 1, 'tif'),
(6, 1, 'tiff'),
(7, 1, 'tga'),
(8, 2, 'gtar'),
(9, 2, 'gz'),
(10, 2, 'tar'),
(11, 2, 'zip'),
(12, 2, 'rar'),
(13, 2, 'ace'),
(14, 2, 'torrent'),
(15, 2, 'tgz'),
(16, 2, 'bz2'),
(17, 2, '7z'),
(18, 3, 'txt'),
(19, 3, 'c'),
(20, 3, 'h'),
(21, 3, 'cpp'),
(22, 3, 'hpp'),
(23, 3, 'diz'),
(24, 3, 'csv'),
(25, 3, 'ini'),
(26, 3, 'log'),
(27, 3, 'js'),
(28, 3, 'xml'),
(29, 4, 'xls'),
(30, 4, 'xlsx'),
(31, 4, 'xlsm'),
(32, 4, 'xlsb'),
(33, 4, 'doc'),
(34, 4, 'docx'),
(35, 4, 'docm'),
(36, 4, 'dot'),
(37, 4, 'dotx'),
(38, 4, 'dotm'),
(39, 4, 'pdf'),
(40, 4, 'ai'),
(41, 4, 'ps'),
(42, 4, 'ppt'),
(43, 4, 'pptx'),
(44, 4, 'pptm'),
(45, 4, 'odg'),
(46, 4, 'odp'),
(47, 4, 'ods'),
(48, 4, 'odt'),
(49, 4, 'rtf'),
(50, 5, 'rm'),
(51, 5, 'ram'),
(52, 6, 'wma'),
(53, 6, 'wmv'),
(54, 7, 'swf'),
(55, 8, 'mov'),
(56, 8, 'm4v'),
(57, 8, 'm4a'),
(58, 8, 'mp4'),
(59, 8, '3gp'),
(60, 8, '3g2'),
(61, 8, 'qt'),
(62, 9, 'mpeg'),
(63, 9, 'mpg'),
(64, 9, 'mp3'),
(65, 9, 'ogg'),
(66, 9, 'ogm');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_extension_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `allowed_forums` text COLLATE utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `phpbb_extension_groups`
--

INSERT INTO `phpbb_extension_groups` (`group_id`, `group_name`, `cat_id`, `allow_group`, `download_mode`, `upload_icon`, `max_filesize`, `allowed_forums`, `allow_in_pm`) VALUES
(1, 'IMAGES', 1, 1, 1, '', 0, '', 0),
(2, 'ARCHIVES', 0, 1, 1, '', 0, '', 0),
(3, 'PLAIN_TEXT', 0, 0, 1, '', 0, '', 0),
(4, 'DOCUMENTS', 0, 0, 1, '', 0, '', 0),
(5, 'REAL_MEDIA', 3, 0, 1, '', 0, '', 0),
(6, 'WINDOWS_MEDIA', 2, 0, 1, '', 0, '', 0),
(7, 'FLASH_FILES', 5, 0, 1, '', 0, '', 0),
(8, 'QUICKTIME_MEDIA', 6, 0, 1, '', 0, '', 0),
(9, 'DOWNLOADABLE_FILES', 0, 0, 1, '', 0, '', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_parents` mediumtext COLLATE utf8_bin NOT NULL,
  `forum_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc` text COLLATE utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules` text COLLATE utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_rules_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_topics_per_page` tinyint(4) NOT NULL DEFAULT '0',
  `forum_type` tinyint(4) NOT NULL DEFAULT '0',
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_real` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_flags` tinyint(4) NOT NULL DEFAULT '32',
  `forum_options` int(20) unsigned NOT NULL DEFAULT '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_icons` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) unsigned NOT NULL DEFAULT '0',
  `prune_days` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_freq` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dump dei dati per la tabella `phpbb_forums`
--

INSERT INTO `phpbb_forums` (`forum_id`, `parent_id`, `left_id`, `right_id`, `forum_parents`, `forum_name`, `forum_desc`, `forum_desc_bitfield`, `forum_desc_options`, `forum_desc_uid`, `forum_link`, `forum_password`, `forum_style`, `forum_image`, `forum_rules`, `forum_rules_link`, `forum_rules_bitfield`, `forum_rules_options`, `forum_rules_uid`, `forum_topics_per_page`, `forum_type`, `forum_status`, `forum_posts`, `forum_topics`, `forum_topics_real`, `forum_last_post_id`, `forum_last_poster_id`, `forum_last_post_subject`, `forum_last_post_time`, `forum_last_poster_name`, `forum_last_poster_colour`, `forum_flags`, `forum_options`, `display_subforum_list`, `display_on_index`, `enable_indexing`, `enable_icons`, `enable_prune`, `prune_next`, `prune_days`, `prune_viewed`, `prune_freq`) VALUES
(1, 0, 1, 4, '', 'RECITA DI FINE ANNO 2012', 0x4563636f207475747465206c6520696e666f726d617a696f6e69206368652072696775617264616e6f206c61207265636974612064692066696e6520616e6e6f2021212120436f7374756d692c207472616d6120652074616e746f20616c74726f20616e636f72612e2e2e, '', 7, '', '', '', 0, '', '', '', '', 7, '', 10, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 112, 0, 1, 0, 1, 0, 0, 0, 7, 7, 1),
(2, 0, 5, 6, '', 'INCONTRO GENITORI MESE FEBBRAIO', 0x496e76697469616d6f20692067656e69746f72692061207072656e6465726520706172746520612071756573746f20696e636f6e74726f20212121204e6f6e206d616e636174652e2e2e, '', 7, '', '', '', 0, '', '', '', '', 7, '', 0, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 48, 0, 1, 0, 1, 0, 0, 0, 7, 7, 1),
(6, 0, 7, 8, '', 'ARGOMENTO 1', 0x556e206e756f766f20666f72756d20636865207065726d6574746520646920636f6e646976656465726520696e666f726d617a696f6e69, '', 7, '', '', '', 0, '', '', '', '', 7, '', 10, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 112, 0, 1, 1, 1, 0, 0, 0, 7, 7, 1),
(7, 0, 9, 10, '', 'ARGOMENTO 2', 0x556e206e756f766f20666f72756d20636865207065726d6574746520646920636f6e646976656465726520696e666f726d617a696f6e69, '', 7, '', '', '', 0, '', '', '', '', 7, '', 0, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 48, 0, 1, 1, 1, 0, 0, 0, 7, 7, 1),
(8, 0, 11, 12, '', 'ARGOMENTO 3', 0x556e206e756f766f20666f72756d20636865207065726d6574746520646920636f6e646976656465726520696e666f726d617a696f6e69, '', 7, '', '', '', 0, '', '', '', '', 7, '', 10, 1, 0, 0, 0, 0, 0, 0, '', 0, '', '', 112, 0, 1, 1, 1, 1, 0, 0, 7, 7, 1),
(9, 1, 2, 3, 0x613a313a7b693a313b613a323a7b693a303b733a32343a225245434954412044492046494e4520414e4e4f2032303132223b693a313b693a313b7d7d, 'Costumi', '', '', 7, '', '', '', 0, '', '', '', '', 7, '', 5, 1, 0, 2, 1, 1, 4, 58, 'Famiglia Bianchi', 1355174726, 'genitore1', '', 112, 0, 1, 1, 1, 1, 0, 0, 7, 7, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums_access`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`forum_id`,`user_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums_track`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_forums_track`
--

INSERT INTO `phpbb_forums_track` (`user_id`, `forum_id`, `mark_time`) VALUES
(2, 1, 1355090937),
(2, 9, 1355174926),
(57, 9, 1355173113),
(58, 9, 1355174726);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_forums_watch`
--

CREATE TABLE IF NOT EXISTS `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_forums_watch`
--

INSERT INTO `phpbb_forums_watch` (`forum_id`, `user_id`, `notify_status`) VALUES
(1, 2, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_groups`
--

CREATE TABLE IF NOT EXISTS `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `group_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_legend` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `phpbb_groups`
--

INSERT INTO `phpbb_groups` (`group_id`, `group_type`, `group_founder_manage`, `group_skip_auth`, `group_name`, `group_desc`, `group_desc_bitfield`, `group_desc_options`, `group_desc_uid`, `group_display`, `group_avatar`, `group_avatar_type`, `group_avatar_width`, `group_avatar_height`, `group_rank`, `group_colour`, `group_sig_chars`, `group_receive_pm`, `group_message_limit`, `group_max_recipients`, `group_legend`) VALUES
(1, 3, 0, 0, 'GUESTS', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(2, 3, 0, 0, 'REGISTERED', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(3, 3, 0, 0, 'REGISTERED_COPPA', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0),
(4, 3, 0, 0, 'GLOBAL_MODERATORS', '', '', 7, '', 0, '', 0, 0, 0, 0, '00AA00', 0, 0, 0, 0, 1),
(5, 3, 1, 0, 'ADMINISTRATORS', '', '', 7, '', 0, '', 0, 0, 0, 0, 'AA0000', 0, 0, 0, 0, 1),
(6, 3, 0, 0, 'BOTS', '', '', 7, '', 0, '', 0, 0, 0, 0, '9E8DA7', 0, 0, 0, 5, 0),
(7, 3, 0, 0, 'NEWLY_REGISTERED', '', '', 7, '', 0, '', 0, 0, 0, 0, '', 0, 0, 0, 5, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_icons`
--

CREATE TABLE IF NOT EXISTS `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icons_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_width` tinyint(4) NOT NULL DEFAULT '0',
  `icons_height` tinyint(4) NOT NULL DEFAULT '0',
  `icons_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Dump dei dati per la tabella `phpbb_icons`
--

INSERT INTO `phpbb_icons` (`icons_id`, `icons_url`, `icons_width`, `icons_height`, `icons_order`, `display_on_posting`) VALUES
(1, 'misc/fire.gif', 16, 16, 1, 1),
(2, 'smile/redface.gif', 16, 16, 9, 1),
(3, 'smile/mrgreen.gif', 16, 16, 10, 1),
(4, 'misc/heart.gif', 16, 16, 4, 1),
(5, 'misc/star.gif', 16, 16, 2, 1),
(6, 'misc/radioactive.gif', 16, 16, 3, 1),
(7, 'misc/thinking.gif', 16, 16, 5, 1),
(8, 'smile/info.gif', 16, 16, 8, 1),
(9, 'smile/question.gif', 16, 16, 6, 1),
(10, 'smile/alert.gif', 16, 16, 7, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_dir` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_english_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_local_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_author` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `phpbb_lang`
--

INSERT INTO `phpbb_lang` (`lang_id`, `lang_iso`, `lang_dir`, `lang_english_name`, `lang_local_name`, `lang_author`) VALUES
(1, 'en', 'en', 'British English', 'British English', 'phpBB Group'),
(2, 'it', 'it', 'Italian', 'Italiano', 'phpBB.it, phpBBItalia.net');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_log`
--

CREATE TABLE IF NOT EXISTS `phpbb_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reportee_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_operation` text COLLATE utf8_bin NOT NULL,
  `log_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2287 ;

--
-- Dump dei dati per la tabella `phpbb_log`
--

INSERT INTO `phpbb_log` (`log_id`, `log_type`, `user_id`, `forum_id`, `topic_id`, `reportee_id`, `log_ip`, `log_time`, `log_operation`, `log_data`) VALUES
(278, 3, 2, 0, 0, 54, '::1', 1355029237, 0x4c4f475f555345525f4e45575f50415353574f5244, 0x613a313a7b693a303b733a393a2247656e69746f726531223b7d),
(611, 1, 2, 1, 1, 0, '::1', 1355090973, 0x4c4f475f44454c4554455f504f5354, 0x613a323a7b693a303b733a32383a2252653a205245434954412044492046494e4520414e4e4f2032303132223b693a313b733a353a2261646d696e223b7d),
(615, 1, 2, 1, 1, 0, '::1', 1355090982, 0x4c4f475f44454c4554455f504f5354, 0x613a323a7b693a303b733a32383a2252653a205245434954412044492046494e4520414e4e4f2032303132223b693a313b733a353a2261646d696e223b7d),
(826, 3, 2, 0, 0, 1, '::1', 1355093087, 0x4c4f475f555345525f4e45575f50415353574f5244, 0x613a313a7b693a303b733a393a22416e6f6e796d6f7573223b7d),
(830, 3, 2, 0, 0, 1, '::1', 1355093099, 0x4c4f475f555345525f5550444154455f4e414d45, 0x613a323a7b693a303b733a393a22416e6f6e796d6f7573223b693a313b733a393a2247656e69746f726531223b7d),
(1087, 3, 2, 0, 0, 1, '::1', 1355166520, 0x4c4f475f555345525f5550444154455f4e414d45, 0x613a323a7b693a303b733a393a2247656e69746f726531223b693a313b733a31303a226369616f6d6f6e646f32223b7d),
(1088, 3, 2, 0, 0, 1, '::1', 1355166520, 0x4c4f475f555345525f4e45575f50415353574f5244, 0x613a313a7b693a303b733a393a2247656e69746f726531223b7d),
(1421, 1, 57, 9, 1, 0, '::1', 1355173076, 0x4c4f475f44454c4554455f544f504943, 0x613a323a7b693a303b733a31343a2246616d69676c696120526f737369223b693a313b733a393a2267656e69746f726532223b7d),
(1517, 1, 58, 9, 2, 0, '::1', 1355174664, 0x4c4f475f44454c4554455f504f5354, 0x613a323a7b693a303b733a31363a2246616d69676c6961204269616e636869223b693a313b733a393a2267656e69746f726531223b7d),
(1972, 0, 2, 0, 0, 0, '::1', 1355236977, 0x4c4f475f434c4541525f41444d494e, ''),
(1973, 0, 2, 0, 0, 0, '::1', 1355236981, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1974, 0, 2, 0, 0, 0, '::1', 1355236983, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1975, 0, 2, 0, 0, 0, '::1', 1355236987, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1976, 0, 2, 0, 0, 0, '::1', 1355236989, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1977, 0, 2, 0, 0, 0, '::1', 1355236995, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1978, 0, 2, 0, 0, 0, '::1', 1355236997, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1979, 0, 2, 0, 0, 0, '::1', 1355237010, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1980, 0, 2, 0, 0, 0, '::1', 1355237019, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1981, 0, 2, 0, 0, 0, '::1', 1355237067, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1982, 0, 2, 0, 0, 0, '::1', 1355237069, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1983, 0, 2, 0, 0, 0, '::1', 1355237075, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1984, 0, 2, 0, 0, 0, '::1', 1355237079, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1985, 0, 2, 0, 0, 0, '::1', 1355237084, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1986, 0, 2, 0, 0, 0, '::1', 1355237084, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a3834363a22636170746368615f64656661756c742c20636f6e6669726d5f626f64792c206472616674732c206661715f626f64792c20666f72756d6c6973745f626f64792c20696e6465785f626f64792c206a756d70626f782c206c6f67696e5f626f64792c206d63705f666f6f7465722c206d63705f666f72756d2c206d63705f66726f6e742c206d63705f6865616465722c206d63705f6c6f67732c206d63705f71756575652c206d63705f7265706f7274732c206d656d6265726c6973745f626f64792c206d656d6265726c6973745f7365617263682c206d656d6265726c6973745f766965772c206d6573736167655f626f64792c206f766572616c6c5f666f6f7465722c206f766572616c6c5f6865616465722c20706f7374696e675f6174746163685f626f64792c20706f7374696e675f626f64792c20706f7374696e675f627574746f6e732c20706f7374696e675f656469746f722c20706f7374696e675f6c61796f75742c20706f7374696e675f706d5f6c61796f75742c20706f7374696e675f706f6c6c5f626f64792c20706f7374696e675f707265766965772c20706f7374696e675f7265766965772c20706f7374696e675f746f7069635f7265766965772c20717569636b7265706c795f656469746f722c207265706f72745f626f64792c207365617263685f626f64792c207365617263685f726573756c74732c2073696d706c655f666f6f7465722c2073696d706c655f6865616465722c207563705f61677265656d656e742c207563705f666f6f7465722c207563705f67726f7570735f6d656d626572736869702c207563705f6865616465722c207563705f6d61696e5f66726f6e742c207563705f6d61696e5f737562736372696265642c207563705f706d5f686973746f72792c207563705f706d5f6d6573736167655f666f6f7465722c207563705f706d5f6d6573736167655f6865616465722c207563705f706d5f76696577666f6c6465722c207563705f70726566735f706572736f6e616c2c207563705f70726f66696c655f70726f66696c655f696e666f2c207563705f72656769737465722c207563705f72656d696e642c207563705f7a656272615f667269656e64732c2076696577666f72756d5f626f64792c2076696577746f7069635f626f6479223b7d),
(1987, 0, 2, 0, 0, 0, '::1', 1355237087, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1988, 0, 2, 0, 0, 0, '::1', 1355237104, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1989, 0, 2, 0, 0, 0, '::1', 1355237203, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1990, 0, 2, 0, 0, 0, '::1', 1355237208, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1991, 0, 2, 0, 0, 0, '::1', 1355237211, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1992, 0, 2, 0, 0, 0, '::1', 1355237213, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1993, 0, 2, 0, 0, 0, '::1', 1355237223, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1994, 0, 2, 0, 0, 0, '::1', 1355237236, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1995, 0, 2, 0, 0, 0, '::1', 1355237239, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1996, 0, 2, 0, 0, 0, '::1', 1355237273, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1997, 0, 2, 0, 0, 0, '::1', 1355237282, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1998, 0, 2, 0, 0, 0, '::1', 1355237297, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(1999, 0, 2, 0, 0, 0, '::1', 1355237300, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2000, 0, 2, 0, 0, 0, '::1', 1355237307, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2001, 0, 2, 0, 0, 0, '::1', 1355237311, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2002, 0, 2, 0, 0, 0, '::1', 1355237314, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2003, 0, 2, 0, 0, 0, '::1', 1355237327, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2004, 0, 2, 0, 0, 0, '::1', 1355237332, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2005, 0, 2, 0, 0, 0, '::1', 1355237335, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2006, 0, 2, 0, 0, 0, '::1', 1355237338, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2007, 0, 2, 0, 0, 0, '::1', 1355237342, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2008, 0, 2, 0, 0, 0, '::1', 1355237350, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2009, 0, 2, 0, 0, 0, '::1', 1355237355, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2010, 0, 2, 0, 0, 0, '::1', 1355237361, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2011, 0, 2, 0, 0, 0, '::1', 1355237361, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31323a22547574746920692066696c65223b7d),
(2012, 0, 2, 0, 0, 0, '::1', 1355237365, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2013, 0, 2, 0, 0, 0, '::1', 1355237471, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2014, 0, 2, 0, 0, 0, '::1', 1355237480, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2015, 0, 2, 0, 0, 0, '::1', 1355237488, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2016, 0, 2, 0, 0, 0, '::1', 1355237488, 0x4c4f475f5354594c455f454449545f44455441494c53, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2017, 0, 2, 0, 0, 0, '::1', 1355237492, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2018, 0, 2, 0, 0, 0, '::1', 1355237508, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2019, 0, 2, 0, 0, 0, '::1', 1355238528, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2020, 0, 2, 0, 0, 0, '::1', 1355238906, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2021, 0, 1, 0, 0, 0, '::1', 1355238912, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2022, 0, 1, 0, 0, 0, '::1', 1355239597, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2023, 0, 1, 0, 0, 0, '::1', 1355239719, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2024, 0, 1, 0, 0, 0, '::1', 1355239724, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2025, 0, 1, 0, 0, 0, '::1', 1355239772, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2026, 0, 1, 0, 0, 0, '::1', 1355239785, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2027, 0, 1, 0, 0, 0, '::1', 1355239797, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2028, 0, 1, 0, 0, 0, '::1', 1355239954, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2029, 0, 1, 0, 0, 0, '::1', 1355240006, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2030, 0, 1, 0, 0, 0, '::1', 1355240304, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2031, 0, 2, 0, 0, 0, '::1', 1355240310, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2032, 0, 2, 0, 0, 0, '::1', 1355240333, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2033, 0, 2, 0, 0, 0, '::1', 1355240333, 0x4c4f475f41444d494e5f415554485f53554343455353, ''),
(2034, 0, 2, 0, 0, 0, '::1', 1355240339, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2035, 0, 2, 0, 0, 0, '::1', 1355240441, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2036, 0, 2, 0, 0, 0, '::1', 1355240447, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2037, 0, 2, 0, 0, 0, '::1', 1355240451, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2038, 0, 2, 0, 0, 0, '::1', 1355240454, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2039, 0, 2, 0, 0, 0, '::1', 1355240456, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2040, 0, 2, 0, 0, 0, '::1', 1355240456, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a38343a22666f72756d6c6973745f626f64792c20696e6465785f626f64792c206c6f67696e5f626f64792c206d6573736167655f626f64792c206f766572616c6c5f666f6f7465722c206f766572616c6c5f686561646572223b7d),
(2041, 0, 2, 0, 0, 0, '::1', 1355240459, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2042, 0, 2, 0, 0, 0, '::1', 1355240463, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2043, 0, 2, 0, 0, 0, '::1', 1355240466, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2044, 0, 2, 0, 0, 0, '::1', 1355240466, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31323a22547574746920692066696c65223b7d),
(2045, 0, 2, 0, 0, 0, '::1', 1355240469, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2046, 0, 2, 0, 0, 0, '::1', 1355240474, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2047, 0, 2, 0, 0, 0, '::1', 1355240485, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2048, 0, 2, 0, 0, 0, '::1', 1355240543, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2049, 0, 2, 0, 0, 0, '::1', 1355240550, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2050, 0, 2, 0, 0, 0, '::1', 1355240554, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2051, 0, 2, 0, 0, 0, '::1', 1355240558, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2052, 0, 2, 0, 0, 0, '::1', 1355240560, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2053, 0, 2, 0, 0, 0, '::1', 1355240561, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2054, 0, 2, 0, 0, 0, '::1', 1355240565, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2055, 0, 2, 0, 0, 0, '::1', 1355240571, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2056, 0, 2, 0, 0, 0, '::1', 1355240737, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2057, 0, 2, 0, 0, 0, '::1', 1355240970, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2058, 0, 2, 0, 0, 0, '::1', 1355240973, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2059, 0, 2, 0, 0, 0, '::1', 1355240976, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2060, 0, 2, 0, 0, 0, '::1', 1355240976, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2061, 0, 2, 0, 0, 0, '::1', 1355240980, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2062, 0, 2, 0, 0, 0, '::1', 1355240983, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2063, 0, 2, 0, 0, 0, '::1', 1355240985, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2064, 0, 2, 0, 0, 0, '::1', 1355240986, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31323a22547574746920692066696c65223b7d),
(2065, 0, 2, 0, 0, 0, '::1', 1355241082, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2066, 0, 1, 0, 0, 0, '::1', 1355241289, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2067, 0, 1, 0, 0, 0, '::1', 1355241294, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2068, 0, 1, 0, 0, 0, '::1', 1355243147, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2069, 0, 1, 0, 0, 0, '::1', 1355243184, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2070, 0, 1, 0, 0, 0, '::1', 1355243596, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2071, 0, 1, 0, 0, 0, '::1', 1355243711, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2072, 0, 1, 0, 0, 0, '::1', 1355253813, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2073, 0, 1, 0, 0, 0, '::1', 1355257778, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2074, 0, 1, 0, 0, 0, '::1', 1355260099, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2075, 0, 1, 0, 0, 0, '::1', 1355260269, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2076, 0, 1, 0, 0, 0, '::1', 1355260731, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2077, 0, 1, 0, 0, 0, '::1', 1355261029, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2078, 0, 1, 0, 0, 0, '::1', 1355261036, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2079, 0, 2, 0, 0, 0, '::1', 1355261042, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2080, 0, 2, 0, 0, 0, '::1', 1355261047, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2081, 0, 2, 0, 0, 0, '::1', 1355261056, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2082, 0, 2, 0, 0, 0, '::1', 1355261056, 0x4c4f475f41444d494e5f415554485f53554343455353, ''),
(2083, 0, 2, 0, 0, 0, '::1', 1355261062, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2084, 0, 2, 0, 0, 0, '::1', 1355261066, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2085, 0, 2, 0, 0, 0, '::1', 1355261069, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2086, 0, 2, 0, 0, 0, '::1', 1355261077, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2087, 0, 2, 0, 0, 0, '::1', 1355261081, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2088, 0, 2, 0, 0, 0, '::1', 1355261081, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a38343a22666f72756d6c6973745f626f64792c20696e6465785f626f64792c206c6f67696e5f626f64792c206d6573736167655f626f64792c206f766572616c6c5f666f6f7465722c206f766572616c6c5f686561646572223b7d),
(2089, 0, 2, 0, 0, 0, '::1', 1355261084, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2090, 0, 2, 0, 0, 0, '::1', 1355261086, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2091, 0, 2, 0, 0, 0, '::1', 1355261089, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2092, 0, 2, 0, 0, 0, '::1', 1355261091, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2093, 0, 2, 0, 0, 0, '::1', 1355261092, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31323a22547574746920692066696c65223b7d),
(2094, 0, 2, 0, 0, 0, '::1', 1355261094, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2095, 0, 2, 0, 0, 0, '::1', 1355261097, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2096, 0, 2, 0, 0, 0, '::1', 1355261100, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2097, 0, 2, 0, 0, 0, '::1', 1355261100, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2098, 0, 2, 0, 0, 0, '::1', 1355261107, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2099, 0, 2, 0, 0, 0, '::1', 1355261267, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2100, 0, 2, 0, 0, 0, '::1', 1355261270, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2101, 0, 2, 0, 0, 0, '::1', 1355261272, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2102, 0, 2, 0, 0, 0, '::1', 1355261272, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2103, 0, 2, 0, 0, 0, '::1', 1355261274, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2104, 0, 2, 0, 0, 0, '::1', 1355261277, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2105, 0, 2, 0, 0, 0, '::1', 1355261280, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2106, 0, 2, 0, 0, 0, '::1', 1355261280, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a35383a22666f72756d6c6973745f626f64792c20696e6465785f626f64792c206f766572616c6c5f666f6f7465722c206f766572616c6c5f686561646572223b7d),
(2107, 0, 2, 0, 0, 0, '::1', 1355261283, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2108, 0, 2, 0, 0, 0, '::1', 1355261287, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2109, 0, 2, 0, 0, 0, '::1', 1355261290, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2110, 0, 2, 0, 0, 0, '::1', 1355261290, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31323a22547574746920692066696c65223b7d),
(2111, 0, 2, 0, 0, 0, '::1', 1355261293, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2112, 0, 2, 0, 0, 0, '::1', 1355261352, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2113, 0, 2, 0, 0, 0, '::1', 1355261361, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2114, 0, 1, 0, 0, 0, '::1', 1355261366, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2115, 0, 1, 0, 0, 0, '::1', 1355262957, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2116, 0, 1, 0, 0, 0, '::1', 1355262979, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2117, 0, 1, 0, 0, 0, '::1', 1355293799, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2118, 0, 1, 0, 0, 0, '::1', 1355293900, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2119, 0, 1, 0, 0, 0, '::1', 1355293918, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2120, 0, 1, 0, 0, 0, '::1', 1355293936, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2121, 0, 1, 0, 0, 0, '::1', 1355300906, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2122, 0, 1, 0, 0, 0, '::1', 1355300961, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2123, 0, 1, 0, 0, 0, '::1', 1355301153, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2124, 0, 2, 0, 0, 0, '::1', 1355301158, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2125, 0, 2, 0, 0, 0, '::1', 1355301204, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2126, 0, 2, 0, 0, 0, '::1', 1355301205, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2127, 0, 2, 0, 0, 0, '::1', 1355301571, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2128, 0, 2, 0, 0, 0, '::1', 1355301572, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2129, 0, 2, 0, 0, 0, '::1', 1355301576, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2130, 0, 1, 0, 0, 0, '::1', 1355301581, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2131, 0, 1, 0, 0, 0, '::1', 1355301594, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2132, 0, 1, 0, 0, 0, '::1', 1355301758, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2133, 0, 1, 0, 0, 0, '::1', 1355301767, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2134, 0, 2, 0, 0, 0, '::1', 1355301771, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2135, 0, 2, 0, 0, 0, '::1', 1355301772, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2136, 0, 2, 0, 0, 0, '::1', 1355301789, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2137, 0, 2, 0, 0, 0, '::1', 1355301793, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2138, 0, 2, 0, 0, 0, '::1', 1355301800, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2139, 0, 2, 0, 0, 0, '::1', 1355301830, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2140, 0, 2, 0, 0, 0, '::1', 1355301840, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2141, 0, 2, 0, 0, 0, '::1', 1355301840, 0x4c4f475f41444d494e5f415554485f53554343455353, ''),
(2142, 0, 2, 0, 0, 0, '::1', 1355301844, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2143, 0, 2, 0, 0, 0, '::1', 1355301849, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2144, 0, 2, 0, 0, 0, '::1', 1355301852, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2145, 0, 2, 0, 0, 0, '::1', 1355301860, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2146, 0, 2, 0, 0, 0, '::1', 1355301884, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2147, 0, 1, 0, 0, 0, '::1', 1355309702, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2148, 0, 1, 0, 0, 0, '::1', 1355408109, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2149, 0, 1, 0, 0, 0, '::1', 1355408287, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2150, 0, 1, 0, 0, 0, '::1', 1355413284, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2151, 0, 1, 0, 0, 0, '::1', 1355655343, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2152, 0, 1, 0, 0, 0, '::1', 1355655376, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2153, 0, 1, 0, 0, 0, '::1', 1355655386, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2154, 0, 1, 0, 0, 0, '::1', 1355655398, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2155, 0, 2, 0, 0, 0, '::1', 1355655403, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2156, 0, 2, 0, 0, 0, '::1', 1355655409, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2157, 0, 2, 0, 0, 0, '::1', 1355655410, 0x4c4f475f41444d494e5f415554485f53554343455353, ''),
(2158, 0, 2, 0, 0, 0, '::1', 1355655413, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2159, 0, 2, 0, 0, 0, '::1', 1355655420, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2160, 0, 2, 0, 0, 0, '::1', 1355655427, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2161, 0, 2, 0, 0, 0, '::1', 1355655431, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2162, 0, 2, 0, 0, 0, '::1', 1355655435, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2163, 0, 2, 0, 0, 0, '::1', 1355655435, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a3135383a22666f72756d6c6973745f626f64792c20696e6465785f626f64792c206a756d70626f782c206c6f67696e5f626f64792c206d6573736167655f626f64792c206f766572616c6c5f666f6f7465722c206f766572616c6c5f6865616465722c20717569636b7265706c795f656469746f722c207563705f72656769737465722c2076696577666f72756d5f626f64792c2076696577746f7069635f626f6479223b7d),
(2164, 0, 2, 0, 0, 0, '::1', 1355655438, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2165, 0, 2, 0, 0, 0, '::1', 1355655441, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2166, 0, 2, 0, 0, 0, '::1', 1355655443, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2167, 0, 2, 0, 0, 0, '::1', 1355655446, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2168, 0, 2, 0, 0, 0, '::1', 1355655448, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2169, 0, 2, 0, 0, 0, '::1', 1355655448, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31323a22547574746920692066696c65223b7d),
(2170, 0, 2, 0, 0, 0, '::1', 1355655450, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2171, 0, 2, 0, 0, 0, '::1', 1355655452, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2172, 0, 2, 0, 0, 0, '::1', 1355655455, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2173, 0, 2, 0, 0, 0, '::1', 1355655458, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2174, 0, 2, 0, 0, 0, '::1', 1355655458, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2175, 0, 2, 0, 0, 0, '::1', 1355655460, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2176, 0, 2, 0, 0, 0, '::1', 1355655470, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2177, 0, 2, 0, 0, 0, '::1', 1355655595, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2178, 0, 2, 0, 0, 0, '::1', 1355655622, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2179, 0, 2, 0, 0, 0, '::1', 1355655626, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2180, 0, 2, 0, 0, 0, '::1', 1355655629, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2181, 0, 2, 0, 0, 0, '::1', 1355655629, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2182, 0, 2, 0, 0, 0, '::1', 1355655632, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2183, 0, 2, 0, 0, 0, '::1', 1355655634, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2184, 0, 2, 0, 0, 0, '::1', 1355655966, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2185, 0, 2, 0, 0, 0, '::1', 1355656026, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2186, 0, 2, 0, 0, 0, '::1', 1355656029, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2187, 0, 2, 0, 0, 0, '::1', 1355656029, 0x4c4f475f5448454d455f524546524553484544, 0x613a313a7b693a303b733a31323a22654d757a615f73756d6d6572223b7d),
(2188, 0, 2, 0, 0, 0, '::1', 1355656032, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2189, 0, 2, 0, 0, 0, '::1', 1355656036, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2190, 0, 2, 0, 0, 0, '::1', 1355656070, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2191, 0, 2, 0, 0, 0, '::1', 1355656097, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2192, 0, 2, 0, 0, 0, '::1', 1355656107, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2193, 0, 2, 0, 0, 0, '::1', 1355656107, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2194, 0, 2, 0, 0, 0, '::1', 1355656151, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2195, 0, 2, 0, 0, 0, '::1', 1355656151, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2196, 0, 2, 0, 0, 0, '::1', 1355656151, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2197, 0, 2, 0, 0, 0, '::1', 1355656154, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2198, 0, 2, 0, 0, 0, '::1', 1355656162, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2199, 0, 2, 0, 0, 0, '::1', 1355656176, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2200, 0, 2, 0, 0, 0, '::1', 1355656176, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2201, 0, 2, 0, 0, 0, '::1', 1355656176, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2202, 0, 2, 0, 0, 0, '::1', 1355656179, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2203, 0, 2, 0, 0, 0, '::1', 1355656190, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2204, 0, 2, 0, 0, 0, '::1', 1355656283, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2205, 0, 2, 0, 0, 0, '::1', 1355656283, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2206, 0, 2, 0, 0, 0, '::1', 1355656283, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2207, 0, 2, 0, 0, 0, '::1', 1355656286, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2208, 0, 2, 0, 0, 0, '::1', 1355656296, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2209, 0, 2, 0, 0, 0, '::1', 1355656551, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2210, 0, 2, 0, 0, 0, '::1', 1355656551, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2211, 0, 2, 0, 0, 0, '::1', 1355656551, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2212, 0, 2, 0, 0, 0, '::1', 1355656554, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2213, 0, 2, 0, 0, 0, '::1', 1355656701, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2214, 0, 2, 0, 0, 0, '::1', 1355656745, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2215, 0, 2, 0, 0, 0, '::1', 1355656746, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2216, 0, 2, 0, 0, 0, '::1', 1355656746, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2217, 0, 2, 0, 0, 0, '::1', 1355656764, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2218, 0, 2, 0, 0, 0, '::1', 1355656772, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2219, 0, 2, 0, 0, 0, '::1', 1355656794, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2220, 0, 2, 0, 0, 0, '::1', 1355656794, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2221, 0, 2, 0, 0, 0, '::1', 1355656794, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d);
INSERT INTO `phpbb_log` (`log_id`, `log_type`, `user_id`, `forum_id`, `topic_id`, `reportee_id`, `log_ip`, `log_time`, `log_operation`, `log_data`) VALUES
(2222, 0, 2, 0, 0, 0, '::1', 1355656797, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2223, 0, 2, 0, 0, 0, '::1', 1355656806, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2224, 0, 2, 0, 0, 0, '::1', 1355656819, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2225, 0, 2, 0, 0, 0, '::1', 1355656819, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2226, 0, 2, 0, 0, 0, '::1', 1355656819, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2227, 0, 2, 0, 0, 0, '::1', 1355656823, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2228, 0, 2, 0, 0, 0, '::1', 1355656831, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2229, 0, 2, 0, 0, 0, '::1', 1355656862, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2230, 0, 2, 0, 0, 0, '::1', 1355656862, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2231, 0, 2, 0, 0, 0, '::1', 1355656862, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2232, 0, 2, 0, 0, 0, '::1', 1355656865, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2233, 0, 2, 0, 0, 0, '::1', 1355656879, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2234, 0, 2, 0, 0, 0, '::1', 1355656898, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2235, 0, 2, 0, 0, 0, '::1', 1355656898, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2236, 0, 2, 0, 0, 0, '::1', 1355656898, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2237, 0, 2, 0, 0, 0, '::1', 1355656900, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2238, 0, 2, 0, 0, 0, '::1', 1355656913, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2239, 0, 2, 0, 0, 0, '::1', 1355656929, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2240, 0, 2, 0, 0, 0, '::1', 1355656929, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2241, 0, 2, 0, 0, 0, '::1', 1355656929, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2242, 0, 2, 0, 0, 0, '::1', 1355656932, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2243, 0, 2, 0, 0, 0, '::1', 1355656948, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2244, 0, 2, 0, 0, 0, '::1', 1355656966, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2245, 0, 2, 0, 0, 0, '::1', 1355656967, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2246, 0, 2, 0, 0, 0, '::1', 1355656978, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2247, 0, 2, 0, 0, 0, '::1', 1355657016, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2248, 0, 2, 0, 0, 0, '::1', 1355657017, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2249, 0, 2, 0, 0, 0, '::1', 1355657051, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2250, 0, 2, 0, 0, 0, '::1', 1355657051, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f666f6f746572223b7d),
(2251, 0, 2, 0, 0, 0, '::1', 1355657051, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f666f6f7465722e68746d6c223b7d),
(2252, 0, 2, 0, 0, 0, '::1', 1355657054, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2253, 0, 2, 0, 0, 0, '::1', 1355657136, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2254, 0, 2, 0, 0, 0, '::1', 1355657143, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2255, 0, 2, 0, 0, 0, '::1', 1355657144, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2256, 0, 2, 0, 0, 0, '::1', 1355657150, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2257, 0, 2, 0, 0, 0, '::1', 1355657163, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2258, 0, 2, 0, 0, 0, '::1', 1355657164, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2259, 0, 2, 0, 0, 0, '::1', 1355657169, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2260, 0, 2, 0, 0, 0, '::1', 1355657170, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2261, 0, 2, 0, 0, 0, '::1', 1355657177, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2262, 0, 2, 0, 0, 0, '::1', 1355657188, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2263, 0, 2, 0, 0, 0, '::1', 1355657189, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2264, 0, 2, 0, 0, 0, '::1', 1355657219, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2265, 0, 2, 0, 0, 0, '::1', 1355657219, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2266, 0, 2, 0, 0, 0, '::1', 1355657233, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2267, 0, 2, 0, 0, 0, '::1', 1355657237, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2268, 0, 2, 0, 0, 0, '::1', 1355657270, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2269, 0, 2, 0, 0, 0, '::1', 1355657270, 0x4c4f475f54454d504c4154455f43414348455f434c4541524544, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31343a226f766572616c6c5f686561646572223b7d),
(2270, 0, 2, 0, 0, 0, '::1', 1355657270, 0x4c4f475f54454d504c4154455f45444954, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a31393a226f766572616c6c5f6865616465722e68746d6c223b7d),
(2271, 0, 2, 0, 0, 0, '::1', 1355657274, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2272, 0, 2, 0, 0, 0, '::1', 1355657277, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2273, 0, 2, 0, 0, 0, '::1', 1355657280, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2274, 0, 1, 0, 0, 0, '::1', 1355657286, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2275, 0, 1, 0, 0, 0, '::1', 1355657378, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2276, 0, 1, 0, 0, 0, '::1', 1355657387, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2277, 0, 2, 0, 0, 0, '::1', 1355657391, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2278, 0, 2, 0, 0, 0, '::1', 1355657401, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2279, 0, 2, 0, 0, 0, '::1', 1355657407, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2280, 0, 2, 0, 0, 0, '::1', 1355657408, 0x4c4f475f41444d494e5f415554485f53554343455353, ''),
(2281, 0, 2, 0, 0, 0, '::1', 1355657411, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2282, 0, 2, 0, 0, 0, '::1', 1355657428, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2283, 0, 2, 0, 0, 0, '::1', 1355657530, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2284, 0, 2, 0, 0, 0, '::1', 1355657557, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2285, 0, 2, 0, 0, 0, '::1', 1355657560, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d),
(2286, 0, 2, 0, 0, 0, '::1', 1355657562, 0x4c4f475f494d4147455345545f4c414e475f4d495353494e47, 0x613a323a7b693a303b733a31323a22654d757a615f73756d6d6572223b693a313b733a323a226974223b7d);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_login_attempts`
--

CREATE TABLE IF NOT EXISTS `phpbb_login_attempts` (
  `attempt_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  KEY `att_ip` (`attempt_ip`,`attempt_time`),
  KEY `att_for` (`attempt_forwarded_for`,`attempt_time`),
  KEY `att_time` (`attempt_time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_moderator_cache`
--

CREATE TABLE IF NOT EXISTS `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_modules`
--

CREATE TABLE IF NOT EXISTS `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_basename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_class` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_langname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_mode` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_auth` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=199 ;

--
-- Dump dei dati per la tabella `phpbb_modules`
--

INSERT INTO `phpbb_modules` (`module_id`, `module_enabled`, `module_display`, `module_basename`, `module_class`, `parent_id`, `left_id`, `right_id`, `module_langname`, `module_mode`, `module_auth`) VALUES
(1, 1, 1, '', 'acp', 0, 1, 64, 'ACP_CAT_GENERAL', '', ''),
(2, 1, 1, '', 'acp', 1, 4, 17, 'ACP_QUICK_ACCESS', '', ''),
(3, 1, 1, '', 'acp', 1, 18, 41, 'ACP_BOARD_CONFIGURATION', '', ''),
(4, 1, 1, '', 'acp', 1, 42, 49, 'ACP_CLIENT_COMMUNICATION', '', ''),
(5, 1, 1, '', 'acp', 1, 50, 63, 'ACP_SERVER_CONFIGURATION', '', ''),
(6, 1, 1, '', 'acp', 0, 65, 84, 'ACP_CAT_FORUMS', '', ''),
(7, 1, 1, '', 'acp', 6, 66, 71, 'ACP_MANAGE_FORUMS', '', ''),
(8, 1, 1, '', 'acp', 6, 72, 83, 'ACP_FORUM_BASED_PERMISSIONS', '', ''),
(9, 1, 1, '', 'acp', 0, 85, 110, 'ACP_CAT_POSTING', '', ''),
(10, 1, 1, '', 'acp', 9, 86, 99, 'ACP_MESSAGES', '', ''),
(11, 1, 1, '', 'acp', 9, 100, 109, 'ACP_ATTACHMENTS', '', ''),
(12, 1, 1, '', 'acp', 0, 111, 166, 'ACP_CAT_USERGROUP', '', ''),
(13, 1, 1, '', 'acp', 12, 112, 145, 'ACP_CAT_USERS', '', ''),
(14, 1, 1, '', 'acp', 12, 146, 153, 'ACP_GROUPS', '', ''),
(15, 1, 1, '', 'acp', 12, 154, 165, 'ACP_USER_SECURITY', '', ''),
(16, 1, 1, '', 'acp', 0, 167, 216, 'ACP_CAT_PERMISSIONS', '', ''),
(17, 1, 1, '', 'acp', 16, 170, 179, 'ACP_GLOBAL_PERMISSIONS', '', ''),
(18, 1, 1, '', 'acp', 16, 180, 191, 'ACP_FORUM_BASED_PERMISSIONS', '', ''),
(19, 1, 1, '', 'acp', 16, 192, 201, 'ACP_PERMISSION_ROLES', '', ''),
(20, 1, 1, '', 'acp', 16, 202, 215, 'ACP_PERMISSION_MASKS', '', ''),
(21, 1, 1, '', 'acp', 0, 217, 230, 'ACP_CAT_STYLES', '', ''),
(22, 1, 1, '', 'acp', 21, 218, 221, 'ACP_STYLE_MANAGEMENT', '', ''),
(23, 1, 1, '', 'acp', 21, 222, 229, 'ACP_STYLE_COMPONENTS', '', ''),
(24, 1, 1, '', 'acp', 0, 231, 250, 'ACP_CAT_MAINTENANCE', '', ''),
(25, 1, 1, '', 'acp', 24, 232, 241, 'ACP_FORUM_LOGS', '', ''),
(26, 1, 1, '', 'acp', 24, 242, 249, 'ACP_CAT_DATABASE', '', ''),
(27, 1, 1, '', 'acp', 0, 251, 276, 'ACP_CAT_SYSTEM', '', ''),
(28, 1, 1, '', 'acp', 27, 252, 255, 'ACP_AUTOMATION', '', ''),
(29, 1, 1, '', 'acp', 27, 256, 267, 'ACP_GENERAL_TASKS', '', ''),
(30, 1, 1, '', 'acp', 27, 268, 275, 'ACP_MODULE_MANAGEMENT', '', ''),
(31, 1, 1, '', 'acp', 0, 277, 278, 'ACP_CAT_DOT_MODS', '', ''),
(32, 1, 1, 'attachments', 'acp', 3, 19, 20, 'ACP_ATTACHMENT_SETTINGS', 'attach', 'acl_a_attach'),
(33, 1, 1, 'attachments', 'acp', 11, 101, 102, 'ACP_ATTACHMENT_SETTINGS', 'attach', 'acl_a_attach'),
(34, 1, 1, 'attachments', 'acp', 11, 103, 104, 'ACP_MANAGE_EXTENSIONS', 'extensions', 'acl_a_attach'),
(35, 1, 1, 'attachments', 'acp', 11, 105, 106, 'ACP_EXTENSION_GROUPS', 'ext_groups', 'acl_a_attach'),
(36, 1, 1, 'attachments', 'acp', 11, 107, 108, 'ACP_ORPHAN_ATTACHMENTS', 'orphan', 'acl_a_attach'),
(37, 1, 1, 'ban', 'acp', 15, 155, 156, 'ACP_BAN_EMAILS', 'email', 'acl_a_ban'),
(38, 1, 1, 'ban', 'acp', 15, 157, 158, 'ACP_BAN_IPS', 'ip', 'acl_a_ban'),
(39, 1, 1, 'ban', 'acp', 15, 159, 160, 'ACP_BAN_USERNAMES', 'user', 'acl_a_ban'),
(40, 1, 1, 'bbcodes', 'acp', 10, 87, 88, 'ACP_BBCODES', 'bbcodes', 'acl_a_bbcode'),
(41, 1, 1, 'board', 'acp', 3, 21, 22, 'ACP_BOARD_SETTINGS', 'settings', 'acl_a_board'),
(42, 1, 1, 'board', 'acp', 3, 23, 24, 'ACP_BOARD_FEATURES', 'features', 'acl_a_board'),
(43, 1, 1, 'board', 'acp', 3, 25, 26, 'ACP_AVATAR_SETTINGS', 'avatar', 'acl_a_board'),
(44, 1, 1, 'board', 'acp', 3, 27, 28, 'ACP_MESSAGE_SETTINGS', 'message', 'acl_a_board'),
(45, 1, 1, 'board', 'acp', 10, 89, 90, 'ACP_MESSAGE_SETTINGS', 'message', 'acl_a_board'),
(46, 1, 1, 'board', 'acp', 3, 29, 30, 'ACP_POST_SETTINGS', 'post', 'acl_a_board'),
(47, 1, 1, 'board', 'acp', 10, 91, 92, 'ACP_POST_SETTINGS', 'post', 'acl_a_board'),
(48, 1, 1, 'board', 'acp', 3, 31, 32, 'ACP_SIGNATURE_SETTINGS', 'signature', 'acl_a_board'),
(49, 1, 1, 'board', 'acp', 3, 33, 34, 'ACP_FEED_SETTINGS', 'feed', 'acl_a_board'),
(50, 1, 1, 'board', 'acp', 3, 35, 36, 'ACP_REGISTER_SETTINGS', 'registration', 'acl_a_board'),
(51, 1, 1, 'board', 'acp', 4, 43, 44, 'ACP_AUTH_SETTINGS', 'auth', 'acl_a_server'),
(52, 1, 1, 'board', 'acp', 4, 45, 46, 'ACP_EMAIL_SETTINGS', 'email', 'acl_a_server'),
(53, 1, 1, 'board', 'acp', 5, 51, 52, 'ACP_COOKIE_SETTINGS', 'cookie', 'acl_a_server'),
(54, 1, 1, 'board', 'acp', 5, 53, 54, 'ACP_SERVER_SETTINGS', 'server', 'acl_a_server'),
(55, 1, 1, 'board', 'acp', 5, 55, 56, 'ACP_SECURITY_SETTINGS', 'security', 'acl_a_server'),
(56, 1, 1, 'board', 'acp', 5, 57, 58, 'ACP_LOAD_SETTINGS', 'load', 'acl_a_server'),
(57, 1, 1, 'bots', 'acp', 29, 257, 258, 'ACP_BOTS', 'bots', 'acl_a_bots'),
(58, 1, 1, 'captcha', 'acp', 3, 37, 38, 'ACP_VC_SETTINGS', 'visual', 'acl_a_board'),
(59, 1, 0, 'captcha', 'acp', 3, 39, 40, 'ACP_VC_CAPTCHA_DISPLAY', 'img', 'acl_a_board'),
(60, 1, 1, 'database', 'acp', 26, 243, 244, 'ACP_BACKUP', 'backup', 'acl_a_backup'),
(61, 1, 1, 'database', 'acp', 26, 245, 246, 'ACP_RESTORE', 'restore', 'acl_a_backup'),
(62, 1, 1, 'disallow', 'acp', 15, 161, 162, 'ACP_DISALLOW_USERNAMES', 'usernames', 'acl_a_names'),
(63, 1, 1, 'email', 'acp', 29, 259, 260, 'ACP_MASS_EMAIL', 'email', 'acl_a_email && cfg_email_enable'),
(64, 1, 1, 'forums', 'acp', 7, 67, 68, 'ACP_MANAGE_FORUMS', 'manage', 'acl_a_forum'),
(65, 1, 1, 'groups', 'acp', 14, 147, 148, 'ACP_GROUPS_MANAGE', 'manage', 'acl_a_group'),
(66, 1, 1, 'icons', 'acp', 10, 93, 94, 'ACP_ICONS', 'icons', 'acl_a_icons'),
(67, 1, 1, 'icons', 'acp', 10, 95, 96, 'ACP_SMILIES', 'smilies', 'acl_a_icons'),
(68, 1, 1, 'inactive', 'acp', 13, 115, 116, 'ACP_INACTIVE_USERS', 'list', 'acl_a_user'),
(69, 1, 1, 'jabber', 'acp', 4, 47, 48, 'ACP_JABBER_SETTINGS', 'settings', 'acl_a_jabber'),
(70, 1, 1, 'language', 'acp', 29, 261, 262, 'ACP_LANGUAGE_PACKS', 'lang_packs', 'acl_a_language'),
(71, 1, 1, 'logs', 'acp', 25, 233, 234, 'ACP_ADMIN_LOGS', 'admin', 'acl_a_viewlogs'),
(72, 1, 1, 'logs', 'acp', 25, 235, 236, 'ACP_MOD_LOGS', 'mod', 'acl_a_viewlogs'),
(73, 1, 1, 'logs', 'acp', 25, 237, 238, 'ACP_USERS_LOGS', 'users', 'acl_a_viewlogs'),
(74, 1, 1, 'logs', 'acp', 25, 239, 240, 'ACP_CRITICAL_LOGS', 'critical', 'acl_a_viewlogs'),
(75, 1, 1, 'main', 'acp', 1, 2, 3, 'ACP_INDEX', 'main', ''),
(76, 1, 1, 'modules', 'acp', 30, 269, 270, 'ACP', 'acp', 'acl_a_modules'),
(77, 1, 1, 'modules', 'acp', 30, 271, 272, 'UCP', 'ucp', 'acl_a_modules'),
(78, 1, 1, 'modules', 'acp', 30, 273, 274, 'MCP', 'mcp', 'acl_a_modules'),
(79, 1, 1, 'permission_roles', 'acp', 19, 193, 194, 'ACP_ADMIN_ROLES', 'admin_roles', 'acl_a_roles && acl_a_aauth'),
(80, 1, 1, 'permission_roles', 'acp', 19, 195, 196, 'ACP_USER_ROLES', 'user_roles', 'acl_a_roles && acl_a_uauth'),
(81, 1, 1, 'permission_roles', 'acp', 19, 197, 198, 'ACP_MOD_ROLES', 'mod_roles', 'acl_a_roles && acl_a_mauth'),
(82, 1, 1, 'permission_roles', 'acp', 19, 199, 200, 'ACP_FORUM_ROLES', 'forum_roles', 'acl_a_roles && acl_a_fauth'),
(83, 1, 1, 'permissions', 'acp', 16, 168, 169, 'ACP_PERMISSIONS', 'intro', 'acl_a_authusers || acl_a_authgroups || acl_a_viewauth'),
(84, 1, 0, 'permissions', 'acp', 20, 203, 204, 'ACP_PERMISSION_TRACE', 'trace', 'acl_a_viewauth'),
(85, 1, 1, 'permissions', 'acp', 18, 181, 182, 'ACP_FORUM_PERMISSIONS', 'setting_forum_local', 'acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),
(86, 1, 1, 'permissions', 'acp', 18, 183, 184, 'ACP_FORUM_PERMISSIONS_COPY', 'setting_forum_copy', 'acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),
(87, 1, 1, 'permissions', 'acp', 18, 185, 186, 'ACP_FORUM_MODERATORS', 'setting_mod_local', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(88, 1, 1, 'permissions', 'acp', 17, 171, 172, 'ACP_USERS_PERMISSIONS', 'setting_user_global', 'acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(89, 1, 1, 'permissions', 'acp', 13, 117, 118, 'ACP_USERS_PERMISSIONS', 'setting_user_global', 'acl_a_authusers && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(90, 1, 1, 'permissions', 'acp', 18, 187, 188, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(91, 1, 1, 'permissions', 'acp', 13, 119, 120, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(92, 1, 1, 'permissions', 'acp', 17, 173, 174, 'ACP_GROUPS_PERMISSIONS', 'setting_group_global', 'acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(93, 1, 1, 'permissions', 'acp', 14, 149, 150, 'ACP_GROUPS_PERMISSIONS', 'setting_group_global', 'acl_a_authgroups && (acl_a_aauth || acl_a_mauth || acl_a_uauth)'),
(94, 1, 1, 'permissions', 'acp', 18, 189, 190, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(95, 1, 1, 'permissions', 'acp', 14, 151, 152, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(96, 1, 1, 'permissions', 'acp', 17, 175, 176, 'ACP_ADMINISTRATORS', 'setting_admin_global', 'acl_a_aauth && (acl_a_authusers || acl_a_authgroups)'),
(97, 1, 1, 'permissions', 'acp', 17, 177, 178, 'ACP_GLOBAL_MODERATORS', 'setting_mod_global', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(98, 1, 1, 'permissions', 'acp', 20, 205, 206, 'ACP_VIEW_ADMIN_PERMISSIONS', 'view_admin_global', 'acl_a_viewauth'),
(99, 1, 1, 'permissions', 'acp', 20, 207, 208, 'ACP_VIEW_USER_PERMISSIONS', 'view_user_global', 'acl_a_viewauth'),
(100, 1, 1, 'permissions', 'acp', 20, 209, 210, 'ACP_VIEW_GLOBAL_MOD_PERMISSIONS', 'view_mod_global', 'acl_a_viewauth'),
(101, 1, 1, 'permissions', 'acp', 20, 211, 212, 'ACP_VIEW_FORUM_MOD_PERMISSIONS', 'view_mod_local', 'acl_a_viewauth'),
(102, 1, 1, 'permissions', 'acp', 20, 213, 214, 'ACP_VIEW_FORUM_PERMISSIONS', 'view_forum_local', 'acl_a_viewauth'),
(103, 1, 1, 'php_info', 'acp', 29, 263, 264, 'ACP_PHP_INFO', 'info', 'acl_a_phpinfo'),
(104, 1, 1, 'profile', 'acp', 13, 121, 122, 'ACP_CUSTOM_PROFILE_FIELDS', 'profile', 'acl_a_profile'),
(105, 1, 1, 'prune', 'acp', 7, 69, 70, 'ACP_PRUNE_FORUMS', 'forums', 'acl_a_prune'),
(106, 1, 1, 'prune', 'acp', 15, 163, 164, 'ACP_PRUNE_USERS', 'users', 'acl_a_userdel'),
(107, 1, 1, 'ranks', 'acp', 13, 123, 124, 'ACP_MANAGE_RANKS', 'ranks', 'acl_a_ranks'),
(108, 1, 1, 'reasons', 'acp', 29, 265, 266, 'ACP_MANAGE_REASONS', 'main', 'acl_a_reasons'),
(109, 1, 1, 'search', 'acp', 5, 59, 60, 'ACP_SEARCH_SETTINGS', 'settings', 'acl_a_search'),
(110, 1, 1, 'search', 'acp', 26, 247, 248, 'ACP_SEARCH_INDEX', 'index', 'acl_a_search'),
(111, 1, 1, 'send_statistics', 'acp', 5, 61, 62, 'ACP_SEND_STATISTICS', 'send_statistics', 'acl_a_server'),
(112, 1, 1, 'styles', 'acp', 22, 219, 220, 'ACP_STYLES', 'style', 'acl_a_styles'),
(113, 1, 1, 'styles', 'acp', 23, 223, 224, 'ACP_TEMPLATES', 'template', 'acl_a_styles'),
(114, 1, 1, 'styles', 'acp', 23, 225, 226, 'ACP_THEMES', 'theme', 'acl_a_styles'),
(115, 1, 1, 'styles', 'acp', 23, 227, 228, 'ACP_IMAGESETS', 'imageset', 'acl_a_styles'),
(116, 1, 1, 'update', 'acp', 28, 253, 254, 'ACP_VERSION_CHECK', 'version_check', 'acl_a_board'),
(117, 1, 1, 'users', 'acp', 13, 113, 114, 'ACP_MANAGE_USERS', 'overview', 'acl_a_user'),
(118, 1, 0, 'users', 'acp', 13, 125, 126, 'ACP_USER_FEEDBACK', 'feedback', 'acl_a_user'),
(119, 1, 0, 'users', 'acp', 13, 127, 128, 'ACP_USER_WARNINGS', 'warnings', 'acl_a_user'),
(120, 1, 0, 'users', 'acp', 13, 129, 130, 'ACP_USER_PROFILE', 'profile', 'acl_a_user'),
(121, 1, 0, 'users', 'acp', 13, 131, 132, 'ACP_USER_PREFS', 'prefs', 'acl_a_user'),
(122, 1, 0, 'users', 'acp', 13, 133, 134, 'ACP_USER_AVATAR', 'avatar', 'acl_a_user'),
(123, 1, 0, 'users', 'acp', 13, 135, 136, 'ACP_USER_RANK', 'rank', 'acl_a_user'),
(124, 1, 0, 'users', 'acp', 13, 137, 138, 'ACP_USER_SIG', 'sig', 'acl_a_user'),
(125, 1, 0, 'users', 'acp', 13, 139, 140, 'ACP_USER_GROUPS', 'groups', 'acl_a_user && acl_a_group'),
(126, 1, 0, 'users', 'acp', 13, 141, 142, 'ACP_USER_PERM', 'perm', 'acl_a_user && acl_a_viewauth'),
(127, 1, 0, 'users', 'acp', 13, 143, 144, 'ACP_USER_ATTACH', 'attach', 'acl_a_user'),
(128, 1, 1, 'words', 'acp', 10, 97, 98, 'ACP_WORDS', 'words', 'acl_a_words'),
(129, 1, 1, 'users', 'acp', 2, 5, 6, 'ACP_MANAGE_USERS', 'overview', 'acl_a_user'),
(130, 1, 1, 'groups', 'acp', 2, 7, 8, 'ACP_GROUPS_MANAGE', 'manage', 'acl_a_group'),
(131, 1, 1, 'forums', 'acp', 2, 9, 10, 'ACP_MANAGE_FORUMS', 'manage', 'acl_a_forum'),
(132, 1, 1, 'logs', 'acp', 2, 11, 12, 'ACP_MOD_LOGS', 'mod', 'acl_a_viewlogs'),
(133, 1, 1, 'bots', 'acp', 2, 13, 14, 'ACP_BOTS', 'bots', 'acl_a_bots'),
(134, 1, 1, 'php_info', 'acp', 2, 15, 16, 'ACP_PHP_INFO', 'info', 'acl_a_phpinfo'),
(135, 1, 1, 'permissions', 'acp', 8, 73, 74, 'ACP_FORUM_PERMISSIONS', 'setting_forum_local', 'acl_a_fauth && (acl_a_authusers || acl_a_authgroups)'),
(136, 1, 1, 'permissions', 'acp', 8, 75, 76, 'ACP_FORUM_PERMISSIONS_COPY', 'setting_forum_copy', 'acl_a_fauth && acl_a_authusers && acl_a_authgroups && acl_a_mauth'),
(137, 1, 1, 'permissions', 'acp', 8, 77, 78, 'ACP_FORUM_MODERATORS', 'setting_mod_local', 'acl_a_mauth && (acl_a_authusers || acl_a_authgroups)'),
(138, 1, 1, 'permissions', 'acp', 8, 79, 80, 'ACP_USERS_FORUM_PERMISSIONS', 'setting_user_local', 'acl_a_authusers && (acl_a_mauth || acl_a_fauth)'),
(139, 1, 1, 'permissions', 'acp', 8, 81, 82, 'ACP_GROUPS_FORUM_PERMISSIONS', 'setting_group_local', 'acl_a_authgroups && (acl_a_mauth || acl_a_fauth)'),
(140, 1, 1, '', 'mcp', 0, 1, 10, 'MCP_MAIN', '', ''),
(141, 1, 1, '', 'mcp', 0, 11, 18, 'MCP_QUEUE', '', ''),
(142, 1, 1, '', 'mcp', 0, 19, 32, 'MCP_REPORTS', '', ''),
(143, 1, 1, '', 'mcp', 0, 33, 38, 'MCP_NOTES', '', ''),
(144, 1, 1, '', 'mcp', 0, 39, 48, 'MCP_WARN', '', ''),
(145, 1, 1, '', 'mcp', 0, 49, 56, 'MCP_LOGS', '', ''),
(146, 1, 1, '', 'mcp', 0, 57, 64, 'MCP_BAN', '', ''),
(147, 1, 1, 'ban', 'mcp', 146, 58, 59, 'MCP_BAN_USERNAMES', 'user', 'acl_m_ban'),
(148, 1, 1, 'ban', 'mcp', 146, 60, 61, 'MCP_BAN_IPS', 'ip', 'acl_m_ban'),
(149, 1, 1, 'ban', 'mcp', 146, 62, 63, 'MCP_BAN_EMAILS', 'email', 'acl_m_ban'),
(150, 1, 1, 'logs', 'mcp', 145, 50, 51, 'MCP_LOGS_FRONT', 'front', 'acl_m_ || aclf_m_'),
(151, 1, 1, 'logs', 'mcp', 145, 52, 53, 'MCP_LOGS_FORUM_VIEW', 'forum_logs', 'acl_m_,$id'),
(152, 1, 1, 'logs', 'mcp', 145, 54, 55, 'MCP_LOGS_TOPIC_VIEW', 'topic_logs', 'acl_m_,$id'),
(153, 1, 1, 'main', 'mcp', 140, 2, 3, 'MCP_MAIN_FRONT', 'front', ''),
(154, 1, 1, 'main', 'mcp', 140, 4, 5, 'MCP_MAIN_FORUM_VIEW', 'forum_view', 'acl_m_,$id'),
(155, 1, 1, 'main', 'mcp', 140, 6, 7, 'MCP_MAIN_TOPIC_VIEW', 'topic_view', 'acl_m_,$id'),
(156, 1, 1, 'main', 'mcp', 140, 8, 9, 'MCP_MAIN_POST_DETAILS', 'post_details', 'acl_m_,$id || (!$id && aclf_m_)'),
(157, 1, 1, 'notes', 'mcp', 143, 34, 35, 'MCP_NOTES_FRONT', 'front', ''),
(158, 1, 1, 'notes', 'mcp', 143, 36, 37, 'MCP_NOTES_USER', 'user_notes', ''),
(159, 1, 1, 'pm_reports', 'mcp', 142, 20, 21, 'MCP_PM_REPORTS_OPEN', 'pm_reports', 'aclf_m_report'),
(160, 1, 1, 'pm_reports', 'mcp', 142, 22, 23, 'MCP_PM_REPORTS_CLOSED', 'pm_reports_closed', 'aclf_m_report'),
(161, 1, 1, 'pm_reports', 'mcp', 142, 24, 25, 'MCP_PM_REPORT_DETAILS', 'pm_report_details', 'aclf_m_report'),
(162, 1, 1, 'queue', 'mcp', 141, 12, 13, 'MCP_QUEUE_UNAPPROVED_TOPICS', 'unapproved_topics', 'aclf_m_approve'),
(163, 1, 1, 'queue', 'mcp', 141, 14, 15, 'MCP_QUEUE_UNAPPROVED_POSTS', 'unapproved_posts', 'aclf_m_approve'),
(164, 1, 1, 'queue', 'mcp', 141, 16, 17, 'MCP_QUEUE_APPROVE_DETAILS', 'approve_details', 'acl_m_approve,$id || (!$id && aclf_m_approve)'),
(165, 1, 1, 'reports', 'mcp', 142, 26, 27, 'MCP_REPORTS_OPEN', 'reports', 'aclf_m_report'),
(166, 1, 1, 'reports', 'mcp', 142, 28, 29, 'MCP_REPORTS_CLOSED', 'reports_closed', 'aclf_m_report'),
(167, 1, 1, 'reports', 'mcp', 142, 30, 31, 'MCP_REPORT_DETAILS', 'report_details', 'acl_m_report,$id || (!$id && aclf_m_report)'),
(168, 1, 1, 'warn', 'mcp', 144, 40, 41, 'MCP_WARN_FRONT', 'front', 'aclf_m_warn'),
(169, 1, 1, 'warn', 'mcp', 144, 42, 43, 'MCP_WARN_LIST', 'list', 'aclf_m_warn'),
(170, 1, 1, 'warn', 'mcp', 144, 44, 45, 'MCP_WARN_USER', 'warn_user', 'aclf_m_warn'),
(171, 1, 1, 'warn', 'mcp', 144, 46, 47, 'MCP_WARN_POST', 'warn_post', 'acl_m_warn && acl_f_read,$id'),
(172, 1, 1, '', 'ucp', 0, 1, 12, 'UCP_MAIN', '', ''),
(173, 1, 1, '', 'ucp', 0, 13, 22, 'UCP_PROFILE', '', ''),
(174, 1, 1, '', 'ucp', 0, 23, 30, 'UCP_PREFS', '', ''),
(175, 1, 1, '', 'ucp', 0, 31, 42, 'UCP_PM', '', ''),
(176, 1, 1, '', 'ucp', 0, 43, 48, 'UCP_USERGROUPS', '', ''),
(177, 1, 1, '', 'ucp', 0, 49, 54, 'UCP_ZEBRA', '', ''),
(178, 1, 1, 'attachments', 'ucp', 172, 10, 11, 'UCP_MAIN_ATTACHMENTS', 'attachments', 'acl_u_attach'),
(179, 1, 1, 'groups', 'ucp', 176, 44, 45, 'UCP_USERGROUPS_MEMBER', 'membership', ''),
(180, 1, 1, 'groups', 'ucp', 176, 46, 47, 'UCP_USERGROUPS_MANAGE', 'manage', ''),
(181, 1, 1, 'main', 'ucp', 172, 2, 3, 'UCP_MAIN_FRONT', 'front', ''),
(182, 1, 1, 'main', 'ucp', 172, 4, 5, 'UCP_MAIN_SUBSCRIBED', 'subscribed', ''),
(183, 1, 1, 'main', 'ucp', 172, 6, 7, 'UCP_MAIN_BOOKMARKS', 'bookmarks', 'cfg_allow_bookmarks'),
(184, 1, 1, 'main', 'ucp', 172, 8, 9, 'UCP_MAIN_DRAFTS', 'drafts', ''),
(185, 1, 0, 'pm', 'ucp', 175, 32, 33, 'UCP_PM_VIEW', 'view', 'cfg_allow_privmsg'),
(186, 1, 1, 'pm', 'ucp', 175, 34, 35, 'UCP_PM_COMPOSE', 'compose', 'cfg_allow_privmsg'),
(187, 1, 1, 'pm', 'ucp', 175, 36, 37, 'UCP_PM_DRAFTS', 'drafts', 'cfg_allow_privmsg'),
(188, 1, 1, 'pm', 'ucp', 175, 38, 39, 'UCP_PM_OPTIONS', 'options', 'cfg_allow_privmsg'),
(189, 1, 0, 'pm', 'ucp', 175, 40, 41, 'UCP_PM_POPUP_TITLE', 'popup', 'cfg_allow_privmsg'),
(190, 1, 1, 'prefs', 'ucp', 174, 24, 25, 'UCP_PREFS_PERSONAL', 'personal', ''),
(191, 1, 1, 'prefs', 'ucp', 174, 26, 27, 'UCP_PREFS_POST', 'post', ''),
(192, 1, 1, 'prefs', 'ucp', 174, 28, 29, 'UCP_PREFS_VIEW', 'view', ''),
(193, 1, 1, 'profile', 'ucp', 173, 14, 15, 'UCP_PROFILE_PROFILE_INFO', 'profile_info', ''),
(194, 1, 1, 'profile', 'ucp', 173, 16, 17, 'UCP_PROFILE_SIGNATURE', 'signature', ''),
(195, 1, 1, 'profile', 'ucp', 173, 18, 19, 'UCP_PROFILE_AVATAR', 'avatar', 'cfg_allow_avatar && (cfg_allow_avatar_local || cfg_allow_avatar_remote || cfg_allow_avatar_upload || cfg_allow_avatar_remote_upload)'),
(196, 1, 1, 'profile', 'ucp', 173, 20, 21, 'UCP_PROFILE_REG_DETAILS', 'reg_details', ''),
(197, 1, 1, 'zebra', 'ucp', 177, 50, 51, 'UCP_ZEBRA_FRIENDS', 'friends', ''),
(198, 1, 1, 'zebra', 'ucp', 177, 52, 53, 'UCP_ZEBRA_FOES', 'foes', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_poll_options`
--

CREATE TABLE IF NOT EXISTS `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_text` text COLLATE utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_poll_votes`
--

CREATE TABLE IF NOT EXISTS `phpbb_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_posts`
--

CREATE TABLE IF NOT EXISTS `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `post_checksum` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_postcount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `post_approved` (`post_approved`),
  KEY `post_username` (`post_username`),
  KEY `tid_post_time` (`topic_id`,`post_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_posts`
--

INSERT INTO `phpbb_posts` (`post_id`, `topic_id`, `forum_id`, `poster_id`, `icon_id`, `poster_ip`, `post_time`, `post_approved`, `post_reported`, `enable_bbcode`, `enable_smilies`, `enable_magic_url`, `enable_sig`, `post_username`, `post_subject`, `post_text`, `post_checksum`, `post_attachment`, `bbcode_bitfield`, `bbcode_uid`, `post_postcount`, `post_edit_time`, `post_edit_reason`, `post_edit_user`, `post_edit_count`, `post_edit_locked`) VALUES
(2, 2, 9, 57, 0, '::1', 1355173113, 1, 0, 1, 1, 1, 1, '', 'Famiglia Rossi', 0x537065726f2064692073617065726520616c207069c3b92070726573746f207175616c6520736172c3a020696c20766573746974696e6f206469206d696f206669676c696f202121210a0a46616d69676c696120526f7373692e, '901212bdcf1a37b58cb52f098caef2ea', 0, '', 'op0l5sik', 1, 0, '', 0, 0, 0),
(4, 2, 9, 58, 0, '::1', 1355174726, 1, 0, 1, 1, 1, 1, '', 'Famiglia Bianchi', 0x496c20636f7374756d6520c3a820646120616371756973746172652070726573736f206c276173696c6f3f, '37e2a906be18585ca37dbd91be1ecda9', 0, '', '2vcswca8', 1, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root_level` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_time` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_text` mediumtext COLLATE utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `message_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `to_address` text COLLATE utf8_bin NOT NULL,
  `bcc_address` text COLLATE utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs_folder`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pm_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs_rules`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_check` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_connection` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_string` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rule_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_folder_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_privmsgs_to`
--

CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_replied` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_marked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_fields`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_type` tinyint(4) NOT NULL DEFAULT '0',
  `field_ident` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_length` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_minlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_maxlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_novalue` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_validation` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_novalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_no_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_fields_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_fields_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_type` tinyint(4) NOT NULL DEFAULT '0',
  `lang_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_profile_lang`
--

CREATE TABLE IF NOT EXISTS `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_explain` text COLLATE utf8_bin NOT NULL,
  `lang_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_ranks`
--

CREATE TABLE IF NOT EXISTS `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dump dei dati per la tabella `phpbb_ranks`
--

INSERT INTO `phpbb_ranks` (`rank_id`, `rank_title`, `rank_min`, `rank_special`, `rank_image`) VALUES
(1, 'Amministratore', 0, 1, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_reports`
--

CREATE TABLE IF NOT EXISTS `phpbb_reports` (
  `report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_time` int(11) unsigned NOT NULL DEFAULT '0',
  `report_text` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_reports_reasons`
--

CREATE TABLE IF NOT EXISTS `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reason_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reason_description` mediumtext COLLATE utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_reports_reasons`
--

INSERT INTO `phpbb_reports_reasons` (`reason_id`, `reason_title`, `reason_description`, `reason_order`) VALUES
(1, 'warez', 0x496c206d657373616767696f20636f6e7469656e6520636f6c6c6567616d656e7469206120736f66747761726520696c6c6567616c69206f207069726174612e, 1),
(2, 'spam', 0x496c206d657373616767696f207365676e616c61746f206861206ce28099756e69636f2073636f706f206469206661726520707562626c69636974c3a020616420756e207369746f20776562206f20756e20616c74726f2070726f646f74746f2e, 2),
(3, 'off_topic', 0x496c206d657373616767696f207365676e616c61746f20c3a8206f666620746f7069632e, 3),
(4, 'other', 0x496c206d657373616767696f207365676e616c61746f206e6f6e2073692061646174746120696e20616c7472652063617465676f7269652c2075736120696c2063616d706f206465736372697a696f6e652e, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_search_results`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_results` (
  `search_key` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) unsigned NOT NULL DEFAULT '0',
  `search_keywords` mediumtext COLLATE utf8_bin NOT NULL,
  `search_authors` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`search_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_search_wordlist`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `word_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=117 ;

--
-- Dump dei dati per la tabella `phpbb_search_wordlist`
--

INSERT INTO `phpbb_search_wordlist` (`word_id`, `word_text`, `word_common`, `word_count`) VALUES
(1, 'questo', 0, 0),
(2, 'messaggio', 0, 0),
(3, 'esempio', 0, 0),
(4, 'nella', 0, 0),
(5, 'tua', 0, 0),
(6, 'installazione', 0, 0),
(7, 'phpbb3', 0, 0),
(8, 'ogni', 0, 0),
(9, 'cosa', 0, 0),
(10, 'sembra', 0, 0),
(11, 'funzionare', 0, 0),
(12, 'vuoi', 0, 0),
(13, 'puoi', 0, 0),
(14, 'cancellare', 0, 0),
(15, 'continuare', 0, 0),
(16, 'configurare', 0, 0),
(17, 'tuo', 0, 0),
(18, 'forum', 0, 0),
(19, 'durante', 0, 0),
(20, 'processo', 0, 0),
(21, 'alla', 0, 0),
(22, 'prima', 0, 0),
(23, 'categoria', 0, 0),
(24, 'primo', 0, 0),
(25, 'stato', 0, 0),
(26, 'assegnato', 0, 0),
(27, 'opportuno', 0, 0),
(28, 'set', 0, 0),
(29, 'permessi', 0, 0),
(30, 'per', 0, 0),
(31, 'gruppi', 0, 0),
(32, 'predefiniti', 0, 0),
(33, 'amministratori', 0, 0),
(34, 'bot', 0, 0),
(35, 'moderatori', 0, 0),
(36, 'globali', 0, 0),
(37, 'ospiti', 0, 0),
(38, 'utenti', 0, 0),
(39, 'registrati', 0, 0),
(40, 'coppa', 0, 0),
(41, 'decidi', 0, 0),
(42, 'ricordati', 0, 0),
(43, 'assegnare', 0, 0),
(44, 'tutti', 0, 0),
(45, 'questi', 0, 0),
(46, 'che', 0, 0),
(47, 'viene', 0, 0),
(48, 'creato', 0, 0),
(49, 'raccomandiamo', 0, 0),
(50, 'rinominare', 0, 0),
(51, 'copiare', 0, 0),
(52, 'quando', 0, 0),
(53, 'creano', 0, 0),
(54, 'nuove', 0, 0),
(55, 'categorie', 0, 0),
(56, 'nuovi', 0, 0),
(57, 'buon', 0, 0),
(58, 'divertimento', 0, 0),
(59, 'benvenuto', 0, 0),
(60, 'salve', 0, 0),
(61, 'questa', 0, 0),
(62, 'del', 0, 0),
(63, 'saranno', 0, 0),
(64, 'riportate', 0, 0),
(65, 'delle', 0, 0),
(66, 'brevi', 0, 0),
(67, 'presentazioni', 0, 0),
(68, 'riguardanti', 0, 0),
(69, 'vari', 0, 0),
(70, 'stessa', 0, 0),
(71, 'presentazione', 0, 0),
(72, 'inserita', 0, 0),
(73, 'dall', 0, 0),
(74, 'utente', 0, 0),
(75, 'accede', 0, 0),
(76, 'silo', 0, 0),
(77, 'breve', 0, 0),
(78, 'degli', 0, 0),
(79, 'ecco', 0, 0),
(80, 'tutte', 0, 0),
(81, 'informazioni', 0, 0),
(82, 'riguardano', 0, 0),
(83, 'recita', 0, 0),
(84, 'fine', 0, 0),
(85, 'anno', 0, 0),
(86, 'costumi', 0, 0),
(87, 'trama', 0, 0),
(88, 'tanto', 0, 0),
(89, 'altro', 0, 0),
(90, 'ancora', 0, 0),
(91, '2012', 0, 0),
(92, 'aaa', 0, 0),
(93, 'bbb', 0, 0),
(94, 'spero', 0, 1),
(95, 'sapere', 0, 1),
(96, 'più', 0, 1),
(97, 'presto', 0, 1),
(98, 'quale', 0, 1),
(99, 'sarà', 0, 1),
(100, 'vestitino', 0, 1),
(101, 'mio', 0, 1),
(102, 'figlio', 0, 1),
(103, 'famiglia', 0, 3),
(104, 'rossi', 0, 2),
(105, 'bellissima', 0, 0),
(106, 'idea', 0, 0),
(107, 'speriamo', 0, 0),
(108, 'sia', 0, 0),
(109, 'possibile', 0, 0),
(110, 'acquistare', 0, 1),
(111, 'filmino', 0, 0),
(112, 'della', 0, 0),
(113, 'bianchi', 0, 1),
(114, 'costume', 0, 1),
(115, 'presso', 0, 1),
(116, 'asilo', 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_search_wordmatch`
--

CREATE TABLE IF NOT EXISTS `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `unq_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_search_wordmatch`
--

INSERT INTO `phpbb_search_wordmatch` (`post_id`, `word_id`, `title_match`) VALUES
(2, 94, 0),
(2, 95, 0),
(2, 96, 0),
(2, 97, 0),
(2, 98, 0),
(2, 99, 0),
(2, 100, 0),
(2, 101, 0),
(2, 102, 0),
(2, 103, 0),
(2, 103, 1),
(4, 103, 1),
(2, 104, 0),
(2, 104, 1),
(4, 110, 0),
(4, 113, 1),
(4, 114, 0),
(4, 115, 0),
(4, 116, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_sessions`
--

CREATE TABLE IF NOT EXISTS `phpbb_sessions` (
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_last_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `session_start` int(11) unsigned NOT NULL DEFAULT '0',
  `session_time` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_page` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_sessions`
--

INSERT INTO `phpbb_sessions` (`session_id`, `session_user_id`, `session_forum_id`, `session_last_visit`, `session_start`, `session_time`, `session_ip`, `session_browser`, `session_forwarded_for`, `session_page`, `session_viewonline`, `session_autologin`, `session_admin`) VALUES
('2cc7b356a423f97f44e511b6ce245c7d', 1, 0, 1355657279, 1355657279, 1355657279, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 'ucp.php?mode=logout', 1, 0, 0),
('e2d40126ae371e0cf530b79f10473aed', 2, 9, 1355657277, 1355657407, 1355657562, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11', '', 'viewtopic.php?f=9&t=2', 1, 0, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_sessions_keys`
--

CREATE TABLE IF NOT EXISTS `phpbb_sessions_keys` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_sitelist`
--

CREATE TABLE IF NOT EXISTS `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_hostname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_smilies`
--

CREATE TABLE IF NOT EXISTS `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `emotion` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_url` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

--
-- Dump dei dati per la tabella `phpbb_smilies`
--

INSERT INTO `phpbb_smilies` (`smiley_id`, `code`, `emotion`, `smiley_url`, `smiley_width`, `smiley_height`, `smiley_order`, `display_on_posting`) VALUES
(1, ':D', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 1, 1),
(2, ':-D', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 2, 1),
(3, ':grin:', 'Very Happy', 'icon_e_biggrin.gif', 15, 17, 3, 1),
(4, ':)', 'Smile', 'icon_e_smile.gif', 15, 17, 4, 1),
(5, ':-)', 'Smile', 'icon_e_smile.gif', 15, 17, 5, 1),
(6, ':smile:', 'Smile', 'icon_e_smile.gif', 15, 17, 6, 1),
(7, ';)', 'Wink', 'icon_e_wink.gif', 15, 17, 7, 1),
(8, ';-)', 'Wink', 'icon_e_wink.gif', 15, 17, 8, 1),
(9, ':wink:', 'Wink', 'icon_e_wink.gif', 15, 17, 9, 1),
(10, ':(', 'Sad', 'icon_e_sad.gif', 15, 17, 10, 1),
(11, ':-(', 'Sad', 'icon_e_sad.gif', 15, 17, 11, 1),
(12, ':sad:', 'Sad', 'icon_e_sad.gif', 15, 17, 12, 1),
(13, ':o', 'Surprised', 'icon_e_surprised.gif', 15, 17, 13, 1),
(14, ':-o', 'Surprised', 'icon_e_surprised.gif', 15, 17, 14, 1),
(15, ':eek:', 'Surprised', 'icon_e_surprised.gif', 15, 17, 15, 1),
(16, ':shock:', 'Shocked', 'icon_eek.gif', 15, 17, 16, 1),
(17, ':?', 'Confused', 'icon_e_confused.gif', 15, 17, 17, 1),
(18, ':-?', 'Confused', 'icon_e_confused.gif', 15, 17, 18, 1),
(19, ':???:', 'Confused', 'icon_e_confused.gif', 15, 17, 19, 1),
(20, '8-)', 'Cool', 'icon_cool.gif', 15, 17, 20, 1),
(21, ':cool:', 'Cool', 'icon_cool.gif', 15, 17, 21, 1),
(22, ':lol:', 'Laughing', 'icon_lol.gif', 15, 17, 22, 1),
(23, ':x', 'Mad', 'icon_mad.gif', 15, 17, 23, 1),
(24, ':-x', 'Mad', 'icon_mad.gif', 15, 17, 24, 1),
(25, ':mad:', 'Mad', 'icon_mad.gif', 15, 17, 25, 1),
(26, ':P', 'Razz', 'icon_razz.gif', 15, 17, 26, 1),
(27, ':-P', 'Razz', 'icon_razz.gif', 15, 17, 27, 1),
(28, ':razz:', 'Razz', 'icon_razz.gif', 15, 17, 28, 1),
(29, ':oops:', 'Embarrassed', 'icon_redface.gif', 15, 17, 29, 1),
(30, ':cry:', 'Crying or Very Sad', 'icon_cry.gif', 15, 17, 30, 1),
(31, ':evil:', 'Evil or Very Mad', 'icon_evil.gif', 15, 17, 31, 1),
(32, ':twisted:', 'Twisted Evil', 'icon_twisted.gif', 15, 17, 32, 1),
(33, ':roll:', 'Rolling Eyes', 'icon_rolleyes.gif', 15, 17, 33, 1),
(34, ':!:', 'Exclamation', 'icon_exclaim.gif', 15, 17, 34, 1),
(35, ':?:', 'Question', 'icon_question.gif', 15, 17, 35, 1),
(36, ':idea:', 'Idea', 'icon_idea.gif', 15, 17, 36, 1),
(37, ':arrow:', 'Arrow', 'icon_arrow.gif', 15, 17, 37, 1),
(38, ':|', 'Neutral', 'icon_neutral.gif', 15, 17, 38, 1),
(39, ':-|', 'Neutral', 'icon_neutral.gif', 15, 17, 39, 1),
(40, ':mrgreen:', 'Mr. Green', 'icon_mrgreen.gif', 15, 17, 40, 1),
(41, ':geek:', 'Geek', 'icon_e_geek.gif', 17, 17, 41, 1),
(42, ':ugeek:', 'Uber Geek', 'icon_e_ugeek.gif', 17, 18, 42, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `theme_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `imageset_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_name` (`style_name`),
  KEY `template_id` (`template_id`),
  KEY `theme_id` (`theme_id`),
  KEY `imageset_id` (`imageset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles`
--

INSERT INTO `phpbb_styles` (`style_id`, `style_name`, `style_copyright`, `style_active`, `template_id`, `theme_id`, `imageset_id`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 1, 1, 1, 1),
(2, 'subsilver2', '&copy; 2005 phpBB Group', 1, 3, 2, 2),
(3, 'Artodia: Helion', '&copy; Artodia.com', 1, 2, 3, 3),
(4, 'eMuza_summer', 'Matti © &amp; GamesBoard.pl', 1, 4, 4, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_imageset`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_imageset` (
  `imageset_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `imageset_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `imageset_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `imageset_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`imageset_id`),
  UNIQUE KEY `imgset_nm` (`imageset_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles_imageset`
--

INSERT INTO `phpbb_styles_imageset` (`imageset_id`, `imageset_name`, `imageset_copyright`, `imageset_path`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver'),
(2, 'subsilver2', '&copy; phpBB Group, 2003', 'subsilver2'),
(3, 'Artodia: Helion', '&copy; Artodia.com', 'art_helion'),
(4, 'eMuza_summer', 'Matti &copy; & GamesBoard.pl', 'eMuza_summer');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_imageset_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_imageset_data` (
  `image_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `image_name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_filename` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `image_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `imageset_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `i_d` (`imageset_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=297 ;

--
-- Dump dei dati per la tabella `phpbb_styles_imageset_data`
--

INSERT INTO `phpbb_styles_imageset_data` (`image_id`, `image_name`, `image_filename`, `image_lang`, `image_height`, `image_width`, `imageset_id`) VALUES
(1, 'site_logo', 'site_logo.gif', '', 52, 139, 1),
(2, 'forum_link', 'forum_link.gif', '', 27, 27, 1),
(3, 'forum_read', 'forum_read.gif', '', 27, 27, 1),
(4, 'forum_read_locked', 'forum_read_locked.gif', '', 27, 27, 1),
(5, 'forum_read_subforum', 'forum_read_subforum.gif', '', 27, 27, 1),
(6, 'forum_unread', 'forum_unread.gif', '', 27, 27, 1),
(7, 'forum_unread_locked', 'forum_unread_locked.gif', '', 27, 27, 1),
(8, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 27, 27, 1),
(9, 'topic_moved', 'topic_moved.gif', '', 27, 27, 1),
(10, 'topic_read', 'topic_read.gif', '', 27, 27, 1),
(11, 'topic_read_mine', 'topic_read_mine.gif', '', 27, 27, 1),
(12, 'topic_read_hot', 'topic_read_hot.gif', '', 27, 27, 1),
(13, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 27, 27, 1),
(14, 'topic_read_locked', 'topic_read_locked.gif', '', 27, 27, 1),
(15, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 27, 27, 1),
(16, 'topic_unread', 'topic_unread.gif', '', 27, 27, 1),
(17, 'topic_unread_mine', 'topic_unread_mine.gif', '', 27, 27, 1),
(18, 'topic_unread_hot', 'topic_unread_hot.gif', '', 27, 27, 1),
(19, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 27, 27, 1),
(20, 'topic_unread_locked', 'topic_unread_locked.gif', '', 27, 27, 1),
(21, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 27, 27, 1),
(22, 'sticky_read', 'sticky_read.gif', '', 27, 27, 1),
(23, 'sticky_read_mine', 'sticky_read_mine.gif', '', 27, 27, 1),
(24, 'sticky_read_locked', 'sticky_read_locked.gif', '', 27, 27, 1),
(25, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 27, 27, 1),
(26, 'sticky_unread', 'sticky_unread.gif', '', 27, 27, 1),
(27, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 27, 27, 1),
(28, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 27, 27, 1),
(29, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 27, 27, 1),
(30, 'announce_read', 'announce_read.gif', '', 27, 27, 1),
(31, 'announce_read_mine', 'announce_read_mine.gif', '', 27, 27, 1),
(32, 'announce_read_locked', 'announce_read_locked.gif', '', 27, 27, 1),
(33, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 1),
(34, 'announce_unread', 'announce_unread.gif', '', 27, 27, 1),
(35, 'announce_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 1),
(36, 'announce_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 1),
(37, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 1),
(38, 'global_read', 'announce_read.gif', '', 27, 27, 1),
(39, 'global_read_mine', 'announce_read_mine.gif', '', 27, 27, 1),
(40, 'global_read_locked', 'announce_read_locked.gif', '', 27, 27, 1),
(41, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 1),
(42, 'global_unread', 'announce_unread.gif', '', 27, 27, 1),
(43, 'global_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 1),
(44, 'global_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 1),
(45, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 1),
(46, 'pm_read', 'topic_read.gif', '', 27, 27, 1),
(47, 'pm_unread', 'topic_unread.gif', '', 27, 27, 1),
(48, 'icon_back_top', 'icon_back_top.gif', '', 11, 11, 1),
(49, 'icon_contact_aim', 'icon_contact_aim.gif', '', 20, 20, 1),
(50, 'icon_contact_email', 'icon_contact_email.gif', '', 20, 20, 1),
(51, 'icon_contact_icq', 'icon_contact_icq.gif', '', 20, 20, 1),
(52, 'icon_contact_jabber', 'icon_contact_jabber.gif', '', 20, 20, 1),
(53, 'icon_contact_msnm', 'icon_contact_msnm.gif', '', 20, 20, 1),
(54, 'icon_contact_www', 'icon_contact_www.gif', '', 20, 20, 1),
(55, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', '', 20, 20, 1),
(56, 'icon_post_delete', 'icon_post_delete.gif', '', 20, 20, 1),
(57, 'icon_post_info', 'icon_post_info.gif', '', 20, 20, 1),
(58, 'icon_post_report', 'icon_post_report.gif', '', 20, 20, 1),
(59, 'icon_post_target', 'icon_post_target.gif', '', 9, 11, 1),
(60, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 11, 1),
(61, 'icon_topic_attach', 'icon_topic_attach.gif', '', 10, 7, 1),
(62, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 11, 1),
(63, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 11, 1),
(64, 'icon_topic_reported', 'icon_topic_reported.gif', '', 14, 16, 1),
(65, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 14, 16, 1),
(66, 'icon_user_warn', 'icon_user_warn.gif', '', 20, 20, 1),
(67, 'subforum_read', 'subforum_read.gif', '', 9, 11, 1),
(68, 'subforum_unread', 'subforum_unread.gif', '', 9, 11, 1),
(69, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 20, 28, 1),
(70, 'icon_post_edit', 'icon_post_edit.gif', 'en', 20, 42, 1),
(71, 'icon_post_quote', 'icon_post_quote.gif', 'en', 20, 54, 1),
(72, 'icon_user_online', 'icon_user_online.gif', 'en', 58, 58, 1),
(73, 'button_pm_forward', 'button_pm_forward.gif', 'en', 25, 96, 1),
(74, 'button_pm_new', 'button_pm_new.gif', 'en', 25, 84, 1),
(75, 'button_pm_reply', 'button_pm_reply.gif', 'en', 25, 96, 1),
(76, 'button_topic_locked', 'button_topic_locked.gif', 'en', 25, 88, 1),
(77, 'button_topic_new', 'button_topic_new.gif', 'en', 25, 96, 1),
(78, 'button_topic_reply', 'button_topic_reply.gif', 'en', 25, 96, 1),
(79, 'site_logo', 'site_logo.gif', '', 94, 170, 2),
(80, 'upload_bar', 'upload_bar.gif', '', 16, 280, 2),
(81, 'poll_left', 'poll_left.gif', '', 12, 4, 2),
(82, 'poll_center', 'poll_center.gif', '', 12, 1, 2),
(83, 'poll_right', 'poll_right.gif', '', 12, 4, 2),
(84, 'forum_link', 'forum_link.gif', '', 25, 46, 2),
(85, 'forum_read', 'forum_read.gif', '', 25, 46, 2),
(86, 'forum_read_locked', 'forum_read_locked.gif', '', 25, 46, 2),
(87, 'forum_read_subforum', 'forum_read_subforum.gif', '', 25, 46, 2),
(88, 'forum_unread', 'forum_unread.gif', '', 25, 46, 2),
(89, 'forum_unread_locked', 'forum_unread_locked.gif', '', 25, 46, 2),
(90, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 25, 46, 2),
(91, 'topic_moved', 'topic_moved.gif', '', 18, 19, 2),
(92, 'topic_read', 'topic_read.gif', '', 18, 19, 2),
(93, 'topic_read_mine', 'topic_read_mine.gif', '', 18, 19, 2),
(94, 'topic_read_hot', 'topic_read_hot.gif', '', 18, 19, 2),
(95, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 18, 19, 2),
(96, 'topic_read_locked', 'topic_read_locked.gif', '', 18, 19, 2),
(97, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 18, 19, 2),
(98, 'topic_unread', 'topic_unread.gif', '', 18, 19, 2),
(99, 'topic_unread_mine', 'topic_unread_mine.gif', '', 18, 19, 2),
(100, 'topic_unread_hot', 'topic_unread_hot.gif', '', 18, 19, 2),
(101, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 18, 19, 2),
(102, 'topic_unread_locked', 'topic_unread_locked.gif', '', 18, 19, 2),
(103, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 18, 19, 2),
(104, 'sticky_read', 'sticky_read.gif', '', 18, 19, 2),
(105, 'sticky_read_mine', 'sticky_read_mine.gif', '', 18, 19, 2),
(106, 'sticky_read_locked', 'sticky_read_locked.gif', '', 18, 19, 2),
(107, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 18, 19, 2),
(108, 'sticky_unread', 'sticky_unread.gif', '', 18, 19, 2),
(109, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 18, 19, 2),
(110, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 18, 19, 2),
(111, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 18, 19, 2),
(112, 'announce_read', 'announce_read.gif', '', 18, 19, 2),
(113, 'announce_read_mine', 'announce_read_mine.gif', '', 18, 19, 2),
(114, 'announce_read_locked', 'announce_read_locked.gif', '', 18, 19, 2),
(115, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 18, 19, 2),
(116, 'announce_unread', 'announce_unread.gif', '', 18, 19, 2),
(117, 'announce_unread_mine', 'announce_unread_mine.gif', '', 18, 19, 2),
(118, 'announce_unread_locked', 'announce_unread_locked.gif', '', 18, 19, 2),
(119, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 18, 19, 2),
(120, 'global_read', 'announce_read.gif', '', 18, 19, 2),
(121, 'global_read_mine', 'announce_read_mine.gif', '', 18, 19, 2),
(122, 'global_read_locked', 'announce_read_locked.gif', '', 18, 19, 2),
(123, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 18, 19, 2),
(124, 'global_unread', 'announce_unread.gif', '', 18, 19, 2),
(125, 'global_unread_mine', 'announce_unread_mine.gif', '', 18, 19, 2),
(126, 'global_unread_locked', 'announce_unread_locked.gif', '', 18, 19, 2),
(127, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 18, 19, 2),
(128, 'pm_read', 'topic_read.gif', '', 18, 19, 2),
(129, 'pm_unread', 'topic_unread.gif', '', 18, 19, 2),
(130, 'icon_post_target', 'icon_post_target.gif', '', 9, 12, 2),
(131, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 12, 2),
(132, 'icon_topic_attach', 'icon_topic_attach.gif', '', 18, 14, 2),
(133, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 18, 2),
(134, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 18, 2),
(135, 'icon_topic_reported', 'icon_topic_reported.gif', '', 18, 19, 2),
(136, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 18, 19, 2),
(137, 'icon_contact_aim', 'icon_contact_aim.gif', 'en', 0, 0, 2),
(138, 'icon_contact_email', 'icon_contact_email.gif', 'en', 0, 0, 2),
(139, 'icon_contact_icq', 'icon_contact_icq.gif', 'en', 0, 0, 2),
(140, 'icon_contact_jabber', 'icon_contact_jabber.gif', 'en', 0, 0, 2),
(141, 'icon_contact_msnm', 'icon_contact_msnm.gif', 'en', 0, 0, 2),
(142, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 0, 0, 2),
(143, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', 'en', 0, 0, 2),
(144, 'icon_contact_www', 'icon_contact_www.gif', 'en', 0, 0, 2),
(145, 'icon_post_delete', 'icon_post_delete.gif', 'en', 0, 0, 2),
(146, 'icon_post_edit', 'icon_post_edit.gif', 'en', 0, 0, 2),
(147, 'icon_post_info', 'icon_post_info.gif', 'en', 0, 0, 2),
(148, 'icon_post_quote', 'icon_post_quote.gif', 'en', 0, 0, 2),
(149, 'icon_post_report', 'icon_post_report.gif', 'en', 0, 0, 2),
(150, 'icon_user_online', 'icon_user_online.gif', 'en', 0, 0, 2),
(151, 'icon_user_offline', 'icon_user_offline.gif', 'en', 0, 0, 2),
(152, 'icon_user_profile', 'icon_user_profile.gif', 'en', 0, 0, 2),
(153, 'icon_user_search', 'icon_user_search.gif', 'en', 0, 0, 2),
(154, 'icon_user_warn', 'icon_user_warn.gif', 'en', 0, 0, 2),
(155, 'button_pm_new', 'button_pm_new.gif', 'en', 0, 0, 2),
(156, 'button_pm_reply', 'button_pm_reply.gif', 'en', 0, 0, 2),
(157, 'button_topic_locked', 'button_topic_locked.gif', 'en', 0, 0, 2),
(158, 'button_topic_new', 'button_topic_new.gif', 'en', 0, 0, 2),
(159, 'button_topic_reply', 'button_topic_reply.gif', 'en', 0, 0, 2),
(160, 'site_logo', 'logo_silo.png', '', 0, 0, 3),
(161, 'forum_link', 'folder_moved.png', '', 0, 0, 3),
(162, 'forum_read', 'folder_read.png', '', 0, 0, 3),
(163, 'forum_read_locked', 'folder_locked.png', '', 0, 0, 3),
(164, 'forum_read_subforum', 'folder_read.png', '', 0, 0, 3),
(165, 'forum_unread', 'folder_unread.png', '', 0, 0, 3),
(166, 'forum_unread_locked', 'folder_unread_locked.png', '', 0, 0, 3),
(167, 'forum_unread_subforum', 'folder_unread.png', '', 0, 0, 3),
(168, 'topic_moved', 'folder_moved.png', '', 0, 0, 3),
(169, 'topic_read', 'folder_read.png', '', 0, 0, 3),
(170, 'topic_read_mine', 'folder_read_posted.png', '', 0, 0, 3),
(171, 'topic_read_hot', 'folder_read.png', '', 0, 0, 3),
(172, 'topic_read_hot_mine', 'folder_read_posted.png', '', 0, 0, 3),
(173, 'topic_read_locked', 'folder_locked.png', '', 0, 0, 3),
(174, 'topic_read_locked_mine', 'folder_locked_posted.png', '', 0, 0, 3),
(175, 'topic_unread', 'folder_unread.png', '', 0, 0, 3),
(176, 'topic_unread_mine', 'folder_unread_posted.png', '', 0, 0, 3),
(177, 'topic_unread_hot', 'folder_unread.png', '', 0, 0, 3),
(178, 'topic_unread_hot_mine', 'folder_unread_posted.png', '', 0, 0, 3),
(179, 'topic_unread_locked', 'folder_unread_locked.png', '', 0, 0, 3),
(180, 'topic_unread_locked_mine', 'folder_unread_locked_posted.png', '', 0, 0, 3),
(181, 'sticky_read', 'folder_announce.png', '', 0, 0, 3),
(182, 'sticky_read_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(183, 'sticky_read_locked', 'folder_announce.png', '', 0, 0, 3),
(184, 'sticky_read_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(185, 'sticky_unread', 'folder_announce_unread.png', '', 0, 0, 3),
(186, 'sticky_unread_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(187, 'sticky_unread_locked', 'folder_announce.png', '', 0, 0, 3),
(188, 'sticky_unread_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(189, 'announce_read', 'folder_announce.png', '', 0, 0, 3),
(190, 'announce_read_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(191, 'announce_read_locked', 'folder_announce.png', '', 0, 0, 3),
(192, 'announce_read_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(193, 'announce_unread', 'folder_announce_unread.png', '', 0, 0, 3),
(194, 'announce_unread_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(195, 'announce_unread_locked', 'folder_announce_unread.png', '', 0, 0, 3),
(196, 'announce_unread_locked_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(197, 'global_read', 'folder_announce.png', '', 0, 0, 3),
(198, 'global_read_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(199, 'global_read_locked', 'folder_announce.png', '', 0, 0, 3),
(200, 'global_read_locked_mine', 'folder_announce_posted.png', '', 0, 0, 3),
(201, 'global_unread', 'folder_announce_unread.png', '', 0, 0, 3),
(202, 'global_unread_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(203, 'global_unread_locked', 'folder_announce_unread.png', '', 0, 0, 3),
(204, 'global_unread_locked_mine', 'folder_announce_unread_posted.png', '', 0, 0, 3),
(205, 'pm_read', 'folder_read.png', '', 0, 0, 3),
(206, 'pm_unread', 'folder_unread.png', '', 0, 0, 3),
(207, 'icon_post_target', 'icon_topic_latest.png', '', 9, 11, 3),
(208, 'icon_post_target_unread', 'icon_topic_newest.png', '', 9, 11, 3),
(209, 'icon_topic_latest', 'icon_topic_latest.png', '', 9, 11, 3),
(210, 'icon_topic_newest', 'icon_topic_newest.png', '', 9, 11, 3),
(211, 'subforum_read', 'icon_topic_latest.png', '', 9, 11, 3),
(212, 'subforum_unread', 'icon_topic_newest.png', '', 9, 11, 3),
(213, 'icon_back_top', 'icon_back_top.png', '', 11, 11, 3),
(214, 'icon_topic_reported', 'icon_reported.png', '', 0, 0, 3),
(215, 'icon_topic_unapproved', 'icon_unapproved.png', '', 0, 0, 3),
(216, 'icon_topic_attach', 'attachment.png', '', 10, 5, 3),
(217, 'icon_post_edit', 'spacer.gif', 'en', 0, 0, 3),
(218, 'icon_post_edit', 'spacer.gif', 'it', 0, 0, 3),
(219, 'site_logo', 'site_logo.gif', '', 52, 139, 4),
(220, 'forum_link', 'forum_link.gif', '', 27, 27, 4),
(221, 'forum_read', 'forum_read.gif', '', 27, 27, 4),
(222, 'forum_read_locked', 'forum_read_locked.gif', '', 27, 27, 4),
(223, 'forum_read_subforum', 'forum_read_subforum.gif', '', 27, 27, 4),
(224, 'forum_unread', 'forum_unread.gif', '', 27, 27, 4),
(225, 'forum_unread_locked', 'forum_unread_locked.gif', '', 27, 27, 4),
(226, 'forum_unread_subforum', 'forum_unread_subforum.gif', '', 27, 27, 4),
(227, 'topic_moved', 'topic_moved.gif', '', 27, 27, 4),
(228, 'topic_read', 'topic_read.gif', '', 27, 27, 4),
(229, 'topic_read_mine', 'topic_read_mine.gif', '', 27, 27, 4),
(230, 'topic_read_hot', 'topic_read_hot.gif', '', 27, 27, 4),
(231, 'topic_read_hot_mine', 'topic_read_hot_mine.gif', '', 27, 27, 4),
(232, 'topic_read_locked', 'topic_read_locked.gif', '', 27, 27, 4),
(233, 'topic_read_locked_mine', 'topic_read_locked_mine.gif', '', 27, 27, 4),
(234, 'topic_unread', 'topic_unread.gif', '', 27, 27, 4),
(235, 'topic_unread_mine', 'topic_unread_mine.gif', '', 27, 27, 4),
(236, 'topic_unread_hot', 'topic_unread_hot.gif', '', 27, 27, 4),
(237, 'topic_unread_hot_mine', 'topic_unread_hot_mine.gif', '', 27, 27, 4),
(238, 'topic_unread_locked', 'topic_unread_locked.gif', '', 27, 27, 4),
(239, 'topic_unread_locked_mine', 'topic_unread_locked_mine.gif', '', 27, 27, 4),
(240, 'sticky_read', 'sticky_read.gif', '', 27, 27, 4),
(241, 'sticky_read_mine', 'sticky_read_mine.gif', '', 27, 27, 4),
(242, 'sticky_read_locked', 'sticky_read_locked.gif', '', 27, 27, 4),
(243, 'sticky_read_locked_mine', 'sticky_read_locked_mine.gif', '', 27, 27, 4),
(244, 'sticky_unread', 'sticky_unread.gif', '', 27, 27, 4),
(245, 'sticky_unread_mine', 'sticky_unread_mine.gif', '', 27, 27, 4),
(246, 'sticky_unread_locked', 'sticky_unread_locked.gif', '', 27, 27, 4),
(247, 'sticky_unread_locked_mine', 'sticky_unread_locked_mine.gif', '', 27, 27, 4),
(248, 'announce_read', 'announce_read.gif', '', 27, 27, 4),
(249, 'announce_read_mine', 'announce_read_mine.gif', '', 27, 27, 4),
(250, 'announce_read_locked', 'announce_read_locked.gif', '', 27, 27, 4),
(251, 'announce_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 4),
(252, 'announce_unread', 'announce_unread.gif', '', 27, 27, 4),
(253, 'announce_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 4),
(254, 'announce_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 4),
(255, 'announce_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 4),
(256, 'global_read', 'announce_read.gif', '', 27, 27, 4),
(257, 'global_read_mine', 'announce_read_mine.gif', '', 27, 27, 4),
(258, 'global_read_locked', 'announce_read_locked.gif', '', 27, 27, 4),
(259, 'global_read_locked_mine', 'announce_read_locked_mine.gif', '', 27, 27, 4),
(260, 'global_unread', 'announce_unread.gif', '', 27, 27, 4),
(261, 'global_unread_mine', 'announce_unread_mine.gif', '', 27, 27, 4),
(262, 'global_unread_locked', 'announce_unread_locked.gif', '', 27, 27, 4),
(263, 'global_unread_locked_mine', 'announce_unread_locked_mine.gif', '', 27, 27, 4),
(264, 'subforum_read', 'subforum_read.gif', '', 9, 11, 4),
(265, 'subforum_unread', 'subforum_unread.gif', '', 9, 11, 4),
(266, 'pm_read', 'topic_read.gif', '', 27, 27, 4),
(267, 'pm_unread', 'topic_unread.gif', '', 27, 27, 4),
(268, 'icon_back_top', 'icon_back_top.gif', '', 11, 11, 4),
(269, 'icon_contact_aim', 'icon_contact_aim.gif', '', 20, 20, 4),
(270, 'icon_contact_email', 'icon_contact_email.gif', '', 20, 20, 4),
(271, 'icon_contact_icq', 'icon_contact_icq.gif', '', 20, 20, 4),
(272, 'icon_contact_jabber', 'icon_contact_jabber.gif', '', 20, 20, 4),
(273, 'icon_contact_msnm', 'icon_contact_msnm.gif', '', 20, 20, 4),
(274, 'icon_contact_www', 'icon_contact_www.gif', '', 20, 20, 4),
(275, 'icon_contact_yahoo', 'icon_contact_yahoo.gif', '', 20, 20, 4),
(276, 'icon_post_delete', 'icon_post_delete.gif', '', 20, 20, 4),
(277, 'icon_post_info', 'icon_post_info.gif', '', 20, 20, 4),
(278, 'icon_post_report', 'icon_post_report.gif', '', 20, 20, 4),
(279, 'icon_post_target', 'icon_post_target.gif', '', 9, 11, 4),
(280, 'icon_post_target_unread', 'icon_post_target_unread.gif', '', 9, 11, 4),
(281, 'icon_topic_attach', 'icon_topic_attach.gif', '', 10, 7, 4),
(282, 'icon_topic_latest', 'icon_topic_latest.gif', '', 9, 11, 4),
(283, 'icon_topic_newest', 'icon_topic_newest.gif', '', 9, 11, 4),
(284, 'icon_topic_reported', 'icon_topic_reported.gif', '', 14, 16, 4),
(285, 'icon_topic_unapproved', 'icon_topic_unapproved.gif', '', 14, 16, 4),
(286, 'icon_user_warn', 'icon_user_warn.gif', '', 20, 20, 4),
(287, 'icon_contact_pm', 'icon_contact_pm.gif', 'en', 20, 28, 4),
(288, 'icon_post_edit', 'icon_post_edit.gif', 'en', 20, 42, 4),
(289, 'icon_post_quote', 'icon_post_quote.gif', 'en', 20, 54, 4),
(290, 'icon_user_online', 'icon_user_online.gif', 'en', 58, 58, 4),
(291, 'button_pm_forward', 'button_pm_forward.gif', 'en', 25, 96, 4),
(292, 'button_pm_new', 'button_pm_new.gif', 'en', 25, 84, 4),
(293, 'button_pm_reply', 'button_pm_reply.gif', 'en', 25, 96, 4),
(294, 'button_topic_locked', 'button_topic_locked.gif', 'en', 25, 88, 4),
(295, 'button_topic_new', 'button_topic_new.gif', 'en', 25, 96, 4),
(296, 'button_topic_reply', 'button_topic_reply.gif', 'en', 25, 96, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_template`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_template` (
  `template_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'kNg=',
  `template_storedb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_inherits_id` int(4) unsigned NOT NULL DEFAULT '0',
  `template_inherit_path` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `tmplte_nm` (`template_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles_template`
--

INSERT INTO `phpbb_styles_template` (`template_id`, `template_name`, `template_copyright`, `template_path`, `bbcode_bitfield`, `template_storedb`, `template_inherits_id`, `template_inherit_path`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver', 'lNg=', 0, 0, ''),
(2, 'Artodia: Helion', '&copy; Artodia.com', 'art_helion', 'lNg=', 0, 1, 'prosilver'),
(3, 'subsilver2', '&copy; phpBB Group, 2003', 'subsilver2', '+Ng=', 0, 0, ''),
(4, 'eMuza_summer', 'Matti &copy; & GamesBoard.pl', 'eMuza_summer', 'lNg=', 0, 0, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_template_data`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_template_data` (
  `template_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template_filename` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `template_included` text COLLATE utf8_bin NOT NULL,
  `template_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `template_data` mediumtext COLLATE utf8_bin NOT NULL,
  KEY `tid` (`template_id`),
  KEY `tfn` (`template_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_styles_theme`
--

CREATE TABLE IF NOT EXISTS `phpbb_styles_theme` (
  `theme_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `theme_storedb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme_mtime` int(11) unsigned NOT NULL DEFAULT '0',
  `theme_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `theme_name` (`theme_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dump dei dati per la tabella `phpbb_styles_theme`
--

INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(1, 'prosilver', '&copy; phpBB Group', 'prosilver', 1, 1354999647, 0x2f2a2020706870424233205374796c652053686565740a202020202d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a095374796c65206e616d653a09090970726f73696c76657220287468652064656661756c7420706870424220332e302e78207374796c65290a094261736564206f6e207374796c653a09090a094f726967696e616c20617574686f723a09546f6d2042656464617264202820687474703a2f2f7777772e737562626c75652e636f6d2f20290a094d6f6469666965642062793a090970687042422047726f7570202820687474703a2f2f7777772e70687062622e636f6d2f20290a202020202d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a2a2f0a0a2f2a2047656e6572616c204d61726b7570205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2a207b0a092f2a2052657365742062726f77736572732064656661756c74206d617267696e2c2070616464696e6720616e6420666f6e742073697a6573202a2f0a096d617267696e3a20303b0a0970616464696e673a20303b0a7d0a0a68746d6c207b0a09666f6e742d73697a653a20313030253b0a092f2a20416c776179732073686f772061207363726f6c6c62617220666f722073686f7274207061676573202d2073746f707320746865206a756d70207768656e20746865207363726f6c6c62617220617070656172732e206e6f6e2d49452062726f7773657273202a2f0a096865696768743a20313031253b0a7d0a0a626f6479207b0a092f2a20546578742d53697a696e67207769746820656d733a20687474703a2f2f7777772e636c61676e75742e636f6d2f626c6f672f3334382f202a2f0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09636f6c6f723a20233832383238323b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a092f2a666f6e742d73697a653a2036322e35253b09090920546869732073657473207468652064656661756c7420666f6e742073697a6520746f206265206571756976616c656e7420746f2031307078202a2f0a09666f6e742d73697a653a20313070783b0a096d617267696e3a20303b0a0970616464696e673a203132707820303b0a7d0a0a6831207b0a092f2a20466f72756d206e616d65202a2f0a09666f6e742d66616d696c793a2022547265627563686574204d53222c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a096d617267696e2d72696768743a2032303070783b0a09636f6c6f723a20234646464646463b0a096d617267696e2d746f703a20313570783b0a09666f6e742d7765696768743a20626f6c643b0a09666f6e742d73697a653a2032656d3b0a7d0a0a6832207b0a092f2a20466f72756d20686561646572207469746c6573202a2f0a09666f6e742d66616d696c793a2022547265627563686574204d53222c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20233366336633663b0a09666f6e742d73697a653a2032656d3b0a096d617267696e3a20302e38656d203020302e32656d20303b0a7d0a0a68322e736f6c6f207b0a096d617267696e2d626f74746f6d3a2031656d3b0a7d0a0a6833207b0a092f2a205375622d686561646572732028616c736f207573656420617320706f737420686561646572732c2062757420646566696e6564206c6174657229202a2f0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a09666f6e742d7765696768743a20626f6c643b0a09746578742d7472616e73666f726d3a207570706572636173653b0a09626f726465722d626f74746f6d3a2031707820736f6c696420234343434343433b0a096d617267696e2d626f74746f6d3a203370783b0a0970616464696e672d626f74746f6d3a203270783b0a09666f6e742d73697a653a20312e3035656d3b0a09636f6c6f723a20233938393839383b0a096d617267696e2d746f703a20323070783b0a7d0a0a6834207b0a092f2a20466f72756d20616e6420746f706963206c697374207469746c6573202a2f0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2053616e732d73657269663b0a09666f6e742d73697a653a20312e33656d3b0a7d0a0a70207b0a096c696e652d6865696768743a20312e33656d3b0a09666f6e742d73697a653a20312e31656d3b0a096d617267696e2d626f74746f6d3a20312e35656d3b0a7d0a0a696d67207b0a09626f726465722d77696474683a20303b0a7d0a0a6872207b0a092f2a20416c736f2073656520747765616b732e637373202a2f0a09626f726465723a2030206e6f6e6520234646464646463b0a09626f726465722d746f703a2031707820736f6c696420234343434343433b0a096865696768743a203170783b0a096d617267696e3a2035707820303b0a09646973706c61793a20626c6f636b3b0a09636c6561723a20626f74683b0a7d0a0a68722e646173686564207b0a09626f726465722d746f703a203170782064617368656420234343434343433b0a096d617267696e3a203130707820303b0a7d0a0a68722e64697669646572207b0a09646973706c61793a206e6f6e653b0a7d0a0a702e7269676874207b0a09746578742d616c69676e3a2072696768743b0a7d0a0a2f2a204d61696e20626c6f636b730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2377726170207b0a0970616464696e673a203020323070783b0a096d696e2d77696474683a2036353070783b0a7d0a0a2373696d706c652d77726170207b0a0970616464696e673a2036707820313070783b0a7d0a0a23706167652d626f6479207b0a096d617267696e3a2034707820303b0a09636c6561723a20626f74683b0a7d0a0a23706167652d666f6f746572207b0a09636c6561723a20626f74683b0a7d0a0a23706167652d666f6f746572206833207b0a096d617267696e2d746f703a20323070783b0a7d0a0a236c6f676f207b0a09666c6f61743a206c6566743b0a0977696474683a206175746f3b0a0970616464696e673a20313070782031337078203020313070783b0a7d0a0a61236c6f676f3a686f766572207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2f2a2053656172636820626f780a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a237365617263682d626f78207b0a09636f6c6f723a20234646464646463b0a09706f736974696f6e3a2072656c61746976653b0a096d617267696e2d746f703a20333070783b0a096d617267696e2d72696768743a203570783b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a0977686974652d73706163653a206e6f777261703b202f2a20466f72204f70657261202a2f0a7d0a0a237365617263682d626f7820236b6579776f726473207b0a0977696474683a20393570783b0a096261636b67726f756e642d636f6c6f723a20234646463b0a7d0a0a237365617263682d626f7820696e707574207b0a09626f726465723a2031707820736f6c696420236230623062303b0a7d0a0a2f2a202e627574746f6e31207374796c6520646566696e6564206c617465722c206a75737420612066657720747765616b7320666f72207468652073656172636820627574746f6e2076657273696f6e202a2f0a237365617263682d626f7820696e7075742e627574746f6e31207b0a0970616464696e673a20317078203570783b0a7d0a0a237365617263682d626f78206c69207b0a09746578742d616c69676e3a2072696768743b0a096d617267696e2d746f703a203470783b0a7d0a0a237365617263682d626f7820696d67207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a096d617267696e2d72696768743a203370783b0a7d0a0a2f2a2053697465206465736372697074696f6e20616e64206c6f676f202a2f0a23736974652d6465736372697074696f6e207b0a09666c6f61743a206c6566743b0a0977696474683a203730253b0a7d0a0a23736974652d6465736372697074696f6e206831207b0a096d617267696e2d72696768743a20303b0a7d0a0a2f2a20526f756e6420636f726e6572656420626f78657320616e64206261636b67726f756e64730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e686561646572626172207b0a096261636b67726f756e643a2023656265626562206e6f6e65207265706561742d78203020303b0a09636f6c6f723a20234646464646463b0a096d617267696e2d626f74746f6d3a203470783b0a0970616464696e673a2030203570783b0a7d0a0a2e6e6176626172207b0a096261636b67726f756e642d636f6c6f723a20236562656265623b0a0970616464696e673a203020313070783b0a7d0a0a2e666f72616267207b0a096261636b67726f756e643a2023623162316231206e6f6e65207265706561742d78203020303b0a096d617267696e2d626f74746f6d3a203470783b0a0970616464696e673a2030203570783b0a09636c6561723a20626f74683b0a7d0a0a2e666f72756d6267207b0a096261636b67726f756e643a2023656265626562206e6f6e65207265706561742d78203020303b0a096d617267696e2d626f74746f6d3a203470783b0a0970616464696e673a2030203570783b0a09636c6561723a20626f74683b0a7d0a0a2e70616e656c207b0a096d617267696e2d626f74746f6d3a203470783b0a0970616464696e673a203020313070783b0a096261636b67726f756e642d636f6c6f723a20236633663366333b0a09636f6c6f723a20233366336633663b0a7d0a0a2e706f7374207b0a0970616464696e673a203020313070783b0a096d617267696e2d626f74746f6d3a203470783b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0a7d0a0a2e706f73743a746172676574202e636f6e74656e74207b0a09636f6c6f723a20233030303030303b0a7d0a0a2e706f73743a7461726765742068332061207b0a09636f6c6f723a20233030303030303b0a7d0a0a2e626731097b206261636b67726f756e642d636f6c6f723a20236637663766373b7d0a2e626732097b206261636b67726f756e642d636f6c6f723a20236632663266323b207d0a2e626733097b206261636b67726f756e642d636f6c6f723a20236562656265623b207d0a0a2e726f776267207b0a096d617267696e3a203570782035707820327078203570783b0a7d0a0a2e756370726f776267207b0a096261636b67726f756e642d636f6c6f723a20236532653265323b0a7d0a0a2e6669656c64736267207b0a092f2a626f726465723a20317078202344424445453220736f6c69643b2a2f0a096261636b67726f756e642d636f6c6f723a20236561656165613b0a7d0a0a7370616e2e636f726e6572732d746f702c207370616e2e636f726e6572732d626f74746f6d2c207370616e2e636f726e6572732d746f70207370616e2c207370616e2e636f726e6572732d626f74746f6d207370616e207b0a09666f6e742d73697a653a203170783b0a096c696e652d6865696768743a203170783b0a09646973706c61793a20626c6f636b3b0a096865696768743a203570783b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a0a7370616e2e636f726e6572732d746f70207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a096d617267696e3a2030202d3570783b0a7d0a0a7370616e2e636f726e6572732d746f70207370616e207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0a7d0a0a7370616e2e636f726e6572732d626f74746f6d207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0a096d617267696e3a2030202d3570783b0a09636c6561723a20626f74683b0a7d0a0a7370616e2e636f726e6572732d626f74746f6d207370616e207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a203130302520313030253b0a7d0a0a2e686561646267207370616e2e636f726e6572732d626f74746f6d207b0a096d617267696e2d626f74746f6d3a202d3170783b0a7d0a0a2e706f7374207370616e2e636f726e6572732d746f702c202e706f7374207370616e2e636f726e6572732d626f74746f6d2c202e70616e656c207370616e2e636f726e6572732d746f702c202e70616e656c207370616e2e636f726e6572732d626f74746f6d2c202e6e6176626172207370616e2e636f726e6572732d746f702c202e6e6176626172207370616e2e636f726e6572732d626f74746f6d207b0a096d617267696e3a2030202d313070783b0a7d0a0a2e72756c6573207370616e2e636f726e6572732d746f70207b0a096d617267696e3a2030202d3130707820357078202d313070783b0a7d0a0a2e72756c6573207370616e2e636f726e6572732d626f74746f6d207b0a096d617267696e3a20357078202d313070782030202d313070783b0a7d0a0a2f2a20486f72697a6f6e74616c206c697374730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a756c2e6c696e6b6c697374207b0a09646973706c61793a20626c6f636b3b0a096d617267696e3a20303b0a7d0a0a756c2e6c696e6b6c697374206c69207b0a09646973706c61793a20626c6f636b3b0a096c6973742d7374796c652d747970653a206e6f6e653b0a09666c6f61743a206c6566743b0a0977696474683a206175746f3b0a096d617267696e2d72696768743a203570783b0a09666f6e742d73697a653a20312e31656d3b0a096c696e652d6865696768743a20322e32656d3b0a7d0a0a756c2e6c696e6b6c697374206c692e7269676874736964652c20702e726967687473696465207b0a09666c6f61743a2072696768743b0a096d617267696e2d72696768743a20303b0a096d617267696e2d6c6566743a203570783b0a09746578742d616c69676e3a2072696768743b0a7d0a0a756c2e6e61766c696e6b73207b0a0970616464696e672d626f74746f6d3a203170783b0a096d617267696e2d626f74746f6d3a203170783b0a09626f726465722d626f74746f6d3a2031707820736f6c696420234646464646463b0a09666f6e742d7765696768743a20626f6c643b0a7d0a0a756c2e6c65667473696465207b0a09666c6f61743a206c6566743b0a096d617267696e2d6c6566743a20303b0a096d617267696e2d72696768743a203570783b0a09746578742d616c69676e3a206c6566743b0a7d0a0a756c2e726967687473696465207b0a09666c6f61743a2072696768743b0a096d617267696e2d6c6566743a203570783b0a096d617267696e2d72696768743a202d3570783b0a09746578742d616c69676e3a2072696768743b0a7d0a0a2f2a205461626c65207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a7461626c652e7461626c6531207b0a092f2a2053656520747765616b732e637373202a2f0a7d0a0a237563702d6d61696e207461626c652e7461626c6531207b0a0970616464696e673a203270783b0a7d0a0a7461626c652e7461626c6531207468656164207468207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09746578742d7472616e73666f726d3a207570706572636173653b0a09636f6c6f723a20234646464646463b0a096c696e652d6865696768743a20312e33656d3b0a09666f6e742d73697a653a2031656d3b0a0970616464696e673a2030203020347078203370783b0a7d0a0a7461626c652e7461626c6531207468656164207468207370616e207b0a0970616464696e672d6c6566743a203770783b0a7d0a0a7461626c652e7461626c65312074626f6479207472207b0a09626f726465723a2031707820736f6c696420236366636663663b0a7d0a0a7461626c652e7461626c65312074626f64792074723a686f7665722c207461626c652e7461626c65312074626f64792074722e686f766572207b0a096261636b67726f756e642d636f6c6f723a20236636663666363b0a09636f6c6f723a20233030303b0a7d0a0a7461626c652e7461626c6531207464207b0a09636f6c6f723a20233661366136613b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a7461626c652e7461626c65312074626f6479207464207b0a0970616464696e673a203570783b0a09626f726465722d746f703a2031707820736f6c696420234641464146413b0a7d0a0a7461626c652e7461626c65312074626f6479207468207b0a0970616464696e673a203570783b0a09626f726465722d626f74746f6d3a2031707820736f6c696420233030303030303b0a09746578742d616c69676e3a206c6566743b0a09636f6c6f723a20233333333333333b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a2f2a20537065636966696320636f6c756d6e207374796c6573202a2f0a7461626c652e7461626c6531202e6e616d6509097b20746578742d616c69676e3a206c6566743b207d0a7461626c652e7461626c6531202e706f73747309097b20746578742d616c69676e3a2063656e7465722021696d706f7274616e743b2077696474683a2037253b207d0a7461626c652e7461626c6531202e6a6f696e6564097b20746578742d616c69676e3a206c6566743b2077696474683a203135253b207d0a7461626c652e7461626c6531202e616374697665097b20746578742d616c69676e3a206c6566743b2077696474683a203135253b207d0a7461626c652e7461626c6531202e6d61726b09097b20746578742d616c69676e3a2063656e7465723b2077696474683a2037253b207d0a7461626c652e7461626c6531202e696e666f09097b20746578742d616c69676e3a206c6566743b2077696474683a203330253b207d0a7461626c652e7461626c6531202e696e666f20646976097b2077696474683a20313030253b2077686974652d73706163653a206e6f726d616c3b206f766572666c6f773a2068696464656e3b207d0a7461626c652e7461626c6531202e6175746f636f6c097b206c696e652d6865696768743a2032656d3b2077686974652d73706163653a206e6f777261703b207d0a7461626c652e7461626c6531207468656164202e6175746f636f6c207b2070616464696e672d6c6566743a2031656d3b207d0a0a7461626c652e7461626c6531207370616e2e72616e6b2d696d67207b0a09666c6f61743a2072696768743b0a0977696474683a206175746f3b0a7d0a0a7461626c652e696e666f207464207b0a0970616464696e673a203370783b0a7d0a0a7461626c652e696e666f2074626f6479207468207b0a0970616464696e673a203370783b0a09746578742d616c69676e3a2072696768743b0a09766572746963616c2d616c69676e3a20746f703b0a09636f6c6f723a20233030303030303b0a09666f6e742d7765696768743a206e6f726d616c3b0a7d0a0a2e666f72756d6267207461626c652e7461626c6531207b0a096d617267696e3a20303b0a7d0a0a2e666f72756d62672d7461626c65203e202e696e6e6572207b0a096d617267696e3a2030202d3170783b0a7d0a0a2e666f72756d62672d7461626c65203e202e696e6e6572203e207370616e2e636f726e6572732d746f70207b0a096d617267696e3a2030202d347078202d317078202d3470783b0a7d0a0a2e666f72756d62672d7461626c65203e202e696e6e6572203e207370616e2e636f726e6572732d626f74746f6d207b0a096d617267696e3a202d317078202d3470782030202d3470783b0a7d0a0a2f2a204d697363206c61796f7574207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2f2a20636f6c756d6e5b312d325d207374796c65732061726520636f6e7461696e65727320666f722074776f20636f6c756d6e206c61796f757473200a202020416c736f2073656520747765616b732e637373202a2f0a2e636f6c756d6e31207b0a09666c6f61743a206c6566743b0a09636c6561723a206c6566743b0a0977696474683a203439253b0a7d0a0a2e636f6c756d6e32207b0a09666c6f61743a2072696768743b0a09636c6561723a2072696768743b0a0977696474683a203439253b0a7d0a0a2f2a2047656e6572616c20636c617373657320666f7220706c6163696e6720666c6f6174696e6720626c6f636b73202a2f0a2e6c6566742d626f78207b0a09666c6f61743a206c6566743b0a0977696474683a206175746f3b0a09746578742d616c69676e3a206c6566743b0a7d0a0a2e72696768742d626f78207b0a09666c6f61743a2072696768743b0a0977696474683a206175746f3b0a09746578742d616c69676e3a2072696768743b0a7d0a0a646c2e64657461696c73207b0a092f2a666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b2a2f0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a646c2e64657461696c73206474207b0a09666c6f61743a206c6566743b0a09636c6561723a206c6566743b0a0977696474683a203330253b0a09746578742d616c69676e3a2072696768743b0a09636f6c6f723a20233030303030303b0a09646973706c61793a20626c6f636b3b0a7d0a0a646c2e64657461696c73206464207b0a096d617267696e2d6c6566743a20303b0a0970616464696e672d6c6566743a203570783b0a096d617267696e2d626f74746f6d3a203570783b0a09636f6c6f723a20233832383238323b0a09666c6f61743a206c6566743b0a0977696474683a203635253b0a7d0a0a2f2a20506167696e6174696f6e0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e706167696e6174696f6e207b0a096865696768743a2031253b202f2a20494520747765616b2028686f6c6c79206861636b29202a2f0a0977696474683a206175746f3b0a09746578742d616c69676e3a2072696768743b0a096d617267696e2d746f703a203570783b0a09666c6f61743a2072696768743b0a7d0a0a2e706167696e6174696f6e207370616e2e706167652d736570207b0a09646973706c61793a206e6f6e653b0a7d0a0a6c692e706167696e6174696f6e207b0a096d617267696e2d746f703a20303b0a7d0a0a2e706167696e6174696f6e207374726f6e672c202e706167696e6174696f6e2062207b0a09666f6e742d7765696768743a206e6f726d616c3b0a7d0a0a2e706167696e6174696f6e207370616e207374726f6e67207b0a0970616464696e673a2030203270783b0a096d617267696e3a2030203270783b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20234646464646463b0a096261636b67726f756e642d636f6c6f723a20236266626662663b0a09626f726465723a2031707820736f6c696420236266626662663b0a09666f6e742d73697a653a20302e39656d3b0a7d0a0a2e706167696e6174696f6e207370616e20612c202e706167696e6174696f6e207370616e20613a6c696e6b2c202e706167696e6174696f6e207370616e20613a766973697465642c202e706167696e6174696f6e207370616e20613a616374697665207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09636f6c6f723a20233734373437343b0a096d617267696e3a2030203270783b0a0970616464696e673a2030203270783b0a096261636b67726f756e642d636f6c6f723a20236565656565653b0a09626f726465723a2031707820736f6c696420236261626162613b0a09666f6e742d73697a653a20302e39656d3b0a096c696e652d6865696768743a20312e35656d3b0a7d0a0a2e706167696e6174696f6e207370616e20613a686f766572207b0a09626f726465722d636f6c6f723a20236432643264323b0a096261636b67726f756e642d636f6c6f723a20236432643264323b0a09636f6c6f723a20234646463b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2e706167696e6174696f6e20696d67207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a7d0a0a2f2a20506167696e6174696f6e20696e2076696577666f72756d20666f72206d756c74697061676520746f70696373202a2f0a2e726f77202e706167696e6174696f6e207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a0977696474683a206175746f3b0a096d617267696e2d746f703a20303b0a0970616464696e673a2031707820302031707820313570783b0a09666f6e742d73697a653a20302e39656d3b0a096261636b67726f756e643a206e6f6e65203020353025206e6f2d7265706561743b0a7d0a0a2e726f77202e706167696e6174696f6e207370616e20612c206c692e706167696e6174696f6e207370616e2061207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a2e726f77202e706167696e6174696f6e207370616e20613a686f7665722c206c692e706167696e6174696f6e207370616e20613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236432643264323b0a7d0a0a2f2a204d697363656c6c616e656f7573207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a23666f72756d2d7065726d697373696f6e73207b0a09666c6f61743a2072696768743b0a0977696474683a206175746f3b0a0970616464696e672d6c6566743a203570783b0a096d617267696e2d6c6566743a203570783b0a096d617267696e2d746f703a20313070783b0a09746578742d616c69676e3a2072696768743b0a7d0a0a2e636f70797269676874207b0a0970616464696e673a203570783b0a09746578742d616c69676e3a2063656e7465723b0a09636f6c6f723a20233535353535353b0a7d0a0a2e736d616c6c207b0a09666f6e742d73697a653a20302e39656d2021696d706f7274616e743b0a7d0a0a2e7469746c657370616365207b0a096d617267696e2d626f74746f6d3a20313570783b0a7d0a0a2e6865616465727370616365207b0a096d617267696e2d746f703a20323070783b0a7d0a0a2e6572726f72207b0a09636f6c6f723a20236263626362633b0a09666f6e742d7765696768743a20626f6c643b0a09666f6e742d73697a653a2031656d3b0a7d0a0a2e7265706f72746564207b0a096261636b67726f756e642d636f6c6f723a20236637663766373b0a7d0a0a6c692e7265706f727465643a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236563656365633b0a7d0a0a6469762e72756c6573207b0a096261636b67726f756e642d636f6c6f723a20236563656365633b0a09636f6c6f723a20236263626362633b0a0970616464696e673a203020313070783b0a096d617267696e3a203130707820303b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a6469762e72756c657320756c2c206469762e72756c6573206f6c207b0a096d617267696e2d6c6566743a20323070783b0a7d0a0a702e72756c6573207b0a096261636b67726f756e642d636f6c6f723a20236563656365633b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a0970616464696e673a203570783b0a7d0a0a702e72756c657320696d67207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a0970616464696e672d746f703a203570783b0a7d0a0a702e72756c65732061207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a09636c6561723a20626f74683b0a7d0a0a23746f70207b0a09706f736974696f6e3a206162736f6c7574653b0a09746f703a202d323070783b0a7d0a0a2e636c656172207b0a09646973706c61793a20626c6f636b3b0a09636c6561723a20626f74683b0a09666f6e742d73697a653a203170783b0a096c696e652d6865696768743a203170783b0a096261636b67726f756e643a207472616e73706172656e743b0a7d0a2f2a204c696e6b205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2f2a204c696e6b732061646a7573746d656e7420746f20636f72726563746c7920646973706c617920616e206f72646572206f662072746c2f6c7472206d6978656420636f6e74656e74202a2f0a61207b0a09646972656374696f6e3a206c74723b0a09756e69636f64652d626964693a20656d6265643b0a7d0a0a613a6c696e6b097b20636f6c6f723a20233839383938393b20746578742d6465636f726174696f6e3a206e6f6e653b207d0a613a76697369746564097b20636f6c6f723a20233839383938393b20746578742d6465636f726174696f6e3a206e6f6e653b207d0a613a686f766572097b20636f6c6f723a20236433643364333b20746578742d6465636f726174696f6e3a20756e6465726c696e653b207d0a613a616374697665097b20636f6c6f723a20236432643264323b20746578742d6465636f726174696f6e3a206e6f6e653b207d0a0a2f2a20436f6c6f7572656420757365726e616d6573202a2f0a2e757365726e616d652d636f6c6f75726564207b0a09666f6e742d7765696768743a20626f6c643b0a09646973706c61793a20696e6c696e652021696d706f7274616e743b0a0970616464696e673a20302021696d706f7274616e743b0a7d0a0a2f2a204c696e6b73206f6e206772616469656e74206261636b67726f756e6473202a2f0a237365617263682d626f7820613a6c696e6b2c202e6e6176626720613a6c696e6b2c202e666f72756d6267202e68656164657220613a6c696e6b2c202e666f72616267202e68656164657220613a6c696e6b2c20746820613a6c696e6b207b0a09636f6c6f723a20234646464646463b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a237365617263682d626f7820613a766973697465642c202e6e6176626720613a766973697465642c202e666f72756d6267202e68656164657220613a766973697465642c202e666f72616267202e68656164657220613a766973697465642c20746820613a76697369746564207b0a09636f6c6f723a20234646464646463b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a237365617263682d626f7820613a686f7665722c202e6e6176626720613a686f7665722c202e666f72756d6267202e68656164657220613a686f7665722c202e666f72616267202e68656164657220613a686f7665722c20746820613a686f766572207b0a09636f6c6f723a20236666666666663b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a237365617263682d626f7820613a6163746976652c202e6e6176626720613a6163746976652c202e666f72756d6267202e68656164657220613a6163746976652c202e666f72616267202e68656164657220613a6163746976652c20746820613a616374697665207b0a09636f6c6f723a20236666666666663b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2f2a204c696e6b7320666f7220666f72756d2f746f706963206c69737473202a2f0a612e666f72756d7469746c65207b0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2048656c7665746963612c20417269616c2c2053616e732d73657269663b0a09666f6e742d73697a653a20312e32656d3b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233839383938393b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2f2a20612e666f72756d7469746c653a76697369746564207b20636f6c6f723a20233839383938393b207d202a2f0a0a612e666f72756d7469746c653a686f766572207b0a09636f6c6f723a20236263626362633b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a612e666f72756d7469746c653a616374697665207b0a09636f6c6f723a20233839383938393b0a7d0a0a612e746f7069637469746c65207b0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2048656c7665746963612c20417269616c2c2053616e732d73657269663b0a09666f6e742d73697a653a20312e32656d3b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233839383938393b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2f2a20612e746f7069637469746c653a76697369746564207b20636f6c6f723a20236432643264323b207d202a2f0a0a612e746f7069637469746c653a686f766572207b0a09636f6c6f723a20236263626362633b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a612e746f7069637469746c653a616374697665207b0a09636f6c6f723a20233839383938393b0a7d0a0a2f2a20506f737420626f6479206c696e6b73202a2f0a2e706f73746c696e6b207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09636f6c6f723a20236432643264323b0a09626f726465722d626f74746f6d3a2031707820736f6c696420236432643264323b0a0970616464696e672d626f74746f6d3a20303b0a7d0a0a2f2a202e706f73746c696e6b3a76697369746564207b20636f6c6f723a20236264626462643b207d202a2f0a0a2e706f73746c696e6b3a616374697665207b0a09636f6c6f723a20236432643264323b0a7d0a0a2e706f73746c696e6b3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236636663666363b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09636f6c6f723a20233430343034303b0a7d0a0a2e7369676e617475726520612c202e7369676e617475726520613a766973697465642c202e7369676e617475726520613a686f7665722c202e7369676e617475726520613a616374697665207b0a09626f726465723a206e6f6e653b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0a7d0a0a2f2a2050726f66696c65206c696e6b73202a2f0a2e706f737470726f66696c6520613a6c696e6b2c202e706f737470726f66696c6520613a766973697465642c202e706f737470726f66696c652064742e617574686f722061207b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233839383938393b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2e706f737470726f66696c6520613a686f7665722c202e706f737470726f66696c652064742e617574686f7220613a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a09636f6c6f723a20236433643364333b0a7d0a0a2f2a20435353207370656320726571756972657320613a6c696e6b2c20613a766973697465642c20613a686f76657220616e6420613a6163746976652072756c657320746f2062652073706563696669656420696e2074686973206f726465722e202a2f0a2f2a2053656520687474703a2f2f7777772e70687062622e636f6d2f627567732f7068706262332f3539363835202a2f0a2e706f737470726f66696c6520613a616374697665207b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233839383938393b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a0a2f2a2050726f66696c6520736561726368726573756c7473202a2f090a2e736561726368202e706f737470726f66696c652061207b0a09636f6c6f723a20233839383938393b0a09746578742d6465636f726174696f6e3a206e6f6e653b200a09666f6e742d7765696768743a206e6f726d616c3b0a7d0a0a2e736561726368202e706f737470726f66696c6520613a686f766572207b0a09636f6c6f723a20236433643364333b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b200a7d0a0a2f2a204261636b20746f20746f70206f662070616765202a2f0a2e6261636b32746f70207b0a09636c6561723a20626f74683b0a096865696768743a20313170783b0a09746578742d616c69676e3a2072696768743b0a7d0a0a612e746f70207b0a096261636b67726f756e643a206e6f6e65206e6f2d72657065617420746f70206c6566743b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a0977696474683a207b494d475f49434f4e5f4241434b5f544f505f57494454487d70783b0a096865696768743a207b494d475f49434f4e5f4241434b5f544f505f4845494748547d70783b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a096f766572666c6f773a2068696464656e3b0a096c65747465722d73706163696e673a203130303070783b0a09746578742d696e64656e743a20313170783b0a7d0a0a612e746f7032207b0a096261636b67726f756e643a206e6f6e65206e6f2d7265706561742030203530253b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a0970616464696e672d6c6566743a20313570783b0a7d0a0a2f2a204172726f77206c696e6b7320202a2f0a612e757009097b206261636b67726f756e643a206e6f6e65206e6f2d726570656174206c6566742063656e7465723b207d0a612e646f776e09097b206261636b67726f756e643a206e6f6e65206e6f2d7265706561742072696768742063656e7465723b207d0a612e6c65667409097b206261636b67726f756e643a206e6f6e65206e6f2d72657065617420337078203630253b207d0a612e726967687409097b206261636b67726f756e643a206e6f6e65206e6f2d72657065617420393525203630253b207d0a0a612e75702c20612e75703a6c696e6b2c20612e75703a6163746976652c20612e75703a76697369746564207b0a0970616464696e672d6c6566743a20313070783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09626f726465722d626f74746f6d2d77696474683a20303b0a7d0a0a612e75703a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a206c65667420746f703b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0a7d0a0a612e646f776e2c20612e646f776e3a6c696e6b2c20612e646f776e3a6163746976652c20612e646f776e3a76697369746564207b0a0970616464696e672d72696768743a20313070783b0a7d0a0a612e646f776e3a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a20726967687420626f74746f6d3b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a612e6c6566742c20612e6c6566743a6163746976652c20612e6c6566743a76697369746564207b0a0970616464696e672d6c6566743a20313270783b0a7d0a0a612e6c6566743a686f766572207b0a09636f6c6f723a20236432643264323b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a2030203630253b0a7d0a0a612e72696768742c20612e72696768743a6163746976652c20612e72696768743a76697369746564207b0a0970616464696e672d72696768743a20313270783b0a7d0a0a612e72696768743a686f766572207b0a09636f6c6f723a20236432643264323b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a2031303025203630253b0a7d0a0a2f2a20696e76697369626c6520736b6970206c696e6b2c207573656420666f72206163636573736962696c69747920202a2f0a2e736b69706c696e6b207b0a09706f736974696f6e3a206162736f6c7574653b0a096c6566743a202d39393970783b0a0977696474683a2039393070783b0a7d0a0a2f2a20466565642069636f6e20696e20666f72756d6c6973745f626f64792e68746d6c202a2f0a612e666565642d69636f6e2d666f72756d207b0a09666c6f61743a2072696768743b0a096d617267696e3a203370783b0a7d0a2f2a20436f6e74656e74205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a756c2e746f7069636c697374207b0a09646973706c61793a20626c6f636b3b0a096c6973742d7374796c652d747970653a206e6f6e653b0a096d617267696e3a20303b0a7d0a0a756c2e666f72756d73207b0a096261636b67726f756e643a2023663966396639206e6f6e65207265706561742d78203020303b0a7d0a0a756c2e746f7069636c697374206c69207b0a09646973706c61793a20626c6f636b3b0a096c6973742d7374796c652d747970653a206e6f6e653b0a09636f6c6f723a20233737373737373b0a096d617267696e3a20303b0a7d0a0a756c2e746f7069636c69737420646c207b0a09706f736974696f6e3a2072656c61746976653b0a7d0a0a756c2e746f7069636c697374206c692e726f7720646c207b0a0970616464696e673a2032707820303b0a7d0a0a756c2e746f7069636c697374206474207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a0977696474683a203530253b0a09666f6e742d73697a653a20312e31656d3b0a0970616464696e672d6c6566743a203570783b0a0970616464696e672d72696768743a203570783b0a7d0a0a756c2e746f7069636c697374206464207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a09626f726465722d6c6566743a2031707820736f6c696420234646464646463b0a0970616464696e673a2034707820303b0a7d0a0a756c2e746f7069636c6973742064666e207b0a092f2a204c6162656c7320666f7220706f73742f7669657720636f756e7473202a2f0a09706f736974696f6e3a206162736f6c7574653b0a096c6566743a202d39393970783b0a0977696474683a2039393070783b0a7d0a0a756c2e746f7069636c697374206c692e726f7720647420612e737562666f72756d207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a2030203530253b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a09706f736974696f6e3a2072656c61746976653b0a0977686974652d73706163653a206e6f777261703b0a0970616464696e673a20302030203020313270783b0a7d0a0a2e666f72756d2d696d616765207b0a09666c6f61743a206c6566743b0a0970616464696e672d746f703a203570783b0a096d617267696e2d72696768743a203570783b0a7d0a0a6c692e726f77207b0a09626f726465722d746f703a2031707820736f6c696420234646464646463b0a09626f726465722d626f74746f6d3a2031707820736f6c696420233866386638663b0a7d0a0a6c692e726f77207374726f6e67207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20233030303030303b0a7d0a0a6c692e726f773a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236636663666363b0a7d0a0a6c692e726f773a686f766572206464207b0a09626f726465722d6c6566742d636f6c6f723a20234343434343433b0a7d0a0a6c692e6865616465722064742c206c692e686561646572206464207b0a096c696e652d6865696768743a2031656d3b0a09626f726465722d6c6566742d77696474683a20303b0a096d617267696e3a2032707820302034707820303b0a09636f6c6f723a20234646464646463b0a0970616464696e672d746f703a203270783b0a0970616464696e672d626f74746f6d3a203270783b0a09666f6e742d73697a653a2031656d3b0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a09746578742d7472616e73666f726d3a207570706572636173653b0a7d0a0a6c692e686561646572206474207b0a09666f6e742d7765696768743a20626f6c643b0a7d0a0a6c692e686561646572206464207b0a096d617267696e2d6c6566743a203170783b0a7d0a0a6c692e68656164657220646c2e69636f6e207b0a096d696e2d6865696768743a20303b0a7d0a0a6c692e68656164657220646c2e69636f6e206474207b0a092f2a20547765616b20666f72206865616465727320616c69676e6d656e74207768656e20666f6c6465722069636f6e2075736564202a2f0a0970616464696e672d6c6566743a20303b0a0970616464696e672d72696768743a20353070783b0a7d0a0a2f2a20466f72756d206c69737420636f6c756d6e207374796c6573202a2f0a646c2e69636f6e207b0a096d696e2d6865696768743a20333570783b0a096261636b67726f756e642d706f736974696f6e3a2031307078203530253b09092f2a20506f736974696f6e206f6620666f6c6465722069636f6e202a2f0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a0a646c2e69636f6e206474207b0a0970616464696e672d6c6566743a20343570783b09090909092f2a20537061636520666f7220666f6c6465722069636f6e202a2f0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a096261636b67726f756e642d706f736974696f6e3a20357078203935253b09092f2a20506f736974696f6e206f6620746f7069632069636f6e202a2f0a7d0a0a64642e706f7374732c2064642e746f706963732c2064642e7669657773207b0a0977696474683a2038253b0a09746578742d616c69676e3a2063656e7465723b0a096c696e652d6865696768743a20322e32656d3b0a09666f6e742d73697a653a20312e32656d3b0a7d0a0a2f2a204c69737420696e20666f72756d206465736372697074696f6e202a2f0a646c2e69636f6e206474206f6c2c0a646c2e69636f6e20647420756c207b0a096c6973742d7374796c652d706f736974696f6e3a20696e736964653b0a096d617267696e2d6c6566743a2031656d3b0a7d0a0a646c2e69636f6e206474206c69207b0a09646973706c61793a206c6973742d6974656d3b0a096c6973742d7374796c652d747970653a20696e68657269743b0a7d0a0a64642e6c617374706f7374207b0a0977696474683a203235253b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a64642e7265646972656374207b0a09666f6e742d73697a653a20312e31656d3b0a096c696e652d6865696768743a20322e35656d3b0a7d0a0a64642e6d6f6465726174696f6e207b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a64642e6c617374706f7374207370616e2c20756c2e746f7069636c6973742064642e7365617263686279207370616e2c20756c2e746f7069636c6973742064642e696e666f207370616e2c20756c2e746f7069636c6973742064642e74696d65207370616e2c2064642e7265646972656374207370616e2c2064642e6d6f6465726174696f6e207370616e207b0a09646973706c61793a20626c6f636b3b0a0970616464696e672d6c6566743a203570783b0a7d0a0a64642e74696d65207b0a0977696474683a206175746f3b0a096c696e652d6865696768743a20323030253b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a64642e6578747261207b0a0977696474683a203132253b0a096c696e652d6865696768743a20323030253b0a09746578742d616c69676e3a2063656e7465723b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a64642e6d61726b207b0a09666c6f61743a2072696768742021696d706f7274616e743b0a0977696474683a2039253b0a09746578742d616c69676e3a2063656e7465723b0a096c696e652d6865696768743a20323030253b0a09666f6e742d73697a653a20312e32656d3b0a7d0a0a64642e696e666f207b0a0977696474683a203330253b0a7d0a0a64642e6f7074696f6e207b0a0977696474683a203135253b0a096c696e652d6865696768743a20323030253b0a09746578742d616c69676e3a2063656e7465723b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a64642e7365617263686279207b0a0977696474683a203437253b0a09666f6e742d73697a653a20312e31656d3b0a096c696e652d6865696768743a2031656d3b0a7d0a0a756c2e746f7069636c6973742064642e7365617263686578747261207b0a096d617267696e2d6c6566743a203570783b0a0970616464696e673a20302e32656d20303b0a09666f6e742d73697a653a20312e31656d3b0a09636f6c6f723a20233333333333333b0a09626f726465722d6c6566743a206e6f6e653b0a09636c6561723a20626f74683b0a0977696474683a203938253b0a096f766572666c6f773a2068696464656e3b0a7d0a0a2f2a20436f6e7461696e657220666f7220706f73742f7265706c7920627574746f6e7320616e6420706167696e6174696f6e202a2f0a2e746f7069632d616374696f6e73207b0a096d617267696e2d626f74746f6d3a203370783b0a09666f6e742d73697a653a20312e31656d3b0a096865696768743a20323870783b0a096d696e2d6865696768743a20323870783b0a7d0a6469765b636c6173735d2e746f7069632d616374696f6e73207b0a096865696768743a206175746f3b0a7d0a0a2f2a20506f737420626f6479207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e706f7374626f6479207b0a0970616464696e673a20303b0a096c696e652d6865696768743a20312e3438656d3b0a09636f6c6f723a20233333333333333b0a0977696474683a203736253b0a09666c6f61743a206c6566743b0a09636c6561723a20626f74683b0a7d0a0a2e706f7374626f6479202e69676e6f7265207b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a2e706f7374626f64792068332e6669727374207b0a092f2a2054686520666972737420706f7374206f6e20746865207061676520757365732074686973202a2f0a09666f6e742d73697a653a20312e37656d3b0a7d0a0a2e706f7374626f6479206833207b0a092f2a20506f7374626f6479207265717569726573206120646966666572656e7420683320666f726d6174202d20736f206368616e67652069742068657265202a2f0a09666f6e742d73697a653a20312e35656d3b0a0970616464696e673a203270782030203020303b0a096d617267696e3a2030203020302e33656d20302021696d706f7274616e743b0a09746578742d7472616e73666f726d3a206e6f6e653b0a09626f726465723a206e6f6e653b0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a096c696e652d6865696768743a20313235253b0a7d0a0a2e706f7374626f647920683320696d67207b0a092f2a20416c736f2073656520747765616b732e637373202a2f0a09766572746963616c2d616c69676e3a20626f74746f6d3b0a7d0a0a2e706f7374626f6479202e636f6e74656e74207b0a09666f6e742d73697a653a20312e33656d3b0a7d0a0a2e736561726368202e706f7374626f6479207b0a0977696474683a203638250a7d0a0a2f2a20546f706963207265766965772070616e656c0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a23726576696577207b0a096d617267696e2d746f703a2032656d3b0a7d0a0a23746f706963726576696577207b0a0970616464696e672d72696768743a203570783b0a096f766572666c6f773a206175746f3b0a096865696768743a2033303070783b0a7d0a0a23746f706963726576696577202e706f7374626f6479207b0a0977696474683a206175746f3b0a09666c6f61743a206e6f6e653b0a096d617267696e3a20303b0a096865696768743a206175746f3b0a7d0a0a23746f706963726576696577202e706f7374207b0a096865696768743a206175746f3b0a7d0a0a23746f706963726576696577206832207b0a09626f726465722d626f74746f6d2d77696474683a20303b0a7d0a0a2e706f73742d69676e6f7265202e706f7374626f6479207b0a09646973706c61793a206e6f6e653b0a7d0a0a2f2a204d435020506f73742064657461696c730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a23706f73745f64657461696c730a7b0a092f2a20546869732077696c6c206f6e6c7920776f726b20696e204945372b2c20706c757320746865206f7468657273202a2f0a096f766572666c6f773a206175746f3b0a096d61782d6865696768743a2033303070783b0a7d0a0a23657870616e640a7b0a09636c6561723a20626f74683b0a7d0a0a2f2a20436f6e74656e7420636f6e7461696e6572207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e636f6e74656e74207b0a096d696e2d6865696768743a2033656d3b0a096f766572666c6f773a2068696464656e3b0a096c696e652d6865696768743a20312e34656d3b0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09666f6e742d73697a653a2031656d3b0a09636f6c6f723a20233333333333333b0a0970616464696e672d626f74746f6d3a203170783b0a7d0a0a2e636f6e74656e742068322c202e70616e656c206832207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20233938393839383b0a09626f726465722d626f74746f6d3a2031707820736f6c696420234343434343433b0a09666f6e742d73697a653a20312e36656d3b0a096d617267696e2d746f703a20302e35656d3b0a096d617267696e2d626f74746f6d3a20302e35656d3b0a0970616464696e672d626f74746f6d3a20302e35656d3b0a7d0a0a2e70616e656c206833207b0a096d617267696e3a20302e35656d20303b0a7d0a0a2e70616e656c2070207b0a09666f6e742d73697a653a20312e32656d3b0a096d617267696e2d626f74746f6d3a2031656d3b0a096c696e652d6865696768743a20312e34656d3b0a7d0a0a2e636f6e74656e742070207b0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09666f6e742d73697a653a20312e32656d3b0a096d617267696e2d626f74746f6d3a2031656d3b0a096c696e652d6865696768743a20312e34656d3b0a7d0a0a646c2e666171207b0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09666f6e742d73697a653a20312e31656d3b0a096d617267696e2d746f703a2031656d3b0a096d617267696e2d626f74746f6d3a2032656d3b0a096c696e652d6865696768743a20312e34656d3b0a7d0a0a646c2e666171206474207b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233333333333333b0a7d0a0a2e636f6e74656e7420646c2e666171207b0a09666f6e742d73697a653a20312e32656d3b0a096d617267696e2d626f74746f6d3a20302e35656d3b0a7d0a0a2e636f6e74656e74206c69207b0a096c6973742d7374796c652d747970653a20696e68657269743b0a7d0a0a2e636f6e74656e7420756c2c202e636f6e74656e74206f6c207b0a096d617267696e2d626f74746f6d3a2031656d3b0a096d617267696e2d6c6566743a2033656d3b0a7d0a0a2e706f737468696c6974207b0a096261636b67726f756e642d636f6c6f723a20236633663366333b0a09636f6c6f723a20234243424342433b0a0970616464696e673a20302032707820317078203270783b0a7d0a0a2e616e6e6f756e63652c202e756e72656164706f7374207b0a092f2a20486967686c696768742074686520616e6e6f756e63656d656e7473202620756e7265616420706f73747320626f78202a2f0a09626f726465722d6c6566742d636f6c6f723a20234243424342433b0a09626f726465722d72696768742d636f6c6f723a20234243424342433b0a7d0a0a2f2a20506f737420617574686f72202a2f0a702e617574686f72207b0a096d617267696e3a2030203135656d20302e36656d20303b0a0970616464696e673a203020302035707820303b0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09666f6e742d73697a653a2031656d3b0a096c696e652d6865696768743a20312e32656d3b0a7d0a0a2f2a20506f7374207369676e6174757265202a2f0a2e7369676e6174757265207b0a096d617267696e2d746f703a20312e35656d3b0a0970616464696e672d746f703a20302e32656d3b0a09666f6e742d73697a653a20312e31656d3b0a09626f726465722d746f703a2031707820736f6c696420234343434343433b0a09636c6561723a206c6566743b0a096c696e652d6865696768743a20313430253b0a096f766572666c6f773a2068696464656e3b0a0977696474683a20313030253b0a7d0a0a6464202e7369676e6174757265207b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09636c6561723a206e6f6e653b0a09626f726465723a206e6f6e653b0a7d0a0a2e7369676e6174757265206c69207b0a096c6973742d7374796c652d747970653a20696e68657269743b0a7d0a0a2e7369676e617475726520756c2c202e7369676e6174757265206f6c207b0a096d617267696e2d626f74746f6d3a2031656d3b0a096d617267696e2d6c6566743a2033656d3b0a7d0a0a2f2a20506f7374206e6f746963696573202a2f0a2e6e6f74696365207b0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a0977696474683a206175746f3b0a096d617267696e2d746f703a20312e35656d3b0a0970616464696e672d746f703a20302e32656d3b0a09666f6e742d73697a653a2031656d3b0a09626f726465722d746f703a203170782064617368656420234343434343433b0a09636c6561723a206c6566743b0a096c696e652d6865696768743a20313330253b0a7d0a0a2f2a204a756d7020746f20706f7374206c696e6b20666f72206e6f77202a2f0a756c2e736561726368726573756c7473207b0a096c6973742d7374796c653a206e6f6e653b0a09746578742d616c69676e3a2072696768743b0a09636c6561723a20626f74683b0a7d0a0a2f2a20424220436f6465207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2f2a2051756f746520626c6f636b202a2f0a626c6f636b71756f7465207b0a096261636b67726f756e643a2023656265626562206e6f6e652036707820387078206e6f2d7265706561743b0a09626f726465723a2031707820736f6c696420236462646264623b0a09666f6e742d73697a653a20302e3935656d3b0a096d617267696e3a20302e35656d20317078203020323570783b0a096f766572666c6f773a2068696464656e3b0a0970616464696e673a203570783b0a7d0a0a626c6f636b71756f746520626c6f636b71756f7465207b0a092f2a204e65737465642071756f746573202a2f0a096261636b67726f756e642d636f6c6f723a20236261626162613b0a09666f6e742d73697a653a2031656d3b0a096d617267696e3a20302e35656d20317078203020313570783b090a7d0a0a626c6f636b71756f746520626c6f636b71756f746520626c6f636b71756f7465207b0a092f2a204e65737465642071756f746573202a2f0a096261636b67726f756e642d636f6c6f723a20236534653465343b0a7d0a0a626c6f636b71756f74652063697465207b0a092f2a20557365726e616d652f736f75726365206f662071756f746572202a2f0a09666f6e742d7374796c653a206e6f726d616c3b0a09666f6e742d7765696768743a20626f6c643b0a096d617267696e2d6c6566743a20323070783b0a09646973706c61793a20626c6f636b3b0a09666f6e742d73697a653a20302e39656d3b0a7d0a0a626c6f636b71756f746520636974652063697465207b0a09666f6e742d73697a653a2031656d3b0a7d0a0a626c6f636b71756f74652e756e6369746564207b0a0970616464696e672d746f703a20323570783b0a7d0a0a2f2a20436f646520626c6f636b202a2f0a646c2e636f6465626f78207b0a0970616464696e673a203370783b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a09626f726465723a2031707820736f6c696420236438643864383b0a09666f6e742d73697a653a2031656d3b0a7d0a0a646c2e636f6465626f78206474207b0a09746578742d7472616e73666f726d3a207570706572636173653b0a09626f726465722d626f74746f6d3a2031707820736f6c696420234343434343433b0a096d617267696e2d626f74746f6d3a203370783b0a09666f6e742d73697a653a20302e38656d3b0a09666f6e742d7765696768743a20626f6c643b0a09646973706c61793a20626c6f636b3b0a7d0a0a626c6f636b71756f746520646c2e636f6465626f78207b0a096d617267696e2d6c6566743a20303b0a7d0a0a646c2e636f6465626f7820636f6465207b0a092f2a20416c736f2073656520747765616b732e637373202a2f0a096f766572666c6f773a206175746f3b0a09646973706c61793a20626c6f636b3b0a096865696768743a206175746f3b0a096d61782d6865696768743a2032303070783b0a0977686974652d73706163653a206e6f726d616c3b0a0970616464696e672d746f703a203570783b0a09666f6e743a20302e39656d204d6f6e61636f2c2022416e64616c65204d6f6e6f222c22436f7572696572204e6577222c20436f75726965722c206d6f6e6f3b0a096c696e652d6865696768743a20312e33656d3b0a09636f6c6f723a20233862386238623b0a096d617267696e3a2032707820303b0a7d0a0a2e73796e746178626709097b20636f6c6f723a20234646464646463b207d0a2e73796e746178636f6d6d656e74097b20636f6c6f723a20233030303030303b207d0a2e73796e74617864656661756c74097b20636f6c6f723a20236263626362633b207d0a2e73796e74617868746d6c09097b20636f6c6f723a20233030303030303b207d0a2e73796e7461786b6579776f7264097b20636f6c6f723a20233538353835383b207d0a2e73796e746178737472696e67097b20636f6c6f723a20236137613761373b207d0a0a2f2a204174746163686d656e74730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e617474616368626f78207b0a09666c6f61743a206c6566743b0a0977696474683a206175746f3b200a096d617267696e3a20357078203570782035707820303b0a0970616464696e673a203670783b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a09626f726465723a203170782064617368656420236438643864383b0a09636c6561723a206c6566743b0a7d0a0a2e706d2d6d657373616765202e617474616368626f78207b0a096261636b67726f756e642d636f6c6f723a20236633663366333b0a7d0a0a2e617474616368626f78206474207b0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a09746578742d7472616e73666f726d3a207570706572636173653b0a7d0a0a2e617474616368626f78206464207b0a096d617267696e2d746f703a203470783b0a0970616464696e672d746f703a203470783b0a09636c6561723a206c6566743b0a09626f726465722d746f703a2031707820736f6c696420236438643864383b0a7d0a0a2e617474616368626f78206464206464207b0a09626f726465723a206e6f6e653b0a7d0a0a2e617474616368626f782070207b0a096c696e652d6865696768743a20313130253b0a09636f6c6f723a20233636363636363b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636c6561723a206c6566743b0a7d0a0a2e617474616368626f7820702e73746174730a7b0a096c696e652d6865696768743a20313130253b0a09636f6c6f723a20233636363636363b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636c6561723a206c6566743b0a7d0a0a2e6174746163682d696d616765207b0a096d617267696e3a2033707820303b0a0977696474683a20313030253b0a096d61782d6865696768743a2033353070783b0a096f766572666c6f773a206175746f3b0a7d0a0a2e6174746163682d696d61676520696d67207b0a09626f726465723a2031707820736f6c696420233939393939393b0a2f2a09637572736f723a206d6f76653b202a2f0a09637572736f723a2064656661756c743b0a7d0a0a2f2a20496e6c696e6520696d616765207468756d626e61696c73202a2f0a6469762e696e6c696e652d6174746163686d656e7420646c2e7468756d626e61696c2c206469762e696e6c696e652d6174746163686d656e7420646c2e66696c65207b0a09646973706c61793a20626c6f636b3b0a096d617267696e2d626f74746f6d3a203470783b0a7d0a0a6469762e696e6c696e652d6174746163686d656e742070207b0a09666f6e742d73697a653a20313030253b0a7d0a0a646c2e66696c65207b0a09666f6e742d66616d696c793a2056657264616e612c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a09646973706c61793a20626c6f636b3b0a7d0a0a646c2e66696c65206474207b0a09746578742d7472616e73666f726d3a206e6f6e653b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09666f6e742d7765696768743a20626f6c643b0a09666f6e742d66616d696c793a2056657264616e612c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a7d0a0a646c2e66696c65206464207b0a09636f6c6f723a20233636363636363b0a096d617267696e3a20303b0a0970616464696e673a20303b090a7d0a0a646c2e7468756d626e61696c20696d67207b0a0970616464696e673a203370783b0a09626f726465723a2031707820736f6c696420233636363636363b0a096261636b67726f756e642d636f6c6f723a20234646463b0a7d0a0a646c2e7468756d626e61696c206464207b0a09636f6c6f723a20233636363636363b0a09666f6e742d7374796c653a206974616c69633b0a09666f6e742d66616d696c793a2056657264616e612c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a7d0a0a2e617474616368626f7820646c2e7468756d626e61696c206464207b0a09666f6e742d73697a653a20313030253b0a7d0a0a646c2e7468756d626e61696c20647420613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234545454545453b0a7d0a0a646c2e7468756d626e61696c20647420613a686f76657220696d67207b0a09626f726465723a2031707820736f6c696420236432643264323b0a7d0a0a2f2a20506f737420706f6c6c207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a6669656c647365742e706f6c6c73207b0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a7d0a0a6669656c647365742e706f6c6c7320646c207b0a096d617267696e2d746f703a203570783b0a09626f726465722d746f703a2031707820736f6c696420236532653265323b0a0970616464696e673a203570782030203020303b0a096c696e652d6865696768743a20313230253b0a09636f6c6f723a20233636363636363b0a7d0a0a6669656c647365742e706f6c6c7320646c2e766f746564207b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233030303030303b0a7d0a0a6669656c647365742e706f6c6c73206474207b0a09746578742d616c69676e3a206c6566743b0a09666c6f61743a206c6566743b0a09646973706c61793a20626c6f636b3b0a0977696474683a203330253b0a09626f726465722d72696768743a206e6f6e653b0a0970616464696e673a20303b0a096d617267696e3a20303b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a6669656c647365742e706f6c6c73206464207b0a09666c6f61743a206c6566743b0a0977696474683a203130253b0a09626f726465722d6c6566743a206e6f6e653b0a0970616464696e673a2030203570783b0a096d617267696e2d6c6566743a20303b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a6669656c647365742e706f6c6c732064642e726573756c74626172207b0a0977696474683a203530253b0a7d0a0a6669656c647365742e706f6c6c7320646420696e707574207b0a096d617267696e3a2032707820303b0a7d0a0a6669656c647365742e706f6c6c7320646420646976207b0a09746578742d616c69676e3a2072696768743b0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0a09636f6c6f723a20234646464646463b0a09666f6e742d7765696768743a20626f6c643b0a0970616464696e673a2030203270783b0a096f766572666c6f773a2076697369626c653b0a096d696e2d77696474683a2032253b0a7d0a0a2e706f6c6c62617231207b0a096261636b67726f756e642d636f6c6f723a20236161616161613b0a09626f726465722d626f74746f6d3a2031707820736f6c696420233734373437343b0a09626f726465722d72696768743a2031707820736f6c696420233734373437343b0a7d0a0a2e706f6c6c62617232207b0a096261636b67726f756e642d636f6c6f723a20236265626562653b0a09626f726465722d626f74746f6d3a2031707820736f6c696420233863386338633b0a09626f726465722d72696768743a2031707820736f6c696420233863386338633b0a7d0a0a2e706f6c6c62617233207b0a096261636b67726f756e642d636f6c6f723a20234431443144313b0a09626f726465722d626f74746f6d3a2031707820736f6c696420236161616161613b0a09626f726465722d72696768743a2031707820736f6c696420236161616161613b0a7d0a0a2e706f6c6c62617234207b0a096261636b67726f756e642d636f6c6f723a20236534653465343b0a09626f726465722d626f74746f6d3a2031707820736f6c696420236265626562653b0a09626f726465722d72696768743a2031707820736f6c696420236265626562653b0a7d0a0a2e706f6c6c62617235207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a09626f726465722d626f74746f6d3a2031707820736f6c696420234431443144313b0a09626f726465722d72696768743a2031707820736f6c696420234431443144313b0a7d0a0a2f2a20506f737465722070726f66696c6520626c6f636b0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e706f737470726f66696c65207b0a092f2a20416c736f2073656520747765616b732e637373202a2f0a096d617267696e3a203570782030203130707820303b0a096d696e2d6865696768743a20383070783b0a09636f6c6f723a20233636363636363b0a09626f726465722d6c6566743a2031707820736f6c696420234646464646463b0a0977696474683a203232253b0a09666c6f61743a2072696768743b0a09646973706c61793a20696e6c696e653b0a7d0a2e706d202e706f737470726f66696c65207b0a09626f726465722d6c6566743a2031707820736f6c696420234444444444443b0a7d0a0a2e706f737470726f66696c652064642c202e706f737470726f66696c65206474207b0a096c696e652d6865696768743a20312e32656d3b0a096d617267696e2d6c6566743a203870783b0a7d0a0a2e706f737470726f66696c65207374726f6e67207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20233030303030303b0a7d0a0a2e617661746172207b0a09626f726465723a206e6f6e653b0a096d617267696e2d626f74746f6d3a203370783b0a7d0a0a2e6f6e6c696e65207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a0a2f2a20506f737465722070726f66696c652075736564206279207365617263682a2f0a2e736561726368202e706f737470726f66696c65207b0a0977696474683a203330253b0a7d0a0a2f2a20706d206c69737420696e20636f6d706f7365206d657373616765206966206d61737320706d20697320656e61626c6564202a2f0a646c2e706d6c697374206474207b0a0977696474683a203630252021696d706f7274616e743b0a7d0a0a646c2e706d6c697374206474207465787461726561207b0a0977696474683a203935253b0a7d0a0a646c2e706d6c697374206464207b0a096d617267696e2d6c6566743a203631252021696d706f7274616e743b0a096d617267696e2d626f74746f6d3a203270783b0a7d0a2f2a20427574746f6e205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2f2a20526f6c6c6f76657220627574746f6e730a2020204261736564206f6e3a20687474703a2f2f77656c6c7374796c65642e636f6d2f6373732d6e6f7072656c6f61642d726f6c6c6f766572732e68746d6c0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e627574746f6e73207b0a09666c6f61743a206c6566743b0a0977696474683a206175746f3b0a096865696768743a206175746f3b0a7d0a0a2f2a20526f6c6c6f766572207374617465202a2f0a2e627574746f6e7320646976207b0a09666c6f61743a206c6566743b0a096d617267696e3a203020357078203020303b0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0a7d0a0a2f2a20526f6c6c6f6666207374617465202a2f0a2e627574746f6e73206469762061207b0a09646973706c61793a20626c6f636b3b0a0977696474683a20313030253b0a096865696768743a20313030253b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a09706f736974696f6e3a2072656c61746976653b0a096f766572666c6f773a2068696464656e3b0a7d0a0a2f2a2048696465203c613e207465787420616e642068696465206f66662d737461746520696d616765207768656e20726f6c6c696e67206f766572202870726576656e747320666c69636b657220696e20494529202a2f0a2f2a2e627574746f6e7320646976207370616e09097b20646973706c61793a206e6f6e653b207d2a2f0a2f2a2e627574746f6e732064697620613a686f766572097b206261636b67726f756e642d696d6167653a206e6f6e653b207d2a2f0a2e627574746f6e7320646976207370616e0909097b20706f736974696f6e3a206162736f6c7574653b2077696474683a20313030253b206865696768743a20313030253b20637572736f723a20706f696e7465723b7d0a2e627574746f6e732064697620613a686f766572207370616e097b206261636b67726f756e642d706f736974696f6e3a203020313030253b207d0a0a2f2a2042696720627574746f6e20696d61676573202a2f0a2e7265706c792d69636f6e207370616e097b206261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b207d0a2e706f73742d69636f6e207370616e09097b206261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b207d0a2e6c6f636b65642d69636f6e207370616e097b206261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b207d0a2e706d7265706c792d69636f6e207370616e097b206261636b67726f756e643a206e6f6e6520302030206e6f2d7265706561743b207d0a2e6e6577706d2d69636f6e207370616e20097b206261636b67726f756e643a206e6f6e6520302030206e6f2d7265706561743b207d0a2e666f7277617264706d2d69636f6e207370616e20097b206261636b67726f756e643a206e6f6e6520302030206e6f2d7265706561743b207d0a0a2f2a205365742062696720627574746f6e2064696d656e73696f6e73202a2f0a2e627574746f6e73206469762e7265706c792d69636f6e09097b2077696474683a207b494d475f425554544f4e5f544f5049435f5245504c595f57494454487d70783b206865696768743a207b494d475f425554544f4e5f544f5049435f5245504c595f4845494748547d70783b207d0a2e627574746f6e73206469762e706f73742d69636f6e09097b2077696474683a207b494d475f425554544f4e5f544f5049435f4e45575f57494454487d70783b206865696768743a207b494d475f425554544f4e5f544f5049435f4e45575f4845494748547d70783b207d0a2e627574746f6e73206469762e6c6f636b65642d69636f6e097b2077696474683a207b494d475f425554544f4e5f544f5049435f4c4f434b45445f57494454487d70783b206865696768743a207b494d475f425554544f4e5f544f5049435f4c4f434b45445f4845494748547d70783b207d0a2e627574746f6e73206469762e706d7265706c792d69636f6e097b2077696474683a207b494d475f425554544f4e5f504d5f5245504c595f57494454487d70783b206865696768743a207b494d475f425554544f4e5f504d5f5245504c595f4845494748547d70783b207d0a2e627574746f6e73206469762e6e6577706d2d69636f6e09097b2077696474683a207b494d475f425554544f4e5f504d5f4e45575f57494454487d70783b206865696768743a207b494d475f425554544f4e5f504d5f4e45575f4845494748547d70783b207d0a2e627574746f6e73206469762e666f7277617264706d2d69636f6e097b2077696474683a207b494d475f425554544f4e5f504d5f464f52574152445f57494454487d70783b206865696768743a207b494d475f425554544f4e5f504d5f464f52574152445f4845494748547d70783b207d0a0a2f2a205375622d68656164657220286e617669676174696f6e20626172290a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a612e7072696e742c20612e73656e64656d61696c2c20612e666f6e7473697a65207b0a09646973706c61793a20626c6f636b3b0a096f766572666c6f773a2068696464656e3b0a096865696768743a20313870783b0a09746578742d696e64656e743a202d3530303070783b0a09746578742d616c69676e3a206c6566743b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a0a612e7072696e74207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a0977696474683a20323270783b0a7d0a0a612e73656e64656d61696c207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a0977696474683a20323270783b0a7d0a0a612e666f6e7473697a65207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a2030202d3170783b0a0977696474683a20323970783b0a7d0a0a612e666f6e7473697a653a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a2030202d323070783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a2f2a2049636f6e20696d616765730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e73697465686f6d652c202e69636f6e2d6661712c202e69636f6e2d6d656d626572732c202e69636f6e2d686f6d652c202e69636f6e2d7563702c202e69636f6e2d72656769737465722c202e69636f6e2d6c6f676f75742c0a2e69636f6e2d626f6f6b6d61726b2c202e69636f6e2d62756d702c202e69636f6e2d7375627363726962652c202e69636f6e2d756e7375627363726962652c202e69636f6e2d70616765732c202e69636f6e2d736561726368207b0a096261636b67726f756e642d706f736974696f6e3a2030203530253b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a0970616464696e673a203170782030203020313770783b0a7d0a0a2f2a20506f737465722070726f66696c652069636f6e730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a756c2e70726f66696c652d69636f6e73207b0a0970616464696e672d746f703a20313070783b0a096c6973742d7374796c653a206e6f6e653b0a7d0a0a2f2a20526f6c6c6f766572207374617465202a2f0a756c2e70726f66696c652d69636f6e73206c69207b0a09666c6f61743a206c6566743b0a096d617267696e3a2030203670782033707820303b0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0a7d0a0a2f2a20526f6c6c6f6666207374617465202a2f0a756c2e70726f66696c652d69636f6e73206c692061207b0a09646973706c61793a20626c6f636b3b0a0977696474683a20313030253b0a096865696768743a20313030253b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a7d0a0a2f2a2048696465203c613e207465787420616e642068696465206f66662d737461746520696d616765207768656e20726f6c6c696e67206f766572202870726576656e747320666c69636b657220696e20494529202a2f0a756c2e70726f66696c652d69636f6e73206c69207370616e207b20646973706c61793a6e6f6e653b207d0a756c2e70726f66696c652d69636f6e73206c6920613a686f766572207b206261636b67726f756e643a206e6f6e653b207d0a0a2f2a20506f736974696f6e696e67206f66206d6f64657261746f722069636f6e73202a2f0a2e706f7374626f647920756c2e70726f66696c652d69636f6e73207b0a09666c6f61743a2072696768743b0a0977696474683a206175746f3b0a0970616464696e673a20303b0a7d0a0a2e706f7374626f647920756c2e70726f66696c652d69636f6e73206c69207b0a096d617267696e3a2030203370783b0a7d0a0a2f2a2050726f66696c652026206e617669676174696f6e2069636f6e73202a2f0a2e656d61696c2d69636f6e2c202e656d61696c2d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e61696d2d69636f6e2c202e61696d2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e7961686f6f2d69636f6e2c202e7961686f6f2d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e7765622d69636f6e2c202e7765622d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e6d736e6d2d69636f6e2c202e6d736e6d2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e6963712d69636f6e2c202e6963712d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e6a61626265722d69636f6e2c202e6a61626265722d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e706d2d69636f6e2c202e706d2d69636f6e2061090909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e71756f74652d69636f6e2c202e71756f74652d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a0a2f2a204d6f64657261746f722069636f6e73202a2f0a2e7265706f72742d69636f6e2c202e7265706f72742d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e7761726e2d69636f6e2c202e7761726e2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e656469742d69636f6e2c202e656469742d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e64656c6574652d69636f6e2c202e64656c6574652d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a2e696e666f2d69636f6e2c202e696e666f2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0a0a2f2a205365742070726f66696c652069636f6e2064696d656e73696f6e73202a2f0a756c2e70726f66696c652d69636f6e73206c692e656d61696c2d69636f6e09097b2077696474683a207b494d475f49434f4e5f434f4e544143545f454d41494c5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f454d41494c5f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e61696d2d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f41494d5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f41494d5f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e7961686f6f2d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f5941484f4f5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f5941484f4f5f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e7765622d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f5757575f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f5757575f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e6d736e6d2d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f4d534e4d5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f4d534e4d5f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e6963712d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f4943515f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f4943515f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e6a61626265722d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f4a41424245525f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f4a41424245525f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e706d2d69636f6e09097b2077696474683a207b494d475f49434f4e5f434f4e544143545f504d5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f504d5f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e71756f74652d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f51554f54455f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f51554f54455f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e7265706f72742d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f5245504f52545f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f5245504f52545f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e656469742d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f454449545f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f454449545f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e64656c6574652d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f44454c4554455f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f44454c4554455f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e696e666f2d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f494e464f5f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f494e464f5f4845494748547d70783b207d0a756c2e70726f66696c652d69636f6e73206c692e7761726e2d69636f6e097b2077696474683a207b494d475f49434f4e5f555345525f5741524e5f57494454487d70783b206865696768743a207b494d475f49434f4e5f555345525f5741524e5f4845494748547d70783b207d0a0a2f2a204669782070726f66696c652069636f6e2064656661756c74206d617267696e73202a2f0a756c2e70726f66696c652d69636f6e73206c692e656469742d69636f6e097b206d617267696e3a203020302030203370783b207d0a756c2e70726f66696c652d69636f6e73206c692e71756f74652d69636f6e097b206d617267696e3a20302030203020313070783b207d0a756c2e70726f66696c652d69636f6e73206c692e696e666f2d69636f6e2c20756c2e70726f66696c652d69636f6e73206c692e7265706f72742d69636f6e097b206d617267696e3a203020337078203020303b207d0a2f2a20436f6e74726f6c2050616e656c205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a0a2f2a204d61696e20435020626f780a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2363702d6d656e75207b0a09666c6f61743a6c6566743b0a0977696474683a203139253b0a096d617267696e2d746f703a2031656d3b0a096d617267696e2d626f74746f6d3a203570783b0a7d0a0a2363702d6d61696e207b0a09666c6f61743a206c6566743b0a0977696474683a203831253b0a7d0a0a2363702d6d61696e202e636f6e74656e74207b0a0970616464696e673a20303b0a7d0a0a2363702d6d61696e2068332c202363702d6d61696e2068722c202363702d6d656e75206872207b0a09626f726465722d636f6c6f723a20236266626662663b0a7d0a0a2363702d6d61696e202e70616e656c2070207b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a2363702d6d61696e202e70616e656c206f6c207b0a096d617267696e2d6c6566743a2032656d3b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a2363702d6d61696e202e70616e656c206c692e726f77207b0a09626f726465722d626f74746f6d3a2031707820736f6c696420236362636263623b0a09626f726465722d746f703a2031707820736f6c696420234639463946393b0a7d0a0a756c2e63706c697374207b0a096d617267696e2d626f74746f6d3a203570783b0a09626f726465722d746f703a2031707820736f6c696420236362636263623b0a7d0a0a2363702d6d61696e202e70616e656c206c692e6865616465722064642c202363702d6d61696e202e70616e656c206c692e686561646572206474207b0a09636f6c6f723a20233030303030303b0a096d617267696e2d626f74746f6d3a203270783b0a7d0a0a2363702d6d61696e207461626c652e7461626c6531207b0a096d617267696e2d626f74746f6d3a2031656d3b0a7d0a0a2363702d6d61696e207461626c652e7461626c6531207468656164207468207b0a09636f6c6f723a20233333333333333b0a09666f6e742d7765696768743a20626f6c643b0a09626f726465722d626f74746f6d3a2031707820736f6c696420233333333333333b0a0970616464696e673a203570783b0a7d0a0a2363702d6d61696e207461626c652e7461626c65312074626f6479207468207b0a09666f6e742d7374796c653a206974616c69633b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e742021696d706f7274616e743b0a09626f726465722d626f74746f6d3a206e6f6e653b0a7d0a0a2363702d6d61696e202e706167696e6174696f6e207b0a09666c6f61743a2072696768743b0a0977696474683a206175746f3b0a0970616464696e672d746f703a203170783b0a7d0a0a2363702d6d61696e202e706f7374626f64792070207b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a2363702d6d61696e202e706d2d6d657373616765207b0a09626f726465723a2031707820736f6c696420236532653265323b0a096d617267696e3a203130707820303b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a0977696474683a206175746f3b0a09666c6f61743a206e6f6e653b0a7d0a0a2e706d2d6d657373616765206832207b0a0970616464696e672d626f74746f6d3a203570783b0a7d0a0a2363702d6d61696e202e706f7374626f64792068332c202363702d6d61696e202e626f7832206833207b0a096d617267696e2d746f703a20303b0a7d0a0a2363702d6d61696e202e627574746f6e73207b0a096d617267696e2d6c6566743a20303b0a7d0a0a2363702d6d61696e20756c2e6c696e6b6c697374207b0a096d617267696e3a20303b0a7d0a0a2f2a204d435020537065636966696320747765616b73202a2f0a2e6d63702d6d61696e202e706f7374626f6479207b0a0977696474683a20313030253b0a7d0a0a2e746162732d636f6e7461696e6572206832207b0a09666c6f61743a206c6566743b0a096d617267696e2d626f74746f6d3a203070783b0a7d0a0a2e746162732d636f6e7461696e657220236d696e6974616273207b0a09666c6f61743a2072696768743b0a096d617267696e2d746f703a20313970783b0a7d0a0a2e746162732d636f6e7461696e65723a6166746572207b0a09646973706c61793a20626c6f636b3b0a09636c6561723a20626f74683b0a09636f6e74656e743a2027273b0a7d0a0a2f2a20435020746162626564206d656e750a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2374616273207b0a096c696e652d6865696768743a206e6f726d616c3b0a096d617267696e3a20323070782030202d317078203770783b0a096d696e2d77696474683a2035373070783b0a7d0a0a237461627320756c207b0a096d617267696e3a303b0a0970616464696e673a20303b0a096c6973742d7374796c653a206e6f6e653b0a7d0a0a2374616273206c69207b0a09646973706c61793a20696e6c696e653b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09666f6e742d73697a653a2031656d3b0a09666f6e742d7765696768743a20626f6c643b0a7d0a0a23746162732061207b0a09666c6f61743a206c6566743b0a096261636b67726f756e643a206e6f6e65206e6f2d726570656174203025202d333570783b0a096d617267696e3a203020317078203020303b0a0970616464696e673a203020302030203570783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09706f736974696f6e3a2072656c61746976653b0a09637572736f723a20706f696e7465723b0a7d0a0a23746162732061207370616e207b0a09666c6f61743a206c6566743b0a09646973706c61793a20626c6f636b3b0a096261636b67726f756e643a206e6f6e65206e6f2d7265706561742031303025202d333570783b0a0970616464696e673a20367078203130707820367078203570783b0a09636f6c6f723a20233832383238323b0a0977686974652d73706163653a206e6f777261703b0a7d0a0a237461627320613a686f766572207370616e207b0a09636f6c6f723a20236263626362633b0a7d0a0a2374616273202e6163746976657461622061207b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a09626f726465722d626f74746f6d3a2031707820736f6c696420236562656265623b0a7d0a0a2374616273202e6163746976657461622061207370616e207b0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0a0970616464696e672d626f74746f6d3a203770783b0a09636f6c6f723a20233333333333333b0a7d0a0a237461627320613a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a2030202d373070783b0a7d0a0a237461627320613a686f766572207370616e207b0a096261636b67726f756e642d706f736974696f6e3a31303025202d373070783b0a7d0a0a2374616273202e61637469766574616220613a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a7d0a0a2374616273202e61637469766574616220613a686f766572207370616e207b0a09636f6c6f723a20233030303030303b0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0a7d0a0a2f2a204d696e6920746162626564206d656e75207573656420696e204d43500a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a236d696e6974616273207b0a096c696e652d6865696768743a206e6f726d616c3b0a096d617267696e3a202d3230707820377078203020303b0a7d0a0a236d696e697461627320756c207b0a096d617267696e3a303b0a0970616464696e673a20303b0a096c6973742d7374796c653a206e6f6e653b0a7d0a0a236d696e6974616273206c69207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a0970616464696e673a203020313070782034707820313070783b0a09666f6e742d73697a653a2031656d3b0a09666f6e742d7765696768743a20626f6c643b0a096261636b67726f756e642d636f6c6f723a20236632663266323b0a096d617267696e2d6c6566743a203270783b0a7d0a0a236d696e69746162732061207b0a7d0a0a236d696e697461627320613a686f766572207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a0a236d696e6974616273206c692e616374697665746162207b0a096261636b67726f756e642d636f6c6f723a20234639463946393b0a7d0a0a236d696e6974616273206c692e61637469766574616220612c20236d696e6974616273206c692e61637469766574616220613a686f766572207b0a09636f6c6f723a20233333333333333b0a7d0a0a2f2a20554350206e617669676174696f6e206d656e750a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2f2a20436f6e7461696e657220666f72207375622d6e617669676174696f6e206c697374202a2f0a236e617669676174696f6e207b0a0977696474683a20313030253b0a0970616464696e672d746f703a20333670783b0a7d0a0a236e617669676174696f6e20756c207b0a096c6973742d7374796c653a6e6f6e653b0a7d0a0a2f2a2044656661756c74206c697374207374617465202a2f0a236e617669676174696f6e206c69207b0a096d617267696e3a2031707820303b0a0970616464696e673a20303b0a09666f6e742d7765696768743a20626f6c643b0a09646973706c61793a20696e6c696e653b0a7d0a0a2f2a204c696e6b207374796c657320666f7220746865207375622d73656374696f6e206c696e6b73202a2f0a236e617669676174696f6e2061207b0a09646973706c61793a20626c6f636b3b0a0970616464696e673a203570783b0a096d617267696e3a2031707820303b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233333333b0a096261636b67726f756e643a2023636663666366206e6f6e65207265706561742d79203130302520303b0a7d0a0a236e617669676174696f6e20613a686f766572207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096261636b67726f756e642d636f6c6f723a20236336633663363b0a09636f6c6f723a20236263626362633b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a236e617669676174696f6e20236163746976652d73756273656374696f6e2061207b0a09646973706c61793a20626c6f636b3b0a09636f6c6f723a20236433643364333b0a096261636b67726f756e642d636f6c6f723a20234639463946393b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a236e617669676174696f6e20236163746976652d73756273656374696f6e20613a686f766572207b0a09636f6c6f723a20236433643364333b0a7d0a0a2f2a20507265666572656e6365732070616e65206c61796f75740a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2363702d6d61696e206832207b0a09626f726465722d626f74746f6d3a206e6f6e653b0a0970616464696e673a20303b0a096d617267696e2d6c6566743a20313070783b0a09636f6c6f723a20233333333333333b0a7d0a0a2363702d6d61696e202e70616e656c207b0a096261636b67726f756e642d636f6c6f723a20234639463946393b0a7d0a0a2363702d6d61696e202e706d207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d746f702c202363702d6d656e75207370616e2e636f726e6572732d746f70207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75207370616e2e636f726e6572732d746f70207370616e207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207370616e207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2f2a20546f706963726576696577202a2f0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f702c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2f2a20467269656e6473206c697374202a2f0a2e63702d6d696e69207b0a096261636b67726f756e642d636f6c6f723a20236639663966393b0a0970616464696e673a2030203570783b0a096d617267696e3a203130707820313570782031307078203570783b0a7d0a0a2e63702d6d696e69207370616e2e636f726e6572732d746f702c202e63702d6d696e69207370616e2e636f726e6572732d626f74746f6d207b0a096d617267696e3a2030202d3570783b0a7d0a0a646c2e6d696e69206474207b0a09666f6e742d7765696768743a20626f6c643b0a09636f6c6f723a20233637363736373b0a7d0a0a646c2e6d696e69206464207b0a0970616464696e672d746f703a203470783b0a7d0a0a2e667269656e642d6f6e6c696e65207b0a09666f6e742d7765696768743a20626f6c643b0a7d0a0a2e667269656e642d6f66666c696e65207b0a09666f6e742d7374796c653a206974616c69633b0a7d0a0a2f2a20504d205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a23706d2d6d656e75207b0a096c696e652d6865696768743a20322e35656d3b0a7d0a0a2f2a20504d2070616e656c2061646a7573746d656e7473202a2f0a2e7265706c792d616c6c20612e6c656674207b0a096261636b67726f756e642d706f736974696f6e3a20337078203630253b0a7d0a0a2e7265706c792d616c6c20612e6c6566743a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a20307078203630253b0a7d0a0a2e7265706c792d616c6c207b0a09666f6e742d73697a653a20313170783b0a0970616464696e672d746f703a203570783b0a7d0a0a2f2a20504d204d65737361676520686973746f7279202a2f0a2e63757272656e74207b0a09636f6c6f723a20233939393939393b0a7d0a0a2f2a20446566696e65642072756c6573206c69737420666f7220504d206f7074696f6e73202a2f0a6f6c2e6465662d72756c6573207b0a0970616464696e672d6c6566743a20303b0a7d0a0a6f6c2e6465662d72756c6573206c69207b0a096c696e652d6865696768743a20313830253b0a0970616464696e673a203170783b0a7d0a0a2f2a20504d206d61726b696e6720636f6c6f757273202a2f0a2e706d6c697374206c692e626731207b0a0970616464696e673a2030203370783b0a7d0a0a2e706d6c697374206c692e626732207b0a0970616464696e673a2030203370783b0a7d0a0a2e706d6c697374206c692e706d5f6d6573736167655f7265706f727465645f636f6c6f75722c202e706d5f6d6573736167655f7265706f727465645f636f6c6f7572207b0a09626f726465722d6c6566742d636f6c6f723a20236263626362633b0a09626f726465722d72696768742d636f6c6f723a20236263626362633b0a7d0a0a2e706d6c697374206c692e706d5f6d61726b65645f636f6c6f75722c202e706d5f6d61726b65645f636f6c6f7572207b0a0970616464696e673a20303b0a09626f726465723a20736f6c69642033707820236666666666663b0a09626f726465722d77696474683a2030203370783b0a7d0a0a2e706d6c697374206c692e706d5f7265706c6965645f636f6c6f75722c202e706d5f7265706c6965645f636f6c6f7572207b0a0970616464696e673a20303b0a09626f726465723a20736f6c69642033707820236332633263323b0a09626f726465722d77696474683a2030203370783b0a7d0a0a2e706d6c697374206c692e706d5f667269656e645f636f6c6f75722c202e706d5f667269656e645f636f6c6f7572207b0a0970616464696e673a20303b0a09626f726465723a20736f6c69642033707820236264626462643b0a09626f726465722d77696474683a2030203370783b0a7d0a0a2e706d6c697374206c692e706d5f666f655f636f6c6f75722c202e706d5f666f655f636f6c6f7572207b0a0970616464696e673a20303b0a09626f726465723a20736f6c69642033707820233030303030303b0a09626f726465722d77696474683a2030203370783b0a7d0a0a2e706d2d6c6567656e64207b0a09626f726465722d6c6566742d77696474683a20313070783b0a09626f726465722d6c6566742d7374796c653a20736f6c69643b0a09626f726465722d72696768742d77696474683a20303b0a096d617267696e2d626f74746f6d3a203370783b0a0970616464696e672d6c6566743a203370783b0a7d0a0a2f2a204176617461722067616c6c657279202a2f0a2367616c6c657279206c6162656c207b0a09706f736974696f6e3a2072656c61746976653b0a09666c6f61743a206c6566743b0a096d617267696e3a20313070783b0a0970616464696e673a203570783b0a0977696474683a206175746f3b0a096261636b67726f756e643a20234646464646463b0a09626f726465723a2031707820736f6c696420234343433b0a09746578742d616c69676e3a2063656e7465723b0a7d0a0a2367616c6c657279206c6162656c3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234545453b0a7d0a2f2a20466f726d205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2f2a2047656e6572616c20666f726d207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a6669656c64736574207b0a09626f726465722d77696474683a20303b0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09666f6e742d73697a653a20312e31656d3b0a7d0a0a696e707574207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09637572736f723a20706f696e7465723b0a09766572746963616c2d616c69676e3a206d6964646c653b0a0970616464696e673a2030203370783b0a09666f6e742d73697a653a2031656d3b0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a7d0a0a73656c656374207b0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09666f6e742d7765696768743a206e6f726d616c3b0a09637572736f723a20706f696e7465723b0a09766572746963616c2d616c69676e3a206d6964646c653b0a09626f726465723a2031707820736f6c696420233636363636363b0a0970616464696e673a203170783b0a096261636b67726f756e642d636f6c6f723a20234641464146413b0a09666f6e742d73697a653a2031656d3b0a7d0a0a6f7074696f6e207b0a0970616464696e672d72696768743a2031656d3b0a7d0a0a6f7074696f6e2e64697361626c65642d6f7074696f6e207b0a09636f6c6f723a2067726179746578743b0a7d0a0a7465787461726561207b0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a0977696474683a203630253b0a0970616464696e673a203270783b0a09666f6e742d73697a653a2031656d3b0a096c696e652d6865696768743a20312e34656d3b0a7d0a0a6c6162656c207b0a09637572736f723a2064656661756c743b0a0970616464696e672d72696768743a203570783b0a09636f6c6f723a20233637363736373b0a7d0a0a6c6162656c20696e707574207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a7d0a0a6c6162656c20696d67207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a7d0a0a2f2a20446566696e6974696f6e206c697374206c61796f757420666f7220666f726d730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a6669656c6473657420646c207b0a0970616464696e673a2034707820303b0a7d0a0a6669656c64736574206474207b0a09666c6f61743a206c6566743b090a0977696474683a203430253b0a09746578742d616c69676e3a206c6566743b0a09646973706c61793a20626c6f636b3b0a7d0a0a6669656c64736574206464207b0a096d617267696e2d6c6566743a203431253b0a09766572746963616c2d616c69676e3a20746f703b0a096d617267696e2d626f74746f6d3a203370783b0a7d0a0a2f2a205370656369666963206c61796f75742031202a2f0a6669656c647365742e6669656c647331206474207b0a0977696474683a203135656d3b0a09626f726465722d72696768742d77696474683a20303b0a7d0a0a6669656c647365742e6669656c647331206464207b0a096d617267696e2d6c6566743a203135656d3b0a09626f726465722d6c6566742d77696474683a20303b0a7d0a0a6669656c647365742e6669656c647331207b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0a7d0a0a6669656c647365742e6669656c64733120646976207b0a096d617267696e2d626f74746f6d3a203370783b0a7d0a0a2f2a20536574206974206261636b20746f2030707820666f72207468652072654361707463686120646976733a205048504242332d39353837202a2f0a6669656c647365742e6669656c64733120237265636170746368615f7769646765745f64697620646976207b0a096d617267696e2d626f74746f6d3a20303b0a7d0a0a2f2a205370656369666963206c61796f75742032202a2f0a6669656c647365742e6669656c647332206474207b0a0977696474683a203135656d3b0a09626f726465722d72696768742d77696474683a20303b0a7d0a0a6669656c647365742e6669656c647332206464207b0a096d617267696e2d6c6566743a203136656d3b0a09626f726465722d6c6566742d77696474683a20303b0a7d0a0a2f2a20466f726d20656c656d656e7473202a2f0a6474206c6162656c207b0a09666f6e742d7765696768743a20626f6c643b0a09746578742d616c69676e3a206c6566743b0a7d0a0a6464206c6162656c207b0a0977686974652d73706163653a206e6f777261703b0a09636f6c6f723a20233333333b0a7d0a0a646420696e7075742c206464207465787461726561207b0a096d617267696e2d72696768743a203370783b0a7d0a0a64642073656c656374207b0a0977696474683a206175746f3b0a7d0a0a6464207465787461726561207b0a0977696474683a203835253b0a7d0a0a2f2a20486f7665722065666665637473202a2f0a6669656c6473657420646c3a686f766572206474206c6162656c207b0a09636f6c6f723a20233030303030303b0a7d0a0a6669656c647365742e6669656c64733220646c3a686f766572206474206c6162656c207b0a09636f6c6f723a20696e68657269743b0a7d0a0a2374696d657a6f6e65207b0a0977696474683a203935253b0a7d0a0a2a2068746d6c202374696d657a6f6e65207b0a0977696474683a203530253b0a7d0a0a2f2a20517569636b2d6c6f67696e206f6e20696e6465782070616765202a2f0a6669656c647365742e717569636b2d6c6f67696e207b0a096d617267696e2d746f703a203570783b0a7d0a0a6669656c647365742e717569636b2d6c6f67696e20696e707574207b0a0977696474683a206175746f3b0a7d0a0a6669656c647365742e717569636b2d6c6f67696e20696e7075742e696e707574626f78207b0a0977696474683a203135253b0a09766572746963616c2d616c69676e3a206d6964646c653b0a096d617267696e2d72696768743a203570783b0a096261636b67726f756e642d636f6c6f723a20236633663366333b0a7d0a0a6669656c647365742e717569636b2d6c6f67696e206c6162656c207b0a0977686974652d73706163653a206e6f777261703b0a0970616464696e672d72696768743a203270783b0a7d0a0a2f2a20446973706c6179206f7074696f6e73206f6e2076696577746f7069632f76696577666f72756d20706167657320202a2f0a6669656c647365742e646973706c61792d6f7074696f6e73207b0a09746578742d616c69676e3a2063656e7465723b0a096d617267696e3a2033707820302035707820303b0a7d0a0a6669656c647365742e646973706c61792d6f7074696f6e73206c6162656c207b0a0977686974652d73706163653a206e6f777261703b0a0970616464696e672d72696768743a203270783b0a7d0a0a6669656c647365742e646973706c61792d6f7074696f6e732061207b0a096d617267696e2d746f703a203370783b0a7d0a0a2f2a20446973706c617920616374696f6e7320666f722075637020616e64206d6370207061676573202a2f0a6669656c647365742e646973706c61792d616374696f6e73207b0a09746578742d616c69676e3a2072696768743b0a096c696e652d6865696768743a2032656d3b0a0977686974652d73706163653a206e6f777261703b0a0970616464696e672d72696768743a2031656d3b0a7d0a0a6669656c647365742e646973706c61792d616374696f6e73206c6162656c207b0a0977686974652d73706163653a206e6f777261703b0a0970616464696e672d72696768743a203270783b0a7d0a0a6669656c647365742e736f72742d6f7074696f6e73207b0a096c696e652d6865696768743a2032656d3b0a7d0a0a2f2a204d435020666f72756d2073656c656374696f6e2a2f0a6669656c647365742e666f72756d2d73656c656374696f6e207b0a096d617267696e3a2035707820302033707820303b0a09666c6f61743a2072696768743b0a7d0a0a6669656c647365742e666f72756d2d73656c656374696f6e32207b0a096d617267696e3a203133707820302033707820303b0a09666c6f61743a2072696768743b0a7d0a0a2f2a204a756d70626f78202a2f0a6669656c647365742e6a756d70626f78207b0a09746578742d616c69676e3a2072696768743b0a096d617267696e2d746f703a20313570783b0a096865696768743a20322e35656d3b0a7d0a0a6669656c647365742e717569636b6d6f64207b0a0977696474683a203530253b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a096865696768743a20322e35656d3b0a7d0a0a2f2a205375626d697420627574746f6e206669656c64736574202a2f0a6669656c647365742e7375626d69742d627574746f6e73207b0a09746578742d616c69676e3a2063656e7465723b0a09766572746963616c2d616c69676e3a206d6964646c653b0a096d617267696e3a2035707820303b0a7d0a0a6669656c647365742e7375626d69742d627574746f6e7320696e707574207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a0970616464696e672d746f703a203370783b0a0970616464696e672d626f74746f6d3a203370783b0a7d0a0a2f2a20506f7374696e672070616765207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a2f2a20427574746f6e73207573656420696e2074686520656469746f72202a2f0a23666f726d61742d627574746f6e73207b0a096d617267696e3a203135707820302032707820303b0a7d0a0a23666f726d61742d627574746f6e7320696e7075742c2023666f726d61742d627574746f6e732073656c656374207b0a09766572746963616c2d616c69676e3a206d6964646c653b0a7d0a0a2f2a204d61696e206d65737361676520626f78202a2f0a236d6573736167652d626f78207b0a0977696474683a203830253b0a7d0a0a236d6573736167652d626f78207465787461726561207b0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a0977696474683a2034353070783b0a096865696768743a2032373070783b0a096d696e2d77696474683a20313030253b0a096d61782d77696474683a20313030253b0a09666f6e742d73697a653a20312e32656d3b0a09636f6c6f723a20233333333333333b0a7d0a0a2f2a20456d6f7469636f6e732070616e656c202a2f0a23736d696c65792d626f78207b0a0977696474683a203138253b0a09666c6f61743a2072696768743b0a7d0a0a23736d696c65792d626f7820696d67207b0a096d617267696e3a203370783b0a7d0a0a2f2a20496e707574206669656c64207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e696e707574626f78207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a09626f726465723a2031707820736f6c696420236330633063303b0a09636f6c6f723a20233333333333333b0a0970616464696e673a203270783b0a09637572736f723a20746578743b0a7d0a0a2e696e707574626f783a686f766572207b0a09626f726465723a2031707820736f6c696420236561656165613b0a7d0a0a2e696e707574626f783a666f637573207b0a09626f726465723a2031707820736f6c696420236561656165613b0a09636f6c6f723a20233462346234623b0a7d0a0a696e7075742e696e707574626f78097b2077696474683a203835253b207d0a696e7075742e6d656469756d097b2077696474683a203530253b207d0a696e7075742e6e6172726f77097b2077696474683a203235253b207d0a696e7075742e74696e7909097b2077696474683a2031323570783b207d0a0a74657874617265612e696e707574626f78207b0a0977696474683a203835253b0a7d0a0a2e6175746f7769647468207b0a0977696474683a206175746f2021696d706f7274616e743b0a7d0a0a2f2a20466f726d20627574746f6e207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a696e7075742e627574746f6e312c20696e7075742e627574746f6e32207b0a09666f6e742d73697a653a2031656d3b0a7d0a0a612e627574746f6e312c20696e7075742e627574746f6e312c20696e7075742e627574746f6e332c20612e627574746f6e322c20696e7075742e627574746f6e32207b0a0977696474683a206175746f2021696d706f7274616e743b0a0970616464696e672d746f703a203170783b0a0970616464696e672d626f74746f6d3a203170783b0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0a09636f6c6f723a20233030303b0a096261636b67726f756e643a2023464146414641206e6f6e65207265706561742d7820746f70206c6566743b0a7d0a0a612e627574746f6e312c20696e7075742e627574746f6e31207b0a09666f6e742d7765696768743a20626f6c643b0a09626f726465723a2031707820736f6c696420233636363636363b0a7d0a0a696e7075742e627574746f6e33207b0a0970616464696e673a20303b0a096d617267696e3a20303b0a096c696e652d6865696768743a203570783b0a096865696768743a20313270783b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a09666f6e742d76617269616e743a20736d616c6c2d636170733b0a7d0a0a2f2a20416c7465726e617469766520627574746f6e202a2f0a612e627574746f6e322c20696e7075742e627574746f6e322c20696e7075742e627574746f6e33207b0a09626f726465723a2031707820736f6c696420233636363636363b0a7d0a0a2f2a203c613e20627574746f6e20696e20746865207374796c65206f662074686520666f726d20627574746f6e73202a2f0a612e627574746f6e312c20612e627574746f6e313a6c696e6b2c20612e627574746f6e313a766973697465642c20612e627574746f6e313a6163746976652c20612e627574746f6e322c20612e627574746f6e323a6c696e6b2c20612e627574746f6e323a766973697465642c20612e627574746f6e323a616374697665207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09636f6c6f723a20233030303030303b0a0970616464696e673a20327078203870783b0a096c696e652d6865696768743a20323530253b0a09766572746963616c2d616c69676e3a20746578742d626f74746f6d3b0a096261636b67726f756e642d706f736974696f6e3a2030203170783b0a7d0a0a2f2a20486f76657220737461746573202a2f0a612e627574746f6e313a686f7665722c20696e7075742e627574746f6e313a686f7665722c20612e627574746f6e323a686f7665722c20696e7075742e627574746f6e323a686f7665722c20696e7075742e627574746f6e333a686f766572207b0a09626f726465723a2031707820736f6c696420234243424342433b0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0a09636f6c6f723a20234243424342433b0a7d0a0a696e7075742e64697361626c6564207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20233636363636363b0a7d0a0a2f2a20546f70696320616e6420666f72756d20536561726368202a2f0a2e7365617263682d626f78207b0a096d617267696e2d746f703a203370783b0a096d617267696e2d6c6566743a203570783b0a09666c6f61743a206c6566743b0a7d0a0a2e7365617263682d626f7820696e707574207b0a7d0a0a696e7075742e736561726368207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a096261636b67726f756e642d706f736974696f6e3a206c656674203170783b0a0970616464696e672d6c6566743a20313770783b0a7d0a0a2e66756c6c207b2077696474683a203935253b207d0a2e6d656469756d207b2077696474683a203530253b7d0a2e6e6172726f77207b2077696474683a203235253b7d0a2e74696e79207b2077696474683a203130253b7d0a2f2a205374796c6520536865657420547765616b730a0a5468657365207374796c6520646566696e6974696f6e7320617265206d61696e6c79204945207370656369666963200a747765616b732072657175697265642064756520746f2069747320706f6f722043535320737570706f72742e0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a2a2068746d6c207461626c652c202a2068746d6c2073656c6563742c202a2068746d6c20696e707574207b20666f6e742d73697a653a20313030253b207d0a2a2068746d6c206872207b206d617267696e3a20303b207d0a2a2068746d6c207370616e2e636f726e6572732d746f702c202a2068746d6c207370616e2e636f726e6572732d626f74746f6d207b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e67696622293b207d0a2a2068746d6c207370616e2e636f726e6572732d746f70207370616e2c202a2068746d6c207370616e2e636f726e6572732d626f74746f6d207370616e207b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e67696622293b207d0a0a7461626c652e7461626c6531207b0a0977696474683a203939253b09092f2a204945203c20362062726f7773657273202a2f0a092f2a2054616e74656b206861636b202a2f0a09766f6963652d66616d696c793a20225c227d5c22223b0a09766f6963652d66616d696c793a20696e68657269743b0a0977696474683a20313030253b0a7d0a68746d6c3e626f6479207461626c652e7461626c6531207b2077696474683a20313030253b207d092f2a205265736574203130302520666f72206f70657261202a2f0a0a2a2068746d6c20756c2e746f7069636c697374206c69207b20706f736974696f6e3a2072656c61746976653b207d0a2a2068746d6c202e706f7374626f647920683320696d67207b20766572746963616c2d616c69676e3a206d6964646c653b207d0a0a2f2a20466f726d207374796c6573202a2f0a68746d6c3e626f6479206464206c6162656c20696e707574207b20766572746963616c2d616c69676e3a20746578742d626f74746f6d3b207d092f2a20416c69676e20636865636b626f7865732f726164696f20627574746f6e73206e6963656c79202a2f0a0a2a2068746d6c20696e7075742e627574746f6e312c202a2068746d6c20696e7075742e627574746f6e32207b0a0970616464696e672d626f74746f6d3a20303b0a096d617267696e2d626f74746f6d3a203170783b0a7d0a0a2f2a204d697363206c61796f7574207374796c6573202a2f0a2a2068746d6c202e636f6c756d6e312c202a2068746d6c202e636f6c756d6e32207b2077696474683a203435253b207d0a0a2f2a204e696365206d6574686f6420666f7220636c656172696e6720666c6f6174656420626c6f636b7320776974686f757420686176696e6720746f20696e7365727420616e79206578747261206d61726b757020286c696b65207370616365722061626f7665290a20202046726f6d20687474703a2f2f7777772e706f736974696f6e697365766572797468696e672e6e65742f65617379636c656172696e672e68746d6c200a23746162733a61667465722c20236d696e69746162733a61667465722c202e706f73743a61667465722c202e6e61766261723a61667465722c206669656c6473657420646c3a61667465722c20756c2e746f7069636c69737420646c3a61667465722c20756c2e6c696e6b6c6973743a61667465722c20646c2e706f6c6c733a6166746572207b0a09636f6e74656e743a20222e223b200a09646973706c61793a20626c6f636b3b200a096865696768743a20303b200a09636c6561723a20626f74683b200a097669736962696c6974793a2068696464656e3b0a7d2a2f0a0a2e636c6561726669782c2023746162732c20236d696e69746162732c206669656c6473657420646c2c20756c2e746f7069636c69737420646c2c20646c2e706f6c6c73207b0a096865696768743a2031253b0a096f766572666c6f773a2068696464656e3b0a7d0a0a2f2a2076696577746f70696320666978202a2f0a2a2068746d6c202e706f7374207b0a096865696768743a203235253b0a096f766572666c6f773a2068696464656e3b0a7d0a0a2f2a206e617662617220666978202a2f0a2a2068746d6c202e636c6561726669782c202a2068746d6c202e6e61766261722c20756c2e6c696e6b6c697374207b0a096865696768743a2034253b0a096f766572666c6f773a2068696464656e3b0a7d0a0a2f2a2053696d706c652066697820736f20666f72756d20616e6420746f706963206c6973747320616c7761797320686176652061206d696e2d686569676874207365742c206576656e20696e204945360a0946726f6d20687474703a2f2f7777772e64757374696e6469617a2e636f6d2f6d696e2d6865696768742d666173742d6861636b202a2f0a646c2e69636f6e207b0a096d696e2d6865696768743a20333570783b0a096865696768743a206175746f2021696d706f7274616e743b0a096865696768743a20333570783b0a7d0a0a2a2068746d6c206c692e726f7720646c2e69636f6e206474207b0a096865696768743a20333570783b0a096f766572666c6f773a2076697369626c653b0a7d0a0a2a2068746d6c20237365617263682d626f78207b0a0977696474683a203235253b0a7d0a0a2f2a20436f72726563746c7920636c65617220666c6f6174696e6720666f722064657461696c73206f6e2070726f66696c652076696577202a2f0a2a3a66697273742d6368696c642b68746d6c20646c2e64657461696c73206464207b0a096d617267696e2d6c6566743a203330253b0a09666c6f61743a206e6f6e653b0a7d0a0a2a2068746d6c20646c2e64657461696c73206464207b0a096d617267696e2d6c6566743a203330253b0a09666c6f61743a206e6f6e653b0a7d0a0a2f2a20486561646572626172206865696768742066697820666f722049453720616e642062656c6f77202a2f0a2a2068746d6c2023736974652d6465736372697074696f6e2070207b0a096d617267696e2d626f74746f6d3a20312e30656d3b0a7d0a0a2a3a66697273742d6368696c642b68746d6c2023736974652d6465736372697074696f6e2070207b0a096d617267696e2d626f74746f6d3a20312e30656d3b0a7d0a0a2f2a20236d696e69746162732066697820666f72204945202a2f0a2e746162732d636f6e7461696e6572207b0a097a6f6f6d3a20313b0a7d0a0a236d696e6974616273207b0a0977686974652d73706163653a206e6f777261703b0a092a6d696e2d77696474683a203530253b0a7d0a2f2a2020090a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220636f6d6d6f6e2e6373730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a68746d6c2c20626f6479207b0a09636f6c6f723a20233533363438323b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a6831207b0a09636f6c6f723a20234646464646463b0a7d0a0a6832207b0a09636f6c6f723a20233238333133463b0a7d0a0a6833207b0a09626f726465722d626f74746f6d2d636f6c6f723a20234343434343433b0a09636f6c6f723a20233131353039383b0a7d0a0a6872207b0a09626f726465722d636f6c6f723a20234646464646463b0a09626f726465722d746f702d636f6c6f723a20234343434343433b0a7d0a0a68722e646173686564207b0a09626f726465722d746f702d636f6c6f723a20234343434343433b0a7d0a0a2f2a2053656172636820626f780a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a237365617263682d626f78207b0a09636f6c6f723a20234646464646463b0a7d0a0a237365617263682d626f7820236b6579776f726473207b0a096261636b67726f756e642d636f6c6f723a20234646463b0a7d0a0a237365617263682d626f7820696e707574207b0a09626f726465722d636f6c6f723a20233030373542303b0a7d0a0a2f2a20526f756e6420636f726e6572656420626f78657320616e64206261636b67726f756e64730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e686561646572626172207b0a096261636b67726f756e642d636f6c6f723a20233132413345423b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6865616465722e67696622293b0a09636f6c6f723a20234646464646463b0a7d0a0a2e6e6176626172207b0a096261636b67726f756e642d636f6c6f723a20236361646365623b0a7d0a0a2e666f72616267207b0a096261636b67726f756e642d636f6c6f723a20233030373662313b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6c6973742e67696622293b0a7d0a0a2e666f72756d6267207b0a096261636b67726f756e642d636f6c6f723a20233132413345423b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6865616465722e67696622293b0a7d0a0a2e70616e656c207b0a096261636b67726f756e642d636f6c6f723a20234543463146333b0a09636f6c6f723a20233238333133463b0a7d0a0a2e706f73743a746172676574202e636f6e74656e74207b0a09636f6c6f723a20233030303030303b0a7d0a0a2e706f73743a7461726765742068332061207b0a09636f6c6f723a20233030303030303b0a7d0a0a2e626731097b206261636b67726f756e642d636f6c6f723a20234543463346373b207d0a2e626732097b206261636b67726f756e642d636f6c6f723a20236531656266323b20207d0a2e626733097b206261636b67726f756e642d636f6c6f723a20236361646365623b207d0a0a2e756370726f776267207b0a096261636b67726f756e642d636f6c6f723a20234443444545323b0a7d0a0a2e6669656c64736267207b0a096261636b67726f756e642d636f6c6f723a20234537453845413b0a7d0a0a7370616e2e636f726e6572732d746f70207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e706e6722293b0a7d0a0a7370616e2e636f726e6572732d746f70207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e706e6722293b0a7d0a0a7370616e2e636f726e6572732d626f74746f6d207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e706e6722293b0a7d0a0a7370616e2e636f726e6572732d626f74746f6d207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e706e6722293b0a7d0a0a2f2a20486f72697a6f6e74616c206c697374730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a756c2e6e61766c696e6b73207b0a09626f726465722d626f74746f6d2d636f6c6f723a20234646464646463b0a7d0a0a2f2a205461626c65207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a7461626c652e7461626c6531207468656164207468207b0a09636f6c6f723a20234646464646463b0a7d0a0a7461626c652e7461626c65312074626f6479207472207b0a09626f726465722d636f6c6f723a20234246433143463b0a7d0a0a7461626c652e7461626c65312074626f64792074723a686f7665722c207461626c652e7461626c65312074626f64792074722e686f766572207b0a096261636b67726f756e642d636f6c6f723a20234346453146363b0a09636f6c6f723a20233030303b0a7d0a0a7461626c652e7461626c6531207464207b0a09636f6c6f723a20233533363438323b0a7d0a0a7461626c652e7461626c65312074626f6479207464207b0a09626f726465722d746f702d636f6c6f723a20234641464146413b0a7d0a0a7461626c652e7461626c65312074626f6479207468207b0a09626f726465722d626f74746f6d2d636f6c6f723a20233030303030303b0a09636f6c6f723a20233333333333333b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a7461626c652e696e666f2074626f6479207468207b0a09636f6c6f723a20233030303030303b0a7d0a0a2f2a204d697363206c61796f7574207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a646c2e64657461696c73206474207b0a09636f6c6f723a20233030303030303b0a7d0a0a646c2e64657461696c73206464207b0a09636f6c6f723a20233533363438323b0a7d0a0a2e736570207b0a09636f6c6f723a20233131393844393b0a7d0a0a2f2a20506167696e6174696f6e0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2e706167696e6174696f6e207370616e207374726f6e67207b0a09636f6c6f723a20234646464646463b0a096261636b67726f756e642d636f6c6f723a20233436393242463b0a09626f726465722d636f6c6f723a20233436393242463b0a7d0a0a2e706167696e6174696f6e207370616e20612c202e706167696e6174696f6e207370616e20613a6c696e6b2c202e706167696e6174696f6e207370616e20613a76697369746564207b0a09636f6c6f723a20233543373538433b0a096261636b67726f756e642d636f6c6f723a20234543454445453b0a09626f726465722d636f6c6f723a20234234424143303b0a7d0a0a2e706167696e6174696f6e207370616e20613a686f766572207b0a09626f726465722d636f6c6f723a20233336384144323b0a096261636b67726f756e642d636f6c6f723a20233336384144323b0a09636f6c6f723a20234646463b0a7d0a0a2e706167696e6174696f6e207370616e20613a616374697665207b0a09636f6c6f723a20233543373538433b0a096261636b67726f756e642d636f6c6f723a20234543454445453b0a09626f726465722d636f6c6f723a20234234424143303b0a7d0a0a2f2a20506167696e6174696f6e20696e2076696577666f72756d20666f72206d756c74697061676520746f70696373202a2f0a2e726f77202e706167696e6174696f6e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f70616765732e67696622293b0a7d0a0a2e726f77202e706167696e6174696f6e207370616e20612c206c692e706167696e6174696f6e207370616e2061207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a2e726f77202e706167696e6174696f6e207370616e20613a686f7665722c206c692e706167696e6174696f6e207370616e20613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20233336384144323b0a7d0a0a2f2a204d697363656c6c616e656f7573207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2e636f70797269676874207b0a09636f6c6f723a20233535353535353b0a7d0a0a2e6572726f72207b0a09636f6c6f723a20234243324134443b0a7d0a0a2e7265706f72746564207b0a096261636b67726f756e642d636f6c6f723a20234637454345463b0a7d0a0a6c692e7265706f727465643a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234543443544382021696d706f7274616e743b0a7d0a2e737469636b792c202e616e6e6f756e6365207b0a092f2a20796f752063616e206164642061206261636b67726f756e6420666f7220737469636b69657320616e6420616e6e6f756e63656d656e74732a2f0a7d0a0a6469762e72756c6573207b0a096261636b67726f756e642d636f6c6f723a20234543443544383b0a09636f6c6f723a20234243324134443b0a7d0a0a702e72756c6573207b0a096261636b67726f756e642d636f6c6f723a20234543443544383b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2f2a2020090a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a436f6c6f75727320616e64206261636b67726f756e647320666f72206c696e6b732e6373730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a613a6c696e6b097b20636f6c6f723a20233130353238393b207d0a613a76697369746564097b20636f6c6f723a20233130353238393b207d0a613a686f766572097b20636f6c6f723a20234433313134313b207d0a613a616374697665097b20636f6c6f723a20233336384144323b207d0a0a2f2a204c696e6b73206f6e206772616469656e74206261636b67726f756e6473202a2f0a237365617263682d626f7820613a6c696e6b2c202e6e6176626720613a6c696e6b2c202e666f72756d6267202e68656164657220613a6c696e6b2c202e666f72616267202e68656164657220613a6c696e6b2c20746820613a6c696e6b207b0a09636f6c6f723a20234646464646463b0a7d0a0a237365617263682d626f7820613a766973697465642c202e6e6176626720613a766973697465642c202e666f72756d6267202e68656164657220613a766973697465642c202e666f72616267202e68656164657220613a766973697465642c20746820613a76697369746564207b0a09636f6c6f723a20234646464646463b0a7d0a0a237365617263682d626f7820613a686f7665722c202e6e6176626720613a686f7665722c202e666f72756d6267202e68656164657220613a686f7665722c202e666f72616267202e68656164657220613a686f7665722c20746820613a686f766572207b0a09636f6c6f723a20234138443846463b0a7d0a0a237365617263682d626f7820613a6163746976652c202e6e6176626720613a6163746976652c202e666f72756d6267202e68656164657220613a6163746976652c202e666f72616267202e68656164657220613a6163746976652c20746820613a616374697665207b0a09636f6c6f723a20234338453646463b0a7d0a0a2f2a204c696e6b7320666f7220666f72756d2f746f706963206c69737473202a2f0a612e666f72756d7469746c65207b0a09636f6c6f723a20233130353238393b0a7d0a0a2f2a20612e666f72756d7469746c653a76697369746564207b20636f6c6f723a20233130353238393b207d202a2f0a0a612e666f72756d7469746c653a686f766572207b0a09636f6c6f723a20234243324134443b0a7d0a0a612e666f72756d7469746c653a616374697665207b0a09636f6c6f723a20233130353238393b0a7d0a0a612e746f7069637469746c65207b0a09636f6c6f723a20233130353238393b0a7d0a0a2f2a20612e746f7069637469746c653a76697369746564207b20636f6c6f723a20233336384144323b207d202a2f0a0a612e746f7069637469746c653a686f766572207b0a09636f6c6f723a20234243324134443b0a7d0a0a612e746f7069637469746c653a616374697665207b0a09636f6c6f723a20233130353238393b0a7d0a0a2f2a20506f737420626f6479206c696e6b73202a2f0a2e706f73746c696e6b207b0a09636f6c6f723a20233336384144323b0a09626f726465722d626f74746f6d2d636f6c6f723a20233336384144323b0a7d0a0a2e706f73746c696e6b3a76697369746564207b0a09636f6c6f723a20233544384642443b0a09626f726465722d626f74746f6d2d636f6c6f723a20233544384642443b0a7d0a0a2e706f73746c696e6b3a616374697665207b0a09636f6c6f723a20233336384144323b0a7d0a0a2e706f73746c696e6b3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234430453446363b0a09636f6c6f723a20233044343437333b0a7d0a0a2e7369676e617475726520612c202e7369676e617475726520613a766973697465642c202e7369676e617475726520613a686f7665722c202e7369676e617475726520613a616374697665207b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0a7d0a0a2f2a2050726f66696c65206c696e6b73202a2f0a2e706f737470726f66696c6520613a6c696e6b2c202e706f737470726f66696c6520613a766973697465642c202e706f737470726f66696c652064742e617574686f722061207b0a09636f6c6f723a20233130353238393b0a7d0a0a2e706f737470726f66696c6520613a686f7665722c202e706f737470726f66696c652064742e617574686f7220613a686f766572207b0a09636f6c6f723a20234433313134313b0a7d0a0a2e706f737470726f66696c6520613a616374697665207b0a09636f6c6f723a20233130353238393b0a7d0a0a2f2a2050726f66696c6520736561726368726573756c7473202a2f090a2e736561726368202e706f737470726f66696c652061207b0a09636f6c6f723a20233130353238393b0a7d0a0a2e736561726368202e706f737470726f66696c6520613a686f766572207b0a09636f6c6f723a20234433313134313b0a7d0a0a2f2a204261636b20746f20746f70206f662070616765202a2f0a612e746f70207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f4241434b5f544f505f5352437d22293b0a7d0a0a612e746f7032207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f4241434b5f544f505f5352437d22293b0a7d0a0a2f2a204172726f77206c696e6b7320202a2f0a612e757009097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f75702e6769662229207d0a612e646f776e09097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f646f776e2e6769662229207d0a612e6c65667409097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f6c6566742e6769662229207d0a612e726967687409097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f72696768742e6769662229207d0a0a612e75703a686f766572207b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0a7d0a0a612e6c6566743a686f766572207b0a09636f6c6f723a20233336384144323b0a7d0a0a612e72696768743a686f766572207b0a09636f6c6f723a20233336384144323b0a7d0a0a0a2f2a2020090a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220636f6e74656e742e6373730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a756c2e666f72756d73207b0a096261636b67726f756e642d636f6c6f723a20236565663566393b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6772616469656e742e67696622293b0a7d0a0a756c2e746f7069636c697374206c69207b0a09636f6c6f723a20233443354437373b0a7d0a0a756c2e746f7069636c697374206464207b0a09626f726465722d6c6566742d636f6c6f723a20234646464646463b0a7d0a0a2e72746c20756c2e746f7069636c697374206464207b0a09626f726465722d72696768742d636f6c6f723a20236666663b0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0a7d0a0a756c2e746f7069636c697374206c692e726f7720647420612e737562666f72756d2e72656164207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f535542464f52554d5f524541445f5352437d22293b0a7d0a0a756c2e746f7069636c697374206c692e726f7720647420612e737562666f72756d2e756e72656164207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f535542464f52554d5f554e524541445f5352437d22293b0a7d0a0a6c692e726f77207b0a09626f726465722d746f702d636f6c6f723a2020234646464646463b0a09626f726465722d626f74746f6d2d636f6c6f723a20233030363038463b0a7d0a0a6c692e726f77207374726f6e67207b0a09636f6c6f723a20233030303030303b0a7d0a0a6c692e726f773a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234636463444303b0a7d0a0a6c692e726f773a686f766572206464207b0a09626f726465722d6c6566742d636f6c6f723a20234343434343433b0a7d0a0a2e72746c206c692e726f773a686f766572206464207b0a09626f726465722d72696768742d636f6c6f723a20234343434343433b0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0a7d0a0a6c692e6865616465722064742c206c692e686561646572206464207b0a09636f6c6f723a20234646464646463b0a7d0a0a2f2a20466f72756d206c69737420636f6c756d6e207374796c6573202a2f0a756c2e746f7069636c6973742064642e7365617263686578747261207b0a09636f6c6f723a20233333333333333b0a7d0a0a2f2a20506f737420626f6479207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e706f7374626f6479207b0a09636f6c6f723a20233333333333333b0a7d0a0a2f2a20436f6e74656e7420636f6e7461696e6572207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e636f6e74656e74207b0a09636f6c6f723a20233333333333333b0a7d0a0a2e636f6e74656e742068322c202e70616e656c206832207b0a09636f6c6f723a20233131353039383b0a09626f726465722d626f74746f6d2d636f6c6f723a2020234343434343433b0a7d0a0a646c2e666171206474207b0a09636f6c6f723a20233333333333333b0a7d0a0a2e706f737468696c6974207b0a096261636b67726f756e642d636f6c6f723a20234633424643433b0a09636f6c6f723a20234243324134443b0a7d0a0a2f2a20506f7374207369676e6174757265202a2f0a2e7369676e6174757265207b0a09626f726465722d746f702d636f6c6f723a20234343434343433b0a7d0a0a2f2a20506f7374206e6f746963696573202a2f0a2e6e6f74696365207b0a09626f726465722d746f702d636f6c6f723a2020234343434343433b0a7d0a0a2f2a20424220436f6465207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2f2a2051756f746520626c6f636b202a2f0a626c6f636b71756f7465207b0a096261636b67726f756e642d636f6c6f723a20234542454144443b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f71756f74652e67696622293b0a09626f726465722d636f6c6f723a234442444243453b0a7d0a0a2e72746c20626c6f636b71756f7465207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f71756f74655f72746c2e67696622293b0a7d0a0a626c6f636b71756f746520626c6f636b71756f7465207b0a092f2a204e65737465642071756f746573202a2f0a096261636b67726f756e642d636f6c6f723a234546454544393b0a7d0a0a626c6f636b71756f746520626c6f636b71756f746520626c6f636b71756f7465207b0a092f2a204e65737465642071756f746573202a2f0a096261636b67726f756e642d636f6c6f723a20234542454144443b0a7d0a0a2f2a20436f646520626c6f636b202a2f0a646c2e636f6465626f78207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a09626f726465722d636f6c6f723a20234339443244383b0a7d0a0a646c2e636f6465626f78206474207b0a09626f726465722d626f74746f6d2d636f6c6f723a2020234343434343433b0a7d0a0a646c2e636f6465626f7820636f6465207b0a09636f6c6f723a20233245384235373b0a7d0a0a2e73796e746178626709097b20636f6c6f723a20234646464646463b207d0a2e73796e746178636f6d6d656e74097b20636f6c6f723a20234646383030303b207d0a2e73796e74617864656661756c74097b20636f6c6f723a20233030303042423b207d0a2e73796e74617868746d6c09097b20636f6c6f723a20233030303030303b207d0a2e73796e7461786b6579776f7264097b20636f6c6f723a20233030373730303b207d0a2e73796e746178737472696e67097b20636f6c6f723a20234444303030303b207d0a0a2f2a204174746163686d656e74730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e617474616368626f78207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a09626f726465722d636f6c6f723a2020234339443244383b0a7d0a0a2e706d2d6d657373616765202e617474616368626f78207b0a096261636b67726f756e642d636f6c6f723a20234632463346333b0a7d0a0a2e617474616368626f78206464207b0a09626f726465722d746f702d636f6c6f723a20234339443244383b0a7d0a0a2e617474616368626f782070207b0a09636f6c6f723a20233636363636363b0a7d0a0a2e617474616368626f7820702e7374617473207b0a09636f6c6f723a20233636363636363b0a7d0a0a2e6174746163682d696d61676520696d67207b0a09626f726465722d636f6c6f723a20233939393939393b0a7d0a0a2f2a20496e6c696e6520696d616765207468756d626e61696c73202a2f0a0a646c2e66696c65206464207b0a09636f6c6f723a20233636363636363b0a7d0a0a646c2e7468756d626e61696c20696d67207b0a09626f726465722d636f6c6f723a20233636363636363b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a646c2e7468756d626e61696c206464207b0a09636f6c6f723a20233636363636363b0a7d0a0a646c2e7468756d626e61696c20647420613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234545454545453b0a7d0a0a646c2e7468756d626e61696c20647420613a686f76657220696d67207b0a09626f726465722d636f6c6f723a20233336384144323b0a7d0a0a2f2a20506f737420706f6c6c207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a6669656c647365742e706f6c6c7320646c207b0a09626f726465722d746f702d636f6c6f723a20234443444545323b0a09636f6c6f723a20233636363636363b0a7d0a0a6669656c647365742e706f6c6c7320646c2e766f746564207b0a09636f6c6f723a20233030303030303b0a7d0a0a6669656c647365742e706f6c6c7320646420646976207b0a09636f6c6f723a20234646464646463b0a7d0a0a2e72746c202e706f6c6c626172312c202e72746c202e706f6c6c626172322c202e72746c202e706f6c6c626172332c202e72746c202e706f6c6c626172342c202e72746c202e706f6c6c62617235207b0a09626f726465722d72696768742d636f6c6f723a207472616e73706172656e743b0a7d0a0a2e706f6c6c62617231207b0a096261636b67726f756e642d636f6c6f723a20234141323334363b0a09626f726465722d626f74746f6d2d636f6c6f723a20233734313632433b0a09626f726465722d72696768742d636f6c6f723a20233734313632433b0a7d0a0a2e72746c202e706f6c6c62617231207b0a09626f726465722d6c6566742d636f6c6f723a20233734313632433b0a7d0a0a2e706f6c6c62617232207b0a096261636b67726f756e642d636f6c6f723a20234245314534413b0a09626f726465722d626f74746f6d2d636f6c6f723a20233843314333383b0a09626f726465722d72696768742d636f6c6f723a20233843314333383b0a7d0a0a2e72746c202e706f6c6c62617232207b0a09626f726465722d6c6566742d636f6c6f723a20233843314333383b0a7d0a0a2e706f6c6c62617233207b0a096261636b67726f756e642d636f6c6f723a20234431314134453b0a09626f726465722d626f74746f6d2d636f6c6f723a20234141323334363b0a09626f726465722d72696768742d636f6c6f723a20234141323334363b0a7d0a0a2e72746c202e706f6c6c62617233207b0a09626f726465722d6c6566742d636f6c6f723a20234141323334363b0a7d0a0a2e706f6c6c62617234207b0a096261636b67726f756e642d636f6c6f723a20234534313635333b0a09626f726465722d626f74746f6d2d636f6c6f723a20234245314534413b0a09626f726465722d72696768742d636f6c6f723a20234245314534413b0a7d0a0a2e72746c202e706f6c6c62617234207b0a09626f726465722d6c6566742d636f6c6f723a20234245314534413b0a7d0a0a2e706f6c6c62617235207b0a096261636b67726f756e642d636f6c6f723a20234638313135373b0a09626f726465722d626f74746f6d2d636f6c6f723a20234431314134453b0a09626f726465722d72696768742d636f6c6f723a20234431314134453b0a7d0a0a2e72746c202e706f6c6c62617235207b0a09626f726465722d6c6566742d636f6c6f723a20234431314134453b0a7d0a0a2f2a20506f737465722070726f66696c6520626c6f636b0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2e706f737470726f66696c65207b0a09636f6c6f723a20233636363636363b0a09626f726465722d6c6566742d636f6c6f723a20234646464646463b0a7d0a0a2e72746c202e706f737470726f66696c65207b0a09626f726465722d72696768742d636f6c6f723a20234646464646463b0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0a7d0a0a2e706d202e706f737470726f66696c65207b0a09626f726465722d6c6566742d636f6c6f723a20234444444444443b0a7d0a0a2e72746c202e706d202e706f737470726f66696c65207b0a09626f726465722d72696768742d636f6c6f723a20234444444444443b0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0a7d0a0a2e706f737470726f66696c65207374726f6e67207b0a09636f6c6f723a20233030303030303b0a7d0a0a2e6f6e6c696e65207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f555345525f4f4e4c494e455f5352437d22293b0a7d0a0a2f2a2020090a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220627574746f6e732e6373730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2f2a2042696720627574746f6e20696d61676573202a2f0a2e7265706c792d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f544f5049435f5245504c595f5352437d22293b207d0a2e706f73742d69636f6e207370616e09097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f544f5049435f4e45575f5352437d22293b207d0a2e6c6f636b65642d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f544f5049435f4c4f434b45445f5352437d22293b207d0a2e706d7265706c792d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f504d5f5245504c595f5352437d2229203b7d0a2e6e6577706d2d69636f6e207370616e20097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f504d5f4e45575f5352437d2229203b7d0a2e666f7277617264706d2d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f504d5f464f52574152445f5352437d2229203b7d0a0a612e7072696e74207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7072696e742e67696622293b0a7d0a0a612e73656e64656d61696c207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f73656e64656d61696c2e67696622293b0a7d0a0a612e666f6e7473697a65207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f666f6e7473697a652e67696622293b0a7d0a0a2f2a2049636f6e20696d616765730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e73697465686f6d650909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f686f6d652e67696622293b207d0a2e69636f6e2d6661710909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f6661712e67696622293b207d0a2e69636f6e2d6d656d6265727309090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f6d656d626572732e67696622293b207d0a2e69636f6e2d686f6d650909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f686f6d652e67696622293b207d0a2e69636f6e2d7563700909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7563702e67696622293b207d0a2e69636f6e2d726567697374657209090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f72656769737465722e67696622293b207d0a2e69636f6e2d6c6f676f757409090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f6c6f676f75742e67696622293b207d0a2e69636f6e2d626f6f6b6d61726b09090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f626f6f6b6d61726b2e67696622293b207d0a2e69636f6e2d62756d700909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f62756d702e67696622293b207d0a2e69636f6e2d73756273637269626509090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7375627363726962652e67696622293b207d0a2e69636f6e2d756e737562736372696265090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f756e7375627363726962652e67696622293b207d0a2e69636f6e2d70616765730909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f70616765732e67696622293b207d0a2e69636f6e2d73656172636809090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7365617263682e67696622293b207d0a0a2f2a2050726f66696c652026206e617669676174696f6e2069636f6e73202a2f0a2e656d61696c2d69636f6e2c202e656d61696c2d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f454d41494c5f5352437d22293b207d0a2e61696d2d69636f6e2c202e61696d2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f41494d5f5352437d22293b207d0a2e7961686f6f2d69636f6e2c202e7961686f6f2d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f5941484f4f5f5352437d22293b207d0a2e7765622d69636f6e2c202e7765622d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f5757575f5352437d22293b207d0a2e6d736e6d2d69636f6e2c202e6d736e6d2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f4d534e4d5f5352437d22293b207d0a2e6963712d69636f6e2c202e6963712d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f4943515f5352437d22293b207d0a2e6a61626265722d69636f6e2c202e6a61626265722d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f4a41424245525f5352437d22293b207d0a2e706d2d69636f6e2c202e706d2d69636f6e2061090909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f504d5f5352437d22293b207d0a2e71756f74652d69636f6e2c202e71756f74652d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f51554f54455f5352437d22293b207d0a0a2f2a204d6f64657261746f722069636f6e73202a2f0a2e7265706f72742d69636f6e2c202e7265706f72742d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f5245504f52545f5352437d22293b207d0a2e656469742d69636f6e2c202e656469742d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f454449545f5352437d22293b207d0a2e64656c6574652d69636f6e2c202e64656c6574652d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f44454c4554455f5352437d22293b207d0a2e696e666f2d69636f6e2c202e696e666f2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f494e464f5f5352437d22293b207d0a2e7761726e2d69636f6e2c202e7761726e2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f555345525f5741524e5f5352437d22293b207d202f2a204e6565642075706461746564207761726e2069636f6e202a2f0a0a2f2a2020090a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a436f6c6f75727320616e64206261636b67726f756e647320666f722063702e6373730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2f2a204d61696e20435020626f780a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a2363702d6d61696e2068332c202363702d6d61696e2068722c202363702d6d656e75206872207b0a09626f726465722d636f6c6f723a20234134423342463b0a7d0a0a2363702d6d61696e202e70616e656c206c692e726f77207b0a09626f726465722d626f74746f6d2d636f6c6f723a20234235433143423b0a09626f726465722d746f702d636f6c6f723a20234639463946393b0a7d0a0a756c2e63706c697374207b0a09626f726465722d746f702d636f6c6f723a20234235433143423b0a7d0a0a2363702d6d61696e202e70616e656c206c692e6865616465722064642c202363702d6d61696e202e70616e656c206c692e686561646572206474207b0a09636f6c6f723a20233030303030303b0a7d0a0a2363702d6d61696e207461626c652e7461626c6531207468656164207468207b0a09636f6c6f723a20233333333333333b0a09626f726465722d626f74746f6d2d636f6c6f723a20233333333333333b0a7d0a0a2363702d6d61696e202e706d2d6d657373616765207b0a09626f726465722d636f6c6f723a20234442444545323b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a2f2a20435020746162626564206d656e750a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a23746162732061207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f74616273312e67696622293b0a7d0a0a23746162732061207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f74616273322e67696622293b0a09636f6c6f723a20233533363438323b0a7d0a0a237461627320613a686f766572207370616e207b0a09636f6c6f723a20234243324134443b0a7d0a0a2374616273202e6163746976657461622061207b0a09626f726465722d626f74746f6d2d636f6c6f723a20234341444345423b0a7d0a0a2374616273202e6163746976657461622061207370616e207b0a09636f6c6f723a20233333333333333b0a7d0a0a2374616273202e61637469766574616220613a686f766572207370616e207b0a09636f6c6f723a20233030303030303b0a7d0a0a2f2a204d696e6920746162626564206d656e75207573656420696e204d43500a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a236d696e6974616273206c69207b0a096261636b67726f756e642d636f6c6f723a20234531454246323b0a7d0a0a236d696e6974616273206c692e616374697665746162207b0a096261636b67726f756e642d636f6c6f723a20234639463946393b0a7d0a0a236d696e6974616273206c692e61637469766574616220612c20236d696e6974616273206c692e61637469766574616220613a686f766572207b0a09636f6c6f723a20233333333333333b0a7d0a0a2f2a20554350206e617669676174696f6e206d656e750a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a2f2a204c696e6b207374796c657320666f7220746865207375622d73656374696f6e206c696e6b73202a2f0a236e617669676174696f6e2061207b0a09636f6c6f723a20233333333b0a096261636b67726f756e642d636f6c6f723a20234232433243463b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6d656e752e67696622293b0a7d0a0a2e72746c20236e617669676174696f6e2061207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6d656e755f72746c2e67696622293b0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0a7d0a0a236e617669676174696f6e20613a686f766572207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a096261636b67726f756e642d636f6c6f723a20236161626163363b0a09636f6c6f723a20234243324134443b0a7d0a0a236e617669676174696f6e20236163746976652d73756273656374696f6e2061207b0a09636f6c6f723a20234433313134313b0a096261636b67726f756e642d636f6c6f723a20234639463946393b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a236e617669676174696f6e20236163746976652d73756273656374696f6e20613a686f766572207b0a09636f6c6f723a20234433313134313b0a7d0a0a2f2a20507265666572656e6365732070616e65206c61796f75740a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2363702d6d61696e206832207b0a09636f6c6f723a20233333333333333b0a7d0a0a2363702d6d61696e202e70616e656c207b0a096261636b67726f756e642d636f6c6f723a20234639463946393b0a7d0a0a2363702d6d61696e202e706d207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d746f702c202363702d6d656e75207370616e2e636f726e6572732d746f70207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c656674322e67696622293b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75207370616e2e636f726e6572732d746f70207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f7269676874322e67696622293b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c656674322e67696622293b0a7d0a0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f7269676874322e67696622293b0a7d0a0a2f2a20546f706963726576696577202a2f0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f702c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e67696622293b0a7d0a0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e67696622293b0a7d0a0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e67696622293b0a7d0a0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e67696622293b0a7d0a0a2f2a20467269656e6473206c697374202a2f0a2e63702d6d696e69207b0a096261636b67726f756e642d636f6c6f723a20236565663566393b0a7d0a0a646c2e6d696e69206474207b0a09636f6c6f723a20233432353036373b0a7d0a0a2f2a20504d205374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a2f2a20504d204d65737361676520686973746f7279202a2f0a2e63757272656e74207b0a09636f6c6f723a20233030303030302021696d706f7274616e743b0a7d0a0a2f2a20504d206d61726b696e6720636f6c6f757273202a2f0a2e706d6c697374206c692e706d5f6d6573736167655f7265706f727465645f636f6c6f75722c202e706d5f6d6573736167655f7265706f727465645f636f6c6f7572207b0a09626f726465722d6c6566742d636f6c6f723a20234243324134443b0a09626f726465722d72696768742d636f6c6f723a20234243324134443b0a7d0a0a2e706d6c697374206c692e706d5f6d61726b65645f636f6c6f75722c202e706d5f6d61726b65645f636f6c6f7572207b0a09626f726465722d636f6c6f723a20234646363630303b0a7d0a0a2e706d6c697374206c692e706d5f7265706c6965645f636f6c6f75722c202e706d5f7265706c6965645f636f6c6f7572207b0a09626f726465722d636f6c6f723a20234139423843323b0a7d0a0a2e706d6c697374206c692e706d5f667269656e645f636f6c6f75722c202e706d5f667269656e645f636f6c6f7572207b0a09626f726465722d636f6c6f723a20233544384642443b0a7d0a0a2e706d6c697374206c692e706d5f666f655f636f6c6f75722c202e706d5f666f655f636f6c6f7572207b0a09626f726465722d636f6c6f723a20233030303030303b0a7d0a0a2f2a204176617461722067616c6c657279202a2f0a2367616c6c657279206c6162656c207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b0a09626f726465722d636f6c6f723a20234343433b0a7d0a0a2367616c6c657279206c6162656c3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20234545453b0a7d0a0a2f2a2020090a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220666f726d732e6373730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a2f2a2047656e6572616c20666f726d207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a73656c656374207b0a09626f726465722d636f6c6f723a20233636363636363b0a096261636b67726f756e642d636f6c6f723a20234641464146413b0a09636f6c6f723a20233030303b0a7d0a0a6c6162656c207b0a09636f6c6f723a20233432353036373b0a7d0a0a6f7074696f6e2e64697361626c65642d6f7074696f6e207b0a09636f6c6f723a2067726179746578743b0a7d0a0a2f2a20446566696e6974696f6e206c697374206c61796f757420666f7220666f726d730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a6464206c6162656c207b0a09636f6c6f723a20233333333b0a7d0a0a2f2a20486f7665722065666665637473202a2f0a6669656c6473657420646c3a686f766572206474206c6162656c207b0a09636f6c6f723a20233030303030303b0a7d0a0a6669656c647365742e6669656c64733220646c3a686f766572206474206c6162656c207b0a09636f6c6f723a20696e68657269743b0a7d0a0a2f2a20517569636b2d6c6f67696e206f6e20696e6465782070616765202a2f0a6669656c647365742e717569636b2d6c6f67696e20696e7075742e696e707574626f78207b0a096261636b67726f756e642d636f6c6f723a20234632463346333b0a7d0a0a2f2a20506f7374696e672070616765207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0a0a236d6573736167652d626f78207465787461726561207b0a09636f6c6f723a20233333333333333b0a7d0a0a2f2a20496e707574206669656c64207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a2e696e707574626f78207b0a096261636b67726f756e642d636f6c6f723a20234646464646463b200a09626f726465722d636f6c6f723a20234234424143303b0a09636f6c6f723a20233333333333333b0a7d0a0a2e696e707574626f783a686f766572207b0a09626f726465722d636f6c6f723a20233131413345413b0a7d0a0a2e696e707574626f783a666f637573207b0a09626f726465722d636f6c6f723a20233131413345413b0a09636f6c6f723a20233046343938373b0a7d0a0a2f2a20466f726d20627574746f6e207374796c65730a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0a0a612e627574746f6e312c20696e7075742e627574746f6e312c20696e7075742e627574746f6e332c20612e627574746f6e322c20696e7075742e627574746f6e32207b0a09636f6c6f723a20233030303b0a096261636b67726f756e642d636f6c6f723a20234641464146413b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f627574746f6e2e67696622293b0a7d0a0a612e627574746f6e312c20696e7075742e627574746f6e31207b0a09626f726465722d636f6c6f723a20233636363636363b0a7d0a0a696e7075742e627574746f6e33207b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a2f2a20416c7465726e617469766520627574746f6e202a2f0a612e627574746f6e322c20696e7075742e627574746f6e322c20696e7075742e627574746f6e33207b0a09626f726465722d636f6c6f723a20233636363636363b0a7d0a0a2f2a203c613e20627574746f6e20696e20746865207374796c65206f662074686520666f726d20627574746f6e73202a2f0a612e627574746f6e312c20612e627574746f6e313a6c696e6b2c20612e627574746f6e313a766973697465642c20612e627574746f6e313a6163746976652c20612e627574746f6e322c20612e627574746f6e323a6c696e6b2c20612e627574746f6e323a766973697465642c20612e627574746f6e323a616374697665207b0a09636f6c6f723a20233030303030303b0a7d0a0a2f2a20486f76657220737461746573202a2f0a612e627574746f6e313a686f7665722c20696e7075742e627574746f6e313a686f7665722c20612e627574746f6e323a686f7665722c20696e7075742e627574746f6e323a686f7665722c20696e7075742e627574746f6e333a686f766572207b0a09626f726465722d636f6c6f723a20234243324134443b0a09636f6c6f723a20234243324134443b0a7d0a0a696e7075742e736561726368207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f74657874626f785f7365617263682e67696622293b0a7d0a0a696e7075742e64697361626c6564207b0a09636f6c6f723a20233636363636363b0a7d0a);
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(2, 'subsilver2', '&copy; phpBB Group, 2003', 'subsilver2', 0, 1345476754, '');
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(3, 'Artodia: Helion', '© Artodia.com', 'art_helion', 1, 1355003369, 0x2f2a2020706870424233205374796c652053686565740a092d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a095374796c65206e616d653a0909094172746f6469613a2048656c696f6e0a094261736564206f6e207374796c653a090970726f73696c76657220287468652064656661756c7420706870424220332e302e78207374796c65290a094f726967696e616c20617574686f723a09546f6d2042656464617264202820687474703a2f2f7777772e737562626c75652e636f6d2f20290a094d6f6469666965642062793a0909566a61636865736c61762054727573686b696e202820687474703a2f2f7777772e6172746f6469612e636f6d2f20290a092d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0a2a2f0a2f2a0a09476c6f62616c2043535320646566696e6974696f6e732c206f766572616c6c206c61796f75740a2a2f0a0a0a2f2a0a094353532052657365740a2a2f0a68746d6c2c20626f64792e70687062622c202e7068706262206469762c202e7068706262207370616e2c202e7068706262206170706c65742c202e7068706262206f626a6563742c202e706870626220696672616d652c202e70687062620a68312c202e70687062622068322c202e70687062622068332c202e70687062622068342c202e70687062622068352c202e70687062622068362c202e706870626220702c202e706870626220626c6f636b71756f74652c202e7068706262207072652c202e70687062620a612c202e706870626220616262722c202e7068706262206163726f6e796d2c202e706870626220616464726573732c202e7068706262206269672c202e706870626220636974652c202e706870626220636f64652c202e70687062620a64656c2c202e70687062622064666e2c202e706870626220656d2c202e706870626220696d672c202e706870626220696e732c202e7068706262206b62642c202e706870626220712c202e706870626220732c202e70687062622073616d702c202e70687062620a736d616c6c2c202e706870626220737472696b652c202e7068706262207374726f6e672c202e7068706262207375622c202e7068706262207375702c202e70687062622074742c202e7068706262207661722c202e70687062620a622c202e706870626220752c202e706870626220692c202e70687062622063656e7465722c202e70687062620a646c2c202e70687062622064742c202e70687062622064642c202e7068706262206f6c2c202e706870626220756c2c202e7068706262206c692c202e70687062620a6669656c647365742c202e706870626220666f726d2c202e7068706262206c6162656c2c202e7068706262206c6567656e642c202e70687062620a7461626c652c202e70687062622063617074696f6e2c202e70687062622074626f64792c202e70687062622074666f6f742c202e70687062622074686561642c202e70687062622074722c202e70687062622074682c202e70687062622074642c202e70687062620a61727469636c652c202e70687062622061736964652c202e70687062622063616e7661732c202e70687062622064657461696c732c202e706870626220656d6265642c202e7068706262200a6669677572652c202e70687062622066696763617074696f6e2c202e706870626220666f6f7465722c202e7068706262206865616465722c202e7068706262206867726f75702c202e7068706262200a6d656e752c202e7068706262206e61762c202e7068706262206f75747075742c202e706870626220727562792c202e70687062622073656374696f6e2c202e70687062622073756d6d6172792c202e70687062620a74696d652c202e7068706262206d61726b2c202e706870626220617564696f2c202e706870626220766964656f2c202e7068706262206d65746572207b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09626f726465723a20303b0a09666f6e742d73697a653a20313030253b0a09666f6e743a20696e68657269743b0a09766572746963616c2d616c69676e3a20626173656c696e653b0a7d0a2f2a2048544d4c3520646973706c61792d726f6c6520726573657420666f72206f6c6465722062726f7773657273202a2f0a2e70687062622061727469636c652c202e70687062622061736964652c202e70687062622064657461696c732c202e70687062622066696763617074696f6e2c202e7068706262206669677572652c202e7068706262200a666f6f7465722c202e7068706262206865616465722c202e7068706262206867726f75702c202e7068706262206d656e752c202e7068706262206e61762c202e70687062622073656374696f6e207b0a09646973706c61793a20626c6f636b3b0a7d0a626f64792e7068706262207b0a096c696e652d6865696768743a2031656d3b0a7d0a2e7068706262206f6c2c202e706870626220756c207b0a096c6973742d7374796c653a206e6f6e653b0a7d0a2e706870626220626c6f636b71756f74652c202e70687062622071207b0a0971756f7465733a206e6f6e653b0a7d0a2e706870626220626c6f636b71756f74653a6265666f72652c202e706870626220626c6f636b71756f74653a61667465722c202e70687062620a713a6265666f72652c202e706870626220713a6166746572207b0a09636f6e74656e743a2027273b0a09636f6e74656e743a206e6f6e653b0a7d0a2e7068706262207461626c65207b0a09626f726465722d636f6c6c617073653a20636f6c6c617073653b0a09626f726465722d73706163696e673a20303b0a7d0a0a2f2a0a09466f6e740a2a2f0a626f64792e7068706262207b0a09666f6e742d66616d696c793a2056657264616e613b0a09666f6e742d73697a653a20313270783b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a096261636b67726f756e642d7265706561743a207265706561742d783b0a7d0a626f64792e73696d706c65207b0a0970616464696e673a203870783b0a7d0a0a2f2a0a09436f6d6d6f6e2073747566660a2a2f0a2e7068706262202e636c6561722c202e7068706262207370616e2e636f726e6572732d626f74746f6d207b0a09646973706c61793a20626c6f636b3b0a09636c6561723a20626f74683b0a096865696768743a20303b0a096f766572666c6f773a2068696464656e3b0a7d0a2e7068706262202e7269676874207b0a09746578742d616c69676e3a2072696768743b0a7d0a2e7068706262202e6e6f77726170207b0a0977686974652d73706163653a206e6f777261703b0a7d0a0a2e70687062622070207b0a0970616464696e673a2036707820303b0a096c696e652d6865696768743a20312e35656d3b0a7d0a0a2e7068706262202e726967687473696465207b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a7d0a2e7068706262202e6c65667473696465207b0a09666c6f61743a206c6566743b0a09746578742d616c69676e3a206c6566743b0a7d0a2e7068706262202e6c6566742d626f78207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a096d617267696e2d72696768743a203570783b0a7d0a2e7068706262202e72696768742d626f78207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a096d617267696e2d6c6566743a203570783b0a7d0a0a2e7068706262206872207b0a09626f726465722d77696474683a20303b0a09626f726465722d746f703a2031707820736f6c6964207472616e73706172656e743b0a096d617267696e2d6c6566743a20323070783b0a096d617267696e2d72696768743a20323070783b0a7d0a0a0a0a2f2a0a094865616465720a2a2f0a2e7068706262202e6c6f676f207b0a09746578742d616c69676e3a2063656e7465723b0a0970616464696e673a20302030203470783b0a7d0a2e7068706262202e6c6f676f206831207b0a09646973706c61793a206e6f6e653b202f2a2072656d6f76652074686973206c696e6520746f2073686f7720666f72756d206e616d6520696e20686561646572202a2f0a09666f6e742d73697a653a20323470783b0a09666f6e742d7765696768743a206e6f726d616c3b0a0970616464696e673a20313070783b0a7d0a0a2f2a0a094c61796f75740a2a2f0a2e7068706262202e626f64792d77726170706572207b0a0970616464696e673a2030203870783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a7d0a2e7068706262202e666f72756d2d77726170706572207b0a096d696e2d6865696768743a2034303070783b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d626f74746f6d2d77696474683a20303b0a092d7765626b69742d626f726465722d746f702d6c6566742d7261646975733a203670783b0a092d7765626b69742d626f726465722d746f702d72696768742d7261646975733a203670783b0a092d6d6f7a2d626f726465722d7261646975732d746f706c6566743a203670783b0a092d6d6f7a2d626f726465722d7261646975732d746f7072696768743a203670783b0a09626f726465722d746f702d6c6566742d7261646975733a203670783b0a09626f726465722d746f702d72696768742d7261646975733a203670783b0a7d0a2e7068706262202e6c61796f75742d6f75746572207b0a0970616464696e673a20303b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d626f74746f6d2d77696474683a20303b0a092d7765626b69742d626f726465722d746f702d6c6566742d7261646975733a203570783b0a092d7765626b69742d626f726465722d746f702d72696768742d7261646975733a203570783b0a092d6d6f7a2d626f726465722d7261646975732d746f706c6566743a203570783b0a092d6d6f7a2d626f726465722d7261646975732d746f7072696768743a203570783b0a09626f726465722d746f702d6c6566742d7261646975733a203570783b0a09626f726465722d746f702d72696768742d7261646975733a203570783b0a7d0a2e7068706262206469762e6c61796f75742d77726170706572207b0a09646973706c61793a207461626c653b0a7d0a2e7068706262202e6c61796f75742d77726170706572207b0a0977696474683a20313030253b0a7d0a2e7068706262206469762e6c61796f75742d77726170706572203e20646976207b0a09646973706c61793a207461626c652d63656c6c3b0a7d0a2e7068706262207461626c652e6c61796f75742d77726170706572207b0a09626f726465722d636f6c6c617073653a2073657061726174653b0a7d0a2e7068706262202e6c61796f75742d77726170706572203e206469762c202e7068706262207461626c652e6c61796f75742d77726170706572203e2074626f6479203e207472203e207464207b0a09766572746963616c2d616c69676e3a20746f703b0a0970616464696e673a203670783b0a09626f726465723a2030707820736f6c6964207472616e73706172656e743b0a09626f726465722d77696474683a2030203170783b0a7d0a2e7068706262202e6c61796f75742d77726170706572203e206469763a66697273742d6368696c642c202e7068706262202e6c61796f75742d77726170706572203e2074626f6479203e207472203e2074643a66697273742d6368696c64207b0a09626f726465722d6c6566742d77696474683a20303b0a7d0a2e7068706262202e6c61796f75742d77726170706572203e206469763a6c6173742d6368696c642c202e7068706262202e6c61796f75742d77726170706572203e2074626f6479203e207472203e2074643a6c6173742d6368696c64207b0a09626f726465722d72696768742d77696474683a20302021696d706f7274616e743b0a7d0a2e7068706262202e6c61796f75742d6c6566742c202e7068706262202e6c61796f75742d7269676874207b0a0977696474683a2032303070783b0a096d61782d77696474683a2032303070783b0a7d0a0a2e7068706262202e706167652d636f6e74656e74207b0a0970616464696e673a203870783b0a7d0a2e7068706262202e706167652d636f6e74656e74203e206833207b0a09636c6561723a20626f74683b0a7d0a0a2f2a0a09466f6f7465720a2a2f0a2e706870626220702e74696d65207b0a096d617267696e2d626f74746f6d3a203670783b0a0970616464696e673a20303b0a7d0a2e706870626220702e74696d652e6669727374207b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a7d0a2e7068706262202e666f6f746572207b0a0970616464696e673a203130707820387078203470783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a7d0a0a2e7068706262202e666f6f746572202e6c656674207b200a09666c6f61743a206c6566743b200a0970616464696e673a20303b0a7d0a2e7068706262202e666f6f746572202e636f70797269676874207b200a096d617267696e3a20303b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a0970616464696e673a20303b0a7d0a2e6f6c646965202e7068706262202e666f6f746572202e636f70797269676874207b0a09666c6f61743a206e6f6e653b0a7d0a2e7068706262202e666f6f746572202e617274792c202e7068706262202e666f6f746572202e70687062622d67726f7570207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a0977696474683a20303b0a096865696768743a20303b0a096f766572666c6f773a2068696464656e3b0a096d617267696e3a20303b0a0970616464696e673a20303b0a0970616464696e672d746f703a20323870783b0a0970616464696e672d6c6566743a20363070783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b0a096f7061636974793a20302e353b0a7d0a2e7068706262202e666f6f746572202e61727479207b200a096261636b67726f756e642d706f736974696f6e3a202d3630707820303b0a7d0a2e7068706262202e666f6f746572202e617274793a686f7665722c202e7068706262202e666f6f746572202e70687062622d67726f75703a686f766572207b0a096f7061636974793a20313b0a7d0a0a2f2a0a094d656e750a2a2f0a2e706870626220756c2e6d656e75207b0a0970616464696e672d626f74746f6d3a203470783b0a096d617267696e3a202d317078203020303b0a7d0a2e706870626220756c2e6d656e752d6e6f70616464696e67207b0a0970616464696e672d626f74746f6d3a20303b0a7d0a2e706870626220756c2e6d656e752d6e6f70616464696e67202b20756c2e6d656e75207b0a096d617267696e2d746f703a20303b0a7d0a2e7068706262202e6d656e75203e206c69207b0a0977696474683a2032303070783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d666f726d207b0a0970616464696e673a203270783b0a0977696474683a2031393670783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e207b0a09646973706c61793a20626c6f636b3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e652030202d33307078206e6f2d7265706561743b0a0977696474683a2031393070783b0a096d617267696e3a20302030203270783b0a0970616464696e673a20302030203020313070783b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d6974656d20612c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e20612c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e2070207b0a09646973706c61793a20626c6f636b3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520313030252030206e6f2d7265706561743b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096d617267696e3a20303b0a0970616464696e673a203770782031307078203020303b0a096865696768743a20323270783b0a09746578742d616c69676e3a206c6566743b0a096c696e652d6865696768743a20312e32656d3b0a0977686974652d73706163653a206e6f777261703b0a096d61782d77696474683a2031383070783b0a096f766572666c6f773a2068696464656e3b0a09746578742d6f766572666c6f773a20656c6c69707369733b0a096f75746c696e652d7374796c653a206e6f6e653b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e2e657870616e6461626c652061207b0a096d61782d77696474683a2031363070783b0a0970616464696e672d6c6566743a20313070783b0a0970616464696e672d72696768743a20323070783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e207b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e20612c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e2070207b0a09666f6e742d66616d696c793a20274f70656e2053616e73272c2073616e732d73657269663b0a09666f6e742d73697a653a20313370783b0a096261636b67726f756e642d706f736974696f6e3a2031303025202d333070783b0a09746578742d616c69676e3a2063656e7465723b0a0970616464696e672d746f703a203670783b0a096865696768743a20323370783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e20613a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d686f6d65207b0a096261636b67726f756e642d706f736974696f6e3a2030202d363070783b0a0970616464696e672d6c6566743a20323770783b0a0977696474683a2031373370783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d666f72756d207b0a096261636b67726f756e642d706f736974696f6e3a2030202d393070783b0a0970616464696e672d6c6566743a20323770783b0a0977696474683a2031373370783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d706d207b0a096261636b67726f756e642d706f736974696f6e3a2030202d31323070783b0a0970616464696e672d6c6566743a20323870783b0a0977696474683a2031373270783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d756370207b0a096261636b67726f756e642d706f736974696f6e3a2030202d31353070783b0a0970616464696e672d6c6566743a20323970783b0a0977696474683a2031373170783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d646f776e207b0a096261636b67726f756e642d706f736974696f6e3a2030202d31383070783b0a0970616464696e672d6c6566743a20323770783b0a0977696474683a2031373370783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6c6f67696e207b0a096261636b67726f756e642d706f736974696f6e3a2030202d32313070783b0a0970616464696e672d6c6566743a20333070783b0a0977696474683a2031373070783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d736561726368207b0a096261636b67726f756e642d706f736974696f6e3a2030202d32343070783b0a0970616464696e672d6c6566743a20333070783b0a0977696474683a2031373070783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d7573657273207b0a096261636b67726f756e642d706f736974696f6e3a2030202d32373070783b0a0970616464696e672d6c6566743a20323870783b0a0977696474683a2031373270783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d666171207b0a096261636b67726f756e642d706f736974696f6e3a2030202d33303070783b0a0970616464696e672d6c6566743a20323570783b0a0977696474683a2031373570783b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6c696e6b207b0a096261636b67726f756e642d706f736974696f6e3a2030202d33333070783b0a0970616464696e672d6c6566743a20323570783b0a0977696474683a2031373570783b0a7d0a0a2f2a0a094d656e7520666f726d732c20657870616e6461626c65206d656e752073656374696f6e730a2a2f0a2e7068706262206c692e6d656e752d666f726d20696e7075742c202e7068706262206c692e6d656e752d666f726d2061207b0a096d617267696e2d626f74746f6d3a203670783b0a7d0a0a2e7068706262202e6d656e75206c692e657870616e6461626c65207b0a09706f736974696f6e3a2072656c61746976653b0a7d0a2e7068706262202e6d656e75206c692e657870616e6461626c653a6166746572207b0a09646973706c61793a20626c6f636b3b0a09706f736974696f6e3a206162736f6c7574653b0a09636f6e74656e743a2027273b0a09746f703a20303b0a09626f74746f6d3a203470783b0a0972696768743a203870783b0a097a2d696e6465783a20323b0a0977696474683a20313370783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203020387078206e6f2d7265706561743b0a096f7061636974793a20302e353b0a7d0a2e7068706262202e6d656e75206c692e657870616e6461626c653a686f7665723a6166746572207b0a096f7061636974793a20313b0a7d0a2e7068706262202e6d656e75206c692e657870616e6461626c652e636f6c6c61707365643a6166746572207b0a096261636b67726f756e642d706f736974696f6e3a202d31357078203870783b0a096f7061636974793a20313b0a7d0a0a0a2f2a0a094e61766261720a2a2f0a2e7068706262202e6e61766261722c202e7068706262202e6c696e6b6d6370207b0a096d617267696e3a2036707820303b0a0970616464696e673a203670783b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d7261646975733a203570783b0a09636c6561723a20626f74683b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203020353025207265706561742d783b0a096c696e652d6865696768743a2031656d3b0a7d0a2e7068706262202e70616e656c202e6e61766261722c202e7068706262202e70616e656c202e6c696e6b6d6370207b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09626f726465722d77696474683a20303b0a09626f726465722d7261646975733a20303b0a7d0a2e7068706262202e70616e656c2e6e6176626172202e696e6e6572207b0a0970616464696e673a20303b0a7d0a2e7068706262202e70616e656c2e6e6176626172202e70616e656c2d696e6e6572207b0a0970616464696e673a203270783b0a7d0a2e7068706262202e6e61766261723a66697273742d6368696c64207b0a096d617267696e2d746f703a20303b0a7d0a2e7068706262202e6e61766261723a6c6173742d6368696c64207b0a096d617267696e2d626f74746f6d3a20303b0a7d0a2e696537202e7068706262202e6c696e6b6d6370207b0a096865696768743a20313270783b0a7d0a2e696537202e7068706262206469762e6e6176626172207b0a096865696768743a20323070783b0a7d0a2e7068706262202e6e61766261723a61667465722c202e7068706262202e6c696e6b6c6973743a61667465722c202e7068706262202e746f7069632d616374696f6e733a61667465722c202e706870626220237461627320756c3a61667465722c202e706870626220236d696e697461627320756c3a61667465722c202e706870626220646c2e64657461696c733a6166746572207b0a09636f6e74656e743a2027273b0a09646973706c61793a20626c6f636b3b0a09636c6561723a20626f74683b0a7d0a2e7068706262202e6e6176626172202e6c656674207b0a09666c6f61743a206c6566743b0a7d0a2e7068706262202e6e6176626172202e7269676874207b0a09666c6f61743a2072696768743b0a7d0a2e7068706262202e6e61766261722061207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a2e7068706262202e6e617662617220613a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a2e7068706262202e6c696e6b6d6370207b0a09746578742d616c69676e3a2072696768743b0a7d0a0a2f2a0a09486561646572206c6f67696e0a2a2f0a2e7068706262202e6865616465722d6c6f67696e207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a096d617267696e3a2030202d3870783b0a0970616464696e673a20367078203020303b0a09746578742d616c69676e3a2063656e7465723b0a096865696768743a20323770783b0a09666f6e742d73697a653a20313570783b0a09666f6e742d66616d696c793a20274f70656e2053616e73272c2073616e732d73657269663b0a09666f6e742d7765696768743a203430303b0a096c696e652d6865696768743a2031656d3b0a0977686974652d73706163653a206e6f777261703b0a09746578742d616c69676e3a2063656e7465723b0a7d0a2e696537202e7068706262202e6865616465722d6c6f67696e207b0a0970616464696e672d746f703a203470783b0a096865696768743a20323970783b0a7d0a2e7068706262202e6865616465722d6c6f67696e203e206469762e706f7075702d74726967676572207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a7d0a2e696537202e7068706262202e6865616465722d6c6f67696e203e206469762e706f7075702d74726967676572207b0a09646973706c61793a20696e6c696e653b0a097a2d696e6465783a20323b0a097a6f6f6d3a20313b0a7d0a0a2e706870626220612e6865616465722d6d656e75207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a0970616464696e673a2030203470783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09746578742d616c69676e3a2063656e7465723b0a096d696e2d77696474683a2031353070783b0a7d0a2e706870626220612e6865616465722d6d656e753a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a2e706870626220612e6865616465722d6d656e752e6d656e752d6c6f67696e207b200a09746578742d616c69676e3a2072696768743b0a7d0a2e706870626220612e6865616465722d6d656e752e6d656e752d7265676973746572207b200a09746578742d616c69676e3a206c6566743b0a7d0a2e706870626220612e6865616465722d6d656e752e6d656e752d6c6f67696e203e207370616e2c202e706870626220612e6865616465722d6d656e752e6d656e752d7265676973746572203e207370616e207b0a0970616464696e672d6c6566743a20323070783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203020327078206e6f2d7265706561743b0a7d0a2e706870626220612e6865616465722d6d656e752e6d656e752d7265676973746572203e207370616e207b0a096261636b67726f756e642d706f736974696f6e3a2030202d323870783b0a7d0a0a2f2a0a09546f70206c696e6b730a2a2f0a2e7068706262202e746f702d6c696e6b73207b0a09746578742d616c69676e3a2063656e7465723b0a096d617267696e3a2036707820303b0a7d0a2e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e652030202d33307078206e6f2d7265706561743b0a0977686974652d73706163653a206e6f777261703b0a09746578742d6465636f726174696f6e3a206e6f6e652021696d706f7274616e743b0a096c696e652d6865696768743a2031656d3b0a0970616464696e673a20303b0a0970616464696e672d6c6566743a20313270783b0a09766572746963616c2d616c69676e3a20746f703b0a7d0a2e7068706262202e746f702d6c696e6b73202e706f7075702d74726967676572202e746f702d6c696e6b207b0a0970616464696e672d6c6566743a20323970783b0a096261636b67726f756e642d706f736974696f6e3a2030202d363070783b0a7d0a2e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b203e207370616e207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a096d617267696e3a20303b0a0970616464696e673a203870782031327078203020303b0a096865696768743a20323170783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520313030252030206e6f2d7265706561743b0a7d0a2e696537202e7068706262202e746f702d6c696e6b73202e706f7075702d74726967676572207b0a09646973706c61793a20696e6c696e653b0a096d617267696e2d72696768743a203470783b0a097a2d696e6465783a20323b0a7d0a2f2a0a095061676520737065636966696320636f64650a2a2f0a0a2f2a0a0948656164657220626f7865730a2a2f0a2e7068706262202e746f7069636c697374202e6865616465722c202e70687062622068322e6865616465722d6f75746572207b0a09636c6561723a20626f74683b0a09646973706c61793a20626c6f636b3b0a096d617267696e3a20367078203020303b0a0970616464696e673a20303b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a09626f726465722d7261646975733a20303b0a09626f726465722d77696474683a20303b0a096865696768743a20333270783b0a096f766572666c6f773a2068696464656e3b0a7d0a2e7068706262202e746f7069636c697374202e686561646572207b0a096261636b67726f756e643a206e6f6e65203530252030206e6f2d7265706561742c207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b0a09706f736974696f6e3a2072656c61746976653b0a7d0a2e6f6c646965202e7068706262202e746f7069636c697374202e686561646572207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b0a7d0a2e70687062622068322e6865616465722e6865616465722d6f75746572207b0a096261636b67726f756e642d706f736974696f6e3a2035302520303b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a2e7068706262202e746f7069636c697374202e686561646572207b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a2e7068706262202e746f7069636c697374202e68656164657220646c2c202e70687062622068322e6865616465722d6f75746572202e6865616465722d72696768742c202e70687062622068322e6865616465722d6f75746572202e6865616465722d6c656674207b0a09646973706c61793a20626c6f636b3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520313030252030206e6f2d7265706561743b0a0970616464696e673a20303b0a7d0a2e70687062622068322e6865616465722d6f75746572202e6865616465722d6c656674207b0a096261636b67726f756e642d706f736974696f6e3a203020303b0a7d0a0a2e7068706262202e746f7069636c697374202e686561646572206464207b0a09646973706c61793a206e6f6e652021696d706f7274616e743b0a7d0a2e7068706262202e746f7069636c697374202e6865616465722064742c202e70687062622068322e6865616465722d6f75746572202e6865616465722d696e6e6572207b0a09636c6561723a20626f74683b0a09646973706c61793a20626c6f636b3b0a09666f6e742d73697a653a20313570783b0a09666f6e742d66616d696c793a20274f70656e2053616e73272c2073616e732d73657269663b0a09666f6e742d7765696768743a203430303b0a096c696e652d6865696768743a2031656d3b0a0977686974652d73706163653a206e6f777261703b0a09746578742d616c69676e3a2063656e7465723b0a096865696768743a20323670782021696d706f7274616e743b0a096d617267696e3a203020313070783b0a0970616464696e673a20367078203230707820302021696d706f7274616e743b0a096f766572666c6f773a2068696464656e3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a7d0a0a2e7068706262202e746f7069636c697374202e68656164657220612c202e70687062622068322e6865616465722d6f7574657220612c202e7068706262202e706f73742068332061207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a2e7068706262202e746f7069636c697374202e68656164657220613a686f7665722c202e70687062622068322e6865616465722d6f7574657220613a686f7665722c202e7068706262202e706f737420683320613a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a2e696537202e7068706262202e746f7069636c697374202e6865616465722064742c202e696537202e70687062622068322e6865616465722d6f75746572202e6865616465722d696e6e6572207b0a09666f6e742d66616d696c793a20417269616c3b0a7d0a0a2e7068706262202e657870616e6461626c65202e6865616465723a6166746572207b0a09646973706c61793a20626c6f636b3b0a09706f736974696f6e3a206162736f6c7574653b0a09636f6e74656e743a2027273b0a09746f703a20303b0a09626f74746f6d3a203470783b0a0972696768743a203870783b0a097a2d696e6465783a20323b0a0977696474683a20313370783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203020353025206e6f2d7265706561743b0a096f7061636974793a20302e353b0a7d0a2e7068706262202e657870616e6461626c65202e6865616465723a686f7665723a6166746572207b0a096f7061636974793a20313b0a7d0a2e7068706262202e657870616e6461626c65202e6865616465722e696e6163746976653a6166746572207b0a096261636b67726f756e642d706f736974696f6e3a202d31357078203530253b0a096f7061636974793a20313b0a7d0a0a2f2a0a09466f72756d73206c6973740a2a2f0a2e7068706262202e746f7069636c697374207b0a09636c6561723a20626f74683b0a097a6f6f6d3a20313b0a7d0a0a2e7068706262202e746f7069636c697374207b0a09646973706c61793a20626c6f636b3b0a7d0a2e7068706262202e746f7069636c6973743a61667465722c202e7068706262202e706f73743a6166746572207b0a09636f6e74656e743a2027273b0a09646973706c61793a20626c6f636b3b0a09636c6561723a20626f74683b0a7d0a0a2e7068706262202e746f7069636c697374203e206c69207b0a096d617267696e3a2032707820303b0a0970616464696e673a2034707820303b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d7261646975733a203670783b0a7d0a2e7068706262202e746f7069636c697374203e206c692e726f772d6f75746572207b0a0970616464696e673a20303b0a7d0a0a2e7068706262202e746f7069636c69737420646c207b0a09646973706c61793a207461626c653b0a0977696474683a20313030253b0a7d0a2e7068706262202e746f7069636c6973742064742c202e7068706262202e746f7069636c697374206464207b0a09646973706c61793a207461626c652d63656c6c3b0a09766572746963616c2d616c69676e3a206d6964646c653b0a096c696e652d6865696768743a20312e35656d3b0a096865696768743a20333370783b0a0970616464696e673a2030203670783b0a7d0a2e7068706262202e746f7069636c697374202e69636f6e206474207b0a0970616464696e672d6c6566743a20343070783b0a096865696768743a20333970783b0a7d0a0a2e7068706262202e746f7069636c697374206464207b0a09626f726465722d6c6566743a2031707820736f6c6964207472616e73706172656e743b0a09746578742d616c69676e3a2063656e7465723b0a096c696e652d6865696768743a20312e33656d3b0a0977696474683a20353070783b0a7d0a0a2e7068706262202e746f7069636c6973742064642e696e666f2c202e7068706262202e746f7069636c6973742064642e74696d65207b0a096d696e2d77696474683a2032323070783b0a09666f6e742d73697a653a20313170783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e7068706262202e746f7069636c6973742064642e6c617374706f73742c202e7068706262202e746f7069636c6973742064642e7265646972656374207b0a096d696e2d77696474683a2032323070783b0a09746578742d616c69676e3a206c6566743b0a09666f6e742d73697a653a20313170783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e7068706262202e746f7069636c6973742064642e6d6f6465726174696f6e207b0a0977696474683a203430253b0a09746578742d616c69676e3a206c6566743b0a7d0a2e7068706262202e746f7069636c6973742064642e656d707479207b0a09646973706c61793a206e6f6e653b0a7d0a0a2e7068706262202e746f7069636c697374202e746f706963732064666e2c202e7068706262202e746f7069636c697374202e706f7374732064666e2c202e7068706262202e746f7069636c697374202e76696577732064666e207b0a09746578742d7472616e73666f726d3a206c6f776572636173653b0a09646973706c61793a20626c6f636b3b0a09666f6e742d73697a653a20313170783b0a7d0a2e7068706262207370616e2e666f72756d2d696d616765207b0a09666c6f61743a206c6566743b0a0970616464696e672d72696768743a203670783b0a7d0a2e706870626220646c2e69636f6e207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e652033707820353025206e6f2d7265706561743b0a7d0a2e706870626220646c2e69636f6e206474207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e652033707820353025206e6f2d7265706561743b0a7d0a0a2e706870626220612e666f72756d7469746c652c202e706870626220612e746f7069637469746c65207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a09666f6e742d66616d696c793a20417269616c3b0a09666f6e742d73697a653a20313670783b0a09666f6e742d7765696768743a206e6f726d616c3b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096c696e652d6865696768743a2031656d3b0a7d0a2e706870626220612e746f7069637469746c65207b0a0970616464696e672d746f703a203170783b0a7d0a2e706870626220612e666f72756d7469746c653a686f7665722c202e706870626220612e746f7069637469746c653a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a2e706870626220702e737562666f72756d732c202e706870626220702e6d6f64657261746f7273207b0a0970616464696e673a20327078203020303b0a7d0a2e706870626220702e737562666f72756d73207374726f6e672c202e706870626220702e6d6f64657261746f7273207374726f6e67207b0a09666f6e742d7765696768743a206e6f726d616c3b0a7d0a0a2f2a0a0949453720746f70696373206c6973740a2a2f0a2e696537202e7068706262202e746f7069636c69737420646c207b0a09646973706c61793a20626c6f636b3b0a096865696768743a2031253b0a7d0a2e696537202e7068706262202e746f7069636c69737420646c2e69636f6e207b0a096d696e2d6865696768743a20333970783b0a7d0a2e696537202e7068706262202e746f7069636c6973742064742c202e696537202e7068706262202e746f7069636c697374206464207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a7d0a2e696537202e7068706262202e746f7069636c697374206474207b0a0977696474683a203530253b0a096865696768743a2031253b0a7d0a2e696537202e7068706262202e746f7069636c697374202e686561646572206474207b0a0977696474683a206175746f3b0a09666c6f61743a206e6f6e653b0a7d0a2e696537202e7068706262202e746f7069636c697374206464207b0a0977696474683a2038253b0a7d0a2e696537202e7068706262202e746f7069636c6973742064642e6c617374706f7374207b0a0977696474683a203235253b0a7d09200a0a2e696537202e7068706262202e746f7069636c697374202e68656164657220646c2e69636f6e2c202e696537202e7068706262202e746f7069636c697374202e686561646572206474207b0a096d696e2d6865696768743a20333270783b0a096d61782d6865696768743a20333270783b0a096865696768743a20333270782021696d706f7274616e743b0a0970616464696e672d746f703a20303b0a097a6f6f6d3a20313b0a7d0a0a0a2f2a0a09536d616c6c206172726f77730a2a2f0a2e706870626220612e737562666f72756d207b0a0970616464696e672d6c6566743a20313470783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203020353025206e6f2d7265706561743b0a7d0a0a2f2a0a09436f6e74656e7420626c6f636b730a2a2f0a2e70687062622068322c202e7068706262206833207b0a096d617267696e3a20313270782030203470783b0a09666f6e742d73697a653a20313670783b0a09666f6e742d66616d696c793a2048656c7665746963612c20417269616c3b0a09666f6e742d7765696768743a203430303b0a096c696e652d6865696768743a20312e32656d3b0a7d0a0a2e696537202e7068706262202e70616e656c2c202e756537202e7068706262206469762e72756c6573207b0a09636c6561723a20626f74683b0a7d0a2e7068706262202e70616e656c2c202e7068706262206469762e72756c65732c202e7068706262202e63702d6d696e69207b0a096d617267696e3a2036707820303b0a0970616464696e673a20303b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d7261646975733a203670783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a7d0a2e7068706262202e706d2d70616e656c2d6d657373616765207b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09626f726465722d77696474683a20303b0a7d0a2e7068706262202e70616e656c202e696e6e65722c202e7068706262202e70616e656c202e636f6e74656e74207b0a0970616464696e673a203470783b0a7d0a2e7068706262202e70616e656c2d6f75746572202e70616e656c2d696e6e6572207b0a0970616464696e673a20303b0a7d0a2e7068706262206469762e72756c6573202e696e6e6572207b0a0970616464696e673a20313070783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e70687062622023696e666f726d6174696f6e2e72756c6573202e696e6e6572207b0a09746578742d616c69676e3a2063656e7465723b0a0970616464696e673a20323070783b0a7d0a2e7068706262202e706f7374626f647920702e72756c6573207b0a0970616464696e673a20313070783b0a09746578742d616c69676e3a2063656e7465723b0a09626f726465722d7261646975733a203570783b0a7d0a0a2e7068706262202e70616e656c2d777261707065722c202e7068706262202e70616e656c2d77726170706572203e202e70616e656c2d696e6e6572207b0a09626f726465722d77696474683a20302021696d706f7274616e743b0a09626f782d736861646f773a206e6f6e652021696d706f7274616e743b0a7d0a2e7068706262202e70616e656c2d77726170706572202e696e6e65722d6669727374207b0a0970616464696e673a2034707820303b0a7d0a0a2e7068706262202e70616e656c2068322c202e7068706262202e70616e656c206833207b0a096d617267696e3a20303b0a0970616464696e673a20367078203020303b0a7d0a2e7068706262202e70616e656c2068323a66697273742d6368696c642c202e7068706262202e70616e656c2068333a66697273742d6368696c642c0a2e7068706262202e70616e656c202e636f726e6572732d746f70202b2068322c202e7068706262202e70616e656c202e636f726e6572732d746f70202b206833207b0a0970616464696e672d746f703a20303b0a7d0a2e7068706262202e70616e656c2070207b0a0970616464696e673a2033707820303b0a7d0a2e7068706262202e70616e656c2e7374617473202e696e6e6572207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e652035707820353025206e6f2d7265706561743b0a0970616464696e672d6c6566743a20343070783b0a7d0a2e7068706262206469762e72756c6573207370616e2b7374726f6e67207b0a09666f6e742d66616d696c793a2048656c7665746963612c20417269616c3b0a09666f6e742d73697a653a20313670783b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a0970616464696e672d626f74746f6d3a203470783b0a7d0a2e7068706262202e72756c6573207b0a096261636b67726f756e642d706f736974696f6e3a2035302520303b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a2e7068706262202e706f7374626f6479202e72756c6573207374726f6e67207b0a09666f6e742d7765696768743a206e6f726d616c3b0a7d0a0a2e706870626220236d6573736167652e70616e656c202e70616e656c2d696e6e65722c202e70687062622023636f6e6669726d202e70616e656c202e70616e656c2d696e6e6572207b0a0970616464696e673a20313070783b0a096c696e652d6865696768743a20312e35656d3b0a09666f6e742d73697a653a20313370783b0a7d0a0a2e70687062622068322e686561646572202b206469762e72756c65732c202e70687062622068322e686561646572202b202e6e61766261722c202e70687062622068322e686561646572202b202e746f7069632d616374696f6e73207b0a096d617267696e2d746f703a203470783b0a7d0a0a2e7068706262202e70616e656c2d696e6e6572202e696e6e65723a6166746572207b0a09646973706c61793a20626c6f636b3b0a09636f6e74656e743a2027273b0a09636c6561723a20626f74683b0a7d0a0a0a2f2a0a095461626c65730a2a2f0a2e7068706262207461626c652e7461626c6531207b0a096d617267696e3a2036707820303b0a0977696474683a20313030253b0a09626f726465722d636f6c6c617073653a2073657061726174653b0a09626f726465722d73706163696e673a203270783b0a7d0a2e7068706262207461626c652e7461626c65312074642c202e7068706262207461626c652e7461626c6531207468207b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d7261646975733a203570783b0a0970616464696e673a203470783b0a09766572746963616c2d616c69676e3a206d6964646c653b0a7d0a2e7068706262207461626c652e7461626c6531207468207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a7d0a2e70687062622074642e706f7374732c202e70687062622074642e696e666f207b0a09746578742d616c69676e3a2063656e7465723b0a7d0a0a2f2a0a094172726f77730a2a2f0a2e706870626220612e6c6566742c202e706870626220612e72696768742c202e706870626220612e75702c202e706870626220612e646f776e207b0a096261636b67726f756e643a206e6f6e65207472616e73706172656e74203020353025206e6f2d7265706561743b0a0970616464696e672d6c6566743a20313070783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096c696e652d6865696768743a2031656d3b0a09666f6e742d73697a653a20313270783b0a09666f6e742d66616d696c793a20417269616c3b0a097472616e736974696f6e3a206261636b67726f756e642d706f736974696f6e20302e32357320656173653b0a092d6d6f7a2d7472616e736974696f6e3a206261636b67726f756e642d706f736974696f6e20302e32357320656173653b0a092d7765626b69742d7472616e736974696f6e3a206261636b67726f756e642d706f736974696f6e20302e32357320656173653b0a092d6f2d7472616e736974696f6e3a206261636b67726f756e642d706f736974696f6e20302e32357320656173653b0a092d6d732d7472616e736974696f6e3a206261636b67726f756e642d706f736974696f6e20302e32357320656173653b0a7d0a2e706870626220612e6c6566743a686f7665722c202e706870626220612e75703a686f7665722c202e706870626220612e646f776e3a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a20327078203530253b0a7d0a2e706870626220612e72696768742c202e706870626220612e72696768742d626f782e75702c202e706870626220612e72696768742d626f782e646f776e207b0a096261636b67726f756e642d706f736974696f6e3a2031303025203530253b0a0970616464696e672d6c6566743a20303b0a0970616464696e672d72696768743a20313070783b0a7d0a2e706870626220612e72696768743a686f7665722c202e706870626220612e72696768742d626f782e75703a686f7665722c202e706870626220612e72696768742d626f782e646f776e3a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a2063616c632831303025202d2032707829203530253b0a096261636b67726f756e642d706f736974696f6e3a202d6d6f7a2d63616c632831303025202d2032707829203530253b0a7d0a2e7068706262202e7375626d69742d627574746f6e7320612e7570207b0a096d617267696e2d746f703a203670783b0a7d0a0a0a2f2a0a09506167696e6174696f6e2c20746f70696320616374696f6e732c207265706f727465642f756e617070726f76656420706f7374730a2a2f0a2e7068706262202e646973706c61792d6f7074696f6e73207b0a09746578742d616c69676e3a2063656e7465723b0a09636c6561723a20626f74683b0a7d0a2e7068706262202e646973706c61792d6f7074696f6e732061207b0a096d617267696e2d746f703a203670783b0a7d0a2e7068706262202e706167696e6174696f6e207b0a096d617267696e3a20303b0a0970616464696e673a20303b0a096c696e652d6865696768743a2031656d3b0a7d0a2e696537202e7068706262202e746f7069632d616374696f6e73207b0a096d696e2d6865696768743a20323870783b0a7d0a2e7068706262202e746f7069632d616374696f6e73202e706167696e6174696f6e207b0a09666c6f61743a2072696768743b0a0970616464696e672d6c6566743a203670783b0a0970616464696e672d746f703a203470783b0a7d0a2e7068706262202e726f77202e706167696e6174696f6e207b0a09666c6f61743a2072696768743b0a7d0a2e7068706262202e706167696e6174696f6e207370616e2e706167652d7365702c202e7068706262202e706167696e6174696f6e207370616e2e706167652d646f7473207b20646973706c61793a206e6f6e653b207d0a2e7068706262202e706167696e6174696f6e207370616e20612c202e7068706262202e706167696e6174696f6e207370616e207374726f6e67207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a096d617267696e3a2030203170783b0a09746578742d616c69676e3a2063656e7465723b0a096d696e2d77696474683a20313070783b0a0970616464696e673a2032707820337078203370783b0a09626f726465722d7261646975733a203570783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a09666f6e742d7765696768743a206e6f726d616c3b0a096261636b67726f756e642d706f736974696f6e3a2030203530253b0a096261636b67726f756e642d7265706561743a207265706561742d783b0a7d0a2e7068706262202e706167696e6174696f6e207370616e207374726f6e67207b20706f696e7465722d6576656e74733a206e6f6e653b207d0a0a2e706870626220612e756e617070726f7665642c202e706870626220612e7265706f72746564207b0a09666c6f61743a2072696768743b0a09646973706c61793a20626c6f636b3b0a096d617267696e2d746f703a202d3270783b0a0970616464696e672d6c6566743a203670783b0a096f7061636974793a20302e383b0a7d0a2e706870626220612e756e617070726f76656420696d672c202e706870626220612e7265706f7274656420696d67207b0a09646973706c61793a20626c6f636b3b0a7d0a2e706870626220612e756e617070726f7665643a686f7665722c202e706870626220612e7265706f727465643a686f766572207b0a096f7061636974793a20313b0a7d0a2e7068706262206469762e627574746f6e73207b0a09666c6f61743a206c6566743b0a7d0a2e7068706262202e696e6e6572203e206469762e627574746f6e73207b0a09666c6f61743a206e6f6e653b0a7d0a2e7068706262206469762e627574746f6e73203e20646976207b0a096d617267696e2d72696768743a203570783b0a09666c6f61743a206c6566743b0a7d0a2e7068706262202e746f7069632d616374696f6e73202e7365617263682d626f78207b0a09666c6f61743a206c6566743b0a0970616464696e672d746f703a203370783b0a7d0a0a2e706870626220236a756d70626f782c202e7068706262202e6a756d70626f782c202e706870626220236a756d70626f78202b20666f726d2c202e7068706262202e6a732d6a756d70626f78207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a09636c6561723a2072696768743b0a096d617267696e3a2034707820303b0a7d0a2e7068706262202e6a756d70626f782d6a73206c6162656c207b0a09666c6f61743a206c6566743b0a09646973706c61793a20626c6f636b3b0a0970616464696e672d746f703a20313170783b0a0970616464696e672d72696768743a203470783b0a7d0a0a2f2a0a09506f7374696e6720666f726d0a2a2f0a2e70687062622023666f726d61742d627574746f6e73207b0a0970616464696e673a2032707820303b0a7d0a2e70687062622023736d696c65792d626f78207b0a09666c6f61743a2072696768743b0a0977696474683a2032303070783b0a7d0a2e706870626220236d6573736167652d626f78207b0a096d617267696e2d72696768743a2032313070783b0a7d0a2e7068706262202371725f656469746f725f64697620236d6573736167652d626f78207b0a096d617267696e2d72696768743a20303b0a7d0a2e706870626220236d6573736167652d626f78207465787461726561207b0a0977696474683a203938253b0a0977696474683a2063616c632831303025202d20367078293b0a0977696474683a202d6d6f7a2d63616c632831303025202d20367078293b0a7d0a0a2e706870626220702e6572726f722c202e70687062622064642e6572726f72207b0a0970616464696e673a203670783b0a7d0a0a2f2a0a09506f6c6c0a2a2f0a2e7068706262202e706f6c6c73207b0a096d617267696e3a20347078203020303b0a7d0a2e7068706262202e706f6c6c7320646c207b0a09646973706c61793a207461626c653b0a0977696474683a20313030253b0a09626f726465722d746f703a2031707820736f6c6964207472616e73706172656e743b0a7d0a2e7068706262202e706f6c6c7320646c2e766f746573207b0a09626f726465722d746f702d77696474683a20303b0a7d0a2e7068706262202e706f6c6c732064742c202e7068706262202e706f6c6c73206464207b0a09646973706c61793a207461626c652d63656c6c3b0a096d617267696e3a20303b0a0970616464696e673a20347078203020347078203470783b0a7d0a2e7068706262202e706f6c6c73206474207b0a0977696474683a203935253b0a09636c6561723a206c6566743b0a0970616464696e672d6c6566743a20303b0a7d0a2e7068706262202e706f6c6c73206464207b0a0977696474683a203230253b0a7d0a2e7068706262202e706f6c6c732064642e726573756c74626172207b0a0977696474683a203530253b0a0970616464696e672d6c6566743a20313070783b0a0970616464696e672d72696768743a20313070783b0a7d0a0a2e696537202e7068706262202e706f6c6c7320646c2c202e696537202e7068706262202e706f6c6c732064742c202e696537202e7068706262202e706f6c6c73206464207b0a09646973706c61793a20626c6f636b3b0a7d0a2e696537202e7068706262202e706f6c6c732064742c202e696537202e7068706262202e706f6c6c73206464207b0a09666c6f61743a206c6566743b0a7d0a2e696537202e7068706262202e706f6c6c73206474207b0a0977696474683a203330253b0a7d0a2e696537202e7068706262202e706f6c6c73206464207b0a0977696474683a203130253b0a7d0a2e696537202e7068706262202e706f6c6c732064642e726573756c74626172207b0a0977696474683a203435253b0a7d0a0a2e7068706262202e706f6c6c732064642e726573756c74626172203e20646976207b0a096d696e2d77696474683a20313070783b0a0970616464696e673a2033707820347078203270783b0a09626f726465723a2030707820736f6c6964207472616e73706172656e743b0a09626f726465722d7261646975733a203670783b0a09746578742d616c69676e3a2072696768743b0a096c696e652d6865696768743a2031656d3b0a09666f6e742d73697a653a20313270783b0a09666f6e742d66616d696c793a20417269616c3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203020353025207265706561742d783b0a7d0a0a2e7068706262202e706f6c6c7320646c2e766f746573206474207b200a09646973706c61793a206e6f6e653b200a7d0a2e7068706262202e706f6c6c7320646c2e766f746573206464207b200a09746578742d616c69676e3a2063656e7465723b0a0977696474683a20313030253b0a0970616464696e672d746f703a20303b0a7d0a2e7068706262202e636f6e74656e7420702e617574686f72207b0a09636f6c6f723a20233830383038303b0a7d0a0a0a2f2a0a09506f7374730a2a2f0a2e7068706262202e706f73742b68722e64697669646572207b0a09646973706c61793a206e6f6e653b0a7d0a0a2e706870626220702e617574686f72207b0a09666f6e742d73697a653a20313270783b0a096c696e652d6865696768743a20312e35656d3b0a0970616464696e673a20303b0a7d0a0a2e7068706262202e706f7374207b0a096d617267696e3a2036707820303b0a09636c6561723a20626f74683b0a09706f736974696f6e3a2072656c61746976653b0a7d0a2e7068706262202e706f73742d636f6e74656e742d77726170207b0a09646973706c61793a207461626c653b0a0977696474683a20313030253b0a096d61782d77696474683a20313030253b0a7d0a2e7068706262202e706f73742d636f6e74656e742d77726170203e207370616e207b0a09646973706c61793a206e6f6e653b0a7d0a2e7068706262202e706f73742d636f6e74656e742d77726170203e202e706f7374626f6479207b0a09646973706c61793a207461626c652d63656c6c3b0a09766572746963616c2d616c69676e3a20746f703b0a0977696474683a20313030253b0a0970616464696e672d626f74746f6d3a20313070783b0a7d0a2e7068706262202e70726f66696c65202b202e706f7374626f6479207b0a09626f726465722d6c6566743a2031707820736f6c6964207472616e73706172656e743b0a0970616464696e672d6c6566743a20313070783b0a0970616464696e672d72696768743a203670783b0a7d0a2e7068706262202e706f7374207b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d7261646975733a203670783b0a0970616464696e673a20303b0a09776f72642d777261703a20627265616b2d776f72643b0a7d0a2e7068706262202e706f73742d636f6e74656e742d77726170203e202e706f737470726f66696c652c202e7068706262202e706f73742d636f6e74656e742d77726170203e202e70726f66696c65207b0a09646973706c61793a207461626c652d63656c6c3b0a09766572746963616c2d616c69676e3a20746f703b0a096d696e2d77696474683a2031393070783b0a09766572746963616c2d616c69676e3a20746f703b0a0970616464696e672d626f74746f6d3a20313070783b0a7d0a2e7068706262202e706f7374202e706f737470726f66696c65207b0a0970616464696e673a2030203470782034707820303b0a09776f72642d777261703a20627265616b2d776f72643b0a7d0a0a2e696537202e7068706262202e706f73742d636f6e74656e742d77726170207b0a09646973706c61793a20626c6f636b3b0a7d0a2e696537202e7068706262202e706f73742d636f6e74656e742d77726170203e202e70726f66696c65207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a0977696474683a2031393070783b0a7d0a2e696537202e7068706262202e706f73742d636f6e74656e742d77726170203e202e706f7374626f6479207b0a09646973706c61793a20626c6f636b3b0a096d617267696e2d6c6566743a2032303070783b0a09636c6561723a206e6f6e653b0a0977696474683a206175746f3b0a7d0a2e696537202e70687062622023746f706963726576696577202e706f7374202e706f7374626f64792c202e696537202e70687062622023707265766965772e706f7374202e706f7374626f6479207b0a096d617267696e2d6c6566743a20303b0a7d0a0a2e7068706262202e706f7374202e6261636b32746f70207b0a09646973706c61793a20626c6f636b3b0a09706f736974696f6e3a206162736f6c7574653b0a097a2d696e6465783a20323b0a0972696768743a203870783b0a09626f74746f6d3a203670783b0a7d0a2e7068706262202e706f7374202e6261636b32746f702061207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a0970616464696e672d72696768743a20313470783b0a09666f6e742d73697a653a20313170783b0a0977686974652d73706163653a206e6f777261703b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203130302520353025206e6f2d7265706561743b0a7d0a0a2e7068706262202e706f7374202e636f6e74656e74207b0a0970616464696e672d626f74746f6d3a203470783b0a09776f72642d777261703a20627265616b2d776f72643b0a096f766572666c6f773a2068696464656e3b0a7d0a0a2e7068706262202e706f737470726f66696c65206474207b0a09746578742d616c69676e3a2063656e7465723b0a09666f6e742d73697a653a20313670783b0a09666f6e742d66616d696c793a20417269616c3b0a096c696e652d6865696768743a20312e32656d3b0a0970616464696e672d746f703a203170783b0a0977686974652d73706163653a206e6f777261703b0a7d0a2e7068706262202e706f737470726f66696c6520647420612c202e7068706262202e706f737470726f66696c6520647420613a76697369746564207b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a2e7068706262202e706f737470726f66696c6520647420613a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a2e7068706262202e706f737470726f66696c65206474202e706f707570207b0a09746f703a20323070783b0a7d0a2e7068706262202e706f737470726f66696c65206474202e706f7075702061207b0a096d696e2d77696474683a2031363270783b0a7d0a2e7068706262202e706f737470726f66696c65206464207b0a09666f6e742d73697a653a20313170783b0a096c696e652d6865696768743a20312e31656d3b0a0970616464696e673a203470782036707820303b0a7d0a2e7068706262202e706f737470726f66696c652064642e706f737465722d72616e6b207b0a09746578742d616c69676e3a2063656e7465723b0a0970616464696e672d746f703a20303b0a0977686974652d73706163653a206e6f777261703b0a7d0a2e7068706262202e706f737465722d617661746172207b0a09746578742d616c69676e3a2063656e7465723b0a096d617267696e3a20347078203130707820347078203670783b0a0970616464696e673a20347078203020303b0a7d0a2e7068706262202e706f737465722d6176617461722e656d707479207370616e207b0a09646973706c61793a20626c6f636b3b0a096d696e2d6865696768743a20393070783b0a096d696e2d77696474683a20393070783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203530252030206e6f2d7265706561743b0a096f7061636974793a20302e383b0a097472616e736974696f6e3a206f70616369747920302e32357320656173653b0a092d6d6f7a2d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a092d7765626b69742d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a092d6f2d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a092d6d732d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a7d0a2e7068706262202e706f73743a686f766572202e706f737465722d6176617461722e656d707479207370616e207b0a096f7061636974793a20313b0a7d0a0a2e7068706262202e6f6e6c696e65202e706f737465722d617661746172207b0a0970616464696e672d746f703a20313670783b0a096d696e2d77696474683a20393070783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e65203530252030206e6f2d7265706561743b0a7d0a0a2e7068706262202e706f7374626f64792068332c202e7068706262202e636f6e74656e742068323a66697273742d6368696c64207b0a09636c6561723a206e6f6e653b0a096d617267696e3a20303b0a0970616464696e673a203370782030203170783b0a7d0a2e7068706262202e706f7374626f6479202e617574686f72207b0a09666f6e742d73697a653a20313170783b0a096d617267696e3a20302030203670783b0a7d0a2e7068706262202e706f7374626f6479202e617574686f7220696d67207b0a096d617267696e2d72696768743a203270783b0a7d0a0a2e7068706262202e706f7374626f6479202e736561726368726573756c7473207b0a09666c6f61743a2072696768743b0a09746578742d616c69676e3a2072696768743b0a7d0a0a2f2a0a09506f737420627574746f6e730a2a2f0a2e7068706262202e706f7374626f6479202e70726f66696c652d69636f6e73207b0a09666c6f61743a2072696768743b0a7d0a2e7068706262202e706f7374626f6479202e70726f66696c652d69636f6e73206c69207b0a09666c6f61743a206c6566743b0a0977696474683a206175746f2021696d706f7274616e743b0a096261636b67726f756e643a206e6f6e652021696d706f7274616e743b0a7d0a0a2e7068706262202e70726f66696c652d69636f6e732061207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a096d617267696e3a203020302030203470783b0a0970616464696e673a20303b0a09746578742d6465636f726174696f6e3a206e6f6e652021696d706f7274616e743b0a0977696474683a20323170783b0a096865696768743a20323170783b0a096f766572666c6f773a2068696464656e3b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b0a096f75746c696e652d7374796c653a206e6f6e653b0a7d0a2e7068706262202e70726f66696c652d69636f6e7320613a686f7665722c202e7068706262202e70726f66696c652d69636f6e7320613a616374697665207b0a096f75746c696e652d7374796c653a206e6f6e653b0a7d0a2e7068706262202e70726f66696c652d69636f6e73207370616e207b0a09646973706c61793a206e6f6e653b0a7d0a0a2e7068706262202e70726f66696c652d69636f6e73202e656469742d69636f6e2061207b0a0977696474683a20353870783b0a096261636b67726f756e642d706f736974696f6e3a2030202d323170783b0a7d0a2e7068706262202e70726f66696c652d69636f6e73202e71756f74652d69636f6e2061207b0a0977696474683a20363970783b0a7d0a2e7068706262202e70726f66696c652d69636f6e73202e64656c6574652d69636f6e2061207b0a096261636b67726f756e642d706f736974696f6e3a2030202d343270783b0a7d0a2e7068706262202e70726f66696c652d69636f6e73202e696e666f2d69636f6e2061207b0a096261636b67726f756e642d706f736974696f6e3a202d32317078202d343270783b0a7d0a2e7068706262202e70726f66696c652d69636f6e73202e7265706f72742d69636f6e2061207b0a096261636b67726f756e642d706f736974696f6e3a202d34327078202d343270783b0a7d0a2e7068706262202e70726f66696c652d69636f6e73202e7761726e2d69636f6e2061207b0a096261636b67726f756e642d706f736974696f6e3a202d36337078202d343270783b0a7d0a0a2f2a0a094f746865722069636f6e730a2a2f0a2e7068706262202e70726f66696c652d69636f6e73203e206c692e706d2d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e656d61696c2d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e7765622d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6d736e6d2d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6963712d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e7961686f6f2d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e61696d2d69636f6e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6a61626265722d69636f6e207b0a09646973706c61793a206e6f6e653b0a7d0a0a2e7068706262202e70726f66696c652d69636f6e73203e206c692e706d2d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e656d61696c2d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e7765622d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6d736e6d2d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6963712d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e7961686f6f2d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e61696d2d69636f6e20612c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6a61626265722d69636f6e2061207b0a09646973706c61793a20696e6c696e653b0a0977696474683a206175746f3b0a096865696768743a206175746f3b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e742021696d706f7274616e743b0a096261636b67726f756e642d696d6167653a206e6f6e652021696d706f7274616e743b0a09746578742d6465636f726174696f6e3a20756e6465726c696e652021696d706f7274616e743b0a7d0a2e7068706262202e70726f66696c652d69636f6e73203e206c692e706d2d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e656d61696c2d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e7765622d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6d736e6d2d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6963712d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e7961686f6f2d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e61696d2d69636f6e207370616e2c202e7068706262202e70726f66696c652d69636f6e73203e206c692e6a61626265722d69636f6e207370616e207b0a09646973706c61793a20696e6c696e653b0a7d0a0a2f2a0a09506f737420636f6e74656e740a2a2f0a2e7068706262202e706f7374626f6479202e636f6e74656e74207b0a09666f6e742d73697a653a20313370783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a0a2e7068706262202e706f7374626f647920696d672c202e7068706262202e706f7374626f6479202e6174746163682d696d616765207b0a096d61782d77696474683a2036343070783b0a096f766572666c6f773a206175746f3b0a7d0a2e7068706262202e706f7374626f6479202e6174746163682d696d61676520696d67207b0a096d61782d77696474683a206e6f6e653b0a7d0a2e7068706262202e706f7374626f6479202e72756c6573207b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a096d617267696e3a2035707820323070783b0a0970616464696e673a20303b0a09666f6e742d73697a653a20313270783b0a7d0a2e7068706262202e706f7374626f6479202e72756c657320696d67207b0a09766572746963616c2d616c69676e3a20746f703b0a7d0a2e7068706262202e706f7374626f6479202e72756c65732061207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a0970616464696e672d746f703a203270783b0a09666f6e742d7765696768743a20626f6c643b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a2e7068706262202e706f7374626f6479202e72756c657320613a686f766572207b0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0a7d0a0a2e7068706262202e7369676e6174757265207b0a09666f6e742d73697a653a20313270783b0a09626f726465722d746f703a2031707820736f6c6964207472616e73706172656e743b0a0970616464696e672d746f703a203470783b0a096d617267696e2d746f703a20313070783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e7068706262202e706f7374626f6479202e6e6f74696365207b0a09666f6e742d73697a653a20313270783b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a096d617267696e3a2031307078203020303b0a09626f726465722d7261646975733a203670783b0a0970616464696e673a203470783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e7068706262202e706f7374626f6479202e6e6f746963653a6c6173742d6368696c64207b0a096d617267696e2d626f74746f6d3a203870783b0a7d0a0a2f2a0a094242436f64650a2a2f0a2e706870626220626c6f636b71756f74652c202e7068706262202e617474616368626f782c202e7068706262202e636f6465626f782c202e7068706262202e696e6c696e652d6174746163686d656e74207b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a096d617267696e3a2035707820323070783b0a0970616464696e673a203470783b0a7d0a2e706870626220626c6f636b71756f7465207b0a09666f6e742d73697a653a20313270783b0a7d0a2e706870626220626c6f636b71756f746520636974652c202e7068706262202e617474616368626f782064742c202e7068706262202e636f6465626f78206474207b0a09646973706c61793a20626c6f636b3b0a096c696e652d6865696768743a2031656d3b0a09626f726465722d626f74746f6d3a2031707820736f6c6964207472616e73706172656e743b0a096d617267696e2d626f74746f6d3a203470783b0a0970616464696e673a203270782030203670783b0a7d0a2e7068706262202e66696c65206474207b0a09626f726465722d626f74746f6d2d77696474683a20303b0a096d617267696e3a20303b0a0970616464696e672d626f74746f6d3a203670783b0a7d0a2e7068706262202e636f6465626f782064742061207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a7d0a0a2e7068706262202e636f6e74656e7420756c207b0a202020206c6973742d7374796c652d747970653a20646973633b0a7d0a2e7068706262202e636f6e74656e74206f6c207b0a202020206c6973742d7374796c652d747970653a20646563696d616c3b0a7d0a2e7068706262202e636f6e74656e74206c69207b0a20202020646973706c61793a206c6973742d6974656d3b0a202020206d617267696e3a20302030203020323070783b0a7d0a0a2e7068706262202e636f6e74656e7420756c20756c2c202e7068706262202e636f6e74656e74206f6c20756c207b0a202020206c6973742d7374796c652d747970653a20636972636c653b0a7d0a0a2e7068706262202e636f6e74656e74206f6c206f6c20756c2c202e7068706262202e636f6e74656e74206f6c20756c20756c2c202e7068706262202e636f6e74656e7420756c206f6c20756c2c202e7068706262202e636f6e74656e7420756c20756c20756c207b0a202020206c6973742d7374796c652d747970653a207371756172653b0a7d200a0a2f2a0a09466f726d730a2a2f0a2e7068706262206669656c64736574207b0a096c696e652d6865696768743a20312e31656d3b0a7d0a2e7068706262206669656c6473657420646c207b0a0970616464696e673a2034707820303b0a09636c6561723a206c6566743b0a7d0a2e696537202e7068706262206669656c6473657420646c207b0a096865696768743a2031253b0a7d0a2e7068706262206669656c64736574206474207b0a09666c6f61743a206c6566743b0a0977696474683a203430253b0a7d0a2e7068706262206669656c647365742e6669656c647331206474207b0a0977696474683a2031383070783b0a7d0a2e7068706262206669656c64736574206464207b0a096d617267696e2d626f74746f6d3a203370783b0a096d617267696e2d6c6566743a203431253b0a09766572746963616c2d616c69676e3a20746f703b0a7d0a2e7068706262206669656c647365742e6669656c647331206464207b0a096d617267696e2d6c6566743a2031383570783b0a7d0a0a2f2a0a094c697374730a2a2f0a2e7068706262202e6c696e6b6c697374206c69207b0a09666c6f61743a206c6566743b0a7d0a2e7068706262202e6c696e6b6c697374206c692e726967687473696465207b0a09666c6f61743a2072696768743b0a7d0a0a2f2a0a09546162730a2a2f0a2e706870626220237461627320756c2c202e706870626220236d696e697461627320756c207b0a09636c6561723a20626f74683b0a09646973706c61793a20626c6f636b3b0a096d617267696e3a203130707820367078202d3670783b0a7d0a2e696537202e706870626220237461627320756c2c202e696537202e706870626220236d696e697461627320756c207b0a096865696768743a2031253b0a7d0a2e706870626220237461627320756c2e6d61696e2d746162732c202e70687062622023746162732e63702d7461627320756c207b0a096d617267696e2d626f74746f6d3a20303b0a7d0a2e70687062622023746162732e63702d7461627320756c207b0a096d617267696e2d6c6566743a20303b0a7d0a2e706870626220237461627320756c202b20756c207b0a096d617267696e2d746f703a203270783b0a7d0a2e7068706262202374616273206c692c202e706870626220236d696e6974616273206c69207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a096d617267696e3a2030203170783b0a0970616464696e673a20303b0a7d0a2e7068706262202374616273206c6920612c202e706870626220236d696e6974616273206c692061207b0a09646973706c61793a20626c6f636b3b0a0970616464696e673a20357078203670783b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a09626f726465722d626f74746f6d2d77696474683a20303b0a09626f726465722d746f702d6c6566742d7261646975733a203670783b0a09626f726465722d746f702d72696768742d7261646975733a203670783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a2e7068706262202374616273202e6d61696e2d74616273206c6920612c202e70687062622023746162732e63702d74616273206c692061207b0a09626f726465722d626f74746f6d2d77696474683a203170783b0a09626f726465722d7261646975733a203670783b0a7d0a0a2f2a0a09436f6e74726f6c2070616e656c0a2a2f0a2e7068706262202e63702d636f6e74656e74207b0a09636c6561723a20626f74683b0a7d0a0a2e7068706262202e63702d6d696e69207b0a09666c6f61743a206c6566743b0a096d617267696e3a203570783b0a096d617267696e2d6c6566743a20303b0a0970616464696e673a203570783b0a7d0a2e706870626220646c2e6d696e69207b0a096d61782d6865696768743a2031343070783b0a096d696e2d77696474683a2031343070783b0a096d696e2d6865696768743a20363070783b0a096f766572666c6f773a206175746f3b0a7d0a2e706870626220646c2e6d696e69206474207b0a0970616464696e672d626f74746f6d3a203370783b0a7d0a0a2e7068706262202363702d6d61696e207b0a09636c6561723a20626f74683b0a7d0a0a2e706870626220646c2e706d6c697374206474207b0a0977696474683a203430252021696d706f7274616e743b0a7d0a2e706870626220646c2e706d6c697374206474207465787461726561207b0a0977696474683a203939253b0a0977696474683a2063616c632831303025202d20367078293b0a0977696474683a202d6d6f7a2d63616c632831303025202d20367078293b0a7d0a2e706870626220646c2e706d6c697374206464207b0a096d617267696e2d626f74746f6d3a203270783b0a096d617267696e2d6c6566743a203431252021696d706f7274616e743b0a7d0a0a2e7068706262202e706d2d6c6567656e64207b0a09626f726465722d6c6566743a203130707820736f6c6964207472616e73706172656e743b0a0970616464696e673a203470783b0a0977686974652d73706163653a206e6f777261703b0a7d0a2e7068706262202e746f7069636c6973742e706d6c697374203e206c69203e20646c207b0a0970616464696e672d6c6566743a203470783b0a09626f782d73697a696e673a20626f726465722d626f783b0a092d6d6f7a2d626f782d73697a696e673a20626f726465722d626f783b0a092d7765626b69742d626f782d73697a696e673a20626f726465722d626f783b0a7d0a2e7068706262202e746f7069636c6973742e706d6c697374203e206c69203e20646c206474207b0a09626f726465722d6c6566743a2034707820736f6c6964207472616e73706172656e743b0a7d0a2e7068706262202e746f7069636c6973742e706d6c697374203e206c69203e20646c2e69636f6e207b0a096261636b67726f756e642d706f736974696f6e3a2031357078203530253b0a7d0a2e7068706262202e746f7069636c6973742e706d6c697374203e206c69203e20646c206474207b0a0970616464696e672d6c6566743a20343470783b0a096261636b67726f756e642d706f736974696f6e3a20397078203830253b0a7d0a0a2e706870626220646c2e64657461696c73207b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e7068706262207370616e2e636f726e6572732d746f70202b20646c2e64657461696c732e6c6566742d626f78207b0a0977696474683a20313030252021696d706f7274616e743b0a7d0a2e706870626220646c2e64657461696c73206474207b0a09636c6561723a206c6566743b0a09666c6f61743a206c6566743b0a0977696474683a203330253b0a09746578742d616c69676e3a2072696768743b0a7d0a2e706870626220646c2e64657461696c73206464207b0a09666c6f61743a206c6566743b0a0977696474683a203635253b0a096d617267696e3a20302030203570783b0a0970616464696e672d6c6566743a203570783b0a7d0a0a2f2a0a0947726f7570730a2a2f0a2e7068706262207461626c652e7461626c6531202e6e616d65207b0a09746578742d616c69676e3a206c6566743b0a7d0a2e7068706262207461626c652e7461626c6531207370616e2e72616e6b2d696d67207b0a09666c6f61743a2072696768743b0a7d0a0a2f2a0a094641510a2a2f0a2e706870626220646c2e666171207b0a0970616464696e672d746f703a203670783b0a096c696e652d6865696768743a20312e35656d3b0a7d0a2e706870626220646c2e6661713a66697273742d6368696c64207b0a0970616464696e672d746f703a20303b0a7d0a2e706870626220646c2e666171206474207b0a0970616464696e672d626f74746f6d3a203470783b0a09666f6e742d73697a653a20313370783b0a096c696e652d6865696768743a20312e35656d3b0a09666f6e742d7765696768743a20626f6c643b0a7d0a2e706870626220236661716c696e6b73202e636f6c756d6e312c202e706870626220236661716c696e6b73202e636f6c756d6e32207b0a09666c6f61743a206c6566743b0a0977696474683a203439253b0a7d0a0a2f2a0a09417661746172732067616c6c6572790a2a2f0a2e7068706262202367616c6c657279206c6162656c207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a206c6566743b0a096d617267696e3a20313070783b0a0970616464696e673a203570783b0a09746578742d616c69676e3a2063656e7465723b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a7d0a0a2f2a0a0952535320666565640a2a2f0a2e706870626220612e666565642d69636f6e2d666f72756d207b0a09646973706c61793a20626c6f636b3b0a09666c6f61743a2072696768743b0a0977696474683a20303b0a096865696768743a20303b0a096f766572666c6f773a2068696464656e3b0a096d617267696e3a20303b0a0970616464696e673a20313870782030203020313870783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b0a7d0a2e706870626220612e666565642d69636f6e2d666f72756d3a686f766572207b0a096261636b67726f756e642d706f736974696f6e3a2030202d323070783b0a7d0a0a2f2a0a095472616e736974696f6e730a2a2f0a2e7068706262202e746f7069636c697374203e206c692c202e70687062622068322e6865616465722d6f757465722c202e7068706262207461626c652e7461626c65312074682c200a2e7068706262202e657870616e6461626c65202e6865616465723a61667465722c202e7068706262202e6d656e75206c692e657870616e6461626c653a61667465722c0a2e7068706262202e627574746f6e7320612c202e706870626220612e627574746f6e2c202e7068706262202e627574746f6e732061207370616e2c202e706870626220612e627574746f6e207370616e2c0a2e706870626220696e7075745b747970653d227375626d6974225d2c202e7068706262202e627574746f6e312c202e7068706262202e627574746f6e322c0a2e7068706262202e706167696e6174696f6e207370616e20612c202e7068706262202e706167696e6174696f6e207370616e207374726f6e672c0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e2c202e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b2c202e7068706262202e6865616465722d6c6f67696e2c202e7068706262202e666f6f746572202e617274792c202e7068706262202e666f6f746572202e70687062622d67726f75702c0a2e7068706262202e70726f66696c652d69636f6e732061207b0a202020207472616e736974696f6e3a206261636b67726f756e642d636f6c6f7220302e32357320656173653b0a202020202d7765626b69742d7472616e736974696f6e3a206261636b67726f756e642d636f6c6f7220302e32357320656173653b0a202020202d6d6f7a2d7472616e736974696f6e3a206261636b67726f756e642d636f6c6f7220302e32357320656173653b0a202020202d6f2d7472616e736974696f6e3a206261636b67726f756e642d636f6c6f7220302e32357320656173653b0a202020202d6d732d7472616e736974696f6e3a206261636b67726f756e642d636f6c6f7220302e32357320656173653b0a7d0a0a2e7068706262202e72756c6573207b0a202020207472616e736974696f6e3a20626f726465722d636f6c6f7220302e32357320656173653b0a202020202d7765626b69742d7472616e736974696f6e3a20626f726465722d636f6c6f7220302e32357320656173653b0a202020202d6d6f7a2d7472616e736974696f6e3a20626f726465722d636f6c6f7220302e32357320656173653b0a202020202d6f2d7472616e736974696f6e3a20626f726465722d636f6c6f7220302e32357320656173653b0a202020202d6d732d7472616e736974696f6e3a20626f726465722d636f6c6f7220302e32357320656173653b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2061207b0a202020207472616e736974696f6e3a20636f6c6f7220302e32357320656173653b0a202020202d7765626b69742d7472616e736974696f6e3a20636f6c6f7220302e32357320656173653b0a202020202d6d6f7a2d7472616e736974696f6e3a20636f6c6f7220302e32357320656173653b0a202020202d6f2d7472616e736974696f6e3a20636f6c6f7220302e32357320656173653b0a202020202d6d732d7472616e736974696f6e3a20636f6c6f7220302e32357320656173653b0a7d0a0a2e7068706262202e746f7069636c697374203e206c692c202e7068706262207461626c652e7461626c65312074682c202e7068706262202e657870616e6461626c65202e6865616465723a61667465722c202e7068706262202e6d656e75206c692e657870616e6461626c653a61667465722c202e7068706262202e666f6f746572202e617274792c202e7068706262202e666f6f746572202e70687062622d67726f75702c202e7068706262202e6865616465722d6c6f67696e207b0a097472616e736974696f6e2d70726f70657274793a206261636b67726f756e642d636f6c6f722c20626f726465722d636f6c6f722c206f7061636974792c20636f6c6f723b0a092d7765626b69742d7472616e736974696f6e2d70726f70657274793a206261636b67726f756e642d636f6c6f722c20626f726465722d636f6c6f722c206f7061636974792c20636f6c6f723b0a092d6d6f7a2d7472616e736974696f6e2d70726f70657274793a206261636b67726f756e642d636f6c6f722c20626f726465722d636f6c6f722c206f7061636974792c20636f6c6f723b0a092d6f2d7472616e736974696f6e2d70726f70657274793a206261636b67726f756e642d636f6c6f722c20626f726465722d636f6c6f722c206f7061636974792c20636f6c6f723b0a092d6d732d7472616e736974696f6e2d70726f70657274793a206261636b67726f756e642d636f6c6f722c20626f726465722d636f6c6f722c206f7061636974792c20636f6c6f723b0a7d0a0a2f2a0a09426f7865730a2a2f0a2e7068706262202e746f7069636c697374203e206c692e726f772d6f757465722c202e7068706262202e70616e656c2d6f757465722c202e7068706262202e706f73742d6f75746572207b0a09626f726465722d77696474683a20303b0a0970616464696e673a20303b0a09626f726465722d7261646975733a20303b0a096261636b67726f756e642d706f736974696f6e3a2035302520303b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a097a6f6f6d3a20313b0a7d0a0a2e7068706262202e726f772d696e6e65722c202e7068706262202e70616e656c2d696e6e65722c202e7068706262202e706f73742d696e6e6572207b0a096d696e2d6865696768743a20313270783b0a7d0a0a2e7068706262202e726f772d777261702e726f772d746f702c202e7068706262202e726f772d777261702e726f772d626f74746f6d2c0a2e7068706262202e70616e656c2d777261702e726f772d746f702c202e7068706262202e70616e656c2d777261702e726f772d626f74746f6d2c0a2e7068706262202e706f73742d777261702e726f772d746f702c202e7068706262202e706f73742d777261702e726f772d626f74746f6d207b0a09646973706c61793a20626c6f636b3b0a096865696768743a203570783b0a09706f736974696f6e3a2072656c61746976653b0a096d617267696e3a2030203570783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a097a6f6f6d3a20313b0a7d0a2e7068706262202e726f772d777261702e726f772d746f70207370616e2c202e7068706262202e726f772d777261702e726f772d626f74746f6d207370616e2c0a2e7068706262202e70616e656c2d777261702e726f772d746f70207370616e2c202e7068706262202e70616e656c2d777261702e726f772d626f74746f6d207370616e2c0a2e7068706262202e706f73742d777261702e726f772d746f70207370616e2c202e7068706262202e706f73742d777261702e726f772d626f74746f6d207370616e207b0a09706f736974696f6e3a206162736f6c7574653b0a0977696474683a203570783b0a096865696768743a203570783b0a09746f703a20303b0a09626f74746f6d3a20303b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b0a097a6f6f6d3a20313b0a7d0a2e7068706262202e726f772d746f70207370616e2e726f772d6c6566742c202e7068706262202e726f772d626f74746f6d207370616e2e726f772d6c656674207b0a096c6566743a202d3570783b0a7d0a2e7068706262202e726f772d746f70207370616e2e726f772d72696768742c202e7068706262202e726f772d626f74746f6d207370616e2e726f772d7269676874207b0a0972696768743a202d3570783b0a7d0a2e7068706262202e726f772d777261702e726f772d746f702c202e7068706262202e726f772d777261702e726f772d746f70207370616e2c0a2e7068706262202e70616e656c2d777261702e726f772d746f702c202e7068706262202e70616e656c2d777261702e726f772d746f70207370616e2c0a2e7068706262202e706f73742d777261702e726f772d746f702c202e7068706262202e706f73742d777261702e726f772d746f70207370616e207b200a096261636b67726f756e642d706f736974696f6e3a2030202d3970783b200a7d0a0a2e7068706262202e726f772d777261702e726f772d6c6566742c202e7068706262202e70616e656c2d777261702e726f772d6c6566742c202e7068706262202e706f73742d777261702e726f772d6c656674207b0a0970616464696e672d6c6566743a203570783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d793b0a097a6f6f6d3a20313b0a7d0a2e7068706262202e726f772d777261702e726f772d72696768742c202e7068706262202e70616e656c2d777261702e726f772d72696768742c202e7068706262202e706f73742d777261702e726f772d7269676874207b0a0970616464696e672d72696768743a203570783b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520313030252030207265706561742d793b0a097a6f6f6d3a20313b0a7d0a0a2f2a0a094c696e6b20746f2073776974636820746f206d6f62696c65207374796c650a2a2f0a2e6d6f62696c652d7374796c652d7377697463682061207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a0970616464696e673a203570782031307078203670783b0a09626f726465723a2031707820736f6c696420234438443844383b0a09626f726465722d7261646975733a203570783b0a096261636b67726f756e643a20234638463846383b0a09626f782d736861646f773a20236666662030203020302031707820696e7365743b0a7d0a0a2f2a0a095a6f6f6d20696e20696d6167650a2a2f0a7370616e2e7a6f6f6d2d636f6e7461696e6572207b0a09706f736974696f6e3a2072656c61746976653b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a096d696e2d6865696768743a20333470783b0a7d0a7370616e2e7a6f6f6d2d696d616765207b200a09646973706c61793a206e6f6e653b200a202020207472616e736974696f6e3a206f70616369747920302e32357320656173653b0a202020202d7765626b69742d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a202020202d6d6f7a2d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a202020202d6f2d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a202020202d6d732d7472616e736974696f6e3a206f70616369747920302e32357320656173653b0a096f7061636974793a20302e373b0a7d0a696d672e7a6f6f6d202b207370616e2e7a6f6f6d2d696d616765207b0a09646973706c61793a20626c6f636b3b0a09706f736974696f6e3a206162736f6c7574653b0a09746f703a203270783b0a096c6566743a203270783b0a0977696474683a20333070783b0a096865696768743a20333070783b0a096261636b67726f756e643a2075726c28227b545f5448454d455f504154487d2f696d616765732f7a6f6f6d2e706e67222920302030206e6f2d7265706561743b0a09637572736f723a20706f696e7465723b0a7d0a2e7a6f6f6d2d636f6e7461696e65723a686f766572207370616e2e7a6f6f6d2d696d616765207b206f7061636974793a20313b207d0a696d672e7a6f6f6d2e7a6f6f6d65642d696e202b207370616e2e7a6f6f6d2d696d616765207b200a096261636b67726f756e642d706f736974696f6e3a2030202d333070783b0a096f7061636974793a20303b0a7d0a2e7a6f6f6d2d636f6e7461696e65723a686f76657220696d672e7a6f6f6d2e7a6f6f6d65642d696e202b207370616e2e7a6f6f6d2d696d616765207b206f7061636974793a20302e373b207d0a2f2a0a09466f726d730a2a2f0a0a2e706870626220696e7075745b747970653d2274657874225d2c202e706870626220696e7075745b747970653d2270617373776f7264225d2c202e706870626220696e7075745b747970653d22656d61696c225d2c202e70687062622074657874617265612c202e70687062622073656c6563742c202e706870626220696e7075745b747970653d227375626d6974225d2c202e7068706262202e627574746f6e312c202e7068706262202e627574746f6e32207b0a096d617267696e3a20303b0a0970616464696e673a20303b0a09666f6e742d66616d696c793a2056657264616e613b0a09666f6e742d73697a653a20313370783b0a096c696e652d6865696768743a20312e32656d3b0a096f75746c696e652d7374796c653a206e6f6e653b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a096261636b67726f756e642d706f736974696f6e3a2030203530253b0a7d0a2e7068706262207465787461726561207b0a096c696e652d6865696768743a20312e34656d3b0a7d0a2e706870626220696e7075745b747970653d2274657874225d2c202e706870626220696e7075745b747970653d2270617373776f7264225d2c202e706870626220696e7075745b747970653d22656d61696c225d2c202e70687062622074657874617265612c202e706870626220696e7075745b747970653d227375626d6974225d2c202e7068706262202e627574746f6e312c202e7068706262202e627574746f6e32207b0a092d7765626b69742d617070656172616e63653a206e6f6e653b0a7d0a0a2e706870626220612e627574746f6e312c202e706870626220612e627574746f6e32207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a7d0a2e7068706262202e627574746f6e32207b0a096261636b67726f756e642d706f736974696f6e3a2031303025203530253b0a7d0a0a2e706870626220696e7075745b747970653d2274657874225d2c202e706870626220696e7075745b747970653d2270617373776f7264225d2c202e706870626220696e7075745b747970653d22656d61696c225d2c202e70687062622074657874617265612c202e70687062622073656c656374207b0a0970616464696e673a203270783b0a7d0a2e70687062622e62726f777365722d6d6f7a696c6c6120696e7075745b747970653d2274657874225d2c202e70687062622e62726f777365722d6d6f7a696c6c6120696e7075745b747970653d2270617373776f7264225d2c202e70687062622e62726f777365722d6d6f7a696c6c6120696e7075745b747970653d22656d61696c225d207b0a0970616464696e673a2031707820327078203270783b0a7d0a2e706870626220696e7075745b747970653d2274657874225d3a696e76616c69642c202e706870626220696e7075745b747970653d2270617373776f7264225d3a696e76616c69642c202e706870626220696e7075745b747970653d22656d61696c225d3a696e76616c69642c202e70687062622074657874617265613a696e76616c6964207b0a09626f782d736861646f773a206e6f6e653b0a7d0a0a2e706870626220696e7075745b747970653d227375626d6974225d2c202e7068706262202e627574746f6e312c202e7068706262202e627574746f6e32207b0a096c696e652d6865696768743a20312e34656d3b0a0970616464696e673a2032707820387078203370783b0a09637572736f723a20706f696e7465723b0a09626f726465722d77696474683a20303b0a09626f726465722d7261646975733a203570783b0a7d0a2e696537202e706870626220696e7075745b747970653d227375626d6974225d2c202e696537202e7068706262202e627574746f6e312c202e696537202e7068706262202e627574746f6e32207b0a0970616464696e672d746f703a20303b0a0970616464696e672d626f74746f6d3a203170783b0a096d617267696e2d746f703a20303b0a7d0a0a2e706870626220612e627574746f6e312c202e706870626220612e627574746f6e32207b0a096c696e652d6865696768743a2031656d3b0a0970616464696e673a20347078203130707820303b0a096865696768743a20313970783b0a7d0a2e6f6c646965202e706870626220612e627574746f6e312c202e6f6c646965202e706870626220612e627574746f6e32207b0a0970616464696e672d746f703a203570783b0a7d0a2e696537202e706870626220612e627574746f6e312c202e696537202e706870626220612e627574746f6e32207b0a0970616464696e672d746f703a203470783b0a0970616464696e672d626f74746f6d3a20303b0a7d0a2e696537202e7068706262202e6d656e7520612e627574746f6e312c202e696537202e7068706262202e6d656e7520612e627574746f6e32207b0a09706f736974696f6e3a2072656c61746976653b0a09746f703a203270783b0a7d0a0a2e706870626220696e7075745b747970653d22636865636b626f78225d2c202e706870626220696e7075745b747970653d22726164696f225d207b0a096d617267696e2d746f703a20303b0a096d617267696e2d626f74746f6d3a20303b0a7d0a0a2e70687062622073656c656374207b0a096d61782d77696474683a2032353070783b0a7d0a2e696537202e70687062622073656c656374207b0a0977696474683a2032353070783b0a7d0a0a2e7068706262206669656c647365742e7375626d69742d627574746f6e73207b0a09746578742d616c69676e3a2063656e7465723b0a0970616464696e673a2034707820303b0a7d0a2e70687062622023666f726d61742d627574746f6e73202e627574746f6e32207b0a09626f726465722d77696474683a203170783b0a0977696474683a206175746f2021696d706f7274616e743b0a7d0a2e696537202e70687062622023666f726d61742d627574746f6e73202e627574746f6e32207b0a0970616464696e673a20303b0a7d0a0a2e706870626220237365617263685f6b6579776f726473207b0a0970616464696e672d6c6566743a20313970783b0a096261636b67726f756e642d706f736974696f6e3a20347078203530253b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a0a2e70687062622023656469745f726561736f6e207b0a0977696474683a203930253b0a7d0a0a2f2a0a0942696720706f737420627574746f6e730a2a2f0a2e7068706262202e627574746f6e7320612c202e706870626220612e627574746f6e207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a09706f736974696f6e3a2072656c61746976653b0a096d617267696e3a20303b0a096d617267696e2d6c6566743a20333070783b0a0970616464696e673a203470782031327078203020303b0a09766572746963616c2d616c69676e3a20746f703b0a096865696768743a20323670783b0a09666f6e742d66616d696c793a2056657264616e613b0a09666f6e742d73697a653a20313270783b0a096c696e652d6865696768743a20323070783b0a09746578742d6465636f726174696f6e3a206e6f6e653b0a096f75746c696e652d7374796c653a206e6f6e653b0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a096d61782d77696474683a2034303070783b0a7d0a2e70687062622e62726f777365722d7765626b6974202e627574746f6e7320612c202e70687062622e62726f777365722d7765626b697420612e627574746f6e207b0a0970616464696e672d746f703a203570783b0a096865696768743a20323570783b0a7d0a0a2e7068706262202e627574746f6e732061207370616e2c202e706870626220612e627574746f6e207370616e207b0a09646973706c61793a20626c6f636b3b0a09706f736974696f6e3a206162736f6c7574653b0a09746f703a20303b0a09626f74746f6d3a20303b0a096c6566743a202d333070783b0a0977696474683a20333070783b0a096261636b67726f756e642d706f736974696f6e3a2030202d333070783b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a2e696537202e7068706262202e746f7069632d616374696f6e73202e627574746f6e732c202e696537202e7068706262202e70616e656c202e627574746f6e732c202e696537202e7068706262202e706f707570202e627574746f6e73207b0a09706f736974696f6e3a2072656c61746976653b0a096c6566743a20333070783b0a7d0a0a2e7068706262202e627574746f6e73202e7265706c792d69636f6e2061207370616e2c202e7068706262202e627574746f6e73202e706d7265706c792d69636f6e2061207370616e2c202e7068706262202e627574746f6e73202e6c6f636b65642d69636f6e2061207370616e207b0a096261636b67726f756e642d706f736974696f6e3a202d33307078202d333070783b0a7d0a2e7068706262202e627574746f6e73202e6e6577706d2d69636f6e2061207370616e207b0a096261636b67726f756e642d706f736974696f6e3a202d36307078202d333070783b0a7d0a2e7068706262202e627574746f6e73202e706f73742d69636f6e2061207370616e207b0a096261636b67726f756e642d706f736974696f6e3a202d39307078202d333070783b0a7d0a2e7068706262202371725f73686f77656469746f725f6469762061207370616e2c202e7068706262202e6a756d70626f7820612e627574746f6e207370616e207b0a096261636b67726f756e642d706f736974696f6e3a202d3132307078202d333070783b0a7d0a2e7068706262202e627574746f6e7320612e69636f6e2d6c6f67696e207370616e207b0a096261636b67726f756e642d706f736974696f6e3a202d3135307078202d333070783b0a7d0a2e7068706262202e627574746f6e7320612e69636f6e2d7265676973746572207370616e2c202e7068706262202e627574746f6e73202e666f7277617264706d2d69636f6e2061207370616e207b0a096261636b67726f756e642d706f736974696f6e3a202d3138307078202d333070783b0a7d0a0a2f2a0a094d656e7520666f726d730a2a2f0a2e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f78207b0a0977696474683a2031353670783b0a09626f726465722d7261646975733a203670783b0a7d0a2e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e7365617263682c202e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e6c6f67696e2c202e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e70617373776f7264207b0a0970616464696e672d6c6566743a20323070783b0a0977696474683a2031373270783b0a096261636b67726f756e642d706f736974696f6e3a20347078203435253b0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0a7d0a2e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e736561726368207b0a0977696474683a2031343070783b0a7d0a2e7068706262206c692e6d656e752d666f726d20696e7075742e627574746f6e2d69636f6e207b0a0977696474683a20303b0a096865696768743a20303b0a0970616464696e673a20323470782030203020323670783b0a096f766572666c6f773a2068696464656e3b0a09666f6e742d73697a653a20303b0a09666c6f61743a2072696768743b0a09626f726465722d77696474683a20303b0a09626f726465722d7261646975733a20303b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e652030202d36307078206e6f2d7265706561743b0a7d0a2e696537202e7068706262206c692e6d656e752d666f726d20696e7075742e627574746f6e2d69636f6e207b0a0977696474683a20323670783b0a096865696768743a20323470783b0a0970616464696e672d746f703a20303b0a7d0a2e7068706262206c692e6d656e752d666f726d206c6162656c207b0a09646973706c61793a20626c6f636b3b0a09666f6e742d73697a653a20313170783b0a096d61782d77696474683a2032303070783b0a0977686974652d73706163653a206e6f777261703b0a096f766572666c6f773a2068696464656e3b0a09746578742d6f766572666c6f773a20656c6c69707369733b0a7d0a2e696537202e7068706262206c692e6d656e752d666f726d206c6162656c207b0a0977686974652d73706163653a206e6f726d616c3b0a7d0a2e7068706262206c692e6d656e752d666f726d202e627574746f6e73207b0a09666c6f61743a206e6f6e653b0a09746578742d616c69676e3a2072696768743b0a7d0a2f2a0a09506f707570730a2a2f0a2e7068706262202e706f7075702d74726967676572207b0a09706f736974696f6e3a2072656c61746976653b0a7d0a2e7068706262202e746f702d6c696e6b73202e706f7075702d74726967676572207b0a09646973706c61793a20696e6c696e652d626c6f636b3b0a7d0a2e7068706262202e746f702d6c696e6b73202e706f707570202e706f7075702d74726967676572207b0a09646973706c61793a20626c6f636b3b0a7d0a0a2e7068706262202e706f707570207b0a09646973706c61793a206e6f6e653b0a09706f736974696f6e3a206162736f6c7574653b0a096c6566743a20303b0a09746f703a20323770783b0a097a2d696e6465783a2031303b0a0970616464696e673a203570783b0a096d617267696e3a20303b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a096d696e2d77696474683a2031353070783b0a0977686974652d73706163653a206e6f777261703b0a09746578742d616c69676e3a206c6566743b0a09666f6e742d73697a653a20313270783b0a096c696e652d6865696768743a20312e35656d3b0a09666f6e742d66616d696c793a2056657264616e613b0a7d0a2e7068706262202e706f7075702d6c697374207b0a096c696e652d6865696768743a2031656d3b0a0970616464696e673a20303b0a7d0a0a2e696537202e7068706262202e706f707570207b0a09746f703a20323470783b0a7d0a2e7068706262202e6d656e75202e706f707570207b0a096c6566743a203470783b0a7d0a2e7068706262202e746f702d6c696e6b73202e706f707570207b0a09746f703a20323870783b0a7d0a2e7068706262202e6865616465722d6c6f67696e202e706f707570207b0a09746f703a20313870783b0a096c6566743a206175746f3b0a0972696768743a20303b0a7d0a2e696537202e7068706262202e6865616465722d6c6f67696e202e706f707570207b0a09746f703a20323070783b0a7d0a2e7068706262202e706f7075702d6c697374202e706f707570207b0a09746f703a20303b0a096c6566743a2031393870783b0a7d0a2e7068706262202e706f7075702d7570202e706f707570207b0a09746f703a206175746f3b0a09626f74746f6d3a20303b0a7d0a2e7068706262202e7269676874202e706f707570207b0a096c6566743a206175746f3b0a0972696768743a20303b0a7d0a0a2e7068706262202e706f7075702d747269676765723a686f766572203e202e706f7075702c202e7068706262202e706f7075702e616374697665207b0a09646973706c61793a20626c6f636b3b0a7d0a0a2e7068706262202e706f7075702070207b0a0970616464696e673a2033707820303b0a096c696e652d6865696768743a20312e33656d3b0a09666f6e742d66616d696c793a2048656c7665746963612c20417269616c3b0a09666f6e742d73697a653a20313370783b0a7d0a2e7068706262202e706f70757020702e7469746c65207b0a09666f6e742d73697a653a20313470783b0a0970616464696e673a2035707820303b0a09666f6e742d66616d696c793a2056657264616e613b0a7d0a2e7068706262202e706f70757020702e7469746c653a66697273742d6368696c642c202e7068706262202e706f70757020703a66697273742d6368696c64207b200a0970616464696e672d746f703a20303b0a7d0a2e7068706262202e706f70757020703a6c6173742d6368696c64207b200a0970616464696e672d626f74746f6d3a20303b0a7d0a0a2f2a0a094c6f67696e20666f726d0a2a2f0a2e7068706262202370687062622d6865616465722d6c6f67696e206464207b0a09746578742d616c69676e3a2072696768743b0a7d0a2e7068706262202370687062622d6865616465722d6c6f67696e20702e7269676874207b0a0970616464696e672d72696768743a203470783b0a0970616464696e672d626f74746f6d3a203470783b0a7d0a0a2f2a0a094c696e6b730a2a2f0a2e7068706262202e706f7075702d6c697374206c69207b0a0970616464696e673a20303b0a7d0a0a2e696537202e7068706262202e706f7075702d6c6973742061207b0a0977696474683a20313030253b0a7d0a0a0a2e7068706262206c692e706f7075702d6c696e6b207b0a09626f726465723a2031707820736f6c6964207472616e73706172656e743b0a09626f726465722d77696474683a2030203170783b0a0970616464696e673a20303b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030207265706561742d783b0a7d0a2e7068706262206c692e706f7075702d6c696e6b3a66697273742d6368696c64207b0a09626f726465722d746f702d77696474683a203170783b0a7d0a2e7068706262206c692e706f75702d6c696e6b3a6c6173742d6368696c64207b0a09626f726465722d626f74746f6d2d77696474683a203170783b0a7d0a2e7068706262202e706f7075702e706f7075702d6c697374206c692e706f7075702d6c696e6b3a686f7665722c202e7068706262202e73686f772d6c6576656c73206c692e6c6576656c2d726f6f742c202e7068706262202e706f7075702d6c697374206c692e726f772d6e6577207b0a096261636b67726f756e642d706f736974696f6e3a2030202d323770782021696d706f7274616e743b0a7d0a0a2e7068706262206c692e706f7075702d6c696e6b203e20612c202e7068706262206c692e706f7075702d6c696e6b203e207370616e207b0a09646973706c61793a20626c6f636b3b0a096c696e652d6865696768743a2031656d3b0a0970616464696e673a2037707820323070782030203870783b0a096865696768743a20323070783b0a09746578742d6465636f726174696f6e3a206e6f6e652021696d706f7274616e743b0a0977696474683a2031373270783b0a096d696e2d77696474683a2031373270783b0a096f766572666c6f773a2068696464656e3b0a09746578742d6f766572666c6f773a20656c6c69707369733b0a7d0a2e7068706262206c692e706f7075702d6c696e6b2e706f7075702d74726967676572203e2061207b0a096261636b67726f756e643a207472616e73706172656e74206e6f6e6520313030252030206e6f2d7265706561743b0a7d0a2e7068706262206c692e706f7075702d6c696e6b2e706f7075702d747269676765723a686f766572203e2061207b0a096261636b67726f756e642d706f736974696f6e3a2031303025202d363070783b0a7d0a2e7068706262206c692e706f75702d6c696e6b3a6c6173742d6368696c64203e20612c202e7068706262206c692e706f75702d6c696e6b3a6c6173742d6368696c64203e207370616e207b0a096865696768743a20313970783b0a7d0a0a2e7068706262202e706f7075702d6c697374203e206f6c207b0a09646973706c61793a207461626c652d726f773b0a7d0a2e7068706262202e706f7075702d6c697374203e206f6c203e206c69207b0a09646973706c61793a207461626c652d63656c6c3b0a0970616464696e673a20303b0a7d0a0a2f2a0a09446566696e6974696f6e206c697374730a2a2f0a2e7068706262202e706f70757020646c207b0a09636c6561723a20626f74683b0a0977696474683a2032353470783b0a096d617267696e3a20303b0a0970616464696e673a203470783b0a7d0a2e7068706262202e706f707570206474207b0a09666c6f61743a206c6566743b0a0977696474683a2031303070783b0a096d617267696e3a20303b0a0970616464696e673a20337078203020303b0a7d0a2e7068706262202e706f707570206464207b0a0977696474683a2031353070783b0a096d617267696e3a20303b0a096d617267696e2d6c6566743a2031303470783b0a0970616464696e673a20303b0a7d0a2e696537202e7068706262202e706f707570206464207b0a096d617267696e2d6c6566743a20303b0a7d0a2e7068706262202e706f70757020646420696e707574207b0a0977696474683a2031343070783b0a7d0a2f2a0a09436f6c6f7572732c2055524c730a2a2f0a0a2e70687062622068322c202e7068706262206833207b0a09636f6c6f723a20233161346639303b0a09746578742d736861646f773a203170782031707820302072676261283235352c203235352c203235352c20302e32293b0a7d0a0a2e7068706262206872207b0a09626f726465722d746f702d636f6c6f723a20236434643464343b0a7d0a0a0a0a2f2a0a094c696e6b730a2a2f0a2e706870626220612c202e706870626220613a76697369746564207b200a09636f6c6f723a20233161346639303b0a7d0a2e706870626220613a686f7665722c202e706870626220613a616374697665207b0a09636f6c6f723a20236263326132613b0a7d0a0a2f2a0a094c61796f75740a2a2f0a626f64792e7068706262207b0a096261636b67726f756e642d636f6c6f723a20236666666666663b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6c61796f75745f746f702e706e6722293b0a7d0a626f64792e73696d706c65207b0a096261636b67726f756e643a20236634663466343b0a7d0a0a2e7068706262202e6c6f676f206831207b0a09636f6c6f723a2072676261283235352c203235352c203235352c20302e38293b0a09746578742d736861646f773a2031707820317078203020726762612832362c2037392c203134342c20302e37293b0a7d0a2e6f6c646965202e7068706262202e6c6f676f206831207b0a09636f6c6f723a20233161346639303b0a7d0a0a2e7068706262202e626f64792d77726170706572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f746f703430302e706e6722293b0a7d0a0a2e7068706262202e6c61796f75742d6f75746572207b0a096261636b67726f756e642d636f6c6f723a20236634663466343b0a09626f726465722d636f6c6f723a20236530653065303b0a09626f782d736861646f773a2030203020327078207267626128302c20302c20302c20302e31293b0a7d0a2e7068706262202e666f72756d2d77726170706572207b0a09626f726465722d636f6c6f723a20236661666166613b0a7d0a2e7068706262202e6c61796f75742d77726170706572203e206469762c202e7068706262207461626c652e6c61796f75742d77726170706572203e2074626f6479203e207472203e207464207b0a09626f726465722d6c6566742d636f6c6f723a20236661666166613b0a09626f726465722d72696768742d636f6c6f723a20236530653065303b0a7d0a0a2e7068706262202e666f6f746572207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f666f6f7465722e706e6722293b0a7d0a2e7068706262202e666f6f7465722c202e7068706262202e666f6f74657220612c202e7068706262202e666f6f74657220613a76697369746564207b0a09636f6c6f723a20236433653366313b0a7d0a2e7068706262202e666f6f74657220613a686f766572207b0a09636f6c6f723a20236666663b0a7d0a0a2e7068706262202e666f6f746572202e617274792c202e7068706262202e666f6f746572202e70687062622d67726f7570207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f70797269676874732e706e6722293b0a7d0a0a2e7068706262202e6865616465722d6c6f67696e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6865616465726d656e752e706e6722293b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09636f6c6f723a20233839623364623b0a7d0a2e7068706262202e6865616465722d6c6f67696e3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a09636f6c6f723a20236462386138613b0a7d0a2e7068706262202e6865616465722d6c6f67696e202e706f707570207b0a09636f6c6f723a20233030303b0a7d0a0a2e706870626220612e6865616465722d6d656e752e6d656e752d6c6f67696e203e207370616e2c202e706870626220612e6865616465722d6d656e752e6d656e752d7265676973746572203e207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6865616465725f6c6f67696e2e706e6722293b0a7d0a0a2f2a0a09426f7865730a2a2f0a2e7068706262202e746f7069636c697374203e206c692e726f772d6f757465722c202e7068706262202e70616e656c2d6f757465722c202e7068706262202e706f73742d6f75746572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f746f7077686974652e706e6722293b0a7d0a0a2e7068706262202e726f772d777261702e726f772d746f702c202e7068706262202e726f772d777261702e726f772d626f74746f6d2c0a2e7068706262202e70616e656c2d777261702e726f772d746f702c202e7068706262202e70616e656c2d777261702e726f772d626f74746f6d2c0a2e7068706262202e706f73742d777261702e726f772d746f702c202e7068706262202e706f73742d777261702e726f772d626f74746f6d207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f726f775f74622e706e6722293b0a7d0a2e7068706262202e726f772d77726170207370616e2e726f772d6c6566742c202e7068706262202e70616e656c2d77726170207370616e2e726f772d6c6566742c202e7068706262202e706f73742d77726170207370616e2e726f772d6c656674207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f726f775f636c2e706e6722293b0a7d0a2e7068706262202e726f772d77726170207370616e2e726f772d72696768742c202e7068706262202e70616e656c2d77726170207370616e2e726f772d72696768742c202e7068706262202e706f73742d77726170207370616e2e726f772d7269676874207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f726f775f63722e706e6722293b0a7d0a2e7068706262202e726f772d777261702e726f772d6c6566742c202e7068706262202e70616e656c2d777261702e726f772d6c6566742c202e7068706262202e706f73742d777261702e726f772d6c656674207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f726f775f6c2e706e6722293b0a7d0a2e7068706262202e726f772d777261702e726f772d72696768742c202e7068706262202e70616e656c2d777261702e726f772d72696768742c202e7068706262202e706f73742d777261702e726f772d7269676874207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f726f775f722e706e6722293b0a7d0a0a2f2a0a094d656e750a2a2f0a0a2e7068706262202e74696d65207b0a09636f6c6f723a207267626128302c20302c20302c20302e35293b0a09746578742d736861646f773a203170782031707820302072676261283235352c203235352c203235352c20302e35293b0a7d0a2e6f6c646965202e7068706262202e74696d65207b0a09636f6c6f723a20233830383038303b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6d656e755f6c6566742e706e6722293b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6974656d20612c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e20612c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e20702c0a2e7068706262206c692e6d656e752d666f726d20696e7075742e627574746f6e2d69636f6e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6d656e755f72696768742e706e6722293b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d6974656d207b0a096261636b67726f756e642d636f6c6f723a20236363633b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6974656d3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2e616374697665207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e2c202e7068706262206c692e6d656e752d666f726d20696e7075742e627574746f6e2d69636f6e207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e3a686f7665722c202e7068706262206c692e6d656e752d666f726d20696e7075742e627574746f6e2d69636f6e3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2061207b0a09636f6c6f723a20233161346639303b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6974656d3a686f7665722061207b0a09636f6c6f723a20233233373262623b0a7d0a2e7068706262202e6d656e75206c692e6d656e752d6974656d2e6163746976652061207b0a09636f6c6f723a20236263326132613b0a7d0a0a2e7068706262202e6d656e75206c692e6d656e752d73656374696f6e20702c202e7068706262202e6d656e75206c692e6d656e752d73656374696f6e2061207b0a09636f6c6f723a20236666662021696d706f7274616e743b0a09746578742d736861646f773a20317078203170782030207267626128302c20302c20302c20302e33293b0a7d0a0a2e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e736561726368207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f696e7075745f7365617263682e706e6722293b0a7d0a2e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e6c6f67696e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f696e7075745f757365722e706e6722293b0a7d0a2e7068706262206c692e6d656e752d666f726d20696e7075742e696e707574626f782e70617373776f7264207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f696e7075745f706173732e706e6722293b0a7d0a0a2f2a0a094e61766261720a2a2f0a2e7068706262202e6e61766261722c202e7068706262202e6c696e6b6d6370207b0a09626f726465722d636f6c6f723a20236434643464343b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f776869746535302e706e6722293b0a09636f6c6f723a20236161613b0a7d0a0a2f2a0a09486561646572206d656e750a2a2f0a2e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b2c202e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b203e207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f746f706d656e752e706e6722293b0a7d0a2e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09636f6c6f723a20236666662021696d706f7274616e743b0a7d0a2e7068706262202e746f702d6c696e6b73202e746f702d6c696e6b3a686f7665722c202e7068706262202e746f702d6c696e6b73202e706f7075702d747269676765723a686f766572202e746f702d6c696e6b207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a0a2f2a0a09506f707570730a2a2f0a2e7068706262202e706f707570207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a09626f726465722d636f6c6f723a20236530653065303b0a09626f782d736861646f773a2030203020337078207267626128302c20302c20302c20302e31293b0a092d7765626b69742d626f782d736861646f773a2030203020337078207267626128302c20302c20302c20302e31293b0a7d0a2e7068706262202e706f7075702d6c697374207b0a096261636b67726f756e642d636f6c6f723a2072676261283234382c203234382c203234382c20302e39293b0a7d0a2e6f6c646965202e7068706262202e706f7075702d6c697374207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a7d0a0a2e7068706262202e706f7075702e706f7075702d6c697374206c692e706f7075702d6c696e6b207b0a09626f726465722d636f6c6f723a20236662666266623b0a09626f726465722d72696768742d636f6c6f723a20236530653065303b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f706f7075705f6c696e6b2e706e6722293b0a096261636b67726f756e642d636f6c6f723a20236634663466343b0a7d0a2e7068706262202e706f7075702d6c697374203e20756c203e206c692e706f7075702d6c696e6b2c202e7068706262206c693a6c6173742d6368696c64203e20756c203e206c692e706f7075702d6c696e6b207b0a09626f726465722d72696768742d636f6c6f723a20236662666266623b0a7d0a2e7068706262202e706f7075702e706f7075702d6c697374206c692e706f7075702d6c696e6b3a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a7d0a2e7068706262202e706f7075702d6c696e6b203e2061207b0a09636f6c6f723a20233161346639303b0a7d0a0a2e7068706262202e706f7075702e706f7075702d6c697374206c692e706f7075702d6c696e6b3a686f7665722c202e7068706262202e706f7075702e706f7075702d6c697374202e73686f772d6c6576656c73206c692e6c6576656c2d726f6f74207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09626f726465722d636f6c6f723a20233466386563393b0a09626f726465722d72696768742d636f6c6f723a20233166363661383b0a7d0a2e7068706262202e706f7075702e706f7075702d6c697374202e73686f772d6c6576656c73206c692e6c6576656c2d726f6f743a686f7665722c202e7068706262202e706f7075702e706f7075702d6c69737420756c206c692e726f772d6e65772c202e7068706262202e706f7075702e706f7075702d6c69737420756c206c692e726f772d6e65773a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a09626f726465722d636f6c6f723a20236330343334333b0a09626f726465722d72696768742d636f6c6f723a20233965313231323b0a7d0a2e7068706262202e706f7075702d6c696e6b3a686f766572203e20612c202e7068706262202e73686f772d6c6576656c73206c692e6c6576656c2d726f6f74203e20612c202e7068706262202e706f7075702d6c697374206c692e726f772d6e6577203e2061207b0a09636f6c6f723a20236666662021696d706f7274616e743b0a7d0a0a2e7068706262206c692e706f7075702d6c696e6b2e706f7075702d74726967676572203e2061207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f706f7075705f6172726f77732e706e6722293b0a7d0a0a2e7068706262202e706f7075702070207b0a09636f6c6f723a20233830383038303b0a7d0a2e7068706262202e706f70757020702e7469746c65207b0a09636f6c6f723a20233161346639303b0a7d0a2e7068706262202e706f70757020702e7469746c653a66697273742d6368696c64207b0a09636f6c6f723a20236263326132613b0a7d0a0a2f2a0a09466f726d730a2a2f0a2e706870626220696e7075745b747970653d2274657874225d2c202e706870626220696e7075745b747970653d2270617373776f7264225d2c202e706870626220696e7075745b747970653d22656d61696c225d2c202e70687062622074657874617265612c202e70687062622073656c656374207b0a09636f6c6f723a20233830383038303b0a096261636b67726f756e642d636f6c6f723a20236666663b0a09626f726465722d636f6c6f723a20236434643464343b0a7d0a2e706870626220696e7075745b747970653d2274657874225d3a686f7665722c202e706870626220696e7075745b747970653d2270617373776f7264225d3a686f7665722c202e706870626220696e7075745b747970653d22656d61696c225d3a686f7665722c202e70687062622074657874617265613a686f7665722c202e70687062622073656c6563743a686f766572207b0a09636f6c6f723a20233030303b0a09626f726465722d636f6c6f723a20236132623162633b0a7d0a2e706870626220696e7075745b747970653d2274657874225d3a666f6375732c202e706870626220696e7075745b747970653d2270617373776f7264225d3a666f6375732c202e706870626220696e7075745b747970653d22656d61696c225d3a666f6375732c202e70687062622074657874617265613a666f6375732c202e70687062622073656c6563743a666f637573207b0a09636f6c6f723a20233030303b0a09626f726465722d636f6c6f723a20236432383438343b0a7d0a2e706870626220696e7075745b747970653d2274657874225d3a696e76616c69642c202e706870626220696e7075745b747970653d2270617373776f7264225d3a696e76616c69642c202e706870626220696e7075745b747970653d22656d61696c225d3a696e76616c69642c202e70687062622074657874617265613a696e76616c6964207b0a09636f6c6f723a20236432383438343b0a7d0a2e706870626220696e7075745b747970653d227375626d6974225d2c202e7068706262202e627574746f6e312c202e7068706262202e627574746f6e32207b0a09636f6c6f723a20236666662021696d706f7274616e743b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f627574746f6e735f62672e706e6722293b0a09626f726465722d636f6c6f723a20233233373262623b0a09746578742d736861646f773a20317078203170782030207267626128302c20302c20302c20302e3235293b0a7d0a2e706870626220696e7075745b747970653d227375626d6974225d3a686f7665722c202e7068706262202e627574746f6e313a686f7665722c202e7068706262202e627574746f6e323a686f7665722c202e7068706262202e746f702d6c696e6b7320612e746f702d6c696e6b3a686f7665722c202e7068706262202e746f702d6c696e6b73202e706f7075702d747269676765723a686f76657220612e746f702d6c696e6b207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a09626f726465722d636f6c6f723a20236230313431343b0a7d0a2e706870626220237365617263685f6b6579776f726473207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f7365617263682e706e6722293b0a09636f6c6f723a20236138613861383b0a7d0a2e706870626220237365617263685f6b6579776f7264733a686f7665722c202e706870626220237365617263685f6b6579776f7264733a666f637573207b0a09636f6c6f723a20233030303b0a7d0a0a2e706870626220702e6572726f722c202e70687062622064642e6572726f72207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a2e706870626220702e6572726f722c202e706870626220702e6572726f7220612c202e70687062622064642e6572726f722c202e70687062622064642e6572726f722061207b0a09636f6c6f723a20236666662021696d706f7274616e743b0a7d0a0a0a2f2a0a09427574746f6e730a2a2f0a2e70687062622023666f726d61742d627574746f6e73202e627574746f6e32207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f776869746531302e706e6722293b0a09636f6c6f723a20233830383038302021696d706f7274616e743b0a09626f726465722d636f6c6f723a20236434643464343b0a09746578742d736861646f773a203170782031707820302072676261283235352c203235352c203235352c20302e32293b0a7d0a2e70687062622023666f726d61742d627574746f6e73202e627574746f6e323a686f766572207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09626f726465722d636f6c6f723a20233233373262623b0a09636f6c6f723a20236666662021696d706f7274616e743b0a09746578742d736861646f773a206e6f6e653b0a7d0a0a2e7068706262202e627574746f6e7320612c202e706870626220612e627574746f6e2c202e7068706262202e627574746f6e732061207370616e2c202e706870626220612e627574746f6e207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f627574746f6e732e706e6722293b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09636f6c6f723a20236666662021696d706f7274616e743b0a7d0a2e7068706262202e627574746f6e7320613a686f7665722c202e706870626220612e627574746f6e3a686f7665722c202e7068706262202e627574746f6e7320613a686f766572207370616e2c202e706870626220612e627574746f6e3a686f766572207370616e207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a0a2f2a0a09466f72756d73206c6973740a2a2f0a2e7068706262202e746f7069636c697374202e6865616465722c202e6f6c646965202e7068706262202e746f7069636c697374202e6865616465722c202e70687062622068322e6865616465722d6f757465722c202e7068706262207461626c652e7461626c6531207468207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09626f726465722d636f6c6f723a20233233373262623b0a7d0a2e7068706262202e746f7069636c697374202e6865616465722e696e616374697665207b0a096261636b67726f756e642d636f6c6f723a20233830383038303b0a09626f726465722d636f6c6f723a20233830383038303b0a7d0a2e7068706262202e746f7069636c697374202e6865616465722e696e6163746976652e756e726561642c202e7068706262202e746f7069636c697374202e6865616465723a686f7665722c202e6f6c646965202e7068706262202e746f7069636c697374202e6865616465723a686f7665722c202e70687062622068322e6865616465722d6f757465723a686f7665722c202e7068706262207461626c652e7461626c65312074683a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a09626f726465722d636f6c6f723a20236230313431343b0a7d0a2e7068706262202e746f7069636c697374202e686561646572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f746f70776869746533302e706e6722292c2075726c28227b545f5448454d455f504154487d2f696d616765732f6361745f6c6566742e706e6722293b0a7d0a2e6f6c646965202e7068706262202e746f7069636c697374202e6865616465722c202e70687062622068322e6865616465722d6f75746572202e6865616465722d6c656674207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6361745f6c6566742e706e6722293b0a7d0a2e7068706262202e746f7069636c697374202e68656164657220646c2c202e70687062622068322e6865616465722d6f75746572202e6865616465722d7269676874207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6361745f72696768742e706e6722293b0a7d0a2e7068706262202e746f7069636c697374202e6865616465722064742c202e70687062622068322e6865616465722d6f75746572202e6865616465722d696e6e6572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6361745f62672e706e6722293b0a7d0a2e7068706262207461626c652e7461626c6531207468207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f776869746532302e706e6722293b0a7d0a2e70687062622068322e6865616465722e6865616465722d6f75746572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f746f70776869746533302e706e6722293b0a7d0a2e7068706262202e746f7069636c697374202e6865616465722c202e7068706262202e746f7069636c697374202e68656164657220612c202e7068706262202e746f7069636c697374202e68656164657220613a766973697465642c202e70687062622068322e6865616465722d6f757465722c202e70687062622068322e6865616465722d6f7574657220612c202e70687062622068322e6865616465722d6f7574657220613a766973697465642c0a2e7068706262207461626c652e7461626c65312074682c202e7068706262207461626c652e7461626c653120746820612c202e7068706262207461626c652e7461626c653120746820613a766973697465642c0a2e706870626220612e6865616465722d6d656e752c202e706870626220612e6865616465722d6d656e753a766973697465642c202e706870626220612e6865616465722d6d656e753a686f766572207b0a09636f6c6f723a20236666663b0a09746578742d736861646f773a20317078203170782030207267626128302c20302c20302c20302e32293b0a7d0a2e6f6c646965202e7068706262202e746f7069636c697374202e6865616465722c202e6f6c646965202e7068706262202e746f7069636c697374202e68656164657220612c202e6f6c646965202e7068706262202e746f7069636c697374202e68656164657220613a766973697465642c202e6f6c646965202e70687062622068322e6865616465722d6f757465722c202e6f6c646965202e70687062622068322e6865616465722d6f7574657220612c0a2e7068706262202e746f7069636c697374202e68656164657220613a686f7665722c202e70687062622068322e6865616465722d6f7574657220613a686f7665722c202e6f6c646965202e7068706262207461626c652e7461626c65312074682c202e6f6c646965202e7068706262207461626c652e7461626c653120746820612c202e6f6c646965202e7068706262207461626c652e7461626c653120746820613a76697369746564202e7068706262207461626c652e7461626c653120746820613a686f766572207b0a09636f6c6f723a20236666663b0a7d0a0a2e7068706262202e657870616e6461626c65202e6865616465723a61667465722c202e7068706262202e6d656e75206c692e657870616e6461626c653a6166746572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6361745f657870616e642e706e6722293b0a7d0a0a2e7068706262202e746f7069636c697374203e206c69207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a09626f726465722d636f6c6f723a20236434643464343b0a7d0a2e7068706262202e746f7069636c697374203e206c692e726f7732207b0a096261636b67726f756e642d636f6c6f723a20236661666166613b0a7d0a2e7068706262202e746f7069636c697374203e206c692e7265706f72746564207b0a096261636b67726f756e642d636f6c6f723a20236638663466343b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a2e7068706262202e746f7069636c697374203e206c693a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236663666366633b0a7d0a2e7068706262202e746f7069636c697374203e206c692e726f77323a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236664666466643b0a7d0a2e7068706262202e746f7069636c697374203e206c692e7265706f727465643a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236634653965393b0a7d0a2e7068706262202e746f7069636c697374206464207b0a09626f726465722d636f6c6f723a20236538653865383b0a09636f6c6f723a20233434343b0a7d0a2e7068706262202e746f7069636c697374202e7265706f72746564206464207b0a09626f726465722d636f6c6f723a20236537633763373b0a7d0a2e7068706262202e746f7069636c697374202e746f706963732064666e2c202e7068706262202e746f7069636c697374202e706f7374732064666e2c202e7068706262202e746f7069636c697374202e76696577732064666e2c202e7068706262202e746f7069636c697374202e6c617374706f73742064666e2c202e7068706262202e746f7069636c697374202e62792c202e7068706262202e746f7069636c697374202e62756c6c207b0a09636f6c6f723a20233939393b0a7d0a0a2e706870626220612e746f7069637469746c652c202e706870626220612e666f72756d7469746c65207b0a09636f6c6f723a20233161346639303b0a7d0a2e7068706262202e756e7265616420612e746f7069637469746c652c202e7068706262202e756e7265616420612e666f72756d7469746c652c202e706870626220612e746f7069637469746c653a686f7665722c202e706870626220612e666f72756d7469746c653a686f7665722c202e706870626220612e737562666f72756d2e756e72656164207b0a09636f6c6f723a20236263326132613b0a7d0a0a2e7068706262202e746f7069636c697374202e69636f6e206474207b0a09636f6c6f723a20233830383038303b0a7d0a2e7068706262202e746f7069636c697374202e686561646572206474207b0a09636f6c6f723a20236666663b0a7d0a0a2e706870626220702e737562666f72756d73207374726f6e672c202e706870626220702e6d6f64657261746f7273207374726f6e67207b0a09636f6c6f723a20233830383038303b0a7d0a0a2f2a0a09426c6f636b730a2a2f0a2e7068706262202e70616e656c2c202e7068706262202e706f73742c202e7068706262207461626c652e7461626c65312074642c202e7068706262202e63702d6d696e69207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a09626f726465722d636f6c6f723a20236438643864383b0a7d0a2e7068706262202e70616e656c2e7374617473202e696e6e6572207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f73746174732e706e6722293b0a7d0a0a2e7068706262206469762e72756c65732c202e7068706262202e706f7374626f6479202e72756c6573207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f746f70776869746533302e706e6722293b0a096261636b67726f756e642d636f6c6f723a20236636653765373b0a09626f726465722d636f6c6f723a20236561646164613b0a7d0a2e7068706262206469762e72756c65733a686f7665722c202e7068706262202e706f7374626f6479202e72756c65733a686f766572207b0a09626f726465722d636f6c6f723a20236534633663363b0a7d0a2e7068706262202e72756c6573202e70616e656c2d696e6e6572207b0a09626f726465722d636f6c6f723a20236639663266323b0a7d0a2e7068706262206469762e72756c6573207370616e2b7374726f6e67207b0a09636f6c6f723a20236263326132613b0a7d0a0a2e7068706262202e70616e656c2d77726170706572207b0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0a096261636b67726f756e642d696d6167653a206e6f6e653b0a7d0a0a0a2f2a0a094172726f77730a2a2f0a2e706870626220612e737562666f72756d207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f5441524745545f5352437d22293b0a7d0a2e706870626220612e737562666f72756d2e756e72656164207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f5441524745545f554e524541445f5352437d22293b0a7d0a2e706870626220612e6c656674207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f6c6566742e706e6722293b0a7d0a2e706870626220612e7269676874207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f72696768742e706e6722293b0a7d0a2e706870626220612e7570207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f75702e706e6722293b0a7d0a2e706870626220612e646f776e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f646f776e2e706e6722293b0a7d0a0a2e7068706262202e706f7374202e6261636b32746f702061207b0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f4241434b5f544f505f5352437d22293b0a7d0a0a2f2a0a09506167696e6174696f6e0a2a2f0a2e7068706262202e706167696e6174696f6e207370616e207b0a09636f6c6f723a20233939393b0a7d0a2e7068706262202e706167696e6174696f6e207370616e20612c202e7068706262202e706167696e6174696f6e207370616e207374726f6e67207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09636f6c6f723a20236666663b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f706167696e6174696f6e2e706e6722293b0a7d0a2e7068706262202e706167696e6174696f6e207370616e207374726f6e672c202e7068706262202e706167696e6174696f6e207370616e20613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a0a2f2a0a09506f6c6c0a2a2f0a2e7068706262202e706f6c6c7320646c207b0a09626f726465722d636f6c6f723a20236530653065303b0a7d0a2e7068706262202e706f6c6c732064642e726573756c74626172203e20646976207b0a09636f6c6f723a20236666663b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f706f6c6c2e706e6722293b0a7d0a2e7068706262202e706f6c6c73202e766f7465642064642e726573756c74626172203e20646976207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a0a2f2a0a09506f73740a2a2f0a2e7068706262202e706f737465722d72616e6b207b0a09636f6c6f723a20233838383b0a7d0a2e7068706262202e706f737470726f66696c65206464207374726f6e672c202e7068706262202e706f737470726f66696c65206c69203e207374726f6e672c202e7068706262202e706f7374626f6479202e617574686f72207b0a09666f6e742d7765696768743a206e6f726d616c3b0a09636f6c6f723a20233630363036303b0a7d0a2e7068706262202e70726f66696c65202e706f737465722d6176617461722e656d707479207370616e207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6176617461722e706e6722293b0a7d0a2e7068706262202e6f6e6c696e65202e706f737465722d617661746172207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6f6e6c696e652e706e6722293b0a7d0a2e7068706262202e706f73742d636f6e74656e742d77726170203e202e706f7374626f6479207b0a09626f726465722d636f6c6f723a20236538653865383b0a7d0a0a2e7068706262202e70726f66696c652d69636f6e732061207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f627574746f6e735f706f73742e706e6722293b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a7d0a2e7068706262202e70726f66696c652d69636f6e7320613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a7d0a0a2e7068706262202e7369676e6174757265207b0a09636f6c6f723a20233434343b0a09626f726465722d636f6c6f723a20236538653865383b0a7d0a2e7068706262202e706f7374626f6479202e6e6f74696365207b0a096261636b67726f756e642d636f6c6f723a20236636653765373b0a09626f726465722d636f6c6f723a20236561646164613b0a7d0a0a2e7068706262202e706f737468696c6974207b0a096261636b67726f756e642d636f6c6f723a20236533653337663b0a7d0a0a2f2a0a094242436f64650a2a2f0a2e706870626220626c6f636b71756f74652c202e706870626220626c6f636b71756f746520636974652c202e7068706262202e617474616368626f782c202e7068706262202e617474616368626f782064742c202e7068706262202e636f6465626f782c202e7068706262202e636f6465626f782064742c202e7068706262202e696e6c696e652d6174746163686d656e74207b0a09626f726465722d636f6c6f723a20236530653065303b0a7d0a2e706870626220626c6f636b71756f74652c202e7068706262202e617474616368626f782c202e7068706262202e636f6465626f782c202e7068706262202e696e6c696e652d6174746163686d656e74207b0a096261636b67726f756e642d636f6c6f723a20236634663466343b0a7d0a2e706870626220626c6f636b71756f746520626c6f636b71756f74652c202e706870626220626c6f636b71756f7465202e617474616368626f782c202e706870626220626c6f636b71756f7465202e636f6465626f78207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a7d0a2e706870626220626c6f636b71756f74652c202e7068706262202e617474616368626f782064742c202e7068706262202e636f6465626f78206474207b0a09636f6c6f723a20233630363036303b0a7d0a2e706870626220626c6f636b71756f74652063697465207b0a09636f6c6f723a20233030303b0a7d0a0a2f2a0a09546162730a2a2f0a2e7068706262202374616273206c6920612c202e706870626220236d696e6974616273206c692061207b0a096261636b67726f756e642d636f6c6f723a20236638663866383b0a09626f726465722d636f6c6f723a20236438643864383b0a7d0a2e7068706262202374616273206c6920613a686f7665722c202e706870626220236d696e6974616273206c6920613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09626f726465722d636f6c6f723a20233233373262623b0a09636f6c6f723a20236666663b0a7d0a2e7068706262202374616273206c692e61637469766574616220612c202e706870626220237461627320236163746976652d73756273656374696f6e20612c202e706870626220236d696e6974616273206c692e6163746976657461622061207b0a096261636b67726f756e642d636f6c6f723a20233233373262623b0a09626f726465722d636f6c6f723a20233233373262623b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f627574746f6e735f62672e706e6722293b0a09636f6c6f723a20236666663b0a7d0a2e7068706262202374616273206c692e61637469766574616220613a686f7665722c202e706870626220237461627320236163746976652d73756273656374696f6e20613a686f7665722c202e706870626220236d696e6974616273206c692e61637469766574616220613a686f766572207b0a096261636b67726f756e642d636f6c6f723a20236230313431343b0a09626f726465722d636f6c6f723a20236230313431343b0a09636f6c6f723a20236666663b0a7d0a0a2f2a0a09436f6e74726f6c2070616e656c0a2a2f0a2e7068706262202e63702d636f6e74656e74207b0a09626f726465722d636f6c6f723a20236438643864383b0a7d0a0a2e7068706262202e706d5f6d61726b65645f636f6c6f75722c202e7068706262202e746f7069636c697374203e206c692e706d5f6d61726b65645f636f6c6f7572203e20646c206474207b0a09626f726465722d636f6c6f723a20233938326161663b0a7d0a2e7068706262202e706d5f7265706c6965645f636f6c6f75722c202e7068706262202e746f7069636c697374203e206c692e706d5f7265706c6965645f636f6c6f7572203e20646c206474207b0a09626f726465722d636f6c6f723a20233233373262623b0a7d0a2e7068706262202e706d5f667269656e645f636f6c6f75722c202e7068706262202e746f7069636c697374203e206c692e706d5f667269656e645f636f6c6f7572203e20646c206474207b0a09626f726465722d636f6c6f723a20233261616633303b0a7d0a2e7068706262202e706d5f666f655f636f6c6f75722c202e7068706262202e746f7069636c697374203e206c692e706d5f666f655f636f6c6f7572203e20646c206474207b0a09626f726465722d636f6c6f723a20236230313431343b0a7d0a0a2e706870626220646c2e64657461696c73206474207b0a09636f6c6f723a20233830383038303b0a7d0a200a2f2a0a09417661746172732067616c6c6572790a2a2f0a2e7068706262202367616c6c657279206c6162656c3a686f766572207b0a09626f726465722d636f6c6f723a20236434643464343b0a096261636b67726f756e642d636f6c6f723a20236661666166613b0a7d0a0a2f2a0a0952535320666565640a2a2f0a2e706870626220612e666565642d69636f6e2d666f72756d207b0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f7273732e706e6722293b0a7d);
INSERT INTO `phpbb_styles_theme` (`theme_id`, `theme_name`, `theme_copyright`, `theme_path`, `theme_storedb`, `theme_mtime`, `theme_data`) VALUES
(4, 'eMuza_summer', 'Matti &copy; & GamesBoard.pl', 'eMuza_summer', 1, 1267643520, 0x2f2a2020706870424220332e30205374796c652053686565740d0a202020202d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a095374796c65206e616d653a090970726f53696c7665720d0a094261736564206f6e207374796c653a0970726f53696c766572202874686973206973207468652064656661756c742070687042422033207374796c65290d0a094f726967696e616c20617574686f723a09737562426c7565202820687474703a2f2f7777772e737562426c75652e636f6d2f20290d0a094d6f6469666965642062793a09090d0a090d0a09436f7079726967687420323030362070687042422047726f7570202820687474703a2f2f7777772e70687062622e636f6d2f20290d0a202020202d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a2a2f0d0a0d0a2f2a2047656e6572616c2070726f53696c766572204d61726b7570205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2a207b0d0a092f2a2052657365742062726f77736572732064656661756c74206d617267696e2c2070616464696e6720616e6420666f6e742073697a6573202a2f0d0a096d617267696e3a20303b0d0a0970616464696e673a20303b0d0a7d0d0a0d0a68746d6c207b0d0a09666f6e742d73697a653a20313030253b0d0a092f2a20416c776179732073686f772061207363726f6c6c62617220666f722073686f7274207061676573202d2073746f707320746865206a756d70207768656e20746865207363726f6c6c62617220617070656172732e206e6f6e2d49452062726f7773657273202a2f0d0a096865696768743a20313030253b0d0a7d0d0a0d0a626f6479207b0d0a092f2a20546578742d53697a696e67207769746820656d733a20687474703a2f2f7777772e636c61676e75742e636f6d2f626c6f672f3334382f202a2f0d0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09636f6c6f723a20233832383238323b0d0a092f2a666f6e742d73697a653a2036322e35253b09090920546869732073657473207468652064656661756c7420666f6e742073697a6520746f206265206571756976616c656e7420746f2031307078202a2f0d0a09666f6e742d73697a653a20313070783b0d0a096d617267696e3a20303b0d0a0970616464696e673a2030707820303b0d0a096261636b67726f756e642d636f6c6f723a234637433435373b0d0a092f2f6261636b67726f756e642d696d6167653a2075726c287b545f5448454d455f504154487d2f696d616765732f73666f6e646f2e676966293b0d0a0d0a7d0d0a0d0a23746c6f207b0d0a096261636b67726f756e642d696d6167653a2075726c287b545f5448454d455f504154487d2f696d616765732f73666f6e646f2e676966293b0d0a096261636b67726f756e642d7265706561743a207265706561742d783b0d0a096261636b67726f756e642d6174746163686d656e743a2066697865643b0d0a7d0d0a0d0a0d0a0d0a6831207b0d0a092f2a20466f72756d206e616d65202a2f0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a096d617267696e2d72696768743a2032303070783b0d0a09636f6c6f723a20234646464646463b0d0a096d617267696e2d746f703a20313570783b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09666f6e742d73697a653a2032656d3b0d0a7d0d0a0d0a6832207b0d0a092f2a20466f72756d20686561646572207469746c6573202a2f0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636f6c6f723a20233366336633663b0d0a09666f6e742d73697a653a2032656d3b0d0a096d617267696e3a20302e38656d203020302e32656d20303b0d0a7d0d0a0d0a68322e736f6c6f207b0d0a096d617267696e2d626f74746f6d3a2031656d3b0d0a7d0d0a0d0a6833207b0d0a092f2a205375622d686561646572732028616c736f207573656420617320706f737420686561646572732c2062757420646566696e6564206c6174657229202a2f0d0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09746578742d7472616e73666f726d3a207570706572636173653b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420234343434343433b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a0970616464696e672d626f74746f6d3a203270783b0d0a09666f6e742d73697a653a20312e3035656d3b0d0a09636f6c6f723a20233938393839383b0d0a096d617267696e2d746f703a20323070783b0d0a7d0d0a0d0a6834207b0d0a092f2a20466f72756d20616e6420746f706963206c697374207469746c6573202a2f0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2053616e732d73657269663b0d0a09666f6e742d73697a653a20312e33656d3b0d0a7d0d0a0d0a70207b0d0a096c696e652d6865696768743a20312e33656d3b0d0a09666f6e742d73697a653a20312e31656d3b0d0a096d617267696e2d626f74746f6d3a20312e35656d3b0d0a7d0d0a0d0a696d67207b0d0a09626f726465722d77696474683a20303b0d0a7d0d0a0d0a6872207b0d0a092f2a20416c736f2073656520747765616b732e637373202a2f0d0a09626f726465723a2030206e6f6e6520234646464646463b0d0a09626f726465722d746f703a2031707820736f6c696420234343434343433b0d0a096865696768743a203170783b0d0a096d617267696e3a2035707820303b0d0a09646973706c61793a20626c6f636b3b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a68722e646173686564207b0d0a09626f726465722d746f703a203170782064617368656420234343434343433b0d0a096d617267696e3a203130707820303b0d0a7d0d0a0d0a68722e64697669646572207b0d0a09646973706c61793a206e6f6e653b0d0a7d0d0a0d0a702e7269676874207b0d0a09746578742d616c69676e3a2072696768743b0d0a7d0d0a0d0a2f2a204d61696e20626c6f636b730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2377726170207b0d0a2020206d696e2d77696474683a2036353070783b0d0a2020206d617267696e3a307078206175746f3b0d0a20202070616464696e673a3070783b0d0a202020746578742d616c69676e3a6c6566743b0d0a20202077696474683a39303070783b0d0a202020626f726465723a2032707820736f6c696420234633443134383b0d0a2020206261636b67726f756e642d636f6c6f723a20236666663b0d0a7d0d0a0d0a237772617032207b0d0a0977696474683a2038383070783b0d0a202020206d617267696e3a307078206175746f3b0d0a2020202070616464696e673a3070783b0d0a7d0d0a0d0a0d0a2e6f6e6509097b20746578742d6465636f726174696f6e3a206e6f6e653b20666f6e742d776569676874203a20626f6c643b20666f6e742d73697a65203a20313170783b20636f6c6f72203a20236666656363393b20666f6e742d66616d696c793a207461686f6d613b2070616464696e672d6c6566743a203770783b2070616464696e672d72696768743a203770783b7d0d0a612e6f6e6509097b2070616464696e672d6c6566743a203770783b2070616464696e672d72696768743a203770783b207d0d0a612e6f6e653a686f766572207b20636f6c6f72203a20236164373330313b2070616464696e672d6c6566743a203770783b2070616464696e672d72696768743a203770783b2070616464696e672d626f74746f6d3a203670783b2070616464696e672d746f703a203570783b20666f6e742d776569676874203a20626f6c643b7d0d0a0d0a0d0a2373696d706c652d77726170207b0d0a0970616464696e673a2036707820313070783b0d0a7d0d0a0d0a23706167652d626f6479207b0d0a096d617267696e3a2034707820303b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a23706167652d666f6f746572207b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a23706167652d666f6f746572206833207b0d0a096d617267696e2d746f703a20323070783b0d0a7d0d0a0d0a236c6f676f207b0d0a0977696474683a2039303070783b0d0a096865696768743a2031383670783b0d0a096261636b67726f756e643a2075726c287b545f5448454d455f504154487d2f696d616765732f746f702e676966293b0d0a09666c6f61743a206c6566743b0d0a7d0d0a0d0a61236c6f676f3a686f766572207b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2f2a2053656172636820626f780d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a237365617263682d626f78207b0d0a09636f6c6f723a20234646464646463b0d0a09706f736974696f6e3a2072656c61746976653b0d0a096d617267696e2d746f703a20333070783b0d0a096d617267696e2d72696768743a203570783b0d0a09646973706c61793a20626c6f636b3b0d0a09666c6f61743a2072696768743b0d0a09746578742d616c69676e3a2072696768743b0d0a0977686974652d73706163653a206e6f777261703b202f2a20466f72204f70657261202a2f0d0a7d0d0a0d0a237365617263682d626f7820236b6579776f726473207b0d0a0977696474683a20393570783b0d0a096261636b67726f756e642d636f6c6f723a20234646463b0d0a7d0d0a0d0a237365617263682d626f7820696e707574207b0d0a09626f726465723a2031707820736f6c696420236230623062303b0d0a7d0d0a0d0a2f2a202e627574746f6e31207374796c6520646566696e6564206c617465722c206a75737420612066657720747765616b7320666f72207468652073656172636820627574746f6e2076657273696f6e202a2f0d0a237365617263682d626f7820696e7075742e627574746f6e31207b0d0a0970616464696e673a20317078203570783b0d0a7d0d0a0d0a237365617263682d626f78206c69207b0d0a09746578742d616c69676e3a2072696768743b0d0a096d617267696e2d746f703a203470783b0d0a7d0d0a0d0a237365617263682d626f7820696d67207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a096d617267696e2d72696768743a203370783b0d0a7d0d0a0d0a2f2a2053697465206465736372697074696f6e20616e64206c6f676f202a2f0d0a23736974652d6465736372697074696f6e207b0d0a09666c6f61743a206c6566743b0d0a0977696474683a203730253b0d0a7d0d0a0d0a23736974652d6465736372697074696f6e206831207b0d0a096d617267696e2d72696768743a20303b0d0a7d0d0a0d0a2f2a20526f756e6420636f726e6572656420626f78657320616e64206261636b67726f756e64730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e686561646572626172207b0d0a096261636b67726f756e643a2023656265626562206e6f6e65207265706561742d78203020303b0d0a09636f6c6f723a20234646464646463b0d0a096d617267696e2d626f74746f6d3a203470783b0d0a0970616464696e673a2030203570783b0d0a7d0d0a0d0a2e6e6176626172207b0d0a096261636b67726f756e642d636f6c6f723a20236562656265623b0d0a0970616464696e673a203020313070783b0d0a7d0d0a0d0a2e666f72616267207b0d0a096261636b67726f756e643a2023623162316231206e6f6e65207265706561742d78203020303b0d0a096d617267696e2d626f74746f6d3a203470783b0d0a0970616464696e673a2030203570783b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a2e666f72756d6267207b0d0a096261636b67726f756e643a2023656265626562206e6f6e65207265706561742d78203020303b0d0a096d617267696e2d626f74746f6d3a203470783b0d0a0970616464696e673a2030203570783b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a2e70616e656c207b0d0a096d617267696e2d626f74746f6d3a203470783b0d0a0970616464696e673a203020313070783b0d0a096261636b67726f756e642d636f6c6f723a20236633663366333b0d0a09636f6c6f723a20233366336633663b0d0a7d0d0a0d0a2e706f7374207b0d0a0970616464696e673a203020313070783b0d0a096d617267696e2d626f74746f6d3a203470783b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0d0a7d0d0a0d0a2e706f73743a746172676574202e636f6e74656e74207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2e706f73743a7461726765742068332061207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2e626731097b206261636b67726f756e642d636f6c6f723a20236637663766373b7d0d0a2e626732097b206261636b67726f756e642d636f6c6f723a20236632663266323b207d0d0a2e626733097b206261636b67726f756e642d636f6c6f723a20236562656265623b207d0d0a0d0a2e726f776267207b0d0a096d617267696e3a203570782035707820327078203570783b0d0a7d0d0a0d0a2e756370726f776267207b0d0a096261636b67726f756e642d636f6c6f723a20236532653265323b0d0a7d0d0a0d0a2e6669656c64736267207b0d0a092f2a626f726465723a20317078202344424445453220736f6c69643b2a2f0d0a096261636b67726f756e642d636f6c6f723a20236561656165613b0d0a7d0d0a0d0a7370616e2e636f726e6572732d746f702c207370616e2e636f726e6572732d626f74746f6d2c207370616e2e636f726e6572732d746f70207370616e2c207370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a09666f6e742d73697a653a203170783b0d0a096c696e652d6865696768743a203170783b0d0a09646973706c61793a20626c6f636b3b0d0a096865696768743a203570783b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a7d0d0a0d0a7370616e2e636f726e6572732d746f70207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a203020303b0d0a096d617267696e3a2030202d3570783b0d0a7d0d0a0d0a7370616e2e636f726e6572732d746f70207370616e207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0d0a7d0d0a0d0a7370616e2e636f726e6572732d626f74746f6d207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0d0a096d617267696e3a2030202d3570783b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a7370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a203130302520313030253b0d0a7d0d0a0d0a2e686561646267207370616e2e636f726e6572732d626f74746f6d207b0d0a096d617267696e2d626f74746f6d3a202d3170783b0d0a7d0d0a0d0a2e706f7374207370616e2e636f726e6572732d746f702c202e706f7374207370616e2e636f726e6572732d626f74746f6d2c202e70616e656c207370616e2e636f726e6572732d746f702c202e70616e656c207370616e2e636f726e6572732d626f74746f6d2c202e6e6176626172207370616e2e636f726e6572732d746f702c202e6e6176626172207370616e2e636f726e6572732d626f74746f6d207b0d0a096d617267696e3a2030202d313070783b0d0a7d0d0a0d0a2e72756c6573207370616e2e636f726e6572732d746f70207b0d0a096d617267696e3a2030202d3130707820357078202d313070783b0d0a7d0d0a0d0a2e72756c6573207370616e2e636f726e6572732d626f74746f6d207b0d0a096d617267696e3a20357078202d313070782030202d313070783b0d0a7d0d0a0d0a2f2a20486f72697a6f6e74616c206c697374730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a756c2e6c696e6b6c697374207b0d0a09646973706c61793a20626c6f636b3b0d0a096d617267696e3a20303b0d0a7d0d0a0d0a756c2e6c696e6b6c697374206c69207b0d0a09646973706c61793a20626c6f636b3b0d0a096c6973742d7374796c652d747970653a206e6f6e653b0d0a09666c6f61743a206c6566743b0d0a0977696474683a206175746f3b0d0a096d617267696e2d72696768743a203570783b0d0a09666f6e742d73697a653a20312e31656d3b0d0a096c696e652d6865696768743a20322e32656d3b0d0a7d0d0a0d0a756c2e6c696e6b6c697374206c692e7269676874736964652c20702e726967687473696465207b0d0a09666c6f61743a2072696768743b0d0a096d617267696e2d72696768743a20303b0d0a096d617267696e2d6c6566743a203570783b0d0a09746578742d616c69676e3a2072696768743b0d0a7d0d0a0d0a756c2e6e61766c696e6b73207b0d0a0970616464696e672d626f74746f6d3a203170783b0d0a096d617267696e2d626f74746f6d3a203170783b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420234646464646463b0d0a09666f6e742d7765696768743a20626f6c643b0d0a7d0d0a0d0a756c2e6c65667473696465207b0d0a09666c6f61743a206c6566743b0d0a096d617267696e2d6c6566743a20303b0d0a096d617267696e2d72696768743a203570783b0d0a09746578742d616c69676e3a206c6566743b0d0a7d0d0a0d0a756c2e726967687473696465207b0d0a09666c6f61743a2072696768743b0d0a096d617267696e2d6c6566743a203570783b0d0a096d617267696e2d72696768743a202d3570783b0d0a09746578742d616c69676e3a2072696768743b0d0a7d0d0a0d0a2f2a205461626c65207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a7461626c652e7461626c6531207b0d0a092f2a2053656520747765616b732e637373202a2f0d0a7d0d0a0d0a237563702d6d61696e207461626c652e7461626c6531207b0d0a0970616464696e673a203270783b0d0a7d0d0a0d0a7461626c652e7461626c6531207468656164207468207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09746578742d7472616e73666f726d3a207570706572636173653b0d0a09636f6c6f723a20234646464646463b0d0a096c696e652d6865696768743a20312e33656d3b0d0a09666f6e742d73697a653a2031656d3b0d0a0970616464696e673a2030203020347078203370783b0d0a7d0d0a0d0a7461626c652e7461626c6531207468656164207468207370616e207b0d0a0970616464696e672d6c6566743a203770783b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f6479207472207b0d0a09626f726465723a2031707820736f6c696420236366636663663b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f64792074723a686f7665722c207461626c652e7461626c65312074626f64792074722e686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236636663666363b0d0a09636f6c6f723a20233030303b0d0a7d0d0a0d0a7461626c652e7461626c6531207464207b0d0a09636f6c6f723a20233661366136613b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f6479207464207b0d0a0970616464696e673a203570783b0d0a09626f726465722d746f703a2031707820736f6c696420234641464146413b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f6479207468207b0d0a0970616464696e673a203570783b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420233030303030303b0d0a09746578742d616c69676e3a206c6566743b0d0a09636f6c6f723a20233333333333333b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2f2a20537065636966696320636f6c756d6e207374796c6573202a2f0d0a7461626c652e7461626c6531202e6e616d6509097b20746578742d616c69676e3a206c6566743b207d0d0a7461626c652e7461626c6531202e706f73747309097b20746578742d616c69676e3a2063656e7465722021696d706f7274616e743b2077696474683a2037253b207d0d0a7461626c652e7461626c6531202e6a6f696e6564097b20746578742d616c69676e3a206c6566743b2077696474683a203135253b207d0d0a7461626c652e7461626c6531202e616374697665097b20746578742d616c69676e3a206c6566743b2077696474683a203135253b207d0d0a7461626c652e7461626c6531202e6d61726b09097b20746578742d616c69676e3a2063656e7465723b2077696474683a2037253b207d0d0a7461626c652e7461626c6531202e696e666f09097b20746578742d616c69676e3a206c6566743b2077696474683a203330253b207d0d0a7461626c652e7461626c6531202e696e666f20646976097b2077696474683a20313030253b2077686974652d73706163653a206e6f777261703b206f766572666c6f773a2068696464656e3b207d0d0a7461626c652e7461626c6531202e6175746f636f6c097b206c696e652d6865696768743a2032656d3b2077686974652d73706163653a206e6f777261703b207d0d0a7461626c652e7461626c6531207468656164202e6175746f636f6c207b2070616464696e672d6c6566743a2031656d3b207d0d0a0d0a7461626c652e7461626c6531207370616e2e72616e6b2d696d67207b0d0a09666c6f61743a2072696768743b0d0a0977696474683a206175746f3b0d0a7d0d0a0d0a7461626c652e696e666f207464207b0d0a0970616464696e673a203370783b0d0a7d0d0a0d0a7461626c652e696e666f2074626f6479207468207b0d0a0970616464696e673a203370783b0d0a09746578742d616c69676e3a2072696768743b0d0a09766572746963616c2d616c69676e3a20746f703b0d0a09636f6c6f723a20233030303030303b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a7d0d0a0d0a2e666f72756d6267207461626c652e7461626c6531207b0d0a096d617267696e3a2030202d327078202d317078202d3170783b0d0a7d0d0a0d0a2f2a204d697363206c61796f7574207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2f2a20636f6c756d6e5b312d325d207374796c65732061726520636f6e7461696e65727320666f722074776f20636f6c756d6e206c61796f757473200d0a202020416c736f2073656520747765616b732e637373202a2f0d0a2e636f6c756d6e31207b0d0a09666c6f61743a206c6566743b0d0a09636c6561723a206c6566743b0d0a0977696474683a203439253b0d0a7d0d0a0d0a2e636f6c756d6e32207b0d0a09666c6f61743a2072696768743b0d0a09636c6561723a2072696768743b0d0a0977696474683a203439253b0d0a7d0d0a0d0a2f2a2047656e6572616c20636c617373657320666f7220706c6163696e6720666c6f6174696e6720626c6f636b73202a2f0d0a2e6c6566742d626f78207b0d0a09666c6f61743a206c6566743b0d0a0977696474683a206175746f3b0d0a09746578742d616c69676e3a206c6566743b0d0a7d0d0a0d0a2e72696768742d626f78207b0d0a09666c6f61743a2072696768743b0d0a0977696474683a206175746f3b0d0a09746578742d616c69676e3a2072696768743b0d0a7d0d0a0d0a646c2e64657461696c73207b0d0a092f2a666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b2a2f0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a646c2e64657461696c73206474207b0d0a09666c6f61743a206c6566743b0d0a09636c6561723a206c6566743b0d0a0977696474683a203330253b0d0a09746578742d616c69676e3a2072696768743b0d0a09636f6c6f723a20233030303030303b0d0a09646973706c61793a20626c6f636b3b0d0a7d0d0a0d0a646c2e64657461696c73206464207b0d0a096d617267696e2d6c6566743a20303b0d0a0970616464696e672d6c6566743a203570783b0d0a096d617267696e2d626f74746f6d3a203570783b0d0a09636f6c6f723a20233832383238323b0d0a09666c6f61743a206c6566743b0d0a0977696474683a203635253b0d0a7d0d0a0d0a2f2a20506167696e6174696f6e0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e706167696e6174696f6e207b0d0a096865696768743a2031253b202f2a20494520747765616b2028686f6c6c79206861636b29202a2f0d0a0977696474683a206175746f3b0d0a09746578742d616c69676e3a2072696768743b0d0a096d617267696e2d746f703a203570783b0d0a09666c6f61743a2072696768743b0d0a7d0d0a0d0a2e706167696e6174696f6e207370616e2e706167652d736570207b0d0a09646973706c61793a206e6f6e653b0d0a7d0d0a0d0a6c692e706167696e6174696f6e207b0d0a096d617267696e2d746f703a20303b0d0a7d0d0a0d0a2e706167696e6174696f6e207374726f6e672c202e706167696e6174696f6e2062207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a7d0d0a0d0a2e706167696e6174696f6e207370616e207374726f6e67207b0d0a0970616464696e673a2030203270783b0d0a096d617267696e3a2030203270783b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636f6c6f723a20234646464646463b0d0a096261636b67726f756e642d636f6c6f723a20236266626662663b0d0a09626f726465723a2031707820736f6c696420236266626662663b0d0a09666f6e742d73697a653a20302e39656d3b0d0a7d0d0a0d0a2e706167696e6174696f6e207370616e20612c202e706167696e6174696f6e207370616e20613a6c696e6b2c202e706167696e6174696f6e207370616e20613a766973697465642c202e706167696e6174696f6e207370616e20613a616374697665207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09636f6c6f723a20233734373437343b0d0a096d617267696e3a2030203270783b0d0a0970616464696e673a2030203270783b0d0a096261636b67726f756e642d636f6c6f723a20236565656565653b0d0a09626f726465723a2031707820736f6c696420236261626162613b0d0a09666f6e742d73697a653a20302e39656d3b0d0a096c696e652d6865696768743a20312e35656d3b0d0a7d0d0a0d0a2e706167696e6174696f6e207370616e20613a686f766572207b0d0a09626f726465722d636f6c6f723a20236432643264323b0d0a096261636b67726f756e642d636f6c6f723a20236432643264323b0d0a09636f6c6f723a20234646463b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2e706167696e6174696f6e20696d67207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a7d0d0a0d0a2f2a20506167696e6174696f6e20696e2076696577666f72756d20666f72206d756c74697061676520746f70696373202a2f0d0a2e726f77202e706167696e6174696f6e207b0d0a09646973706c61793a20626c6f636b3b0d0a09666c6f61743a2072696768743b0d0a0977696474683a206175746f3b0d0a096d617267696e2d746f703a20303b0d0a0970616464696e673a2031707820302031707820313570783b0d0a09666f6e742d73697a653a20302e39656d3b0d0a096261636b67726f756e643a206e6f6e65203020353025206e6f2d7265706561743b0d0a7d0d0a0d0a2e726f77202e706167696e6174696f6e207370616e20612c206c692e706167696e6174696f6e207370616e2061207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2e726f77202e706167696e6174696f6e207370616e20613a686f7665722c206c692e706167696e6174696f6e207370616e20613a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236432643264323b0d0a7d0d0a0d0a2f2a204d697363656c6c616e656f7573207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a23666f72756d2d7065726d697373696f6e73207b0d0a09666c6f61743a2072696768743b0d0a0977696474683a206175746f3b0d0a0970616464696e672d6c6566743a203570783b0d0a096d617267696e2d6c6566743a203570783b0d0a096d617267696e2d746f703a20313070783b0d0a09746578742d616c69676e3a2072696768743b0d0a7d0d0a0d0a2e636f70797269676874207b0d0a0970616464696e673a203570783b0d0a09746578742d616c69676e3a2063656e7465723b0d0a09636f6c6f723a20233535353535353b0d0a7d0d0a0d0a2e736d616c6c207b0d0a09666f6e742d73697a653a20302e39656d2021696d706f7274616e743b0d0a7d0d0a0d0a2e7469746c657370616365207b0d0a096d617267696e2d626f74746f6d3a20313570783b0d0a7d0d0a0d0a2e6865616465727370616365207b0d0a096d617267696e2d746f703a20323070783b0d0a7d0d0a0d0a2e6572726f72207b0d0a09636f6c6f723a20236263626362633b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09666f6e742d73697a653a2031656d3b0d0a7d0d0a0d0a2e7265706f72746564207b0d0a096261636b67726f756e642d636f6c6f723a20236637663766373b0d0a7d0d0a0d0a6c692e7265706f727465643a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236563656365633b0d0a7d0d0a0d0a6469762e72756c6573207b0d0a096261636b67726f756e642d636f6c6f723a20236563656365633b0d0a09636f6c6f723a20236263626362633b0d0a0970616464696e673a203020313070783b0d0a096d617267696e3a203130707820303b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a6469762e72756c657320756c207b0d0a096d617267696e2d6c6566743a20323070783b0d0a7d0d0a0d0a702e72756c6573207b0d0a096261636b67726f756e642d636f6c6f723a20236563656365633b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a0970616464696e673a203570783b0d0a7d0d0a0d0a702e72756c657320696d67207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a7d0d0a0d0a702e72756c65732061207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a23746f70207b0d0a09706f736974696f6e3a206162736f6c7574653b0d0a09746f703a202d323070783b0d0a7d0d0a0d0a2e636c656172207b0d0a09646973706c61793a20626c6f636b3b0d0a09636c6561723a20626f74683b0d0a09666f6e742d73697a653a203170783b0d0a096c696e652d6865696768743a203170783b0d0a096261636b67726f756e643a207472616e73706172656e743b0d0a7d0d0a2f2a2070726f53696c766572204c696e6b205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a613a6c696e6b097b20636f6c6f723a20233839383938393b20746578742d6465636f726174696f6e3a206e6f6e653b207d0d0a613a76697369746564097b20636f6c6f723a20233839383938393b20746578742d6465636f726174696f6e3a206e6f6e653b207d0d0a613a686f766572097b20636f6c6f723a20236433643364333b20746578742d6465636f726174696f6e3a20756e6465726c696e653b207d0d0a613a616374697665097b20636f6c6f723a20236432643264323b20746578742d6465636f726174696f6e3a206e6f6e653b207d0d0a0d0a2f2a20436f6c6f7572656420757365726e616d6573202a2f0d0a2e757365726e616d652d636f6c6f75726564207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09646973706c61793a20696e6c696e652021696d706f7274616e743b0d0a7d0d0a0d0a2f2a204c696e6b73206f6e206772616469656e74206261636b67726f756e6473202a2f0d0a237365617263682d626f7820613a6c696e6b2c202e6e6176626720613a6c696e6b2c202e666f72756d6267202e68656164657220613a6c696e6b2c202e666f72616267202e68656164657220613a6c696e6b2c20746820613a6c696e6b207b0d0a09636f6c6f723a20234646464646463b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a237365617263682d626f7820613a766973697465642c202e6e6176626720613a766973697465642c202e666f72756d6267202e68656164657220613a766973697465642c202e666f72616267202e68656164657220613a766973697465642c20746820613a76697369746564207b0d0a09636f6c6f723a20234646464646463b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a237365617263682d626f7820613a686f7665722c202e6e6176626720613a686f7665722c202e666f72756d6267202e68656164657220613a686f7665722c202e666f72616267202e68656164657220613a686f7665722c20746820613a686f766572207b0d0a09636f6c6f723a20236666666666663b0d0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0d0a7d0d0a0d0a237365617263682d626f7820613a6163746976652c202e6e6176626720613a6163746976652c202e666f72756d6267202e68656164657220613a6163746976652c202e666f72616267202e68656164657220613a6163746976652c20746820613a616374697665207b0d0a09636f6c6f723a20236666666666663b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2f2a204c696e6b7320666f7220666f72756d2f746f706963206c69737473202a2f0d0a612e666f72756d7469746c65207b0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2048656c7665746963612c20417269616c2c2053616e732d73657269663b0d0a09666f6e742d73697a653a20312e32656d3b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233839383938393b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2f2a20612e666f72756d7469746c653a76697369746564207b20636f6c6f723a20233839383938393b207d202a2f0d0a0d0a612e666f72756d7469746c653a686f766572207b0d0a09636f6c6f723a20236263626362633b0d0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0d0a7d0d0a0d0a612e666f72756d7469746c653a616374697665207b0d0a09636f6c6f723a20233839383938393b0d0a7d0d0a0d0a612e746f7069637469746c65207b0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2048656c7665746963612c20417269616c2c2053616e732d73657269663b0d0a09666f6e742d73697a653a20312e32656d3b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233839383938393b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2f2a20612e746f7069637469746c653a76697369746564207b20636f6c6f723a20236432643264323b207d202a2f0d0a0d0a612e746f7069637469746c653a686f766572207b0d0a09636f6c6f723a20236263626362633b0d0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0d0a7d0d0a0d0a612e746f7069637469746c653a616374697665207b0d0a09636f6c6f723a20233839383938393b0d0a7d0d0a0d0a2f2a20506f737420626f6479206c696e6b73202a2f0d0a2e706f73746c696e6b207b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09636f6c6f723a20236432643264323b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420236432643264323b0d0a0970616464696e672d626f74746f6d3a20303b0d0a7d0d0a0d0a2e706f73746c696e6b3a76697369746564207b0d0a09636f6c6f723a20236264626462643b0d0a09626f726465722d626f74746f6d2d7374796c653a20646f747465643b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233636363636363b0d0a7d0d0a0d0a2e706f73746c696e6b3a616374697665207b0d0a09636f6c6f723a20236432643264323b0d0a7d0d0a0d0a2e706f73746c696e6b3a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236636663666363b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09636f6c6f723a20233430343034303b0d0a7d0d0a0d0a2e7369676e617475726520612c202e7369676e617475726520613a766973697465642c202e7369676e617475726520613a6163746976652c202e7369676e617475726520613a686f766572207b0d0a09626f726465723a206e6f6e653b0d0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0d0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a2f2a2050726f66696c65206c696e6b73202a2f0d0a2e706f737470726f66696c6520613a6c696e6b2c202e706f737470726f66696c6520613a6163746976652c202e706f737470726f66696c6520613a766973697465642c202e706f737470726f66696c652064742e617574686f722061207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233839383938393b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2e706f737470726f66696c6520613a686f7665722c202e706f737470726f66696c652064742e617574686f7220613a686f766572207b0d0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b0d0a09636f6c6f723a20236433643364333b0d0a7d0d0a0d0a0d0a2f2a2050726f66696c6520736561726368726573756c7473202a2f090d0a2e736561726368202e706f737470726f66696c652061207b0d0a09636f6c6f723a20233839383938393b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b200d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a7d0d0a0d0a2e736561726368202e706f737470726f66696c6520613a686f766572207b0d0a09636f6c6f723a20236433643364333b0d0a09746578742d6465636f726174696f6e3a20756e6465726c696e653b200d0a7d0d0a0d0a2f2a204261636b20746f20746f70206f662070616765202a2f0d0a2e6261636b32746f70207b0d0a09636c6561723a20626f74683b0d0a096865696768743a20313170783b0d0a09746578742d616c69676e3a2072696768743b0d0a7d0d0a0d0a612e746f70207b0d0a096261636b67726f756e643a206e6f6e65206e6f2d72657065617420746f70206c6566743b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a0977696474683a207b494d475f49434f4e5f4241434b5f544f505f57494454487d70783b0d0a096865696768743a207b494d475f49434f4e5f4241434b5f544f505f4845494748547d70783b0d0a09646973706c61793a20626c6f636b3b0d0a09666c6f61743a2072696768743b0d0a096f766572666c6f773a2068696464656e3b0d0a096c65747465722d73706163696e673a203130303070783b0d0a09746578742d696e64656e743a20313170783b0d0a7d0d0a0d0a612e746f7032207b0d0a096261636b67726f756e643a206e6f6e65206e6f2d7265706561742030203530253b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a0970616464696e672d6c6566743a20313570783b0d0a7d0d0a0d0a2f2a204172726f77206c696e6b7320202a2f0d0a612e757009097b206261636b67726f756e643a206e6f6e65206e6f2d726570656174206c6566742063656e7465723b207d0d0a612e646f776e09097b206261636b67726f756e643a206e6f6e65206e6f2d7265706561742072696768742063656e7465723b207d0d0a612e6c65667409097b206261636b67726f756e643a206e6f6e65206e6f2d72657065617420337078203630253b207d0d0a612e726967687409097b206261636b67726f756e643a206e6f6e65206e6f2d72657065617420393525203630253b207d0d0a0d0a612e75702c20612e75703a6c696e6b2c20612e75703a6163746976652c20612e75703a76697369746564207b0d0a0970616464696e672d6c6566743a20313070783b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09626f726465722d626f74746f6d2d77696474683a20303b0d0a7d0d0a0d0a612e75703a686f766572207b0d0a096261636b67726f756e642d706f736974696f6e3a206c65667420746f703b0d0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a612e646f776e2c20612e646f776e3a6c696e6b2c20612e646f776e3a6163746976652c20612e646f776e3a76697369746564207b0d0a0970616464696e672d72696768743a20313070783b0d0a7d0d0a0d0a612e646f776e3a686f766572207b0d0a096261636b67726f756e642d706f736974696f6e3a20726967687420626f74746f6d3b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a612e6c6566742c20612e6c6566743a6163746976652c20612e6c6566743a76697369746564207b0d0a0970616464696e672d6c6566743a20313270783b0d0a7d0d0a0d0a612e6c6566743a686f766572207b0d0a09636f6c6f723a20236432643264323b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a2030203630253b0d0a7d0d0a0d0a612e72696768742c20612e72696768743a6163746976652c20612e72696768743a76697369746564207b0d0a0970616464696e672d72696768743a20313270783b0d0a7d0d0a0d0a612e72696768743a686f766572207b0d0a09636f6c6f723a20236432643264323b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a2031303025203630253b0d0a7d0d0a2f2a2070726f53696c76657220436f6e74656e74205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a756c2e746f7069636c697374207b0d0a09646973706c61793a20626c6f636b3b0d0a096c6973742d7374796c652d747970653a206e6f6e653b0d0a096d617267696e3a20303b0d0a7d0d0a0d0a756c2e666f72756d73207b0d0a096261636b67726f756e643a2023663966396639206e6f6e65207265706561742d78203020303b0d0a7d0d0a0d0a756c2e746f7069636c697374206c69207b0d0a09646973706c61793a20626c6f636b3b0d0a096c6973742d7374796c652d747970653a206e6f6e653b0d0a09636f6c6f723a20233737373737373b0d0a096d617267696e3a20303b0d0a7d0d0a0d0a756c2e746f7069636c69737420646c207b0d0a09706f736974696f6e3a2072656c61746976653b0d0a7d0d0a0d0a756c2e746f7069636c697374206c692e726f7720646c207b0d0a0970616464696e673a2032707820303b0d0a7d0d0a0d0a756c2e746f7069636c697374206474207b0d0a09646973706c61793a20626c6f636b3b0d0a09666c6f61743a206c6566743b0d0a0977696474683a203530253b0d0a09666f6e742d73697a653a20312e31656d3b0d0a0970616464696e672d6c6566743a203570783b0d0a0970616464696e672d72696768743a203570783b0d0a7d0d0a0d0a756c2e746f7069636c697374206464207b0d0a09646973706c61793a20626c6f636b3b0d0a09666c6f61743a206c6566743b0d0a09626f726465722d6c6566743a2031707820736f6c696420234646464646463b0d0a0970616464696e673a2034707820303b0d0a7d0d0a0d0a756c2e746f7069636c6973742064666e207b0d0a092f2a204c6162656c7320666f7220706f73742f7669657720636f756e7473202a2f0d0a09646973706c61793a206e6f6e653b0d0a7d0d0a0d0a756c2e746f7069636c697374206c692e726f7720647420612e737562666f72756d207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a2030203530253b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a09706f736974696f6e3a2072656c61746976653b0d0a0977686974652d73706163653a206e6f777261703b0d0a0970616464696e673a20302030203020313270783b0d0a7d0d0a0d0a2e666f72756d2d696d616765207b0d0a09666c6f61743a206c6566743b0d0a0970616464696e672d746f703a203570783b0d0a096d617267696e2d72696768743a203570783b0d0a7d0d0a0d0a6c692e726f77207b0d0a09626f726465722d746f703a2031707820736f6c696420234646464646463b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420233866386638663b0d0a7d0d0a0d0a6c692e726f77207374726f6e67207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a6c692e726f773a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236636663666363b0d0a7d0d0a0d0a6c692e726f773a686f766572206464207b0d0a09626f726465722d6c6566742d636f6c6f723a20234343434343433b0d0a7d0d0a0d0a6c692e6865616465722064742c206c692e686561646572206464207b0d0a096c696e652d6865696768743a2031656d3b0d0a09626f726465722d6c6566742d77696474683a20303b0d0a096d617267696e3a2032707820302034707820303b0d0a09636f6c6f723a20234646464646463b0d0a0970616464696e672d746f703a203270783b0d0a0970616464696e672d626f74746f6d3a203270783b0d0a09666f6e742d73697a653a2031656d3b0d0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a09746578742d7472616e73666f726d3a207570706572636173653b0d0a7d0d0a0d0a6c692e686561646572206474207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a7d0d0a0d0a6c692e686561646572206464207b0d0a096d617267696e2d6c6566743a203170783b0d0a7d0d0a0d0a6c692e68656164657220646c2e69636f6e207b0d0a096d696e2d6865696768743a20303b0d0a7d0d0a0d0a6c692e68656164657220646c2e69636f6e206474207b0d0a092f2a20547765616b20666f72206865616465727320616c69676e6d656e74207768656e20666f6c6465722069636f6e2075736564202a2f0d0a0970616464696e672d6c6566743a20303b0d0a0970616464696e672d72696768743a20353070783b0d0a7d0d0a0d0a2f2a20466f72756d206c69737420636f6c756d6e207374796c6573202a2f0d0a646c2e69636f6e207b0d0a096d696e2d6865696768743a20333570783b0d0a096261636b67726f756e642d706f736974696f6e3a2031307078203530253b09092f2a20506f736974696f6e206f6620666f6c6465722069636f6e202a2f0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a7d0d0a0d0a646c2e69636f6e206474207b0d0a0970616464696e672d6c6566743a20343570783b09090909092f2a20537061636520666f7220666f6c6465722069636f6e202a2f0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a096261636b67726f756e642d706f736974696f6e3a20357078203935253b09092f2a20506f736974696f6e206f6620746f7069632069636f6e202a2f0d0a7d0d0a0d0a64642e706f7374732c2064642e746f706963732c2064642e7669657773207b0d0a0977696474683a2038253b0d0a09746578742d616c69676e3a2063656e7465723b0d0a096c696e652d6865696768743a20322e32656d3b0d0a09666f6e742d73697a653a20312e32656d3b0d0a7d0d0a0d0a64642e6c617374706f7374207b0d0a0977696474683a203235253b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a64642e7265646972656374207b0d0a09666f6e742d73697a653a20312e31656d3b0d0a096c696e652d6865696768743a20322e35656d3b0d0a7d0d0a0d0a64642e6d6f6465726174696f6e207b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a64642e6c617374706f7374207370616e2c20756c2e746f7069636c6973742064642e7365617263686279207370616e2c20756c2e746f7069636c6973742064642e696e666f207370616e2c20756c2e746f7069636c6973742064642e74696d65207370616e2c2064642e7265646972656374207370616e2c2064642e6d6f6465726174696f6e207370616e207b0d0a09646973706c61793a20626c6f636b3b0d0a0970616464696e672d6c6566743a203570783b0d0a7d0d0a0d0a64642e74696d65207b0d0a0977696474683a206175746f3b0d0a096c696e652d6865696768743a20323030253b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a64642e6578747261207b0d0a0977696474683a203132253b0d0a096c696e652d6865696768743a20323030253b0d0a09746578742d616c69676e3a2063656e7465723b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a64642e6d61726b207b0d0a09666c6f61743a2072696768742021696d706f7274616e743b0d0a0977696474683a2039253b0d0a09746578742d616c69676e3a2063656e7465723b0d0a096c696e652d6865696768743a20323030253b0d0a09666f6e742d73697a653a20312e32656d3b0d0a7d0d0a0d0a64642e696e666f207b0d0a0977696474683a203330253b0d0a7d0d0a0d0a64642e6f7074696f6e207b0d0a0977696474683a203135253b0d0a096c696e652d6865696768743a20323030253b0d0a09746578742d616c69676e3a2063656e7465723b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a64642e7365617263686279207b0d0a0977696474683a203437253b0d0a09666f6e742d73697a653a20312e31656d3b0d0a096c696e652d6865696768743a2031656d3b0d0a7d0d0a0d0a756c2e746f7069636c6973742064642e7365617263686578747261207b0d0a096d617267696e2d6c6566743a203570783b0d0a0970616464696e673a20302e32656d20303b0d0a09666f6e742d73697a653a20312e31656d3b0d0a09636f6c6f723a20233333333333333b0d0a09626f726465722d6c6566743a206e6f6e653b0d0a09636c6561723a20626f74683b0d0a0977696474683a203938253b0d0a096f766572666c6f773a2068696464656e3b0d0a7d0d0a0d0a2f2a20436f6e7461696e657220666f7220706f73742f7265706c7920627574746f6e7320616e6420706167696e6174696f6e202a2f0d0a2e746f7069632d616374696f6e73207b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a09666f6e742d73697a653a20312e31656d3b0d0a096865696768743a20323870783b0d0a096d696e2d6865696768743a20323870783b0d0a7d0d0a6469765b636c6173735d2e746f7069632d616374696f6e73207b0d0a096865696768743a206175746f3b0d0a7d0d0a0d0a2f2a20506f737420626f6479207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e706f7374626f6479207b0d0a0970616464696e673a20303b0d0a096c696e652d6865696768743a20312e3438656d3b0d0a09636f6c6f723a20233333333333333b0d0a0977696474683a203736253b0d0a09666c6f61743a206c6566743b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a2e706f7374626f6479202e69676e6f7265207b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a2e706f7374626f64792068332e6669727374207b0d0a092f2a2054686520666972737420706f7374206f6e20746865207061676520757365732074686973202a2f0d0a09666f6e742d73697a653a20312e37656d3b0d0a7d0d0a0d0a2e706f7374626f6479206833207b0d0a092f2a20506f7374626f6479207265717569726573206120646966666572656e7420683320666f726d6174202d20736f206368616e67652069742068657265202a2f0d0a09666f6e742d73697a653a20312e35656d3b0d0a0970616464696e673a203270782030203020303b0d0a096d617267696e3a2030203020302e33656d20302021696d706f7274616e743b0d0a09746578742d7472616e73666f726d3a206e6f6e653b0d0a09626f726465723a206e6f6e653b0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a096c696e652d6865696768743a20313235253b0d0a7d0d0a0d0a2e706f7374626f647920683320696d67207b0d0a092f2a20416c736f2073656520747765616b732e637373202a2f0d0a09766572746963616c2d616c69676e3a20626f74746f6d3b0d0a7d0d0a0d0a2e706f7374626f6479202e636f6e74656e74207b0d0a09666f6e742d73697a653a20312e33656d3b0d0a7d0d0a0d0a2e736561726368202e706f7374626f6479207b0d0a0977696474683a203638250d0a7d0d0a0d0a2f2a20546f706963207265766965772070616e656c0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a23726576696577207b0d0a096d617267696e2d746f703a2032656d3b0d0a7d0d0a0d0a23746f706963726576696577207b0d0a0970616464696e672d72696768743a203570783b0d0a096f766572666c6f773a206175746f3b0d0a096865696768743a2033303070783b0d0a7d0d0a0d0a23746f706963726576696577202e706f7374626f6479207b0d0a0977696474683a206175746f3b0d0a09666c6f61743a206e6f6e653b0d0a096d617267696e3a20303b0d0a096865696768743a206175746f3b0d0a7d0d0a0d0a23746f706963726576696577202e706f7374207b0d0a096865696768743a206175746f3b0d0a7d0d0a0d0a23746f706963726576696577206832207b0d0a09626f726465722d626f74746f6d2d77696474683a20303b0d0a7d0d0a0d0a2f2a20436f6e74656e7420636f6e7461696e6572207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e636f6e74656e74207b0d0a096d696e2d6865696768743a2033656d3b0d0a096f766572666c6f773a2068696464656e3b0d0a096c696e652d6865696768743a20312e34656d3b0d0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09666f6e742d73697a653a2031656d3b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2e636f6e74656e742068322c202e70616e656c206832207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636f6c6f723a20233938393839383b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420234343434343433b0d0a09666f6e742d73697a653a20312e36656d3b0d0a096d617267696e2d746f703a20302e35656d3b0d0a096d617267696e2d626f74746f6d3a20302e35656d3b0d0a0970616464696e672d626f74746f6d3a20302e35656d3b0d0a7d0d0a0d0a2e70616e656c206833207b0d0a096d617267696e3a20302e35656d20303b0d0a7d0d0a0d0a2e70616e656c2070207b0d0a09666f6e742d73697a653a20312e32656d3b0d0a096d617267696e2d626f74746f6d3a2031656d3b0d0a096c696e652d6865696768743a20312e34656d3b0d0a7d0d0a0d0a2e636f6e74656e742070207b0d0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09666f6e742d73697a653a20312e32656d3b0d0a096d617267696e2d626f74746f6d3a2031656d3b0d0a096c696e652d6865696768743a20312e34656d3b0d0a7d0d0a0d0a646c2e666171207b0d0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09666f6e742d73697a653a20312e31656d3b0d0a096d617267696e2d746f703a2031656d3b0d0a096d617267696e2d626f74746f6d3a2032656d3b0d0a096c696e652d6865696768743a20312e34656d3b0d0a7d0d0a0d0a646c2e666171206474207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2e636f6e74656e7420646c2e666171207b0d0a09666f6e742d73697a653a20312e32656d3b0d0a096d617267696e2d626f74746f6d3a20302e35656d3b0d0a7d0d0a0d0a2e636f6e74656e74206c69207b0d0a096c6973742d7374796c652d747970653a20696e68657269743b0d0a7d0d0a0d0a2e636f6e74656e7420756c2c202e636f6e74656e74206f6c207b0d0a096d617267696e2d626f74746f6d3a2031656d3b0d0a096d617267696e2d6c6566743a2033656d3b0d0a7d0d0a0d0a2e706f737468696c6974207b0d0a096261636b67726f756e642d636f6c6f723a20236633663366333b0d0a09636f6c6f723a20234243424342433b0d0a0970616464696e673a20302032707820317078203270783b0d0a7d0d0a0d0a2e616e6e6f756e63652c202e756e72656164706f7374207b0d0a092f2a20486967686c696768742074686520616e6e6f756e63656d656e7473202620756e7265616420706f73747320626f78202a2f0d0a09626f726465722d6c6566742d636f6c6f723a20234243424342433b0d0a09626f726465722d72696768742d636f6c6f723a20234243424342433b0d0a7d0d0a0d0a2f2a20506f737420617574686f72202a2f0d0a702e617574686f72207b0d0a096d617267696e3a2030203135656d20302e36656d20303b0d0a0970616464696e673a203020302035707820303b0d0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09666f6e742d73697a653a2031656d3b0d0a096c696e652d6865696768743a20312e32656d3b0d0a7d0d0a0d0a2f2a20506f7374207369676e6174757265202a2f0d0a2e7369676e6174757265207b0d0a096d617267696e2d746f703a20312e35656d3b0d0a0970616464696e672d746f703a20302e32656d3b0d0a09666f6e742d73697a653a20312e31656d3b0d0a09626f726465722d746f703a2031707820736f6c696420234343434343433b0d0a09636c6561723a206c6566743b0d0a096c696e652d6865696768743a20313430253b0d0a096f766572666c6f773a2068696464656e3b0d0a0977696474683a20313030253b0d0a7d0d0a0d0a6464202e7369676e6174757265207b0d0a096d617267696e3a20303b0d0a0970616464696e673a20303b0d0a09636c6561723a206e6f6e653b0d0a09626f726465723a206e6f6e653b0d0a7d0d0a0d0a2f2a20506f7374206e6f746963696573202a2f0d0a2e6e6f74696365207b0d0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a0977696474683a206175746f3b0d0a096d617267696e2d746f703a20312e35656d3b0d0a0970616464696e672d746f703a20302e32656d3b0d0a09666f6e742d73697a653a2031656d3b0d0a09626f726465722d746f703a203170782064617368656420234343434343433b0d0a09636c6561723a206c6566743b0d0a096c696e652d6865696768743a20313330253b0d0a7d0d0a0d0a2f2a204a756d7020746f20706f7374206c696e6b20666f72206e6f77202a2f0d0a756c2e736561726368726573756c7473207b0d0a096c6973742d7374796c653a206e6f6e653b0d0a09746578742d616c69676e3a2072696768743b0d0a09636c6561723a20626f74683b0d0a7d0d0a0d0a2f2a20424220436f6465207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2f2a2051756f746520626c6f636b202a2f0d0a626c6f636b71756f7465207b0d0a096261636b67726f756e643a2023656265626562206e6f6e652036707820387078206e6f2d7265706561743b0d0a09626f726465723a2031707820736f6c696420236462646264623b0d0a09666f6e742d73697a653a20302e3935656d3b0d0a096d617267696e3a20302e35656d20317078203020323570783b0d0a096f766572666c6f773a2068696464656e3b0d0a0970616464696e673a203570783b0d0a7d0d0a0d0a626c6f636b71756f746520626c6f636b71756f7465207b0d0a092f2a204e65737465642071756f746573202a2f0d0a096261636b67726f756e642d636f6c6f723a20236261626162613b0d0a09666f6e742d73697a653a2031656d3b0d0a096d617267696e3a20302e35656d20317078203020313570783b090d0a7d0d0a0d0a626c6f636b71756f746520626c6f636b71756f746520626c6f636b71756f7465207b0d0a092f2a204e65737465642071756f746573202a2f0d0a096261636b67726f756e642d636f6c6f723a20236534653465343b0d0a7d0d0a0d0a626c6f636b71756f74652063697465207b0d0a092f2a20557365726e616d652f736f75726365206f662071756f746572202a2f0d0a09666f6e742d7374796c653a206e6f726d616c3b0d0a09666f6e742d7765696768743a20626f6c643b0d0a096d617267696e2d6c6566743a20323070783b0d0a09646973706c61793a20626c6f636b3b0d0a09666f6e742d73697a653a20302e39656d3b0d0a7d0d0a0d0a626c6f636b71756f746520636974652063697465207b0d0a09666f6e742d73697a653a2031656d3b0d0a7d0d0a0d0a626c6f636b71756f74652e756e6369746564207b0d0a0970616464696e672d746f703a20323570783b0d0a7d0d0a0d0a2f2a20436f646520626c6f636b202a2f0d0a646c2e636f6465626f78207b0d0a0970616464696e673a203370783b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a09626f726465723a2031707820736f6c696420236438643864383b0d0a09666f6e742d73697a653a2031656d3b0d0a7d0d0a0d0a646c2e636f6465626f78206474207b0d0a09746578742d7472616e73666f726d3a207570706572636173653b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420234343434343433b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a09666f6e742d73697a653a20302e38656d3b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09646973706c61793a20626c6f636b3b0d0a7d0d0a0d0a626c6f636b71756f746520646c2e636f6465626f78207b0d0a096d617267696e2d6c6566743a20303b0d0a7d0d0a0d0a646c2e636f6465626f7820636f6465207b0d0a092f2a20416c736f2073656520747765616b732e637373202a2f0d0a096f766572666c6f773a206175746f3b0d0a09646973706c61793a20626c6f636b3b0d0a096865696768743a206175746f3b0d0a096d61782d6865696768743a2032303070783b0d0a0977686974652d73706163653a206e6f726d616c3b0d0a0970616464696e672d746f703a203570783b0d0a09666f6e743a20302e39656d204d6f6e61636f2c2022416e64616c65204d6f6e6f222c22436f7572696572204e6577222c20436f75726965722c206d6f6e6f3b0d0a096c696e652d6865696768743a20312e33656d3b0d0a09636f6c6f723a20233862386238623b0d0a096d617267696e3a2032707820303b0d0a7d0d0a0d0a2e73796e746178626709097b20636f6c6f723a20234646464646463b207d0d0a2e73796e746178636f6d6d656e74097b20636f6c6f723a20233030303030303b207d0d0a2e73796e74617864656661756c74097b20636f6c6f723a20236263626362633b207d0d0a2e73796e74617868746d6c09097b20636f6c6f723a20233030303030303b207d0d0a2e73796e7461786b6579776f7264097b20636f6c6f723a20233538353835383b207d0d0a2e73796e746178737472696e67097b20636f6c6f723a20236137613761373b207d0d0a0d0a2f2a204174746163686d656e74730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e617474616368626f78207b0d0a09666c6f61743a206c6566743b0d0a0977696474683a206175746f3b200d0a096d617267696e3a20357078203570782035707820303b0d0a0970616464696e673a203670783b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a09626f726465723a203170782064617368656420236438643864383b0d0a09636c6561723a206c6566743b0d0a7d0d0a0d0a2e706d2d6d657373616765202e617474616368626f78207b0d0a096261636b67726f756e642d636f6c6f723a20236633663366333b0d0a7d0d0a0d0a2e617474616368626f78206474207b0d0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a09746578742d7472616e73666f726d3a207570706572636173653b0d0a7d0d0a0d0a2e617474616368626f78206464207b0d0a096d617267696e2d746f703a203470783b0d0a0970616464696e672d746f703a203470783b0d0a09636c6561723a206c6566743b0d0a09626f726465722d746f703a2031707820736f6c696420236438643864383b0d0a7d0d0a0d0a2e617474616368626f78206464206464207b0d0a09626f726465723a206e6f6e653b0d0a7d0d0a0d0a2e617474616368626f782070207b0d0a096c696e652d6865696768743a20313130253b0d0a09636f6c6f723a20233636363636363b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636c6561723a206c6566743b0d0a7d0d0a0d0a2e617474616368626f7820702e73746174730d0a7b0d0a096c696e652d6865696768743a20313130253b0d0a09636f6c6f723a20233636363636363b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636c6561723a206c6566743b0d0a7d0d0a0d0a2e6174746163682d696d616765207b0d0a096d617267696e3a2033707820303b0d0a0977696474683a20313030253b0d0a096d61782d6865696768743a2033353070783b0d0a096f766572666c6f773a206175746f3b0d0a7d0d0a0d0a2e6174746163682d696d61676520696d67207b0d0a09626f726465723a2031707820736f6c696420233939393939393b0d0a2f2a09637572736f723a206d6f76653b202a2f0d0a09637572736f723a2064656661756c743b0d0a7d0d0a0d0a2f2a20496e6c696e6520696d616765207468756d626e61696c73202a2f0d0a6469762e696e6c696e652d6174746163686d656e7420646c2e7468756d626e61696c2c206469762e696e6c696e652d6174746163686d656e7420646c2e66696c65207b0d0a09646973706c61793a20626c6f636b3b0d0a096d617267696e2d626f74746f6d3a203470783b0d0a7d0d0a0d0a6469762e696e6c696e652d6174746163686d656e742070207b0d0a09666f6e742d73697a653a20313030253b0d0a7d0d0a0d0a646c2e66696c65207b0d0a09666f6e742d66616d696c793a2056657264616e612c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a09646973706c61793a20626c6f636b3b0d0a7d0d0a0d0a646c2e66696c65206474207b0d0a09746578742d7472616e73666f726d3a206e6f6e653b0d0a096d617267696e3a20303b0d0a0970616464696e673a20303b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09666f6e742d66616d696c793a2056657264616e612c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a7d0d0a0d0a646c2e66696c65206464207b0d0a09636f6c6f723a20233636363636363b0d0a096d617267696e3a20303b0d0a0970616464696e673a20303b090d0a7d0d0a0d0a646c2e7468756d626e61696c20696d67207b0d0a0970616464696e673a203370783b0d0a09626f726465723a2031707820736f6c696420233636363636363b0d0a096261636b67726f756e642d636f6c6f723a20234646463b0d0a7d0d0a0d0a646c2e7468756d626e61696c206464207b0d0a09636f6c6f723a20233636363636363b0d0a09666f6e742d7374796c653a206974616c69633b0d0a09666f6e742d66616d696c793a2056657264616e612c20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a7d0d0a0d0a2e617474616368626f7820646c2e7468756d626e61696c206464207b0d0a09666f6e742d73697a653a20313030253b0d0a7d0d0a0d0a646c2e7468756d626e61696c20647420613a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234545454545453b0d0a7d0d0a0d0a646c2e7468756d626e61696c20647420613a686f76657220696d67207b0d0a09626f726465723a2031707820736f6c696420236432643264323b0d0a7d0d0a0d0a2f2a20506f737420706f6c6c207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a6669656c647365742e706f6c6c73207b0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a7d0d0a0d0a6669656c647365742e706f6c6c7320646c207b0d0a096d617267696e2d746f703a203570783b0d0a09626f726465722d746f703a2031707820736f6c696420236532653265323b0d0a0970616464696e673a203570782030203020303b0d0a096c696e652d6865696768743a20313230253b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a6669656c647365742e706f6c6c7320646c2e766f746564207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a6669656c647365742e706f6c6c73206474207b0d0a09746578742d616c69676e3a206c6566743b0d0a09666c6f61743a206c6566743b0d0a09646973706c61793a20626c6f636b3b0d0a0977696474683a203330253b0d0a09626f726465722d72696768743a206e6f6e653b0d0a0970616464696e673a20303b0d0a096d617267696e3a20303b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a6669656c647365742e706f6c6c73206464207b0d0a09666c6f61743a206c6566743b0d0a0977696474683a203130253b0d0a09626f726465722d6c6566743a206e6f6e653b0d0a0970616464696e673a2030203570783b0d0a096d617267696e2d6c6566743a20303b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a6669656c647365742e706f6c6c732064642e726573756c74626172207b0d0a0977696474683a203530253b0d0a7d0d0a0d0a6669656c647365742e706f6c6c7320646420696e707574207b0d0a096d617267696e3a2032707820303b0d0a7d0d0a0d0a6669656c647365742e706f6c6c7320646420646976207b0d0a09746578742d616c69676e3a2072696768743b0d0a09666f6e742d66616d696c793a20417269616c2c2048656c7665746963612c2073616e732d73657269663b0d0a09636f6c6f723a20234646464646463b0d0a09666f6e742d7765696768743a20626f6c643b0d0a0970616464696e673a2030203270783b0d0a096f766572666c6f773a2076697369626c653b0d0a096d696e2d77696474683a2032253b0d0a7d0d0a0d0a2e706f6c6c62617231207b0d0a096261636b67726f756e642d636f6c6f723a20236161616161613b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420233734373437343b0d0a09626f726465722d72696768743a2031707820736f6c696420233734373437343b0d0a7d0d0a0d0a2e706f6c6c62617232207b0d0a096261636b67726f756e642d636f6c6f723a20236265626562653b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420233863386338633b0d0a09626f726465722d72696768743a2031707820736f6c696420233863386338633b0d0a7d0d0a0d0a2e706f6c6c62617233207b0d0a096261636b67726f756e642d636f6c6f723a20234431443144313b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420236161616161613b0d0a09626f726465722d72696768743a2031707820736f6c696420236161616161613b0d0a7d0d0a0d0a2e706f6c6c62617234207b0d0a096261636b67726f756e642d636f6c6f723a20236534653465343b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420236265626562653b0d0a09626f726465722d72696768743a2031707820736f6c696420236265626562653b0d0a7d0d0a0d0a2e706f6c6c62617235207b0d0a096261636b67726f756e642d636f6c6f723a20236638663866383b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420234431443144313b0d0a09626f726465722d72696768743a2031707820736f6c696420234431443144313b0d0a7d0d0a0d0a2f2a20506f737465722070726f66696c6520626c6f636b0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e706f737470726f66696c65207b0d0a092f2a20416c736f2073656520747765616b732e637373202a2f0d0a096d617267696e3a203570782030203130707820303b0d0a096d696e2d6865696768743a20383070783b0d0a09636f6c6f723a20233636363636363b0d0a09626f726465722d6c6566743a2031707820736f6c696420234646464646463b0d0a0977696474683a203232253b0d0a09666c6f61743a2072696768743b0d0a09646973706c61793a20696e6c696e653b0d0a7d0d0a2e706d202e706f737470726f66696c65207b0d0a09626f726465722d6c6566743a2031707820736f6c696420234444444444443b0d0a7d0d0a0d0a2e706f737470726f66696c652064642c202e706f737470726f66696c65206474207b0d0a096c696e652d6865696768743a20312e32656d3b0d0a096d617267696e2d6c6566743a203870783b0d0a7d0d0a0d0a2e706f737470726f66696c65207374726f6e67207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2e617661746172207b0d0a09626f726465723a206e6f6e653b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a7d0d0a0d0a2e6f6e6c696e65207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a7d0d0a0d0a2f2a20506f737465722070726f66696c652075736564206279207365617263682a2f0d0a2e736561726368202e706f737470726f66696c65207b0d0a0977696474683a203330253b0d0a7d0d0a0d0a2f2a20706d206c69737420696e20636f6d706f7365206d657373616765206966206d61737320706d20697320656e61626c6564202a2f0d0a646c2e706d6c697374206474207b0d0a0977696474683a203630252021696d706f7274616e743b0d0a7d0d0a0d0a646c2e706d6c697374206474207465787461726561207b0d0a0977696474683a203935253b0d0a7d0d0a0d0a646c2e706d6c697374206464207b0d0a096d617267696e2d6c6566743a203631252021696d706f7274616e743b0d0a096d617267696e2d626f74746f6d3a203270783b0d0a7d0d0a2f2a2070726f53696c76657220427574746f6e205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2f2a20526f6c6c6f76657220627574746f6e730d0a2020204261736564206f6e3a20687474703a2f2f77656c6c7374796c65642e636f6d2f6373732d6e6f7072656c6f61642d726f6c6c6f766572732e68746d6c0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e627574746f6e73207b0d0a09666c6f61743a206c6566743b0d0a0977696474683a206175746f3b0d0a096865696768743a206175746f3b0d0a7d0d0a0d0a2f2a20526f6c6c6f766572207374617465202a2f0d0a2e627574746f6e7320646976207b0d0a09666c6f61743a206c6566743b0d0a096d617267696e3a203020357078203020303b0d0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0d0a7d0d0a0d0a2f2a20526f6c6c6f6666207374617465202a2f0d0a2e627574746f6e73206469762061207b0d0a09646973706c61793a20626c6f636b3b0d0a0977696474683a20313030253b0d0a096865696768743a20313030253b0d0a096261636b67726f756e642d706f736974696f6e3a203020303b0d0a09706f736974696f6e3a2072656c61746976653b0d0a096f766572666c6f773a2068696464656e3b0d0a7d0d0a0d0a2f2a2048696465203c613e207465787420616e642068696465206f66662d737461746520696d616765207768656e20726f6c6c696e67206f766572202870726576656e747320666c69636b657220696e20494529202a2f0d0a2f2a2e627574746f6e7320646976207370616e09097b20646973706c61793a206e6f6e653b207d2a2f0d0a2f2a2e627574746f6e732064697620613a686f766572097b206261636b67726f756e642d696d6167653a206e6f6e653b207d2a2f0d0a2e627574746f6e7320646976207370616e0909097b20706f736974696f6e3a206162736f6c7574653b2077696474683a20313030253b206865696768743a20313030253b20637572736f723a20706f696e7465723b7d0d0a2e627574746f6e732064697620613a686f766572207370616e097b206261636b67726f756e642d706f736974696f6e3a203020313030253b207d0d0a0d0a2f2a2042696720627574746f6e20696d61676573202a2f0d0a2e7265706c792d69636f6e207370616e097b206261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b207d0d0a2e706f73742d69636f6e207370616e09097b206261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b207d0d0a2e6c6f636b65642d69636f6e207370616e097b206261636b67726f756e643a207472616e73706172656e74206e6f6e6520302030206e6f2d7265706561743b207d0d0a2e706d7265706c792d69636f6e207370616e097b206261636b67726f756e643a206e6f6e6520302030206e6f2d7265706561743b207d0d0a2e6e6577706d2d69636f6e207370616e20097b206261636b67726f756e643a206e6f6e6520302030206e6f2d7265706561743b207d0d0a2e666f7277617264706d2d69636f6e207370616e20097b206261636b67726f756e643a206e6f6e6520302030206e6f2d7265706561743b207d0d0a0d0a2f2a205365742062696720627574746f6e2064696d656e73696f6e73202a2f0d0a2e627574746f6e73206469762e7265706c792d69636f6e09097b2077696474683a207b494d475f425554544f4e5f544f5049435f5245504c595f57494454487d70783b206865696768743a207b494d475f425554544f4e5f544f5049435f5245504c595f4845494748547d70783b207d0d0a2e627574746f6e73206469762e706f73742d69636f6e09097b2077696474683a207b494d475f425554544f4e5f544f5049435f4e45575f57494454487d70783b206865696768743a207b494d475f425554544f4e5f544f5049435f4e45575f4845494748547d70783b207d0d0a2e627574746f6e73206469762e6c6f636b65642d69636f6e097b2077696474683a207b494d475f425554544f4e5f544f5049435f4c4f434b45445f57494454487d70783b206865696768743a207b494d475f425554544f4e5f544f5049435f4c4f434b45445f4845494748547d70783b207d0d0a2e627574746f6e73206469762e706d7265706c792d69636f6e097b2077696474683a207b494d475f425554544f4e5f504d5f5245504c595f57494454487d70783b206865696768743a207b494d475f425554544f4e5f504d5f5245504c595f4845494748547d70783b207d0d0a2e627574746f6e73206469762e6e6577706d2d69636f6e09097b2077696474683a207b494d475f425554544f4e5f504d5f4e45575f57494454487d70783b206865696768743a207b494d475f425554544f4e5f504d5f4e45575f4845494748547d70783b207d0d0a2e627574746f6e73206469762e666f7277617264706d2d69636f6e097b2077696474683a207b494d475f425554544f4e5f504d5f464f52574152445f57494454487d70783b206865696768743a207b494d475f425554544f4e5f504d5f464f52574152445f4845494748547d70783b207d0d0a0d0a2f2a205375622d68656164657220286e617669676174696f6e20626172290d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a612e7072696e742c20612e73656e64656d61696c2c20612e666f6e7473697a65207b0d0a09646973706c61793a20626c6f636b3b0d0a096f766572666c6f773a2068696464656e3b0d0a096865696768743a20313870783b0d0a09746578742d696e64656e743a202d3530303070783b0d0a09746578742d616c69676e3a206c6566743b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a7d0d0a0d0a612e7072696e74207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a0977696474683a20323270783b0d0a7d0d0a0d0a612e73656e64656d61696c207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a0977696474683a20323270783b0d0a7d0d0a0d0a612e666f6e7473697a65207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d706f736974696f6e3a2030202d3170783b0d0a0977696474683a20323970783b0d0a7d0d0a0d0a612e666f6e7473697a653a686f766572207b0d0a096261636b67726f756e642d706f736974696f6e3a2030202d323070783b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a2f2a2049636f6e20696d616765730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e73697465686f6d652c202e69636f6e2d6661712c202e69636f6e2d6d656d626572732c202e69636f6e2d686f6d652c202e69636f6e2d7563702c202e69636f6e2d72656769737465722c202e69636f6e2d6c6f676f75742c0d0a2e69636f6e2d626f6f6b6d61726b2c202e69636f6e2d62756d702c202e69636f6e2d7375627363726962652c202e69636f6e2d756e7375627363726962652c202e69636f6e2d70616765732c202e69636f6e2d736561726368207b0d0a096261636b67726f756e642d706f736974696f6e3a2030203530253b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a0970616464696e673a203170782030203020313770783b0d0a7d0d0a0d0a2f2a20506f737465722070726f66696c652069636f6e730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a756c2e70726f66696c652d69636f6e73207b0d0a0970616464696e672d746f703a20313070783b0d0a096c6973742d7374796c653a206e6f6e653b0d0a7d0d0a0d0a2f2a20526f6c6c6f766572207374617465202a2f0d0a756c2e70726f66696c652d69636f6e73206c69207b0d0a09666c6f61743a206c6566743b0d0a096d617267696e3a2030203670782033707820303b0d0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0d0a7d0d0a0d0a2f2a20526f6c6c6f6666207374617465202a2f0d0a756c2e70726f66696c652d69636f6e73206c692061207b0d0a09646973706c61793a20626c6f636b3b0d0a0977696474683a20313030253b0d0a096865696768743a20313030253b0d0a096261636b67726f756e642d706f736974696f6e3a203020303b0d0a7d0d0a0d0a2f2a2048696465203c613e207465787420616e642068696465206f66662d737461746520696d616765207768656e20726f6c6c696e67206f766572202870726576656e747320666c69636b657220696e20494529202a2f0d0a756c2e70726f66696c652d69636f6e73206c69207370616e207b20646973706c61793a6e6f6e653b207d0d0a756c2e70726f66696c652d69636f6e73206c6920613a686f766572207b206261636b67726f756e643a206e6f6e653b207d0d0a0d0a2f2a20506f736974696f6e696e67206f66206d6f64657261746f722069636f6e73202a2f0d0a2e706f7374626f647920756c2e70726f66696c652d69636f6e73207b0d0a09666c6f61743a2072696768743b0d0a0977696474683a206175746f3b0d0a0970616464696e673a20303b0d0a7d0d0a0d0a2e706f7374626f647920756c2e70726f66696c652d69636f6e73206c69207b0d0a096d617267696e3a2030203370783b0d0a7d0d0a0d0a2f2a2050726f66696c652026206e617669676174696f6e2069636f6e73202a2f0d0a2e656d61696c2d69636f6e2c202e656d61696c2d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e61696d2d69636f6e2c202e61696d2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e7961686f6f2d69636f6e2c202e7961686f6f2d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e7765622d69636f6e2c202e7765622d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e6d736e6d2d69636f6e2c202e6d736e6d2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e6963712d69636f6e2c202e6963712d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e6a61626265722d69636f6e2c202e6a61626265722d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e706d2d69636f6e2c202e706d2d69636f6e2061090909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e71756f74652d69636f6e2c202e71756f74652d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a0d0a2f2a204d6f64657261746f722069636f6e73202a2f0d0a2e7265706f72742d69636f6e2c202e7265706f72742d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e7761726e2d69636f6e2c202e7761726e2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e656469742d69636f6e2c202e656469742d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e64656c6574652d69636f6e2c202e64656c6574652d69636f6e206109097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a2e696e666f2d69636f6e2c202e696e666f2d69636f6e20610909097b206261636b67726f756e643a206e6f6e6520746f70206c656674206e6f2d7265706561743b207d0d0a0d0a2f2a205365742070726f66696c652069636f6e2064696d656e73696f6e73202a2f0d0a756c2e70726f66696c652d69636f6e73206c692e656d61696c2d69636f6e09097b2077696474683a207b494d475f49434f4e5f434f4e544143545f454d41494c5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f454d41494c5f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e61696d2d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f41494d5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f41494d5f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e7961686f6f2d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f5941484f4f5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f5941484f4f5f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e7765622d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f5757575f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f5757575f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e6d736e6d2d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f4d534e4d5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f4d534e4d5f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e6963712d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f4943515f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f4943515f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e6a61626265722d69636f6e097b2077696474683a207b494d475f49434f4e5f434f4e544143545f4a41424245525f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f4a41424245525f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e706d2d69636f6e09097b2077696474683a207b494d475f49434f4e5f434f4e544143545f504d5f57494454487d70783b206865696768743a207b494d475f49434f4e5f434f4e544143545f504d5f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e71756f74652d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f51554f54455f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f51554f54455f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e7265706f72742d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f5245504f52545f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f5245504f52545f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e656469742d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f454449545f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f454449545f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e64656c6574652d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f44454c4554455f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f44454c4554455f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e696e666f2d69636f6e097b2077696474683a207b494d475f49434f4e5f504f53545f494e464f5f57494454487d70783b206865696768743a207b494d475f49434f4e5f504f53545f494e464f5f4845494748547d70783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e7761726e2d69636f6e097b2077696474683a207b494d475f49434f4e5f555345525f5741524e5f57494454487d70783b206865696768743a207b494d475f49434f4e5f555345525f5741524e5f4845494748547d70783b207d0d0a0d0a2f2a204669782070726f66696c652069636f6e2064656661756c74206d617267696e73202a2f0d0a756c2e70726f66696c652d69636f6e73206c692e656469742d69636f6e097b206d617267696e3a203020302030203370783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e71756f74652d69636f6e097b206d617267696e3a20302030203020313070783b207d0d0a756c2e70726f66696c652d69636f6e73206c692e696e666f2d69636f6e2c20756c2e70726f66696c652d69636f6e73206c692e7265706f72742d69636f6e097b206d617267696e3a203020337078203020303b207d0d0a2f2a2070726f53696c76657220436f6e74726f6c2050616e656c205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a0d0a2f2a204d61696e20435020626f780d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2363702d6d656e75207b0d0a09666c6f61743a6c6566743b0d0a0977696474683a203139253b0d0a096d617267696e2d746f703a2031656d3b0d0a096d617267696e2d626f74746f6d3a203570783b0d0a7d0d0a0d0a2363702d6d61696e207b0d0a09666c6f61743a206c6566743b0d0a0977696474683a203831253b0d0a7d0d0a0d0a2363702d6d61696e202e636f6e74656e74207b0d0a0970616464696e673a20303b0d0a7d0d0a0d0a2363702d6d61696e2068332c202363702d6d61696e2068722c202363702d6d656e75206872207b0d0a09626f726465722d636f6c6f723a20236266626662663b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2070207b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c206f6c207b0d0a096d617267696e2d6c6566743a2032656d3b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c206c692e726f77207b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420236362636263623b0d0a09626f726465722d746f703a2031707820736f6c696420234639463946393b0d0a7d0d0a0d0a756c2e63706c697374207b0d0a096d617267696e2d626f74746f6d3a203570783b0d0a09626f726465722d746f703a2031707820736f6c696420236362636263623b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c206c692e6865616465722064642c202363702d6d61696e202e70616e656c206c692e686561646572206474207b0d0a09636f6c6f723a20233030303030303b0d0a096d617267696e2d626f74746f6d3a203270783b0d0a7d0d0a0d0a2363702d6d61696e207461626c652e7461626c6531207b0d0a096d617267696e2d626f74746f6d3a2031656d3b0d0a7d0d0a0d0a2363702d6d61696e207461626c652e7461626c6531207468656164207468207b0d0a09636f6c6f723a20233333333333333b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420233333333333333b0d0a0970616464696e673a203570783b0d0a7d0d0a0d0a2363702d6d61696e207461626c652e7461626c65312074626f6479207468207b0d0a09666f6e742d7374796c653a206974616c69633b0d0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e742021696d706f7274616e743b0d0a09626f726465722d626f74746f6d3a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e202e706167696e6174696f6e207b0d0a09666c6f61743a2072696768743b0d0a0977696474683a206175746f3b0d0a0970616464696e672d746f703a203170783b0d0a7d0d0a0d0a2363702d6d61696e202e706f7374626f64792070207b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a2363702d6d61696e202e706d2d6d657373616765207b0d0a09626f726465723a2031707820736f6c696420236532653265323b0d0a096d617267696e3a203130707820303b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a0977696474683a206175746f3b0d0a09666c6f61743a206e6f6e653b0d0a7d0d0a0d0a2e706d2d6d657373616765206832207b0d0a0970616464696e672d626f74746f6d3a203570783b0d0a7d0d0a0d0a2363702d6d61696e202e706f7374626f64792068332c202363702d6d61696e202e626f7832206833207b0d0a096d617267696e2d746f703a20303b0d0a7d0d0a0d0a2363702d6d61696e202e627574746f6e73207b0d0a096d617267696e2d6c6566743a20303b0d0a7d0d0a0d0a2363702d6d61696e20756c2e6c696e6b6c697374207b0d0a096d617267696e3a20303b0d0a7d0d0a0d0a2f2a204d435020537065636966696320747765616b73202a2f0d0a2e6d63702d6d61696e202e706f7374626f6479207b0d0a0977696474683a20313030253b0d0a7d0d0a0d0a2f2a20435020746162626564206d656e750d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2374616273207b0d0a096c696e652d6865696768743a206e6f726d616c3b0d0a096d617267696e3a20323070782030202d317078203770783b0d0a096d696e2d77696474683a2035373070783b0d0a7d0d0a0d0a237461627320756c207b0d0a096d617267696e3a303b0d0a0970616464696e673a20303b0d0a096c6973742d7374796c653a206e6f6e653b0d0a7d0d0a0d0a2374616273206c69207b0d0a09646973706c61793a20696e6c696e653b0d0a096d617267696e3a20303b0d0a0970616464696e673a20303b0d0a09666f6e742d73697a653a2031656d3b0d0a09666f6e742d7765696768743a20626f6c643b0d0a7d0d0a0d0a23746162732061207b0d0a09666c6f61743a206c6566743b0d0a096261636b67726f756e643a206e6f6e65206e6f2d726570656174203025202d333570783b0d0a096d617267696e3a203020317078203020303b0d0a0970616464696e673a203020302030203570783b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09706f736974696f6e3a2072656c61746976653b0d0a09637572736f723a20706f696e7465723b0d0a7d0d0a0d0a23746162732061207370616e207b0d0a09666c6f61743a206c6566743b0d0a09646973706c61793a20626c6f636b3b0d0a096261636b67726f756e643a206e6f6e65206e6f2d7265706561742031303025202d333570783b0d0a0970616464696e673a20367078203130707820367078203570783b0d0a09636f6c6f723a20233832383238323b0d0a0977686974652d73706163653a206e6f777261703b0d0a7d0d0a0d0a237461627320613a686f766572207370616e207b0d0a09636f6c6f723a20236263626362633b0d0a7d0d0a0d0a2374616273202e6163746976657461622061207b0d0a096261636b67726f756e642d706f736974696f6e3a203020303b0d0a09626f726465722d626f74746f6d3a2031707820736f6c696420236562656265623b0d0a7d0d0a0d0a2374616273202e6163746976657461622061207370616e207b0d0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0d0a0970616464696e672d626f74746f6d3a203770783b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a237461627320613a686f766572207b0d0a096261636b67726f756e642d706f736974696f6e3a2030202d373070783b0d0a7d0d0a0d0a237461627320613a686f766572207370616e207b0d0a096261636b67726f756e642d706f736974696f6e3a31303025202d373070783b0d0a7d0d0a0d0a2374616273202e61637469766574616220613a686f766572207b0d0a096261636b67726f756e642d706f736974696f6e3a203020303b0d0a7d0d0a0d0a2374616273202e61637469766574616220613a686f766572207370616e207b0d0a09636f6c6f723a20233030303030303b0d0a096261636b67726f756e642d706f736974696f6e3a203130302520303b0d0a7d0d0a0d0a2f2a204d696e6920746162626564206d656e75207573656420696e204d43500d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a236d696e6974616273207b0d0a096c696e652d6865696768743a206e6f726d616c3b0d0a096d617267696e3a202d3230707820377078203020303b0d0a7d0d0a0d0a236d696e697461627320756c207b0d0a096d617267696e3a303b0d0a0970616464696e673a20303b0d0a096c6973742d7374796c653a206e6f6e653b0d0a7d0d0a0d0a236d696e6974616273206c69207b0d0a09646973706c61793a20626c6f636b3b0d0a09666c6f61743a2072696768743b0d0a0970616464696e673a203020313070782034707820313070783b0d0a09666f6e742d73697a653a2031656d3b0d0a09666f6e742d7765696768743a20626f6c643b0d0a096261636b67726f756e642d636f6c6f723a20236632663266323b0d0a096d617267696e2d6c6566743a203270783b0d0a7d0d0a0d0a236d696e69746162732061207b0d0a7d0d0a0d0a236d696e697461627320613a686f766572207b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a7d0d0a0d0a236d696e6974616273206c692e616374697665746162207b0d0a096261636b67726f756e642d636f6c6f723a20234639463946393b0d0a7d0d0a0d0a236d696e6974616273206c692e61637469766574616220612c20236d696e6974616273206c692e61637469766574616220613a686f766572207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2f2a20554350206e617669676174696f6e206d656e750d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2f2a20436f6e7461696e657220666f72207375622d6e617669676174696f6e206c697374202a2f0d0a236e617669676174696f6e207b0d0a0977696474683a20313030253b0d0a0970616464696e672d746f703a20333670783b0d0a7d0d0a0d0a236e617669676174696f6e20756c207b0d0a096c6973742d7374796c653a6e6f6e653b0d0a7d0d0a0d0a2f2a2044656661756c74206c697374207374617465202a2f0d0a236e617669676174696f6e206c69207b0d0a096d617267696e3a2031707820303b0d0a0970616464696e673a20303b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09646973706c61793a20696e6c696e653b0d0a7d0d0a0d0a2f2a204c696e6b207374796c657320666f7220746865207375622d73656374696f6e206c696e6b73202a2f0d0a236e617669676174696f6e2061207b0d0a09646973706c61793a20626c6f636b3b0d0a0970616464696e673a203570783b0d0a096d617267696e3a2031707820303b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233333333b0d0a096261636b67726f756e643a2023636663666366206e6f6e65207265706561742d79203130302520303b0d0a7d0d0a0d0a236e617669676174696f6e20613a686f766572207b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a096261636b67726f756e642d636f6c6f723a20236336633663363b0d0a09636f6c6f723a20236263626362633b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a236e617669676174696f6e20236163746976652d73756273656374696f6e2061207b0d0a09646973706c61793a20626c6f636b3b0d0a09636f6c6f723a20236433643364333b0d0a096261636b67726f756e642d636f6c6f723a20234639463946393b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a236e617669676174696f6e20236163746976652d73756273656374696f6e20613a686f766572207b0d0a09636f6c6f723a20236433643364333b0d0a7d0d0a0d0a2f2a20507265666572656e6365732070616e65206c61796f75740d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2363702d6d61696e206832207b0d0a09626f726465722d626f74746f6d3a206e6f6e653b0d0a0970616464696e673a20303b0d0a096d617267696e2d6c6566743a20313070783b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c207b0d0a096261636b67726f756e642d636f6c6f723a20234639463946393b0d0a7d0d0a0d0a2363702d6d61696e202e706d207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d746f702c202363702d6d656e75207370616e2e636f726e6572732d746f70207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75207370616e2e636f726e6572732d746f70207370616e207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2f2a20546f706963726576696577202a2f0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f702c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2f2a20467269656e6473206c697374202a2f0d0a2e63702d6d696e69207b0d0a096261636b67726f756e642d636f6c6f723a20236639663966393b0d0a0970616464696e673a2030203570783b0d0a096d617267696e3a203130707820313570782031307078203570783b0d0a7d0d0a0d0a2e63702d6d696e69207370616e2e636f726e6572732d746f702c202e63702d6d696e69207370616e2e636f726e6572732d626f74746f6d207b0d0a096d617267696e3a2030202d3570783b0d0a7d0d0a0d0a646c2e6d696e69206474207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09636f6c6f723a20233637363736373b0d0a7d0d0a0d0a646c2e6d696e69206464207b0d0a0970616464696e672d746f703a203470783b0d0a7d0d0a0d0a2e667269656e642d6f6e6c696e65207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a7d0d0a0d0a2e667269656e642d6f66666c696e65207b0d0a09666f6e742d7374796c653a206974616c69633b0d0a7d0d0a0d0a2f2a20504d205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a23706d2d6d656e75207b0d0a096c696e652d6865696768743a20322e35656d3b0d0a7d0d0a0d0a2f2a20504d204d65737361676520686973746f7279202a2f0d0a2e63757272656e74207b0d0a09636f6c6f723a20233939393939393b0d0a7d0d0a0d0a2f2a20446566696e65642072756c6573206c69737420666f7220504d206f7074696f6e73202a2f0d0a6f6c2e6465662d72756c6573207b0d0a0970616464696e672d6c6566743a20303b0d0a7d0d0a0d0a6f6c2e6465662d72756c6573206c69207b0d0a096c696e652d6865696768743a20313830253b0d0a0970616464696e673a203170783b0d0a7d0d0a0d0a2f2a20504d206d61726b696e6720636f6c6f757273202a2f0d0a2e706d6c697374206c692e626731207b0d0a09626f726465723a20736f6c696420337078207472616e73706172656e743b0d0a09626f726465722d77696474683a2030203370783b0d0a7d0d0a0d0a2e706d6c697374206c692e626732207b0d0a09626f726465723a20736f6c696420337078207472616e73706172656e743b0d0a09626f726465722d77696474683a2030203370783b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f6d6573736167655f7265706f727465645f636f6c6f75722c202e706d5f6d6573736167655f7265706f727465645f636f6c6f7572207b0d0a09626f726465722d6c6566742d636f6c6f723a20236263626362633b0d0a09626f726465722d72696768742d636f6c6f723a20236263626362633b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f6d61726b65645f636f6c6f75722c202e706d5f6d61726b65645f636f6c6f7572207b0d0a09626f726465723a20736f6c69642033707820236666666666663b0d0a09626f726465722d77696474683a2030203370783b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f7265706c6965645f636f6c6f75722c202e706d5f7265706c6965645f636f6c6f7572207b0d0a09626f726465723a20736f6c69642033707820236332633263323b0d0a09626f726465722d77696474683a2030203370783b090d0a7d0d0a0d0a2e706d6c697374206c692e706d5f667269656e645f636f6c6f75722c202e706d5f667269656e645f636f6c6f7572207b0d0a09626f726465723a20736f6c69642033707820236264626462643b0d0a09626f726465722d77696474683a2030203370783b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f666f655f636f6c6f75722c202e706d5f666f655f636f6c6f7572207b0d0a09626f726465723a20736f6c69642033707820233030303030303b0d0a09626f726465722d77696474683a2030203370783b0d0a7d0d0a0d0a2e706d2d6c6567656e64207b0d0a09626f726465722d6c6566742d77696474683a20313070783b0d0a09626f726465722d6c6566742d7374796c653a20736f6c69643b0d0a09626f726465722d72696768742d77696474683a20303b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a0970616464696e672d6c6566743a203370783b0d0a7d0d0a0d0a2f2a204176617461722067616c6c657279202a2f0d0a2367616c6c657279206c6162656c207b0d0a09706f736974696f6e3a2072656c61746976653b0d0a09666c6f61743a206c6566743b0d0a096d617267696e3a20313070783b0d0a0970616464696e673a203570783b0d0a0977696474683a206175746f3b0d0a096261636b67726f756e643a20234646464646463b0d0a09626f726465723a2031707820736f6c696420234343433b0d0a09746578742d616c69676e3a2063656e7465723b0d0a7d0d0a0d0a2367616c6c657279206c6162656c3a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234545453b0d0a7d0d0a2f2a2070726f53696c76657220466f726d205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2f2a2047656e6572616c20666f726d207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a6669656c64736574207b0d0a09626f726465722d77696474683a20303b0d0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09666f6e742d73697a653a20312e31656d3b0d0a7d0d0a0d0a696e707574207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09637572736f723a20706f696e7465723b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a0970616464696e673a2030203370783b0d0a09666f6e742d73697a653a2031656d3b0d0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a7d0d0a0d0a73656c656374207b0d0a09666f6e742d66616d696c793a2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09637572736f723a20706f696e7465723b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a09626f726465723a2031707820736f6c696420233636363636363b0d0a0970616464696e673a203170783b0d0a096261636b67726f756e642d636f6c6f723a20234641464146413b0d0a7d0d0a0d0a6f7074696f6e207b0d0a0970616464696e672d72696768743a2031656d3b0d0a7d0d0a0d0a6f7074696f6e2e64697361626c65642d6f7074696f6e207b0d0a09636f6c6f723a2067726179746578743b0d0a7d0d0a0d0a7465787461726561207b0d0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a0977696474683a203630253b0d0a0970616464696e673a203270783b0d0a09666f6e742d73697a653a2031656d3b0d0a096c696e652d6865696768743a20312e34656d3b0d0a7d0d0a0d0a6c6162656c207b0d0a09637572736f723a2064656661756c743b0d0a0970616464696e672d72696768743a203570783b0d0a09636f6c6f723a20233637363736373b0d0a7d0d0a0d0a6c6162656c20696e707574207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a7d0d0a0d0a6c6162656c20696d67207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a7d0d0a0d0a2f2a20446566696e6974696f6e206c697374206c61796f757420666f7220666f726d730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a6669656c6473657420646c207b0d0a0970616464696e673a2034707820303b0d0a7d0d0a0d0a6669656c64736574206474207b0d0a09666c6f61743a206c6566743b090d0a0977696474683a203430253b0d0a09746578742d616c69676e3a206c6566743b0d0a09646973706c61793a20626c6f636b3b0d0a7d0d0a0d0a6669656c64736574206464207b0d0a096d617267696e2d6c6566743a203431253b0d0a09766572746963616c2d616c69676e3a20746f703b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a7d0d0a0d0a2f2a205370656369666963206c61796f75742031202a2f0d0a6669656c647365742e6669656c647331206474207b0d0a0977696474683a203135656d3b0d0a09626f726465722d72696768742d77696474683a20303b0d0a7d0d0a0d0a6669656c647365742e6669656c647331206464207b0d0a096d617267696e2d6c6566743a203135656d3b0d0a09626f726465722d6c6566742d77696474683a20303b0d0a7d0d0a0d0a6669656c647365742e6669656c647331207b0d0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a6669656c647365742e6669656c64733120646976207b0d0a096d617267696e2d626f74746f6d3a203370783b0d0a7d0d0a0d0a2f2a205370656369666963206c61796f75742032202a2f0d0a6669656c647365742e6669656c647332206474207b0d0a0977696474683a203135656d3b0d0a09626f726465722d72696768742d77696474683a20303b0d0a7d0d0a0d0a6669656c647365742e6669656c647332206464207b0d0a096d617267696e2d6c6566743a203136656d3b0d0a09626f726465722d6c6566742d77696474683a20303b0d0a7d0d0a0d0a2f2a20466f726d20656c656d656e7473202a2f0d0a6474206c6162656c207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09746578742d616c69676e3a206c6566743b0d0a7d0d0a0d0a6464206c6162656c207b0d0a0977686974652d73706163653a206e6f777261703b0d0a09636f6c6f723a20233333333b0d0a7d0d0a0d0a646420696e7075742c206464207465787461726561207b0d0a096d617267696e2d72696768743a203370783b0d0a7d0d0a0d0a64642073656c656374207b0d0a0977696474683a206175746f3b0d0a7d0d0a0d0a6464207465787461726561207b0d0a0977696474683a203835253b0d0a7d0d0a0d0a2f2a20486f7665722065666665637473202a2f0d0a6669656c6473657420646c3a686f766572206474206c6162656c207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a6669656c647365742e6669656c64733220646c3a686f766572206474206c6162656c207b0d0a09636f6c6f723a20696e68657269743b0d0a7d0d0a0d0a2374696d657a6f6e65207b0d0a0977696474683a203935253b0d0a7d0d0a0d0a2a2068746d6c202374696d657a6f6e65207b0d0a0977696474683a203530253b0d0a7d0d0a0d0a2f2a20517569636b2d6c6f67696e206f6e20696e6465782070616765202a2f0d0a6669656c647365742e717569636b2d6c6f67696e207b0d0a096d617267696e2d746f703a203570783b0d0a7d0d0a0d0a6669656c647365742e717569636b2d6c6f67696e20696e707574207b0d0a0977696474683a206175746f3b0d0a7d0d0a0d0a6669656c647365742e717569636b2d6c6f67696e20696e7075742e696e707574626f78207b0d0a0977696474683a203135253b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a096d617267696e2d72696768743a203570783b0d0a096261636b67726f756e642d636f6c6f723a20236633663366333b0d0a7d0d0a0d0a6669656c647365742e717569636b2d6c6f67696e206c6162656c207b0d0a0977686974652d73706163653a206e6f777261703b0d0a0970616464696e672d72696768743a203270783b0d0a7d0d0a0d0a2f2a20446973706c6179206f7074696f6e73206f6e2076696577746f7069632f76696577666f72756d20706167657320202a2f0d0a6669656c647365742e646973706c61792d6f7074696f6e73207b0d0a09746578742d616c69676e3a2063656e7465723b0d0a096d617267696e3a2033707820302035707820303b0d0a7d0d0a0d0a6669656c647365742e646973706c61792d6f7074696f6e73206c6162656c207b0d0a0977686974652d73706163653a206e6f777261703b0d0a0970616464696e672d72696768743a203270783b0d0a7d0d0a0d0a6669656c647365742e646973706c61792d6f7074696f6e732061207b0d0a096d617267696e2d746f703a203370783b0d0a7d0d0a0d0a2f2a20446973706c617920616374696f6e7320666f722075637020616e64206d6370207061676573202a2f0d0a6669656c647365742e646973706c61792d616374696f6e73207b0d0a09746578742d616c69676e3a2072696768743b0d0a096c696e652d6865696768743a2032656d3b0d0a0977686974652d73706163653a206e6f777261703b0d0a0970616464696e672d72696768743a2031656d3b0d0a7d0d0a0d0a6669656c647365742e646973706c61792d616374696f6e73206c6162656c207b0d0a0977686974652d73706163653a206e6f777261703b0d0a0970616464696e672d72696768743a203270783b0d0a7d0d0a0d0a6669656c647365742e736f72742d6f7074696f6e73207b0d0a096c696e652d6865696768743a2032656d3b0d0a7d0d0a0d0a2f2a204d435020666f72756d2073656c656374696f6e2a2f0d0a6669656c647365742e666f72756d2d73656c656374696f6e207b0d0a096d617267696e3a2035707820302033707820303b0d0a09666c6f61743a2072696768743b0d0a7d0d0a0d0a6669656c647365742e666f72756d2d73656c656374696f6e32207b0d0a096d617267696e3a203133707820302033707820303b0d0a09666c6f61743a2072696768743b0d0a7d0d0a0d0a2f2a204a756d70626f78202a2f0d0a6669656c647365742e6a756d70626f78207b0d0a09746578742d616c69676e3a2072696768743b0d0a096d617267696e2d746f703a20313570783b0d0a096865696768743a20322e35656d3b0d0a7d0d0a0d0a6669656c647365742e717569636b6d6f64207b0d0a0977696474683a203530253b0d0a09666c6f61743a2072696768743b0d0a09746578742d616c69676e3a2072696768743b0d0a096865696768743a20322e35656d3b0d0a7d0d0a0d0a2f2a205375626d697420627574746f6e206669656c64736574202a2f0d0a6669656c647365742e7375626d69742d627574746f6e73207b0d0a09746578742d616c69676e3a2063656e7465723b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a096d617267696e3a2035707820303b0d0a7d0d0a0d0a6669656c647365742e7375626d69742d627574746f6e7320696e707574207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a0970616464696e672d746f703a203370783b0d0a0970616464696e672d626f74746f6d3a203370783b0d0a7d0d0a0d0a2f2a20506f7374696e672070616765207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a2f2a20427574746f6e73207573656420696e2074686520656469746f72202a2f0d0a23666f726d61742d627574746f6e73207b0d0a096d617267696e3a203135707820302032707820303b0d0a7d0d0a0d0a23666f726d61742d627574746f6e7320696e7075742c2023666f726d61742d627574746f6e732073656c656374207b0d0a09766572746963616c2d616c69676e3a206d6964646c653b0d0a7d0d0a0d0a2f2a204d61696e206d65737361676520626f78202a2f0d0a236d6573736167652d626f78207b0d0a0977696474683a203830253b0d0a7d0d0a0d0a236d6573736167652d626f78207465787461726561207b0d0a09666f6e742d66616d696c793a2022547265627563686574204d53222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a0977696474683a20313030253b0d0a09666f6e742d73697a653a20312e32656d3b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2f2a20456d6f7469636f6e732070616e656c202a2f0d0a23736d696c65792d626f78207b0d0a0977696474683a203138253b0d0a09666c6f61743a2072696768743b0d0a7d0d0a0d0a23736d696c65792d626f7820696d67207b0d0a096d617267696e3a203370783b0d0a7d0d0a0d0a2f2a20496e707574206669656c64207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e696e707574626f78207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a09626f726465723a2031707820736f6c696420236330633063303b0d0a09636f6c6f723a20233333333333333b0d0a0970616464696e673a203270783b0d0a09637572736f723a20746578743b0d0a7d0d0a0d0a2e696e707574626f783a686f766572207b0d0a09626f726465723a2031707820736f6c696420236561656165613b0d0a7d0d0a0d0a2e696e707574626f783a666f637573207b0d0a09626f726465723a2031707820736f6c696420236561656165613b0d0a09636f6c6f723a20233462346234623b0d0a7d0d0a0d0a696e7075742e696e707574626f78097b2077696474683a203835253b207d0d0a696e7075742e6d656469756d097b2077696474683a203530253b207d0d0a696e7075742e6e6172726f77097b2077696474683a203235253b207d0d0a696e7075742e74696e7909097b2077696474683a2031323570783b207d0d0a0d0a74657874617265612e696e707574626f78207b0d0a0977696474683a203835253b0d0a7d0d0a0d0a2e6175746f7769647468207b0d0a0977696474683a206175746f2021696d706f7274616e743b0d0a7d0d0a0d0a2f2a20466f726d20627574746f6e207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a696e7075742e627574746f6e312c20696e7075742e627574746f6e32207b0d0a09666f6e742d73697a653a2031656d3b0d0a7d0d0a0d0a612e627574746f6e312c20696e7075742e627574746f6e312c20696e7075742e627574746f6e332c20612e627574746f6e322c20696e7075742e627574746f6e32207b0d0a0977696474683a206175746f2021696d706f7274616e743b0d0a0970616464696e672d746f703a203170783b0d0a0970616464696e672d626f74746f6d3a203170783b0d0a09666f6e742d66616d696c793a20224c7563696461204772616e6465222c2056657264616e612c2048656c7665746963612c20417269616c2c2073616e732d73657269663b0d0a09636f6c6f723a20233030303b0d0a096261636b67726f756e643a2023464146414641206e6f6e65207265706561742d7820746f703b0d0a7d0d0a0d0a612e627574746f6e312c20696e7075742e627574746f6e31207b0d0a09666f6e742d7765696768743a20626f6c643b0d0a09626f726465723a2031707820736f6c696420233636363636363b0d0a7d0d0a0d0a696e7075742e627574746f6e33207b0d0a0970616464696e673a20303b0d0a096d617267696e3a20303b0d0a096c696e652d6865696768743a203570783b0d0a096865696768743a20313270783b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a09666f6e742d76617269616e743a20736d616c6c2d636170733b0d0a7d0d0a0d0a2f2a20416c7465726e617469766520627574746f6e202a2f0d0a612e627574746f6e322c20696e7075742e627574746f6e322c20696e7075742e627574746f6e33207b0d0a09626f726465723a2031707820736f6c696420233636363636363b0d0a7d0d0a0d0a2f2a203c613e20627574746f6e20696e20746865207374796c65206f662074686520666f726d20627574746f6e73202a2f0d0a612e627574746f6e312c20612e627574746f6e313a6c696e6b2c20612e627574746f6e313a766973697465642c20612e627574746f6e313a6163746976652c20612e627574746f6e322c20612e627574746f6e323a6c696e6b2c20612e627574746f6e323a766973697465642c20612e627574746f6e323a616374697665207b0d0a09746578742d6465636f726174696f6e3a206e6f6e653b0d0a09636f6c6f723a20233030303030303b0d0a0970616464696e673a20327078203870783b0d0a096c696e652d6865696768743a20323530253b0d0a09766572746963616c2d616c69676e3a20746578742d626f74746f6d3b0d0a096261636b67726f756e642d706f736974696f6e3a2030203170783b0d0a7d0d0a0d0a2f2a20486f76657220737461746573202a2f0d0a612e627574746f6e313a686f7665722c20696e7075742e627574746f6e313a686f7665722c20612e627574746f6e323a686f7665722c20696e7075742e627574746f6e323a686f7665722c20696e7075742e627574746f6e333a686f766572207b0d0a09626f726465723a2031707820736f6c696420234243424342433b0d0a096261636b67726f756e642d706f736974696f6e3a203020313030253b0d0a09636f6c6f723a20234243424342433b0d0a7d0d0a0d0a696e7075742e64697361626c6564207b0d0a09666f6e742d7765696768743a206e6f726d616c3b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a2f2a20546f70696320616e6420666f72756d20536561726368202a2f0d0a2e7365617263682d626f78207b0d0a096d617267696e2d746f703a203370783b0d0a096d617267696e2d6c6566743a203570783b0d0a09666c6f61743a206c6566743b0d0a7d0d0a0d0a2e7365617263682d626f7820696e707574207b0d0a7d0d0a0d0a696e7075742e736561726368207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a096261636b67726f756e642d7265706561743a206e6f2d7265706561743b0d0a096261636b67726f756e642d706f736974696f6e3a206c656674203170783b0d0a0970616464696e672d6c6566743a20313770783b0d0a7d0d0a0d0a2e66756c6c207b2077696474683a203935253b207d0d0a2e6d656469756d207b2077696474683a203530253b7d0d0a2e6e6172726f77207b2077696474683a203235253b7d0d0a2e74696e79207b2077696474683a203130253b7d0d0a2f2a2070726f53696c766572205374796c6520536865657420547765616b730d0a0d0a5468657365207374796c6520646566696e6974696f6e7320617265206d61696e6c79204945207370656369666963200d0a747765616b732072657175697265642064756520746f2069747320706f6f722043535320737570706f72742e0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a2a2068746d6c207461626c652c202a2068746d6c2073656c6563742c202a2068746d6c20696e707574207b20666f6e742d73697a653a20313030253b207d0d0a2a2068746d6c206872207b206d617267696e3a20303b207d0d0a2a2068746d6c207370616e2e636f726e6572732d746f702c202a2068746d6c207370616e2e636f726e6572732d626f74746f6d207b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e67696622293b207d0d0a2a2068746d6c207370616e2e636f726e6572732d746f70207370616e2c202a2068746d6c207370616e2e636f726e6572732d626f74746f6d207370616e207b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e67696622293b207d0d0a0d0a7461626c652e7461626c6531207b0d0a0977696474683a203939253b09092f2a204945203c20362062726f7773657273202a2f0d0a092f2a2054616e74656b206861636b202a2f0d0a09766f6963652d66616d696c793a20225c227d5c22223b0d0a09766f6963652d66616d696c793a20696e68657269743b0d0a0977696474683a20313030253b0d0a7d0d0a68746d6c3e626f6479207461626c652e7461626c6531207b2077696474683a20313030253b207d092f2a205265736574203130302520666f72206f70657261202a2f0d0a0d0a2a2068746d6c20756c2e746f7069636c697374206c69207b20706f736974696f6e3a2072656c61746976653b207d0d0a2a2068746d6c202e706f7374626f647920683320696d67207b20766572746963616c2d616c69676e3a206d6964646c653b207d0d0a0d0a2f2a20466f726d207374796c6573202a2f0d0a68746d6c3e626f6479206464206c6162656c20696e707574207b20766572746963616c2d616c69676e3a20746578742d626f74746f6d3b207d092f2a20416c69676e20636865636b626f7865732f726164696f20627574746f6e73206e6963656c79202a2f0d0a0d0a2a2068746d6c20696e7075742e627574746f6e312c202a2068746d6c20696e7075742e627574746f6e32207b0d0a0970616464696e672d626f74746f6d3a20303b0d0a096d617267696e2d626f74746f6d3a203170783b0d0a7d0d0a0d0a2f2a204d697363206c61796f7574207374796c6573202a2f0d0a2a2068746d6c202e636f6c756d6e312c202a2068746d6c202e636f6c756d6e32207b2077696474683a203435253b207d0d0a0d0a2f2a204e696365206d6574686f6420666f7220636c656172696e6720666c6f6174656420626c6f636b7320776974686f757420686176696e6720746f20696e7365727420616e79206578747261206d61726b757020286c696b65207370616365722061626f7665290d0a20202046726f6d20687474703a2f2f7777772e706f736974696f6e697365766572797468696e672e6e65742f65617379636c656172696e672e68746d6c200d0a23746162733a61667465722c20236d696e69746162733a61667465722c202e706f73743a61667465722c202e6e61766261723a61667465722c206669656c6473657420646c3a61667465722c20756c2e746f7069636c69737420646c3a61667465722c20756c2e6c696e6b6c6973743a61667465722c20646c2e706f6c6c733a6166746572207b0d0a09636f6e74656e743a20222e223b200d0a09646973706c61793a20626c6f636b3b200d0a096865696768743a20303b200d0a09636c6561723a20626f74683b200d0a097669736962696c6974793a2068696464656e3b0d0a7d2a2f0d0a0d0a2e636c6561726669782c2023746162732c20236d696e69746162732c206669656c6473657420646c2c20756c2e746f7069636c69737420646c2c20646c2e706f6c6c73207b0d0a096865696768743a2031253b0d0a096f766572666c6f773a2068696464656e3b0d0a7d0d0a0d0a2f2a2076696577746f70696320666978202a2f0d0a2a2068746d6c202e706f7374207b0d0a096865696768743a203235253b0d0a096f766572666c6f773a2068696464656e3b0d0a7d0d0a0d0a2f2a206e617662617220666978202a2f0d0a2a2068746d6c202e636c6561726669782c202a2068746d6c202e6e61766261722c20756c2e6c696e6b6c697374207b0d0a096865696768743a2034253b0d0a096f766572666c6f773a2068696464656e3b0d0a7d0d0a0d0a2f2a2053696d706c652066697820736f20666f72756d20616e6420746f706963206c6973747320616c7761797320686176652061206d696e2d686569676874207365742c206576656e20696e204945360d0a0946726f6d20687474703a2f2f7777772e64757374696e6469617a2e636f6d2f6d696e2d6865696768742d666173742d6861636b202a2f0d0a646c2e69636f6e207b0d0a096d696e2d6865696768743a20333570783b0d0a096865696768743a206175746f2021696d706f7274616e743b0d0a096865696768743a20333570783b0d0a7d0d0a0d0a2a2068746d6c20237365617263682d626f78207b0d0a0977696474683a203235253b0d0a7d0d0a0d0a2f2a20436f72726563746c7920636c65617220666c6f6174696e6720666f722064657461696c73206f6e2070726f66696c652076696577202a2f0d0a2a3a66697273742d6368696c642b68746d6c20646c2e64657461696c73206464207b0d0a096d617267696e2d6c6566743a203330253b0d0a09666c6f61743a206e6f6e653b0d0a7d0d0a0d0a2a2068746d6c20646c2e64657461696c73206464207b0d0a096d617267696e2d6c6566743a203330253b0d0a09666c6f61743a206e6f6e653b0d0a7d0d0a2f2a2020090d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220636f6d6d6f6e2e6373730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a68746d6c2c20626f6479207b0d0a09636f6c6f723a20236231373630313b0d0a096261636b67726f756e642d696d6167653a2075726c287b545f5448454d455f504154487d2f696d616765732f73666f6e646f2e676966293b0d0a096261636b67726f756e642d7265706561743a207265706561742d783b0d0a096261636b67726f756e642d6174746163686d656e743a2066697865643b0d0a096261636b67726f756e642d636f6c6f723a20234637433435373b0d0a7d0d0a0d0a6831207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a6832207b0d0a09636f6c6f723a20233238333133463b0d0a7d0d0a0d0a6833207b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20234343434343433b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a6872207b0d0a09626f726465722d636f6c6f723a20234646464646463b0d0a09626f726465722d746f702d636f6c6f723a20234343434343433b0d0a7d0d0a0d0a68722e646173686564207b0d0a09626f726465722d746f702d636f6c6f723a20234343434343433b0d0a7d0d0a0d0a2f2a2053656172636820626f780d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a237365617263682d626f78207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a237365617263682d626f7820236b6579776f726473207b0d0a096261636b67726f756e642d636f6c6f723a20234646463b0d0a7d0d0a0d0a237365617263682d626f7820696e707574207b0d0a09626f726465722d636f6c6f723a20233030373542303b0d0a7d0d0a0d0a2f2a20526f756e6420636f726e6572656420626f78657320616e64206261636b67726f756e64730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e686561646572626172207b0d0a096261636b67726f756e642d636f6c6f723a20236236383131373b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6865616465722e67696622293b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2e6e6176626172207b0d0a096261636b67726f756e642d636f6c6f723a20236635623834373b0d0a7d0d0a0d0a2e666f72616267207b0d0a096261636b67726f756e642d636f6c6f723a20236237383231373b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6c6973742e67696622293b0d0a7d0d0a0d0a2e666f72756d6267207b0d0a096261636b67726f756e642d636f6c6f723a20236236383131373b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6865616465722e67696622293b0d0a7d0d0a0d0a2e70616e656c207b0d0a096261636b67726f756e642d636f6c6f723a20236662633237623b0d0a09636f6c6f723a20233238333133463b0d0a7d0d0a0d0a2e706f73743a746172676574202e636f6e74656e74207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2e706f73743a7461726765742068332061207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2e626731097b206261636b67726f756e642d636f6c6f723a20236539653665303b207d0d0a2e626732097b206261636b67726f756e642d636f6c6f723a20236630656565613b20207d0d0a2e626733097b206261636b67726f756e642d636f6c6f723a20236635623834373b207d0d0a0d0a2e756370726f776267207b0d0a096261636b67726f756e642d636f6c6f723a20234443444545323b0d0a7d0d0a0d0a2e6669656c64736267207b0d0a096261636b67726f756e642d636f6c6f723a20234537453845413b0d0a7d0d0a0d0a7370616e2e636f726e6572732d746f70207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e706e6722293b0d0a7d0d0a0d0a7370616e2e636f726e6572732d746f70207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e706e6722293b0d0a7d0d0a0d0a7370616e2e636f726e6572732d626f74746f6d207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e706e6722293b0d0a7d0d0a0d0a7370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e706e6722293b0d0a7d0d0a0d0a0d0a2f2a20486f72697a6f6e74616c206c697374730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a756c2e6e61766c696e6b73207b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2f2a205461626c65207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a7461626c652e7461626c6531207468656164207468207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f6479207472207b0d0a09626f726465722d636f6c6f723a20234246433143463b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f64792074723a686f7665722c207461626c652e7461626c65312074626f64792074722e686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236561653865333b0d0a09636f6c6f723a20233030303b0d0a7d0d0a0d0a7461626c652e7461626c6531207464207b0d0a09636f6c6f723a20236231373630313b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f6479207464207b0d0a09626f726465722d746f702d636f6c6f723a20234641464146413b0d0a7d0d0a0d0a7461626c652e7461626c65312074626f6479207468207b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233030303030303b0d0a09636f6c6f723a20233333333333333b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a7461626c652e696e666f2074626f6479207468207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2f2a204d697363206c61796f7574207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a646c2e64657461696c73206474207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a646c2e64657461696c73206464207b0d0a09636f6c6f723a20236231373630313b0d0a7d0d0a0d0a2e736570207b0d0a09636f6c6f723a20233131393844393b0d0a7d0d0a0d0a2f2a20506167696e6174696f6e0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2e706167696e6174696f6e207370616e207374726f6e67207b0d0a09636f6c6f723a20234646464646463b0d0a096261636b67726f756e642d636f6c6f723a20233436393242463b0d0a09626f726465722d636f6c6f723a20233436393242463b0d0a7d0d0a0d0a2e706167696e6174696f6e207370616e20612c202e706167696e6174696f6e207370616e20613a6c696e6b2c202e706167696e6174696f6e207370616e20613a766973697465642c202e706167696e6174696f6e207370616e20613a616374697665207b0d0a09636f6c6f723a20233543373538433b0d0a096261636b67726f756e642d636f6c6f723a20234543454445453b0d0a09626f726465722d636f6c6f723a20234234424143303b0d0a7d0d0a0d0a2e706167696e6174696f6e207370616e20613a686f766572207b0d0a09626f726465722d636f6c6f723a20233336384144323b0d0a096261636b67726f756e642d636f6c6f723a20233336384144323b0d0a09636f6c6f723a20234646463b0d0a7d0d0a0d0a2f2a20506167696e6174696f6e20696e2076696577666f72756d20666f72206d756c74697061676520746f70696373202a2f0d0a2e726f77202e706167696e6174696f6e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f70616765732e67696622293b0d0a7d0d0a0d0a2e726f77202e706167696e6174696f6e207370616e20612c206c692e706167696e6174696f6e207370616e2061207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2e726f77202e706167696e6174696f6e207370616e20613a686f7665722c206c692e706167696e6174696f6e207370616e20613a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20233336384144323b0d0a7d0d0a0d0a2f2a204d697363656c6c616e656f7573207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2e636f70797269676874207b0d0a09636f6c6f723a20233535353535353b0d0a7d0d0a0d0a2e6572726f72207b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a2e7265706f72746564207b0d0a096261636b67726f756e642d636f6c6f723a20234637454345463b0d0a7d0d0a0d0a6c692e7265706f727465643a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234543443544382021696d706f7274616e743b0d0a7d0d0a2e737469636b792c202e616e6e6f756e6365207b0d0a092f2a20796f752063616e206164642061206261636b67726f756e6420666f7220737469636b69657320616e6420616e6e6f756e63656d656e74732a2f0d0a7d0d0a0d0a6469762e72756c6573207b0d0a096261636b67726f756e642d636f6c6f723a20234543443544383b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a702e72756c6573207b0d0a096261636b67726f756e642d636f6c6f723a20234543443544383b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2f2a2020090d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a436f6c6f75727320616e64206261636b67726f756e647320666f72206c696e6b732e6373730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a613a6c696e6b097b20636f6c6f723a20233931363030313b207d0d0a613a76697369746564097b20636f6c6f723a20233931363030313b207d0d0a613a686f766572097b20636f6c6f723a20233866356630303b207d0d0a613a616374697665097b20636f6c6f723a20233336384144323b207d0d0a0d0a2f2a204c696e6b73206f6e206772616469656e74206261636b67726f756e6473202a2f0d0a237365617263682d626f7820613a6c696e6b2c202e6e6176626720613a6c696e6b2c202e666f72756d6267202e68656164657220613a6c696e6b2c202e666f72616267202e68656164657220613a6c696e6b2c20746820613a6c696e6b207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a237365617263682d626f7820613a766973697465642c202e6e6176626720613a766973697465642c202e666f72756d6267202e68656164657220613a766973697465642c202e666f72616267202e68656164657220613a766973697465642c20746820613a76697369746564207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a237365617263682d626f7820613a686f7665722c202e6e6176626720613a686f7665722c202e666f72756d6267202e68656164657220613a686f7665722c202e666f72616267202e68656164657220613a686f7665722c20746820613a686f766572207b0d0a09636f6c6f723a20234138443846463b0d0a7d0d0a0d0a237365617263682d626f7820613a6163746976652c202e6e6176626720613a6163746976652c202e666f72756d6267202e68656164657220613a6163746976652c202e666f72616267202e68656164657220613a6163746976652c20746820613a616374697665207b0d0a09636f6c6f723a20234338453646463b0d0a7d0d0a0d0a2f2a204c696e6b7320666f7220666f72756d2f746f706963206c69737473202a2f0d0a612e666f72756d7469746c65207b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a2f2a20612e666f72756d7469746c653a76697369746564207b20636f6c6f723a20233931363030313b207d202a2f0d0a0d0a612e666f72756d7469746c653a686f766572207b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a612e666f72756d7469746c653a616374697665207b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a612e746f7069637469746c65207b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a2f2a20612e746f7069637469746c653a76697369746564207b20636f6c6f723a20233336384144323b207d202a2f0d0a0d0a612e746f7069637469746c653a686f766572207b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a612e746f7069637469746c653a616374697665207b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a2f2a20506f737420626f6479206c696e6b73202a2f0d0a2e706f73746c696e6b207b0d0a09636f6c6f723a20233336384144323b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233336384144323b0d0a7d0d0a0d0a2e706f73746c696e6b3a76697369746564207b0d0a09636f6c6f723a20233544384642443b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233636363636363b0d0a7d0d0a0d0a2e706f73746c696e6b3a616374697665207b0d0a09636f6c6f723a20233336384144323b0d0a7d0d0a0d0a2e706f73746c696e6b3a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234430453446363b0d0a09636f6c6f723a20233044343437333b0d0a7d0d0a0d0a2e7369676e617475726520612c202e7369676e617475726520613a766973697465642c202e7369676e617475726520613a6163746976652c202e7369676e617475726520613a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a2f2a2050726f66696c65206c696e6b73202a2f0d0a2e706f737470726f66696c6520613a6c696e6b2c202e706f737470726f66696c6520613a6163746976652c202e706f737470726f66696c6520613a766973697465642c202e706f737470726f66696c652064742e617574686f722061207b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a2e706f737470726f66696c6520613a686f7665722c202e706f737470726f66696c652064742e617574686f7220613a686f766572207b0d0a09636f6c6f723a20233866356630303b0d0a7d0d0a0d0a2f2a2050726f66696c6520736561726368726573756c7473202a2f090d0a2e736561726368202e706f737470726f66696c652061207b0d0a09636f6c6f723a20233931363030313b0d0a7d0d0a0d0a2e736561726368202e706f737470726f66696c6520613a686f766572207b0d0a09636f6c6f723a20233866356630303b0d0a7d0d0a0d0a2f2a204261636b20746f20746f70206f662070616765202a2f0d0a612e746f70207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f4241434b5f544f505f5352437d22293b0d0a7d0d0a0d0a612e746f7032207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f4241434b5f544f505f5352437d22293b0d0a7d0d0a0d0a2f2a204172726f77206c696e6b7320202a2f0d0a612e757009097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f75702e6769662229207d0d0a612e646f776e09097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f646f776e2e6769662229207d0d0a612e6c65667409097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f6c6566742e6769662229207d0d0a612e726967687409097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6172726f775f72696768742e6769662229207d0d0a0d0a612e75703a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a612e6c6566743a686f766572207b0d0a09636f6c6f723a20233336384144323b0d0a7d0d0a0d0a612e72696768743a686f766572207b0d0a09636f6c6f723a20233336384144323b0d0a7d0d0a0d0a0d0a2f2a2020090d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220636f6e74656e742e6373730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a756c2e666f72756d73207b0d0a096261636b67726f756e642d636f6c6f723a20236565663566393b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f6772616469656e742e67696622293b0d0a7d0d0a0d0a756c2e746f7069636c697374206c69207b0d0a09636f6c6f723a20236331383130323b0d0a7d0d0a0d0a756c2e746f7069636c697374206464207b0d0a09626f726465722d6c6566742d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2e72746c20756c2e746f7069636c697374206464207b0d0a09626f726465722d72696768742d636f6c6f723a20236666663b0d0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a756c2e746f7069636c697374206c692e726f7720647420612e737562666f72756d2e72656164207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f535542464f52554d5f524541445f5352437d22293b0d0a7d0d0a0d0a756c2e746f7069636c697374206c692e726f7720647420612e737562666f72756d2e756e72656164207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b494d475f535542464f52554d5f554e524541445f5352437d22293b0d0a7d0d0a0d0a6c692e726f77207b0d0a09626f726465722d746f702d636f6c6f723a2020234646464646463b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20236337386431393b0d0a7d0d0a0d0a6c692e726f77207374726f6e67207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a6c692e726f773a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234636463444303b0d0a7d0d0a0d0a6c692e726f773a686f766572206464207b0d0a09626f726465722d6c6566742d636f6c6f723a20234343434343433b0d0a7d0d0a0d0a2e72746c206c692e726f773a686f766572206464207b0d0a09626f726465722d72696768742d636f6c6f723a20234343434343433b0d0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a6c692e6865616465722064742c206c692e686561646572206464207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2f2a20466f72756d206c69737420636f6c756d6e207374796c6573202a2f0d0a756c2e746f7069636c6973742064642e7365617263686578747261207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2f2a20506f737420626f6479207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e706f7374626f6479207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2f2a20436f6e74656e7420636f6e7461696e6572207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e636f6e74656e74207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2e636f6e74656e742068322c202e70616e656c206832207b0d0a09636f6c6f723a20233931363030313b0d0a09626f726465722d626f74746f6d2d636f6c6f723a2020234343434343433b0d0a7d0d0a0d0a646c2e666171206474207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2e706f737468696c6974207b0d0a096261636b67726f756e642d636f6c6f723a20234633424643433b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a2f2a20506f7374207369676e6174757265202a2f0d0a2e7369676e6174757265207b0d0a09626f726465722d746f702d636f6c6f723a20234343434343433b0d0a7d0d0a0d0a2f2a20506f7374206e6f746963696573202a2f0d0a2e6e6f74696365207b0d0a09626f726465722d746f702d636f6c6f723a2020234343434343433b0d0a7d0d0a0d0a2f2a20424220436f6465207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2f2a2051756f746520626c6f636b202a2f0d0a626c6f636b71756f7465207b0d0a096261636b67726f756e642d636f6c6f723a20234542454144443b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f71756f74652e67696622293b0d0a09626f726465722d636f6c6f723a234442444243453b0d0a7d0d0a0d0a626c6f636b71756f746520626c6f636b71756f7465207b0d0a092f2a204e65737465642071756f746573202a2f0d0a096261636b67726f756e642d636f6c6f723a234546454544393b0d0a7d0d0a0d0a626c6f636b71756f746520626c6f636b71756f746520626c6f636b71756f7465207b0d0a092f2a204e65737465642071756f746573202a2f0d0a096261636b67726f756e642d636f6c6f723a20234542454144443b0d0a7d0d0a0d0a2f2a20436f646520626c6f636b202a2f0d0a646c2e636f6465626f78207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a09626f726465722d636f6c6f723a20234339443244383b0d0a7d0d0a0d0a646c2e636f6465626f78206474207b0d0a09626f726465722d626f74746f6d2d636f6c6f723a2020234343434343433b0d0a7d0d0a0d0a646c2e636f6465626f7820636f6465207b0d0a09636f6c6f723a20233245384235373b0d0a7d0d0a0d0a2e73796e746178626709097b20636f6c6f723a20234646464646463b207d0d0a2e73796e746178636f6d6d656e74097b20636f6c6f723a20234646383030303b207d0d0a2e73796e74617864656661756c74097b20636f6c6f723a20233030303042423b207d0d0a2e73796e74617868746d6c09097b20636f6c6f723a20233030303030303b207d0d0a2e73796e7461786b6579776f7264097b20636f6c6f723a20233030373730303b207d0d0a2e73796e746178737472696e67097b20636f6c6f723a20234444303030303b207d0d0a0d0a2f2a204174746163686d656e74730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e617474616368626f78207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a09626f726465722d636f6c6f723a2020234339443244383b0d0a7d0d0a0d0a2e706d2d6d657373616765202e617474616368626f78207b0d0a096261636b67726f756e642d636f6c6f723a20234632463346333b0d0a7d0d0a0d0a2e617474616368626f78206464207b0d0a09626f726465722d746f702d636f6c6f723a20234339443244383b0d0a7d0d0a0d0a2e617474616368626f782070207b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a2e617474616368626f7820702e7374617473207b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a2e6174746163682d696d61676520696d67207b0d0a09626f726465722d636f6c6f723a20233939393939393b0d0a7d0d0a0d0a2f2a20496e6c696e6520696d616765207468756d626e61696c73202a2f0d0a0d0a646c2e66696c65206464207b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a646c2e7468756d626e61696c20696d67207b0d0a09626f726465722d636f6c6f723a20233636363636363b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a646c2e7468756d626e61696c206464207b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a646c2e7468756d626e61696c20647420613a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234545454545453b0d0a7d0d0a0d0a646c2e7468756d626e61696c20647420613a686f76657220696d67207b0d0a09626f726465722d636f6c6f723a20233336384144323b0d0a7d0d0a0d0a2f2a20506f737420706f6c6c207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a6669656c647365742e706f6c6c7320646c207b0d0a09626f726465722d746f702d636f6c6f723a20234443444545323b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a0d0a6669656c647365742e706f6c6c7320646c2e766f746564207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a6669656c647365742e706f6c6c7320646420646976207b0d0a09636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2e72746c202e706f6c6c626172312c202e72746c202e706f6c6c626172322c202e72746c202e706f6c6c626172332c202e72746c202e706f6c6c626172342c202e72746c202e706f6c6c62617235207b0d0a09626f726465722d72696768742d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a2e706f6c6c62617231207b0d0a096261636b67726f756e642d636f6c6f723a20234141323334363b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233734313632433b0d0a09626f726465722d72696768742d636f6c6f723a20233734313632433b0d0a7d0d0a0d0a2e72746c202e706f6c6c62617231207b0d0a09626f726465722d6c6566742d636f6c6f723a20233734313632433b0d0a7d0d0a0d0a2e706f6c6c62617232207b0d0a096261636b67726f756e642d636f6c6f723a20234245314534413b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233843314333383b0d0a09626f726465722d72696768742d636f6c6f723a20233843314333383b0d0a7d0d0a0d0a2e72746c202e706f6c6c62617232207b0d0a09626f726465722d6c6566742d636f6c6f723a20233843314333383b0d0a7d0d0a0d0a2e706f6c6c62617233207b0d0a096261636b67726f756e642d636f6c6f723a20234431314134453b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20234141323334363b0d0a09626f726465722d72696768742d636f6c6f723a20234141323334363b0d0a7d0d0a0d0a2e72746c202e706f6c6c62617233207b0d0a09626f726465722d6c6566742d636f6c6f723a20234141323334363b0d0a7d0d0a0d0a2e706f6c6c62617234207b0d0a096261636b67726f756e642d636f6c6f723a20234534313635333b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20234245314534413b0d0a09626f726465722d72696768742d636f6c6f723a20234245314534413b0d0a7d0d0a0d0a2e72746c202e706f6c6c62617234207b0d0a09626f726465722d6c6566742d636f6c6f723a20234245314534413b0d0a7d0d0a0d0a2e706f6c6c62617235207b0d0a096261636b67726f756e642d636f6c6f723a20234638313135373b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20234431314134453b0d0a09626f726465722d72696768742d636f6c6f723a20234431314134453b0d0a7d0d0a0d0a2e72746c202e706f6c6c62617235207b0d0a09626f726465722d6c6566742d636f6c6f723a20234431314134453b0d0a7d0d0a0d0a2f2a20506f737465722070726f66696c6520626c6f636b0d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2e706f737470726f66696c65207b0d0a09636f6c6f723a20233636363636363b0d0a09626f726465722d6c6566742d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2e72746c202e706f737470726f66696c65207b0d0a09626f726465722d72696768742d636f6c6f723a20234646464646463b0d0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a2e706d202e706f737470726f66696c65207b0d0a09626f726465722d6c6566742d636f6c6f723a20234444444444443b0d0a7d0d0a0d0a2e72746c202e706d202e706f737470726f66696c65207b0d0a09626f726465722d72696768742d636f6c6f723a20234444444444443b0d0a09626f726465722d6c6566742d636f6c6f723a207472616e73706172656e743b0d0a7d0d0a0d0a2e706f737470726f66696c65207374726f6e67207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2e6f6e6c696e65207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f494d4147455345545f4c414e475f504154487d2f69636f6e5f757365725f6f6e6c696e652e67696622293b0d0a7d0d0a0d0a2f2a2020090d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220627574746f6e732e6373730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2f2a2042696720627574746f6e20696d61676573202a2f0d0a2e7265706c792d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f544f5049435f5245504c595f5352437d22293b207d0d0a2e706f73742d69636f6e207370616e09097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f544f5049435f4e45575f5352437d22293b207d0d0a2e6c6f636b65642d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f544f5049435f4c4f434b45445f5352437d22293b207d0d0a2e706d7265706c792d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f504d5f5245504c595f5352437d2229203b7d0d0a2e6e6577706d2d69636f6e207370616e20097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f504d5f4e45575f5352437d2229203b7d0d0a2e666f7277617264706d2d69636f6e207370616e097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f425554544f4e5f504d5f464f52574152445f5352437d2229203b7d0d0a0d0a612e7072696e74207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7072696e742e67696622293b0d0a7d0d0a0d0a612e73656e64656d61696c207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f73656e64656d61696c2e67696622293b0d0a7d0d0a0d0a612e666f6e7473697a65207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f666f6e7473697a652e67696622293b0d0a7d0d0a0d0a2f2a2049636f6e20696d616765730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e73697465686f6d650909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f686f6d652e67696622293b207d0d0a2e69636f6e2d6661710909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f6661712e67696622293b207d0d0a2e69636f6e2d6d656d6265727309090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f6d656d626572732e67696622293b207d0d0a2e69636f6e2d686f6d650909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f686f6d652e67696622293b207d0d0a2e69636f6e2d7563700909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7563702e67696622293b207d0d0a2e69636f6e2d726567697374657209090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f72656769737465722e67696622293b207d0d0a2e69636f6e2d6c6f676f757409090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f6c6f676f75742e67696622293b207d0d0a2e69636f6e2d626f6f6b6d61726b09090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f626f6f6b6d61726b2e67696622293b207d0d0a2e69636f6e2d62756d700909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f62756d702e67696622293b207d0d0a2e69636f6e2d73756273637269626509090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7375627363726962652e67696622293b207d0d0a2e69636f6e2d756e737562736372696265090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f756e7375627363726962652e67696622293b207d0d0a2e69636f6e2d70616765730909090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f70616765732e67696622293b207d0d0a2e69636f6e2d73656172636809090909097b206261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f7365617263682e67696622293b207d0d0a0d0a2f2a2050726f66696c652026206e617669676174696f6e2069636f6e73202a2f0d0a2e656d61696c2d69636f6e2c202e656d61696c2d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f454d41494c5f5352437d22293b207d0d0a2e61696d2d69636f6e2c202e61696d2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f41494d5f5352437d22293b207d0d0a2e7961686f6f2d69636f6e2c202e7961686f6f2d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f5941484f4f5f5352437d22293b207d0d0a2e7765622d69636f6e2c202e7765622d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f5757575f5352437d22293b207d0d0a2e6d736e6d2d69636f6e2c202e6d736e6d2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f4d534e4d5f5352437d22293b207d0d0a2e6963712d69636f6e2c202e6963712d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f4943515f5352437d22293b207d0d0a2e6a61626265722d69636f6e2c202e6a61626265722d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f4a41424245525f5352437d22293b207d0d0a2e706d2d69636f6e2c202e706d2d69636f6e2061090909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f434f4e544143545f504d5f5352437d22293b207d0d0a2e71756f74652d69636f6e2c202e71756f74652d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f51554f54455f5352437d22293b207d0d0a0d0a2f2a204d6f64657261746f722069636f6e73202a2f0d0a2e7265706f72742d69636f6e2c202e7265706f72742d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f5245504f52545f5352437d22293b207d0d0a2e656469742d69636f6e2c202e656469742d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f454449545f5352437d22293b207d0d0a2e64656c6574652d69636f6e2c202e64656c6574652d69636f6e206109097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f44454c4554455f5352437d22293b207d0d0a2e696e666f2d69636f6e2c202e696e666f2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f504f53545f494e464f5f5352437d22293b207d0d0a2e7761726e2d69636f6e2c202e7761726e2d69636f6e20610909097b206261636b67726f756e642d696d6167653a2075726c28227b494d475f49434f4e5f555345525f5741524e5f5352437d22293b207d202f2a204e6565642075706461746564207761726e2069636f6e202a2f0d0a0d0a2f2a2020090d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a436f6c6f75727320616e64206261636b67726f756e647320666f722063702e6373730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2f2a204d61696e20435020626f780d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a2363702d6d61696e2068332c202363702d6d61696e2068722c202363702d6d656e75206872207b0d0a09626f726465722d636f6c6f723a20234134423342463b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c206c692e726f77207b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20234235433143423b0d0a09626f726465722d746f702d636f6c6f723a20234639463946393b0d0a7d0d0a0d0a756c2e63706c697374207b0d0a09626f726465722d746f702d636f6c6f723a20234235433143423b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c206c692e6865616465722064642c202363702d6d61696e202e70616e656c206c692e686561646572206474207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2363702d6d61696e207461626c652e7461626c6531207468656164207468207b0d0a09636f6c6f723a20233333333333333b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2363702d6d61696e202e706d2d6d657373616765207b0d0a09626f726465722d636f6c6f723a20234442444545323b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2f2a20435020746162626564206d656e750d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a23746162732061207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f74616273312e67696622293b0d0a7d0d0a0d0a23746162732061207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f74616273322e67696622293b0d0a09636f6c6f723a20236231373630313b0d0a7d0d0a0d0a237461627320613a686f766572207370616e207b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a2374616273202e6163746976657461622061207b0d0a09626f726465722d626f74746f6d2d636f6c6f723a20236635623834373b0d0a7d0d0a0d0a2374616273202e6163746976657461622061207370616e207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2374616273202e61637469766574616220613a686f766572207370616e207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2f2a204d696e6920746162626564206d656e75207573656420696e204d43500d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a236d696e6974616273206c69207b0d0a096261636b67726f756e642d636f6c6f723a20236630656565613b0d0a7d0d0a0d0a236d696e6974616273206c692e616374697665746162207b0d0a096261636b67726f756e642d636f6c6f723a20234639463946393b0d0a7d0d0a0d0a236d696e6974616273206c692e61637469766574616220612c20236d696e6974616273206c692e61637469766574616220613a686f766572207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2f2a20554350206e617669676174696f6e206d656e750d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a2f2a204c696e6b207374796c657320666f7220746865207375622d73656374696f6e206c696e6b73202a2f0d0a236e617669676174696f6e2061207b0d0a09636f6c6f723a20233333333b0d0a096261636b67726f756e642d636f6c6f723a20236466643761353b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f6d656e752e67696622293b0d0a7d0d0a0d0a236e617669676174696f6e20613a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20236466643761353b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a236e617669676174696f6e20236163746976652d73756273656374696f6e2061207b0d0a09636f6c6f723a20233866356630303b0d0a096261636b67726f756e642d636f6c6f723a20234639463946393b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a236e617669676174696f6e20236163746976652d73756273656374696f6e20613a686f766572207b0d0a09636f6c6f723a20233866356630303b0d0a7d0d0a0d0a2f2a20507265666572656e6365732070616e65206c61796f75740d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2363702d6d61696e206832207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c207b0d0a096261636b67726f756e642d636f6c6f723a20234639463946393b0d0a7d0d0a0d0a2363702d6d61696e202e706d207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d746f702c202363702d6d656e75207370616e2e636f726e6572732d746f70207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c656674322e67696622293b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75207370616e2e636f726e6572732d746f70207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f7269676874322e67696622293b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c656674322e67696622293b0d0a7d0d0a0d0a2363702d6d61696e207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75207370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f7269676874322e67696622293b0d0a7d0d0a0d0a2f2a20546f706963726576696577202a2f0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f702c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e67696622293b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d746f70207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e67696622293b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f6c6566742e67696622293b0d0a7d0d0a0d0a2363702d6d61696e202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e2c202363702d6d656e75202e70616e656c2023746f706963726576696577207370616e2e636f726e6572732d626f74746f6d207370616e207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f636f726e6572735f72696768742e67696622293b0d0a7d0d0a0d0a2f2a20467269656e6473206c697374202a2f0d0a2e63702d6d696e69207b0d0a096261636b67726f756e642d636f6c6f723a20236565663566393b0d0a7d0d0a0d0a646c2e6d696e69206474207b0d0a09636f6c6f723a20233432353036373b0d0a7d0d0a0d0a2f2a20504d205374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a2f2a20504d204d65737361676520686973746f7279202a2f0d0a2e63757272656e74207b0d0a09636f6c6f723a20233939393939392021696d706f7274616e743b0d0a7d0d0a0d0a2f2a20504d206d61726b696e6720636f6c6f757273202a2f0d0a2e706d6c697374206c692e706d5f6d6573736167655f7265706f727465645f636f6c6f75722c202e706d5f6d6573736167655f7265706f727465645f636f6c6f7572207b0d0a09626f726465722d6c6566742d636f6c6f723a20236464396431633b0d0a09626f726465722d72696768742d636f6c6f723a20236464396431633b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f6d61726b65645f636f6c6f75722c202e706d5f6d61726b65645f636f6c6f7572207b0d0a09626f726465722d636f6c6f723a20234646363630303b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f7265706c6965645f636f6c6f75722c202e706d5f7265706c6965645f636f6c6f7572207b0d0a09626f726465722d636f6c6f723a20234139423843323b0d0a7d0d0a0d0a2e706d6c697374206c692e706d5f667269656e645f636f6c6f75722c202e706d5f667269656e645f636f6c6f7572207b0d0a09626f726465722d636f6c6f723a20233544384642443b0d0a7d0d0a0d0a706d6c697374206c692e706d5f666f655f636f6c6f75722c202e706d5f666f655f636f6c6f7572207b0d0a09626f726465722d636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2f2a204176617461722067616c6c657279202a2f0d0a2367616c6c657279206c6162656c207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b0d0a09626f726465722d636f6c6f723a20234343433b0d0a7d0d0a0d0a2367616c6c657279206c6162656c3a686f766572207b0d0a096261636b67726f756e642d636f6c6f723a20234545453b0d0a7d0d0a0d0a2f2a2020090d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d0d0a436f6c6f75727320616e64206261636b67726f756e647320666f7220666f726d732e6373730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a2f2a2047656e6572616c20666f726d207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a73656c656374207b0d0a09626f726465722d636f6c6f723a20233636363636363b0d0a096261636b67726f756e642d636f6c6f723a20234641464146413b0d0a7d0d0a0d0a6c6162656c207b0d0a09636f6c6f723a20233432353036373b0d0a7d0d0a0d0a6f7074696f6e2e64697361626c65642d6f7074696f6e207b0d0a09636f6c6f723a2067726179746578743b0d0a7d0d0a0d0a2f2a20446566696e6974696f6e206c697374206c61796f757420666f7220666f726d730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a6464206c6162656c207b0d0a09636f6c6f723a20233333333b0d0a7d0d0a0d0a2f2a20486f7665722065666665637473202a2f0d0a6669656c6473657420646c3a686f766572206474206c6162656c207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a6669656c647365742e6669656c64733220646c3a686f766572206474206c6162656c207b0d0a09636f6c6f723a20696e68657269743b0d0a7d0d0a0d0a2f2a20517569636b2d6c6f67696e206f6e20696e6465782070616765202a2f0d0a6669656c647365742e717569636b2d6c6f67696e20696e7075742e696e707574626f78207b0d0a096261636b67726f756e642d636f6c6f723a20234632463346333b0d0a7d0d0a0d0a2f2a20506f7374696e672070616765207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2a2f0d0a0d0a236d6573736167652d626f78207465787461726561207b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2f2a20496e707574206669656c64207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a2e696e707574626f78207b0d0a096261636b67726f756e642d636f6c6f723a20234646464646463b200d0a09626f726465722d636f6c6f723a20234234424143303b0d0a09636f6c6f723a20233333333333333b0d0a7d0d0a0d0a2e696e707574626f783a686f766572207b0d0a09626f726465722d636f6c6f723a20233131413345413b0d0a7d0d0a0d0a2e696e707574626f783a666f637573207b0d0a09626f726465722d636f6c6f723a20233131413345413b0d0a09636f6c6f723a20233046343938373b0d0a7d0d0a0d0a2f2a20466f726d20627574746f6e207374796c65730d0a2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d202a2f0d0a0d0a612e627574746f6e312c20696e7075742e627574746f6e312c20696e7075742e627574746f6e332c20612e627574746f6e322c20696e7075742e627574746f6e32207b0d0a09636f6c6f723a20233030303b0d0a096261636b67726f756e642d636f6c6f723a20234641464146413b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f62675f627574746f6e2e67696622293b0d0a7d0d0a0d0a612e627574746f6e312c20696e7075742e627574746f6e31207b0d0a09626f726465722d636f6c6f723a20233636363636363b0d0a7d0d0a0d0a696e7075742e627574746f6e33207b0d0a096261636b67726f756e642d696d6167653a206e6f6e653b0d0a7d0d0a0d0a2f2a20416c7465726e617469766520627574746f6e202a2f0d0a612e627574746f6e322c20696e7075742e627574746f6e322c20696e7075742e627574746f6e33207b0d0a09626f726465722d636f6c6f723a20233636363636363b0d0a7d0d0a0d0a2f2a203c613e20627574746f6e20696e20746865207374796c65206f662074686520666f726d20627574746f6e73202a2f0d0a612e627574746f6e312c20612e627574746f6e313a6c696e6b2c20612e627574746f6e313a766973697465642c20612e627574746f6e313a6163746976652c20612e627574746f6e322c20612e627574746f6e323a6c696e6b2c20612e627574746f6e323a766973697465642c20612e627574746f6e323a616374697665207b0d0a09636f6c6f723a20233030303030303b0d0a7d0d0a0d0a2f2a20486f76657220737461746573202a2f0d0a612e627574746f6e313a686f7665722c20696e7075742e627574746f6e313a686f7665722c20612e627574746f6e323a686f7665722c20696e7075742e627574746f6e323a686f7665722c20696e7075742e627574746f6e333a686f766572207b0d0a09626f726465722d636f6c6f723a20236464396431633b0d0a09636f6c6f723a20236464396431633b0d0a7d0d0a0d0a696e7075742e736561726368207b0d0a096261636b67726f756e642d696d6167653a2075726c28227b545f5448454d455f504154487d2f696d616765732f69636f6e5f74657874626f785f7365617263682e67696622293b0d0a7d0d0a0d0a696e7075742e64697361626c6564207b0d0a09636f6c6f723a20233636363636363b0d0a7d0d0a);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_approved` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `topic_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_poster` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_time_limit` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_replies_real` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_first_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_first_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_last_view_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poll_start` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_length` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_max_options` tinyint(4) NOT NULL DEFAULT '1',
  `poll_last_vote` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `topic_approved` (`topic_approved`),
  KEY `forum_appr_last` (`forum_id`,`topic_approved`,`topic_last_post_id`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `phpbb_topics`
--

INSERT INTO `phpbb_topics` (`topic_id`, `forum_id`, `icon_id`, `topic_attachment`, `topic_approved`, `topic_reported`, `topic_title`, `topic_poster`, `topic_time`, `topic_time_limit`, `topic_views`, `topic_replies`, `topic_replies_real`, `topic_status`, `topic_type`, `topic_first_post_id`, `topic_first_poster_name`, `topic_first_poster_colour`, `topic_last_post_id`, `topic_last_poster_id`, `topic_last_poster_name`, `topic_last_poster_colour`, `topic_last_post_subject`, `topic_last_post_time`, `topic_last_view_time`, `topic_moved_id`, `topic_bumped`, `topic_bumper`, `poll_title`, `poll_start`, `poll_length`, `poll_max_options`, `poll_last_vote`, `poll_vote_change`) VALUES
(2, 9, 0, 0, 1, 0, 'Famiglia Rossi', 57, 1355173113, 0, 9, 1, 1, 0, 0, 2, 'genitore2', '', 4, 58, 'genitore1', '', 'Famiglia Bianchi', 1355174726, 1355657563, 0, 0, 0, '', 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics_posted`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_topics_posted`
--

INSERT INTO `phpbb_topics_posted` (`user_id`, `topic_id`, `topic_posted`) VALUES
(0, 0, 0),
(2, 2, 1),
(57, 2, 1),
(58, 2, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics_track`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `topic_id` (`topic_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_topics_watch`
--

CREATE TABLE IF NOT EXISTS `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_users`
--

CREATE TABLE IF NOT EXISTS `phpbb_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '3',
  `user_permissions` mediumtext COLLATE utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passchg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_pass_convert` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_email_hash` bigint(20) NOT NULL DEFAULT '0',
  `user_birthday` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastmark` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpost_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpage` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_confirm_key` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_search` int(11) unsigned NOT NULL DEFAULT '0',
  `user_warnings` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_warning` int(11) unsigned NOT NULL DEFAULT '0',
  `user_login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `user_inactive_reason` tinyint(2) NOT NULL DEFAULT '0',
  `user_inactive_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_timezone` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_dst` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_dateformat` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_full_folder` int(11) NOT NULL DEFAULT '-3',
  `user_emailtime` int(11) unsigned NOT NULL DEFAULT '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_topic_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_post_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_post_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'a',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_notify_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_options` int(11) unsigned NOT NULL DEFAULT '230271',
  `user_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_type` tinyint(2) NOT NULL DEFAULT '0',
  `user_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_sig` mediumtext COLLATE utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_from` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_icq` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_aim` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_yim` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_msnm` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_jabber` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_website` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_occ` text COLLATE utf8_bin NOT NULL,
  `user_interests` text COLLATE utf8_bin NOT NULL,
  `user_actkey` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newpasswd` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_form_salt` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_reminded` tinyint(4) NOT NULL DEFAULT '0',
  `user_reminded_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=59 ;

--
-- Dump dei dati per la tabella `phpbb_users`
--

INSERT INTO `phpbb_users` (`user_id`, `user_type`, `group_id`, `user_permissions`, `user_perm_from`, `user_ip`, `user_regdate`, `username`, `username_clean`, `user_password`, `user_passchg`, `user_pass_convert`, `user_email`, `user_email_hash`, `user_birthday`, `user_lastvisit`, `user_lastmark`, `user_lastpost_time`, `user_lastpage`, `user_last_confirm_key`, `user_last_search`, `user_warnings`, `user_last_warning`, `user_login_attempts`, `user_inactive_reason`, `user_inactive_time`, `user_posts`, `user_lang`, `user_timezone`, `user_dst`, `user_dateformat`, `user_style`, `user_rank`, `user_colour`, `user_new_privmsg`, `user_unread_privmsg`, `user_last_privmsg`, `user_message_rules`, `user_full_folder`, `user_emailtime`, `user_topic_show_days`, `user_topic_sortby_type`, `user_topic_sortby_dir`, `user_post_show_days`, `user_post_sortby_type`, `user_post_sortby_dir`, `user_notify`, `user_notify_pm`, `user_notify_type`, `user_allow_pm`, `user_allow_viewonline`, `user_allow_viewemail`, `user_allow_massemail`, `user_options`, `user_avatar`, `user_avatar_type`, `user_avatar_width`, `user_avatar_height`, `user_sig`, `user_sig_bbcode_uid`, `user_sig_bbcode_bitfield`, `user_from`, `user_icq`, `user_aim`, `user_yim`, `user_msnm`, `user_jabber`, `user_website`, `user_occ`, `user_interests`, `user_actkey`, `user_newpasswd`, `user_form_salt`, `user_new`, `user_reminded`, `user_reminded_time`) VALUES
(1, 2, 1, '', 0, '', 1354998540, 'ciaomondo2', 'ciaomondo2', '$H$9mNxkbHfuXLaV9W7yBCqnNhEMAPM1p0', 1355166520, 0, '', 0, '', 1355165310, 0, 0, 'ucp.php?mode=logout', '', 0, 0, 0, 0, 0, 0, 0, 'en', 0.00, 0, 'd M Y H:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bc3aa711b149af26', 0, 0, 0),
(2, 3, 5, 0x7a696b307a6a7a696b307a6a7a696b3078730a716c633470693030303030300a716c633470693030303030300a0a0a0a716c633470693030303030300a716c633470693030303030300a716c633470693030303030300a716c63347069303030303030, 0, '::1', 1354998540, 'admin', 'admin', '$H$9vYlf.08zyxfLYgLSHYQHDVvcZshWQ1', 0, 0, 'a@tin.it', 8643458078, '', 1355657277, 0, 1355090936, 'index.php', '', 0, 0, 0, 0, 0, 0, 1, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 1, 'AA0000', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '97edb96c178635a2', 0, 0, 0),
(3, 2, 6, '', 0, '', 1354999187, 'AdsBot [Google]', 'adsbot [google]', '', 1354999187, 0, '', 0, '', 0, 1354999187, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '7ea64bf6d37b7939', 0, 0, 0),
(4, 2, 6, '', 0, '', 1354999187, 'Alexa [Bot]', 'alexa [bot]', '', 1354999187, 0, '', 0, '', 0, 1354999187, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1510ace753b0e65f', 0, 0, 0),
(5, 2, 6, '', 0, '', 1354999188, 'Alta Vista [Bot]', 'alta vista [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cd78524a89180b8d', 0, 0, 0),
(6, 2, 6, '', 0, '', 1354999188, 'Ask Jeeves [Bot]', 'ask jeeves [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dfa61f267414a981', 0, 0, 0),
(7, 2, 6, '', 0, '', 1354999188, 'Baidu [Spider]', 'baidu [spider]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'b9ee112f5b797ea1', 0, 0, 0),
(8, 2, 6, '', 0, '', 1354999188, 'Bing [Bot]', 'bing [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'a4a670d93bd6235d', 0, 0, 0),
(9, 2, 6, '', 0, '', 1354999188, 'Exabot [Bot]', 'exabot [bot]', '', 1354999188, 0, '', 0, '', 0, 1354999188, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dd52d22c9b630320', 0, 0, 0),
(10, 2, 6, '', 0, '', 1354999189, 'FAST Enterprise [Crawler]', 'fast enterprise [crawler]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '93916522318956bf', 0, 0, 0),
(11, 2, 6, '', 0, '', 1354999189, 'FAST WebCrawler [Crawler]', 'fast webcrawler [crawler]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c1233080a93d9f2a', 0, 0, 0),
(12, 2, 6, '', 0, '', 1354999189, 'Francis [Bot]', 'francis [bot]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '20d35a84760a26c9', 0, 0, 0),
(13, 2, 6, '', 0, '', 1354999189, 'Gigabot [Bot]', 'gigabot [bot]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e509143bc4f7afc3', 0, 0, 0),
(14, 2, 6, '', 0, '', 1354999189, 'Google Adsense [Bot]', 'google adsense [bot]', '', 1354999189, 0, '', 0, '', 0, 1354999189, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '18283fd8b1659151', 0, 0, 0),
(15, 2, 6, '', 0, '', 1354999190, 'Google Desktop', 'google desktop', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c368068b66552c90', 0, 0, 0),
(16, 2, 6, '', 0, '', 1354999190, 'Google Feedfetcher', 'google feedfetcher', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd50c6aad04c9c829', 0, 0, 0),
(17, 2, 6, '', 0, '', 1354999190, 'Google [Bot]', 'google [bot]', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2de70a9f7288177a', 0, 0, 0),
(18, 2, 6, '', 0, '', 1354999190, 'Heise IT-Markt [Crawler]', 'heise it-markt [crawler]', '', 1354999190, 0, '', 0, '', 0, 1354999190, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e7df2916f2df1f95', 0, 0, 0),
(19, 2, 6, '', 0, '', 1354999191, 'Heritrix [Crawler]', 'heritrix [crawler]', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'f64de5a7d8db8bee', 0, 0, 0),
(20, 2, 6, '', 0, '', 1354999191, 'IBM Research [Bot]', 'ibm research [bot]', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '57fcd2e9e58468b4', 0, 0, 0),
(21, 2, 6, '', 0, '', 1354999191, 'ICCrawler - ICjobs', 'iccrawler - icjobs', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c7f43f48432f92d7', 0, 0, 0),
(22, 2, 6, '', 0, '', 1354999191, 'ichiro [Crawler]', 'ichiro [crawler]', '', 1354999191, 0, '', 0, '', 0, 1354999191, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'cc14f8a734d6d56d', 0, 0, 0),
(23, 2, 6, '', 0, '', 1354999192, 'Majestic-12 [Bot]', 'majestic-12 [bot]', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '63a96f473e00b489', 0, 0, 0),
(24, 2, 6, '', 0, '', 1354999192, 'Metager [Bot]', 'metager [bot]', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0e8de7d9344f172e', 0, 0, 0),
(25, 2, 6, '', 0, '', 1354999192, 'MSN NewsBlogs', 'msn newsblogs', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1ef7206b53c3fb52', 0, 0, 0),
(26, 2, 6, '', 0, '', 1354999192, 'MSN [Bot]', 'msn [bot]', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dc737d80522710eb', 0, 0, 0),
(27, 2, 6, '', 0, '', 1354999192, 'MSNbot Media', 'msnbot media', '', 1354999192, 0, '', 0, '', 0, 1354999192, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8a8e10f31c88b061', 0, 0, 0),
(28, 2, 6, '', 0, '', 1354999193, 'NG-Search [Bot]', 'ng-search [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd53637dc823c89cc', 0, 0, 0),
(29, 2, 6, '', 0, '', 1354999193, 'Nutch [Bot]', 'nutch [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '46c3c9463028727f', 0, 0, 0),
(30, 2, 6, '', 0, '', 1354999193, 'Nutch/CVS [Bot]', 'nutch/cvs [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd15b5de07e1d491f', 0, 0, 0),
(31, 2, 6, '', 0, '', 1354999193, 'OmniExplorer [Bot]', 'omniexplorer [bot]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e0a6ff8f6eb37aed', 0, 0, 0),
(32, 2, 6, '', 0, '', 1354999193, 'Online link [Validator]', 'online link [validator]', '', 1354999193, 0, '', 0, '', 0, 1354999193, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'dc89004f839cb37e', 0, 0, 0),
(33, 2, 6, '', 0, '', 1354999194, 'psbot [Picsearch]', 'psbot [picsearch]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'c637accf9b428a9a', 0, 0, 0),
(34, 2, 6, '', 0, '', 1354999194, 'Seekport [Bot]', 'seekport [bot]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8806f5ea318a44b4', 0, 0, 0),
(35, 2, 6, '', 0, '', 1354999194, 'Sensis [Crawler]', 'sensis [crawler]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '8296d9d33322b456', 0, 0, 0),
(36, 2, 6, '', 0, '', 1354999194, 'SEO Crawler', 'seo crawler', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '188e32b1dbfb15ad', 0, 0, 0),
(37, 2, 6, '', 0, '', 1354999194, 'Seoma [Crawler]', 'seoma [crawler]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'd8009da407e87c8a', 0, 0, 0),
(38, 2, 6, '', 0, '', 1354999194, 'SEOSearch [Crawler]', 'seosearch [crawler]', '', 1354999194, 0, '', 0, '', 0, 1354999194, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'eaae5e681b45d340', 0, 0, 0),
(39, 2, 6, '', 0, '', 1354999195, 'Snappy [Bot]', 'snappy [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ed10e989294d88ad', 0, 0, 0),
(40, 2, 6, '', 0, '', 1354999195, 'Steeler [Crawler]', 'steeler [crawler]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1248a5ba2be17d43', 0, 0, 0),
(41, 2, 6, '', 0, '', 1354999195, 'Synoo [Bot]', 'synoo [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '84777858e0e45a06', 0, 0, 0),
(42, 2, 6, '', 0, '', 1354999195, 'Telekom [Bot]', 'telekom [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '83b0661a99dde85b', 0, 0, 0),
(43, 2, 6, '', 0, '', 1354999195, 'TurnitinBot [Bot]', 'turnitinbot [bot]', '', 1354999195, 0, '', 0, '', 0, 1354999195, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bed00ad1d52d6996', 0, 0, 0),
(44, 2, 6, '', 0, '', 1354999196, 'Voyager [Bot]', 'voyager [bot]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'fca9527595fdef62', 0, 0, 0),
(45, 2, 6, '', 0, '', 1354999196, 'W3 [Sitesearch]', 'w3 [sitesearch]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '36bfa7cc9d0e3ed5', 0, 0, 0),
(46, 2, 6, '', 0, '', 1354999196, 'W3C [Linkcheck]', 'w3c [linkcheck]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '9957b28618d3b4df', 0, 0, 0),
(47, 2, 6, '', 0, '', 1354999196, 'W3C [Validator]', 'w3c [validator]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '320ca0a77d82c427', 0, 0, 0),
(48, 2, 6, '', 0, '', 1354999196, 'WiseNut [Bot]', 'wisenut [bot]', '', 1354999196, 0, '', 0, '', 0, 1354999196, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '9617c9f7db1b1f3e', 0, 0, 0),
(49, 2, 6, '', 0, '', 1354999197, 'YaCy [Bot]', 'yacy [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '19a55d5237e276ee', 0, 0, 0),
(50, 2, 6, '', 0, '', 1354999197, 'Yahoo MMCrawler [Bot]', 'yahoo mmcrawler [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6ef4a79525d0dac4', 0, 0, 0),
(51, 2, 6, '', 0, '', 1354999197, 'Yahoo Slurp [Bot]', 'yahoo slurp [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '834daa7d8ddcc495', 0, 0, 0),
(52, 2, 6, '', 0, '', 1354999197, 'Yahoo [Bot]', 'yahoo [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '75aefc5af13b67aa', 0, 0, 0),
(53, 2, 6, '', 0, '', 1354999197, 'YahooSeeker [Bot]', 'yahooseeker [bot]', '', 1354999197, 0, '', 0, '', 0, 1354999197, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '9E8DA7', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 0, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '6872f262fe114cb4', 0, 0, 0),
(54, 0, 3, '', 0, '', 0, 'Genitore1', '', '$H$9gks7rwydvAle.osMJlLvdYv2MfzdP/', 1355029237, 0, '', 0, '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, '', 0.00, 0, 'd M Y H:i', 0, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1, 0, 0),
(56, 0, 2, '', 0, '::1', 1355162969, 'ciaomondo', 'ciaomondo', '$H$9hRJ0RE7VOMP3cWa2jQuP0YRIQoAdD0', 1355162969, 0, 'ciccio@tin.it', 123711018613, '', 1355163010, 1355162969, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '4e0ddbcdf3ae7804', 1, 0, 0),
(57, 0, 2, '', 0, '::1', 1355169220, 'genitore2', 'genitore2', '$H$91eJ/ZuYJXYpb/fqq2jm.pIm1LnTmW.', 1355169220, 0, 'prova@hotmail.it', 128444149616, '', 1355174037, 1355169220, 1355173113, '', '', 0, 0, 0, 0, 0, 0, 1, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'e6d8a65c47a76ddc', 1, 0, 0),
(58, 0, 2, '', 0, '::1', 1355174541, 'genitore1', 'genitore1', '$H$9uAZ8WUI4Pneo/uiBglHVN0JSCO5ui1', 1355174541, 0, 'a@tic.it', 32536018108, '', 1355181902, 1355174541, 1355174726, '', '', 0, 0, 0, 0, 0, 0, 1, 'it', 0.00, 0, '|d/m/Y|, G:i', 4, 0, '', 0, 0, 0, 0, -3, 0, 0, 't', 'd', 0, 't', 'a', 0, 1, 0, 1, 1, 1, 1, 230271, '', 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0502a3cdd7af31c5', 1, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_user_group`
--

CREATE TABLE IF NOT EXISTS `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `phpbb_user_group`
--

INSERT INTO `phpbb_user_group` (`group_id`, `user_id`, `group_leader`, `user_pending`) VALUES
(2, 2, 0, 0),
(4, 2, 0, 0),
(5, 2, 1, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 0, 0),
(6, 7, 0, 0),
(6, 8, 0, 0),
(6, 9, 0, 0),
(6, 10, 0, 0),
(6, 11, 0, 0),
(6, 12, 0, 0),
(6, 13, 0, 0),
(6, 14, 0, 0),
(6, 15, 0, 0),
(6, 16, 0, 0),
(6, 17, 0, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(6, 20, 0, 0),
(6, 21, 0, 0),
(6, 22, 0, 0),
(6, 23, 0, 0),
(6, 24, 0, 0),
(6, 25, 0, 0),
(6, 26, 0, 0),
(6, 27, 0, 0),
(6, 28, 0, 0),
(6, 29, 0, 0),
(6, 30, 0, 0),
(6, 31, 0, 0),
(6, 32, 0, 0),
(6, 33, 0, 0),
(6, 34, 0, 0),
(6, 35, 0, 0),
(6, 36, 0, 0),
(6, 37, 0, 0),
(6, 38, 0, 0),
(6, 39, 0, 0),
(6, 40, 0, 0),
(6, 41, 0, 0),
(6, 42, 0, 0),
(6, 43, 0, 0),
(6, 44, 0, 0),
(6, 45, 0, 0),
(6, 46, 0, 0),
(6, 47, 0, 0),
(6, 48, 0, 0),
(6, 49, 0, 0),
(6, 50, 0, 0),
(6, 51, 0, 0),
(6, 52, 0, 0),
(6, 53, 0, 0),
(2, 57, 0, 0),
(2, 58, 0, 0),
(7, 58, 0, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_warnings`
--

CREATE TABLE IF NOT EXISTS `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_words`
--

CREATE TABLE IF NOT EXISTS `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `phpbb_zebra`
--

CREATE TABLE IF NOT EXISTS `phpbb_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `zebra_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `foe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`zebra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
