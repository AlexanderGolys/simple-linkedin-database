INSERT INTO users_ (id_, first_name, last_name, email, password_hash, website) 
        SELECT 0, 'Magnus', 'Carlsen', 'mc@gmail.com', 21733821, 'magnuscarlsen.com' FROM DUAL UNION ALL
        SELECT 1, 'Hikaru', 'Nakamura', 'hn@gmail.com', 114343, 'naka.com' FROM DUAL UNION ALL
        SELECT 2, 'Levon', 'Aronian', 'la@gmail.com', 654453432, '' FROM DUAL UNION ALL
        SELECT 3, 'Ian', 'Nepomniachtchi', 'in@gmail.com', 43243242, '' FROM DUAL UNION ALL
        SELECT 5, 'Peter', 'Svidler', 'peter@gmail.com', 2342424, '' FROM DUAL UNION ALL
        SELECT 6, 'Wesley', 'So', 'soooo@gmail.com', 76575, '' FROM DUAL UNION ALL
        SELECT 7, 'Alireza', 'Firouzja', 'aliii@gmail.com', 34534, '' FROM DUAL UNION ALL
        SELECT 8, 'Fabiano', 'Caruana', 'caruana@gmail.com', 2342, '' FROM DUAL UNION ALL
        SELECT 9, 'We', 'Yi', 'weyi@gmail.com', 98209432, '' FROM DUAL UNION ALL
        SELECT 10, 'Hou', 'Yifan', 'hou@gmail.com', 92809432, '' FROM DUAL UNION ALL
        SELECT 11, 'Arkady', 'Dvorkovich', 'ad@fide.com', 98209432, '' FROM DUAL UNION ALL
        SELECT 13, 'Alexander', 'Grischuk', 'sasha@gmail.com', 238487329, 'sasha.ru' FROM DUAL UNION ALL
        SELECT 100, 'Account', 'Deleted', 'none', 0, 'none' FROM DUAL;



INSERT INTO connections (user1, user2) 
        SELECT 0, 5 FROM DUAL UNION ALL
        SELECT 0, 6 FROM DUAL UNION ALL
        SELECT 0, 7 FROM DUAL UNION ALL
        SELECT 0, 9 FROM DUAL UNION ALL
        SELECT 0, 13 FROM DUAL UNION ALL
        SELECT 1, 9 FROM DUAL UNION ALL
        SELECT 1, 10 FROM DUAL UNION ALL
        SELECT 1, 13 FROM DUAL UNION ALL
        SELECT 1, 5 FROM DUAL UNION ALL
        SELECT 2, 6 FROM DUAL UNION ALL
        SELECT 2, 7 FROM DUAL UNION ALL
        SELECT 2, 8 FROM DUAL UNION ALL
        SELECT 3, 6 FROM DUAL UNION ALL
        SELECT 3, 8 FROM DUAL UNION ALL
        SELECT 3, 9 FROM DUAL UNION ALL
        SELECT 3, 10 FROM DUAL UNION ALL
        SELECT 3, 13 FROM DUAL UNION ALL
        SELECT 5, 6 FROM DUAL UNION ALL
        SELECT 5, 8 FROM DUAL UNION ALL
        SELECT 5, 10 FROM DUAL UNION ALL
        SELECT 5, 13 FROM DUAL UNION ALL
        SELECT 6, 7 FROM DUAL UNION ALL
        SELECT 7, 10 FROM DUAL UNION ALL
        SELECT 10, 13 FROM DUAL;
    

INSERT INTO view_profile (viewer, user_, date_) 
        SELECT 1, 0, DATE'2020-04-22' FROM DUAL UNION ALL
        SELECT 2, 0, DATE'2020-05-11' FROM DUAL UNION ALL
        SELECT 3, 0, DATE'2020-03-01' FROM DUAL UNION ALL
        SELECT 5, 0, DATE'2020-05-21' FROM DUAL UNION ALL
        SELECT 7, 1, DATE'2020-05-22' FROM DUAL UNION ALL
        SELECT 7, 6, DATE'2020-06-02' FROM DUAL UNION ALL
        SELECT 7, 3, DATE'2020-05-11' FROM DUAL UNION ALL
        SELECT 8, 11, DATE'2020-04-14' FROM DUAL UNION ALL
        SELECT 9, 13, DATE'2020-04-22' FROM DUAL UNION ALL
        SELECT 11, 13, DATE'2020-04-30' FROM DUAL;
    

