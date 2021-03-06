
-------member_info-----------------
CREATE TABLE MEMBER_INFO
(
    MEMBER_NAME          VARCHAR2(20)    NOT NULL, 
    MEMBER_ID            VARCHAR2(20)    NOT NULL, 
    MEMBER_PW            VARCHAR2(20)    NOT NULL, 
    MEMBER_DATE          DATE            NOT NULL, 
    MEMBER_PHONE         VARCHAR2(40)    NOT NULL, 
    MEMBER_EMAIL         VARCHAR2(40)    NOT NULL, 
    MEMBER_LEVEL         VARCHAR2(20)    NOT NULL, 
    MEMBER_PI_DATE       NUMBER(1)       NOT NULL, 
    MEMBER_PI_AGG        INT             NOT NULL, 
    MEMBER_CLAUSE_AGG    INT             NOT NULL, 
    MEMBER_LOCATE_AGG    INT             NOT NULL, 
    MEMBER_MSG_AGG       INT             NULL, 
    MEMBER_EMAIL_AGG     INT             NULL, 
    MEMBER_POST_AGG      INT             NULL, 
    MEMBER_REG_DATE      DATE            NOT NULL,
    MEMBER_NUM           NUMBER          NOT NULL,
    CONSTRAINT MEMBER_INFO_ID_PK PRIMARY KEY(MEMBER_ID),
    CONSTRAINT MEMBER_INFO_NUM_UQ UNIQUE (MEMBER_NUM),
    CONSTRAINT MEMBER_INFO_PHONE_UQ UNIQUE (MEMBER_PHONE)   
);

------member_address
CREATE TABLE MEMBER_ADDRESS
(
    MEMBER_NUM        NUMBER     NOT NULL, 
    ROADFULLADDR    VARCHAR2(200)   NULL,
    ADDRESS_NUM     NUMBER  NOT NULL,
    CONSTRAINT MEMBER_ADDRESS_NUM_FK FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBER_INFO (MEMBER_NUM) ON DELETE CASCADE
);

  CREATE SEQUENCE ADDRESS_NUM_SEQ
  START WITH 1 
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE;




---------------member_num_seq

CREATE SEQUENCE MEMBER_NUM_SEQ
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE;
-------------------------

  ------mem inq
  CREATE TABLE MEMBER_INQUIRLY
(
    MEMBER_NUM      NUMBER      NOT NULL, 
    INQ_NUM         NUMBER            NOT NULL, 
    INQ_TITLE       VARCHAR2(200)      NOT NULL, 
    INQ_CONTENTS    VARCHAR2(4000)    NOT NULL, 
    INQ_DATE        DATE              NOT NULL, 
    INQ_STATE       VARCHAR2(40)      NOT NULL, 
    INQ_TYPE        VARCHAR2(40)      NOT NULL, 
    INQ_SHOP        VARCHAR2(40)      NOT NULL, 
    INQ_LOCATION    VARCHAR2(200)      NOT NULL,
    INQ_REPLY    VARCHAR2(4000)    NOT NULL,
    CONSTRAINT MEMBER_INQUIRLY_PK PRIMARY KEY (INQ_NUM),
    CONSTRAINT MEMBER_INQ_NUM_FK FOREIGN KEY (MEMBER_NUM) REFERENCES MEMBER_INFO (MEMBER_NUM) ON DELETE CASCADE
);

 CREATE SEQUENCE MEMBER_INQUIRLY_SEQ
  START WITH 1 
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE;






---------------branch_info---------------------------------------------
CREATE TABLE BRANCH_INFO (
    BRANCH_NUM       NUMBER NOT NULL,
    BRANCH_NAME      VARCHAR2(400) NOT NULL,
    BRANCH_PHONE     VARCHAR2(400) NULL,
    REGION1          VARCHAR2(400) NOT NULL,
    REGION2          VARCHAR2(400) NOT NULL,
    STREET_ADDRESS   VARCHAR2(400) NOT NULL,
    HOURS            VARCHAR2(400) NOT NULL,
    PARKING_INFO     VARCHAR2(400) NULL,
    SALENAME1        VARCHAR2(400) NULL,
    SALENAME2        VARCHAR2(400) NULL,
    SPCL_SALE        VARCHAR2(400) NULL,
    LATITUDE         FLOAT NOT NULL,
    LONGITUDE        FLOAT NOT NULL,
    CONSTRAINT BI_NUM_PK PRIMARY KEY ( BRANCH_NUM ),
    CONSTRAINT BI_NAME_UNI UNIQUE ( BRANCH_NAME ),
    CONSTRAINT BI_PHONE_UNI UNIQUE ( BRANCH_PHONE ),
    CONSTRAINT BI_STREET_UNI UNIQUE ( STREET_ADDRESS ),
    CONSTRAINT BI_LAT_UNI UNIQUE ( LATITUDE ),
    CONSTRAINT BI_LON_UNI UNIQUE ( LONGITUDE )
);

CREATE SEQUENCE BRANCH_INFO_SEQ
START WITH 1
INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE;
  
  
 ------------------orderview
CREATE TABLE ORDER_VIEW (
    MEMBER_NUM NUMBER CONSTRAINT OV_NUM_FK REFERENCES MEMBER_INFO (MEMBER_NUM) ON DELETE CASCADE,
   ORDER_VIEW_NUM NUMBER CONSTRAINT OV_NUM_PK PRIMARY KEY,
    ORDER_ADRESS VARCHAR2(200),
    ORDER_SHOP VARCHAR2(200),
    ORDER_NAME VARCHAR2(200), 
   ORDER_PHONE VARCHAR2(200),
   ORDER_REQUEST VARCHAR2(200), 
   ORDER_UNTACT VARCHAR2(5),
    ORDER_DATE DATE,
    ORDER_TOTAL NUMBER,
    ORDER_SALE NUMBER,
    ORDER_SALENAME VARCHAR2(200),
    ORDER_PAYMENT NUMBER,
    ORDER_METHOD VARCHAR2(200)
);

CREATE SEQUENCE ORDER_VIEW_SEQ
START WITH 1
INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE;
  
  
    --------------------------------------------------------
--  DDL for Table sale
--------------------------------------------------------
CREATE TABLE SALE (
    MEMBER_NUM NUMBER CONSTRAINT SALE_NUM_FK REFERENCES MEMBER_INFO (MEMBER_NUM) ON DELETE CASCADE,
    SALE_LIST NUMBER,
    SALE_NAME VARCHAR2(200) CONSTRAINT SALE_NAME_PK PRIMARY KEY,
    SALE_DISCOUNT NUMBER,
    SALE_DATE VARCHAR2(200)
);


  --------------------------------------------------------
--  DDL for Table payment
--------------------------------------------------------
  CREATE TABLE PAYMENT (
    SALE_NAME VARCHAR2(200) CONSTRAINT PAY_NAME_FK REFERENCES SALE (SALE_NAME) ON DELETE CASCADE,
    ORDER_VIEW_NUMBER NUMBER CONSTRAINT PAY_NUM_FK REFERENCES ORDER_VIEW (ORDER_VIEW_NUM) ON DELETE CASCADE,
    PAYMENT_TOTAL NUMBER,
    PAYMENT_SALE NUMBER,
    PAYMENT_PAYMENT NUMBER
);



--------------------board seq----------------------------
  CREATE SEQUENCE BOARD_SEQ
  START WITH 1 
  INCREMENT BY 1
  NOMAXVALUE
  NOMINVALUE
  NOCYCLE
  NOCACHE;

---------------domino_News----------------------------------------------------------
CREATE TABLE DOMINO_NEWS
(
    BOARD_NUM NUMBER NOT NULL CONSTRAINT NEWS_BN_PK PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_WRITER VARCHAR2(200) NOT NULL,
    BOARD_CONTENTS VARCHAR2(4000) NOT NULL,
    REGDATE DATE NOT NULL,
    HIT NUMBER
);

