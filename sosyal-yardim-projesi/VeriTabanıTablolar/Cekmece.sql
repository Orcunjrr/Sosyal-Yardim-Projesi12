--------------------------------------------------------
--  File created - Salı-Eylül-05-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CEKMECE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CEKMECE" 
   (	"CEKMECEID" NUMBER(10,0), 
	"CEKMECEADI" VARCHAR2(255 CHAR), 
	"DURUM" VARCHAR2(255 CHAR)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.CEKMECE
SET DEFINE OFF;
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1,' 	Boşanmış','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (2,' 	Yatağa Bağımlı','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (52,' 	İkiz Çocuklu','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (102,' 	Üçüz Çocuklu','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (152,' 	Muhtaç','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (202,'Çok Muhtaç','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (252,'Eşinden Ayrı Yaşayan','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (302,'Dul','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (352,'Eşi Cezaevinde','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (402,'Normal','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (452,'Yardım İstemiyor','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (502,'Mülteci','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (552,'Yetim ve Öksüz','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (602,'Yalnız Yaşayan','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (652,'Hanımeli Çarşısı','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (702,'Asker Maaşı','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (752,'Afganistan Göçmeni','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (802,'Arnavut Göçmeni','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (852,'Özbek Göçmeni','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (902,'Değerlendirme Kurulu','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (952,'Tahkikat Ekip 1','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1002,'Tahkikat Ekip 2','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1052,'Tahkikat Ekip 3','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1102,'Tahkikat Ekip 4','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1152,'Tahkikat Ekip 5','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1202,'Azerbaycan Göçmeni','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1252,'Güncelleme','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1302,'Dosya Kapatıldı','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1352,'15 Temmuz Gazi','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1402,'15 Temmuz Şehit','Pasif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1452,' 	Sıcak Yemek','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1502,' 	Pasif Suriyeli Göçmeni','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1552,'Roman Vatandaş','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1602,'Denetimli Serbestlik','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1652,'Şiddet Mağduru','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1702,'İmam Nikahlı Evli','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1752,'Depremzede Aile','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1802,'ÇÖP EV','Aktif');
Insert into SYSTEM.CEKMECE (CEKMECEID,CEKMECEADI,DURUM) values (1852,'İSTİFÇİ','Aktif');
--------------------------------------------------------
--  DDL for Index SYS_C0012544
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C0012544" ON "SYSTEM"."CEKMECE" ("CEKMECEID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table CEKMECE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CEKMECE" MODIFY ("CEKMECEID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CEKMECE" ADD PRIMARY KEY ("CEKMECEID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
