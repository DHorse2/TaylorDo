-- View: All active contacts (non-deleted)
CREATE OR REPLACE VIEW v_active_contacts AS
SELECT * FROM contacts
WHERE deleted_at IS NULL;