CREATE TABLE NEWSFILE
(
    FILE_NUM NUMBER NOT NULL CONSTRAINT NF_FN_PK PRIMARY KEY,
    BOARD_NUM NUMBER NOT NULL CONSTRAINT NF_BN_FK REFERENCES DOMINO_NEWS(BOARD_NUM) ON DELETE CASCADE,
    FILE_NAME VARCHAR2(400) NOT NULL, 
    ORI_NAME VARCHAR2(200) NOT NULL 
);


---------------press---------------------------------------------------------
CREATE TABLE PRESS(
    BOARD_NUM NUMBER NOT NULL CONSTRAINT PRESS_BN_PK PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_WRITER VARCHAR2(200) NOT NULL,
    BOARD_CONTENTS VARCHAR2(4000) NOT NULL,
    REGDATE DATE NOT NULL,
    HIT NUMBER
);

CREATE TABLE PRESSFILE
(
    FILE_NUM NUMBER NOT NULL CONSTRAINT PF_FN_PK PRIMARY KEY,
    BOARD_NUM NUMBER NOT NULL CONSTRAINT PF_BN_FK REFERENCES PRESS(BOARD_NUM) ON DELETE CASCADE,
    FILE_NAME VARCHAR2(400) NOT NULL, 
    ORI_NAME VARCHAR2(200) NOT NULL 
);
-------------------qna--------------------------
CREATE TABLE QNA
(
    BOARD_NUM NUMBER NOT NULL CONSTRAINT QNA_BN_PK PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_WRITER VARCHAR2(200) NOT NULL,
    BOARD_CONTENTS VARCHAR2(4000) NOT NULL,
    REGDATE DATE NOT NULL,
    EMAIL VARCHAR2(200) NOT NULL, 
    PHONE  VARCHAR2(200) NOT NULL, 
    QNA_TYPE VARCHAR2(200) NOT NULL, 
    BRANCH_INFO VARCHAR2(200) NOT NULL, 
    ORDER_NUM NUMBER NULL 
);

CREATE TABLE QNAFILE
(
    FILE_NUM NUMBER NOT NULL CONSTRAINT QF_FN_PK PRIMARY KEY,
    BOARD_NUM NUMBER NOT NULL CONSTRAINT QF_BN_FK REFERENCES QNA(BOARD_NUM) ON DELETE CASCADE,
    FILE_NAME VARCHAR2(400) NOT NULL, 
    ORI_NAME VARCHAR2(200) NOT NULL 
);


---------faq---------------------------------
CREATE TABLE FAQ
(
    BOARD_NUM NUMBER NOT NULL CONSTRAINT FAQ_BN_PK PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_WRITER VARCHAR2(200) NOT NULL,
    BOARD_CONTENTS VARCHAR2(4000) NOT NULL,
    FAQ_TYPE NUMBER
);



-- item table
CREATE SEQUENCE ITEM_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE ITEM(
    ITEM_ID               NUMBER(8) CONSTRAINT ITEM_ID_PK PRIMARY KEY,
    ITEM_NAME             VARCHAR2(200) CONSTRAINT ITEM_NAME_NN NOT NULL   ,
    ITEM_CATEGORY         VARCHAR2(200) CONSTRAINT ITEM_CATEGORY_NN NOT NULL ,
    ITEM_STATUS           NUMBER(8) CONSTRAINT ITEM_STATUS_NN NOT NULL     ,
    ITEM_PRICE            NUMBER(8)    ,
    ITEM_TAG              VARCHAR2(200)  ,
    ITEM_IMAGE            VARCHAR2(200)

);

-- pizza table
CREATE SEQUENCE PIZZA_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE PIZZA(
    PIZZA_ID            NUMBER(8) CONSTRAINT PIZZA_ID_PK PRIMARY KEY,
    ITEM_ID             NUMBER(8) CONSTRAINT PIZZA_ITEM_ID_FK REFERENCES ITEM(ITEM_ID) NOT NULL,
    PIZZA_PRICE_L       NUMBER(8) CONSTRAINT PIZZA_PRICE_L_NN NOT NULL   ,
    PIZZA_PRICE_M       NUMBER(8) CONSTRAINT PIZZA_PRICE_M_NN NOT NULL   ,
    PIZZA_PRICE_HALF    NUMBER(8)    ,
    PIZZA_HASHTAG       VARCHAR2(200)  ,
    PIZZA_TYPE          VARCHAR2(200),
    PIZZA_TOPPINGS      VARCHAR2(2000),
    PIZZA_ORIGIN        VARCHAR2(2000)
);




-- dough table
CREATE SEQUENCE DOUGH_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE DOUGH (
    DOUGH_ID NUMBER(8)  CONSTRAINT DOUGH_ID_PK PRIMARY KEY,
    ITEM_ID NUMBER(8) CONSTRAINT DOUGH_ITEM_ID_FK REFERENCES ITEM(ITEM_ID) NOT NULL,
    DOUGH_NAME_SHORT VARCHAR2(200) CONSTRAINT DOUGH_NAME_SHORT_NN NOT NULL
);

-- topping table
CREATE SEQUENCE TOPPING_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE TOPPING (
    TOPPING_ID NUMBER(8) CONSTRAINT TOPPING_ID_PK PRIMARY KEY,
    ITEM_ID NUMBER(8) CONSTRAINT TOPPING_ITEM_ID_FK REFERENCES ITEM(ITEM_ID) NOT NULL,
    TOPPING_CATEGORY VARCHAR2(200) CONSTRAINT TOPPING_CATEGORY_NN NOT NULL
);

-- pizza_topping relationship table

CREATE SEQUENCE PIZZA_TOPPING_REL_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE PIZZA_TOPPING_REL (
    PIZZA_TOPPING_REL_ID NUMBER(8) CONSTRAINT PIZZA_TOPPING_REL_ID_PK PRIMARY KEY,
    PIZZA_ID NUMBER(8) CONSTRAINT PIZZA_TOPPING_REL_P_ID_FK REFERENCES PIZZA(PIZZA_ID) NOT NULL,
    TOPPING_ID NUMBER(8) CONSTRAINT PIZZA_TOPPING_REL_T_ID_FK REFERENCES TOPPING(TOPPING_ID) NOT NULL
);

-- pizza-dough relationship table
CREATE SEQUENCE PIZZA_DOUGH_REL_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE PIZZA_DOUGH_REL (
    PIZZA_DOUGH_REL_ID NUMBER(8) CONSTRAINT PIZZA_DOUGH_REL_ID_PK PRIMARY KEY,
    PIZZA_ID NUMBER(8) CONSTRAINT PIZZA_DOUGH_REL_P_ID_FK REFERENCES PIZZA(PIZZA_ID) NOT NULL,
    DOUGH_ID NUMBER(8) CONSTRAINT PIZZA_DOUGH_REL_D_ID_FK REFERENCES DOUGH(DOUGH_ID) NOT NULL
);

---------------cart----------------------------------------------------------------

CREATE SEQUENCE CART_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE CART (
    CART_ITEM_ID     NUMBER(8) CONSTRAINT CART_ITEM_ID_PK PRIMARY KEY,
    MEMBER_NUM       NUMBER CONSTRAINT CART_MEMBER_NUM_FK REFERENCES MEMBER_INFO(MEMBER_NUM) ON DELETE CASCADE NOT NULL,
    ITEM_ID          NUMBER(8) CONSTRAINT CART_ITEM_ID_FK REFERENCES ITEM(ITEM_ID)  NOT NULL,
    CART_GROUP_ID    NUMBER(8) CONSTRAINT CART_GROUP_ID_NN NOT NULL  ,
    CART_QUANTITY    NUMBER(8) CONSTRAINT CART_QUANTITY_NN NOT NULL  ,
    ITEM_SIZE        VARCHAR2(200)
);


-- order detail table
CREATE SEQUENCE ORDER_DETAIL_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;
    
  CREATE TABLE ORDER_DETAIL (
    ORDER_VIEW_NUM NUMBER CONSTRAINT DETAIL_NUM_FK REFERENCES ORDER_VIEW (ORDER_VIEW_NUM) ON DELETE CASCADE,
    ORDER_DETAIL_ID NUMBER CONSTRAINT DETAIL_ID_PK PRIMARY KEY,
    ORDER_ITEM_ID NUMBER,
    ORDER_DETAIL_PRICE NUMBER,
    ORDER_DETAIL_QUANTITY NUMBER,
    ORDER_DETAIL_SIZE VARCHAR2(200),
    ORDER_DETAIL_GROUP_ID NUMBER,
    ORDER_DETAIL_NAME VARCHAR2(200),
    ORDER_DETAIL_CATEGORY VARCHAR2(200)
);


