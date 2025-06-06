/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: FFS
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `open_time` varchar(100) NOT NULL,
  `main_image_url` varchar(255) DEFAULT NULL,
  `kakao_id` varchar(50) NOT NULL,
  `rating` double DEFAULT NULL,
  `location_tag` enum('정문','후문','기타') DEFAULT '기타',
  `is_new` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kakao_id` (`kakao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES
(1,'영미오리탕 군자점','한식',NULL,'서울 광진구 동일로60길 53','02-463-5222','11:00~21:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2FE8D6561C514342F8BBF42ADB9DB6B09F','8476706',4,'기타',0),
(2,'미식일가','한식',NULL,'서울 광진구 광나루로19길 9','010-5603-9282','11:00~23:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2FAA17732ED3594505BA9060272EADB00B','27229361',4.1,'정문',0),
(3,'카레당','한식',NULL,'서울 광진구 능동로 251','02-464-4022','10:50~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F27d5f71995d4b1ced5faf83a77115e845f8f91b2%3Foriginal','1309119533',4.4,'후문',0),
(4,'마당족발','한식',NULL,'서울 광진구 능동로 173','02-468-3030','11:20~23:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2FF0F78AD57D324E7FBE151B2D792B3039','7866034',3.9,'정문',0),
(5,'소사면옥','한식',NULL,'서울 광진구 능동로 270','02-447-0904','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2F26B811F23A93468CAC26B70859D5B703','713564462',3.8,'기타',0),
(6,'섬진강풍천장어직판장','한식',NULL,'서울 광진구 동일로 190','02-469-6700','11:00~21:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9c23689330b90bdde7e916d06665f7dcf2227403%3Foriginal','818553746',3.6,'기타',0),
(7,'남한강민물매운탕','한식',NULL,'서울 광진구 동일로 150','02-464-7568','11:30~22:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F78bf08fc6762d28e146d077022b1297ae0082e3a%3Foriginal','12792556',3.8,'기타',0),
(8,'군자오리촌','한식',NULL,'서울 광진구 능동로35길 18-1','02-466-7962','11:00~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffe0eb6bf792c8c9b01f33dad97337203e0235721%3Foriginal','12752579',4.3,'기타',0),
(9,'진한방삼계탕 군자점','한식',NULL,'서울 광진구 능동로 254','02-455-6020','10:30~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9c9d2b4ecb189a566715d3cba3db3bbba6489216%3Foriginal','10086088',3.9,'기타',0),
(10,'또래끼리','한식',NULL,'서울 광진구 군자로 103','02-469-6684','10:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F7a2dac26d98901ecfd284cd8ec30fe6354d90d17%3Foriginal','19183006',3.5,'후문',0),
(11,'빠오즈푸','중식',NULL,'서울 광진구 광나루로 373','02-462-9256','11:30~20:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2F457F5A5E546344DA80A793AF02EBC395','15101449',3.9,'정문',0),
(12,'시옌 건대점','중식',NULL,'서울 광진구 능동로 137-8','02-498-2280','11:00~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe1dca90d84977931e680f6a3d55b003d5fe4bce3%3Foriginal','7971958',4,'기타',0),
(13,'세종원 군자본점','중식',NULL,'서울 광진구 광나루로 373','02-499-1800','10:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fplace%2FA830A3A7A0AD46DA8456BEB06A6FA99A','21328608',4.5,'정문',0),
(14,'춘선만두','중식',NULL,'서울 광진구 군자로 101','02-466-4398','09:30~22:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Ffc3b60ff38431f47c1aae62b75ba135495b78187%3Foriginal','88370014',4.6,'후문',0),
(15,'석기시대짜장마을','중식',NULL,'서울 광진구 군자로 111','02-467-7123','10:00~20:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F2326ee51c1d18c097dadfaf6f394b62f51749360%3Foriginal','14078155',4.4,'후문',0),
(16,'맛이차이나','중식',NULL,'서울 광진구 동일로 224','02-462-3688','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9e52e33207fd76042c2e268fb9ddb639c3241b1d%3Foriginal','480500306',4.3,'후문',0),
(17,'시홍쓰','중식',NULL,'서울 광진구 능동로17길 5','010-8680-4330','11:30~20:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2F855E6FA5173E48F19495DE5A9E810AD5','1736699136',4.6,'정문',0),
(18,'녹원양꼬치','중식',NULL,'서울 광진구 동일로30길 39','02-464-3203','14:00~01:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fd7ea100c43e1f7fdceb1e387c1871ffffa0b1710%3Foriginal','19033177',4.2,'기타',0),
(19,'명장짬뽕 본점','중식',NULL,'서울 광진구 능동로 276','02-456-5688','11:00~21:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2F9ADAD9D60A78445B9D707BBB987A92A1','1198232127',4.4,'기타',0),
(20,'화원식당','중식',NULL,'서울 광진구 능동로16길 56-6','02-454-1888','10:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F6ee9a9e646d4f9fdb55f1e2e87a618dbedbfcf23%3Foriginal','21232416',4.5,'기타',0),
(21,'스위트앤카츠 화양직영점','일식',NULL,'서울 광진구 광나루로17길 14','02-467-0053','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fc0cd131cb14e874c0a3ce6b0162f1ae31d8bbec7%3Foriginal','26602338',3.6,'정문',0),
(22,'이이요','일식',NULL,'서울 광진구 능동로32길 6','02-3437-2225','11:50~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fa17d8ca41a89c936733a6716485dc161fe6058d5%3Foriginal','861945610',4.2,'기타',0),
(23,'오코노미야키식당하나','일식',NULL,'서울 광진구 능동로13길 111','02-469-8884','17:00~22:45','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2FCE53658E784346ABA4A4F433514343DA','1441425449',4.6,'기타',0),
(24,'마리모','일식',NULL,'서울 광진구 면목로 22-1','02-462-4186','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F23cee87b45b94d2e74073693ca4d7bf7aee4d6f4%3Foriginal','1689661423',4.1,'기타',0),
(25,'우마이도 건대점','일식',NULL,'서울 광진구 능동로 135-2','02-467-8788','11:30~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2F94F340ACD0484620BEC150568B963F20','8029124',3.8,'기타',0),
(26,'가츠시 건대점','일식',NULL,'서울 광진구 광나루로 418','02-444-2355','11:00~21:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9770a4fec9d922a7a1d1208552e28fb65f4b1290%3Foriginal','1277643944',4.5,'정문',0),
(27,'스시붐','일식',NULL,'서울 광진구 광나루로17길 14-5','02-466-6077','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fb21a0858d78082112a5e8abdaa3aed4d7e7e88c4%3Foriginal','22213803',3.7,'정문',0),
(28,'요마시','일식',NULL,'서울 광진구 천호대로102길 7','02-468-8788','11:00~20:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F83b6143e502d7953a36888ea7ca08884057ad063%3Foriginal','680889265',4.5,'기타',0),
(29,'무한정수제돈까스 군자점','일식',NULL,'서울 광진구 군자로 102','02-469-3122','11:00~20:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2FD9467830200A43BF9EC3AA4972B808D3','19949522',4.4,'후문',0),
(30,'포비','일식',NULL,'서울 광진구 동일로26길 57','02-497-8555','16:00~23:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe50a7cef5dc3a6d1a6f0d9698826b3720ad825bf%3Foriginal','1873080066',3.5,'기타',0),
(31,'래빗홀버거','양식',NULL,'서울 광진구 광나루로 424','02-446-0424','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F20b0982ad1950db2a0aa5311ddc489a5dff29e8e%3Foriginal','1624333045',4.4,'정문',0),
(32,'호파스타 건대본점','양식',NULL,'서울 광진구 군자로3길 23','0507-1486-1008','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2FF90B7713D29B4CD6A628DAC683A27086','1137599191',3.9,'기타',0),
(33,'마초쉐프 건대점','양식',NULL,'서울 광진구 능동로 125','02-497-8886','11:30~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fd327fea532b767646352a2bc616d7c7d46d071b1%3Foriginal','1359276887',3.5,'기타',0),
(34,'수퍼슬라이더스','양식',NULL,'서울 광진구 능동로13길 50','02-6397-7186','11:30~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Ffiy_reboot%2Fplace%2FBE6FFA1D89FA4601834416646DA09660','1093085311',4.7,'기타',0),
(35,'피자컴퍼니 군자점','양식',NULL,'서울 광진구 능동로32길 12','02-454-2496','12:00~23:35','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F9c8b4c1aed41aba570b556ce13d0d94a78a748c9%3Foriginal','420036887',4.1,'기타',0),
(36,'C156','양식',NULL,'서울 광진구 동일로 156','02-499-8619','12:00~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fa14a92a888f1e4741c8c078446e5da032d83f5de%3Foriginal','684838721',3.9,'기타',0),
(37,'찬스불고기부리또 군자점','양식',NULL,'서울 광진구 군자로 76','02-469-8255','09:40~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=https%3A%2F%2Fpostfiles.pstatic.net%2FMjAyNTA1MDdfMTg5%2FMDAxNzQ2NjA2NzY3Njc4.RMhXqQ4-7zr_fecpVCoEaQo9mSWUMmDdyExvnE-hZXUg.gsRz6P4m8akyzd8VVhLrD8rsdLgdd5-XUZE-pOTmjsUg.JPEG%2FKakaoTalk_20250507_17','297705525',4.5,'정문',0),
(38,'모모스테이크 건대점','양식',NULL,'서울 광진구 능동로13길 10','0507-1450-8048','11:00~21:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2Fe44f35929491f59b546977185a1839ea32505e6d%3Foriginal','26844606',4.4,'기타',0),
(39,'피자스쿨 세종대점','양식',NULL,'서울 광진구 군자로 76','02-467-0038','11:00~22:30','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocal%2FkakaomapPhoto%2Freview%2F8ffe98b41b21d4158264d61e94465e7418aad90e%3Foriginal','8136225',4.7,'정문',0),
(40,'라칸티네','양식',NULL,'서울 광진구 능동로 282','02-455-7893','11:00~22:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2FDD46AC244F664445B44839ADDFEB81DB','720925756',4,'기타',0),
(68,'연필','카페','연필 緣苾. 인연 연, 향기로울 필. 인연이 피어 향기로운 공간입니다. 다양한 맛있는 디저트와 깊은 향의 커피','서울 광진구 면목로 12 1층 102호','0502-5552-2000','11:00~20:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20230212_231%2F1676154913718sctjy_JPEG%2FScreenshot_20230212_073124_Instagram.jpg','1107844606',4.9,'후문',0),
(69,'보난자커피 군자점','카페','넓은 공간에서 즐기는 맛있는 커피 디저트','서울 광진구 능동로 239-1 B동 1층','070-4110-3113','09:00~12:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220518_58%2F1652861247773Dike6_JPEG%2F_MG_4177.JPG','1928816021',3.2,'정문',0),
(70,'온더','카페','맛있는 베이커리와 디저트의 세계','서울 성동구 광나루로 315 1층','0507-1399-5009','11:30~18:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240405_126%2F17123094874606EjQc_JPEG%2FIMG_8625.jpeg','1200324266',4.5,'기타',0),
(71,'책방고즈넉','카페','책방고즈넉은 카페이자 공간입니다. 아늑한 분위기와 아름다운 인테리어의 조화','서울 광진구 동일로60길 41-13','0507-1421-2087','11:00~22:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20241113_86%2F1731489482725x3Hw8_JPEG%2F%25B0%25ED%25C1%25EE%25B3%25CB%25C0%25FC%25B0%25E6.jpeg','337953507',4.1,'기타',0),
(72,'하츠커피','카페','HEARTS COFFEE & BAR. 낮과 밤, 언제든지 편하게 즐길 수 있는 사랑방. 커피와 술 그리고 음악.','서울 성동구 광나루로11길 7','0502-5551-3763','12:00~20:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20250325_121%2F1742892962313WVNBM_JPEG%2FIMG_0139.jpeg','2074324605',4.2,'기타',0),
(73,'카페롱','카페','넓고 쾌적한 매장에서 맛있는 음료를 즐기는 시간','서울 광진구 광나루로 360 1층','010-273-1054','09:00~02:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20191120_194%2F1574228086493aJ16d_JPEG%2FRRM9l79u3inXAQafc4iRvV_N.jpg','743085477',4.7,'기타',0),
(74,'엠케이갤러리스튜디오','카페','낮 밤 관계없이 주류 및 카페 메뉴 이용이 가능하며 편안한 저마다의 작업공간으로 조도가 어두워지는 밤 감각적으로 흔들리는 그림자들에 참여하세요.','서울 광진구 군자로 41 2층','010-7482-7277','12:00~01:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20250307_84%2F1741320804176lGpFg_JPEG%2FKakaoTalk_20250224_135623973_01.jpg','1173624689',4.8,'기타',0),
(75,'로프커피','카페','[생활의달인979회]라떼아트의 달인 카페. 한국 라떼아트 챔피언이 직접 로스팅하고 매장을 운영하고 있습니다^^!!','서울 광진구 동일로 304 1층','010-8662-5891','08:30~19:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.kakaocdn.net%2Fmystore%2F76E948AF2E5E43F69690E5F898DA186E','1191275520',4.6,'기타',0),
(76,'브렛서울','카페','어린이대공원역3번 출구에 위치한 카페입니다. 저희 카페는 수제 디저트들과 맛있는 음료들이 준비되어있으며 주차는 2시간 가능합니다!','서울 광진구 광나루로 410 1층 101호','0507-1355-4874','10:00~20:00','https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MzBfMTMg%2FMDAxNzE3MDQ4MzcxOTUz.ZM2XB-RDYJT9Vye0cUEwNxX7jy5VHcdaQT9A39t-9Agg.JeoX-X67AQHBtz2mMAxVbfMyGXlqdVh69VIVx4_V2QQg.JPEG%2FScreenshot_2024-05-30_at_14.52.47.JPG','1283573138',4.6,'정문',0),
(77,'애드앤드','카페','베이커리로 착한평을 많이 받은 카페입니다','서울 광진구 광나루로26길 28 1층','0507-1327-0718','11:00~21:00','https://img1.kakaocdn.net/cthumb/local/C544x408.q50/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flocalfiy%2F87D13057FB0A459C8A601144193BFC5A','1747710322',4.5,'기타',0),
(78,'비엣포','아시안','현지인 직접운영합니다. 베트남의 맛 그대로. 매장 공간 넓습니다.','서울 광진구 능동로 175','0507-1311-8699','11:00~22:00','https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA0MjdfMTkz%2FMDAxNzQ1NzU0NzkxNTI4.QlPszZPNxnO-KrXqsaBzUP540dGsGb8OmgcxxBul2pIg.zya7Wa2tg183b2VHSzhNdWF_PNy7lctRyIIaHZ2py3cg.PNG%2Fimage.png','934748167',4.6,'정문',0),
(79,'비에뜨반미 건대점','아시안','베트남 현지 장비와 파우더로 직접 만든 바게트와 신선한 야채로 대한민국 최고의 반미 샌드위치를 선사해 드리겠습니다.','서울 광진구 능동로17길 1','0507-1373-0412','평일: 07:00~14:20 주말: 09:00~19:20','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190223_124%2F1550917958961zO6rg_JPEG%2FsbqtnhSRC7mFtaGiepAKuf8Z.jpg','2023749025',4.4,'정문',0),
(80,'호아빈 군자역점','아시안','군자역에서 처음 쌀국수를 접하게 해드린 쌀국수와 월남쌈의 맛을 보장해드립니다..','서울 광진구 능동로 300 2층','02-457-2248','11:00~22:00','https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAxMjRfMiAg%2FMDAxNzM3NjQ3NzkwOTE1.31EsNymyLRmiEr_l_y7YStQu9vbLAhKS37ke1p_KkJYg.KDZbPfBFVDeOQlYe_3er4oHKbpNLbbgST0XD2nlz2kwg.JPEG%2F3.jpg','27258812',3.5,'기타',0),
(81,'미스사이공 세종대점','아시안','베트남 쌀국수의 대중화 선언! 쌀국수의 정통성은 더하고 고급스러운 맛은 유지하되, 부담스러운 거품가격은 걷어내어 바야흐로 쌀국수의 대중화를 선언합니다.','서울 광진구 능동로 209 세종대학교학생회관 1층','0507-1303-6976','09:00~22:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180218_300%2F1518924037061XblTI_JPEG%2FC5me-m-3LuwR85jldhrHTs-D.jpg','527561100',2.9,'정문',0),
(82,'포템템','아시안','저희는 다양한 베트남요리와 현지 느낌 제대로 살린 분위기, 현지인 셰프가 직접 조리하여 베트남보다 맛있는 식당으로 알려져 있습니다.','서울 광진구 면목로 8 1층','0507-1358-9633','11:00~21:30','https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA1MDdfMjIg%2FMDAxNzQ2NTg2MTMwMTM0.yvB4K5xkKGSuGjHZgE4E5yWT9eFewSbkTxdqTXjUTIQg.hptmlEsArYrG-9HGsprAotuPsUT_zIGDdXgXQkVEvqcg.JPEG%2FKakaoTalk_Photo_2025-05-07-11-38-59_001.jpeg','1853987571',4,'기타',0),
(83,'미분당 건대점','아시안','저희 미분당은 베트남 전통 음식인 쌀국수를 한국인들의 입맛에 맞게 재 탄생 시키고자 노력했습니다.','서울 광진구 군자로3길 27 1층','0507-1450-0397','11:00~21:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240312_21%2F1710250327869PUFrG_JPEG%2FIMG_0124.jpeg','27487909',3.4,'기타',0),
(84,'타이인플레이트','아시안','맛있는 음식을 합리적인 가격으로 즐긴다','서울 광진구 광나루로24길 15 103호','0507-1317-0086','10:30~21:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180328_84%2F15222449599264Cr8e_JPEG%2FSFp9ITgoyR2eltFbdjh8B-vo.jpg','1861745249',3.1,'기타',0),
(85,'세븐돈까스','분식','혼자라도 맛있는 먹거리 터, 세븐돈까스 입니다.','서울 광진구 동일로24길 56','02-467-3522','06:00~01:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200224_30%2F1582517308557jw9IJ_JPEG%2Fh8h5c21hynf74PaeM3LYqcco.jpeg.jpg','15560777',2.4,'기타',0),
(86,'사대분식','분식','맛있는 쫄볶이와 풍성한 식사의 즐거움','서울 광진구 능동로 197','02-466-5130','10:00~21:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190101_177%2F1546343016935IaNJd_JPEG%2F3M0ntbpstBJ2uMUOtCNEUbXj.jpg','16790512',3.9,'정문',0),
(87,'은혜즉석떡볶이','분식','추억의 맛이 그대로 남아있는 맛있는 떡볶이','서울 광진구 광나루로 381-1','02-468-7401','10:30~22:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200221_221%2F1582270411176nMkbz_JPEG%2FJtMwiXXASzJSTuU7qP9Z_fdQ.jpeg.jpg','11354357',3.1,'정문',0),
(88,'아찌떡볶이','분식','중독성 있는 맛의 맛있는 튀김','서울 광진구 아차산로29길 53','02-462-8340','11:30~19:00','https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAyMTFfMTM5%2FMDAxNzM5MjUxNDU4MzI2.6EUq2Gx0wvSKWmwA4lc9jGwBTmMAUG9RNXFoIvymuMAg.dRbzse2Rd2hbIpY-soI8P0B8K6QzUMIkhkcun9CV7gog.JPEG%2FFullSizeRender.jpg','19238595',3.4,'기타',0),
(89,'아미고프란고','분식','내부와 야외에서 음식을 드실수 있어 분위기 좋은 매장입니다.항상 맛있는 음식으로 친절하게 손님은 대하는 장소이니 언제든 찾아주시면 기분좋게 계시다 가실수 있게 노력하겠습니다','서울 광진구 능동로 168','0507-1490-1058','14:00~00:30','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20240410_68%2F17127018160155Yzjd_JPEG%2F1000001446.jpg','1816055329',3.8,'기타',0),
(90,'뉴욕떡볶이','분식','세종대,군자동 맛집 뉴욕떡볶이입니다~!','서울 광진구 군자로 105-2','0507-1461-8091','11:00~21:50','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20181225_251%2F1545676084165dmoRf_JPEG%2Fh4QygXcbf_x_edm8Z1wQDycN.jpg','27312772',4.2,'후문',0),
(91,'또또떡볶이','분식','맛에 대한 만족감으로 다음에 다시 찾고 싶은 곳','서울 광진구 능동로 183','02-467-3009','11:00~21:50','https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMjBfOTIg%2FMDAxNzA1NzIxMTM5NTAw.NX_DSAqsMSNUJmwxOzbgexZE3zayypieKqhE5DUQ0LAg.QXIphrw_p76vAAOf8QjVrM8AJT7USFykYgtdpNhM7_og.JPEG.rimmy93%2FIMG_5416.jpg','726937270',4.1,'정문',0),
(92,'세종김밥떡볶이','분식','맛있는 김밥과 합리적인 가격의 만남','서울 광진구 광나루로 375-1','02-463-3334','10:30~21:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190101_190%2F1546332252383T1CxG_JPEG%2FTDXIX8n6pMZF_AmMQZNGP3wY.jpg','1591951855',4.5,'정문',0),
(93,'디델리 세종대점','분식','신선한 재료를 사용하는 디델리입니다:)','서울 광진구 군자로 128 1층','02-498-1194','10:00~22:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20181005_147%2F1538705796294ovxSk_JPEG%2F6ywXI_z6nsOglBG-Oczw6Gzf.jpg','15669167',4.6,'후문',0),
(94,'꼽사리떡볶이','분식','맛있는 순대 냄새와 풍성한 양의 만남','서울 광진구 아차산로29길 71','02-463-2929','15:00~23:00','https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200821_62%2F1597987261148fj9oo_JPEG%2FOGK50_XNsmv4Gxyl70DH38re.jpg','914293828',2.8,'기타',0);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-03 11:46:15
