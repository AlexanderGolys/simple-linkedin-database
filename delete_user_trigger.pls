CREATE OR REPLACE TRIGGER delete_user 
BEFORE DELETE ON users_
FOR EACH ROW

BEGIN
  UPDATE comments SET comments.author = 100 WHERE comments.author = :OLD.id_;
  UPDATE post SET post.author_usr = 100 WHERE post.author_usr = :OLD.id_;
  DELETE FROM comments_likes c WHERE c.user_ = :OLD.id_;
  UPDATE company SET company.manager_ = 100 WHERE company.manager_ = :OLD.id_;
  DELETE FROM connections c WHERE c.user1 = :OLD.id_ OR c.user2 = :OLD.id_;
  DELETE FROM experience e WHERE e.user_ = :OLD.id_;
  DELETE FROM followed_tags f WHERE f.user_ = :OLD.id_;
  DELETE FROM managements m WHERE m.user_ = :OLD.id_;
  DELETE FROM post_likes p WHERE p.user_ = :OLD.id_;
  DELETE FROM view_profile v WHERE viewer = :OLD.id_ OR user_ = :OLD.id_;
  
END;

