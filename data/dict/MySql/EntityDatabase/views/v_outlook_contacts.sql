-- View: Outlook contacts only
CREATE OR REPLACE VIEW v_outlook_contacts AS
SELECT * FROM contacts
WHERE source = 'outlook' AND deleted_at IS NULL;