CREATE SEQUENCE ORDER_DETAIL_TEMP_SEQ
    NOMAXVALUE
    NOMINVALUE
    NOCYCLE
    NOCACHE;

CREATE TABLE ORDER_DETAIL_TEMP (
    ORDER_DETAIL_TEMP_ID NUMBER CONSTRAINT ODT_ID_PK PRIMARY KEY,
    CART_GROUP_ID NUMBER(8) NOT NULL,
    MEMBER_NUM NUMBER CONSTRAINT ODT_CART_MEMBER_NUM_FK REFERENCES MEMBER_INFO(MEMBER_NUM)ON DELETE CASCADE NOT NULL ,
    IS_PIZZA_GROUP NUMBER(1)
);








SET DEFINE OFF;


INSERT INTO member_info VALUES('ADMIN','admin','admin','20/11/09','010-1111-0909','asd@zxc', 'REGULAR', 3, 1,1,1,0,0,0,sysdate, MEMBER_NUM_SEQ.NEXTVAL);
INSERT INTO member_info VALUES('USER01','user01','user01','20/11/09','010-1234-7777','asd@zxc', 'REGULAR', 3, 1,1,1,0,0,0,sysdate, MEMBER_NUM_SEQ.NEXTVAL);
INSERT INTO member_info VALUES('USER02','user02','user02','20/11/09','010-4577-7877','asd@zxc', 'REGULAR', 3, 1,1,1,0,0,0,sysdate, MEMBER_NUM_SEQ.NEXTVAL);

insert into member_inquirly values(2 ,member_inquirly_seq.nextval, '문의합니다','배달이 너무늦게왔어요', sysdate, '미처리','배달 서비스관련','가락','서울','답변 대기중');
insert into member_inquirly values(2 ,member_inquirly_seq.nextval, '칭찬합니다','피자가 맛있어요', sysdate, '미처리','제품 관련','마포','서울','답변 대기중');
insert into member_inquirly values(3 ,member_inquirly_seq.nextval, '질문있습니다','할인정보는 어디서 확인가능한가요', sysdate, '미처리','제품 관련','마포','서울','답변 대기중');

