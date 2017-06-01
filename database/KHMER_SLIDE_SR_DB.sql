/*
Navicat PGSQL Data Transfer

Source Server         : localhost
Source Server Version : 90603
Source Host           : localhost:5432
Source Database       : KHMER_SLIDE_SR_DB
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90603
File Encoding         : 65001

Date: 2017-06-01 16:10:06
*/


-- ----------------------------
-- Sequence structure for ksl_category_cat_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_category_cat_id_seq";
CREATE SEQUENCE "public"."ksl_category_cat_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 64
 CACHE 1;
SELECT setval('"public"."ksl_category_cat_id_seq"', 64, true);

-- ----------------------------
-- Sequence structure for ksl_comment_cmt_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_comment_cmt_id_seq";
CREATE SEQUENCE "public"."ksl_comment_cmt_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 118
 CACHE 1;
SELECT setval('"public"."ksl_comment_cmt_id_seq"', 118, true);

-- ----------------------------
-- Sequence structure for ksl_document_doc_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_document_doc_id_seq";
CREATE SEQUENCE "public"."ksl_document_doc_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 276
 CACHE 1;
SELECT setval('"public"."ksl_document_doc_id_seq"', 276, true);

-- ----------------------------
-- Sequence structure for ksl_save_doc_sd_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_save_doc_sd_id_seq";
CREATE SEQUENCE "public"."ksl_save_doc_sd_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 12
 CACHE 1;
SELECT setval('"public"."ksl_save_doc_sd_id_seq"', 12, true);

-- ----------------------------
-- Sequence structure for ksl_save_list_sl_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_save_list_sl_id_seq";
CREATE SEQUENCE "public"."ksl_save_list_sl_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 20
 CACHE 1;
SELECT setval('"public"."ksl_save_list_sl_id_seq"', 20, true);

-- ----------------------------
-- Sequence structure for ksl_user_type_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_user_type_role_id_seq";
CREATE SEQUENCE "public"."ksl_user_type_role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 2
 CACHE 1;
SELECT setval('"public"."ksl_user_type_role_id_seq"', 2, true);

-- ----------------------------
-- Sequence structure for ksl_user_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_user_user_id_seq";
CREATE SEQUENCE "public"."ksl_user_user_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 42
 CACHE 1;
SELECT setval('"public"."ksl_user_user_id_seq"', 42, true);

-- ----------------------------
-- Sequence structure for ksl_view_history_vh_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ksl_view_history_vh_id_seq";
CREATE SEQUENCE "public"."ksl_view_history_vh_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 248
 CACHE 1;
SELECT setval('"public"."ksl_view_history_vh_id_seq"', 248, true);

