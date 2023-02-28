-- ȸ�� ���̺� member ����
CREATE TABLE MEMBER(
    id varchar2(12) not null primary key,
    pass varchar2(12) not null,
    name varchar2(20) not null,
    reg_date DATE not null
);

alter table member 
add age number;

alter table member
add gender varchar2(5);

alter table member
add address varchar2(1000);

-- ������� member ���̺� ���� ����
desc member;

commit; -- ���� �ݿ�
-- ---------------------------------------------------

-- �亯���� �޼� �ְ� ����¡ ó���� ������ �Խ��� board���̺� ����
CREATE TABLE board(
    b_idx number  PRIMARY KEY, -- �Խ����� ���� ������(�۹�ȣ)
    b_id  varchar2(20) not null, -- ���� �ۼ��� ����� ���̵�
    b_pw  varchar2(10), -- �ۼ��ϴ� ���� ��й�ȣ 
    b_name varchar2(20), -- ���� �ۼ��� ����� �̸�
    b_email varchar2(50), -- ���� �ۼ��� ����� �̸���
    b_title varchar2(100), -- �ۼ��ϴ� ���� ����
    b_content varchar2(4000), -- �ۼ��ϴ� ���� ����
    b_group number, -- �ֱ� �� �亯�� �׷����� �����ټ� �ִ� �׷��ȣ
    b_level number, -- �ۼ��� �亯���� �鿩���� ���� ���� ��
    b_date Date, -- ���� �ۼ��� ��¥
    b_cnt number, -- �� ��ȸ�� 
       -- id �÷��� ȸ�����̺� member��  id�÷��� ���� �ܷ�Ű�� �����մϴ�.
    CONSTRAINT FK_BOARD_b_ID FOREIGN KEY(b_id)
    REFERENCES member(id) ON DELETE CASCADE
);

--
--FOREIGN KEY
--�ܷ�Ű ���� PK�� ���������� �ſ� �߿��� ���������̴�.
--
--�ܺ�Ű, �ܷ�Ű, ����Ű, �ܺ� �ĺ��� ������ �Ҹ��� ���� FK��� �Ѵ�.
--FK�� ���ǵ� ���̺��� �ڽ� ���̺��̶�� Ī�Ѵ�.
--�����Ǵ� ���̺� ��, PK�� �ִ� ���̺��� �θ� ���̺��̶� �Ѵ�.
--�θ� ���̺��� PK �÷��� �����ϴ� �����͸� �ڽ� ���̺� �Է��� �� �ִ�.
--�θ� ���̺��� �ڽ��� �����ͳ� ���̺��� �����ȴٰ� ������ ���� �ʴ´�.
--�����ϴ� ������ �÷��� ������ Ÿ���� �ݵ�� ��ġ�ؾ� �Ѵ�.
--������ �� �ִ� �÷��� �⺻Ű(PK)�� UNIQUE�� �����ϴ�.(���� PK�� ���´�.)
--���������� �߰��� �� ���Ǵ� ������ ������ ����.
--
-- 
--
--�� ����
--
--CONSTRAINT [�������� ��] FOREIGN KEY([�÷���])
--    REFERENCES [������ ���̺� �̸�]([������ �÷�])
--   [ON DELETE CASCADE | ON DELETE SET NULL]
--
--
--���� ���̺��� �����ϸ鼭 ����غ��� ������ ���� ����� �� �ִ�.
--
--CREATE TABLE parentTable(
--    parentPk NUMBER PRIMARY KEY
--);
--
--
--CREATE TABLE consTest(
--    parentPk NUMBER,
--    pkCol1 CHAR(8),
--    
--    CONSTRAINT fk_code FOREIGN KEY(parentPk)
--    REFERENCES parentTable(parentPk) ON DELETE CASCADE
--);
--������ �÷��� ���� �÷��� �ڽ� ���̺� �����ؾ߸� �Ѵ�.
--
--(���� ���� �̸��� ���� �÷��� �ʿ�� ������ �Ϲ������δ� ���� �̸��� ���� �÷��� �����Ѵ�.)
--
--�׸��� �����Ǵ� �÷��� �����Ͱ� ���� �־�� �ϱ� ������ �ڽ� ���̺� ���� ���� ���� �� ����.
--
-- 
--
--�׸��� Ư���ϰԵ� FK�� ������ �� ���Ǵ� �� ���� �ɼ��� �����Ѵ�.
--
--ON DELETE CASCADE
--�����Ǵ� �θ� ���̺� �࿡ ���� DELETE�� ����Ѵ�.
--
--��, �����Ǵ� �θ� ���̺� ���� �����Ǹ� ���������� �ڽ� ���̺� �� ���� �����ȴٴ� �ǹ��̴�.
--
--ON DELETE SET NULL
--�����Ǵ� �θ� ���̺� �࿡ ���� DELETE�� ����Ѵ�.
--
--�̰� CASCADE�ʹ� �ٸ���, �θ� ���̺��� ���� �����Ǹ� �ش� �����ϴ� �ڽ� ���̺��� ������ NULL�� �����Ǵ� �ɼ��̴�.
--
-- 
--
--�Ϲ������� ON DELETE CASCADE �ɼ��� ���� ����Ѵ�.
--
--�ش� �ɼ��� ������� ������ �����ִ� ��� �ڽ� ���̺��� ���� ���� �� ������� �ϱ� �����̴�.

