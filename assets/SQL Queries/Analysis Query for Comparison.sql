SELECT * FROM marketing_info.uk_data_view;

-- Order by Subscribers
SELECT Channel_Name, total_subscribers AS Subscribers
	FROM uk_data_view
    ORDER BY Subscribers DESC;
    
-- Average views per video
WITH  Analysis AS (
SELECT Channel_Name, 
	ROUND(SUM(total_views) /SUM(total_videos))  AS Average_views_per_video,
    ROUND((SUM(total_views) /SUM(total_videos) ) *  0.22 -4,0 ) AS Products,
	 (ROUND(SUM(total_views) /SUM(total_videos) ) *  0.22) * 5 AS Revenue,
	((ROUND(SUM(total_views) /SUM(total_videos) ) *  0.22) * 5) - 50000 AS Profit
     FROM uk_data_view
    WHERE Channel_Name IN ("NoCopyrightSounds ", "DanTDM ", "Dan Rhodes "  )
    GROUP BY Channel_Name
    ORDER BY Average_views_per_video DESC  ) 
    SELECT Channel_Name,Average_views_per_video,  Products, Revenue, Profit
		FROM Analysis ;
        
        
Select * FROM Analysis;
        
        












