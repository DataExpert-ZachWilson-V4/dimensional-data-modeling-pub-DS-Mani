-- Define a custom type for film information
CREATE TYPE film_struct AS (
    film TEXT,             
    votes INTEGER,         
    rating FLOAT,          
    film_id UUID,          
    quality_class TEXT     
);

-- Create the main actors table
CREATE TABLE actors (
    actor_id UUID PRIMARY KEY,  
    actor TEXT NOT NULL,       
    films film_struct[],        
    is_active BOOLEAN,         
    current_year INTEGER       
);