insert into faq values(board_seq.nextval, '주문한 메뉴를 변경하거나 취소해야할 경우에는 어떻게 하나요?' ,'admin','주문 접수 후 바로 피자 메이킹이 이루어져 주문 변경이나 취소가 어렵습니다.
주문변경이나 취소는 반드시 해당 매장으로 전화하셔야 가능하며, 해당매장 전화번호는 주문완료 후 주문내역조회로 들어가시면 확인할 수 있습니다.
매장에 전화하셔서 반드시 주문내역조회에 나와있는 주문아이디를 말씀해 주셔야 신속한 처리가 이루어집니다.
메뉴를 변경해야 할 경우 해당매장에 전화하여 기존 주문을 취소하고 주문을 다시 해주셔야 합니다.
주문이 취소되면 기존 결제정보도 취소되며 재주문을 하실 경우 결제도 다시 하셔야 합니다.',1);

insert into faq values(board_seq.nextval, '온라인 주문 서비스를 이용하면 어떤 할인 혜택이 있나요?.' ,'admin','온라인 할인(사이트 : 피자 10% 할인 / 모바일 웹,앱 : 피자 15% 할인),
통신사 멤버쉽 할인, 신용카드 제휴할인,스마트폰 할인, 희망나눔세트 할인, 방문포장 할인 화끈한 화요일 등 스페셜 할인 등 다양한 할인혜택을 받을 수 있습니다.
두가지 할인을 중복으로 받을 수 없으며, 희망나눔세트메뉴 주문 시 추가할인이 적용되지 않습니다. 신용카드 제휴할인 선택 시에는 반드시 해당 신용카드로 결제하셔야 해당 할인혜택을 받으실 수 있습니다.',1);

insert into faq values(board_seq.nextval, '신용카드/휴대폰 승인 및 취소 현황은 어떻게 확인하나요?.' ,'admin','신용카드/휴대폰 승인 및 취소 현황은 피자 주문 시 사용하신 신용카드사 또는 통신사 홈페이지를 통해서 확인하실 수 있습니다.',2);

insert into faq values(board_seq.nextval, '신용카드 결제내역 영수증을 출력하고 싶은데요?.' ,'admin','주문을 완료하신 후에 My Page > 주문/배송조회로 이동합니다.
주문 번호를 클릭하신 후 주문 상세 페이지의 영수증 출력을 클릭하시면 해당 주문의 영수증을 출력할 수 있습니다.',2);


insert into faq values(board_seq.nextval, '다른사람이 피자를 수령할 수 있나요?' ,'admin','주문하는 분과 피자를 수령하실 분이 다르신 경우, 수령자 정보를 정확히 입력해 주시기 바랍니다.
전화번호의 경우, 휴대폰 번호 입력이 가능하며, 정보의 오기재로 인해 피자를 수령하지 못하였을 경우 환불은 불가능합니다.
[포장내역출력하기] 에서 포장내역을 출력해가시면 빠른 확인 및 피자 수령에 도움이 됩니다',3);


insert into qna values (board_seq.nextval,'이번 신메뉴 맛있어요','도민호',' 스타셰프 트러플 바질 피자 정말 맛있어요 ',sysdate,'qwe1738@naver.com',
'010-1111-2222','제품관련','서울,홍대',20772411);
insert into qna values (board_seq.nextval,'배달이 너무 늦게왔어요','이민호','배달 개선 부탁드립니다',sysdate,'fff1738@naver.com',
'010-2222-3333','배달서비스 관련','서울,가락',201126881);

insert into domino_news values(board_seq.nextval,'t1','admin','c1',sysdate,0);
insert into domino_news values(board_seq.nextval,'t2','admin','c2',sysdate,0);
insert into domino_news values(board_seq.nextval,'t3','admin','c3',sysdate,0);
insert into domino_news values(board_seq.nextval,'t4','admin','c4',sysdate,0);
insert into domino_news values(board_seq.nextval,'t5','admin','c5',sysdate,0);
insert into domino_news values(board_seq.nextval,'t6','admin','c6',sysdate,0);
insert into domino_news values(board_seq.nextval,'t7','admin','c7',sysdate,0);
insert into domino_news values(board_seq.nextval,'t8','admin','c8',sysdate,0);
insert into domino_news values(board_seq.nextval,'t9','admin','c9',sysdate,0);
insert into domino_news values(board_seq.nextval,'t10','admin','c10',sysdate,0);
insert into domino_news values(board_seq.nextval,'보온백 이벤트 당첨자 안내','admin','당첨자 내역입니다.',sysdate,0);
insert into domino_news values(board_seq.nextval,'도미노 사이트 점검 안내','admin','익일 12시까지 점검예정입니다.',sysdate,0);

insert into press values(board_seq.nextval,'새로운 신메뉴 출시','admin','기대해주세요',sysdate,0);
insert into press values(board_seq.nextval,'도미노 최우수 기업으로 선정','admin','2020 푸드 award에서 대상',sysdate,0);


Insert into BRANCH_INFO values (1,'개포점','02-575-9333','서울','강남구','논현로 58','11:30 ~ 22:00','매장뒷편주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.475518,127.047214);
Insert into BRANCH_INFO values (2,'논현점','02-546-3082','서울','강남구','학동로4길 15','11:00 ~ 22:00','주차불가','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.510734,127.023298);
Insert into BRANCH_INFO values (3,'미아점','02-989-3044','서울','강북구','삼양로24길 19, 102동 101호','11:30 ~ 22:00','주차불가','온라인 방문포장 40%','오프라인 방문포장 40%','배달 30% 할인',37.617072,127.022029);
Insert into BRANCH_INFO values (4,'번동점','02-904-3084','서울','강북구','덕릉로 147','11:30 ~ 22:00','주차불가','온라인 방문포장 30%','오프라인 방문포장 30%','방문포장 피자 50% 할인',37.635334,127.030114);
Insert into BRANCH_INFO values (5,'사당점','02-3482-3084','서울','동작구','사당로 261','11:30 ~ 22:00','매장주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.483839,126.976931);
Insert into BRANCH_INFO values (6,'서방배점','02-592-3118','서울','서초구','효령로 22 멤버스뷰','11:30 ~ 22:00','매장주차가능','온라인 방문포장 40%','오프라인 방문포장 40%','배달 25% 할인',37.477243,126.987488);
Insert into BRANCH_INFO values (7,'이문점','02-959-3127','서울','동대문구','휘경로 5-1','11:30 ~ 22:00','주차불가','온라인 방문포장 40%','오프라인 방문포장 40%','배달 25% 할인',37.596323,127.060903);
Insert into BRANCH_INFO values (8,'망원점','02-335-2060','서울','마포구','월드컵로10길 5','11:30 ~ 22:00','건물 뒤 주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.554549,126.912031);
Insert into BRANCH_INFO values (9,'이촌점','02-795-4673','서울','용산구','서빙고로 40','11:30 ~ 22:00','용산중앙대학교병원 시간당 3,000원','온라인 방문포장 0%','오프라인 방문포장 0%',null,37.523978,126.968742);
Insert into BRANCH_INFO values (10,'은평점','02-359-3082','서울','은평구','연서로 35','11:00 ~ 22:00','주차가능 / 매장정면 잠깐 주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.602266,126.915558);
Insert into BRANCH_INFO values (11,'명동점','02-2264-3081','서울','중구','마른내로 47','11:00 ~ 22:00','주차불가','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.564713,126.993173);
Insert into BRANCH_INFO values (13,'계양점','032-549-3030','인천','계양구','주부토로 463','11:00 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.535761,126.727786);
Insert into BRANCH_INFO values (16,'고양점','031-966-3082','경기도','고양시','덕양구 혜음로 68','11:00 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.706529,126.902918);
Insert into BRANCH_INFO values (14,'임학점','032-556-3082','인천','계양구','장제로 865','11:00 ~ 22:00','주차불가','온라인 방문포장 40%','오프라인 방문포장 40%',null,37.544718,126.737872);
Insert into BRANCH_INFO values (17,'대화점','031-919-3084','경기도','고양시','일산서구 송포로 26','11:30 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.669116,126.733212);
Insert into BRANCH_INFO values (18,'마두백석점','031-903-6703','경기도','고양시','일산동구 강송로 170','11:30 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.653908,126.78429);
Insert into BRANCH_INFO values (19,'원당점','031-963-1956','경기도','고양시','덕양구 고양대로 1375','11:00 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.654689,126.836985);
Insert into BRANCH_INFO values (20,'과천점','02-504-2070','경기도','과천시','새술막길 14','11:30 ~ 22:00','주차불가','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.428979,126.990522);
Insert into BRANCH_INFO values (21,'광명일직점','02-6672-0787','경기도','광명시','일직로 28 광명트리플타워 122호','11:00 ~ 22:00','주차불가','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.42234,126.885048);
Insert into BRANCH_INFO values (22,'광명점','02-891-3131','경기도','광명시','하안로 361','11:00 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.466753,126.875732);
Insert into BRANCH_INFO values (23,'철산점','02-2684-5122','경기도','광명시','시청로 32','11:30 ~ 22:00','주차가능','온라인 방문포장 40%','오프라인 방문포장 40%','[고객감사]피자 25%(배달) 할인',37.479527,126.864083);
Insert into BRANCH_INFO values (24,'수내정자점','031-711-5267','경기도','성남시','분당구 내정로113번길 4','11:00 ~ 22:00','주차가능','온라인 방문포장 30%','오프라인 방문포장 30%',null,37.37063,127.114767);



-- item data
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (1,'글로벌 레전드4','pizza',1,NULL,'NEW','global_legend4.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (2,'시리얼 칠리크랩','pizza',1,NULL,'BEST','cereal_chilli_crab.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (3,'치즈케이크 블랙타이거','pizza',1,NULL,NULL,'cheesecake_blacktiger.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (4,'30 치즈&뉴욕 스트립 스테이크','pizza',1,NULL,NULL,'cheese_n_ny.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (5,'블랙앵거스 스테이크','pizza',1,NULL,NULL,'black_angus.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (6,'베스트 콰트로','pizza',1,NULL,NULL,'best_quattro.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (7,'블랙타이거 슈림프','pizza',1,NULL,NULL,'blacktiger_shrimp.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (8,'직화 스테이크','pizza',1,NULL,NULL,'grilled_steak.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (9,'시리얼칠리크랩+블랙타이거슈림프','pizza',1,NULL,'BEST','hnh_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (10,'시리얼칠리크랩+블랙앵거스스테이크','pizza',1,NULL,'BEST','hnh_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (11,'블랙타이거슈림프+직화스테이크','pizza',1,NULL,'BEST','hnh_03.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (12,'리얼불고기','pizza',1,NULL,NULL,'classic_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (13,'치즈가든','pizza',1,NULL,NULL,'classic_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (14,'우리 고구마','pizza',1,NULL,NULL,'classic_03.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (15,'포테이토','pizza',1,NULL,NULL,'classic_04.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (16,'슈퍼디럭스','pizza',1,NULL,NULL,'classic_05.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (17,'슈퍼슈프림','pizza',1,NULL,NULL,'classic_06.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (18,'베이컨체더치즈','pizza',1,NULL,NULL,'classic_07.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (19,'페퍼로니','pizza',1,NULL,NULL,'classic_08.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (20,'치즈','pizza',1,NULL,NULL,'classic_09.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (21,'슈퍼시드 함유 도우','dough',1,2000,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (22,'오리지널 도우 (칠리핫도그 엣지)','dough',1,5000,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (23,'오리지널 도우 (더블 치즈엣지)','dough',1,5000,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (24,'오리지널 도우(기본)','dough',1,NULL,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (25,'나폴리 도우','dough',1,NULL,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (26,'씬 도우 (기본 갈릭디핑 소스 미제공)','dough',1,NULL,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (27,'샌드 (기본 갈릭디핑 소스 미제공)','dough',1,NULL,NULL,NULL);
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (28,'갈릭 치킨 40g','topping',1,2000,NULL,'topping_main_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (29,'오리엔탈 통새우 4ea(54g)','topping',1,3500,NULL,'topping_main_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (30,'호스래디시 스퀴드(오징어) 25g','topping',1,1500,NULL,'topping_main_03.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (31,'스위트 칠리크랩 40g','topping',1,3500,NULL,'topping_main_04.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (32,'그릴드비프(직화 스테이크) 35g','topping',1,3000,NULL,'topping_main_05.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (33,'랍스터살 50g','topping',1,4000,NULL,'topping_main_06.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (34,'통새우 44g','topping',1,3000,NULL,'topping_main_07.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (35,'블랙앵거스 비프 50g','topping',1,2500,NULL,'topping_main_08.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (36,'리얼 불고기 70g','topping',1,4500,NULL,'topping_main_09.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (37,'블랙타이거 슈림프 4개/60g','topping',1,6000,NULL,'topping_main_10.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (38,'선드라이토마토 5개/15g','topping',1,1000,NULL,'topping_main_11.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (39,'고구마 큐브 40g','topping',1,1500,NULL,'topping_main_12.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (40,'고구마 무스 50g','topping',1,2500,NULL,'topping_main_13.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (41,'올리브 20g','topping',1,300,NULL,'topping_main_14.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (42,'파인애플 8개/40g','topping',1,300,NULL,'topping_main_15.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (43,'버섯 20g','topping',1,300,NULL,'topping_main_16.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (44,'토마토 콩피 17g','topping',1,1000,NULL,'topping_main_17.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (45,'뉴욕 스트립 스테이크 50g','topping',1,5000,NULL,'topping_main_18.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (46,'베이컨 8개/24g','topping',1,1000,NULL,'topping_main_19.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (47,'페퍼로니 8개/20g','topping',1,500,NULL,'topping_main_20.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (48,'감자 8개/80g','topping',1,1000,NULL,'topping_main_21.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (49,'햄 8개/28g','topping',1,500,NULL,'topping_main_22.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (50,'옥수수 40g','topping',1,300,NULL,'topping_main_23.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (51,'피망 20g','topping',1,300,NULL,'topping_main_24.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (52,'양파 20g','topping',1,300,NULL,'topping_main_25.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (53,'베이컨칩 30g','topping',1,1500,NULL,'topping_main_26.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (54,'로스트 포테이토 70g','topping',1,1500,NULL,'topping_main_27.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (55,'마요네즈 30g','topping',1,500,NULL,'topping_main_28.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (56,'불고기 40g','topping',1,1000,NULL,'topping_main_29.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (57,'케이준 새우살 8개/62g','topping',1,4000,NULL,'topping_main_30.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (58,'포크 20g','topping',1,300,NULL,'topping_main_31.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (59,'도미노치즈 100g','topping',1,2500,NULL,'topping_cheese_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (60,'프로볼로네 치즈 20g','topping',1,1000,NULL,'topping_cheese_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (61,'리코타 치즈 30g','topping',1,2500,NULL,'topping_cheese_03.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (62,'카망베르 크림치즈 20g','topping',1,1000,NULL,'topping_cheese_04.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (63,'체더치즈 40g','topping',1,1500,NULL,'topping_cheese_05.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (64,'파르메산 치즈 5g','topping',1,1000,NULL,'topping_after_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (65,'콰트로 치즈 퐁듀 20g','topping',1,1000,NULL,'topping_after_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (66,'스파이시 씨푸드 로제 파스타','sidedish',1,8800,'NEW','sidedish_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (67,'크리스피 핫 순살 치킨(8조각)','sidedish',1,4800,'BEST','sidedish_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (68,'샐러드 가든','sidedish',1,6800,NULL,'sidedish_03.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (69,'펜네 파스타','sidedish',1,8800,NULL,'sidedish_04.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (70,'슈퍼곡물 치킨(10조각)','sidedish',1,7800,NULL,'sidedish_05.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (71,'NEW 치즈 볼로네즈 스파게티','sidedish',1,8800,NULL,'sidedish_06.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (72,'트러플 리조또','sidedish',1,8800,NULL,'sidedish_07.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (73,'하프&하프 스파게티 (NEW 치즈 & 화이트 크림)','sidedish',1,9800,NULL,'sidedish_08.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (74,'화이트 크림 스파게티','sidedish',1,8800,NULL,'sidedish_09.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (75,'갈릭&허브윙스(8조각)','sidedish',1,8800,NULL,'sidedish_10.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (76,'프레시 코울슬로','sidedish',1,2400,NULL,'sidedish_11.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (77,'프레시 콘샐러드','sidedish',1,2400,NULL,'sidedish_12.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (78,'코카콜라 1.25L','etc',1,2000,NULL,'etc_01.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (79,'코카콜라 500ml','etc',1,1400,NULL,'etc_02.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (80,'코카콜라 제로 1.5L','etc',1,2100,NULL,'etc_03.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (81,'코카콜라 제로 500ml','etc',1,1300,NULL,'etc_04.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (82,'스프라이트 1.5L','etc',1,2100,NULL,'etc_05.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (83,'스프라이트 500ml','etc',1,1300,NULL,'etc_06.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (84,'미닛메이드 스파클링 청포도 1.25L','etc',1,2300,NULL,'etc_07.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (85,'우리 피클 L','etc',1,800,NULL,'etc_08.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (86,'우리 피클 M','etc',1,500,NULL,'etc_09.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (87,'도미노 시리얼','etc',1,400,NULL,'etc_10.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (88,'스위트 칠리소스 15g','etc',1,300,NULL,'etc_11.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (89,'갈릭 디핑 소스 15g','etc',1,200,NULL,'etc_12.jpg');
INSERT INTO item(item_id,item_name,item_category,item_status,item_price,item_tag,item_image) VALUES (90,'핫소스','etc',1,100,NULL,'etc_13.jpg');

-- pizza data

INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (1,1,35900,29000,NULL,'#한국,미국,호주,프랑스! 레전드의 만남','프리미엄','토마토 소스, 모차렐라, 체더, 프로볼로네, 11가지 옐로우 믹스 치즈, 로스트 포테이토, 백양파, 생양송이, 청피망, 베이컨 칩, 갈릭 치킨, 리얼 불고기, 뉴욕 스트립 스테이크, 베이컨, 호스래디시 스퀴드(오징어), 스위트 칠리크랩, 케이준 새우살, 랜치 소스','모차렐라 치즈 : 미국산 / 체더 치즈 : 뉴질랜드 산 / 베이컨 칩(돼지고기) : 미국산 / 갈릭 치킨(닭고기) : 국내산 / 리얼불고기(쇠고기) : 호주산 / 뉴욕 스트립 스테이크(쇠고기) : 호주산 / 베이컨(돼지고기) : 외국산 / 호스래디시 스퀴드(오징어) : 중국산 / 스위트 칠리크랩(붉은 대게) : 국내산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (2,2,34900,29000,NULL,'#씨푸드부터 시리얼까지 모든 것이 새롭다#도미노 시리얼 제공','프리미엄','모차렐라, 페터크림 치즈, 갈릭크림 소스, 로스트 포테이토, 파인애플, 양파, 청피망, 옥수수, 베이컨 칩, 파슬리, 호스래디시 스퀴드(오징어), 스위트 칠리크랩, 스위트 칠리크랩 소스, 오리엔탈 통새우','오리지널, 나폴리 도우(밀) : 미국산+캐나다산 / 씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 모차렐라 치즈 : 미국산 / 호스래디시 스퀴드(오징어) : 중국산 / 스위트 칠리크랩(붉은 대게) : 국내산 / 베이컨칩(돼지고기) : 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (3,3,35900,29000,NULL,'#새로운 레전드를 새우다','프리미엄','파르메산,모차렐라,선드라이토마토,베이컨칩,치즈케이크무스,블랙타이거 슈림프,호스래디시소스','모차렐라 치즈 : 미국산 | 베이컨칩(돼지고기) : 미국산 등');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (4,4,34900,29000,NULL,'#30가지 치즈와 스테이크의 조화','프리미엄','모차렐라, 프로볼로네, 체더, 크리미 고르곤졸라, 갈릭 크림 소스, 토마토 콩피(confit), 뉴욕 스트립 스테이크, 15가지 믹스 슈레드 치즈(화이트 체더, 몬터레이 잭, 에그몬트, 크림치즈, 에멘탈, 카망베르, 블루 치즈, 스모크 치즈, 숙성 체더, 유기농 체더, 고다, 리코타, 파르메산, 그뤼에르, 로마노), 11가지 믹스 옐로우 치즈(부라타, 콜비잭, 만체고, 탈레지오, 보코치니, 페터, 브리, 에담, 마스카포네, 그라나파다노, 미몰레트), 파슬리 드라이','오리지널, 나폴리 도우(밀) : 미국산+캐나다산 / 씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 뉴욕 스트립 스테이크(쇠고기) : 호주산 / 체더치즈 : 미국, 뉴질랜드, 호주 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (5,5,34900,29000,NULL,'#블랙앵거스 비프에 랍스터볼까지','프리미엄','블랙앵거스 비프, 랍스터볼, 모차렐라, 페터크림, 리코타 치즈, 구운감자, 양송이, 피망, 백양파, 호스래디시 소스, 아라비아타 소스','모차렐라 치즈 : 미국산 / 리코타 치즈 : 국산 / 블랙앵거스 비프 : 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (6,6,34900,29000,NULL,'#4가지 피자를 한판에','프리미엄','블랙앵거스 스테이크 : 블랙앵거스 비프, 랍스터볼, 모차렐라, 페터크림, 리코타 치즈, 구운감자, 양송이, 피망, 백양파, 호스래디시 소스, 아라비아타 소스 | 블랙타이거 슈림프 : 블랙타이거 슈림프, 리얼 불고기, 구운감자, 양송이, 청피망, 백양파, 파인애플, 파슬리, 모차렐라, 로마노크림, 호스래디시 소스 | 포테이토 : 모차렐라 치즈, 양파, 버섯, 옥수수, 감자, 베이컨, 마요네즈 | 슈퍼디럭스 : 모차렐라 치즈, 피망, 양파, 페퍼로니, 햄, 버섯, 불고기, 포크, 올리브','모차렐라 치즈 : 미국산ㅣ리코타 치즈 : 국산ㅣ블랙앵거스 비프(쇠고기) : 미국산 | 리얼 불고기(쇠고기) : 미국산, 호주산, 네덜란드산 | 베이컨(돼지고기) : 스페인산, 미국산, 독일산 | 불고기(쇠고기) : 호주산ㅣ햄(돼지고기) : 국내산ㅣ페퍼로니 : 돈육(국내산)+우육(호주산)ㅣ포크 토핑(돼지고기) : 국내산ㅣ25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (7,7,34900,29000,NULL,'#바다와 육지의 대왕이 하나로','프리미엄','블랙타이거 슈림프, 리얼 불고기, 구운감자, 양송이, 청피망, 백양파, 파인애플, 파슬리, 콰트로치즈퐁듀(고다, 체더, 카망베르, 에멘탈), 모차렐라, 로마노크림, 체더, 망고하바네로 소스, 호스래디시 소스','모차렐라 치즈 : 미국산 / 체더 치즈 : 뉴질랜드 산 / 리얼 불고기(쇠고기) : 호주산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (8,8,33900,28000,NULL,'#직화스테이크와 통새우의 만남','프리미엄','그릴드 비프(직화 스테이크), 케이준새우, 치즈 3종(프로볼로네, 파르메산 치즈, 모차렐라), 양송이, 베이컨칩, 백양파, 청피망, 구운감자, 파슬리, 선드라이토마토, 토마토 소스, 갈릭올리브 소스','그릴드 비프(직화 스테이크)(쇠고기): 미국산 / 베이컨칩(돼지고기): 미국산 / 모차렐라치즈: 미국산 / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산/ 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (9,9,34900,29000,NULL,'#최강 씨푸드 콜라보','하프앤하프 시그니처','모차렐라, 페터크림 치즈, 갈릭크림 소스, 로스트 포테이토, 파인애플, 백양파, 청피망, 옥수수, 베이컨 칩, 파슬리, 호스래디시 스퀴드(오징어), 스위트 칠리크랩, 스위트 칠리크랩 소스, 오리엔탈 통새우, 블랙타이거 슈림프, 리얼 불고기, 양송이, 콰트로치즈퐁듀(고다, 체더, 카망베르, 에멘탈), 로마노크림, 체더, 망고하바네로 소스','오리지널, 나폴리 도우(밀) : 미국산+캐나다산 / 씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 모차렐라 치즈 : 미국산 / 호스래디시 스퀴드(오징어) : 중국산 / 스위트 칠리크랩(붉은 대게) : 국내산 / 베이컨칩(돼지고기) : 미국산 / 체더 치즈 : 뉴질랜드 산 / 리얼불고기(쇠고기) : 호주산');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (10,10,34900,29900,NULL,'#부드러운 칠리크랩 육즙가득 블랙 앵거스','하프앤하프 시그니처','모차렐라, 페터크림 치즈, 갈릭크림 소스, 로스트 포테이토, 파인애플, 백양파, 청피망, 옥수수, 베이컨 칩, 파슬리, 호스래디시 스퀴드(오징어), 스위트 칠리크랩, 스위트 칠리크랩 소스, 오리엔탈 통새우, 블랙앵거스 비프, 랍스터볼, 리코타 치즈, 양송이, 호스래디시 소스, 아라비아타 소스','오리지널, 나폴리 도우(밀) : 미국산+캐나다산 / 씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산 / 모차렐라 치즈 : 미국산 / 리코타 치즈 : 국산 / 호스래디시 스퀴드(오징어) : 중국산 / 스위트 칠리크랩(붉은 대게) : 국내산 / 블랙앵거스 비프 : 미국산');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (11,11,34400,28500,NULL,'#바다와 육지의 환상적인 만남','하프앤하프 시그니처','블랙타이거 슈림프, 리얼 불고기, 구운감자, 양송이, 청피망, 백양파, 파인애플, 파슬리, 콰트로치즈퐁듀(고다, 체더, 카망베르, 에멘탈), 모차렐라, 로마노크림, 체더, 프로볼로네, 망고하바네로 소스, 호스래디시 소스, 그릴드 비프(직화 스테이크), 케이준새우, 베이컨칩, 선드라이토마토, 토마토 소스, 갈릭올리브 소스','모차렐라 치즈 : 미국산 / 체더 치즈 : 뉴질랜드 산 / 리얼불고기(쇠고기) : 호주산 / 그릴드 비프(직화 스테이크)(쇠고기): 미국산 / 베이컨칩(돼지고기): 미국산 / 오리지널, 나폴리 도우(밀) : 미국산, 캐나다산 / 씬 도우(밀) : 미국산 / 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (12,12,27900,21000,NULL,'#프리미엄 불고기 토핑이 듬뿍','클래식','리얼불고기(대두,밀,쇠고기,조개류(굴)), 불고기소스(우유,대두,밀,토마토,쇠고기,조개류(굴)), 체더, 모차렐라 치즈(우유)','모차렐라 치즈 : 미국산ㅣ체더치즈 : 뉴질랜드산ㅣ리얼불고기(쇠고기) : 호주산 ㅣ25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (13,13,27900,21000,NULL,'#리치한 치즈와 채소의 조화','클래식','토마토 슬라이스(토마토), 리코타, 프로볼로네, 모차렐라 치즈(우유), 토마토소스(토마토, 대두), 양송이, 백양파, 파슬리','모차렐라 치즈 : 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (14,14,29900,23000,NULL,'#고구마 큐브&무스가 듬뿍!','클래식','모차렐라, 체더, 리코타, 카망베르 크림 치즈, 리얼 불고기, 파인애플, 옥수수, 백양파, 양송이, 트러플 크림, 파슬리, 베이컨, 고구마 큐브, 고구마 무스','오리지널, 나폴리 도우(밀) : 미국산+캐나다산 ㅣ 씬 도우(밀) : 미국산 ㅣ 슈퍼시드 함유 도우(밀) : 미국산+캐나다산, (흑미) : 국내산ㅣ모차렐라 치즈 : 미국산ㅣ고구마 무스(고구마) : 국내산ㅣ고구마 큐브(고구마) : 국내산ㅣ리얼 불고기(쇠고기) : 호주산 | 베이컨(돼지고기) : 스페인산, 미국산, 독일산ㅣ25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (15,15,25900,19000,NULL,'#도미노피자 No.1 레전드','클래식','모차렐라 치즈, 양파, 버섯, 옥수수, 감자, 베이컨, 마요네즈, 토마토 소스','베이컨(돼지고기) : 스페인산, 미국산, 독일산 / 모차렐라치즈: 미국산 / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (16,16,25900,19000,NULL,'#누구나 사랑하는 베이직 피자','클래식','모차렐라 치즈, 피망, 양파, 페퍼로니, 햄, 버섯, 불고기, 포크, 올리브, 토마토 소스','불고기(쇠고기): 미국산, 호주산, 네덜란드산 / 포크 토핑(돼지고기): 국내산 / 햄(돼지고기): 국내산 / 모차렐라치즈: 미국산 / 페퍼로니: 돈육(국내산)+우육(호주산) / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (17,17,25900,19000,NULL,'#콘과 파인애플의 달콤한 조화','클래식','모차렐라 치즈, 피망, 양파, 햄, 버섯, 옥수수, 불고기, 포크, 파인애플, 토마토 소스','불고기(쇠고기): 미국산, 호주산, 네덜란드산 / 포크 토핑(돼지고기): 국내산 / 햄(돼지고기): 국내산 / 모차렐라 치즈: 미국산 / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (18,18,25900,19000,NULL,'#베이컨 매니아들의 원 픽','클래식','모차렐라 치즈, 체더치즈, 양파, 불고기, 베이컨, 토마토 소스','불고기(쇠고기): 미국산, 호주산, 네덜란드산 / 베이컨(돼지고기) : 스페인산, 미국산, 독일산 / 체더치즈: 뉴질랜드산 / 모차렐라치즈: 미국산 / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산/ 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (19,19,22900,16000,NULL,'#짭짤한 풍미가 일품','클래식','모짜렐라 치즈, 페퍼로니, 토마토 소스','페퍼로니: 돈육(국내산)+우육(호주산) / 모차렐라치즈: 미국산 / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산 / 25cm 롱 소시지(돼지고기:국내산)');
INSERT INTO pizza(pizza_id,item_id,pizza_price_l,pizza_price_m,pizza_price_half,pizza_hashtag,pizza_type,pizza_toppings,pizza_origin) VALUES (20,20,21900,15000,NULL,'#토마토 소스와 풍부한 모차렐라','클래식','모짜렐라 치즈, 페퍼로니, 토마토 소스','페퍼로니: 돈육(국내산)+우육(호주산) / 모차렐라치즈: 미국산 / 오리지널, 나폴리 도우: 미국산, 캐나다산 / 씬 도우: 미국산 / 25cm 롱 소시지(돼지고기:국내산)');

-- dough data
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (1,21,'슈퍼시드 함유 도우');
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (2,22,'칠리핫도그 엣지');
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (3,23,'더블 치즈엣지');
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (4,24,'오리지널 도우');
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (5,25,'나폴리 도우');
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (6,26,'씬 도우');
INSERT INTO dough(dough_id,item_id,dough_name_short) VALUES (7,27,'샌드');

-- topping data
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (1,28,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (2,29,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (3,30,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (4,31,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (5,32,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (6,33,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (7,34,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (8,35,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (9,36,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (10,37,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (11,38,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (12,39,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (13,40,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (14,41,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (15,42,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (16,43,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (17,44,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (18,45,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (19,46,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (20,47,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (21,48,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (22,49,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (23,50,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (24,51,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (25,52,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (26,53,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (27,54,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (28,55,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (29,56,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (30,57,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (31,58,'main');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (32,59,'cheese');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (33,60,'cheese');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (34,61,'cheese');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (35,62,'cheese');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (36,63,'cheese');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (37,64,'after');
INSERT INTO topping(topping_id,item_id,topping_category) VALUES (38,65,'after');

-- pizza dough rel data

INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (1,1,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (2,1,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (3,1,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (4,1,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (5,1,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (6,1,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (7,2,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (8,2,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (9,2,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (10,2,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (11,2,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (12,2,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (13,3,7);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (14,4,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (15,4,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (16,4,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (17,4,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (18,4,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (19,4,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (20,5,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (21,5,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (22,5,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (23,5,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (24,5,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (25,5,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (26,6,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (27,6,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (28,6,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (29,6,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (30,6,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (31,6,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (32,7,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (33,7,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (34,7,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (35,7,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (36,7,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (37,7,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (38,8,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (39,8,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (40,8,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (41,8,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (42,8,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (43,8,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (44,9,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (45,9,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (46,9,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (47,9,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (48,9,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (49,9,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (50,10,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (51,10,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (52,10,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (53,10,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (54,10,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (55,10,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (56,11,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (57,11,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (58,11,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (59,11,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (60,11,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (61,11,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (62,12,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (63,12,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (64,12,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (65,12,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (66,12,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (67,12,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (68,13,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (69,13,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (70,13,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (71,13,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (72,13,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (73,13,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (74,14,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (75,14,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (76,14,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (77,14,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (78,14,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (79,14,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (80,15,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (81,15,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (82,15,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (83,15,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (84,15,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (85,15,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (86,16,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (87,16,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (88,16,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (89,16,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (90,16,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (91,16,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (92,17,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (93,17,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (94,17,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (95,17,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (96,17,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (97,17,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (98,18,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (99,18,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (100,18,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (101,18,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (102,18,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (103,18,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (104,19,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (105,19,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (106,19,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (107,19,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (108,19,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (109,19,6);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (110,20,1);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (111,20,2);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (112,20,3);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (113,20,4);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (114,20,5);
INSERT INTO pizza_dough_rel(pizza_dough_rel_id,pizza_id,dough_id) VALUES (115,20,6);

-- pizza topping rel data
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (1,1,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (2,1,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (3,1,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (4,1,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (5,1,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (6,1,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (7,1,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (8,1,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (9,1,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (10,1,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (11,1,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (12,1,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (13,1,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (14,1,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (15,1,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (16,1,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (17,1,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (18,1,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (19,1,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (20,1,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (21,1,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (22,1,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (23,1,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (24,1,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (25,1,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (26,1,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (27,1,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (28,1,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (29,1,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (30,1,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (31,1,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (32,1,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (33,1,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (34,1,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (35,1,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (36,1,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (37,1,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (38,1,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (39,2,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (40,2,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (41,2,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (42,2,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (43,2,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (44,2,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (45,2,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (46,2,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (47,2,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (48,2,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (49,2,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (50,2,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (51,2,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (52,2,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (53,2,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (54,2,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (55,2,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (56,2,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (57,2,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (58,2,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (59,2,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (60,2,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (61,2,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (62,2,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (63,2,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (64,2,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (65,2,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (66,2,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (67,2,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (68,2,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (69,2,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (70,2,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (71,2,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (72,2,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (73,2,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (74,2,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (75,2,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (76,2,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (77,3,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (78,3,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (79,3,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (80,3,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (81,3,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (82,3,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (83,3,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (84,3,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (85,3,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (86,3,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (87,3,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (88,3,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (89,3,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (90,3,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (91,3,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (92,3,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (93,3,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (94,3,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (95,3,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (96,3,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (97,3,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (98,3,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (99,3,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (100,3,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (101,3,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (102,3,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (103,3,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (104,3,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (105,3,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (106,3,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (107,3,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (108,3,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (109,3,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (110,3,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (111,3,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (112,3,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (113,3,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (114,3,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (115,4,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (116,4,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (117,4,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (118,4,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (119,4,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (120,4,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (121,4,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (122,4,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (123,4,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (124,4,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (125,4,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (126,4,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (127,4,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (128,4,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (129,4,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (130,4,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (131,4,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (132,4,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (133,4,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (134,4,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (135,4,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (136,4,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (137,4,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (138,4,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (139,4,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (140,4,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (141,4,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (142,4,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (143,4,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (144,4,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (145,4,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (146,4,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (147,4,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (148,4,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (149,4,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (150,4,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (151,4,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (152,4,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (153,5,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (154,5,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (155,5,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (156,5,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (157,5,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (158,5,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (159,5,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (160,5,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (161,5,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (162,5,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (163,5,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (164,5,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (165,5,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (166,5,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (167,5,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (168,5,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (169,5,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (170,5,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (171,5,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (172,5,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (173,5,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (174,5,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (175,5,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (176,5,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (177,5,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (178,5,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (179,5,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (180,5,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (181,5,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (182,5,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (183,5,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (184,5,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (185,5,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (186,5,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (187,5,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (188,5,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (189,5,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (190,5,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (191,6,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (192,6,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (193,6,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (194,6,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (195,6,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (196,6,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (197,6,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (198,6,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (199,6,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (200,6,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (201,6,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (202,6,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (203,6,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (204,6,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (205,6,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (206,6,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (207,6,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (208,6,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (209,6,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (210,6,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (211,6,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (212,6,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (213,6,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (214,6,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (215,6,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (216,6,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (217,6,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (218,6,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (219,6,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (220,6,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (221,6,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (222,6,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (223,6,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (224,6,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (225,6,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (226,6,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (227,6,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (228,6,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (229,7,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (230,7,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (231,7,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (232,7,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (233,7,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (234,7,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (235,7,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (236,7,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (237,7,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (238,7,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (239,7,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (240,7,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (241,7,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (242,7,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (243,7,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (244,7,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (245,7,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (246,7,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (247,7,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (248,7,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (249,7,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (250,7,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (251,7,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (252,7,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (253,7,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (254,7,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (255,7,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (256,7,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (257,7,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (258,7,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (259,7,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (260,7,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (261,7,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (262,7,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (263,7,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (264,7,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (265,7,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (266,7,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (267,8,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (268,8,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (269,8,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (270,8,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (271,8,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (272,8,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (273,8,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (274,8,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (275,8,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (276,8,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (277,8,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (278,8,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (279,8,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (280,8,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (281,8,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (282,8,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (283,8,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (284,8,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (285,8,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (286,8,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (287,8,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (288,8,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (289,8,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (290,8,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (291,8,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (292,8,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (293,8,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (294,8,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (295,8,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (296,8,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (297,8,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (298,8,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (299,8,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (300,8,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (301,8,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (302,8,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (303,8,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (304,8,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (305,9,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (306,9,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (307,9,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (308,9,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (309,9,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (310,9,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (311,9,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (312,9,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (313,9,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (314,9,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (315,9,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (316,9,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (317,9,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (318,9,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (319,9,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (320,9,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (321,9,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (322,9,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (323,9,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (324,9,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (325,9,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (326,9,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (327,9,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (328,9,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (329,9,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (330,9,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (331,9,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (332,9,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (333,9,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (334,9,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (335,9,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (336,9,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (337,9,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (338,9,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (339,9,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (340,9,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (341,9,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (342,9,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (343,10,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (344,10,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (345,10,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (346,10,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (347,10,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (348,10,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (349,10,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (350,10,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (351,10,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (352,10,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (353,10,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (354,10,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (355,10,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (356,10,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (357,10,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (358,10,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (359,10,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (360,10,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (361,10,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (362,10,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (363,10,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (364,10,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (365,10,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (366,10,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (367,10,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (368,10,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (369,10,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (370,10,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (371,10,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (372,10,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (373,10,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (374,10,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (375,10,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (376,10,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (377,10,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (378,10,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (379,10,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (380,10,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (381,11,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (382,11,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (383,11,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (384,11,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (385,11,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (386,11,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (387,11,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (388,11,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (389,11,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (390,11,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (391,11,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (392,11,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (393,11,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (394,11,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (395,11,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (396,11,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (397,11,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (398,11,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (399,11,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (400,11,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (401,11,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (402,11,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (403,11,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (404,11,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (405,11,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (406,11,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (407,11,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (408,11,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (409,11,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (410,11,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (411,11,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (412,11,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (413,11,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (414,11,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (415,11,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (416,11,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (417,11,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (418,11,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (419,12,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (420,12,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (421,12,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (422,12,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (423,12,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (424,12,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (425,12,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (426,12,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (427,12,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (428,12,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (429,12,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (430,12,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (431,12,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (432,12,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (433,12,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (434,12,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (435,12,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (436,12,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (437,12,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (438,12,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (439,12,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (440,12,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (441,12,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (442,12,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (443,12,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (444,12,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (445,12,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (446,12,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (447,12,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (448,12,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (449,12,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (450,12,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (451,12,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (452,12,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (453,12,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (454,12,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (455,12,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (456,12,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (457,13,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (458,13,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (459,13,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (460,13,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (461,13,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (462,13,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (463,13,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (464,13,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (465,13,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (466,13,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (467,13,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (468,13,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (469,13,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (470,13,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (471,13,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (472,13,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (473,13,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (474,13,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (475,13,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (476,13,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (477,13,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (478,13,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (479,13,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (480,13,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (481,13,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (482,13,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (483,13,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (484,13,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (485,13,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (486,13,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (487,13,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (488,13,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (489,13,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (490,13,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (491,13,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (492,13,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (493,13,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (494,13,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (495,14,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (496,14,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (497,14,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (498,14,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (499,14,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (500,14,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (501,14,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (502,14,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (503,14,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (504,14,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (505,14,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (506,14,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (507,14,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (508,14,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (509,14,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (510,14,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (511,14,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (512,14,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (513,14,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (514,14,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (515,14,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (516,14,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (517,14,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (518,14,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (519,14,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (520,14,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (521,14,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (522,14,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (523,14,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (524,14,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (525,14,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (526,14,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (527,14,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (528,14,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (529,14,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (530,14,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (531,14,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (532,14,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (533,15,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (534,15,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (535,15,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (536,15,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (537,15,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (538,15,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (539,15,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (540,15,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (541,15,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (542,15,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (543,15,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (544,15,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (545,15,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (546,15,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (547,15,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (548,15,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (549,15,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (550,15,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (551,15,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (552,15,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (553,15,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (554,15,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (555,15,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (556,15,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (557,15,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (558,15,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (559,15,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (560,15,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (561,15,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (562,15,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (563,15,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (564,15,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (565,15,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (566,15,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (567,15,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (568,15,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (569,15,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (570,15,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (571,16,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (572,16,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (573,16,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (574,16,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (575,16,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (576,16,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (577,16,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (578,16,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (579,16,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (580,16,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (581,16,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (582,16,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (583,16,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (584,16,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (585,16,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (586,16,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (587,16,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (588,16,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (589,16,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (590,16,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (591,16,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (592,16,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (593,16,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (594,16,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (595,16,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (596,16,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (597,16,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (598,16,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (599,16,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (600,16,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (601,16,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (602,16,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (603,16,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (604,16,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (605,16,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (606,16,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (607,16,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (608,16,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (609,17,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (610,17,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (611,17,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (612,17,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (613,17,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (614,17,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (615,17,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (616,17,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (617,17,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (618,17,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (619,17,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (620,17,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (621,17,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (622,17,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (623,17,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (624,17,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (625,17,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (626,17,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (627,17,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (628,17,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (629,17,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (630,17,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (631,17,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (632,17,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (633,17,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (634,17,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (635,17,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (636,17,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (637,17,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (638,17,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (639,17,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (640,17,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (641,17,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (642,17,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (643,17,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (644,17,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (645,17,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (646,17,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (647,18,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (648,18,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (649,18,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (650,18,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (651,18,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (652,18,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (653,18,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (654,18,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (655,18,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (656,18,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (657,18,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (658,18,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (659,18,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (660,18,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (661,18,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (662,18,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (663,18,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (664,18,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (665,18,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (666,18,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (667,18,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (668,18,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (669,18,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (670,18,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (671,18,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (672,18,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (673,18,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (674,18,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (675,18,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (676,18,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (677,18,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (678,18,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (679,18,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (680,18,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (681,18,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (682,18,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (683,18,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (684,18,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (685,19,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (686,19,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (687,19,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (688,19,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (689,19,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (690,19,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (691,19,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (692,19,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (693,19,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (694,19,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (695,19,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (696,19,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (697,19,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (698,19,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (699,19,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (700,19,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (701,19,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (702,19,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (703,19,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (704,19,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (705,19,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (706,19,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (707,19,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (708,19,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (709,19,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (710,19,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (711,19,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (712,19,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (713,19,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (714,19,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (715,19,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (716,19,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (717,19,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (718,19,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (719,19,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (720,19,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (721,19,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (722,19,38);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (723,20,1);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (724,20,2);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (725,20,3);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (726,20,4);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (727,20,5);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (728,20,6);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (729,20,7);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (730,20,8);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (731,20,9);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (732,20,10);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (733,20,11);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (734,20,12);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (735,20,13);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (736,20,14);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (737,20,15);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (738,20,16);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (739,20,17);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (740,20,18);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (741,20,19);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (742,20,20);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (743,20,21);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (744,20,22);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (745,20,23);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (746,20,24);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (747,20,25);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (748,20,26);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (749,20,27);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (750,20,28);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (751,20,29);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (752,20,30);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (753,20,31);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (754,20,32);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (755,20,33);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (756,20,34);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (757,20,35);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (758,20,36);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (759,20,37);
INSERT INTO pizza_topping_rel(pizza_topping_rel_id,pizza_id,topping_id) VALUES (760,20,38);

commit;



