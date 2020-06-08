create or replace FUNCTION max_likes
( user_id IN NUMBER )
RETURN NUMBER
IS
max1 NUMBER;
max2 NUMBER;
BEGIN
    SELECT COUNT(post)
    INTO max1
    FROM post_likes
    WHERE user_id = user_;

    SELECT COUNT(comment_)
    INTO max2
    FROM comments_likes
    WHERE user_id = user_;

    RETURN GREATEST(max1, max2);
END max_likes;
