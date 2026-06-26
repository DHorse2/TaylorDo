-- Procedure: Soft delete contact
DELIMITER //

CREATE PROCEDURE sp_soft_delete_contact(
    IN p_contact_id INT,
    IN p_changed_by VARCHAR(100)
)
BEGIN
    UPDATE contacts
    SET 
        deleted_at = CURRENT_TIMESTAMP,
        updated_at = CURRENT_TIMESTAMP
    WHERE id = p_contact_id;
    
    INSERT INTO contact_history (contact_id, action, changed_by, new_values)
    VALUES (
        p_contact_id,
        'deleted',
        p_changed_by,
        JSON_OBJECT('deleted_at', CURRENT_TIMESTAMP)
    );
    
    SELECT 'Contact soft deleted successfully' as result;
END//

DELIMITER ;
