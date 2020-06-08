DROP TABLE connections CASCADE CONSTRAINTS;
DROP TABLE managements CASCADE CONSTRAINTS;
DROP TABLE post_likes CASCADE CONSTRAINTS;
DROP TABLE comments_likes CASCADE CONSTRAINTS;
DROP TABLE post_in_tags CASCADE CONSTRAINTS;
DROP TABLE followed_tags CASCADE CONSTRAINTS;
DROP TABLE tags CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE view_profile CASCADE CONSTRAINTS;
DROP TABLE experience CASCADE CONSTRAINTS;
DROP TABLE post CASCADE CONSTRAINTS;
DROP TABLE company CASCADE CONSTRAINTS;
DROP TABLE users_ CASCADE CONSTRAINTS;


CREATE TABLE users_(
    id_ NUMBER,
    first_name VARCHAR2(50 CHAR) NOT NULL,
    last_name VARCHAR2(50 CHAR) NOT NULL,
    email VARCHAR2(50 CHAR) NOT NULL UNIQUE,
    password_hash NUMBER,
    website VARCHAR2(50 CHAR),
    
    CONSTRAINT user_pk PRIMARY KEY(id_)
);

CREATE TABLE connections(
    user1 NUMBER NOT NULL,
    user2 NUMBER,
    
    CONSTRAINT connections_usr1_fk FOREIGN KEY (user1) 
    REFERENCES users_ (id_),
    
    CONSTRAINT connections_usr2_fk FOREIGN KEY (user2) 
    REFERENCES users_ (id_)
);

CREATE TABLE view_profile(
    viewer NUMBER,
    user_ NUMBER,
    date_ DATE NOT NULL,
    
    CONSTRAINT view_profile_usr1_fk FOREIGN KEY (viewer) 
    REFERENCES users_ (id_),
    
    CONSTRAINT view_profile_usr2_fk FOREIGN KEY (user_) 
    REFERENCES users_ (id_)
);


CREATE TABLE company(
    id_ NUMBER,
    name_ VARCHAR2(50 CHAR) NOT NULL,
    city VARCHAR2(50 CHAR) NOT NULL,
    industry VARCHAR2(50 CHAR) NOT NULL,
    manager_ NUMBER,
    
    CONSTRAINT company_pk PRIMARY KEY (id_),
    
    CONSTRAINT company_manager_fk FOREIGN KEY (manager_) 
    REFERENCES users_ (id_)
);

CREATE TABLE experience(
    id_ NUMBER,
    user_ NUMBER NOT NULL,
    start_ DATE NOT NULL,
    end_ DATE,
    position_ VARCHAR2(50 CHAR),
    company NUMBER,
    
    CONSTRAINT exp_pk PRIMARY KEY (id_),
    
    CONSTRAINT exp_company_fk FOREIGN KEY (company) 
    REFERENCES company (id_),
        
    CONSTRAINT exp_user_fk FOREIGN KEY (user_) 
    REFERENCES users_ (id_)
);

CREATE TABLE managements(
    company NUMBER NOT NULL,
    user_ NUMBER NOT NULL,
    position_ VARCHAR2(50 CHAR),
    
    CONSTRAINT management_pk PRIMARY KEY (company, user_),
    
    CONSTRAINT management_company_fk FOREIGN KEY (company) 
    REFERENCES company (id_)
    ON DELETE CASCADE,
    
    CONSTRAINT management_user_fk FOREIGN KEY (user_) 
    REFERENCES users_ (id_)
);

CREATE TABLE post(
    id_ NUMBER,
    author_comp NUMBER,
    author_usr NUMBER,
    date_ DATE NOT NULL,
    text VARCHAR2(1000 CHAR) NOT NULL,
    
    CONSTRAINT post_pk PRIMARY KEY (id_),
    
    CONSTRAINT post_comp_fk FOREIGN KEY (author_comp) 
    REFERENCES company (id_)
    ON DELETE CASCADE,
    
    CONSTRAINT post_usr_fk FOREIGN KEY (author_usr) 
    REFERENCES users_ (id_)
);

CREATE TABLE tags(
    id_ NUMBER,
    name_ VARCHAR2(50 CHAR) UNIQUE,
    
    CONSTRAINT tag_pk PRIMARY KEY (id_)
);

CREATE TABLE post_in_tags(
    tag_ NUMBER NOT NULL,
    post NUMBER NOT NULL,
    
    CONSTRAINT mm_tag_fk FOREIGN KEY (tag_) 
    REFERENCES tags (id_),
    
    CONSTRAINT mm_post_fk FOREIGN KEY (post) 
    REFERENCES post (id_)
);

CREATE TABLE comments(
    id_ NUMBER,
    author NUMBER,
    post NUMBER,
    text VARCHAR2(200 CHAR),
    date_ DATE,
    
    CONSTRAINT comment_pk PRIMARY KEY (id_),
    
    CONSTRAINT comment_author_fk FOREIGN KEY (author) 
    REFERENCES users_ (id_),
    
    CONSTRAINT comment_post_fk FOREIGN KEY (post) 
    REFERENCES post (id_)
);

CREATE TABLE post_likes(
    user_ NUMBER NOT NULL,
    post NUMBER NOT NULL,
    
    CONSTRAINT post_likes_usr_fk FOREIGN KEY (user_) 
    REFERENCES users_ (id_),
    
    CONSTRAINT post_likes_post_fk FOREIGN KEY (post) 
    REFERENCES post (id_)
);


CREATE TABLE comments_likes(
    user_ NUMBER NOT NULL,
    comment_ NUMBER NOT NULL,
    
    CONSTRAINT comment_likes_usr_fk FOREIGN KEY (user_) 
    REFERENCES users_ (id_),
    
    CONSTRAINT comment_likes_comm_fk FOREIGN KEY (comment_) 
    REFERENCES comments  (id_)
);

CREATE TABLE followed_tags(
    user_ NUMBER,
    tag_ NUMBER,
    
    CONSTRAINT follow_pk PRIMARY KEY (user_, tag_),
    
    CONSTRAINT follow_user_fk FOREIGN KEY (user_) 
    REFERENCES users_ (id_),
    
    CONSTRAINT follow_tag_fk FOREIGN KEY (tag_) 
    REFERENCES tags (id_)
);

