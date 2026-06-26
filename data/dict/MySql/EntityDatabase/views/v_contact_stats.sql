-- View: Contact statistics
CREATE OR REPLACE VIEW v_contact_stats AS
SELECT 
    COUNT(*) as total_contacts,
    COUNT(CASE WHEN link_precedence = 'primary' THEN 1 END) as primary_contacts,
    COUNT(CASE WHEN link_precedence = 'secondary' THEN 1 END) as secondary_contacts,
    COUNT(DISTINCT email) as unique_emails,
    COUNT(DISTINCT phone_number) as unique_phones,
    COUNT(DISTINCT source) as data_sources,
    COUNT(CASE WHEN company IS NOT NULL THEN 1 END) as contacts_with_company,
    COUNT(CASE WHEN linked_id IS NOT NULL THEN 1 END) as linked_contacts
FROM contacts
WHERE deleted_at IS NULL;
