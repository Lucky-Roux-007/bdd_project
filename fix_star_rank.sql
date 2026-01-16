ALTER TABLE `Monster`
MODIFY COLUMN `Quest_Star_Rank` varchar(20) GENERATED ALWAYS AS (case when `Hunter_Rank` between 1 and 5 then concat('LR ',`Hunter_Rank`,'★') when `Hunter_Rank` between 6 and 9 then concat('HR ',`Hunter_Rank`,'★') when `Hunter_Rank` >= 10 then concat('MR ',`Hunter_Rank` - 9,'★') else 'Unknown' end) VIRTUAL;
