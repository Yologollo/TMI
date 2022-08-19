-- 회원
create table tmi_member (
    m_no number not null,
    m_email varchar2(256) not null,
    m_nickname  varchar2(256) not null,
    m_password varchar2(512) not null,
    m_name varchar2(256) not null,
    m_phone char(11) not null,
    m_created_at date default sysdate,
    
    constraint pk_m_email primary key(m_email)
);

create sequence seq_m_no;

-- 회원 등급
create table tmi_member_role (
    mr_auth varchar2(20),
    mr_m_email varchar2(256) not null,
    
    constraint pk_mr_auth primary key(mr_auth, mr_m_email),
    constraint fk_member_role_m_email foreign key(mr_m_email) references tmi_member(m_email) on delete cascade
);

-- 자동 로그인
create table persistent_logins (
    username varchar(64) not null, 
    series varchar(64) primary key, 
    token varchar(64) not null, -- username, password, expiry time을 hashing한 값
    last_used timestamp not null
);

-- 플래너
create table tmi_planner (
    p_no number not null,
    p_m_email varchar2(256) not null,
    p_title varchar2(2000) not null,
    p_explan varchar2(2000),
    p_leave_date date not null,
    p_return_date date not null,
    p_write_date date default sysdate,
    
    constraint pk_p_no primary key(p_no),
    constraint fk_planner_m_email foreign key(p_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_p_no;

-- 플래너 플랜
create table tmi_planner_plan (
    pp_no number not null,
    pp_p_no number not null,
    pp_time timestamp,
    pp_place_name varchar2(2000),
    pp_memo varchar2(2000) default null,
    pp_x varchar2(256) not null,
    pp_y varchar2(256) not null,
    pp_date date,
    
    constraint pk_pp_no primary key(pp_no),
    constraint fk_planner_plan_p_no foreign key(pp_p_no) references tmi_planner(p_no) on delete cascade
);
drop table tmi_planner_plan;
create sequence seq_pp_no;

-- 플래너 게시판
create table tmi_planner_board (
    pb_no number ,
    pb_p_no number not null,
    pb_m_email varchar2(256) not null,
    pb_title varchar2(2000),
    pb_created_at date default sysdate,
    pb_updated_at date default sysdate,
    pb_read_count number default 0,
    pb_content clob,
    
    constraint pk_pb_no primary key(pb_no),
    constraint fk_planner_board_p_no foreign key(pb_p_no) references tmi_planner(p_no) on delete cascade,
    constraint fk_planner_board_m_email foreign key(pb_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_fb_no;

-- 플래너 게시판 댓글
create table tmi_planner_board_comment (
    pbc_no number,
    pbc_pb_no number,
    pbc_m_email varchar2(256) not null,
    pbc_created_at date default sysdate,
    pbc_content varchar2(256),
    
    constraint pk_pbc_no primary key(pbc_no),
    constraint fk_planner_board_comment_pb_no foreign key(pbc_pb_no) references tmi_planner_board(pb_no) on delete cascade,
    constraint fk_planner_board_comment_m_email foreign key(pbc_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_pbc_no;

-- 플래너 게시판 좋아요
create table tmi_planner_board_love (
    pbl_love_no number not null,
    pbl_m_email varchar2(256) not null,
    pbl_pb_no number,
    pbl_lovetype char(1) default '0',
    
    constraint pk_pbl_love_no primary key(pbl_love_no),
    constraint fk_planner_board_love_pb_no foreign key(pbl_pb_no) references tmi_planner_board(pb_no) on delete cascade,
    constraint fk_planner_board_love_m_email foreign key(pbl_m_email) references tmi_member(m_email) on delete cascade
);

-- 후기 게시판
create table tmi_review_board (
    rb_no number,
    rb_p_no number,
    rb_m_email varchar2(256) not null,
    rb_title varchar2(2000),
    rb_created_at date default sysdate,
    rb_updated_at date default sysdate,
    rb_read_count number default 0,
    rb_content clob,
    
    constraint pk_rb_no primary key(rb_no),
    constraint fk_review_board_p_no foreign key(rb_p_no) references tmi_planner(p_no) on delete cascade,
    constraint fk_review_board_m_email foreign key(rb_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_rb_no;

-- 후기 게시판 첨부파일
create table tmi_review_board_attachment (
    rba_no number,
    rba_rb_no number,
    rba_attachment_original_filename varchar2(256) not null,
    rba_attachment_renamed_filename varchar2(256) not null,
    rba_attachment_created_at date default sysdate,
    
    constraint pk_rba_no primary key(rba_no),
    constraint fk_review_board_attachment_rb_no foreign key(rba_rb_no) references tmi_review_board(rb_no) on delete cascade
);

create sequence seq_rba_no;

-- 후기 게시판 좋아요
create table tmi_review_board_love (
    rbl_love_no number not null,
    rbl_rb_no number,
    rbl_m_email varchar2(256) not null,
    rbl_lovetype char(1) default 0,
    
    constraint pk_rbl_love_no primary key(rbl_love_no),
    constraint fk_review_board_love_rb_no foreign key(rbl_rb_no) references tmi_review_board(rb_no) on delete cascade,
    constraint fk_review_board_love_m_email foreign key(rbl_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_rbl_love_no;

-- 후기 게시판 댓글
create table tmi_review_board_comment (
    rbc_no number,
    rbc_rb_no number,
    rbc_m_email varchar2(256) not null,
    rb_comment_create_at date default sysdate,
    rb_content varchar2(1000),
    
    constraint pk_rbc_no primary key(rbc_no),
    constraint fk_planner_review_coment_rb_no foreign key(rbc_rb_no) references tmi_review_board(rb_no) on delete cascade,
    constraint fk_planner_review_m_email foreign key(rbc_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_rbc_no;

-- 여행 친구 게시판
Create table tmi_friend_board (
    fb_no number,
    fb_p_no number,
    fb_m_email varchar2(256) not null,
    fb_title varchar2(256),
    fb_created_at date default sysdate,
    fb_updated_at date default sysdate,
    fb_read_count number default 0,
    fb_content clob,
    
    constraint pk_fb_no primary key(fb_no),
    constraint fk_friend_board_p_no foreign key(fb_p_no) references tmi_planner(p_no) on delete cascade,
    constraint fk_friend_board_m_email foreign key(fb_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_pb_no;

-- 여행친구 게시판 첨부파일
Create table tmi_friend_board_attachment (
    fba_no number,
    fba_fb_no number,
    fba_original_filename varchar2(256) not null,
    fba_renamed_filename varchar2(256) not null,
    tba_created_at date default sysdate,
    
    constraint pk_fba_no primary key(fba_no),
    constraint fk_friend_board_attachment_fb_no foreign key(fba_fb_no) references tmi_friend_board(fb_no) on delete cascade
);

create sequence seq_fba_no;

-- 여행친구 게시판 댓글
Create table tmi_friend_board_comment (
    fbc_no number,
    fbc_m_email varchar2(256) not null,
    fbc_fb_no number,
    fbc_created_at date default sysdate,
    fbc_content varchar2(1000),
    
    constraint pk_fbc_no primary key(fbc_no),
    constraint fk_planner_friend_coment_rb_no foreign key(fbc_fb_no) references tmi_friend_board(fb_no) on delete cascade,
    constraint fk_planner_friend_m_email foreign key(fbc_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_fbc_no;

-- 공지사항
create table tmi_notice_board (
    nb_no number,
    nb_m_email varchar2(256) not null,
    nb_title varchar2(2000),
    nb_created_at date default sysdate,
    nb_update_at date default sysdate,
    nb_read_count number default 0,
    nb_content clob,
    
    constraint pk_nb_no primary key(nb_no),
    constraint fk_notice_board_m_email foreign key(nb_m_email) references tmi_member(m_email) on delete cascade
);

create sequence seq_nb_no;

-- 공지사항 _첨부파일
create table tmi_notice_board_attachment (
    nba_no number,
    nba_nb_no number,
    nba_original_filename varchar2(256) not null,
    nba_renamed_filename varchar2(256) not null,
    nba_created_at date default sysdate,
    
    constraint pk_nba_no primary key(nba_no),
    constraint fk_friend_board_attachment_nb_no foreign key(nba_nb_no) references tmi_notice_board(nb_no) on delete cascade
);

create sequence seq_nba_no;

-- 채팅방
create table tmi_chat_room (
    cr_title varchar(2000) not null,
    cr_m_email varchar(256) not null,
    cr_fb_no number,
    cr_created_at date default sysdate,
    cr_last_check number default 0,
    cr_deleted_at date,
    
    constraint pk_chat_member primary key(cr_title, cr_m_email),
    constraint fk_chat_room_m_email foreign key(cr_m_email) references tmi_member(m_email) on delete cascade,
    constraint fk_chat_room_fb_no foreign key(cr_fb_no) references tmi_friend_board(fb_no) on delete cascade
);

-- 채팅 내용
create table tmi_chat_content(
    cc_no number,
    cc_cr_title varchar2(50),
    cc_m_email varchar(256) not null,
    cc_message varchar(2000),
    cc_created_at date default sysdate,
    
    constraint pk_cc_no primary key(cc_no),
    constraint fk_chat_content foreign key(cc_cr_title, cc_m_email) references tmi_chat_room(cr_title, cr_m_email)
);

create sequence seq_cc_no;