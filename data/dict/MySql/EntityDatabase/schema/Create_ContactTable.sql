-- File: Create_ContactTable.sql
CREATE TABLE contacts ( id INT PRIMARY KEY AUTO_INCREMENT,

-- Core contact info
email VARCHAR(255) NOT NULL UNIQUE,
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
state VARCHAR(100),
postal_code VARCHAR(20),
country VARCHAR(100),
notes TEXT,
outlook_category VARCHAR(100),

-- Deduplication
linked_id INT, link_precedence VARCHAR(20) DEFAULT 'primary',

-- Metadata
source VARCHAR(50) DEFAULT 'generic', -- 'outlook', 'generic', 'import', etc.
    external_id VARCHAR(255), -- outlook_id, csv_id, etc.
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (linked_id) REFERENCES contacts(id),
    INDEX idx_email (email),
    INDEX idx_phone (phone_number),
    INDEX idx_source (source),
    UNIQUE INDEX idx_external_id (external_id, source)
);
