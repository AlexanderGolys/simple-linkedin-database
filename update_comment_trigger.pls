CREATE OR REPLACE TRIGGER update_comment
AFTER UPDATE ON comments
FOR EACH ROW
BEGIN
    IF :OLD.text != :NEW.text THEN
        DELETE FROM comments_likes WHERE comments_likes.comment_ = :OLD.id_;
    END IF;
END;