-- ----------------------------
-- Table structure for ksl_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_category";
CREATE TABLE "public"."ksl_category" (
"cat_id" int4 DEFAULT nextval('ksl_category_cat_id_seq'::regclass) NOT NULL,
"parent_id" int4,
"cat_name" text COLLATE "default",
"created_date" text COLLATE "default",
"status" int4,
"user_id" int4,
"description" varchar(255) COLLATE "default",
"icon" varchar(255) COLLATE "default",
"folder_google_drive" varchar COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_category
-- ----------------------------
INSERT INTO "public"."ksl_category" VALUES ('1', '0', 'Computer Science', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Computer Science', 'fa fa-desktop', '0BxYRX7DKrlC4N3VyMzY1R3ZGN2M');
INSERT INTO "public"."ksl_category" VALUES ('2', '0', 'Other', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Other Category', 'fa fa-book', '0BxYRX7DKrlC4OGR4NE5udXRfajA');
INSERT INTO "public"."ksl_category" VALUES ('3', '1', 'ភាសា កុំព្យូទ័', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Computer programming language', 'fa fa-desktop', '0BxYRX7DKrlC4aEpPNzZ6NGFOMmM');
INSERT INTO "public"."ksl_category" VALUES ('4', '1', 'ភាសា​ទូរស័ព្ទ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Mobile langauge development', 'fa fa-desktop', '0BxYRX7DKrlC4Yk1lY0ViT0NITnM');
INSERT INTO "public"."ksl_category" VALUES ('5', '1', 'ការរចនាដោយប្រើកុំព្យូទ័រ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Computer Design', 'fa fa-desktop', '0BxYRX7DKrlC4MTFCQUMyUUhZMW8');
INSERT INTO "public"."ksl_category" VALUES ('6', '1', 'ទូរគមនាគមន៍', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Telecommunication', 'fa fa-desktop', '0BxYRX7DKrlC4elNMUG5JNDRpNEU');
INSERT INTO "public"."ksl_category" VALUES ('7', '1', 'គ្រប់គ្រងបណ្តាញ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Networking', 'fa fa-desktop', '0BxYRX7DKrlC4Y2ZUUWw3dXVjRWs');
INSERT INTO "public"."ksl_category" VALUES ('8', '0', 'កសិកម្ម', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Agriculture', 'fa fa-recycle', '0BxYRX7DKrlC4Y2MycEhLNmhPaXc');
INSERT INTO "public"."ksl_category" VALUES ('9', '0', 'សុខភាព និង ចំនីអាហារ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Health and Food', 'fa fa-heartbeat', '0BxYRX7DKrlC4Vmw2ZWYwY2dhQU0');
INSERT INTO "public"."ksl_category" VALUES ('10', '8', 'ការ​ដាំ​ដុះ​', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Planting', 'fa fa-recycle', '0BxYRX7DKrlC4a0hmM2UtemdObUU');
INSERT INTO "public"."ksl_category" VALUES ('11', '8', 'បរិស្ថាន', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Environment', 'fa fa-recycle', '0BxYRX7DKrlC4UWppMGJXbG5QMFE');
INSERT INTO "public"."ksl_category" VALUES ('12', '8', 'ការចិញ្ចឹមសត្វ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Raising animal', 'fa fa-recycle', '0BxYRX7DKrlC4ZHJJUmQtU24yWUk');
INSERT INTO "public"."ksl_category" VALUES ('13', '0', 'ជំនាញឯកទេស', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Professional Skill', 'fa fa-university', '0BxYRX7DKrlC4dW1FMnpTM2gzVWc');
INSERT INTO "public"."ksl_category" VALUES ('14', '13', 'ជំនួញ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Business', 'fa fa-bar-chart', '0BxYRX7DKrlC4OWk2WW5hdlRkelE');
INSERT INTO "public"."ksl_category" VALUES ('15', '13', 'ការគ្រប់គ្រង', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Management', 'fa fa-university', '0BxYRX7DKrlC4dlVOTVNubklmYjA');
INSERT INTO "public"."ksl_category" VALUES ('16', '0', 'High School Education', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of ការអប់រំកម្រឺតវិទ្យាល័យ', 'fa fa-university', '0BxYRX7DKrlC4UGtabE1WTl94Y1U');
INSERT INTO "public"."ksl_category" VALUES ('17', '13', 'ហិរញ្ញវត្ថុ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Finance', 'fa fa-credit-card-alt', '0BxYRX7DKrlC4eVR5WjZsVEhiR1E');
INSERT INTO "public"."ksl_category" VALUES ('18', '9', 'សុខភាព', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Health', 'fa fa-heartbeat', '0BxYRX7DKrlC4ZjA0NzZkdWxSWmM');
INSERT INTO "public"."ksl_category" VALUES ('19', '13', 'សំណង់ ​និង វិស្វកម្ម', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Engineering', 'fa fa-university', '0BxYRX7DKrlC4ZGM2eERQb3pjTnM');
INSERT INTO "public"."ksl_category" VALUES ('20', '13', 'សេដ្ឋកិច្ច', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Economic', 'fa fa-bar-chart', '0BxYRX7DKrlC4eGthWTZlMGxYQXM');
INSERT INTO "public"."ksl_category" VALUES ('21', '9', 'ចំនីអាហារ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Food', 'fa fa-heartbeat', '0BxYRX7DKrlC4NV9qUDBFQ1dlOUU');
INSERT INTO "public"."ksl_category" VALUES ('22', '13', 'ឱសថសាស្រ្ត', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Medical', 'fa fa-heartbeat', '0BxYRX7DKrlC4V082Y0w4U2lkTVk');
INSERT INTO "public"."ksl_category" VALUES ('23', '16', 'គណិតវិទ្យា', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Mathematic', 'fa fa-university', '0BxYRX7DKrlC4Tml4aG5odnBWNVk');
INSERT INTO "public"."ksl_category" VALUES ('24', '13', 'គណនេយ្យ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Accounting', 'fa fa-money', '0BxYRX7DKrlC4N1k3UHVfMFpJUGM');
INSERT INTO "public"."ksl_category" VALUES ('25', '16', 'ប្រវិត្តសាស្រ្ត', '19-Aug-2016', '1', '1', 'HistorThis Category Will Give You The Best Material of y', 'fa fa-university', '0BxYRX7DKrlC4dnlmYmdaekZicG8');
INSERT INTO "public"."ksl_category" VALUES ('26', '13', 'ទេសចរណ៏៍', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Tourism', 'fa fa-car', '0BxYRX7DKrlC4aGw3emRPZFdObk0');
INSERT INTO "public"."ksl_category" VALUES ('27', '16', 'អក្សរសាស្រ្ត', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Literature', 'fa fa-university', '0BxYRX7DKrlC4SzJWbm1XdWE5b0k');
INSERT INTO "public"."ksl_category" VALUES ('28', '13', 'អគ្គីសនី', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Electricity', 'fa fa-university', '0BxYRX7DKrlC4RWtYMWFxR2VEbXM');
INSERT INTO "public"."ksl_category" VALUES ('29', '16', 'ជីវវិទ្យា', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Biology', 'fa fa-university', '0BxYRX7DKrlC4VmdIV01qVnBXbkE');
INSERT INTO "public"."ksl_category" VALUES ('30', '16', 'ឯកសារប្រលង', '19-Aug-2016', '1', '1', 'ExaminatioThis Category Will Give You The Best Material of ', 'fa fa-university', '0BxYRX7DKrlC4WERJdjB4ZjR0dms');
INSERT INTO "public"."ksl_category" VALUES ('31', '0', 'វប្បធម៌​ និង សិល្បៈ', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Culture and Art', 'fa fa-book', '0BxYRX7DKrlC4dXFxNHUwQlg1Zlk');
INSERT INTO "public"."ksl_category" VALUES ('32', '16', 'គីមីវិទ្យា', '19-Aug-2016', '1', '1', 'Chemistry', 'fa fa-university', '0BxYRX7DKrlC4aDBJUjBfelZNRlU');
INSERT INTO "public"."ksl_category" VALUES ('33', '31', 'ជិវប្រវត្តិ', '19-Aug-2016', '1', '1', 'Biography', 'fa fa-book', '0BxYRX7DKrlC4NF9MZ3NsR2pjTWM');
INSERT INTO "public"."ksl_category" VALUES ('34', '16', 'ភូមិវិទ្យា', '19-Aug-2016', '1', '1', 'Geography', 'fa fa-university', '0BxYRX7DKrlC4X0JpcWJwZXNBUk0');
INSERT INTO "public"."ksl_category" VALUES ('35', '31', 'កំណាព្យ និង ចំរៀង', '19-Aug-2016', '1', '1', 'Poems and Songs', 'fa fa-book', '0BxYRX7DKrlC4dVVTSWhiZHRLMmc');
INSERT INTO "public"."ksl_category" VALUES ('36', '31', 'វចនានុក្រម', '19-Aug-2016', '1', '1', 'Dictionary', 'fa fa-book', '0BxYRX7DKrlC4Nmcxam5QWXRjMEk');
INSERT INTO "public"."ksl_category" VALUES ('37', '16', 'រូបវិទ្យា', '19-Aug-2016', '1', '1', 'Physical', 'fa fa-university', '0BxYRX7DKrlC4MjNDVzd6MHdZdWs');
INSERT INTO "public"."ksl_category" VALUES ('38', '31', 'អក្សរសាស្រ្ត​ ខ្មែរ', '19-Aug-2016', '1', '1', 'Khmer literature', 'fa fa-book', '0BxYRX7DKrlC4N3BnYmpWTURwUEE');
INSERT INTO "public"."ksl_category" VALUES ('39', '31', 'សិល្បៈ', '19-Aug-2016', '1', '1', 'Art', 'fa fa-book', '0BxYRX7DKrlC4TjNyWHZscDFEbE0');
INSERT INTO "public"."ksl_category" VALUES ('40', '31', 'ល្បែងប្រជារិយ៍', '19-Aug-2016', '1', '1', 'Khmer Games', 'fa fa-book', '0BxYRX7DKrlC4amM5Mkd6SEFqNDA');
INSERT INTO "public"."ksl_category" VALUES ('41', '31', 'ប្រលោមលោក', '19-Aug-2016', '1', '1', 'Novel', 'fa fa-book', '0BxYRX7DKrlC4d2UyRWQ3V0hnM28');
INSERT INTO "public"."ksl_category" VALUES ('42', '31', 'សាសនា', '19-Aug-2016', '1', '1', 'Religion', 'fa fa-book', '0BxYRX7DKrlC4M0FLdVhUQWZVcHM');
INSERT INTO "public"."ksl_category" VALUES ('43', '0', 'ភាសាទំនាក់ទំនង', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of  Language', 'fa fa-language', '0BxYRX7DKrlC4YlBKcTRkZ1YzaWM');
INSERT INTO "public"."ksl_category" VALUES ('44', '43', 'ភាសាអង់គ្លេស​', '19-Aug-2016', '1', '1', 'English', 'fa fa-language', '0BxYRX7DKrlC4VkhRMGJmRWcxOEU');
INSERT INTO "public"."ksl_category" VALUES ('45', '43', 'ភាសា​កូរ៉េ​', '19-Aug-2016', '1', '1', 'Korean', 'fa fa-language', '0BxYRX7DKrlC4R2w0OVhqeGpDZzg');
INSERT INTO "public"."ksl_category" VALUES ('46', '43', 'ភាសា​ចិន', '19-Aug-2016', '1', '1', 'Chinese', 'fa fa-language', '0BxYRX7DKrlC4WmhVS1BGUFV2X0E');
INSERT INTO "public"."ksl_category" VALUES ('47', '0', 'កំសាន្ត', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of Entertainment', 'fa fa-futbol-o', '0BxYRX7DKrlC4N1EzcUpmNjJiNmc');
INSERT INTO "public"."ksl_category" VALUES ('48', '47', 'កីឡា', '19-Aug-2016', '1', '1', 'Sport', 'fa fa-futbol-o', '0BxYRX7DKrlC4RTBPSHNHVkN0TDg');
INSERT INTO "public"."ksl_category" VALUES ('49', '47', 'លំហែអារម្មណ៏', '19-Aug-2016', '1', '1', 'Recreational', 'fa fa-futbol-o', '0BxYRX7DKrlC4bEExdF9pWVVTNlE');
INSERT INTO "public"."ksl_category" VALUES ('50', '47', 'ដំណើរ​កំសាន្ដ', '19-Aug-2016', '1', '1', 'Travelling', 'fa fa-camera', '0BxYRX7DKrlC4anFQaHhfTXZOekk');
INSERT INTO "public"."ksl_category" VALUES ('51', '0', 'សង្គម', '19-Aug-2016', '1', '1', 'This Category Will Give You The Best Material of  Social', 'fa fa-users', '0BxYRX7DKrlC4dEtpbnl4ckpjNGs');
INSERT INTO "public"."ksl_category" VALUES ('52', '51', 'ទស្សនៈវិទ្យា', '19-Aug-2016', '1', '1', 'Phylosophy', 'fa fa-users', '0BxYRX7DKrlC4NUIycV9WVlRRZ3c');
INSERT INTO "public"."ksl_category" VALUES ('53', '51', 'ច្បាប់', '19-Aug-2016', '1', '1', 'Law', 'fa fa-users', '0BxYRX7DKrlC4UzdnX0F1RnNfcWc');
INSERT INTO "public"."ksl_category" VALUES ('54', '51', 'ពត័មាន', '19-Aug-2016', '1', '1', 'News', 'fa fa-users', '0BxYRX7DKrlC4MXdMRENVN0RLWlk');
INSERT INTO "public"."ksl_category" VALUES ('55', '51', 'សង្គមធម៌', '19-Aug-2016', '1', '1', 'Social Morality', 'fa fa-users', '0BxYRX7DKrlC4SkM4Sm4za3gwV2c');
INSERT INTO "public"."ksl_category" VALUES ('56', '51', 'ចំណេះដឹងទូទៅ', '19-Aug-2016', '1', '1', 'Genaral knowlagde', 'fa fa-users', '0BxYRX7DKrlC4Ri1saVZoQmlaWkk');
INSERT INTO "public"."ksl_category" VALUES ('57', '51', 'នយោបាយ', '19-Aug-2016', '1', '1', 'Political', 'fa fa-users', '0BxYRX7DKrlC4ejE0a2dDUUpWM1U');
INSERT INTO "public"."ksl_category" VALUES ('58', '51', 'សិទ្ធិមនុស្ស', '19-Aug-2016', '1', '1', 'Human right', 'fa fa-users', '0BxYRX7DKrlC4dEY0SDZXbFpGemM');
INSERT INTO "public"."ksl_category" VALUES ('59', '51', 'រដ្ឋបាល', '19-Aug-2016', '1', '1', 'Administration', 'fa fa-users', '0BxYRX7DKrlC4Z0VYMkoyQ21SYXc');
INSERT INTO "public"."ksl_category" VALUES ('60', '51', 'សេចក្តីប្រកាស', '19-Aug-2016', '1', '1', 'Announcement', 'fa fa-users', '0BxYRX7DKrlC4WWk1NkFKRzBkdW8');
INSERT INTO "public"."ksl_category" VALUES ('61', '51', 'សុន្ទរកថា', '19-Aug-2016', '1', '1', 'Speeches', 'fa fa-users', '0BxYRX7DKrlC4Tlo4VXdiLVYzc0E');
INSERT INTO "public"."ksl_category" VALUES ('62', '1', 'ការរចនាគេហទំព័រ', '19-Aug-2016', '1', '1', 'Web Development', 'fa fa-desktop', '0BxYRX7DKrlC4bktJX1ZfTEMzUUE');
INSERT INTO "public"."ksl_category" VALUES ('63', '1', 'ភាសា កុំព្យូទ័រ', '19-Aug-2016', '1', '1', 'Computer Programming', 'fa fa-desktop', '0BxYRX7DKrlC4QWFRSVlyQW5jY0k');

-- ----------------------------
-- Table structure for ksl_comment
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_comment";
CREATE TABLE "public"."ksl_comment" (
"cmt_id" int4 DEFAULT nextval('ksl_comment_cmt_id_seq'::regclass) NOT NULL,
"cmt_text" text COLLATE "default",
"cmt_date" text COLLATE "default",
"status" int4,
"user_id" int4,
"doc_id" int4,
"description" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_comment
-- ----------------------------
INSERT INTO "public"."ksl_comment" VALUES ('115', 'Thank for sharing this document', '01-Sep-2016', '1', '1', '263', 'Thank for sharing this document');
INSERT INTO "public"."ksl_comment" VALUES ('116', 'ok', '01-Sep-2016', '1', '2', '263', 'ok');
INSERT INTO "public"."ksl_comment" VALUES ('117', 'thanks', '01-Sep-2016', '1', '1', '3', 'thanks');
INSERT INTO "public"."ksl_comment" VALUES ('118', 'jjj', '01-Sep-2016', '1', '1', '266', 'jjj');

-- ----------------------------
-- Table structure for ksl_document
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_document";
CREATE TABLE "public"."ksl_document" (
"doc_id" int4 DEFAULT nextval('ksl_document_doc_id_seq'::regclass) NOT NULL,
"doc_title" text COLLATE "default",
"uploaded_date" text COLLATE "default",
"url" text COLLATE "default",
"liked" int4,
"shared" int4,
"viewed" int4,
"description" text COLLATE "default",
"status" int4,
"doc_type_id" int4,
"user_id" int4,
"cat_id" int4,
"thumbnail" text COLLATE "default",
"source" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_document
-- ----------------------------
INSERT INTO "public"."ksl_document" VALUES ('1', 'ត្រៀមសិស្សពូកែទី៩ ភាគ១', '19-Aug-2016', '0BxYRX7DKrlC4bXJtODd5dlZLdmc', '54', null, '125', 'Examination preparation', '3', '2', '1', '30', '/resources/static/img/thumbnails/75c97ffa-073e-46b3-88c4-f58420a0585a-thumbnail.jpg', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('2', '70 លំហាត់សំរាប់ត្រៀមប្រឡងសិស្សពូកែថ្នាក់ជាតិ (ថន ប៉ោសេង)', '19-Aug-2016', '0BxYRX7DKrlC4bFctaHF0TURTTk0', '50', null, '211', 'លំហាត់សំរាប់ត្រៀមប្រឡងសិស្សពូកែថ្នាក់ជាតិ', '2', '2', '1', '37', '/resources/static/img/thumbnails/7f589569-cae5-4a00-9989-10f19549c3d4-thumbnail.png', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('3', 'ពិភពជំរើសលំហាត់ស្វ៊ីត(ភាគ១) (ជា ពិសិដ្ឋ)', '19-Aug-2016', '0BxYRX7DKrlC4WHV6dWFuOHkwVVU', '120', null, '264', 'ពិភពជំរើសលំហាត់ស្វ៊ីត', '1', '2', '1', '23', '/resources/static/img/thumbnails/503cbae2-5e1c-48f0-8bbe-bbf03002356e-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('5', 'លំហាត់គណិតវិទ្យាបំប៉នសិស្សពូកែថ្នាក់ទី៩ (ភាគ១) (សំ វុទ្ធី)', '19-Aug-2016', '0BxYRX7DKrlC4MmJnMzVCU2tRbVE', '90', null, '319', 'លំហាត់គណិតវិទ្យាបំប៉នសិស្សពូកែថ្នាក់ទី៩', '1', '2', '1', '23', '/resources/static/img/thumbnails/6aa47f4a-5add-499b-9917-2830969963c2-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('6', 'កំណែលំហាត់គណិតវិទ្យាថ្នាក់ទី៩ (សំ វុទ្ធី)', '19-Aug-2016', '0BxYRX7DKrlC4dWVRVXRyYjhlUDQ', '20', null, '3515', 'កំណែលំហាត់គណិតវិទ្យាថ្នាក់ទី៩', '1', '2', '1', '23', '/resources/static/img/thumbnails/632d4781-f570-4688-b8b3-e2b7e73b060f-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('7', 'កំណែលំហាត់គណិតវិទ្យាថ្នាក់ទី៨ (សំ វុទ្ធី)', '19-Aug-2016', '0BxYRX7DKrlC4YXdNbDF3TVlnZzQ', null, null, null, 'កំណែលំហាត់គណិតវិទ្យាថ្នាក់ទី៨', '1', '2', '1', '23', '/resources/static/img/thumbnails/74f272f3-1f4d-4555-81b1-c9495ae45aaf-thumbnail.png', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('8', 'Test Update', '19-Aug-2016', '0BxYRX7DKrlC4eVNjZTdHdXpiVE0', null, null, null, null, '1', '2', '1', '30', '/resources/static/img/thumbnails/ab700023-1953-4302-b067-b37e9c8e5313-thumbnail.png', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('9', 'លឹម សុវណ្ណវិចិត្រ: ភាគ២: ពិជគណិត វិភាគ(ស៊េរី ៥.០)', '19-Aug-2016', '0BxYRX7DKrlC4R2ttdU15RHBaVjA', null, null, null, 'លឹម សុវណ្ណវិចិត្រ: ភាគ២: ពិជគណិត វិភាគ', '2', '2', '1', '23', '/resources/static/img/thumbnails/d4c7be02-3456-4ae7-a52d-cfdef747de83-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('10', '200 puzzling physics problems', '19-Aug-2016', '0BxYRX7DKrlC4TFp2M18zQUU2SlU', null, null, null, 'puzzling physics problems', '3', '2', '1', '37', '/resources/static/img/thumbnails/7e54b578-5c30-49eb-a091-8c60a656ff13-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('11', '300 Creative Physics Problems with Solutions', '19-Aug-2016', '0BxYRX7DKrlC4R1NLZVJwb3pwUkE', null, null, null, 'Creative Physics Problems with Solutions', '3', '2', '1', '37', '/resources/static/img/thumbnails/7c12c435-c82c-4aba-ab0f-9dd3a3000f55-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('12', '1000 solved problems in modern physics', '19-Aug-2016', '0BxYRX7DKrlC4WjIxN2NPaFFVMVk', null, null, null, 'solved problems in modern physics', '3', '2', '1', '37', '/resources/static/img/thumbnails/bdf5256a-ded0-428e-bedc-62bab8045bd5-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('13', '3000 Solved Problems in Physics', '19-Aug-2016', '0BxYRX7DKrlC4Z0ZtTm5sZWhMN2c', null, null, null, 'Solved Problems in Physics', '1', '2', '1', '37', '/resources/static/img/thumbnails/f288635c-9ad2-4861-bbd9-bee551c3b4b5-thumbnail.PNG', 'Solved Problems in Physics');
INSERT INTO "public"."ksl_document" VALUES ('15', 'Dynamics of Classical Mechanical an introductory course , Richard Fitzpatrick', '19-Aug-2016', '0BxYRX7DKrlC4bjlxY2tBSlVJRUE', null, null, '1', 'Dynamics of Classical Mechanical an introductory course , Richard Fitzpatrick', '1', '2', '1', '37', '/resources/static/img/thumbnails/78d9e66d-0534-4553-bb30-30f7cc6b97d8-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('16', 'Dynamics of Mechanical Systems (Mechanics 3 Unit 2)', '19-Aug-2016', '0BxYRX7DKrlC4SzV5d0Yya1B0R2M', null, null, null, 'Dynamics of Mechanical Systems (Mechanics 3 Unit 2)', '1', '2', '1', '37', '/resources/static/img/thumbnails/d40dc9c0-5bec-43a7-9bfd-cb51f514a42c-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('17', 'Introduction to Group, Invariants and Particles', '19-Aug-2016', '0BxYRX7DKrlC4SWlTQ0FpbFhDZjg', null, null, null, 'Introduction to Group, Invariants and Particles', '1', '2', '1', '37', '/resources/static/img/thumbnails/e64d9592-9b25-47fc-bc5f-b247660c6fc2-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('18', 'Collins Dictionary of Mathematics', '19-Aug-2016', '', null, null, null, 'Collins Dictionary of Mathematics', '1', '2', '1', '36', '/resources/static/img/thumbnails/f4d50605-732c-4f41-a632-3cd232c1d562-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('19', 'Encyclopedia of General Topology-2004', '19-Aug-2016', '0BxYRX7DKrlC4WlZQT1Bzd0pNV2s', null, null, null, 'Encyclopedia of General Topology-2004', '1', '2', '1', '36', '/resources/static/img/thumbnails/89747301-2c74-45f9-8b98-911910d5b12e-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('20', 'ពាក្យខ្មែរខាងគណិតសាស្រ្ត (មង្គល)', '19-Aug-2016', '0BxYRX7DKrlC4cjhUbVBCc293YWM', null, null, null, 'ពាក្យខ្មែរខាងគណិតសាស្រ្ត', '1', '2', '1', '36', '/resources/static/img/thumbnails/e55d6fd9-7368-4d8b-bf80-a7b18b59ea68-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('21', 'វចនានុក្រមអាយធី', '19-Aug-2016', '0BxYRX7DKrlC4YnZZRGtTU3l0YlE', null, null, null, 'វចនានុក្រមអាយធី', '1', '2', '1', '36', '/resources/static/img/thumbnails/b5216474-f9a6-409c-b899-e08dcc135a29-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('22', 'Signal and Systems (សំរាប់និស្សិតផ្នែកអគ្គិសនី)', '19-Aug-2016', '0BxYRX7DKrlC4ZXFkVFUwT3BBZm8', null, null, '4', '(សំរាប់និស្សិតផ្នែកអគ្គិសនី)', '1', '2', '1', '28', '/resources/static/img/thumbnails/5dd4850c-b624-401d-b82c-5014aa29338d-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('23', 'Electrical Power Transmission System Engineering', '19-Aug-2016', '0BxYRX7DKrlC4VVhjNUUwVXkzSWc', null, null, '1', 'Electrical Power Transmission System Engineering', '1', '2', '1', '28', '/resources/static/img/thumbnails/93bab246-9c81-4db7-b661-ef7920cd40ab-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('24', 'wind_and_solar_power_systems', '19-Aug-2016', '0BxYRX7DKrlC4MG56X19uOExPWTA', null, null, null, 'wind_and_solar_power_systems', '1', '2', '1', '28', '/resources/static/img/thumbnails/8830a3b3-eb1d-4e17-91f9-ed94f11c6a5f-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('25', 'Transmission and Distribution Electrical Engineering 3E (Bayliss & Hardy)', '19-Aug-2016', '0BxYRX7DKrlC4d3BiNXB3aWRaQ2c', null, null, null, 'Transmission and Distribution Electrical Engineering 3E (Bayliss & Hardy)', '1', '2', '1', '28', '/resources/static/img/thumbnails/955580cd-b17b-4834-b4eb-aa3e202e5737-thumbnail.PNG', 'https://keoserey.wordpress.com/');
INSERT INTO "public"."ksl_document" VALUES ('26', 'ការអប់រំបំណិនជីវិតស្តីពីបរិស្ថាន', '19-Aug-2016', '1R81In3SjEhVYYDd9ad0WkSKFFBUxQZAirbFgeKYKyO8', null, null, null, 'ការអប់រំបំណិនជីវិតស្តីពីបរិស្ថាន', '1', '3', '1', '8', '/resources/static/img/thumbnails/63ffdb18-0f03-45ee-af25-26fc16bac2c5-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('27', 'ការអប់រំបំនិនជីវិត ស្តីពីកសិកម្ម ការចិញ្ចឹមត្រី មាន់ និងការដាំបន្លៃ', '19-Aug-2016', '1PTc2QB8kk9yJpHukXC3FGLcLBKZhNn4e7XH9rjDPbhE', null, null, null, 'ការអប់រំបំនិនជីវិត ស្តីពីកសិកម្ម ការចិញ្ចឹមត្រី មាន់ និងការដាំបន្លៃ', '1', '3', '1', '8', '/resources/static/img/thumbnails/61c3efc0-e49a-4437-977a-f144ff0a67e5-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('28', 'អំពី​អក្សរ​ខ្មែរ អក្ខរាវិរុទ្ធ​នៃ​ភាសាខ្មែរ និង​វចនានុក្រម​ខ្មែរ', '19-Aug-2016', '0BxYRX7DKrlC4V29ySXRRcUUyeDg', null, null, null, 'អំពី​អក្សរ​ខ្មែរ អក្ខរាវិរុទ្ធ​នៃ​ភាសាខ្មែរ និង​វចនានុក្រម​ខ្មែរ', '1', '2', '1', '31', '/resources/static/img/thumbnails/936083a5-4419-4920-8a5e-7210aca25cd4-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('29', 'ល្បែង​ប្រជា​ប្រិយ​ខ្មែរ', '19-Aug-2016', '0BxYRX7DKrlC4VHRXdndodTJlN1U', null, null, null, 'ល្បែង​ប្រជា​ប្រិយ​ខ្មែរ', '1', '2', '1', '40', '/resources/static/img/thumbnails/95d69b47-ff89-4dfc-94cb-08e3a3e328f3-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('30', 'វេយ្យាករណ៍​ខ្មែរ ថ្នាក់​មជ្ឈិមដ្ឋានឧត្ដមដ្ឋាន', '19-Aug-2016', '0BxYRX7DKrlC4eldueFVDaE5feE0', null, null, null, 'វេយ្យាករណ៍​ខ្មែរ ថ្នាក់​មជ្ឈិមដ្ឋានឧត្ដមដ្ឋាន', '1', '2', '1', '38', '/resources/static/img/thumbnails/6579561c-0021-429a-9e86-d3a815854551-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('31', 'វិញ្ញាសា​គណិតវិទ្យា​សម្រាប់​ត្រៀម​ប្រឡង​បាក់​ឌុប ០២', '19-Aug-2016', '0BxYRX7DKrlC4eHZEQ21Tc2hjdGs', null, null, null, 'វិញ្ញាសា​គណិតវិទ្យា​សម្រាប់​ត្រៀម​ប្រឡង​បាក់​ឌុប ០២', '1', '2', '1', '30', '/resources/static/img/thumbnails/65170b96-dc3f-49b1-a485-541cc36ab196-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('32', 'ឯកសារ​បំប៉ន​​សមត្ថភាព​គ្រូ​បង្រៀន​​នៅ​អនុវិទ្យាល័យ​ - ប្រវត្តិវិទ្យា', '19-Aug-2016', '0BxYRX7DKrlC4ZkZ1LTk1eThuSkE', null, null, null, 'ឯកសារ​បំប៉ន​​សមត្ថភាព​គ្រូ​បង្រៀន​​នៅ​អនុវិទ្យាល័យ​ - ប្រវត្តិវិទ្យា', '1', '2', '1', '25', '/resources/static/img/thumbnails/fe7ced6a-ff94-43d5-8f61-9273323bbfeb-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('33', 'Khmer_Learning_Outcomes_ENG', '19-Aug-2016', '1KvRfPJbqPpz_IviNQLCMZKoglRCjTOnbCjtVOcnZV7g', null, null, null, 'Khmer_Learning_Outcome', '1', '3', '1', '38', '/resources/static/img/thumbnails/00ee5b67-e6e4-4b4e-b9dd-3a7deeea4f2e-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('34', 'Khmer_Sample_assessment_task_KH', '19-Aug-2016', '0BxYRX7DKrlC4MFMxRFA4TDljTUk', null, null, null, 'Khmer_Sample_assessment_task_KH', '1', '2', '1', '38', '/resources/static/img/thumbnails/10bcca7e-96f4-40b8-a156-999f7aa93b62-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('35', 'បែប​ហាត់​សរសេរ​អក្សរ​ផ្ចង់', '19-Aug-2016', '0BxYRX7DKrlC4WEhVUmFLRzhWLUE', null, null, null, 'បែប​ហាត់​សរសេរ​អក្សរ​ផ្ចង់', '1', '2', '1', '38', '/resources/static/img/thumbnails/00d9b422-de5b-4159-891c-0a4ff887df67-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('36', 'វិធី​រៀន​មើល និង​សរសេរ​អក្សរ​ខ្មែរ​សម្រាប់​ថ្នាក់​កុមារដ្ឋាន', '19-Aug-2016', '0BxYRX7DKrlC4a2thTHVVTHFUc3M', null, null, null, 'វិធី​រៀន​មើល និង​សរសេរ​អក្សរ​ខ្មែរ​សម្រាប់​ថ្នាក់​កុមារដ្ឋាន', '1', '2', '1', '38', '/resources/static/img/thumbnails/6cc09507-7f35-444f-a428-112d5f9c82f9-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('37', 'វេយ្យាករណ៍​ខ្មែរ​ទំនើប', '19-Aug-2016', '0BxYRX7DKrlC4azhNWll6RHJRa1E', null, null, null, 'វេយ្យាករណ៍​ខ្មែរ​ទំនើប', '1', '2', '1', '38', '/resources/static/img/thumbnails/ed0d6936-ea6a-418b-8dfa-2beda3a783a4-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('38', 'សៀវភៅ​វេយ្យាករណ៍​ទម្រង់​និយម នៃ​ភាសា​ខ្មែរ​ទំនើប ភាគ​ទី​១', '19-Aug-2016', '0BxYRX7DKrlC4ZElwdWZqdFc2V00', null, null, null, 'សៀវភៅ​វេយ្យាករណ៍​ទម្រង់​និយម នៃ​ភាសា​ខ្មែរ​ទំនើប ភាគ​ទី​១', '1', '2', '1', '38', '/resources/static/img/thumbnails/b3ff7bd0-0568-4121-a229-19bc9ddf4626-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('39', 'Math-Curriculum_Upper_Secondary_Level', '19-Aug-2016', '0BxYRX7DKrlC4RFh5QzR6b2U3OTQ', '107', null, '2', 'Math-Curriculum_Upper_Secondary_Level', '1', '2', '1', '23', '/resources/static/img/thumbnails/d0965070-10ba-450b-8fe1-c2b16616fd55-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('40', 'MySQL', '19-Aug-2016', '0BxYRX7DKrlC4Q0RYQ0lBcnlJR0E', null, null, '20', null, '1', '2', '1', '1', '/resources/static/img/thumbnails/7cfa7be6-196a-4b38-92e6-ebe2b420276d-thumbnail.png', null);
INSERT INTO "public"."ksl_document" VALUES ('41', 'អនុគមន៍អ៊ិចស្ព៉ និងលោការីតសុទ្ធ', '19-Aug-2016', '0BxYRX7DKrlC4THdEYm1icDVJVXc', null, null, null, null, '1', '2', '1', '23', '/resources/static/img/thumbnails/5e88c8c7-e01c-41f2-be6d-739a00fb047b-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('42', 'Maths_Learning_Outcomes_KH', '19-Aug-2016', '0BxYRX7DKrlC4TWV3XzJBZzNadmM', null, null, null, 'Maths_Learning', '1', '2', '1', '23', '/resources/static/img/thumbnails/f223653c-b222-46d5-9586-d81b873508e2-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('43', 'កម្រងលំហាត់និងដំណោះស្រាយប្រូបាប', '19-Aug-2016', '0BxYRX7DKrlC4MThacHFoZ3dzbFk', null, null, null, 'កម្រងលំហាត់និងដំណោះស្រាយប្រូបាប', '1', '2', '1', '30', '/resources/static/img/thumbnails/f2447a1b-f372-4384-8f3d-247f58d6d7c0-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('44', 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី៧', '19-Aug-2016', '0BxYRX7DKrlC4c2pfa29fTFhnT1U', null, null, null, 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី៧', '1', '2', '1', '23', '/resources/static/img/thumbnails/93dc6e31-e7a2-48f3-b11a-213059c5cf98-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('45', 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី៨', '19-Aug-2016', '0BxYRX7DKrlC4Wi1Sa05JQmMxSjA', null, null, null, 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី៨', '1', '2', '1', '23', '/resources/static/img/thumbnails/952a883a-b15e-448e-96a1-329d2f9ae7fe-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('46', 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី៩', '19-Aug-2016', '0BxYRX7DKrlC4Qjl1cnVKazdSMXc', null, null, null, 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី៩', '1', '2', '1', '23', '/resources/static/img/thumbnails/99817014-db13-4e16-91d7-cd904180fa01-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('47', 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី១០', '19-Aug-2016', '0BxYRX7DKrlC4UFBnMDNUbGpRY1k', null, null, null, 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី១០', '1', '2', '1', '23', '/resources/static/img/thumbnails/08e4b27e-4cc5-472b-adfb-3ca9ccf15259-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('48', 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី១១', '19-Aug-2016', '0BxYRX7DKrlC4MTNVbjVjcXJGaFk', null, null, null, 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី១១', '1', '2', '1', '23', '/resources/static/img/thumbnails/d89afcb3-1e44-4424-ba73-789814d9d5a8-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('49', 'សំណួរចម្លើយជីវវិទ្យាថ្នាក់ទី១២', '19-Aug-2016', '0BxYRX7DKrlC4OURwZWNLMExzQW8', null, null, null, 'Biology, Examination question for grade 12,', '1', '2', '1', '29', '/resources/static/img/thumbnails/65dea760-35eb-4276-9320-28ed00fb21b8-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('50', 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី១២', '19-Aug-2016', '0BxYRX7DKrlC4Q3IwU0hUOVZXeEE', null, null, null, 'កិច្ច​តែង​ការ​បង្រៀន​គណិតវិទ្យា​ថ្នាក់​ទី១២', '1', '2', '1', '23', '/resources/static/img/thumbnails/f9f544d8-5d94-4bf9-b6bd-d21ef870b7e6-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('51', 'សំណួរចម្លើយ វប្បធម៌ទូទៅ', '19-Aug-2016', '0BxYRX7DKrlC4UGFScUU4LWc4bTA', null, null, null, 'General knowledge. Examination question for grade 12', '1', '2', '1', '56', '/resources/static/img/thumbnails/aaff178b-63f7-4d3b-993c-fb863c514a64-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('52', 'គណិតវិទ្យា ថ្នាក់​ទី​៧ មេរៀន​ទី​៧៖ រង្វាស់រង្វាល់​', '19-Aug-2016', '0BxYRX7DKrlC4YUtXUlZqeU1RZ0E', null, null, null, 'គណិតវិទ្យា ថ្នាក់​ទី​៧ មេរៀន​ទី​៧៖ រង្វាស់រង្វាល់​', '1', '2', '1', '23', '/resources/static/img/thumbnails/17bff4f8-6854-4bb2-b40a-399b4178caf1-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('53', 'សំណួរ និងវិញ្ញាសាត្រៀមពន្ធដា', '19-Aug-2016', '0BxYRX7DKrlC4aHZieGhLNkR1ZVk', null, null, '2', 'Set of question for examination tax', '1', '2', '1', '20', '/resources/static/img/thumbnails/eed11521-941c-414e-8730-928b5c39fb61-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('54', 'គណិតវិទ្យា ថ្នាក់​ទី​៧ មេរៀន​ទី​២០៖ ប្រូបាប', '19-Aug-2016', '15iBx-Ww9jTgpZOm8RjkGj4axLv4Qsj5S4WX60DNnM1k', null, null, null, 'គណិតវិទ្យា ថ្នាក់​ទី​៧ មេរៀន​ទី​២០៖ ប្រូបាប', '1', '3', '1', '23', '/resources/static/img/thumbnails/01f975f3-59e9-4b53-a82a-4285e25a2bd2-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('55', 'គណិតវិទ្យា ថ្នាក់​ទី​៧ មេរៀន​ទី​២០៖ ប្រូបាប', '19-Aug-2016', '1-UMjeaqrX8AmSxnSKu6OGh_ZfU228YwLdUaE_26jwGw', null, null, null, null, '1', '3', '1', '23', '/resources/static/img/thumbnails/d1b32399-cfb7-42a8-a7d7-e3d707330bd0-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('56', 'គណិតវិទ្យា ថ្នាក់​ទី​៨ មេរៀន​ទី​៤៖ រង្វាស់រង្វាល់​', '19-Aug-2016', '0BxYRX7DKrlC4NEdQWWo3dmZONHM', null, null, null, null, '1', '2', '1', '23', '/resources/static/img/thumbnails/60065541-9af8-4ae6-acfa-d559e5390175-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('57', 'សំណួរ ចម្លើយប្រវត្តិវិទ្យាត្រៀមប្រឡងសញ្ញាប័ត្រទុតិយភូមិ', '19-Aug-2016', '0BxYRX7DKrlC4bnlKZF80YVVxYTA', null, null, null, 'Examination question of history grade 12', '1', '2', '1', '25', '/resources/static/img/thumbnails/d588b20a-61f7-4951-9413-00a0db5ba199-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('58', 'សៀវភៅស្តីពីកិច្ចការរដ្ឋបាលរាជធានី ខេត្ត ក្រុង ស្រុក ខណ្ឌ', '19-Aug-2016', '0BxYRX7DKrlC4dWN2eWRjSXV4Y00', null, null, '1', 'Administrator, Organization', '1', '2', '1', '59', '/resources/static/img/thumbnails/a8f2b388-d712-4738-bbd9-338673801148-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('59', 'គណិតវិទ្យា ថ្នាក់​ទី​៨ មេរៀន​ទី​១១៖ ប្រូបាប', '19-Aug-2016', '', null, null, null, 'គណិតវិទ្យា ថ្នាក់​ទី​៨ មេរៀន​ទី​១១៖ ប្រូបាប', '1', '3', '1', '23', '/resources/static/img/thumbnails/5adc2f4f-731b-458c-95c1-68c85d12ece7-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('60', 'គណិតវិទ្យា ថ្នាក់​ទី​៩ មេរៀន​ទី​២៖ សមាមាត្រ​', '19-Aug-2016', '0BxYRX7DKrlC4TGhUT09LVDEwZWs', null, null, null, 'គណិតវិទ្យា ថ្នាក់​ទី​៩ មេរៀន​ទី​២៖ សមាមាត្រ​', '1', '2', '1', '23', '/resources/static/img/thumbnails/69610ff2-11ae-4882-aa3c-3bfe2d19f80b-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('61', 'គណិតវិទ្យា ថ្នាក់-ទី-៨ មេរៀន-ទី-១០៖ ស្ថិតិ', '19-Aug-2016', '1JDKmSUhDc8jF6hcXmkSQjnu7XC3j0ceI1QggqlStRck', null, null, null, 'គណិតវិទ្យា ថ្នាក់-ទី-៨ មេរៀន-ទី-១០៖ ស្ថិតិ', '1', '3', '1', '23', '/resources/static/img/thumbnails/248d5a86-1911-4a1b-b60a-b568fc01a7f9-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('62', 'គណិតវិទ្យា ថ្នាក់-ទី-៩ មេរៀន-ទី-១០៖ សមីការបន្ទាត់', '19-Aug-2016', '1ck3WtDEq4950S_yLYIdoneqfi05R517jGRU2qemU0q0', null, null, null, 'គណិតវិទ្យា ថ្នាក់-ទី-៩ មេរៀន-ទី-១០៖ សមីការបន្ទាត់', '1', '3', '1', '23', '/resources/static/img/thumbnails/9de20ccf-a945-4fc3-bac5-16ce1efef59c-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('63', 'វិញ្ញាសា​គណិតវិទ្យា​សម្រាប់​ត្រៀម​ប្រឡង​បាក់​ឌុប 0១', '19-Aug-2016', '0BxYRX7DKrlC4UTlqaVpCTVVaY2M', null, null, null, 'វិញ្ញាសា​គណិតវិទ្យា​សម្រាប់​ត្រៀម​ប្រឡង​បាក់​ឌុប 0១', '1', '2', '1', '23', '/resources/static/img/thumbnails/fa9b23a6-c50b-4975-8db1-cba5ad2bc3a1-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('64', 'វិធី​មួយ​ចំនួន​សម្រាប់​ដោះ​ស្រាយ​លំហាត់ ជា​ជំនួយ​ដល់​សិស្ស​ថ្នាក់​ទី​១០', '19-Aug-2016', '0BxYRX7DKrlC4U1o5SUhObkl5dmM', null, null, null, 'វិធី​មួយ​ចំនួន​សម្រាប់​ដោះ​ស្រាយ​លំហាត់ ជា​ជំនួយ​ដល់​សិស្ស​ថ្នាក់​ទី​១០', '1', '2', '1', '23', '/resources/static/img/thumbnails/190967a3-d426-494b-9ecf-d6cd439fec20-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('65', 'វិធី​មួយ​ចំនួន​សម្រាប់​ដោះ​ស្រាយ​លំហាត់ ជា​ជំនួយ​ដល់​សិស្ស​ថ្នាក់​ទី​១១', '19-Aug-2016', '0BxYRX7DKrlC4dkxRSlRBOXN5eWc', null, null, '1', 'វិធី​មួយ​ចំនួន​សម្រាប់​ដោះ​ស្រាយ​លំហាត់ ជា​ជំនួយ​ដល់​សិស្ស​ថ្នាក់​ទី​១១', '1', '2', '1', '23', '/resources/static/img/thumbnails/260f6d2e-6700-4361-93cc-4e295f2a552b-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('66', 'ឯកសារ​បំប៉ន​​សមត្ថភាព​គ្រូ​បង្រៀន​​នៅ​អនុវិទ្យាល័យ​ - គណិតវិទ្យា', '19-Aug-2016', '0BxYRX7DKrlC4UUIxQ285MmxqUVE', null, null, null, 'ឯកសារ​បំប៉ន​​សមត្ថភាព​គ្រូ​បង្រៀន​​នៅ​អនុវិទ្យាល័យ​ - គណិតវិទ្យា', '1', '2', '1', '23', '/resources/static/img/thumbnails/c6184677-ab0a-48f8-8590-0a4350c701db-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('67', 'ទស្សនវិជ្ជា សំនួរ-ចម្លើយ អត្ថាធិប្បាយ', '22-Aug-2016', '0BxYRX7DKrlC4c1hCc2taSWc0TTg', null, null, null, 'ទស្សនវិជ្ជា សំនួរ-ចម្លើយ អត្ថាធិប្បាយ', '1', '2', '1', '52', '/resources/static/img/thumbnails/1bd7333a-fb26-4665-8911-d4bba5197764-thumbnail.PNG', 'http://krou.moeys.gov.kh/en/');
INSERT INTO "public"."ksl_document" VALUES ('73', 'កង្វះ​​ផូស្វ័រ', '22-Aug-2016', '0BxYRX7DKrlC4a05CQmpfSzNqekE', null, null, '2', 'កង្វះ​​ផូស្វ័រ', '1', '2', '1', '10', '/resources/static/img/thumbnails/acf55984-ef90-4641-96cd-43755027c067-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('74', 'គណនាលីមីតនៃអនុគមន៍', '22-Aug-2016', '0BxYRX7DKrlC4XzJwNzV6SkVHZkk', null, null, null, null, '1', '2', '1', '23', '/resources/static/img/thumbnails/d4dcde06-889a-4131-870f-049fefd952c6-thumbnail.PNG', 'Knowledge and entertainment facebook');
INSERT INTO "public"."ksl_document" VALUES ('75', 'កង្វះ​ប៉ូ​តា​ស្យូម', '22-Aug-2016', '0BxYRX7DKrlC4eTROajNKeG1DekU', null, null, null, 'កង្វះ​ប៉ូ​តា​ស្យូម', '1', '2', '1', '10', '/resources/static/img/thumbnails/111ac588-abc8-4fd3-ab6b-e1722a932b4c-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('76', 'កង្វះ​អាសូត', '22-Aug-2016', '0BxYRX7DKrlC4WVpFUzFlLUZjYTQ', null, null, null, 'កង្វះ​អាសូត', '1', '2', '1', '10', '/resources/static/img/thumbnails/10b35018-0ccf-4a22-991a-732145aa811c-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('77', 'កម្រង​ឯកសារ​​អំពី​ក្សេត្រ​បរិស្ថាន​ដំណាំ​ស្រូវ​ក្នុង​ប្រទេស​កម្ពុជា', '22-Aug-2016', '0BxYRX7DKrlC4SWh2XzZJX3BVREE', null, null, null, 'កម្រង​ឯកសារ​​អំពី​ក្សេត្រ​បរិស្ថាន​ដំណាំ​ស្រូវ​ក្នុង​ប្រទេស​កម្ពុជា', '1', '2', '1', '11', '/resources/static/img/thumbnails/8cfa21e8-eeb1-4dfb-8263-53efb6858557-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('78', 'ការ​​ចូល​រួម​របស់​កសិករ​ក្នុង​កា​រ​គ្រប់​គ្រង​កណ្តុរ​ស្រែ', '22-Aug-2016', '0BxYRX7DKrlC4d1o2TV83M2puY1E', null, null, null, 'ការ​​ចូល​រួម​របស់​កសិករ​ក្នុង​កា​រ​គ្រប់​គ្រង​កណ្តុរ​ស្រែ', '1', '2', '1', '10', '/resources/static/img/thumbnails/e5b309b0-e521-4055-a240-5bbb25472e21-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('79', 'ការ​ចិញ្ចឹម​ត្រី​ក្នុង​ស្រែ', '22-Aug-2016', '0BxYRX7DKrlC4OHZDRDZTUWRmWlE', null, null, null, null, '1', '2', '1', '12', '/resources/static/img/thumbnails/e6c97060-05ff-4ccb-8ebe-b612a212d08d-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('80', 'ការ​ទុក​ដាក់​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4NmN1eHNwQ0RBLTQ', null, null, null, 'ការ​ទុក​ដាក់​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/f0e25bb2-a96b-4d06-a4eb-79ed85e9e23f-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('81', 'ការ​ធ្វើ​ជី​កំប៉ុស្តិ៍', '22-Aug-2016', '0BxYRX7DKrlC4ckRqOTdzSFQtS0E', null, null, null, 'ការ​ធ្វើ​ជី​កំប៉ុស្តិ៍', '1', '2', '1', '10', '/resources/static/img/thumbnails/2bbd8b92-9834-4e68-a2ad-2d15c58f6771-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('82', 'ការ​បោក​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4eG5JaFJUSUpsd2M', null, null, null, 'ការ​បោក​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/69308fac-9614-4014-b19e-20c39c86cad1-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('83', 'Access 2007 Notes', '22-Aug-2016', '0BxYRX7DKrlC4NTJoNlFnZm9aX2c', null, null, null, 'រៀន Microsoft Access 3007', '1', '2', '1', '63', '/resources/static/img/thumbnails/1c69fbda-f7b2-4524-8c5f-684e40a3aa99-thumbnail.PNG', 'Knowledge and entertainment facebook');
INSERT INTO "public"."ksl_document" VALUES ('84', 'ការ​ប្រើ​ប្រាស់​ជី​គីមី​សម្រាប់​ដំ​ណាំ​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4elFwX0l5UFVtTUk', null, null, null, 'ការ​ប្រើ​ប្រាស់​ជី​គីមី​សម្រាប់​ដំ​ណាំ​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/9ba65146-823e-4700-a6f3-f6bf8719b97b-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('85', 'ការ​ប្រើ​ប្រាស់​ជី​អាសូត​លើ​ដំណាំ​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4UzVNYkJZb1dOQXM', null, null, null, 'ការ​ប្រើ​ប្រាស់​ជី​អាសូត​លើ​ដំណាំ​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/819d4a91-cc6a-4aed-8489-c3840cafb054-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('86', 'ការ​ប្រើប្រាស់​ជី​គីមី​សម្រាប់​ដំណាំ​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4UU1QNHdqUDJJYTg', null, null, null, 'ការ​ប្រើប្រាស់​ជី​គីមី​សម្រាប់​ដំណាំ​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/41ee9c27-9a45-44b3-b314-524bd2400eea-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('87', 'ការ​ពុល​ជាតិ​ដែក​លើ​ដំណាំ​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4RmF4ZGtVZ1pEZlE', null, null, null, 'ការ​ពុល​ជាតិ​ដែក​លើ​ដំណាំ​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/daa2f7e4-dbc3-4934-b7ff-46e3c2f758af-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('88', 'ការ​ពុល​ជាតិ​ប្រៃ​លើ​ដំណាំ​ស្រូវ', '22-Aug-2016', '0BxYRX7DKrlC4LXFhSUNwN280Slk', null, null, null, 'ការ​ពុល​ជាតិ​ប្រៃ​លើ​ដំណាំ​ស្រូវ', '1', '2', '1', '10', '/resources/static/img/thumbnails/6a514a13-0c90-4327-af87-e007d71e73b5-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('89', 'ការ​រៀប​ចំ​សហគមន៍ ដើម្បី​គ្រប់​គ្រង​កណ្តុរ​ស្រែ', '22-Aug-2016', '0BxYRX7DKrlC4TFUtaGZoRW9wUW8', null, null, null, 'ការ​រៀប​ចំ​សហគមន៍ ដើម្បី​គ្រប់​គ្រង​កណ្តុរ​ស្រែ', '1', '2', '1', '10', '/resources/static/img/thumbnails/f8ac58bd-3a23-457d-9bc3-4b03fc257d18-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('90', 'ការគ្រប់គ្រងជីជាតិដីលើដំណាំស្រូវនៅប្រទេសកម្ពុជា', '22-Aug-2016', '0BxYRX7DKrlC4N0lfMFhYeUhkcWc', null, null, null, 'ការគ្រប់គ្រងជីជាតិដីលើដំណាំស្រូវនៅប្រទេសកម្ពុជា', '1', '2', '1', '10', '/resources/static/img/thumbnails/ab0752b8-fa45-4765-82fc-6defb592d19a-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('91', 'ការជ្រើសរើស ការរៀបចំថ្នាលសំណាប និងការសាប', '22-Aug-2016', '0BxYRX7DKrlC4VkkzOWdJWXBGZTg', null, null, null, 'ការជ្រើសរើស ការរៀបចំថ្នាលសំណាប និងការសាប', '1', '2', '1', '10', '/resources/static/img/thumbnails/fceffc73-6a8e-4b07-996a-a42287dd5879-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('92', 'ការជ្រើសរើសពូជស្រូវសម្រាប់ដាំដុះ', '22-Aug-2016', '0BxYRX7DKrlC4UTRmVVY0dUo0LUk', null, null, '2', 'ការជ្រើសរើសពូជស្រូវសម្រាប់ដាំដុះ', '1', '2', '1', '10', '/resources/static/img/thumbnails/fa2831e9-5f88-425e-be4b-c5360d4360f3-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('93', 'ការប្រើប្រាស់គ្រាប់ពូជល្អ', '22-Aug-2016', '0BxYRX7DKrlC4WWRFTGt6ZjJuRzg', null, null, null, 'ការប្រើប្រាស់គ្រាប់ពូជល្អ', '1', '2', '1', '10', '/resources/static/img/thumbnails/feb28b0d-39b8-4bd5-be62-d50b108098e0-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('94', 'វិញ្ញាសាគណិតវិទ្យា សម្រាប់ត្រៀមប្រលងសញ្ញាប័ត្រទុតិយភូមិ', '22-Aug-2016', '0BxYRX7DKrlC4VFlVLVhBazhyMFU', null, null, null, 'Grade 12 document for examination', '1', '2', '1', '23', '/resources/static/img/thumbnails/db3354cc-c2e8-4848-a3a0-861586ea6de4-thumbnail.PNG', 'Knowledge and entertainment facebook');
INSERT INTO "public"."ksl_document" VALUES ('95', 'ការរកលុយតាម You Tube', '22-Aug-2016', '0BxYRX7DKrlC4UWhKeG9QQ2hsak0', null, null, '1', 'Basic YouTube Lesson', '1', '2', '1', '2', '/resources/static/img/thumbnails/5af73fae-1c8a-4d70-a5bf-6dfc0399a105-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('96', 'សំនួរ និង ចម្លើុយ ជីវវិទ្យា សម្រាប់ ថ្នាក់ទី ១២', '22-Aug-2016', '0BxYRX7DKrlC4R2ZqNllWeVRyYlU', null, null, null, 'Biology for grade 12', '1', '2', '1', '29', '/resources/static/img/thumbnails/76fda904-9747-455f-b2d0-41ef4dddbed5-thumbnail.PNG', 'Knowledge and entertainment facebook');
INSERT INTO "public"."ksl_document" VALUES ('97', 'គណិតវិទ្យាសម្រាប់ Engineering', '22-Aug-2016', '0BxYRX7DKrlC4VUVYZUJ4VzZ0R0E', null, null, '2', 'Brigg_calculus for engineering', '1', '2', '1', '19', '/resources/static/img/thumbnails/5907dda4-bf56-4dc3-9d0c-e8359ff48200-thumbnail.PNG', 'Knowledge and entertainment facebook');
INSERT INTO "public"."ksl_document" VALUES ('98', 'ការព្រោះគ្រាប់នៅលើដីស្ងួត', '23-Aug-2016', '0BxYRX7DKrlC4ZzY3dEJxeDRqOXc', null, null, '2', 'ការព្រោះគ្រាប់នៅលើដីស្ងួត', '1', '2', '2', '10', '/resources/static/img/thumbnails/9e27d50b-cbf4-44ab-aaad-9ad368911e06-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('99', 'ការព្រោះស្រូវនៅលើដីសើម', '23-Aug-2016', '0BxYRX7DKrlC4N2ZJeXFJWUE2MlE', null, null, '3', 'ការព្រោះស្រូវនៅលើដីសើម', '1', '2', '2', '10', '/resources/static/img/thumbnails/9809c861-07b8-4114-a4cb-d031ffc68bc7-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('100', 'រូបមន្ត ជិវវិទ្យា ថ្នាក់ទី ​១២', '23-Aug-2016', '0BxYRX7DKrlC4RzY0eTFjWjRmNTA', null, null, '5', null, '1', '2', '3', '29', '/resources/static/img/thumbnails/8f815284-9cdf-46fc-807d-9c721a7e1cd7-thumbnail.PNG', '');
INSERT INTO "public"."ksl_document" VALUES ('101', 'ការសាកល្បងដំណុះគ្រាប់', '23-Aug-2016', '0BxYRX7DKrlC4Z19HQWJucklRTTQ', null, null, '3', 'ការសាកល្បងដំណុះគ្រាប់', '1', '2', '2', '10', '/resources/static/img/thumbnails/f3b11036-3f26-4fbb-a4bb-23a75cd39dba-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('102', 'ការស្ទូងស្រូវដោយដៃ', '23-Aug-2016', '0BxYRX7DKrlC4dmE1VGNmcFJZOW8', null, null, null, 'ការស្ទូងស្រូវដោយដៃ', '1', '2', '2', '10', '/resources/static/img/thumbnails/2faccaef-f6ad-4ff9-9232-41d3b3b29db2-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('103', 'ការស្ទូងស្រូវដោយដៃ', '23-Aug-2016', '0BxYRX7DKrlC4NUxEUDBYaHk1SVE', null, null, null, 'ការស្ទូងស្រូវដោយដៃ', '1', '2', '2', '10', '/resources/static/img/thumbnails/7825cd36-22e9-42aa-a51a-5199341588f0-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('104', 'កិច្ច​ប្រតិបត្តិ​ការងារ​ក្រោយ​ប្រមូល​ផល', '23-Aug-2016', '0BxYRX7DKrlC4eXcyaXozVXRTeE0', null, null, null, 'កិច្ច​ប្រតិបត្តិ​ការងារ​ក្រោយ​ប្រមូល​ផល', '1', '2', '2', '10', '/resources/static/img/thumbnails/7214ebbe-a80d-4796-a646-b8c7aa419045-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('105', 'ក្រុមដី​សំខាន់ៗ​នៃ​ដំណាំ​ស្រូវ​ក្នុង​ប្រទេសកម្ពុជា', '23-Aug-2016', '0BxYRX7DKrlC4dE9CenVTZjdYMFE', null, null, null, 'ក្រុមដី​សំខាន់ៗ​នៃ​ដំណាំ​ស្រូវ​ក្នុង​ប្រទេសកម្ពុជា', '1', '2', '2', '10', '/resources/static/img/thumbnails/14854667-ca37-4e9a-8cec-6adeb56a72ae-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('106', 'ខ្យងព៌ណមាស ឬខ្យងស៊ីស្រូវ និងវិធានការកម្ចាត់', '23-Aug-2016', '0BxYRX7DKrlC4V3VNZFQyZmp0cm8', null, null, null, 'ខ្យងព៌ណមាស ឬខ្យងស៊ីស្រូវ និងវិធានការកម្ចាត់', '1', '2', '2', '10', '/resources/static/img/thumbnails/3a6ccf57-c111-435f-8a5c-7badbc9dd59b-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('107', 'គុណ​ភាព​គ្រប់​ពូជ', '23-Aug-2016', '0BxYRX7DKrlC4SmdSWm1uSWFlZ0E', null, null, null, 'គុណ​ភាព​គ្រប់​ពូជ', '1', '2', '2', '10', '/resources/static/img/thumbnails/06d6e253-abd2-4426-a21c-2f00d9f8f57a-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('108', 'គុណ​ភាព​ស្រូវ', '23-Aug-2016', '0BxYRX7DKrlC4RGVVQ1BtVFFEYnM', null, null, '3', 'http://www.maff.gov.kh/', '1', '2', '2', '10', '/resources/static/img/thumbnails/87d4a375-a8ad-47c0-8aaf-02e29f0c530f-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('109', 'ចង្វាក់ផលិតកម្មម្ទេសក្រោយពេលប្រមូលផល', '23-Aug-2016', '0BxYRX7DKrlC4S1JYdW1idk1GbGs', null, null, null, 'ចង្វាក់ផលិតកម្មម្ទេសក្រោយពេលប្រមូលផល', '1', '2', '2', '10', '/resources/static/img/thumbnails/c2479489-0b81-4834-8e29-442d61617efa-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('110', 'ចំណាត់​ថ្នាក់​សមត្ថភាព​ដី​បាសាល់​នៃប្រទេសកម្ពុជា', '23-Aug-2016', '0BxYRX7DKrlC4VWZjbi1yWXpTaG8', null, null, null, 'ចំណាត់​ថ្នាក់​សមត្ថភាព​ដី​បាសាល់​នៃប្រទេសកម្ពុជា', '1', '2', '2', '10', '/resources/static/img/thumbnails/1a336acf-7cc2-44cd-8ef5-e971f066b7d2-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('111', 'ជំងឺ​រលួយ​គល់', '23-Aug-2016', '0BxYRX7DKrlC4QlZCc0xIeUwzVm8', null, null, null, 'ជំងឺ​រលួយ​គល់', '1', '2', '2', '10', '/resources/static/img/thumbnails/dca1f217-48c7-4c81-ae44-b9afcabf8cd4-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('112', 'ដង្កូវ​ស៊ី​រូង​ដើម​ស្រូវ', '23-Aug-2016', '0BxYRX7DKrlC4V0dVLXlNNFU0cW8', null, null, null, 'ដង្កូវ​ស៊ី​រូង​ដើម​ស្រូវ', '1', '2', '2', '10', '/resources/static/img/thumbnails/599f5d49-516e-4174-b9b5-ed5c19143ade-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('113', 'ដីដំណាំស្រូវនៅកម្ពុជា', '23-Aug-2016', '0BxYRX7DKrlC4NC1UMjc2Z1d5U3M', null, null, null, 'ដីដំណាំស្រូវនៅកម្ពុជា', '1', '2', '2', '10', '/resources/static/img/thumbnails/f3b78248-cb4b-41d6-a7c0-9d9f0e0505db-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('114', 'ដីនៅស្រុកត្រាំកក់ខេត្តតាកែវនៃប្រទេសកម្ពុជា', '23-Aug-2016', '0BxYRX7DKrlC4aS1GVURRZkxwczg', null, null, null, 'ដីនៅស្រុកត្រាំកក់ខេត្តតាកែវនៃប្រទេសកម្ពុជា', '1', '2', '2', '10', '/resources/static/img/thumbnails/0fb7b119-4946-47dd-92ca-3426ee06394d-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('115', 'ដំណាំស្រូវនៅប្រទេសកម្ពុជា', '23-Aug-2016', '0BxYRX7DKrlC4M2lLMGJud0tEbmM', null, null, null, 'ដំណាំស្រូវនៅប្រទេសកម្ពុជា', '1', '2', '2', '10', '/resources/static/img/thumbnails/7ca995c4-c136-4ad7-ba71-41ff300e4b74-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('116', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៣', '23-Aug-2016', '0BxYRX7DKrlC4Q29zUHIzR05Fcms', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៣', '1', '2', '2', '10', '/resources/static/img/thumbnails/121f8680-80ec-48b5-9e29-2f789304b39b-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('117', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៤', '23-Aug-2016', '0BxYRX7DKrlC4dTRXUndiQkpnTGs', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៤', '1', '2', '2', '10', '/resources/static/img/thumbnails/072b7155-4e49-4ae0-a0f8-bcd71023605a-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('118', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៥', '23-Aug-2016', '0BxYRX7DKrlC4LTkzNWNYTHR1UVU', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៥', '1', '2', '2', '10', '/resources/static/img/thumbnails/9401a231-6d71-4e25-99c3-380a9a7d4a32-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('119', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៦', '23-Aug-2016', '0BxYRX7DKrlC4Uk5aMVJncjdodms', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៦', '1', '2', '2', '10', '/resources/static/img/thumbnails/4068a8fb-dd8b-4d5e-bc7d-e2a1b69972ce-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('120', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៧', '23-Aug-2016', '0BxYRX7DKrlC4bERaMHk3cnhOWkE', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៧', '1', '2', '2', '10', '/resources/static/img/thumbnails/3dbe735f-5e2c-40c3-b823-367a6a95530b-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('121', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៨', '23-Aug-2016', '0BxYRX7DKrlC4cFNiMFE1MlpyNjg', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៨', '1', '2', '2', '10', '/resources/static/img/thumbnails/c1009a5a-8df4-4da6-82d1-35bf3a0a21d3-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('122', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៩', '23-Aug-2016', '0BxYRX7DKrlC4WmkwWUMzcFpUTkE', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៤៩', '1', '2', '2', '10', '/resources/static/img/thumbnails/6c327c87-3971-46ff-9428-3fe0b13f3340-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('123', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥០', '23-Aug-2016', '0BxYRX7DKrlC4WmpMVXpKeGlrOGM', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥០', '1', '2', '2', '10', '/resources/static/img/thumbnails/e3ce8d5a-5b7d-4072-88a0-d2c87a5def9a-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('124', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥១', '23-Aug-2016', '0BxYRX7DKrlC4TDYxSzlMMDZ4OXM', null, null, null, 'http://www.maff.gov.kh/', '1', '2', '2', '10', '/resources/static/img/thumbnails/3ae5a9f0-ed88-4e67-82a7-9cddbbd9b750-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('125', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥២', '23-Aug-2016', '0BxYRX7DKrlC4dFpWRGxrRTc0bU0', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥២', '1', '2', '2', '10', '/resources/static/img/thumbnails/cdf054f8-6a70-4aee-8679-3041cb441ac9-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('126', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥៣', '23-Aug-2016', '0BxYRX7DKrlC4ZmxWYmFzYnIxRzA', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥៣', '1', '2', '2', '10', '/resources/static/img/thumbnails/8a2721a4-7de5-4f6d-99ed-31fb7b88e194-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('128', 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥៧', '23-Aug-2016', '0BxYRX7DKrlC4SURFWU9Tb056SXM', null, null, null, 'ទស្សនាវដ្តីកសិកម្ម លេខ ៥៧', '1', '2', '2', '10', '/resources/static/img/thumbnails/e81cffff-ea70-421f-8374-9a42672da4f1-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('129', 'ទស្សនាវដ្តីកសិកម្មកម្ពុជា លេខទី១០', '23-Aug-2016', '0BxYRX7DKrlC4czg1eVo4ZGR5MEk', null, null, null, 'ទស្សនាវដ្តីកសិកម្មកម្ពុជា លេខទី១០', '1', '2', '2', '10', '/resources/static/img/thumbnails/21e51a5f-6bec-4771-86dc-f71f2b4c88d2-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('130', 'ទ្រីប​ជញ្ជក់​ស្រូវ', '23-Aug-2016', '0BxYRX7DKrlC4ZHhtUDlXdEdwckE', null, null, null, 'ទ្រីប​ជញ្ជក់​ស្រូវ', '1', '2', '2', '10', '/resources/static/img/thumbnails/2f36da17-2345-4d36-8640-cd7a222fd3e2-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('131', 'បង្គុំ​បច្ចេក​ទេស​បង្កើន​ផលិតភាព​ដំណាំ​ស្រូវ', '23-Aug-2016', '0BxYRX7DKrlC4dWVsZ3dGTVlkOWM', null, null, null, 'បង្គុំ​បច្ចេក​ទេស​បង្កើន​ផលិតភាព​ដំណាំ​ស្រូវ', '1', '2', '2', '10', '/resources/static/img/thumbnails/df33a053-8aa1-42c5-a949-f0b94e763806-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('132', 'បង្គុំបច្ចេកទេសដាំដុះសណ្តែកបាយលើដីល្បាយខ្សាច់ក្រោយប្រមូលផលស្រូវវស្សា', '23-Aug-2016', '0BxYRX7DKrlC4elZhOUlFdTd6VVk', null, null, null, 'បង្គុំបច្ចេកទេសដាំដុះសណ្តែកបាយលើដីល្បាយខ្សាច់ក្រោយប្រមូលផលស្រូវវស្សា', '1', '2', '2', '10', '/resources/static/img/thumbnails/ee26f8be-379e-473e-8ae2-4e0675e2d0ed-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('133', 'បច្ចេកទេស​ក្នុង​ការ​ធ្វើ​អង្គប់ សត្វ​​កណ្តុរ​ស្រែ សម្រាប់​ប្រព័ន្ធ​អង្គប់​របាំង​ផ្លា​ស្ទិច', '23-Aug-2016', '0BxYRX7DKrlC4Y0pTVXVSa1FtMEk', null, null, null, 'បច្ចេកទេស​ក្នុង​ការ​ធ្វើ​អង្គប់ សត្វ​​កណ្តុរ​ស្រែ សម្រាប់​ប្រព័ន្ធ​អង្គប់​របាំង​ផ្លា​ស្ទិច', '1', '2', '2', '10', '/resources/static/img/thumbnails/7b2f156c-5c07-4653-a681-13156f11f86e-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('134', 'បច្ចេកទេសដាំដុះដំណាំសណ្តែកដី', '23-Aug-2016', '0BxYRX7DKrlC4NVh1emR3WWVHUzQ', null, null, null, 'បច្ចេកទេសដាំដុះដំណាំសណ្តែកដី', '1', '2', '2', '10', '/resources/static/img/thumbnails/8119e1a6-8597-40c5-b520-390e9e3f3491-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('135', 'ប្រព័ន្ធ​កសិកម្ម​គំរូ', '23-Aug-2016', '0BxYRX7DKrlC4cjEzSm8zNl9iU28', null, null, null, 'ប្រព័ន្ធ​កសិកម្ម​គំរូ', '1', '2', '2', '10', '/resources/static/img/thumbnails/5fec8aac-dc75-42bc-83bb-48e8b6609e3e-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('136', 'ប្រព័ន្ធ​កសិកម្ម​ដោយ​ផ្អែក​លើ​ដំណាំ​ស្រូវ​ជា​មូល​ដ្ឋាន', '23-Aug-2016', '0BxYRX7DKrlC4Q2pVQmIxQ0VtMmM', null, null, null, 'ប្រព័ន្ធ​កសិកម្ម​ដោយ​ផ្អែក​លើ​ដំណាំ​ស្រូវ​ជា​មូល​ដ្ឋាន', '1', '2', '2', '10', '/resources/static/img/thumbnails/4e94f501-82a9-49fe-aaa9-e47350d074e7-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('137', 'ប្រព័ន្ធ​នៃ​ការ​សម្ងួត​គ្រាប់​ស្រូវ', '23-Aug-2016', '0BxYRX7DKrlC4cEhzT2xtSHVCMWc', null, null, null, 'ប្រព័ន្ធ​នៃ​ការ​សម្ងួត​គ្រាប់​ស្រូវ', '1', '2', '2', '10', '/resources/static/img/thumbnails/32e8f0a1-34ff-40ef-b511-bff7d02d1d10-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('138', 'ពូជ​ស្រូវកណ្តាល ខា១', '23-Aug-2016', '0BxYRX7DKrlC4Rk9BcWN1V1lYM2s', null, null, null, 'ពូជ​ស្រូវកណ្តាល ខា១', '1', '2', '2', '10', '/resources/static/img/thumbnails/5852ef1e-0510-4cf7-a5b1-534d01a564db-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('139', 'ពូជ​ស្រូវកណ្តាល ខា២', '23-Aug-2016', '0BxYRX7DKrlC4ZktDdFBuRWtCN0U', null, null, null, 'ពូជ​ស្រូវកណ្តាល ខា២', '1', '2', '2', '10', '/resources/static/img/thumbnails/6e666e1e-2417-4afc-a8a7-756603934f11-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('140', 'ពូជប៉េងប៉ោះ នាងតុំ', '23-Aug-2016', '0BxYRX7DKrlC4ZURsem1mWU9fckU', null, null, null, 'ពូជប៉េងប៉ោះ នាងតុំ', '1', '2', '2', '10', '/resources/static/img/thumbnails/6e666e1e-2417-4afc-a8a7-756603934f11-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('141', 'ពូជប៉េងប៉ោះ នាងពេជ្រ', '23-Aug-2016', '0BxYRX7DKrlC4eGpvT3lzaTBQRjg', null, null, null, 'ពូជប៉េងប៉ោះ នាងពេជ្រ', '1', '2', '2', '10', '/resources/static/img/thumbnails/e1865e43-a481-4900-b293-d62bd997870f-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('142', 'ពូជពោត លឿងមង្គល', '23-Aug-2016', '0BxYRX7DKrlC4elZ4eGcwQ1lBVzA', null, null, null, 'ពូជពោត លឿងមង្គល', '1', '2', '2', '10', '/resources/static/img/thumbnails/ac82d752-8248-4da7-8b17-f6133731f376-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('143', 'ពូជសណ្តែកបាយ កាឌីជ័យ', '23-Aug-2016', '0BxYRX7DKrlC4YTdGaUhJZVVuMU0', null, null, null, 'ពូជសណ្តែកបាយ កាឌីជ័យ', '1', '2', '2', '10', '/resources/static/img/thumbnails/30d8f853-664e-4d4b-a0a1-fc95a703528b-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('144', 'ពូជសណ្តែកបាយ ស៊ីអឹមប៊ី ០១', '23-Aug-2016', '0BxYRX7DKrlC4YW9XUi1mcGotUWs', null, null, null, 'ពូជសណ្តែកបាយ ស៊ីអឹមប៊ី ០១', '1', '2', '2', '10', '/resources/static/img/thumbnails/f41925da-3dc4-4164-9e46-126931461263-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('145', 'ពូជស្រូវកណ្តាល ផ្កាច័ន្ទសែនសរ', '23-Aug-2016', '0BxYRX7DKrlC4VXh5TFZCYjZGZWc', null, null, null, 'ពូជស្រូវកណ្តាល ផ្កាច័ន្ទសែនសរ', '1', '2', '2', '10', '/resources/static/img/thumbnails/eeea741c-bf33-4f0e-a161-95f580e58271-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('146', 'ពូជស្រូវកណ្តាលក្រអូប ផ្ការំដួល', '23-Aug-2016', '0BxYRX7DKrlC4RnFQUDJlMFdmeDA', null, null, null, 'ពូជស្រូវកណ្តាលក្រអូប ផ្ការំដួល', '1', '2', '2', '10', '/resources/static/img/thumbnails/14ee60fc-4c15-4d8e-94ff-f635698a4e79-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('147', 'ពូជស្រូវក្រអូប ផ្ការមៀត', '23-Aug-2016', '0BxYRX7DKrlC4aTRQVVh5aEdzX2c', null, null, null, 'ពូជស្រូវក្រអូប ផ្ការមៀត', '1', '2', '2', '10', '/resources/static/img/thumbnails/fe1a6659-03a1-4b86-8ca3-7c70ef29f315-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('148', 'ពូជស្រូវក្រអូប ផ្ការំដេង', '23-Aug-2016', '0BxYRX7DKrlC4S0ZUTnNobUdsa0E', null, null, null, 'ពូជស្រូវក្រអូប ផ្ការំដេង', '1', '2', '2', '10', '/resources/static/img/thumbnails/bb374770-cb5a-43a9-be97-bbb96b8abff1-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('150', 'ពូជស្រូវក្រអូប សែនពិដោរ', '23-Aug-2016', '0BxYRX7DKrlC4S2Z3NFg1MmVDcTA', null, null, null, 'ពូជស្រូវក្រអូប សែនពិដោរ', '1', '2', '2', '10', '/resources/static/img/thumbnails/9d1484f2-fedb-4f63-9a3d-5dbb894edcf6-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('151', 'គន្លិះតែងសេចក្តី', '23-Aug-2016', '0BxYRX7DKrlC4Y3pjNzRuWm5ZcEk', null, null, '8', null, '1', '2', '3', '38', '/resources/static/img/thumbnails/b7b69640-ccaa-470c-bd4f-b8f136a17d64-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('152', 'ពូជស្រូវធ្ងន់ ខា៤', '23-Aug-2016', '0BxYRX7DKrlC4WFUzZTZ0X0JGZWs', null, null, null, 'ពូជស្រូវធ្ងន់ ខា៤', '1', '2', '2', '10', '/resources/static/img/thumbnails/5fd02312-cf9e-4f4d-a76b-d6f7fccebb4c-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('153', 'ពូជស្រូវធ្ងន់ រាំងជ័យ', '23-Aug-2016', '0BxYRX7DKrlC4QzFWQzJBVjNDVEk', null, null, null, 'ពូជស្រូវធ្ងន់ រាំងជ័យ', '1', '2', '2', '10', '/resources/static/img/thumbnails/603fff73-3a18-47f0-b132-ebe62842ff90-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('154', 'ពូជស្រូវស្រាល បារាយណ៍', '23-Aug-2016', '0BxYRX7DKrlC4b2Raak5jOVJDcU0', null, null, null, 'ពូជស្រូវស្រាល បារាយណ៍', '1', '2', '2', '10', '/resources/static/img/thumbnails/909dd280-2ab9-47e9-b3d2-13352a3e4636-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('155', 'ពូជស្រូវស្រាល អ៊ីអ៊ែរ៦៦', '23-Aug-2016', '0BxYRX7DKrlC4T1liZERNNTZMVVE', null, null, '4', 'ពូជស្រូវស្រាល អ៊ីអ៊ែរ៦៦', '1', '2', '2', '10', '/resources/static/img/thumbnails/61c040af-5a6b-4383-a79a-d17ac5fa68ff-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('156', 'ព្រឹត្តិ​បត្រ​ព័ត៌​មាន​កៅស៊ូ​ ឆ្នាំទី៤ លេខ១ ខែមករា-មេសា ឆ្នាំ២០១៣', '23-Aug-2016', '0BxYRX7DKrlC4eXZxSEFXdFhLYzg', null, null, null, 'ព្រឹត្តិ​បត្រ​ព័ត៌​មាន​កៅស៊ូ​ ឆ្នាំទី៤ លេខ១ ខែមករា-មេសា ឆ្នាំ២០១៣', '1', '2', '2', '11', '/resources/static/img/thumbnails/73aec7d9-7547-4f3b-a2d7-29e1caa647d6-thumbnail.PNG', 'http://www.maff.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('157', 'ច្បាប់ស្តីពីសហគមន៍កសិកម្ម', '23-Aug-2016', '0BxYRX7DKrlC4RTVKMFlKanZZOUE', null, null, null, 'ច្បាប់ស្តីពីសហគមន៍កសិកម្ម', '1', '2', '2', '53', '/resources/static/img/thumbnails/f453489b-cacd-4734-a96a-eb60dcfa4829-thumbnail.PNG', 'www.maff.gov.kh');
INSERT INTO "public"."ksl_document" VALUES ('158', '១.ក្រុមការងារគ្រប់គ្រងការងារព័ត៌មានវិទ្យា', '23-Aug-2016', '0BxYRX7DKrlC4c04xVzU4LUEyN0U', null, null, null, 'ក្រុមការងារគ្រប់គ្រងការងារព័ត៌មានវិទ្យា', '1', '2', '2', '60', '/resources/static/img/thumbnails/3c5989df-2830-43fd-9474-0e9b3c08c5b5-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('159', 'សេចក្ដីសម្រេច ស្ដីពី ការបង្កើត​ក្រុម​បច្ចេក​ទេស រៀប​ចំ​ការ​សម្ដែង​សិល្ប​ទស្ស​នីយ​ភាព', '23-Aug-2016', '0BxYRX7DKrlC4bzBoR1pZQ2FrVTA', null, null, null, 'សេចក្ដីសម្រេច ស្ដីពី ការបង្កើត​ក្រុម​បច្ចេក​ទេស រៀប​ចំ​ការ​សម្ដែង​សិល្ប​ទស្ស​នីយ​ភាព ក្នុង​សន្និ​សីទ​ពិ​ភព​លោក​ស្ដីពីទេសចរណ៍ និងវប្បធម៌', '1', '2', '2', '60', '/resources/static/img/thumbnails/754cafb1-c442-47bf-afd1-1389efc5b817-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('160', 'សេចក្តីសម្រេចស្តីពីការបង្កើតក្រុមការងារពិធីការ', '23-Aug-2016', '0BxYRX7DKrlC4RlRVZmtXYjllYkU', null, null, null, 'សេចក្តីសម្រេចស្តីពីការបង្កើតក្រុមការងារពិធីការ', '1', '2', '2', '60', '/resources/static/img/thumbnails/ccd82396-1350-4139-814e-ad9e68f8f0ca-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('161', 'សេចក្តីសម្រេចស្តីពីការបង្កើតគ.សម្របសម្រួលស្ថិតិ', '23-Aug-2016', '0BxYRX7DKrlC4R3p6bk1OMEp0OGs', null, null, null, 'សេចក្តីសម្រេចស្តីពីការបង្កើតគ.សម្របសម្រួលស្ថិតិ', '1', '2', '2', '60', '/resources/static/img/thumbnails/6ba91895-f83d-450e-af63-28bcaaf823b8-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('162', 'ច្បាប់ស្តីពីម៉ាកពាណិជ្ជនាម និងអំពើនៃការប្រកួតប្រជែងមិនស្មោះត្រង់ (ខ្មែរ)', '23-Aug-2016', '0BxYRX7DKrlC4bzJmVUQwTHZNdW8', null, null, null, 'ច្បាប់ស្តីពីម៉ាកពាណិជ្ជនាម និងអំពើនៃការប្រកួតប្រជែងមិនស្មោះត្រង់ (ខ្មែរ)', '1', '2', '2', '53', '/resources/static/img/thumbnails/1c97cc51-e099-42fb-bf20-ab278bcaadce-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('163', 'ច្បាប់ស្តីពីម៉ាកពាណិជ្ជនាម និងអំពើនៃការប្រកួតប្រជែងមិនស្មោះត្រង់ (អង់គ្លេស)', '23-Aug-2016', '0BxYRX7DKrlC4Unp5NVpEYUE2MFU', null, null, null, 'ច្បាប់ស្តីពីម៉ាកពាណិជ្ជនាម និងអំពើនៃការប្រកួតប្រជែងមិនស្មោះត្រង់ (អង់គ្លេស)', '1', '2', '2', '53', '/resources/static/img/thumbnails/cc741974-d7be-49f3-afeb-859117e8942a-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('164', 'ច្បាប់ស្តីពីសិទ្ធិអ្នកនិពន្ធ និងសិទ្ធិប្រហាក់ ប្រហែល( អង់គ្លេស)', '23-Aug-2016', '0BxYRX7DKrlC4Q0xoblg0OUFlMk0', null, null, null, 'ច្បាប់ស្តីពីសិទ្ធិអ្នកនិពន្ធ និងសិទ្ធិប្រហាក់ ប្រហែល( អង់គ្លេស)', '1', '2', '2', '53', '/resources/static/img/thumbnails/28b08607-5a32-4c0d-9bcc-2e3e69909eae-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('165', 'អនុក្រឹត្យស្តីពីការឈប់សម្រាកប្រចាំឆ្នាំ២០១៦', '23-Aug-2016', '0BxYRX7DKrlC4RGZSMkJEcHdvOFE', null, null, '7', 'អនុក្រឹត្យស្តីពីការឈប់សម្រាកប្រចាំឆ្នាំ២០១៦', '1', '2', '2', '53', '/resources/static/img/thumbnails/6e8d3477-3dd6-485f-a8cb-d928636b84d5-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('166', 'អនុក្រឹត្យស្តីពីទិវាជាតិអំណាន', '23-Aug-2016', '0BxYRX7DKrlC4eDNfM0JOam8xekk', null, null, '22', 'អនុក្រឹត្យស្តីពីទិវាជាតិអំណាន', '1', '2', '2', '53', '/resources/static/img/thumbnails/daa50b96-d5f3-4631-b058-0272ac8d158d-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('167', '១.របាយការណ៍ ប្រចាំឆ្នាំ២០១៥', '23-Aug-2016', '0BxYRX7DKrlC4TzdiM21fQ05PclU', null, null, null, 'របាយការណ៍ ប្រចាំឆ្នាំ២០១៥', '1', '2', '2', '57', '/resources/static/img/thumbnails/e711431e-1e3c-458d-a5b8-5647f8b2c247-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('168', 'ផែនការសកម្មភាពការងារវប្បធម៌ និងវិចិត្រសិល្បៈ ឆ្នាំ២០១៤', '23-Aug-2016', '0BxYRX7DKrlC4bDFuSVgzaC1PT0k', null, null, null, 'ផែនការសកម្មភាពការងារវប្បធម៌ និងវិចិត្រសិល្បៈ ឆ្នាំ២០១៤', '1', '2', '2', '57', '/resources/static/img/thumbnails/2e9d5403-04db-488d-9944-55ac553668dd-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('169', 'របាយការណ៍ ៩ខែ (នព្វមាស) ឆ្នាំ២០១៤', '23-Aug-2016', '0BxYRX7DKrlC4MUZSdXVTOG5LRGc', null, null, null, 'របាយការណ៍ ៩ខែ (នព្វមាស) ឆ្នាំ២០១៤', '1', '2', '2', '57', '/resources/static/img/thumbnails/864fdaf9-6070-4f06-ab6f-dcfb6751c530-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('170', 'របាយការណ៍ ប្រចាំត្រីមាសទី១ ឆ្នាំ២០១៥', '23-Aug-2016', '0BxYRX7DKrlC4UG4wdlF5dHRxd00', null, null, null, 'របាយការណ៍ ប្រចាំត្រីមាសទី១ ឆ្នាំ២០១៥', '1', '2', '2', '57', '/resources/static/img/thumbnails/1a3bc6e4-04e0-4c5a-b16b-9d8424b0c50d-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('171', 'របាយការណ៍ស្តីពីការងារវប្បធម៌ និងវិចិត្រសិល្បៈប្រចាំឆ្នាំ២០១៤', '23-Aug-2016', '0BxYRX7DKrlC4OVdwUWw2dExJODQ', null, null, '1', 'របាយការណ៍ស្តីពីការងារវប្បធម៌ និងវិចិត្រសិល្បៈប្រចាំឆ្នាំ២០១៤', '1', '2', '2', '57', '/resources/static/img/thumbnails/f9e3ed32-6d30-4002-bbfc-abbe23d381d0-thumbnail.PNG', 'http://www.mcfa.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('172', 'New Headway Beginner 4th Edition', '23-Aug-2016', '0BxYRX7DKrlC4QjZiR3lwTVVodG8', null, null, '3', null, '1', '2', '3', '44', '/resources/static/img/thumbnails/711bb9df-7d6e-46b6-91c5-1e7e124e1666-thumbnail.PNG', 'Facebook Entertainment and Knowledge');
INSERT INTO "public"."ksl_document" VALUES ('173', 'ស្ដេចកនជ្រែករាជ្យ', '23-Aug-2016', '0BxYRX7DKrlC4MGZRZzhnOUVvV2c', null, null, '2', 'Poem on The Usurper Sdechkan', '1', '2', '3', '35', '/resources/static/img/thumbnails/cf8080bf-15e8-4cad-a52a-aa3316c6108e-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('174', 'Robot Expert', '23-Aug-2016', '0BxYRX7DKrlC4S0N2LTZRMWhhOEk', null, null, '1', 'Robot Expert', '1', '2', '3', '19', '/resources/static/img/thumbnails/2b371409-3bf0-4e7a-aa63-e77d62ac29a7-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('175', 'គេហពំទ័រសម្រាប់អ្នក', '23-Aug-2016', '0BxYRX7DKrlC4NTBxT3lUdXZBUVE', null, null, '2', 'The Website For You', '1', '2', '3', '56', '/resources/static/img/thumbnails/57024f33-6352-4fd8-907b-a914c716dbb2-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('176', 'Think​​ and Grow Rich', '23-Aug-2016', '0BxYRX7DKrlC4OXpWUUpBSnFsMU0', null, null, null, null, '1', '2', '3', '52', '/resources/static/img/thumbnails/299b9648-da79-48b2-a21a-375df2e5ac13-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('177', 'Sony Vegas khmer', '23-Aug-2016', '0BxYRX7DKrlC4RTJSTHRLM0sybm8', null, null, null, null, '1', '2', '3', '5', '/resources/static/img/thumbnails/3d88c90c-0dd8-49a9-840a-36c6f6e1b3b6-thumbnail.PNG', 'www.itkonkhmer.com');
INSERT INTO "public"."ksl_document" VALUES ('178', 'New Headway upper intermediate', '23-Aug-2016', '0BxYRX7DKrlC4S2IxNExaWjNFamM', null, null, null, null, '1', '2', '3', '44', '/resources/static/img/thumbnails/b2a362db-bdb4-4c46-b045-4ca2f46cf506-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('179', 'ការរៀនរចនា 3D "RCAD"', '23-Aug-2016', '0BxYRX7DKrlC4cUxUbUdSM2ZLYVU', null, null, '5', 'Part 3 RCAD', '1', '2', '3', '19', '/resources/static/img/thumbnails/af2b07e1-b14b-421d-8634-b66ddcfb4f4c-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('180', 'ក្រមនីតិវិធីព្រហ្មទណ្ឌ', '23-Aug-2016', '0BxYRX7DKrlC4S04xSkU0RnhDSlk', null, null, '8', 'Law in khmer', '1', '2', '3', '53', '/resources/static/img/thumbnails/14c4efe3-8412-4e77-b5d2-98c36da65621-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('181', 'ក្របខណ្ឌកម្មវិធី​សិក្សា​អប់រំ​ចំណេះទូទៅ​', '23-Aug-2016', '0BxYRX7DKrlC4Rl9lZ21pZHhPakk', null, null, null, null, '1', '2', '3', '38', '/resources/static/img/thumbnails/852c91d4-3333-4f4c-8c95-26b078bdc940-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('182', 'កំណត់ហេតុបង្រៀនសិស្សចៅក្រមជំនាន់ទី ២ ស្តីពី ក្រមរដ្ឋប្បវេណី និងករណីសិក្', '23-Aug-2016', '0BxYRX7DKrlC4czhRY3B4cW1JTm8', null, null, '2', 'Law in Cambodia', '1', '2', '3', '53', '/resources/static/img/thumbnails/ae24085a-8eb7-4f50-87b6-d4ed291a32c6-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('183', 'ក្រមព្រហ្មទណ្ឌនៃព្រះរាជាណាចក្រកម្ពុជា', '23-Aug-2016', '0BxYRX7DKrlC4aHhOY2hTNjhYa3M', null, null, null, 'Law in Cambodia', '1', '2', '3', '53', '/resources/static/img/thumbnails/68d1dffa-0b0d-40cf-ae2f-18b735401aa5-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('184', 'គណិតវិទ្យា វិញ្ញាសាទី១', '23-Aug-2016', '0BxYRX7DKrlC4UzBaUTVMS2xJVGM', null, null, '2', null, '1', '2', '3', '23', '/resources/static/img/thumbnails/c6a19d91-b5d8-4578-b277-9c0b18e1a10c-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('185', 'លិខិតប្រកាសពន្ធកាត់ទុក', '24-Aug-2016', '0BxYRX7DKrlC4QlQ2V3FTX1cxTlk', null, null, null, 'លិខិតប្រកាសពន្ធកាត់ទុក', '1', '2', '2', '60', '/resources/static/img/thumbnails/01f03561-300d-440c-8a46-be69feb524c2-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('186', 'លិខិតប្រកាសពន្ធលើប្រាក់ចំណេញ ប្រចាំឆ្នាំ', '24-Aug-2016', '0BxYRX7DKrlC4RFd1ZHFXS3Y4U1E', null, null, null, 'លិខិតប្រកាសពន្ធលើប្រាក់ចំណេញ ប្រចាំឆ្នាំ', '1', '2', '2', '60', '/resources/static/img/thumbnails/dee7d75f-956f-423c-84db-b609b8b3f606-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('187', 'សៀវភៅបទដ្ឋានបច្ចេកទេសសំណង់', '24-Aug-2016', '0BxYRX7DKrlC4NVVfV19tR0xxWXM', null, null, '16', null, '3', '2', '3', '19', '/resources/static/img/thumbnails/2300f6da-4487-4ec7-97e6-fa94e855c15a-thumbnail.png', null);
INSERT INTO "public"."ksl_document" VALUES ('188', 'លិខិតប្រកាសពន្ធលើប្រាក់បៀវត្ស', '24-Aug-2016', '0BxYRX7DKrlC4ZjZlYTYtUzByenc', null, null, null, 'លិខិតប្រកាសពន្ធលើប្រាក់បៀវត្ស', '1', '2', '2', '60', '/resources/static/img/thumbnails/44a9dfc9-ff25-431a-ad0d-2337fb09478e-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('189', 'លិខិតប្រកាសអាករលើតម្លៃបន្ថែម(បន្ទុករបស់រដ្ឋ)', '24-Aug-2016', '0BxYRX7DKrlC4WllnYmNCSnNCaTg', null, null, null, 'លិខិតប្រកាសអាករលើតម្លៃបន្ថែម(បន្ទុករបស់រដ្ឋ)', '1', '2', '2', '60', '/resources/static/img/thumbnails/3ed3684e-845f-45d6-ba6a-6749d2cce229-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('190', 'លិខិតប្រកាសអាករលើតម្លៃបន្ថែម', '24-Aug-2016', '0BxYRX7DKrlC4Q3gtWjhKTkJqaFU', null, null, null, 'លិខិតប្រកាសអាករលើតម្លៃបន្ថែម', '1', '2', '2', '60', '/resources/static/img/thumbnails/b0346c52-1e69-422a-8459-f1b3ee1df541-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('191', 'សេចក្ដី​សង្ខេប​លទ្ធផល​នៃ​ការ​ត្រួត​ពិនិត្យ​ការ​អនុវត្ត​ផែនការ​សកម្មភាព', '24-Aug-2016', '0BxYRX7DKrlC4anZ5aEZuSEhsOXM', null, null, null, 'សេចក្ដី​សង្ខេប​លទ្ធផល​នៃ​ការ​ត្រួត​ពិនិត្យ​ការ​អនុវត្ត​ផែនការ​សកម្មភាព​ និង​ការ​វាយ​តម្លៃ​ការ​អនុវត្ត​ថវិកា​ ប្រចាំ​ឆ្នាំ​២០១៥ របស់ក្រសួងសេដ្ឋកិច្ច​និង​ហិរញ្ញវត្ថុ', '1', '2', '2', '56', '/resources/static/img/thumbnails/e61adc5b-0b96-44eb-9a1a-322352d0bac6-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('192', 'កសារ​គោល​នយោបាយ​អភិវឌ្ឍន៍​វិស័យ​ឧស្សាហកម្ម​កម្ពុជា​ឆ្នាំ២០១៥-២០២៥', '24-Aug-2016', '0BxYRX7DKrlC4a2h1Q3FFaWphQ3M', null, null, null, 'ឯកសារ​គោល​នយោបាយ​អភិវឌ្ឍន៍​វិស័យ​ឧស្សាហកម្ម​កម្ពុជា​ឆ្នាំ២០១៥-២០២៥ តម្រង់ទិស​ទីផ្សារ​និង​បង្កើត​លក្ខខណ្ឌ​អំណោយ​ផល​ដើម្បី​ជំរុញ​ការអភិវឌ្ឍ​វិស័យ​ឧស្សាហកម្ម', '1', '2', '2', '56', '/resources/static/img/thumbnails/6811a00b-d45c-489c-9941-8c7d47052440-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('193', 'ឯកសារ​យុទ្ធសាស្ត្រ​ចតុកោណ-ដំណាក់កាល​ទី៣ របស់​សម្ដេច​អគ្គមហា​សេនាបតី​តេជោ ហ៊ុន សែន', '24-Aug-2016', '0BxYRX7DKrlC4Wk5GUlBCQ3FGYnc', null, null, null, 'ឯកសារ​យុទ្ធសាស្ត្រ​ចតុកោណ-ដំណាក់កាល​ទី៣ របស់​សម្ដេច​អគ្គមហា​សេនាបតី​តេជោ ហ៊ុន សែន', '1', '2', '2', '56', '/resources/static/img/thumbnails/af991a21-4c1c-442d-9bf4-43e62c627c63-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('194', 'ឯកសារ​យុទ្ធសាស្ត្រ​អភិវឌ្ឍន៍​វិស័យ​ហិរញ្ញវត្ថុ ឆ្នាំ ២០១១-២០២០', '24-Aug-2016', '0BxYRX7DKrlC4LXFFMnByMHFmblk', null, null, null, 'http://www.mef.gov.kh/', '1', '2', '2', '56', '/resources/static/img/thumbnails/eec76664-c617-4084-8e92-d8358da6ea32-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('195', 'ឯកសារសង្ខេប​​យុទ្ធសាស្ត្រ​ ស្ដីពី​ការគ្រប់គ្រង​បំណុល​សាធារណៈ ២០១៥-២០១៨', '24-Aug-2016', '0BxYRX7DKrlC4MmtNWjAxVXBzb00', null, null, null, 'ឯកសារសង្ខេប​​យុទ្ធសាស្ត្រ​ ស្ដីពី​ការគ្រប់គ្រង​បំណុល​សាធារណៈ ២០១៥-២០១៨', '1', '2', '2', '56', '/resources/static/img/thumbnails/e9b68f36-1002-4a46-bf87-9a03a481ff70-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('196', 'ប្រកាស​លេខ ១០៥៨ សហវ.ប្រក ចុះថ្ងៃទី ០៣ ខែ កញ្ញា ឆ្នាំ ២០១៥', '24-Aug-2016', '0BxYRX7DKrlC4ekl4NkNMTmtycHM', null, null, null, 'ប្រកាស​លេខ ១០៥៨ សហវ.ប្រក ចុះថ្ងៃទី ០៣ ខែ កញ្ញា ឆ្នាំ ២០១៥', '1', '2', '2', '56', '/resources/static/img/thumbnails/c710c358-0d27-4c2b-80c2-b9ad17ba0dd5-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('197', 'ប្រកាសលេខ ៦២២ សហវ.ប្រក ចុះថ្ងៃទី ៣១ ខែឧសភា ឆ្នាំ ២០១៦', '24-Aug-2016', '0BxYRX7DKrlC4UVFvRFlNRWdPaVU', null, null, null, 'ប្រកាសលេខ ៦២២ សហវ.ប្រក ចុះថ្ងៃទី ៣១ ខែឧសភា ឆ្នាំ ២០១៦ ស្ដីពី​ការ​បែងចែក​ភារកិច្ច​របស់​អនុរដ្ឋលេខាធិការ​នៃ​ក្រសួង​សេដ្ឋកិច្ច​និង​ហិរញ្ញវត្ថុ', '1', '2', '2', '56', '/resources/static/img/thumbnails/467b73f2-65d0-4e68-b945-b0726c994617-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('198', 'ព្រះរាជក្រឹត្យលេខ នស-រកត-០៥១៦-៥៥៨ ស្ដីពីការតែងតាំងមន្ត្រីរាជការចំនួន ១០រូប', '24-Aug-2016', '0BxYRX7DKrlC4aUFsak5xZDdMZ00', null, null, null, 'ព្រះរាជក្រឹត្យលេខ នស-រកត-០៥១៦-៥៥៨ ស្ដីពីការតែងតាំងមន្ត្រីរាជការចំនួន ១០រូប', '1', '2', '2', '56', '/resources/static/img/thumbnails/b15f4090-a722-4670-809c-3f2f807615ca-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('199', 'អនុក្រឹត្យលេខ ៥០ អនក្រ.បក របស់រាជរដ្ឋាភិបាល ចុះថ្ងៃទី២៥ ខែមីនា ឆ្នាំ២០១៦​', '24-Aug-2016', '0BxYRX7DKrlC4YmVaRjdJb2I0cU0', null, null, null, 'អនុក្រឹត្យលេខ ៥០ អនក្រ.បក របស់រាជរដ្ឋាភិបាល ចុះថ្ងៃទី២៥ ខែមីនា ឆ្នាំ២០១៦​ស្ដីពី​ការ​បន្ថែម​របប​សន្តិសុខ​សង្គម​សម្រាប់​អតីត​មន្ត្រីរាជការ​ស៊ីវិល​និង​អតីត​យុទ្ធជន', '1', '2', '2', '56', '/resources/static/img/thumbnails/4b7509aa-a86c-4fcb-bd62-d47a922451ee-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('200', 'អនុក្រឹត្យលេខ ៥១ អនក្រ.បក របស់រាជរដ្ឋាភិបាល ចុះថ្ងៃទី២៥ ខែមីនា ឆ្នាំ២០១៦', '24-Aug-2016', null, null, null, null, 'អនុក្រឹត្យលេខ ៥១ អនក្រ.បក របស់រាជរដ្ឋាភិបាល ចុះថ្ងៃទី២៥ ខែមីនា ឆ្នាំ២០១៦ ស្ដីពីការ​ផ្ដល់​ប្រាក់​ឧបត្ថម្ភ​ក្នុង​ឱកាស​ពិធីចូល​ឆ្នាំថ្មី​ប្រពៃណី​ជាតិ​ឆ្នាំ​វក អដ្ឋស័ក ពុទ្ធសករាជ ២៥៦០', '1', '2', '2', '56', '/resources/static/img/thumbnails/8e399f8d-579f-4a80-acf9-6bc5ae57fefa-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('201', 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ កុម្ភៈ ឆ្នាំ ២០១៦ (TOFE for February 2016)', '24-Aug-2016', '0BxYRX7DKrlC4bWQ2UE5YU2RyWnc', null, null, null, 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ កុម្ភៈ ឆ្នាំ ២០១៦ (TOFE for February 2016)', '1', '2', '2', '55', '/resources/static/img/thumbnails/3ae0b26c-fb44-48aa-b2be-59177416c840-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('202', 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មករា ឆ្នាំ ២០១៦ (TOFE for January 2016)', '24-Aug-2016', '0BxYRX7DKrlC4MnVqYWhUR2pHY0U', null, null, null, 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មករា ឆ្នាំ ២០១៦ (TOFE for January 2016)', '1', '2', '2', '55', '/resources/static/img/thumbnails/3619d27f-f7e1-487b-ab1c-7f30296d117d-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('203', 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មីនា ឆ្នាំ ២០១៦ (TOFE for March 2016)', '24-Aug-2016', '0BxYRX7DKrlC4dmc3akVYRXZWT0U', null, null, null, 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មីនា ឆ្នាំ ២០១៦ (TOFE for March 2016)', '1', '2', '2', '55', '/resources/static/img/thumbnails/0712b2dc-4a7a-4f9b-8422-5e5af5bf7f5b-thumbnail.PNG', 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មីនា ឆ្នាំ ២០១៦ (TOFE for March 2016)');
INSERT INTO "public"."ksl_document" VALUES ('204', 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មេសា ឆ្នាំ ២០១៦ (TOFE for April 2016)', '24-Aug-2016', '0BxYRX7DKrlC4eExLOFpVT1hXRGs', null, null, null, 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ មេសា ឆ្នាំ ២០១៦ (TOFE for April 2016)', '1', '2', '2', '55', '/resources/static/img/thumbnails/0712b2dc-4a7a-4f9b-8422-5e5af5bf7f5b-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('205', 'តារាង​ប្រតិបត្តិការ​ហិរញ្ញវត្ថុ និង សេដ្ឋកិច្ច​សម្រាប់ ខែ ឧសភា ឆ្នាំ ២០១៦ (TOFE for May 2016)', '24-Aug-2016', '0BxYRX7DKrlC4UUFyLWxlT1RqN1E', null, null, null, null, '1', '2', '2', '55', '/resources/static/img/thumbnails/bb5fba17-eb6f-42aa-8c37-0d584cf08f34-thumbnail.PNG', 'http://www.mef.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('206', 'ករណី​សំណើ​សំុ​អនុញ្ញាត​ចុះ​បញ្ជី​ដី​ផ្តល់​ប័ណ្ណ​កម្ម​សិទ្ធ​ជូន​ប្រជា​ពល​រដ្ឋ​ចំនួន ១៨ គ្រួសារ', '24-Aug-2016', '0BxYRX7DKrlC4dG9QamdVdmtrS2c', null, null, null, 'ករណី​សំណើ​សំុ​អនុញ្ញាត​ចុះ​បញ្ជី​ដី​ផ្តល់​ប័ណ្ណ​កម្ម​សិទ្ធ​ជូន​ប្រជា​ពល​រដ្ឋ​ចំនួន ១៨ គ្រួសារ ស្ថិត​នៅ​ភូមិទំនប់ និង​ភូមិ​ភ្នំពេញ​ថ្មី សង្កាត់​ភ្នំពេញ​ថ្មី ខណ្ឌ​សែន​សុខ រាជ​ធានី​ភ្នំពេញ', '1', '2', '2', '53', '/resources/static/img/thumbnails/205786b2-9454-429c-ae86-d637d3f8e1f4-thumbnail.PNG', 'http://www.mlmupc.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('207', 'លិខិត​ថ្លែង​អំណរ​គុណ និង​ដឹង​គុណ​យ៉ាង​ជ្រាល​ជ្រៅ​របស់​ប្រជា​ពល​រដ្ឋ ២១', '24-Aug-2016', '0BxYRX7DKrlC4M0ZYRGNyeFMtdjg', null, null, null, 'លិខិត​ថ្លែង​អំណរ​គុណ និង​ដឹង​គុណ​យ៉ាង​ជ្រាល​ជ្រៅ​របស់​ប្រជា​ពល​រដ្ឋ ២១ គ្រួសារ ចំពោះ សម្តេច​អគ្គ​មហា​សេនា​បតី​តេជោ ហ៊ុន សែន', '1', '2', '2', '53', '/resources/static/img/thumbnails/538bcf0e-fe41-4197-b5ed-f384e9a7f260-thumbnail.PNG', 'http://www.mlmupc.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('208', 'អនុក្រឹត្យ​ស្ដី​ពី​ការ​បង្កើត​នាយក​ដ្ឋាន​សម្បទាន​ដី​សង្គម​កិច្ច', '24-Aug-2016', '0BxYRX7DKrlC4X1ZlOXFua1NTLVE', null, null, null, 'អនុក្រឹត្យ​ស្ដី​ពី​ការ​បង្កើត​នាយក​ដ្ឋាន​សម្បទាន​ដី​សង្គម​កិច្ច​ចំណុះ​អគ្គ​នាយក​ដ្ឋាន​លំនៅ​ឋាន​នៃ​ក្រសួង​រៀប​ចំ​ដែន​ដី នគ​រូប​នីយ​កម្ម និង​សំណង់', '1', '2', '2', '53', '/resources/static/img/thumbnails/82de96ce-2bff-4182-969c-d5a75d8d59cc-thumbnail.PNG', 'http://www.mlmupc.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('209', 'អនុក្រឹត្យស្តីពីការកែសម្រួលមាត្រា ៦ មាត្រា ៧ និងមាត្រា ១១ នៃអនុក្រឹត្យលេខ ៤៦', '24-Aug-2016', null, null, null, null, 'អនុក្រឹត្យស្តីពីការកែសម្រួលមាត្រា ៦ មាត្រា ៧ និងមាត្រា ១១ នៃអនុក្រឹត្យលេខ ៤៦ អនក្រ.បក ចុះថ្ងៃទី ៣១ ខែឧសភា ឆ្នាំ ២០០២ ស្តីពីនីតិវិធីនៃការកសាងប្លង់សុរិយោដី និងសៀវភៅកោលបញ្ជីដីធ្លី', '1', '2', '2', '53', '/resources/static/img/thumbnails/96503153-6873-4b39-91a8-ccd4d42b9e7d-thumbnail.PNG', 'http://www.mlmupc.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('210', 'អនុក្រឹត្យស្តីពីការកែសម្រួលមាត្រា ៩ និងមាត្រា ១៣ នៃអនុក្រឹត្យលេខ ៤៨', '24-Aug-2016', '0BxYRX7DKrlC4WVZ5WmNfREVjRUk', null, null, null, 'អនុក្រឹត្យស្តីពីការកែសម្រួលមាត្រា ៩ និងមាត្រា ១៣ នៃអនុក្រឹត្យលេខ ៤៨ អនក្រ.បក ចុះថ្ងៃទី ៣១ ខែឧសភា ឆ្នាំ ២០០២ ស្តីពីការចុះបញ្ជីដីធ្លីមានលក្ខណៈដាច់ដោយដុំ', '1', '2', '2', '53', '/resources/static/img/thumbnails/56f1bd00-be45-4219-94c9-ba71f8cd59cd-thumbnail.PNG', 'http://www.mlmupc.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('211', 'Announcement of the 3rd Buy Cambodia Trade Fair', '24-Aug-2016', '0BxYRX7DKrlC4NFdCSU0wOEJPLVk', null, null, null, 'Announcement of the 3rd Buy Cambodia Trade Fair', '1', '2', '2', '60', '/resources/static/img/thumbnails/46c44b34-21ce-4c89-8b85-f998cd6dd568-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('212', 'Announcement on Live Stream Event in Ministry of Commerce''s Facebook Page', '24-Aug-2016', '0BxYRX7DKrlC4UVdVejVmZlo1RkU', null, null, null, 'Announcement on Live Stream Event in Ministry of Commerce''s Facebook Page', '1', '2', '2', '60', '/resources/static/img/thumbnails/190e7414-256d-4e65-998d-146719f5e2c3-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('213', 'The Third Cambodian Products Trade Fair during', '24-Aug-2016', '0BxYRX7DKrlC4WnlBMDlLZkFzekk', null, null, '1', 'The Third Cambodian Products Trade Fair during the “Buy Cambodian Products Campaign” from 28-31 July 2016 at O''Chheurteal Beach, Preah Sihanouk Province!', '1', '2', '2', '60', '/resources/static/img/thumbnails/2219e746-7792-4018-830b-558f91023367-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('214', 'ថ្លៃលក់រាយប្រេងឥន្ធនៈ សម្រាប់អនុវត្ត ពីថ្ងៃទី ២២ ខែកក្កដា ដល់ថ្ងៃទី ០១ ខែសីហា ឆ្នាំ ២០១៦', '24-Aug-2016', '0BxYRX7DKrlC4NFVxQnhXU01IaE0', null, null, null, 'ថ្លៃលក់រាយប្រេងឥន្ធនៈ សម្រាប់អនុវត្ត ពីថ្ងៃទី ២២ ខែកក្កដា ដល់ថ្ងៃទី ០១ ខែសីហា ឆ្នាំ ២០១៦', '1', '2', '2', '60', '/resources/static/img/thumbnails/075f4c40-bb5d-441f-a3b6-6f62ea7615b4-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('215', 'សេចក្តីជូនដំណឹងលេខ ៧៤០ សជណ.សរ ស្តីពីលទ្ធផលនៃសម័យប្រជុំពេញអង្គគណៈរដ្ឋមន្រ្តី', '24-Aug-2016', '0BxYRX7DKrlC4ZzJRMGhtajdtN3M', null, null, null, 'សេចក្តីជូនដំណឹងលេខ ៧៤០ សជណ.សរ ស្តីពីលទ្ធផលនៃសម័យប្រជុំពេញអង្គគណៈរដ្ឋមន្រ្តី', '1', '2', '2', '60', '/resources/static/img/thumbnails/8cffe798-1680-4d08-9f4e-ed9b2cd68f22-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('216', 'Law on the copyright and related rights', '24-Aug-2016', '0BxYRX7DKrlC4QTB5SC1Fa2lIaUE', null, null, null, 'Law on the copyright and related rights', '1', '2', '2', '53', '/resources/static/img/thumbnails/01cd914d-893a-40e6-8013-b4290c85147b-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('217', 'ច្បាប់ស្តីពីការអនុម័តយល់ព្រមលើកិច្ចព្រមព្រៀងស្តីពីកិច្ចសហប្រតិបត្តិការពាណិជ្ជកម្ម', '24-Aug-2016', '0BxYRX7DKrlC4TEhWbDdNbWZIV1E', null, null, null, 'ច្បាប់ស្តីពីការអនុម័តយល់ព្រមលើកិច្ចព្រមព្រៀងស្តីពីកិច្ចសហប្រតិបត្តិការពាណិជ្ជកម្ម សេដ្ឋកិច្ចរវាងរាជរដ្ឋាភិបាលកម្ពុជា និង រដ្ឋាភិបាបេឡារុស', '1', '2', '2', '53', '/resources/static/img/thumbnails/8027bbe4-d494-49f0-b257-7aaca3351d64-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('218', 'បញ្ជីផលិតផលដែលទទួលបានភាពអនុគ្រោះ ពីសាធារណៈរដ្ឋប្រជាមានិតចិន ក្រោមប្រព័ន្ធអនុគ្រោះពន្ឋគយពិសេស (SPT)', '24-Aug-2016', '0BxYRX7DKrlC4MDExUVBJZ0NIbDA', null, null, '2', 'បញ្ជីផលិតផលដែលទទួលបានភាពអនុគ្រោះ ពីសាធារណៈរដ្ឋប្រជាមានិតចិន ក្រោមប្រព័ន្ធអនុគ្រោះពន្ឋគយពិសេស (SPT)', '1', '2', '2', '53', '/resources/static/img/thumbnails/44f35640-d2ff-4d5a-99e2-f514053ba1a6-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('219', 'ប្រកាសអោយប្រើប្រាស់ ច្បាប់ស្តីពីគយ', '24-Aug-2016', '0BxYRX7DKrlC4Y1pBeFRGVFFYZ3M', null, null, null, 'ប្រកាសអោយប្រើប្រាស់ ច្បាប់ស្តីពីគយ', '1', '2', '2', '53', '/resources/static/img/thumbnails/2d8e3de2-02a9-40a0-9646-32b13d66747a-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('220', 'អនុក្រឹត្យស្តីពីការជូនមេដាយស្ថាបនាជាតិ', '24-Aug-2016', '0BxYRX7DKrlC4cHZSOTVua3M0Nmc', null, null, '1', 'អនុក្រឹត្យស្តីពីការជូនមេដាយស្ថាបនាជាតិ', '1', '2', '2', '53', '/resources/static/img/thumbnails/be17dd7d-3869-4048-9a7b-c73b203b8de5-thumbnail.PNG', 'http://www.moc.gov.kh/km-kh/');
INSERT INTO "public"."ksl_document" VALUES ('221', 'អនុក្រឹត្យស្តីពី ការបង្កើតដែនជម្រកសត្វព្រៃកែវសីមា', '24-Aug-2016', '0BxYRX7DKrlC4dHQ0QzNSQW14ZWs', null, null, null, 'អនុក្រឹត្យស្តីពី ការបង្កើតដែនជម្រកសត្វព្រៃកែវសីមា', '1', '2', '2', '11', '/resources/static/img/thumbnails/e682a83d-685f-4d3b-a85e-19417aaf5d2b-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('222', 'អនុក្រឹត្យស្តីពី ការបង្កើតដែនជម្រកសត្វព្រៃព្រះរការ', '24-Aug-2016', '0BxYRX7DKrlC4ak9SOF9QV1JwSEE', null, null, null, 'អនុក្រឹត្យស្តីពី ការបង្កើតដែនជម្រកសត្វព្រៃព្រះរការ', '1', '2', '2', '11', '/resources/static/img/thumbnails/640e8651-3f95-4c1b-8f68-31d94f1e96d6-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('223', 'អនុក្រឹត្យស្តីពី ការបង្កើតតំបន់ការពារទេសភាពទំនាបខាងជើងទន្លេរសាប', '24-Aug-2016', '0BxYRX7DKrlC4RGZMODQ0M3Ntd2M', null, null, '1', 'អនុក្រឹត្យស្តីពី ការបង្កើតតំបន់ការពារទេសភាពទំនាបខាងជើងទន្លេរសាប', '1', '2', '2', '11', '/resources/static/img/thumbnails/11e297b1-9eb7-40e5-af1d-66c68cfaf46d-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('224', 'អនុក្រឹត្យស្តីពី ការបង្កើតតំបន់ប្រើប្រាស់ច្រើនយ៉ាងព្រែកទឹកសាបក្បាលឆាយ', '24-Aug-2016', '0BxYRX7DKrlC4Z290ejIzdFhORzg', null, null, null, 'អនុក្រឹត្យស្តីពី ការបង្កើតតំបន់ប្រើប្រាស់ច្រើនយ៉ាងព្រែកទឹកសាបក្បាលឆាយ', '1', '2', '2', '11', '/resources/static/img/thumbnails/fc415f4e-864a-4e5c-8e9b-1c0110d21533-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('225', 'អនុក្រឹត្យស្តីពី ការបង្កើតឧទ្យានជាតិអូរយ៉ាដាវ', '24-Aug-2016', '0BxYRX7DKrlC4T3JDZ1lIbG11YzQ', '1', null, '2', 'អនុក្រឹត្យស្តីពី ការបង្កើតឧទ្យានជាតិអូរយ៉ាដាវ', '1', '2', '2', '11', '/resources/static/img/thumbnails/763ee756-c2e6-42a1-ad4b-57465c287791-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('226', 'គោលនយោបាយជាតិស្តីពីការអភិវឌ្ឍបៃតង', '24-Aug-2016', '0BxYRX7DKrlC4WTg4Y1ZaOHRBcTA', null, null, null, 'គោលនយោបាយជាតិស្តីពីការអភិវឌ្ឍបៃតង', '1', '2', '2', '57', '/resources/static/img/thumbnails/d0119778-795e-4388-91eb-411f145c6a3c-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('227', 'ផែនការយុទ្ធជាតិស្តីពីការប្រែប្រួលអាកាសធាតុ', '24-Aug-2016', '0BxYRX7DKrlC4TThfQTVPRTZLSjA', null, null, null, 'ផែនការយុទ្ធជាតិស្តីពីការប្រែប្រួលអាកាសធាតុ', '1', '2', '2', '57', '/resources/static/img/thumbnails/289663f0-941e-4639-a415-0888209b562e-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('228', 'ផែនការយុទ្ធជាតិស្តីពីការអភិវឌ្ឍបៃតង', '24-Aug-2016', '0BxYRX7DKrlC4Z0hKNFJmZ2M4V2s', null, null, null, 'ផែនការយុទ្ធជាតិស្តីពីការអភិវឌ្ឍបៃតង', '1', '2', '2', '57', '/resources/static/img/thumbnails/ff11a73f-25e9-426b-9bd9-51945bd7313d-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('229', 'ពិធីសារហ្គូយា នៃអនុសញ្ញាសហប្រជាជាតិស្តីពីជីវៈចម្រុះ', '24-Aug-2016', '0BxYRX7DKrlC4UDBTSS0tSHQ3Y00', null, null, null, 'ពិធីសារហ្គូយា នៃអនុសញ្ញាសហប្រជាជាតិស្តីពីជីវៈចម្រុះ', '1', '2', '2', '57', '/resources/static/img/thumbnails/b18031e7-22c2-48f0-a469-fdd70c430bee-thumbnail.PNG', 'http://www.moe.gov.kh/');
INSERT INTO "public"."ksl_document" VALUES ('230', 'សៀវភៅ​មូលដ្ឋាន​នៃ ន័យ​កម្ម​វិទ្យា​ទូទៅ', '24-Aug-2016', '0BxYRX7DKrlC4QzZ0NEpHbmhzXzg', null, null, '1', 'សៀវភៅ​មូលដ្ឋាន​នៃ ន័យ​កម្ម​វិទ្យា​ទូទៅ', '1', '2', '2', '2', '/resources/static/img/thumbnails/6e0b4d2e-73d2-4563-b52f-7e7da073188e-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('231', 'សៀវភៅ​មូលដ្ឋាន​នៃ​សូរវិទ្យា សន្ទតាវិទ្យា និង​វិជ្ជា​សន្ដាន', '24-Aug-2016', '0BxYRX7DKrlC4d3pLZV9QMkZyZHM', null, null, null, 'សៀវភៅ​មូលដ្ឋាន​នៃ​សូរវិទ្យា សន្ទតាវិទ្យា និង​វិជ្ជា​សន្ដាន', '3', '2', '2', '2', '/resources/static/img/thumbnails/ff8109a0-88b2-481c-ab9a-748d2764c505-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('232', 'សៀវភៅ​ស្តង់​ដា​អំណាន​ថ្នាក់ទី២', '24-Aug-2016', '0BxYRX7DKrlC4SDhVbmVBdldoSE0', null, null, null, 'សៀវភៅ​ស្តង់​ដា​អំណាន​ថ្នាក់ទី២', '3', '2', '2', '2', '/resources/static/img/thumbnails/70112aa8-52a1-4f32-9dc6-f6f51e3fa537-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('233', 'រដ្ឋបាលសាធារណៈ', '25-Aug-2016', '0BxYRX7DKrlC4dlRIbDZ2NzlFbW8', null, null, '6', 'រដ្ឋបាលសាធារណៈ ខាំ សុមករា', '1', '2', '12', '53', '/resources/static/img/thumbnails/b1b89e8f-26ff-45c7-80ce-d67dd9e6b696-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('234', '1-Introduction Angular JS', '25-Aug-2016', '1aV4B1CiKhdPg72UH_uplmimhBBTQ9W-JY3aF-t_ETfw', null, null, null, 'Introduction Angular JS', '1', '1', '2', '63', '/resources/static/img/thumbnails/47bb7c61-e45e-4bb1-a8d4-4117f502ed67-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('235', '2-Model View Controller Angular JS', '25-Aug-2016', '1uaBhmWfffhyI7Krwg0f8QNrJE8Xgb3bUe44VfHrm0RE', null, null, null, 'Model View Controller Angular JS', '1', '1', '2', '63', '/resources/static/img/thumbnails/cac95a6f-61b2-496a-92db-046413fbe755-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('236', '3-Data-Binding Angular JS', '25-Aug-2016', '1yCkFj-peDQ4qgBYeIfT0FJWb4OegSfzzDuV5kL9_gz4', null, null, null, 'Data-Binding Angular JS', '1', '1', '2', '3', null, 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('237', '4-Common-directive Angular JS', '25-Aug-2016', '10BhQLXP_fyiX3XiNKofgS0PoAo2V6BcUgteXWvoMKFE', null, null, null, 'Common-directive Angular JS', '1', '1', '2', '3', '/resources/static/img/thumbnails/c9e1d8de-bddd-4914-bf38-f7c127c56406-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('238', '5-Filter Angular JS', '25-Aug-2016', '1jNC5qwy8Wz_eXtW4xM5_z04IRqZCiJNjqRKrUfOUWqk', null, null, null, '5-Filter Angular JS', '1', '1', '2', '63', '/resources/static/img/thumbnails/2b496897-5b1a-4789-900a-0c61fd0e881d-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('239', '6-Repeat Angular JS', '25-Aug-2016', '1qxFs1r6kglqYyy86CKL4aYQCLxmahaAV8Fy5WQH6i70', null, null, null, 'Repeat Angular JS', '1', '1', '2', '63', '/resources/static/img/thumbnails/54287c63-eea6-46d0-bcf8-c03593cede20-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('240', '7-AngularJs_Ajax Angular JS', '25-Aug-2016', '1lte4Jg_7PokOX17ByzizdKegJNaga0ia5IXN8lGUcF0', null, null, null, 'AngularJs_Ajax Angular JS', '1', '1', '2', '63', '/resources/static/img/thumbnails/0fe09e9f-1ef0-4433-a066-a3c568d92b4c-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('241', 'Java Servlet', '25-Aug-2016', '1ON1vH0S7ri5lxkPu_OxGcrBWPHz5O8IxcO9ZJZ4l52E', null, null, null, 'Java Servlet Programming Langage', '1', '1', '2', '63', '/resources/static/img/thumbnails/4f4dad26-2084-4e1b-a80c-d6e055b4b5c9-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('242', 'JSTL & EL', '25-Aug-2016', '1UZUQE-39OTIeuTBQ1z4nJj-AouLZSs63mqwFeyoGtGI', null, null, null, 'Java  JSP Web Development JSTL & EL Programming langage', '1', '1', '2', '62', '/resources/static/img/thumbnails/81e8a1bb-f80a-4d61-ac07-2409153052ec-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('243', 'Java 8 Presentation', '25-Aug-2016', '1V_28zOwQN9GtVB-aob3acipTYhyGWZW8jFkZ0mnHLnE', null, null, null, 'Java 8 Presentation at KSHRD', '1', '1', '2', '63', '/resources/static/img/thumbnails/e7d54d74-e808-4334-a5be-214d4b184939-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('244', 'Java New DateTime API', '25-Aug-2016', '1xfgpLhPc8QgHcv0RYlSOLa-T_27eCoaUx1M5R5dYe1I', null, null, '2', 'Java New DateTime API Programming', '1', '1', '2', '63', '/resources/static/img/thumbnails/1fdd4232-ec45-491b-bb9f-60b26fe606ff-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('245', 'Java - Collection', '25-Aug-2016', '1aHo0ZVSfxq6C_zEHoGdw1uCmkl-Ey8HlI9IO2Tn5Jgo', null, null, null, 'Java - Collection Programming', '1', '1', '2', '63', '/resources/static/img/thumbnails/1809ae94-5ce5-4070-bde8-60f97c66e6c8-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('246', 'Java HasSet & TreeSet', '25-Aug-2016', '1HVNz1UYwkH7Yuh-fJbb67qlOWYzsglJ1xcT8SLA8Cec', null, null, null, 'Java HasSet & TreeSet Programming', '1', '1', '2', '63', '/resources/static/img/thumbnails/13d4fbec-4540-426a-8d7d-b21879c288e9-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('247', 'Java Fundamental ArrayList', '25-Aug-2016', '1C3VqHstIpZiUL1qn2lkKDxYplIVrA1d_rW7YU6SYqCk', null, null, null, 'Java Fundamental ArrayList', '1', '1', '2', '63', '/resources/static/img/thumbnails/5509c399-1f72-48a0-bba3-c0e8f984e6d5-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('248', 'Java JDBC', '25-Aug-2016', '1-JJshywDZG_q9xCIH5UjAZNzU6rM7G9Z1zDcLjw5cUM', null, null, null, 'Java JDBC', '1', '1', '2', '63', '/resources/static/img/thumbnails/3fdd2c99-916d-4228-961d-672938352358-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('249', 'Java Thread', '25-Aug-2016', '1PA-GcWDrDAcrcKSD0HhQLKwJ66pdAb_IoThILNn8dHg', null, null, null, 'Java Thread', '1', '1', '2', '63', '/resources/static/img/thumbnails/5bfcaf59-8ed0-4405-b837-5016e8c8a64b-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('250', 'Java Sleep and Joinaaa', '25-Aug-2016', '1XV68Ofgn7sfUN7fuMxz2Z2993ieVHmq_V3m0l1ormhI', null, null, '3', null, '3', '1', '3', '63', '/resources/static/img/thumbnails/fbc697c9-428c-4784-bd4a-a7479e36fd52-thumbnail.png', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('251', 'Sleep and Join Java Programming', '25-Aug-2016', '1aWu0qUllya-w6DYI5Dh1UYXCVp3y6dtFsh_nCf2uNYg', null, null, null, 'Sleep and Join Java Programming', '1', '1', '2', '63', '/resources/static/img/thumbnails/71ecd317-4473-4e61-a498-f8083bdd52b9-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('252', 'Java Exception', '25-Aug-2016', '1MzGUVX4KOVaWMae31IXZBi8AW4FjW8u9RyaKBr_ckqA', null, null, '2', 'Java Exception', '1', '1', '2', '63', '/resources/static/img/thumbnails/6b900ee4-b804-4da5-bc1b-345c6db2a32d-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('253', 'Java Currency, Random, Stack', '25-Aug-2016', '0BxYRX7DKrlC4STdCNUtGWEMzY0k', null, null, '1', 'Java Currency, Random, Stack', '1', '2', '2', '63', '/resources/static/img/thumbnails/d53e8ff7-5343-45a1-a2f5-e6eb1029f046-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('254', 'Java.Lang Package(Presentation) SR 3', '25-Aug-2016', '1bNZGNzuaifL7me_3kimD6bhobxPulN3a8PatKXXlKVQ', '1', null, '8', 'Java.Lang Package(Presentation) SR 3', '1', '1', '2', '63', '/resources/static/img/thumbnails/0b362673-a11e-4f4e-bb14-9bc0d24032e5-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('255', 'Java Read_Write File', '25-Aug-2016', '1Ckem4ZrH0ZhA903hbznwXlzdwGG86AJOmhjTkVFtnzE', null, null, '2', 'Java Read_Write File', '1', '1', '2', '63', '/resources/static/img/thumbnails/cc3c2002-a4fd-4884-825f-85dff7b85363-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('256', 'Java serialization, randomaccessfile', '25-Aug-2016', '1LfrOYjEd4cObF9Qbo1dIovvk9cn7WuICxVMMH--TZaI', null, null, null, 'Java serialization, randomaccessfile', '1', '1', '2', '63', '/resources/static/img/thumbnails/64edb7ba-276a-44de-b2b0-58cc77bef7a2-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('257', 'serialization, randomaccessfile', '25-Aug-2016', '1T4n7GvX9P723AzuXGHwdRsarWKdHmaUdcysW40qkv_4', null, null, '1', 'serialization, randomaccessfile', '1', '1', '2', '63', '/resources/static/img/thumbnails/af839ab0-cf34-4ba9-a6d0-ca5e956d6b81-thumbnail.PNG', null);
INSERT INTO "public"."ksl_document" VALUES ('258', 'Java File IO', '25-Aug-2016', '1c45UZEPmCRO_USma_6kI4VtL8m7BkViXzPAJzsV9CAk', null, null, '4', 'Java File IO', '1', '1', '2', '63', '/resources/static/img/thumbnails/001cf425-a095-4d76-a58f-c4fe10b9acad-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('259', 'JavaOOP-Presentation', '25-Aug-2016', '1Ldqgxbpk5YGJ9ZlgR-Tk4Rpm4mnVk76ECMjOC2uqY7E', null, null, '1', 'JavaOOP-Presentation Programming langauge', '3', '1', '2', '63', '/resources/static/img/thumbnails/3902152e-dbce-4ed2-a0f0-ef83c8de1f3e-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('260', 'Object Oriented Programming', '25-Aug-2016', '1Zs1NGxZQD4nyaOZjP1o_sf3M0jaTe8af2rpxoLtOjpM', null, null, '1', 'Java Object Oriented Programming langage', '1', '1', '2', '63', '/resources/static/img/thumbnails/43ac8af2-8912-4d8b-bcf8-5347ebd92bbb-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('261', 'Java Fundamental', '25-Aug-2016', '1wHKtqbMHpMkXkwYf3fvkpgGmCKIZdEICRMjrB_hxmRU', null, null, '12', 'Java Fundamental Programming language', '1', '1', '2', '63', '/resources/static/img/thumbnails/c3dfb394-1847-4d3c-9b70-71490ca6e621-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('262', 'Java Method, Class and Object', '25-Aug-2016', '1bLeWLE8zzghFsy5POnmEaVWGm-l5xpk93gRZ8cwL9Rk', '1', null, '12', 'Java Method, Class and Object programming language', '1', '1', '2', '63', '/resources/static/img/thumbnails/2039db7c-6b7c-433f-9e02-661746ce7a51-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('263', 'Java  Implicit Objects Programming langauge', '25-Aug-2016', '17IM3Qn1YZFFZ-Vo8VAPXcAt3t7mJ2fIPDQiiOqnd2Y0', null, null, '14', 'Implicit Objects', '1', '1', '2', '5', '/resources/static/img/thumbnails/3a717800-6116-4c9c-8155-aa281dce78dc-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('265', 'ភាសារកូរ៉េថ្នាក់ដំបូង', '25-Aug-2016', '1FuTpIGRwWIz9GnvF9apWDGUNT2li-BrOtcSy1ZkwJ0k', '48', null, '34', 'ភាសារកូរ៉េថ្នាក់ដំបូង', '1', '1', '2', '45', '/resources/static/img/thumbnails/ae087878-deb0-4ca9-9f6d-4e94fd684e88-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('266', 'ភាសារកូរ៉េថ្នាក់ដំបូង', '25-Aug-2016', '0BxYRX7DKrlC4akNOOUlFeHMxWUE', '212', null, '96', 'ភាសារកូរ៉េថ្នាក់ដំបូង', '1', '2', '2', '45', '/resources/static/img/thumbnails/03f70f99-96c8-4c54-bff7-34694096b22d-thumbnail.PNG', 'http://www.khmeracademy.org/');
INSERT INTO "public"."ksl_document" VALUES ('272', 'java-ee', '01-Sep-2016', '0BxYRX7DKrlC4MXFrV1RvWERaOEk', null, null, '12', null, '1', '2', '1', '63', '/resources/static/img/thumbnails/2f924de0-3295-4aa6-bb20-6622ef0bd8c0-thumbnail.png', 'khmeracademy.com');
INSERT INTO "public"."ksl_document" VALUES ('273', 'Project Plan Presentation', '01-Sep-2016', '1OsSUgxCZ_2Nibfm3mjSiC6UkO1fdyonhTWEkIxcnHJg', null, null, null, null, '1', '1', '1', '2', '/resources/static/img/thumbnails/f2ebf891-2097-450a-bdb1-c5bdd38c4fee-thumbnail.png', null);
INSERT INTO "public"."ksl_document" VALUES ('274', 'testing', '01-Sep-2016', '0BxYRX7DKrlC4S0JiMmwxcEJ0OGs', null, null, null, null, '1', '2', '1', '1', '/resources/static/img/thumbnails/de915b3a-cb8b-4361-9669-2e747953faad-thumbnail.png', null);
INSERT INTO "public"."ksl_document" VALUES ('276', 'dafasdsa', '29-May-2017', '', null, null, '2', 'asdsad', '1', '2', '42', '2', '/resources/static/img/thumbnails/c8452005-7a9c-4418-ba69-8cbb0cbf569c-thumbnail.jpg', 'asdsad');

-- ----------------------------
-- Table structure for ksl_save_doc
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_save_doc";
CREATE TABLE "public"."ksl_save_doc" (
"sd_id" int4 DEFAULT nextval('ksl_save_doc_sd_id_seq'::regclass) NOT NULL,
"sl_id" int4,
"doc_id" int4,
"status" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_save_doc
-- ----------------------------
INSERT INTO "public"."ksl_save_doc" VALUES ('9', '18', '3', '1');
INSERT INTO "public"."ksl_save_doc" VALUES ('10', '18', '3', '3');
INSERT INTO "public"."ksl_save_doc" VALUES ('11', '19', '266', '1');
INSERT INTO "public"."ksl_save_doc" VALUES ('12', '20', '262', '1');

-- ----------------------------
-- Table structure for ksl_save_list
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_save_list";
CREATE TABLE "public"."ksl_save_list" (
"sl_id" int4 DEFAULT nextval('ksl_save_list_sl_id_seq'::regclass) NOT NULL,
"sl_name" text COLLATE "default",
"saved_date" text COLLATE "default",
"status" int4,
"user_id" int4,
"description" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_save_list
-- ----------------------------
INSERT INTO "public"."ksl_save_list" VALUES ('18', 'math', '19-Aug-2016', '1', '1', 'math');
INSERT INTO "public"."ksl_save_list" VALUES ('19', 'korean', '25-Aug-2016', '1', '1', 'korean');
INSERT INTO "public"."ksl_save_list" VALUES ('20', 'MySaveList', '25-Aug-2016', '1', '4', 'MySaveList');

-- ----------------------------
-- Table structure for ksl_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_user";
CREATE TABLE "public"."ksl_user" (
"user_id" int4 DEFAULT nextval('ksl_user_user_id_seq'::regclass) NOT NULL,
"user_name" text COLLATE "default",
"gender" text COLLATE "default",
"email" text COLLATE "default",
"password" text COLLATE "default",
"registered_date" text COLLATE "default",
"photo" text COLLATE "default",
"description" text COLLATE "default",
"status" int4,
"role_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_user
-- ----------------------------
INSERT INTO "public"."ksl_user" VALUES ('1', 'ឃួន​ សុវណ្ណវត្តី', 'ស្រី', 'vateykhuon@gmail.com', '$2a$10$N76ers9FHhPQ5yyFfh2MAeSOuwwcKYgf5ml/l.Gfl3rIqes8ElDlq', '19-Aug-2016', '/resources/static/img/users/a23ae199-f9ac-495a-995c-edee4e5c01ef-thumbnail.jpg', 'Admin', '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('2', 'នេម​ សុធា', 'ប្រុស', 'nemsothea@gmail.com', '$2a$10$AKNtSll894.aaMrcBTnD7uXU6FoMmIGKJlYkHGKhOes31JW94NgxO', '19-Aug-2016', '/resources/static/img/users/2572ddd1-7feb-49f0-aa91-15e5cd7dd9ca-thumbnail.jpg', null, '1', '1');
INSERT INTO "public"."ksl_user" VALUES ('3', 'ចាន់ ណារិទ្ធ', 'ប្រុស', 'bongchannarith@gmail.com', '$2a$10$98q6728db.dHVbPX1oSC.uxv/n3sFkA54EHtyyxXTnBlbRskyCiXG', '19-Aug-2016', '/resources/static/img/users/ce49032d-311a-49d4-ab61-7b6edf1f7a63-thumbnail.jpg', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('4', 'ឆៃ​ ជីវ័ន្ដ', 'ប្រុស', 'chhaichivon1995@gmail.com', '$2a$10$AhfgVh.prs/ZObSbI9DtFegHdrJnPAcPWchQGwBn6ayUzXjFmQ3Vq', '19-Aug-2016', '/resources/static/img/users/8bc0480c-b22c-4999-8bf4-16ecb7d75648-thumbnail.jpg', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('8', 'មាស ថ្លៃ', 'ប្រុស', 'measthlay@gmail.com', '$2a$10$pyRQG0SGYBpQUnyTRzlZrOqxnz93tB0FUF29av7kt3iodNqnTzHNq', '2016-08-23', '...', null, '3', '2');
INSERT INTO "public"."ksl_user" VALUES ('12', 'មាន ភាព', 'ប្រុស', 'mean@mail.com', '$2a$10$1yg253SviWKYK3fEpbpx2uwmkhZZX.fS5cz9UwVFXr0opoqSSprRW', '2016-08-25', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('14', 'អាវី', 'ស្រី', 'cheavykhuon@gmail.com', '$2a$10$/A79OvHXCmmknDYSIQMCaefvi1qadeJSd0UB/tgqgmefiTPxi6QW2', '26-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('15', 'សោ សុភាថារី', 'ស្រី', 'facebook@gmail.com', '$2a$10$ksCMp/jVtlaeicPA0drNk.tV.rzVUwP5b6/bUfNqd1bwVRiS4zLP6', '26-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('23', 'chhunly', 'ប្រុស', 'chhunly@gmail.com', '$2a$10$5BT5hIgbHsJmw1tavZBJA.mK6xA00Q8jN491Rhva/DaLAZbrekvpe', '26-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('24', 'CHIVON CHHAI', 'ប្រុស', 'chivonchhai@hotmail.com', '$2a$10$BSInvP8ggKECSuSmJkK8meykElZzkEkbXAdBK95naP.qdpZDVmx/O', '26-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('28', 'Eath Manith', 'ស្រី', 'eathmanith@gmail.com', '$2a$10$XFjwwnG2BcyBSOaZHl5p8eT1vSygo30VdsooIbqsw0blUfYcRgtOy', '26-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('33', 'Eath Manith', 'ស្រី', 'eathmanith@gmail.com', '$2a$10$mUFqvh/kYVpGBy7DP.gx5.JUqmuJ7B5mEvCgVHcK3b86OCFTP..AS', '26-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('38', 'មាស​ ម៉េងទ្រី', 'ប្រុស', 'measmengtry@yahoo.com', '$2a$10$ROhHXOQCHcgEbgPcuZ0D2eGYf9bz7uA96aLbpe5CTH6keHVoLyay2', '27-Aug-2016', '/resources/static/img/users/default-user-image.png', null, '1', '2');
INSERT INTO "public"."ksl_user" VALUES ('42', 'chhaichivon', 'ប្រុស', 'chhaichivon@gmail.com', '$2a$10$J2sZ3ETp/OPAZiGVnAjZr.3WEF6FnzUWee5WJOZGGHQyiznMZQ30C', '26-May-2017', '/resources/static/img/users/default-user-image.png', null, '1', '2');

-- ----------------------------
-- Table structure for ksl_user_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_user_type";
CREATE TABLE "public"."ksl_user_type" (
"role_id" int4 DEFAULT nextval('ksl_user_type_role_id_seq'::regclass) NOT NULL,
"role_name" text COLLATE "default",
"status" int4,
"description" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_user_type
-- ----------------------------
INSERT INTO "public"."ksl_user_type" VALUES ('1', 'ROLE_ADMIN', '1', 'Administrator Role');
INSERT INTO "public"."ksl_user_type" VALUES ('2', 'ROLE_USER', '1', 'User Role');

-- ----------------------------
-- Table structure for ksl_view_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."ksl_view_history";
CREATE TABLE "public"."ksl_view_history" (
"vh_id" int4 DEFAULT nextval('ksl_view_history_vh_id_seq'::regclass) NOT NULL,
"added_date" text COLLATE "default",
"user_id" int4,
"doc_id" int4,
"status" int4,
"description" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of ksl_view_history
-- ----------------------------
INSERT INTO "public"."ksl_view_history" VALUES ('190', '30-Aug-2016', '3', '6', '1', '30-Aug-2016');
INSERT INTO "public"."ksl_view_history" VALUES ('191', '30-Aug-2016', '3', '262', '1', '30-Aug-2016');
INSERT INTO "public"."ksl_view_history" VALUES ('223', '01-Sep-2016', '1', '272', '3', '01-Sep-2016');
INSERT INTO "public"."ksl_view_history" VALUES ('224', '01-Sep-2016', '1', '65', '3', '01-Sep-2016');
INSERT INTO "public"."ksl_view_history" VALUES ('234', '01-Sep-2016', '1', '266', '3', '01-Sep-2016');
INSERT INTO "public"."ksl_view_history" VALUES ('235', '01-Sep-2016', '4', '262', null, '01-Sep-2016');
INSERT INTO "public"."ksl_view_history" VALUES ('247', '29-May-2017', '42', '276', null, '29-May-2017');
INSERT INTO "public"."ksl_view_history" VALUES ('248', '29-May-2017', '42', '276', null, '29-May-2017');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."ksl_category_cat_id_seq" OWNED BY "ksl_category"."cat_id";
ALTER SEQUENCE "public"."ksl_comment_cmt_id_seq" OWNED BY "ksl_comment"."cmt_id";
ALTER SEQUENCE "public"."ksl_document_doc_id_seq" OWNED BY "ksl_document"."doc_id";
ALTER SEQUENCE "public"."ksl_save_doc_sd_id_seq" OWNED BY "ksl_save_doc"."sd_id";
ALTER SEQUENCE "public"."ksl_save_list_sl_id_seq" OWNED BY "ksl_save_list"."sl_id";
ALTER SEQUENCE "public"."ksl_user_type_role_id_seq" OWNED BY "ksl_user_type"."role_id";
ALTER SEQUENCE "public"."ksl_user_user_id_seq" OWNED BY "ksl_user"."user_id";
ALTER SEQUENCE "public"."ksl_view_history_vh_id_seq" OWNED BY "ksl_view_history"."vh_id";

-- ----------------------------
-- Uniques structure for table ksl_category
-- ----------------------------
ALTER TABLE "public"."ksl_category" ADD UNIQUE ("cat_name");

-- ----------------------------
-- Primary Key structure for table ksl_category
-- ----------------------------
ALTER TABLE "public"."ksl_category" ADD PRIMARY KEY ("cat_id");

-- ----------------------------
-- Primary Key structure for table ksl_comment
-- ----------------------------
ALTER TABLE "public"."ksl_comment" ADD PRIMARY KEY ("cmt_id");

-- ----------------------------
-- Primary Key structure for table ksl_document
-- ----------------------------
ALTER TABLE "public"."ksl_document" ADD PRIMARY KEY ("doc_id");

-- ----------------------------
-- Primary Key structure for table ksl_save_list
-- ----------------------------
ALTER TABLE "public"."ksl_save_list" ADD PRIMARY KEY ("sl_id");

-- ----------------------------
-- Primary Key structure for table ksl_user
-- ----------------------------
ALTER TABLE "public"."ksl_user" ADD PRIMARY KEY ("user_id");

-- ----------------------------
-- Uniques structure for table ksl_user_type
-- ----------------------------
ALTER TABLE "public"."ksl_user_type" ADD UNIQUE ("role_name");

-- ----------------------------
-- Primary Key structure for table ksl_user_type
-- ----------------------------
ALTER TABLE "public"."ksl_user_type" ADD PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table ksl_view_history
-- ----------------------------
ALTER TABLE "public"."ksl_view_history" ADD PRIMARY KEY ("vh_id");

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_category"
-- ----------------------------
ALTER TABLE "public"."ksl_category" ADD FOREIGN KEY ("user_id") REFERENCES "public"."ksl_user" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_comment"
-- ----------------------------
ALTER TABLE "public"."ksl_comment" ADD FOREIGN KEY ("user_id") REFERENCES "public"."ksl_user" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ksl_comment" ADD FOREIGN KEY ("doc_id") REFERENCES "public"."ksl_document" ("doc_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_document"
-- ----------------------------
ALTER TABLE "public"."ksl_document" ADD FOREIGN KEY ("cat_id") REFERENCES "public"."ksl_category" ("cat_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ksl_document" ADD FOREIGN KEY ("user_id") REFERENCES "public"."ksl_user" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_save_doc"
-- ----------------------------
ALTER TABLE "public"."ksl_save_doc" ADD FOREIGN KEY ("doc_id") REFERENCES "public"."ksl_document" ("doc_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ksl_save_doc" ADD FOREIGN KEY ("sl_id") REFERENCES "public"."ksl_save_list" ("sl_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_save_list"
-- ----------------------------
ALTER TABLE "public"."ksl_save_list" ADD FOREIGN KEY ("user_id") REFERENCES "public"."ksl_user" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_user"
-- ----------------------------
ALTER TABLE "public"."ksl_user" ADD FOREIGN KEY ("role_id") REFERENCES "public"."ksl_user_type" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ksl_view_history"
-- ----------------------------
ALTER TABLE "public"."ksl_view_history" ADD FOREIGN KEY ("user_id") REFERENCES "public"."ksl_user" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."ksl_view_history" ADD FOREIGN KEY ("doc_id") REFERENCES "public"."ksl_document" ("doc_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