-- https://mine-it-record.tistory.com/45

-- ������ ����
create sequence border_b_idx
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
-- ---------------------

-- ��Ʈī ȸ�翡 ��� ���� ������ ����Ǵ� carlist���̺� ����
create table carlist(   
    carno NUMBER NOT NULL PRIMARY KEY, -- �� ��ȣ 
    carname VARCHAR2(50) NOT NULL, -- �� �̸�
    carcompany VARCHAR2(50) NOT NULL, -- �� ������ �� 
    carprice NUMBER NOT NULL, -- �� �Ѵ�� ��Ʈ ����
    carusepeople NUMBER NOT NULL, -- �ν� ���� 
    carinfo VARCHAR2(500) NOT NULL, -- ���� �� ���� 
    carimg VARCHAR2(50) NOT NULL, -- ���� �̹��� ��
    carcategory VARCHAR2(10) NOT NULL -- �� ����( ���� or ���� or  ����)
); 

-- carlist���̺� ���� ������ �߰�
INSERT INTO carlist VALUES(1,'�ƹ���','����',80000,4,'�������� ������������ �߳����ϴ�.','avante.jpg','Small');
INSERT INTO carlist VALUES(2, 'ī����', '����', 90000, 4, '�������� ������������ �߳����ϴ�.', 'carens.jpg', 'Small' );
INSERT INTO carlist VALUES(3, 'ī�Ϲ�', '���', 100000, 9, '�������� ������������ �߳����ϴ�.', 'canival.jpg', 'Small' );
INSERT INTO carlist VALUES(4, '�ڶ���', '�ֿ�', 110000, 4, '�������� ������������ �߳����ϴ�.', 'co.jpg', 'Small' );
INSERT INTO carlist VALUES(101, '����', '����', 120000, 5, '�������� ������������ �߳����ϴ�.', 'equus.jpg', 'Mid' );
INSERT INTO carlist VALUES(102, '�׷���', '����', 130000, 5, '�������� ������������ �߳����ϴ�.', 'grandeur.jpg', 'Mid' );
INSERT INTO carlist VALUES(103, 'k3', '���', 140000, 4, '�������� ������������ �߳����ϴ�.', 'k3.jpg', 'Mid' );
INSERT INTO carlist VALUES(104, 'k5', '���', 150000, 4, '�������� ������������ �߳����ϴ�.', 'k5.jpg', 'Mid' );
INSERT INTO carlist VALUES(201, 'k7', '���', 160000, 4, '�������� ������������ �߳����ϴ�.', 'k7.jpg', 'Big' );
INSERT INTO carlist VALUES(202, 'k9', '���', 170000, 4, '�������� ������������ �߳����ϴ�.', 'k9.jpg', 'Big' );
INSERT INTO carlist VALUES(203, '������', 'GM', 180000, 4, '�������� ������������ �߳����ϴ�.', 'malibu.jpg', 'Big' );
INSERT INTO carlist VALUES(204, 'bmw528i', 'bmw', 190000, 5, '�������� ������������ �߳����ϴ�.', 'bmw.jpg', 'Big' );

COMMIT;





-- �� ȸ�� ���� ��Ʈ(�뿩)�ֹ� ��Ȳ�� DB�� ���� �ϱ� ���� 
-- non_carorder ���̺� ����� 

-- non_orderid; //�ڵ��� ��Ʈ(�뿩) �ֹ�id ����
-- carno; //��Ʈ�� ���� ����ȣ ����
-- carqty;//��Ʈ ���� �뿩 ���� ����
--  carreserveday;//�뿩�Ⱓ ����
--  carbegindate;//�ڵ����� ��Ʈ(�뿩)�� ���۳�¥ ����.
--  carins;//��Ʈ�� �������� �ϼ� ����
--  carwifi;//��Ʈ�� ����wifi���� �ϼ� ����
--  carnave;//��Ʈ�� �׺���̼� ���뿩�� ����  (����� �����ϸ�1, �������̸�0)
--  carbabyseat;//��Ʈ�� ���̺��Ʈ���� �ϼ� ���� 
--  memberphone;// ��ȸ������ ��Ʈ�� ��� ����ȣ ����
--  memberpass;// ��ȸ������ ��Ʈ�� �ֹ� �н����� ����

