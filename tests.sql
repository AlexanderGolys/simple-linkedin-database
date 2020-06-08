
-- testing changing authorship of posts to 'account deleted' account
SELECT first_name, text FROM post INNER JOIN users_ ON post.author_usr = users_.id_;
DELETE FROM users_ WHERE users_.first_name = 'Ian';
SELECT first_name, text FROM post INNER JOIN users_ ON post.author_usr = users_.id_;

-- testing removing of likes while updating post
SELECT COUNT(*) FROM post_likes WHERE post = 1;
UPDATE post SET text = 'Some updated text' WHERE id_ = 1;
SELECT COUNT(*) FROM post_likes WHERE post = 1;

-- testing removing of likes while updating comment
SELECT COUNT(*) FROM comments_likes WHERE comment_ = 0;
UPDATE comments SET text = 'lol?' WHERE id_ = 0;
SELECT COUNT(*) FROM comments_likes WHERE comment_ = 0;

-- testing function returning max number of likes that the person recieved
-- check how many likes has Magnus Carlsen got
SELECT max_likes(id_) FROM users_ WHERE first_name = 'Magnus';

-- testing function printing working times of every user and returning aggregate working time
SET SERVEROUTPUT ON FORMAT WRAPPED;
SELECT working_time() FROM DUAL;


-- testing procedure printing person's profile
SET SERVEROUTPUT ON FORMAT WRAPPED;
BEGIN
    print_profile(0);
    print_profile(1);
    print_profile(2);
    print_profile(6);
END;

-- testing procedure printing company profile
SET SERVEROUTPUT ON FORMAT WRAPPED;
BEGIN
    print_company_profile(0);
    print_company_profile(1);
    print_company_profile(2);
END;

-- additional non-trivial queries

-- shows number of current employees of every registered company in descending order
SELECT name_, COUNT(company)
FROM experience RIGHT JOIN company ON experience.company = company.id_
WHERE end_  is NULL
GROUP BY name_
ORDER BY COUNT(company) DESC;

-- shows post that should be visible by given user 
-- user sees the post if follows the proper tag or is connected with the author 
SELECT DISTINCT first_name, last_name, company.name_, text
FROM post_in_tags pit
INNER JOIN post ON pit.post = post.id_ 
INNER JOIN followed_tags ft ON ft.tag_ = pit.tag_
FULL OUTER JOIN users_ ON post.author_usr = users_.id_
FULL OUTER JOIN company ON post.author_comp = company.id_
WHERE ft.user_ = 0
UNION
SELECT DISTINCT first_name, last_name, company.name_, text
FROM post 
INNER JOIN users_ ON post.author_usr = users_.id_
INNER JOIN connections ON post.author_usr = user2
LEFT OUTER JOIN company ON post.author_comp = company.id_
WHERE user1 = 0
UNION
SELECT DISTINCT first_name, last_name, company.name_, text
FROM post 
INNER JOIN users_ ON post.author_usr = users_.id_
INNER JOIN connections ON post.author_usr = user1
LEFT OUTER JOIN company ON post.author_comp = company.id_
WHERE user2 = 0;





