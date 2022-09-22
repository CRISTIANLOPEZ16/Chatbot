/*
 Navicat Premium Data Transfer

 Source Server         : chatbot
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : chatbot-rds.cznv3w7ckqc0.us-west-1.rds.amazonaws.com:3306
 Source Schema         : chatbot

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 22/09/2022 18:41:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Administradors
-- ----------------------------
DROP TABLE IF EXISTS `Administradors`;
CREATE TABLE `Administradors`  (
  `id` int NOT NULL,
  `clave` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adminSecundario` bigint NOT NULL DEFAULT 0,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `Administradors_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Personas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Administradors
-- ----------------------------
INSERT INTO `Administradors` VALUES (6, '123456', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for Clientes
-- ----------------------------
DROP TABLE IF EXISTS `Clientes`;
CREATE TABLE `Clientes`  (
  `id` int NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `Clientes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Personas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Clientes
-- ----------------------------
INSERT INTO `Clientes` VALUES (6, '1151633', '2022-06-23 07:38:22', '2022-06-23 07:38:22');
INSERT INTO `Clientes` VALUES (17, '1151677', '2022-06-23 09:31:36', '2022-06-23 09:31:36');
INSERT INTO `Clientes` VALUES (18, '1151485', '2022-06-23 10:27:14', '2022-06-23 10:27:14');
INSERT INTO `Clientes` VALUES (19, '151420', '2022-06-23 10:29:18', '2022-06-23 10:29:18');
INSERT INTO `Clientes` VALUES (20, '1151608', '2022-06-24 03:07:53', '2022-06-24 03:07:53');

-- ----------------------------
-- Table structure for Consulta
-- ----------------------------
DROP TABLE IF EXISTS `Consulta`;
CREATE TABLE `Consulta`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente` int NOT NULL,
  `estado` enum('RESUELTA','EN REVISION','INCONGRUENTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cliente`(`cliente`) USING BTREE,
  CONSTRAINT `Consulta_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `Clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Consulta
-- ----------------------------
INSERT INTO `Consulta` VALUES (1, 17, 'EN REVISION', '2022-06-23 09:34:22', '2022-06-23 09:34:22');
INSERT INTO `Consulta` VALUES (2, 19, 'EN REVISION', '2022-06-23 10:30:23', '2022-06-23 10:30:23');
INSERT INTO `Consulta` VALUES (3, 20, 'EN REVISION', '2022-06-24 03:08:04', '2022-06-24 03:08:04');

-- ----------------------------
-- Table structure for Personas
-- ----------------------------
DROP TABLE IF EXISTS `Personas`;
CREATE TABLE `Personas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipo` enum('ADMINISTRADOR','CLIENTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `correo`(`correo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Personas
-- ----------------------------
INSERT INTO `Personas` VALUES (6, 'Cristian', 'Lopez', 'admin@gmail.com', 'ADMINISTRADOR', '2022-06-23 07:38:21', '2022-06-23 07:38:21');
INSERT INTO `Personas` VALUES (17, 'Carlitos', 'Angarita', 'angari@gamil.com', 'CLIENTE', '2022-06-23 09:31:32', '2022-06-23 09:31:32');
INSERT INTO `Personas` VALUES (18, 'Armando', 'Neruda', 'armandito@gmail.com', 'CLIENTE', '2022-06-23 10:27:14', '2022-06-23 10:27:14');
INSERT INTO `Personas` VALUES (19, 'Juan', 'Gomez', 'jiang@gmail.com', 'CLIENTE', '2022-06-23 10:29:18', '2022-06-23 10:29:18');
INSERT INTO `Personas` VALUES (20, 'Juliana', 'Bautista', 'juliB@gmail.com', 'CLIENTE', '2022-06-24 03:07:53', '2022-06-24 03:07:53');

-- ----------------------------
-- Table structure for Pregunta
-- ----------------------------
DROP TABLE IF EXISTS `Pregunta`;
CREATE TABLE `Pregunta`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `consulta` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `consulta`(`consulta`) USING BTREE,
  CONSTRAINT `Pregunta_ibfk_1` FOREIGN KEY (`consulta`) REFERENCES `Consulta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Pregunta
-- ----------------------------
INSERT INTO `Pregunta` VALUES (1, '¿Cuantos creditos necesito para graduarme?\n', 1, '2022-06-23 09:34:22', '2022-06-23 09:34:22');
INSERT INTO `Pregunta` VALUES (2, '¿Qué electivas profesionales y socio-humanísticas se encuentran ofertadas en el semestre actual', 2, '2022-06-23 10:30:23', '2022-06-23 10:30:23');
INSERT INTO `Pregunta` VALUES (3, '¿Que sucede si se pierde una electiva?', 3, '2022-06-24 03:08:04', '2022-06-24 03:08:04');

-- ----------------------------
-- Table structure for Respuesta
-- ----------------------------
DROP TABLE IF EXISTS `Respuesta`;
CREATE TABLE `Respuesta`  (
  `id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pregunta` int NOT NULL,
  `createdAt` datetime(0) NOT NULL,
  `updatedAt` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pregunta`(`pregunta`) USING BTREE,
  CONSTRAINT `Respuesta_ibfk_1` FOREIGN KEY (`pregunta`) REFERENCES `Pregunta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Respuesta
-- ----------------------------
INSERT INTO `Respuesta` VALUES (0, 'Es necesario cumplir con los requisitos de electivas y 180 creditos', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
