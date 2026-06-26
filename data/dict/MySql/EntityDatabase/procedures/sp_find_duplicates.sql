-- Procedure: Find potential duplicates by email/phone
DELIMITER //

CREATE PROCEDURE sp_find_duplicates()
BEGIN
    SELECT 
        pd.id,
        pd.contact_id_1,
        pd.contact_id_2,
        c1.email as email_1,
        c2.email as email_2,
        c1.phone_number as phone_1,
        c2.phone_number as phone_2,
        c1.first_name as fname_1,
        c2.first_name as fname_2,
        ROUND(
            (
                CASE WHEN c1.email = c2.email THEN 40 ELSE 0 END +
                CASE WHEN c1.phone_number = c2.phone_number THEN 40 ELSE 0 END +
                CASE WHEN c1.first_name = c2.first_name AND c1.last_name = c2.last_name THEN 20 ELSE 0 END
            ), 0
        ) as match_score
    FROM contacts c1
    JOIN contacts c2 ON c1.id < c2.id
    LEFT JOIN potential_duplicates pd ON 
        (pd.contact_id_1 = c1.id AND pd.contact_id_2 = c2.id)
    WHERE 
        (c1.email = c2.email OR c1.phone_number = c2.phone_number)
        AND c1.deleted_at IS NULL
        AND c2.deleted_at IS NULL
        AND c1.link_precedence = 'primary'
        AND c2.link_precedence = 'primary'
    ORDER BY match_score DESC;
END//

DELIMITER ;
