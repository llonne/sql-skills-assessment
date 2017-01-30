-- Include your solutions to the More Practice problems in this file.



-- Insert a Brand

INSERT INTO brands (brand_id, name, founded, headquarters, discontinued)
VALUES ('sub', 'Subaru', 1953, 'Tokyo, Japan', NULL);

-- Insert Models

Select brand_id from brands where name = 'Chevrolet';
Select brand_id from brands where name = 'Subaru';

INSERT INTO models (year, brand_id, name) VALUES
(2015, 'che', 'Malibu'),
(2015, 'sub', 'Outback');


-- Create an Awards Table

CREATE TABLE awards (
    award_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    year INTEGER,
    brand_id VARCHAR(5)
    );

-- Insert Awards

INSERT INTO awards (name, year, brand_id) VALUES
('IIHS Safety Award', 2015, 
    (select model_id from models where brand_id =
        (Select brand_id from brands where name = 'Chevrolet')
AND name = 'Malibu')),
('IIHS Safety Award', 2015, 
    (select model_id from models where brand_id =
        (Select brand_id from brands where name = 'Subaru')
AND name = 'Outback')),
('Best in Class', 2015, NULL);

-- here is where i realize i set brand_id to NOT NULL, and can't seem to fix it. :(
-- ALTER TABLE awards ALTER COLUMN brand_id VARCHAR(5) NULL;