Create Table non_carorder(
 non_orderid number PRIMARY KEY,
 carno number not null,
 carqty number not null,
 carreserveday number not null,
 carbegindate varchar2(50) not null,
 carins number not null,
 carwifi number not null,
 carnave number not null,
 carbabyseat number not null,
 memberphone varchar2(50) not null,
 memberpass varchar2(50) not null
);

create sequence non_carorder_non_orderid
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
 
 
-- ȸ�� ���� ��Ʈ(�뿩)�ֹ� ��Ȳ�� DB�� ���� �ϱ� ���� 
-- carorder ���̺� ����� 

-- orderid; //�ڵ��� ��Ʈ(�뿩) �ֹ�id ����
-- id; //��Ʈ�� ��� ID ���� <- member���̺� �����  id�� ������
-- carno; //��Ʈ�� ���� ����ȣ ����
-- carqty;//��Ʈ ���� �뿩 ���� ����
--  carreserveday;//�뿩�Ⱓ ����
--  carbegindate;//�ڵ����� ��Ʈ(�뿩)�� ���۳�¥ ����.
--  carins;//��Ʈ�� �������� �ϼ� ����
--  carwifi;//��Ʈ�� ����wifi���� �ϼ� ����
--  carnave;//��Ʈ�� �׺���̼� ���뿩�� ����  (����� �����ϸ�1, �������̸�0)
--  carbabyseat;//��Ʈ�� ���̺��Ʈ���� �ϼ� ���� 
--  memberphone;// ��ȸ������ ��Ʈ�� ��� ����ȣ ����
--  memberpass;// ��ȸ������ ��Ʈ�� �ֹ� �н����� ����       
Create Table carorder(
 orderid number PRIMARY KEY,
 id VARCHAR2(12) not null,
 carno number not null,
 carqty number not null,
 carreserveday number not null,
 carbegindate varchar2(50) not null,
 carins number not null,
 carwifi number not null,
 carnave number not null,
 carbabyseat number not null,
 memberphone varchar2(50) not null,
 memberpass varchar2(50) not null,
 -- id �÷��� ȸ�����̺� member��  id�÷��� ���� �ܷ�Ű�� �����մϴ�.
CONSTRAINT FK_carorder_id FOREIGN KEY(id)
REFERENCES member(id) ON DELETE CASCADE
);       
       
       
delete from board;       
       
       commit;
       
-- �亯���� �޼� �ְ� ����¡ ó���� �����ϰ� ����÷�� �� �ٿ�ε� ������
-- �Խ��� FileBoard���̺� ����
CREATE TABLE FileBoard(
    b_idx number  PRIMARY KEY, -- �Խ����� ���� ������(�۹�ȣ)
    b_id  varchar2(20) not null, -- ���� �ۼ��� ����� ���̵�
    b_pw  varchar2(10), -- �ۼ��ϴ� ���� ��й�ȣ 
    b_name varchar2(20), -- ���� �ۼ��� ����� �̸�
    b_email varchar2(50), -- ���� �ۼ��� ����� �̸���
    b_title varchar2(100), -- �ۼ��ϴ� ���� ����
    b_content varchar2(4000), -- �ۼ��ϴ� ���� ����
    b_group number, -- �ֱ� �� �亯�� �׷����� �����ټ� �ִ� �׷��ȣ
    b_level number, -- �ۼ��� �亯���� �鿩���� ���� ���� ��
    b_date Date, -- ���� �ۼ��� ��¥
    b_cnt number, -- �� ��ȸ��
    ofile   varchar2(200),  -- ÷��(���ε�)�� �������� �� 
    sfile   varchar2(30),   -- ÷��(���ε�)�� ���� ���ϸ� (����� ���ϸ�)
    downcount number(5) default 0 not null, -- �ٿ�ε��� Ƚ�� 
    
       -- id �÷��� ȸ�����̺� member��  id�÷��� ���� �ܷ�Ű�� �����մϴ�.
    CONSTRAINT FK_FileBoard_b_ID FOREIGN KEY(b_id)
    REFERENCES member(id) ON DELETE CASCADE
);       
       
-- sfile   varchar2(30) �ٿ���ϴ� ���ϸ��� �� ��� ������ ���⶧����
--  sfile varchar2(1000) ���� ���� 
ALTER TABLE FileBoard MODIFY(sfile varchar2(1000));       
       
commit;      
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       