INSERT INTO company (id_, name_, city, industry, manager_) 
        SELECT 0, 'Neuralink', 'San Francisco', 'Neuroscience', 1 FROM DUAL UNION ALL
        SELECT 1, 'Google', 'Mountain View', 'IT', 6 FROM DUAL UNION ALL
        SELECT 2, 'Sokołów', 'Sokołów Podlaski', 'Meat processing', 11 FROM DUAL;

    
INSERT INTO experience (id_, company, start_, end_, user_, position_) 
        SELECT 0, 0, DATE'2013-04-30', NULL, 11, 'CEO' FROM DUAL UNION ALL
        SELECT 1, 0, DATE'2011-12-11', DATE'2013-04-30', 9, 'Administrator' FROM DUAL UNION ALL
        SELECT 2, 0, DATE'2013-04-30', DATE'2015-10-27', 6, 'Manager' FROM DUAL UNION ALL
        SELECT 3, 1, DATE'2014-11-04', NULL, 10, 'CEO' FROM DUAL UNION ALL
        SELECT 4, 1, DATE'2017-06-13', NULL, 13, 'CTO' FROM DUAL UNION ALL
        SELECT 5, 1, DATE'2010-04-22', DATE'2018-10-22', 1, 'Manager' FROM DUAL UNION ALL
        SELECT 6, 1, DATE'2019-08-26', NULL, 2, 'Trainer' FROM DUAL UNION ALL
        SELECT 7, 1, DATE'2006-02-27', DATE'2016-11-30', 6, 'Video Creator' FROM DUAL UNION ALL
        SELECT 8, 2, DATE'2012-04-30', DATE'2013-11-24', 5, 'CEO' FROM DUAL UNION ALL
        SELECT 9, 2, DATE'2013-01-10', NULL, 0, 'CEO' FROM DUAL UNION ALL
        SELECT 10, 2, DATE'2010-11-01', DATE'2017-01-01', 7, 'Video Creator' FROM DUAL UNION ALL
        SELECT 11, 2, DATE'2010-10-03', DATE'2018-03-01', 8, 'Commentator' FROM DUAL;

INSERT INTO managements (company, user_, position_)
        SELECT 0, 0, 'CEO' FROM DUAL UNION ALL
        SELECT 0, 3, 'CTO' FROM DUAL UNION ALL
        SELECT 0, 5, 'Governor' FROM DUAL UNION ALL
        SELECT 1, 13, 'CEO' FROM DUAL UNION ALL
        SELECT 1, 7, 'CTO' FROM DUAL UNION ALL
        SELECT 1, 8, 'CFO' FROM DUAL UNION ALL
        SELECT 2, 10, 'CEO' FROM DUAL UNION ALL
        SELECT 2, 6, 'Governor' FROM DUAL;
        
INSERT INTO post (id_, author_usr, author_comp, date_, text)
        SELECT 0, 0, NULL, DATE'2020-01-01', 'Happy new year!' FROM DUAL UNION ALL
        SELECT 1, 0, NULL, DATE'2020-03-11', 'Lol' FROM DUAL UNION ALL
        SELECT 2, 3, NULL, DATE'2020-04-22', 'Hi I guess?' FROM DUAL UNION ALL
        SELECT 3, 3, NULL, DATE'2020-04-16', 'Remember, the more celebs tell you to stay at home the safer there is' FROM DUAL UNION ALL
        SELECT 4, 3, NULL, DATE'2020-04-21', 'Stay at home' FROM DUAL UNION ALL
        SELECT 5, NULL, 0, DATE'2020-03-17', 'Who doesnt like rats' FROM DUAL UNION ALL
        SELECT 6, NULL, 0, DATE'2020-05-05', 'EEG makes brrrr brrrr' FROM DUAL UNION ALL
        SELECT 7, NULL, 2, DATE'2020-06-01', 'Pyszne paróweczki' FROM DUAL UNION ALL
        SELECT 8, 13, NULL, DATE'2020-06-03', 'I like eating carbon' FROM DUAL;
        
INSERT INTO tags (id_, name_)
        SELECT 0, 'corona' FROM DUAL UNION ALL
        SELECT 1, 'ad' FROM DUAL UNION ALL
        SELECT 2, 'randomstuff' FROM DUAL;
        

