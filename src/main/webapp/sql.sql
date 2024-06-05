-- 1-1. ȸ�������� ������ ������ �� �ִ� 'web_member'���̺��� ����ÿ�.
--    �÷��� : email(pk) / pw / tel / address
-- 	  ������Ÿ�� : varchar2(100)

-- 1-2. test�� �ֱ�

-- 1-3. test�� ��ȸ�ϱ�


-- 2-1. �޽��� ������ ������ �� �ִ� 'web_message'���̺��� ����ÿ�.
-- �÷��� : num(pk)/ sendName / receiveEmail / message/ m_date
-- ������Ÿ�� : number / varchar2(100) / date

-- 2-2. num�� �Է��� ������ ���� : num_message

-- 2-3. test�� �ֱ�

-- 2-4. test�� ��ȸ�ϱ�


-- 3-1. �Խñ� ������ ������ �� �ִ� 'web_board' ���̺��� ����ÿ�
-- �÷��� : num(pk)/ title / writer/ filename / content / b_date
-- ������Ÿ�� : number / varchar2(100) / date

-- 3-2. num�� �Է��� ������ ���� : num_board

-- 3-3. test�� �ֱ�

-- 3-4. test�� ��ȸ�ϱ�

create table web_board (
	num number primary key,
	title varchar2(100),
	writer varchar2(100),
	filename varchar2(100),
	content varchar2(200),
	b_date date
	);
	
	select * from WEB_BOARD;
	
	create sequence num_board
	start with 1
	increment by 1;
	
	insert into web_board values(num_board.nextval,'test','test','test','test',sysdate);






