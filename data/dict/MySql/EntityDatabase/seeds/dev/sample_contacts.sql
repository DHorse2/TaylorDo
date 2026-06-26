-- File: sample_contacts.sql
-- =====================================================
-- SAMPLE DATA (optional, for testing)
-- =====================================================
-- Uncomment to insert sample data

INSERT INTO contacts (first_name, last_name, email, phone_number, phone_mobile, company, job_title, source, external_id) VALUES
('John', 'Doe', 'john.doe@example.com', '555-0101', '555-0101', 'Acme Corp', 'Sales Manager', 'outlook', 'outlook_123'),
('Jane', 'Smith', 'jane.smith@example.com', '555-0102', '555-0102', 'Tech Solutions', 'Developer', 'outlook', 'outlook_124'),
('Bob', 'Johnson', 'bob.johnson@example.com', '555-0103', '555-0103', 'Global Industries', 'Engineer', 'generic', NULL),
('Alice', 'Williams', 'alice.williams@example.com', '555-0104', '555-0104', 'StartUp Inc', 'CEO', 'import', 'csv_001');
