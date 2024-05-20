CREATE TABLE actors_history_scd (
    history_id SERIAL PRIMARY KEY,       -- A unique ID for each history record
    actor_id UUID NOT NULL,              -- References actor_id from the actors table
    quality_class TEXT,                 
    is_active BOOLEAN,                   -- Indicates whether the actor is currently active
    start_date DATE NOT NULL,            -- The date when this record becomes effective
    end_date DATE,                       -- The date when this record expires
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

-- Optionally, add additional constraints or indexes
ALTER TABLE actors_history_scd ADD CONSTRAINT chk_dates CHECK (start_date <= end_date OR end_date IS NULL);
CREATE INDEX idx_actor_history_dates ON actors_history_scd(actor_id, start_date, end_date);
