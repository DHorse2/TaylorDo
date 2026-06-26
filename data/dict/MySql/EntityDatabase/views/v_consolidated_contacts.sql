-- View: Consolidated contact information (primary with all linked emails/phones)
CREATE OR REPLACE VIEW v_consolidated_contacts AS
SELECT 
    p.id as primary_contact_id,
    p.first_name,
    p.last_name,
    p.email as primary_email,
    p.phone_number as primary_phone,
    p.company,
    p.job_title,
    p.source,
    CONCAT_WS(', ', p.street_address, p.city, p.state_province, p.postal_code, p.country) as full_address,
    GROUP_CONCAT(DISTINCT c.email SEPARATOR '; ') as all_emails,
    GROUP_CONCAT(DISTINCT c.phone_number SEPARATOR '; ') as all_phones,
    GROUP_CONCAT(DISTINCT c.phone_mobile SEPARATOR '; ') as all_mobiles,
    COUNT(CASE WHEN c.link_precedence = 'secondary' THEN 1 END) as secondary_count,
    COUNT(*) as total_contacts,
    MIN(p.created_at) as first_contact_date,
    MAX(p.updated_at) as last_updated_date
FROM contacts p
LEFT JOIN contacts c ON p.id = c.linked_id OR p.id = c.id
WHERE p.link_precedence = 'primary' AND p.deleted_at IS NULL
GROUP BY p.id;
