-- File: Bootstrap_Database.sql
-- =====================================================
-- EMAIL CONTACTS DATABASE - OUTLOOK COMPATIBLE SCHEMA
-- =====================================================
-- MySQL database schema for managing email contacts with Outlook integration
-- Supports contact deduplication, linking, and rich contact metadata

-- =====================================================
-- DATABASE CREATION
-- =====================================================
CREATE DATABASE IF NOT EXISTS email_contacts;
USE email_contacts;

-- =====================================================
-- CONTACTS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    
    -- Core contact information
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    
    -- Extended Outlook fields (nullable for non-Outlook sources)
    phone_mobile VARCHAR(50),
    phone_business VARCHAR(50),
    company VARCHAR(255),
    job_title VARCHAR(255),
    street_address VARCHAR(255),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    notes LONGTEXT,
    outlook_category VARCHAR(100),
    
    -- Contact linking for deduplication
    linked_id INT,
    link_precedence VARCHAR(20) NOT NULL DEFAULT 'primary' 
        CHECK (link_precedence IN ('primary', 'secondary')),
    
    -- Metadata and audit
    source VARCHAR(50) NOT NULL DEFAULT 'generic' 
        COMMENT 'Data source: outlook, generic, import, manual, etc.',
    external_id VARCHAR(255) 
        COMMENT 'External identifier (outlook_id, import_id, etc.)',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    
    -- Constraints
    CONSTRAINT fk_contacts_linked_id 
        FOREIGN KEY (linked_id) REFERENCES contacts(id) ON DELETE SET NULL,
    CONSTRAINT check_email_or_phone 
        CHECK (email IS NOT NULL OR phone_number IS NOT NULL),
    CONSTRAINT check_primary_no_link 
        CHECK (link_precedence != 'primary' OR linked_id IS NULL),
    CONSTRAINT check_secondary_has_link 
        CHECK (link_precedence != 'secondary' OR linked_id IS NOT NULL),
    CONSTRAINT check_no_self_reference 
        CHECK (id != linked_id)
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================
CREATE INDEX idx_contacts_email 
    ON contacts(email) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_phone 
    ON contacts(phone_number) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_mobile 
    ON contacts(phone_mobile) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_linked_id 
    ON contacts(linked_id) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_source 
    ON contacts(source) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_external_id 
    ON contacts(external_id) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_company 
    ON contacts(company) WHERE deleted_at IS NULL;

CREATE INDEX idx_contacts_created_at 
    ON contacts(created_at);

CREATE UNIQUE INDEX idx_contacts_external_unique 
    ON contacts(external_id, source) WHERE deleted_at IS NULL AND external_id IS NOT NULL;

-- =====================================================
-- CONTACT GROUPS TABLE (for grouping related contacts)
-- =====================================================
CREATE TABLE IF NOT EXISTS contact_groups (
    id INT PRIMARY KEY AUTO_INCREMENT,
    primary_contact_id INT NOT NULL,
    name VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_contact_groups_primary 
        FOREIGN KEY (primary_contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
    INDEX idx_contact_groups_primary (primary_contact_id)
);

-- =====================================================
-- CONTACT TAGS TABLE (for categorizing contacts)
-- =====================================================
CREATE TABLE IF NOT EXISTS contact_tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contact_id INT NOT NULL,
    tag_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_contact_tags_contact 
        FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
    INDEX idx_contact_tags_contact (contact_id),
    INDEX idx_contact_tags_name (tag_name),
    UNIQUE INDEX idx_contact_tags_unique (contact_id, tag_name)
);

-- =====================================================
-- CONTACT HISTORY TABLE (for audit trail)
-- =====================================================
CREATE TABLE IF NOT EXISTS contact_history (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contact_id INT NOT NULL,
    action VARCHAR(50) NOT NULL COMMENT 'created, updated, linked, merged, deleted',
    old_values JSON,
    new_values JSON,
    changed_by VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_contact_history_contact 
        FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
    INDEX idx_contact_history_contact (contact_id),
    INDEX idx_contact_history_action (action),
    INDEX idx_contact_history_created_at (created_at)
);

-- =====================================================
-- DUPLICATE DETECTION TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS potential_duplicates (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contact_id_1 INT NOT NULL,
    contact_id_2 INT NOT NULL,
    match_score DECIMAL(5, 2) COMMENT 'Similarity score 0-100',
    match_reason VARCHAR(255) COMMENT 'Why they might be duplicates',
    reviewed BOOLEAN DEFAULT FALSE,
    is_duplicate BOOLEAN,
    resolved_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_dup_contact_1 
        FOREIGN KEY (contact_id_1) REFERENCES contacts(id) ON DELETE CASCADE,
    CONSTRAINT fk_dup_contact_2 
        FOREIGN KEY (contact_id_2) REFERENCES contacts(id) ON DELETE CASCADE,
    INDEX idx_dup_contact_1 (contact_id_1),
    INDEX idx_dup_contact_2 (contact_id_2),
    INDEX idx_dup_match_score (match_score DESC),
    INDEX idx_dup_reviewed (reviewed)
);

-- =====================================================
-- IMPORT LOG TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS import_logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    import_source VARCHAR(100) NOT NULL COMMENT 'outlook, csv, api, etc.',
    file_name VARCHAR(255),
    total_records INT,
    imported_records INT,
    skipped_records INT,
    error_records INT,
    status VARCHAR(50) DEFAULT 'in_progress' 
        COMMENT 'in_progress, completed, failed, partial',
    error_message TEXT,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,
    
    INDEX idx_import_logs_source (import_source),
    INDEX idx_import_logs_status (status),
    INDEX idx_import_logs_started_at (started_at)
);

-- =====================================================
-- IMPORT DETAILS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS import_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    import_log_id INT NOT NULL,
    contact_id INT,
    external_id VARCHAR(255),
    status VARCHAR(50) COMMENT 'imported, skipped, error, duplicate',
    error_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_import_details_log 
        FOREIGN KEY (import_log_id) REFERENCES import_logs(id) ON DELETE CASCADE,
    CONSTRAINT fk_import_details_contact 
        FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE SET NULL,
    INDEX idx_import_details_log (import_log_id),
    INDEX idx_import_details_contact (contact_id),
    INDEX idx_import_details_status (status)
);

-- =====================================================
-- VIEWS FOR COMMON QUERIES
-- =====================================================

SOURCE ../views/v_active_contacts.sql;
SOURCE ../views/v_consolidated_contacts.sql;
SOURCE ../views/v_contact_stats.sql;
SOURCE ../views/v_outlook_contacts.sql;
SOURCE ../views/v_potential_email_dupes.sql;

-- =====================================================
-- STORED PROCEDURES
-- =====================================================

SOURCE ../procedures/sp_link_contacts.sql;
SOURCE ../procedures/sp_merge_contacts.sql;
SOURCE ../procedures/sp_soft_delete_contact.sql;
SOURCE ../procedures/sp_find_duplicates.sql;

-- =====================================================
-- SAMPLE DATA (optional, for testing)
-- =====================================================
-- Uncomment to insert sample data

SOURCE ../seeds/dev/sample_contacts.sql;

-- =====================================================
-- END OF SCHEMA
-- =====================================================
