CREATE OR REPLACE TRIGGER update_post
AFTER UPDATE ON post
FOR EACH ROW
BEGIN
    IF :OLD.text != :NEW.text THEN
        DELETE FROM post_likes WHERE post_likes.post = :OLD.id_;
    END IF;
END;