-- Procedure: Merge two primary contacts
DELIMITER //

CREATE PROCEDURE sp_merge_contacts(
    IN p_primary_keep INT,
    IN p_primary_merge INT,
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
            SELECT CONCAT('Error merging contacts: ', v_error) as error;
        END;
        
        -- Update the primary being merged to secondary
        UPDATE contacts
        SET 
            linked_id = p_primary_keep,
            link_precedence = 'secondary',
            updated_at = CURRENT_TIMESTAMP
        WHERE id = p_primary_merge;
        
        -- Update all contacts linked to the old primary
        UPDATE contacts
        SET 
            linked_id = p_primary_keep
        WHERE linked_id = p_primary_merge;
        
        -- Log the merge
        INSERT INTO contact_history (contact_id, action, changed_by, new_values)
        VALUES (
            p_primary_merge,
            'merged',
            p_changed_by,
            JSON_OBJECT('merged_into', p_primary_keep)
        );
        
        COMMIT;
        SELECT 'Contacts merged successfully' as result;
    END;
END//

DELIMITER ;