INSERT INTO post_in_tags (tag_, post)
        SELECT 0, 3 FROM DUAL UNION ALL
        SELECT 0, 4 FROM DUAL UNION ALL
        SELECT 1, 6 FROM DUAL UNION ALL
        SELECT 1, 7 FROM DUAL UNION ALL
        SELECT 1, 8 FROM DUAL UNION ALL
        SELECT 2, 2 FROM DUAL UNION ALL
        SELECT 2, 3 FROM DUAL UNION ALL
        SELECT 2, 4 FROM DUAL UNION ALL
        SELECT 2, 6 FROM DUAL UNION ALL
        SELECT 2, 8 FROM DUAL;
        

INSERT INTO comments (id_, author, post, text, date_)
        SELECT 0, 1, 0, 'You too', DATE'2020-01-01' FROM DUAL UNION ALL
        SELECT 1, 13, 0, 'Happy to all', DATE'2020-01-01' FROM DUAL UNION ALL
        SELECT 2, 11, 4, 'F*** off', DATE'2020-04-23' FROM DUAL UNION ALL
        SELECT 3, 7, 5, 'ME', DATE'2020-03-30' FROM DUAL UNION ALL
        SELECT 4, 13, 8, 'I like eating sausages', DATE'2020-06-05' FROM DUAL;
        
INSERT INTO post_likes (user_, post)
        SELECT 0, 2 FROM DUAL UNION ALL
        SELECT 0, 4 FROM DUAL UNION ALL
        SELECT 0, 7 FROM DUAL UNION ALL
        SELECT 0, 8 FROM DUAL UNION ALL
        SELECT 1, 0 FROM DUAL UNION ALL
        SELECT 1, 1 FROM DUAL UNION ALL
        SELECT 1, 5 FROM DUAL UNION ALL
        SELECT 3, 0 FROM DUAL UNION ALL
        SELECT 3, 1 FROM DUAL UNION ALL
        SELECT 3, 6 FROM DUAL UNION ALL
        SELECT 6, 0 FROM DUAL UNION ALL
        SELECT 6, 2 FROM DUAL UNION ALL
        SELECT 7, 6 FROM DUAL UNION ALL
        SELECT 8, 2 FROM DUAL UNION ALL
        SELECT 8, 6 FROM DUAL UNION ALL
        SELECT 9, 6 FROM DUAL UNION ALL
        SELECT 10, 0 FROM DUAL UNION ALL
        SELECT 13, 0 FROM DUAL UNION ALL
        SELECT 13, 8 FROM DUAL UNION ALL
        SELECT 13, 6 FROM DUAL;
        

INSERT INTO comments_likes (user_, comment_)
        SELECT 0, 0 FROM DUAL UNION ALL
        SELECT 1, 4 FROM DUAL UNION ALL
        SELECT 1, 2 FROM DUAL UNION ALL
        SELECT 2, 0 FROM DUAL UNION ALL
        SELECT 5, 2 FROM DUAL UNION ALL
        SELECT 5, 3 FROM DUAL UNION ALL
        SELECT 5, 4 FROM DUAL UNION ALL
        SELECT 6, 2 FROM DUAL UNION ALL
        SELECT 11, 3 FROM DUAL UNION ALL
        SELECT 13, 1 FROM DUAL UNION ALL
        SELECT 13, 0 FROM DUAL;


INSERT INTO followed_tags (user_, tag_)
        SELECT 0, 0 FROM DUAL UNION ALL
        SELECT 0, 1 FROM DUAL UNION ALL
        SELECT 0, 2 FROM DUAL UNION ALL
        SELECT 1, 0 FROM DUAL UNION ALL
        SELECT 1, 2 FROM DUAL UNION ALL
        SELECT 2, 1 FROM DUAL UNION ALL
        SELECT 2, 2 FROM DUAL UNION ALL
        SELECT 3, 0 FROM DUAL UNION ALL
        SELECT 3, 1 FROM DUAL UNION ALL
        SELECT 3, 2 FROM DUAL UNION ALL
        SELECT 5, 1 FROM DUAL UNION ALL
        SELECT 5, 2 FROM DUAL UNION ALL
        SELECT 6, 0 FROM DUAL UNION ALL
        SELECT 7, 0 FROM DUAL UNION ALL
        SELECT 7, 1 FROM DUAL UNION ALL
        SELECT 8, 0 FROM DUAL UNION ALL
        SELECT 8, 1 FROM DUAL UNION ALL
        SELECT 8, 2 FROM DUAL UNION ALL
        SELECT 9, 1 FROM DUAL UNION ALL
        SELECT 10, 0 FROM DUAL UNION ALL
        SELECT 13, 1 FROM DUAL UNION ALL
        SELECT 13, 2 FROM DUAL







        