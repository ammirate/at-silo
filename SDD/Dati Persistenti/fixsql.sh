#!/bin/bash

sqlfile=$1
sed -i 's/CREATE TABLE IF NOT EXISTS `\([^`]\+\)`/DROP TABLE IF EXISTS `\1`;\n\0/;s/\/\*!40101 SET NAMES utf8 \*\/;/\/\*!40101 SET NAMES utf8 \*\/;\n\/\*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE \*\/;\n\/\*!40103 SET TIME_ZONE="+00:00" \*\/;\n\/\*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 \*\/;\n\/\*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 \*\/;\n\/\*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="NO_AUTO_VALUE_ON_ZERO" \*\/;\n\/\*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 \*\/;\n/' "$sqlfile"

printf "\n/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;\n\n/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\n/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\n/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;" >> "$sqlfile"