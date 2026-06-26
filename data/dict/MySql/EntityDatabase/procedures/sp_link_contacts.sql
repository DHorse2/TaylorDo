-- Procedure: Link two contacts
DELIMITER //

CREATE PROCEDURE sp_link_contacts(
    IN p_primary_contact_id INT,
    IN p_secondary_contact_id INT,
    IN p_changed_by VARCHAR(100)
)
BEGIN
    DECLARE v_error MESSAGE_TEXT;
    
    START TRANSACTION;
    
    BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            GET DIAGNOSTICS CONDITION 1 v_error = MESSAGE_TEXT;
            ROLLBACK;
            SELECT CONCAT('Error linking contacts: ', v_error) as error;
        END;
        
        -- Update secondary contact to link to primary
        UPDATE contacts
        SET 
            linked_id = p_primary_contact_id,
            link_precedence = 'secondary',
            updated_at = CURRENT_TIMESTAMP
        WHERE id = p_secondary_contact_id;
        
        -- Log the action
        INSERT INTO contact_history (contact_id, action, changed_by, new_values)
        VALUES (
            p_secondary_contact_id,
            'linked',
            p_changed_by,
            JSON_OBJECT('linked_to', p_primary_contact_id)
        );
        
        COMMIT;
        SELECT 'Contacts linked successfully' as result;
    END;
END//

DELIMITER ;
