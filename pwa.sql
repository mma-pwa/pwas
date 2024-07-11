/*
 Navicat Premium Data Transfer

 Source Server         : release
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : rm-2ev5jiy5r4r9f97924o.mysql.rds.aliyuncs.com:3306
 Source Schema         : pwa

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 21/05/2024 14:23:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Uuid md5 16位',
  `user_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'appname',
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '短名称',
  `description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述',
  `icons` json NOT NULL COMMENT 'Icon',
  `app_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'App实际地址',
  `app_dev_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '开发者名称',
  `app_rate_num` decimal(2,1) NOT NULL COMMENT '评分',
  `app_rate_count` bigint NOT NULL COMMENT '评分人数',
  `app_install_count` bigint NOT NULL COMMENT '安装人数',
  `app_safe_age` bigint NOT NULL COMMENT '适配年龄',
  `app_screen` json NOT NULL COMMENT '五图',
  `ios_jump` tinyint NOT NULL DEFAULT '0' COMMENT 'IOS是否跳转1跳转0不跳转',
  `app_description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '应用介绍',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，1:下架，0:在架',
  `screen_orientation` tinyint(1) NOT NULL COMMENT '0:竖屏，1:横屏',
  `promotion_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '推广链接',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `iframe` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否打开iframe1打开0关闭',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `install_template` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0:竖屏，1:横屏',
  `any_site_install` tinyint(1) NOT NULL DEFAULT '0' COMMENT '点击任意位置安装应用:0否1是',
  `site_modify` tinyint NOT NULL DEFAULT '0' COMMENT '网络地址是否允许修改，1允许0不允许',
  `data_buried_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '//数据埋点',
  `buried_point_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '//记录id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of app
-- ----------------------------
BEGIN;
INSERT INTO `app` VALUES ('e9b421c2b2d39b46', '6a34e0b15502e792', 'Lucky Slot 777', 'Very Nice Game', '', '[{\"url\": \"/img/6a34e0b15502e792/C3z2gMpwIixB_512x512.png\", \"width\": 512, \"height\": 512, \"img_type\": \"png\"}, {\"url\": \"/img/6a34e0b15502e792/C3z2gMpwIixB_192x192.png\", \"width\": 192, \"height\": 192, \"img_type\": \"png\"}]', 'https://brrbet0.com', 'DOi', 4.9, 8576, 173479347, 18, '[{\"url\": \"/img/6a34e0b15502e792/2838023a778dfaec_20240410125320.png\", \"width\": 720, \"height\": 1280, \"img_type\": \"png\"}, {\"url\": \"/img/6a34e0b15502e792/9a1158154dfa42ca_20240410125325.png\", \"width\": 720, \"height\": 1280, \"img_type\": \"png\"}, {\"url\": \"/img/6a34e0b15502e792/d82c8d1619ad8176_20240410125331.png\", \"width\": 720, \"height\": 1280, \"img_type\": \"png\"}]', 0, 'Try your luck, play the BEST casino slot machines games without internet for FREE!\n\nExperience a luxury classic Greek Myth themed casino slots game right now!\n\n💰20,000,000 free coins for new players and more FREE bonus coins daily, what are you waiting for?', 0, 0, '', '2024-04-10 12:54:07', '2024-04-10 19:07:49', NULL, 1, 's1', 0, 1, 0, '', '');
COMMIT;

-- ----------------------------
-- Table structure for app_channel
-- ----------------------------
DROP TABLE IF EXISTS `app_channel`;
CREATE TABLE `app_channel` (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Uuid md5 16位',
  `app_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `channel_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of app_channel
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for app_custom_url
-- ----------------------------
DROP TABLE IF EXISTS `app_custom_url`;
CREATE TABLE `app_custom_url` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `custom_url` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT 'Url当前状态，0为正常，1为关闭',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `domain_prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `app_url_id` (`app_id`,`custom_url`) USING BTREE,
  UNIQUE KEY `cu_uni` (`custom_url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of app_custom_url
-- ----------------------------
BEGIN;
INSERT INTO `app_custom_url` VALUES (30, 'e9b421c2b2d39b46', 's1.quicka2b.com', 0, '2024-04-10 12:54:26', '2024-04-10 12:54:26', NULL, 's1');
INSERT INTO `app_custom_url` VALUES (32, 'e9b421c2b2d39b46', 's2.quicka2b.com', 0, '2024-04-10 12:54:48', '2024-04-10 12:54:48', NULL, 's2');
COMMIT;

-- ----------------------------
-- Table structure for app_sub_user
-- ----------------------------
DROP TABLE IF EXISTS `app_sub_user`;
CREATE TABLE `app_sub_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `app_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sub_info` json NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `au_id` (`app_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of app_sub_user
-- ----------------------------
BEGIN;
INSERT INTO `app_sub_user` VALUES (36, 'e9b421c2b2d39b46', '79e3c687-75ce-4212-8ac4-d6a0f779428b', '{\"keys\": {\"auth\": \"-5CoQEBewsUe3oCoWHxa2g\", \"p256dh\": \"BFjAUBQKbCkbRDu1e1qTBVymmxcOTsfjSYFww80ZBzhwSoS7K_XnKNvTQnRwltHEq1Y-hY4rTNb0rTqQHVEFRcU\"}, \"endpoint\": \"https://fcm.googleapis.com/fcm/send/eyh-WLcdriA:APA91bEY5tfMB6QsY_TnAlZxkn_-TMzMc7kxYZlYVEJJsamHyrXjTL3bVjHII8VM3JsSCFbVLeuxE2LZ_aOH7tzKPskHw3y08xn-i-NQoh2pgPfEmKAxhW7uvb1rPVZ-s6IyORUOAFxG\", \"expirationTime\": \"\"}', '2024-04-10 13:33:03', '2024-04-10 13:33:03', NULL);
INSERT INTO `app_sub_user` VALUES (38, 'e9b421c2b2d39b46', '62eab7ca-17c5-4832-9d42-2eb746a2d409', '{\"keys\": {\"auth\": \"K8lcAWbsngIjrebL_e_cBg\", \"p256dh\": \"BN6A8twyxUUoXvB28Oe7z544OhVDHXGoZKJHVXcoz7ePpbT0iLFB7mJgsKHhi5WmMkBxU9QMMoLzv-tJE_iDK-Y\"}, \"endpoint\": \"https://fcm.googleapis.com/fcm/send/f6VM4g2jP7g:APA91bFxqsl6nnZcG9xvlK1YyOUeLjUmeUKz_M4mItTRHqFLR7QFrYuAzalCfdLJeAMf9G25CGF7neBbpMmP58p2YcWUFi-MdMWT-KqZdA_R3YWZw6u3e_uOaU_hEFPNQXcPuOMUMt_y\", \"expirationTime\": \"\"}', '2024-04-10 14:27:23', '2024-04-10 14:27:23', NULL);
INSERT INTO `app_sub_user` VALUES (39, 'e9b421c2b2d39b46', '14441591-6279-460d-8c2e-5989c1ff5376', '{\"keys\": {\"auth\": \"dvcM4jbaN1-Br-rFffCqYw\", \"p256dh\": \"BOWmP84P8vZe5DpS5ylLNHR5pDLkJyeHuSjX1shwPG7jh8BHVdoy0_7vZf2VUkCj69GGAVsn0CQHVjot5lD5JMo\"}, \"endpoint\": \"https://fcm.googleapis.com/fcm/send/ddDOWXPD-q0:APA91bF8QYrnGV4JN1qT9fLZxq9aVEF3gCLUCzu1clSQuD0IkxgJRZpf-Z1a5lNzaw1VXHVJbLHgwOm5tmnH3KcRvxXydkRYupKBQDADL1O0VI-tt2-LWY5o2Yyb4mLuozMpTJD13JzY\", \"expirationTime\": \"\"}', '2024-04-10 14:28:32', '2024-04-10 14:28:32', NULL);
INSERT INTO `app_sub_user` VALUES (40, 'e9b421c2b2d39b46', '3bbd00be-6194-42e1-b75d-61c95a392f3c', '{\"keys\": {\"auth\": \"LXh74eDKaRzv6951Bxzzgw\", \"p256dh\": \"BMV3OOplCIXdzmvwkdtDswsHlE6z1JZAhssjNWya9G92bg3IeB76ai1U3rOl79-z64ClzXzfx_IKUlieQJSAW54\"}, \"endpoint\": \"https://fcm.googleapis.com/fcm/send/fA5lpJ_T6sk:APA91bEURxGLWi9W_qfk9KW58JckZ3lJGXXOmDEyhZeNLlIuniHpkV2GzzmnfztLuo_cKh0CuiE9Bsk2rlkXoIHv4_7MVeWwnmO_PEUTcTYdK2P5Hmi5zHmfuxlRLHdTw9UWwwGTfgkt\", \"expirationTime\": \"\"}', '2024-04-10 19:07:24', '2024-04-10 19:07:24', NULL);
INSERT INTO `app_sub_user` VALUES (41, 'e9b421c2b2d39b46', '6d9bdc80-71fd-4c02-8d56-5d3c921cf41e', '{\"keys\": {\"auth\": \"PiWqw6NhLsjIDuzjYoLd8Q\", \"p256dh\": \"BDzcXs7a_F5aeBHlUJOWK1UXMWJAB7MdYlbipPHlCWweCcACbyJpNcg-AuadUrQXDTTJS_MzRF1YMH3mlnZzFFs\"}, \"endpoint\": \"https://fcm.googleapis.com/fcm/send/fRTFOQ_ClTY:APA91bEew-Q1uT0y5OesytFzH4gJOtMMPz3KlQV43yZy3NR80l_wE9yeXnhaj55CxbJ7FpU6juiCrq9nAFn2JjuDA2wdDXmHD-Vj8-dynRkdG_UeRMjahIuDoCdxJ9xktbhZt70Awdmm\", \"expirationTime\": \"\"}', '2024-04-10 19:10:32', '2024-04-10 19:10:32', NULL);
INSERT INTO `app_sub_user` VALUES (42, 'e9b421c2b2d39b46', 'c76caa69-5564-4bdc-b8b6-48ca9775ac8a', '{\"keys\": {\"auth\": \"_XgCMb_8tOZLvvQu5W1VRg\", \"p256dh\": \"BKhW7ssbA5MFglrZujEe5bAnJY4aCM-mwWwSMuBP05ZZMKO7fRjYM2ClUioJa9vuJhIdjcAa2lT8jd93kdykOLM\"}, \"endpoint\": \"https://fcm.googleapis.com/fcm/send/dTbp64M8e8g:APA91bEss4mu7KtxP4RFcejbN1HL5JwEWEq-9NqIZNnc3_m_Il64-moIeApA7Taw6e2xBGfwlDUfsJ5L-HRYuE0MOdf-GjkhL6-gA6MMgp3tkMYykhwxMxozkW_z-nAoU8wqGxm0pYjJ\", \"expirationTime\": \"\"}', '2024-04-15 19:47:04', '2024-04-15 19:47:04', NULL);
COMMIT;

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '自增id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of app_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for app_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `app_user_login_log`;
CREATE TABLE `app_user_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `promotion_url` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `channel_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id_status` (`user_id`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2038 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of app_user_login_log
-- ----------------------------
BEGIN;
INSERT INTO `app_user_login_log` VALUES (1668, '7a825c56-5080-4edb-abdc-a86914133681', 'load', 's1.quicka2b.com', '', '2024-04-10 13:04:09', '2024-04-10 13:04:09', NULL);
INSERT INTO `app_user_login_log` VALUES (1669, '7a825c56-5080-4edb-abdc-a86914133681', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 13:04:10', '2024-04-10 13:04:10', NULL);
INSERT INTO `app_user_login_log` VALUES (1674, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'load', 's1.quicka2b.com', '', '2024-04-10 13:32:08', '2024-04-10 13:32:08', NULL);
INSERT INTO `app_user_login_log` VALUES (1675, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 13:32:17', '2024-04-10 13:32:17', NULL);
INSERT INTO `app_user_login_log` VALUES (1676, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 13:32:21', '2024-04-10 13:32:21', NULL);
INSERT INTO `app_user_login_log` VALUES (1688, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-10 13:32:49', '2024-04-10 13:32:49', NULL);
INSERT INTO `app_user_login_log` VALUES (1689, '8596a8d8-fae1-423b-b3c9-10f8d27e991e', 'start', 's1.quicka2b.com', '', '2024-04-10 13:32:51', '2024-04-10 13:32:51', NULL);
INSERT INTO `app_user_login_log` VALUES (1690, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'installed', 's1.quicka2b.com', '', '2024-04-10 13:32:55', '2024-04-10 13:32:55', NULL);
INSERT INTO `app_user_login_log` VALUES (1691, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'open', 's1.quicka2b.com', '', '2024-04-10 13:32:57', '2024-04-10 13:32:57', NULL);
INSERT INTO `app_user_login_log` VALUES (1692, '79e3c687-75ce-4212-8ac4-d6a0f779428b', 'start', 's1.quicka2b.com', '', '2024-04-10 13:32:59', '2024-04-10 13:32:59', NULL);
INSERT INTO `app_user_login_log` VALUES (1699, '62eab7ca-17c5-4832-9d42-2eb746a2d409', 'load', 's1.quicka2b.com', '', '2024-04-10 14:27:03', '2024-04-10 14:27:03', NULL);
INSERT INTO `app_user_login_log` VALUES (1700, '62eab7ca-17c5-4832-9d42-2eb746a2d409', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 14:27:03', '2024-04-10 14:27:03', NULL);
INSERT INTO `app_user_login_log` VALUES (1701, '62eab7ca-17c5-4832-9d42-2eb746a2d409', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-10 14:27:08', '2024-04-10 14:27:08', NULL);
INSERT INTO `app_user_login_log` VALUES (1702, '62eab7ca-17c5-4832-9d42-2eb746a2d409', 'installed', 's1.quicka2b.com', '', '2024-04-10 14:27:14', '2024-04-10 14:27:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1703, '62eab7ca-17c5-4832-9d42-2eb746a2d409', 'open', 's1.quicka2b.com', '', '2024-04-10 14:27:17', '2024-04-10 14:27:17', NULL);
INSERT INTO `app_user_login_log` VALUES (1704, '62eab7ca-17c5-4832-9d42-2eb746a2d409', 'start', 's1.quicka2b.com', '', '2024-04-10 14:27:19', '2024-04-10 14:27:19', NULL);
INSERT INTO `app_user_login_log` VALUES (1705, '14441591-6279-460d-8c2e-5989c1ff5376', 'load', 's2.quicka2b.com', '', '2024-04-10 14:28:14', '2024-04-10 14:28:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1706, '14441591-6279-460d-8c2e-5989c1ff5376', 'beforeinstallprompt', 's2.quicka2b.com', '', '2024-04-10 14:28:14', '2024-04-10 14:28:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1707, '14441591-6279-460d-8c2e-5989c1ff5376', 'choice_accepted', 's2.quicka2b.com', '', '2024-04-10 14:28:16', '2024-04-10 14:28:16', NULL);
INSERT INTO `app_user_login_log` VALUES (1708, '3f40c6bc-b504-47e8-91db-05282201741e', 'start', 's2.quicka2b.com', '', '2024-04-10 14:28:18', '2024-04-10 14:28:18', NULL);
INSERT INTO `app_user_login_log` VALUES (1709, '14441591-6279-460d-8c2e-5989c1ff5376', 'installed', 's2.quicka2b.com', '', '2024-04-10 14:28:23', '2024-04-10 14:28:23', NULL);
INSERT INTO `app_user_login_log` VALUES (1710, '14441591-6279-460d-8c2e-5989c1ff5376', 'start', 's2.quicka2b.com', '', '2024-04-10 14:28:28', '2024-04-10 14:28:28', NULL);
INSERT INTO `app_user_login_log` VALUES (1718, '7a825c56-5080-4edb-abdc-a86914133681', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:06:05', '2024-04-10 17:06:05', NULL);
INSERT INTO `app_user_login_log` VALUES (1749, '1147949e-b71e-47d1-a86e-d7a9245d7758', 'load', 's1.quicka2b.com', '', '2024-04-10 17:34:00', '2024-04-10 17:34:00', NULL);
INSERT INTO `app_user_login_log` VALUES (1750, '1147949e-b71e-47d1-a86e-d7a9245d7758', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 17:34:10', '2024-04-10 17:34:10', NULL);
INSERT INTO `app_user_login_log` VALUES (1751, '1147949e-b71e-47d1-a86e-d7a9245d7758', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:34:11', '2024-04-10 17:34:11', NULL);
INSERT INTO `app_user_login_log` VALUES (1753, '5e6d4473-25e4-4844-9137-6fcc33edd132', 'load', 's1.quicka2b.com', '', '2024-04-10 17:34:26', '2024-04-10 17:34:26', NULL);
INSERT INTO `app_user_login_log` VALUES (1754, '5e6d4473-25e4-4844-9137-6fcc33edd132', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 17:34:34', '2024-04-10 17:34:34', NULL);
INSERT INTO `app_user_login_log` VALUES (1755, '5e6d4473-25e4-4844-9137-6fcc33edd132', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:34:36', '2024-04-10 17:34:36', NULL);
INSERT INTO `app_user_login_log` VALUES (1763, 'df40a69c-e870-40f4-a37c-78f30eaa4d8e', 'load', 's1.quicka2b.com', '', '2024-04-10 17:34:57', '2024-04-10 17:34:57', NULL);
INSERT INTO `app_user_login_log` VALUES (1764, 'df40a69c-e870-40f4-a37c-78f30eaa4d8e', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 17:35:05', '2024-04-10 17:35:05', NULL);
INSERT INTO `app_user_login_log` VALUES (1765, 'df40a69c-e870-40f4-a37c-78f30eaa4d8e', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:35:07', '2024-04-10 17:35:07', NULL);
INSERT INTO `app_user_login_log` VALUES (1769, 'abee244d-f877-4283-8459-62277f95ff86', 'load', 's1.quicka2b.com', '', '2024-04-10 17:35:21', '2024-04-10 17:35:21', NULL);
INSERT INTO `app_user_login_log` VALUES (1770, 'abee244d-f877-4283-8459-62277f95ff86', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 17:35:31', '2024-04-10 17:35:31', NULL);
INSERT INTO `app_user_login_log` VALUES (1771, 'abee244d-f877-4283-8459-62277f95ff86', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:35:34', '2024-04-10 17:35:34', NULL);
INSERT INTO `app_user_login_log` VALUES (1773, 'ec22932e-419d-44d7-a2c6-1d1fa4d60abe', 'load', 's1.quicka2b.com', '', '2024-04-10 17:37:06', '2024-04-10 17:37:06', NULL);
INSERT INTO `app_user_login_log` VALUES (1774, 'ec22932e-419d-44d7-a2c6-1d1fa4d60abe', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 17:37:13', '2024-04-10 17:37:13', NULL);
INSERT INTO `app_user_login_log` VALUES (1775, 'ec22932e-419d-44d7-a2c6-1d1fa4d60abe', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:37:14', '2024-04-10 17:37:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1799, '2e7f74be-cc38-48ba-81a2-54063b6e63a3', 'load', 's1.quicka2b.com', '', '2024-04-10 17:44:02', '2024-04-10 17:44:02', NULL);
INSERT INTO `app_user_login_log` VALUES (1800, '2e7f74be-cc38-48ba-81a2-54063b6e63a3', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 17:44:47', '2024-04-10 17:44:47', NULL);
INSERT INTO `app_user_login_log` VALUES (1801, '2e7f74be-cc38-48ba-81a2-54063b6e63a3', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 17:44:48', '2024-04-10 17:44:48', NULL);
INSERT INTO `app_user_login_log` VALUES (1803, '9c4697d2-aeba-464d-84ac-76235fb1cfe2', 'load', 's1.quicka2b.com', '', '2024-04-10 18:00:52', '2024-04-10 18:00:52', NULL);
INSERT INTO `app_user_login_log` VALUES (1820, '9c4697d2-aeba-464d-84ac-76235fb1cfe2', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 18:34:16', '2024-04-10 18:34:16', NULL);
INSERT INTO `app_user_login_log` VALUES (1821, '3bbd00be-6194-42e1-b75d-61c95a392f3c', 'load', 's1.quicka2b.com', '', '2024-04-10 18:34:40', '2024-04-10 18:34:40', NULL);
INSERT INTO `app_user_login_log` VALUES (1822, '3bbd00be-6194-42e1-b75d-61c95a392f3c', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 18:34:48', '2024-04-10 18:34:48', NULL);
INSERT INTO `app_user_login_log` VALUES (1824, '3bbd00be-6194-42e1-b75d-61c95a392f3c', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-10 18:34:49', '2024-04-10 18:34:49', NULL);
INSERT INTO `app_user_login_log` VALUES (1827, '3bbd00be-6194-42e1-b75d-61c95a392f3c', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-10 19:07:09', '2024-04-10 19:07:09', NULL);
INSERT INTO `app_user_login_log` VALUES (1828, '3bbd00be-6194-42e1-b75d-61c95a392f3c', 'installed', 's1.quicka2b.com', '', '2024-04-10 19:07:15', '2024-04-10 19:07:15', NULL);
INSERT INTO `app_user_login_log` VALUES (1829, '3bbd00be-6194-42e1-b75d-61c95a392f3c', 'start', 's1.quicka2b.com', '', '2024-04-10 19:07:20', '2024-04-10 19:07:20', NULL);
INSERT INTO `app_user_login_log` VALUES (1830, '6d9bdc80-71fd-4c02-8d56-5d3c921cf41e', 'load', 's1.quicka2b.com', '', '2024-04-10 19:10:05', '2024-04-10 19:10:05', NULL);
INSERT INTO `app_user_login_log` VALUES (1831, '6d9bdc80-71fd-4c02-8d56-5d3c921cf41e', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-10 19:10:14', '2024-04-10 19:10:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1832, '6d9bdc80-71fd-4c02-8d56-5d3c921cf41e', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-10 19:10:16', '2024-04-10 19:10:16', NULL);
INSERT INTO `app_user_login_log` VALUES (1833, '6d9bdc80-71fd-4c02-8d56-5d3c921cf41e', 'installed', 's1.quicka2b.com', '', '2024-04-10 19:10:22', '2024-04-10 19:10:22', NULL);
INSERT INTO `app_user_login_log` VALUES (1834, '6d9bdc80-71fd-4c02-8d56-5d3c921cf41e', 'start', 's1.quicka2b.com', '', '2024-04-10 19:10:27', '2024-04-10 19:10:27', NULL);
INSERT INTO `app_user_login_log` VALUES (1843, 'ddbce9a8-8317-444f-b2b4-872ec3eab155', 'load', 's1.quicka2b.com', '', '2024-04-11 10:23:19', '2024-04-11 10:23:19', NULL);
INSERT INTO `app_user_login_log` VALUES (1844, 'ddbce9a8-8317-444f-b2b4-872ec3eab155', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 10:23:21', '2024-04-11 10:23:21', NULL);
INSERT INTO `app_user_login_log` VALUES (1845, '8617cb42-3afc-46dd-a6d0-fc59574812a1', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 10:25:13', '2024-04-11 10:25:13', NULL);
INSERT INTO `app_user_login_log` VALUES (1846, '67f5fc4e-8161-40c9-9ca2-f300564cfcb9', 'load', 's1.quicka2b.com', '', '2024-04-11 10:25:24', '2024-04-11 10:25:24', NULL);
INSERT INTO `app_user_login_log` VALUES (1847, '67f5fc4e-8161-40c9-9ca2-f300564cfcb9', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 10:25:25', '2024-04-11 10:25:25', NULL);
INSERT INTO `app_user_login_log` VALUES (1851, '67f5fc4e-8161-40c9-9ca2-f300564cfcb9', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-11 10:25:54', '2024-04-11 10:25:54', NULL);
INSERT INTO `app_user_login_log` VALUES (1852, '80aa66ab-392f-4f2a-9abe-e3d0274ba01a', 'load', 's1.quicka2b.com', '', '2024-04-11 10:26:50', '2024-04-11 10:26:50', NULL);
INSERT INTO `app_user_login_log` VALUES (1853, '2b400f18-a9a1-4ce6-9311-a0925ac24568', 'load', 's1.quicka2b.com', '', '2024-04-11 10:29:57', '2024-04-11 10:29:57', NULL);
INSERT INTO `app_user_login_log` VALUES (1854, '95b2555e-9bae-4192-b1f6-5236f1cf27c2', 'load', 's1.quicka2b.com', '', '2024-04-11 10:44:23', '2024-04-11 10:44:23', NULL);
INSERT INTO `app_user_login_log` VALUES (1855, '508b414a-86cf-4f3e-989c-5b05798c3a7d', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 10:45:15', '2024-04-11 10:45:15', NULL);
INSERT INTO `app_user_login_log` VALUES (1856, 'aedf9bd7-50bd-40e5-ba37-a5827bfcbf6f', 'load', 's1.quicka2b.com', '', '2024-04-11 10:46:00', '2024-04-11 10:46:00', NULL);
INSERT INTO `app_user_login_log` VALUES (1857, 'aedf9bd7-50bd-40e5-ba37-a5827bfcbf6f', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 10:46:00', '2024-04-11 10:46:00', NULL);
INSERT INTO `app_user_login_log` VALUES (1858, 'aedf9bd7-50bd-40e5-ba37-a5827bfcbf6f', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-11 10:46:17', '2024-04-11 10:46:17', NULL);
INSERT INTO `app_user_login_log` VALUES (1861, 'beca1e61-58ef-4af5-b547-abfc43cef1ef', 'load', 's1.quicka2b.com', '', '2024-04-11 10:54:39', '2024-04-11 10:54:39', NULL);
INSERT INTO `app_user_login_log` VALUES (1862, 'beca1e61-58ef-4af5-b547-abfc43cef1ef', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 10:54:39', '2024-04-11 10:54:39', NULL);
INSERT INTO `app_user_login_log` VALUES (1863, 'beca1e61-58ef-4af5-b547-abfc43cef1ef', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-11 10:55:12', '2024-04-11 10:55:12', NULL);
INSERT INTO `app_user_login_log` VALUES (1869, 'b69c0a1a-9b50-409b-bcbd-ccb954c0dde6', 'load', 's1.quicka2b.com', '', '2024-04-11 11:02:21', '2024-04-11 11:02:21', NULL);
INSERT INTO `app_user_login_log` VALUES (1870, 'b69c0a1a-9b50-409b-bcbd-ccb954c0dde6', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 11:02:21', '2024-04-11 11:02:21', NULL);
INSERT INTO `app_user_login_log` VALUES (1871, 'b69c0a1a-9b50-409b-bcbd-ccb954c0dde6', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-11 11:02:37', '2024-04-11 11:02:37', NULL);
INSERT INTO `app_user_login_log` VALUES (1875, '30792ec5-4338-436b-9dee-3a512c05e369', 'load', 's1.quicka2b.com', '', '2024-04-11 15:47:14', '2024-04-11 15:47:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1876, '30792ec5-4338-436b-9dee-3a512c05e369', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 15:47:14', '2024-04-11 15:47:14', NULL);
INSERT INTO `app_user_login_log` VALUES (1877, '7d75805a-a44c-462b-a1c1-f2bde73c206d', 'load', 's1.quicka2b.com', '', '2024-04-11 15:58:26', '2024-04-11 15:58:26', NULL);
INSERT INTO `app_user_login_log` VALUES (1878, '7d75805a-a44c-462b-a1c1-f2bde73c206d', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 15:58:31', '2024-04-11 15:58:31', NULL);
INSERT INTO `app_user_login_log` VALUES (1883, '6b8b2329-551b-4bfe-b04e-8674ccb32c69', 'load', 's1.quicka2b.com', '', '2024-04-11 16:31:58', '2024-04-11 16:31:58', NULL);
INSERT INTO `app_user_login_log` VALUES (1884, '6b8b2329-551b-4bfe-b04e-8674ccb32c69', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 16:31:58', '2024-04-11 16:31:58', NULL);
INSERT INTO `app_user_login_log` VALUES (1885, 'f040842a-f74b-4feb-8465-817a48a6afbf', 'load', 's1.quicka2b.com', '', '2024-04-11 19:14:16', '2024-04-11 19:14:16', NULL);
INSERT INTO `app_user_login_log` VALUES (1886, 'f040842a-f74b-4feb-8465-817a48a6afbf', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-11 19:14:17', '2024-04-11 19:14:17', NULL);
INSERT INTO `app_user_login_log` VALUES (1892, '09928c93-ab79-4412-b625-533a65fd0b89', 'load', 's1.quicka2b.com', '', '2024-04-12 23:12:17', '2024-04-12 23:12:17', NULL);
INSERT INTO `app_user_login_log` VALUES (1895, 'a74dade2-1679-41ee-aba5-17d12a19d828', 'load', 's1.quicka2b.com', '', '2024-04-13 08:29:17', '2024-04-13 08:29:17', NULL);
INSERT INTO `app_user_login_log` VALUES (1897, '198e1c1c-203d-4e20-b594-cd03f2b2638b', 'load', 's1.quicka2b.com', '', '2024-04-13 14:00:25', '2024-04-13 14:00:25', NULL);
INSERT INTO `app_user_login_log` VALUES (1899, '34ccb806-1240-4535-9fc3-129cf61f93dc', 'load', 's1.quicka2b.com', '', '2024-04-13 14:00:55', '2024-04-13 14:00:55', NULL);
INSERT INTO `app_user_login_log` VALUES (1903, 'eb17c4ad-1709-4a00-9c35-ef4c8fedbb73', 'load', 's1.quicka2b.com', '', '2024-04-13 17:45:28', '2024-04-13 17:45:28', NULL);
INSERT INTO `app_user_login_log` VALUES (1904, 'a8998904-b0aa-488f-9982-b447927cad01', 'load', 's1.quicka2b.com', '', '2024-04-13 17:48:57', '2024-04-13 17:48:57', NULL);
INSERT INTO `app_user_login_log` VALUES (1905, 'a8998904-b0aa-488f-9982-b447927cad01', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-13 17:48:57', '2024-04-13 17:48:57', NULL);
INSERT INTO `app_user_login_log` VALUES (1908, 'a8998904-b0aa-488f-9982-b447927cad01', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-13 17:58:31', '2024-04-13 17:58:31', NULL);
INSERT INTO `app_user_login_log` VALUES (1910, '587b8d69-af95-4586-8474-8e8621f86304', 'load', 's1.quicka2b.com', '', '2024-04-13 22:24:32', '2024-04-13 22:24:32', NULL);
INSERT INTO `app_user_login_log` VALUES (1911, '1c29c711-71a2-421c-96fa-b91d8a1a51ec', 'load', 's1.quicka2b.com', '', '2024-04-14 17:12:59', '2024-04-14 17:12:59', NULL);
INSERT INTO `app_user_login_log` VALUES (1912, '1c29c711-71a2-421c-96fa-b91d8a1a51ec', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-14 17:12:59', '2024-04-14 17:12:59', NULL);
INSERT INTO `app_user_login_log` VALUES (1913, '15942c09-32dd-41dd-9301-14900bde04c7', 'load', 's1.quicka2b.com', '', '2024-04-15 16:10:07', '2024-04-15 16:10:07', NULL);
INSERT INTO `app_user_login_log` VALUES (1914, '15942c09-32dd-41dd-9301-14900bde04c7', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 16:10:07', '2024-04-15 16:10:07', NULL);
INSERT INTO `app_user_login_log` VALUES (1917, 'aeb671f8-858e-4cd7-be0d-ad6d4fd90a6c', 'load', 's1.quicka2b.com', '', '2024-04-15 16:24:19', '2024-04-15 16:24:19', NULL);
INSERT INTO `app_user_login_log` VALUES (1918, 'aeb671f8-858e-4cd7-be0d-ad6d4fd90a6c', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 16:24:20', '2024-04-15 16:24:20', NULL);
INSERT INTO `app_user_login_log` VALUES (1919, 'aeb671f8-858e-4cd7-be0d-ad6d4fd90a6c', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-15 16:24:34', '2024-04-15 16:24:34', NULL);
INSERT INTO `app_user_login_log` VALUES (1920, 'c8fdaf4a-f2b8-47a9-ad0d-fcdef26f4a32', 'start', 's1.quicka2b.com', '', '2024-04-15 16:24:38', '2024-04-15 16:24:38', NULL);
INSERT INTO `app_user_login_log` VALUES (1921, 'aeb671f8-858e-4cd7-be0d-ad6d4fd90a6c', 'start', 's1.quicka2b.com', '', '2024-04-15 16:26:08', '2024-04-15 16:26:08', NULL);
INSERT INTO `app_user_login_log` VALUES (1923, '71300ab3-c1d8-42ed-9be7-640840576324', 'load', 's1.quicka2b.com', '', '2024-04-15 16:31:30', '2024-04-15 16:31:30', NULL);
INSERT INTO `app_user_login_log` VALUES (1924, '7c46eadc-45b2-49d4-a276-4ecccaf43f01', 'load', 's1.quicka2b.com', '', '2024-04-15 16:32:21', '2024-04-15 16:32:21', NULL);
INSERT INTO `app_user_login_log` VALUES (1925, '7c46eadc-45b2-49d4-a276-4ecccaf43f01', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 16:32:28', '2024-04-15 16:32:28', NULL);
INSERT INTO `app_user_login_log` VALUES (1926, '7c46eadc-45b2-49d4-a276-4ecccaf43f01', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-15 16:32:29', '2024-04-15 16:32:29', NULL);
INSERT INTO `app_user_login_log` VALUES (1927, '7c46eadc-45b2-49d4-a276-4ecccaf43f01', 'installed', 's1.quicka2b.com', '', '2024-04-15 16:32:44', '2024-04-15 16:32:44', NULL);
INSERT INTO `app_user_login_log` VALUES (1937, 'aeb671f8-858e-4cd7-be0d-ad6d4fd90a6c', 'open', 's1.quicka2b.com', '', '2024-04-15 16:34:00', '2024-04-15 16:34:00', NULL);
INSERT INTO `app_user_login_log` VALUES (1939, 'ba7a3e48-7b4e-493a-9980-1bec1e4d4c6c', 'load', 's1.quicka2b.com', '', '2024-04-15 16:34:27', '2024-04-15 16:34:27', NULL);
INSERT INTO `app_user_login_log` VALUES (1940, 'ba7a3e48-7b4e-493a-9980-1bec1e4d4c6c', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 16:34:35', '2024-04-15 16:34:35', NULL);
INSERT INTO `app_user_login_log` VALUES (1941, 'ba7a3e48-7b4e-493a-9980-1bec1e4d4c6c', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-15 16:34:35', '2024-04-15 16:34:35', NULL);
INSERT INTO `app_user_login_log` VALUES (1942, 'ba7a3e48-7b4e-493a-9980-1bec1e4d4c6c', 'installed', 's1.quicka2b.com', '', '2024-04-15 16:34:43', '2024-04-15 16:34:43', NULL);
INSERT INTO `app_user_login_log` VALUES (1958, '113690d4-c42c-4c0c-a8f5-919bbddf4bba', 'load', 's1.quicka2b.com', '', '2024-04-15 19:39:04', '2024-04-15 19:39:04', NULL);
INSERT INTO `app_user_login_log` VALUES (1959, '113690d4-c42c-4c0c-a8f5-919bbddf4bba', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 19:39:05', '2024-04-15 19:39:05', NULL);
INSERT INTO `app_user_login_log` VALUES (1960, '113690d4-c42c-4c0c-a8f5-919bbddf4bba', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-15 19:39:57', '2024-04-15 19:39:57', NULL);
INSERT INTO `app_user_login_log` VALUES (1961, 'c76caa69-5564-4bdc-b8b6-48ca9775ac8a', 'load', 's1.quicka2b.com', '', '2024-04-15 19:46:42', '2024-04-15 19:46:42', NULL);
INSERT INTO `app_user_login_log` VALUES (1962, 'c76caa69-5564-4bdc-b8b6-48ca9775ac8a', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 19:46:51', '2024-04-15 19:46:51', NULL);
INSERT INTO `app_user_login_log` VALUES (1963, 'c76caa69-5564-4bdc-b8b6-48ca9775ac8a', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-15 19:46:52', '2024-04-15 19:46:52', NULL);
INSERT INTO `app_user_login_log` VALUES (1964, 'c76caa69-5564-4bdc-b8b6-48ca9775ac8a', 'installed', 's1.quicka2b.com', '', '2024-04-15 19:46:58', '2024-04-15 19:46:58', NULL);
INSERT INTO `app_user_login_log` VALUES (1965, 'c76caa69-5564-4bdc-b8b6-48ca9775ac8a', 'start', 's1.quicka2b.com', '', '2024-04-15 19:47:01', '2024-04-15 19:47:01', NULL);
INSERT INTO `app_user_login_log` VALUES (1967, '113690d4-c42c-4c0c-a8f5-919bbddf4bba', 'start', 's1.quicka2b.com', '', '2024-04-15 19:52:18', '2024-04-15 19:52:18', NULL);
INSERT INTO `app_user_login_log` VALUES (1970, '15942c09-32dd-41dd-9301-14900bde04c7', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-15 20:04:13', '2024-04-15 20:04:13', NULL);
INSERT INTO `app_user_login_log` VALUES (1971, '7af4b77f-7074-4d12-af3c-11c47bdf7c8e', 'load', 's1.quicka2b.com', '', '2024-04-15 21:35:53', '2024-04-15 21:35:53', NULL);
INSERT INTO `app_user_login_log` VALUES (1972, '7af4b77f-7074-4d12-af3c-11c47bdf7c8e', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-15 21:35:54', '2024-04-15 21:35:54', NULL);
INSERT INTO `app_user_login_log` VALUES (1973, '6c41900c-e505-4c28-892c-7934597a5086', 'load', 's1.quicka2b.com', '', '2024-04-16 15:04:30', '2024-04-16 15:04:30', NULL);
INSERT INTO `app_user_login_log` VALUES (1974, '6c41900c-e505-4c28-892c-7934597a5086', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-16 15:04:31', '2024-04-16 15:04:31', NULL);
INSERT INTO `app_user_login_log` VALUES (1976, '6c41900c-e505-4c28-892c-7934597a5086', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-16 15:04:47', '2024-04-16 15:04:47', NULL);
INSERT INTO `app_user_login_log` VALUES (1977, '0d2c9374-3db7-4b48-ab60-336d2a66dddc', 'load', 's1.quicka2b.com', '', '2024-04-16 17:28:33', '2024-04-16 17:28:33', NULL);
INSERT INTO `app_user_login_log` VALUES (1978, '0d2c9374-3db7-4b48-ab60-336d2a66dddc', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-16 17:28:33', '2024-04-16 17:28:33', NULL);
INSERT INTO `app_user_login_log` VALUES (1983, '3fb57507-6688-41b6-bc17-540af7476d85', 'load', 's1.quicka2b.com', '', '2024-04-16 17:29:46', '2024-04-16 17:29:46', NULL);
INSERT INTO `app_user_login_log` VALUES (1984, '3fb57507-6688-41b6-bc17-540af7476d85', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-16 17:29:46', '2024-04-16 17:29:46', NULL);
INSERT INTO `app_user_login_log` VALUES (1998, '0d2c9374-3db7-4b48-ab60-336d2a66dddc', 'choice_dismissed', 's1.quicka2b.com', '', '2024-04-16 17:37:58', '2024-04-16 17:37:58', NULL);
INSERT INTO `app_user_login_log` VALUES (1999, '0d2c9374-3db7-4b48-ab60-336d2a66dddc', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-16 17:57:27', '2024-04-16 17:57:27', NULL);
INSERT INTO `app_user_login_log` VALUES (2001, 'fa45447f-e8a1-48e3-b6d8-2c48c63342c5', 'load', 's1.quicka2b.com', '', '2024-04-16 18:33:47', '2024-04-16 18:33:47', NULL);
INSERT INTO `app_user_login_log` VALUES (2002, 'fa45447f-e8a1-48e3-b6d8-2c48c63342c5', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-16 18:33:47', '2024-04-16 18:33:47', NULL);
INSERT INTO `app_user_login_log` VALUES (2007, '42c61bd8-32be-4924-bfe1-c1c35453224c', 'load', 's1.quicka2b.com', '', '2024-04-18 18:27:38', '2024-04-18 18:27:38', NULL);
INSERT INTO `app_user_login_log` VALUES (2008, '42c61bd8-32be-4924-bfe1-c1c35453224c', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-18 18:27:38', '2024-04-18 18:27:38', NULL);
INSERT INTO `app_user_login_log` VALUES (2009, '42c61bd8-32be-4924-bfe1-c1c35453224c', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-18 18:30:22', '2024-04-18 18:30:22', NULL);
INSERT INTO `app_user_login_log` VALUES (2010, 'a8841359-1c7b-4e79-b543-800d8eaf39ef', 'load', 's1.quicka2b.com', '', '2024-04-18 18:31:15', '2024-04-18 18:31:15', NULL);
INSERT INTO `app_user_login_log` VALUES (2012, 'a8841359-1c7b-4e79-b543-800d8eaf39ef', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-18 18:31:17', '2024-04-18 18:31:17', NULL);
INSERT INTO `app_user_login_log` VALUES (2013, 'bb7ae905-7618-4fda-bca1-13b366e6f889', 'load', 's1.quicka2b.com', '', '2024-04-18 18:31:52', '2024-04-18 18:31:52', NULL);
INSERT INTO `app_user_login_log` VALUES (2014, 'bb7ae905-7618-4fda-bca1-13b366e6f889', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-18 18:31:54', '2024-04-18 18:31:54', NULL);
INSERT INTO `app_user_login_log` VALUES (2015, 'bb7ae905-7618-4fda-bca1-13b366e6f889', 'choice_accepted', 's1.quicka2b.com', '', '2024-04-18 18:32:00', '2024-04-18 18:32:00', NULL);
INSERT INTO `app_user_login_log` VALUES (2016, 'f332c2dc-244f-4204-96ff-da6a7cdeac45', 'start', 's1.quicka2b.com', '', '2024-04-18 18:33:03', '2024-04-18 18:33:03', NULL);
INSERT INTO `app_user_login_log` VALUES (2018, 'bb7ae905-7618-4fda-bca1-13b366e6f889', 'start', 's1.quicka2b.com', '', '2024-04-18 18:33:26', '2024-04-18 18:33:26', NULL);
INSERT INTO `app_user_login_log` VALUES (2019, '3e0e86cc-6dfd-492b-926d-60b0b3baa3ac', 'start', 's1.quicka2b.com', '', '2024-04-18 23:29:08', '2024-04-18 23:29:08', NULL);
INSERT INTO `app_user_login_log` VALUES (2022, '3e236583-3178-400a-8533-5a9f1fac84ad', 'load', 's1.quicka2b.com', '', '2024-04-23 17:42:29', '2024-04-23 17:42:29', NULL);
INSERT INTO `app_user_login_log` VALUES (2023, '3e236583-3178-400a-8533-5a9f1fac84ad', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-23 17:42:30', '2024-04-23 17:42:30', NULL);
INSERT INTO `app_user_login_log` VALUES (2024, 'bd443468-8c50-445d-9441-1563442ee2f9', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-23 17:43:21', '2024-04-23 17:43:21', NULL);
INSERT INTO `app_user_login_log` VALUES (2025, '603b6466-dd29-4ee6-a060-e5d934ee415b', 'load', 's1.quicka2b.com', '', '2024-04-23 17:43:41', '2024-04-23 17:43:41', NULL);
INSERT INTO `app_user_login_log` VALUES (2026, '603b6466-dd29-4ee6-a060-e5d934ee415b', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-04-23 17:43:41', '2024-04-23 17:43:41', NULL);
INSERT INTO `app_user_login_log` VALUES (2034, '0ac6c9ba-b82d-4cfb-89ca-8438438590a3', 'load', 's1.quicka2b.com', '', '2024-05-06 18:06:46', '2024-05-06 18:06:46', NULL);
INSERT INTO `app_user_login_log` VALUES (2035, '0ac6c9ba-b82d-4cfb-89ca-8438438590a3', 'beforeinstallprompt', 's1.quicka2b.com', '', '2024-05-06 18:06:46', '2024-05-06 18:06:46', NULL);
INSERT INTO `app_user_login_log` VALUES (2036, '0ac6c9ba-b82d-4cfb-89ca-8438438590a3', 'choice_dismissed', 's1.quicka2b.com', '', '2024-05-06 18:07:06', '2024-05-06 18:07:06', NULL);
COMMIT;

-- ----------------------------
-- Table structure for app_user_report_day
-- ----------------------------
DROP TABLE IF EXISTS `app_user_report_day`;
CREATE TABLE `app_user_report_day` (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '自增id',
  `report_date` date NOT NULL,
  `app_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `app_custom_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cost_money` decimal(10,3) NOT NULL,
  `install_users` bigint NOT NULL COMMENT '安装用户数',
  `open_index_users` bigint NOT NULL COMMENT '打开推广页用户数',
  `open_app_users` bigint NOT NULL COMMENT '打开应用用户数',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `date_app_url` (`report_date`,`app_id`,`app_custom_url`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of app_user_report_day
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for domain
-- ----------------------------
DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of domain
-- ----------------------------
BEGIN;
INSERT INTO `domain` VALUES (4, 'quicka2b.com', '2024-04-10 12:16:43', '2024-04-10 12:16:47', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Uuid md5 16位',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱，账户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `money` decimal(15,3) NOT NULL COMMENT '余额',
  `rate` decimal(4,3) NOT NULL DEFAULT '0.040',
  `utype` tinyint(1) NOT NULL COMMENT '0:预付费，1:后付费',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('13f2a6744a01201c', 'oxvoxv@protonmail.com', '$2a$10$Kc7SGkkIcqnD8/Sa060m0e7TAR.DWbh8DDMRCaMzmM5SjjJ/3c9Hi', 1.000, 0.080, 0, '2024-04-15 16:18:10', '2024-04-15 16:18:10', NULL);
INSERT INTO `user` VALUES ('67a0d229cf34acea', 'xoraci6196@buzblox.com', '$2a$10$iZX1sIfsCHXYSu0u/s.LQ.P9y23HgHBGFzxSD8s/h/SOM7Mf4oDZa', 1.000, 0.080, 0, '2024-04-23 22:40:13', '2024-04-23 22:40:13', NULL);
INSERT INTO `user` VALUES ('6a34e0b15502e792', 'spring4plum@gmail.com', '$2a$10$oT96ftzRG4EmzDe0.SP3DuP.WrkhhP9UzfsuBhkq.8vrzUb3HYK6y', 1.000, 0.080, 0, '2024-04-10 12:50:56', '2024-04-10 12:50:56', NULL);
INSERT INTO `user` VALUES ('ebf27a7054790ee1', 'iuiuiu@snapmail.cc', '$2a$10$2Q1wJrtzM68PdsrSI3ClPuHNRHNpohHKSSwXQlj4kBQF0xWTjW.uy', 1.000, 0.080, 0, '2024-04-11 15:34:17', '2024-04-11 15:34:17', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_recharge_log
-- ----------------------------
DROP TABLE IF EXISTS `user_recharge_log`;
CREATE TABLE `user_recharge_log` (
  `id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Uuid md5 16位',
  `user_id` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `recharge_money` decimal(14,3) NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='充值';

-- ----------------------------
-- Records of user_recharge_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
