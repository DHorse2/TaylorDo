-- View: Potential duplicates by email
CREATE OR REPLACE VIEW v_potential_email_dupes AS
SELECT 
    c1.id as contact_id_1,
    c2.id as contact_id_2,
    c1.email,
    c1.phone_number as phone_1,
    c2.phone_number as phone_2,
    c1.first_name as fname_1,
    c2.first_name as fname_2,
    c1.last_name as lname_1,
    c2.last_name as lname_2,
    c1.company as company_1,
    c2.company as company_2
FROM contacts c1
JOIN contacts c2 ON c1.email = c2.email 
    AND c1.id < c2.id 
    AND c1.link_precedence = 'primary'
    AND c2.link_precedence = 'primary'
    AND c1.linked_id IS NULL
    AND c2.linked_id IS NULL
    AND c1.deleted_at IS NULL
    AND c2.deleted_at IS NULL;
