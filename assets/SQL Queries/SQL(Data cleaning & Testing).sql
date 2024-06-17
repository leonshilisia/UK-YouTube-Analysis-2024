SELECT * FROM youtube_python;

-- A. DATA CLEANING STEPS 
-- 1. Extract You tube Channel name  from first column
-- 2. Remove unnessesary columns
-- 3. Rename columns appropriately

--  Columns to be used
SELECT 
	NOMBRE,
    total_subscribers,
    total_views,
    total_videos
FROM youtube_python;

-- Extract youtube Channel
ALTER Table youtube_python ADD COLUMN Channel_Name VARCHAR(50) NOT NULL AFTER NOMBRE;
UPDATE youtube_python
	SET  Channel_Name = substring_index(NOMBRE,'@', 1);
  
  
  -- Create view with relevant columns
  CREATE VIEW UK_DATA_VIEW AS  
	SELECT 
	Channel_Name,
    total_subscribers,
    total_views,
    total_videos
FROM youtube_python ;



-- B. TEST DATA
SELECT * FROM  uk_data_view;
-- QUALITY DATA -Clean and Accurate, no missing vakues, no errors and wrong charecters
-- Check for DUPLICATES 
-- Expectation from Data
	-- 100 channels
	-- 4 Fields needed(Column Test)
    -- Field Data Type
		-- Name - String -
        -- Subscribers - INT
        -- Videos - INT 
        -- Views - int
        
-- Check Data Type     
DESCRIBE uk_data_view ;   

-- Check Row count 
SELECT COUNT(Channel_Name) AS Name, COUNT(total_subscribers) AS Subs, COUNT(total_views) AS Views, COUNT(total_videos) AS Videos FROM uk_data_view;

-- Check For Duplicates 
SELECT Channel_Name,
	Count(Channel_Name) AS name_count
FROM uk_data_view
    GROUP BY Channel_Name
    having name_count > 1;
  
    
    
    
    
    
    
    
    
    
    