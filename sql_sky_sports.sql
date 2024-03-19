create database Sky_sports;
show databases;
use sky_sports;
show tables;

select * from sql_group_team_stats ;
select *from sql_overall_wc_stats ;

#1. Import both the .CSV files in Dbeaver under the database nameSky_Sports

#2. Write an sql query to show all the UNIQUE team names

select distinct(team) from sql_overall_wc_stats ;

#3. Write an SQL query to show name of team which has rank 1 fromgroup 7

select *from sql_group_team_stats g inner join sql_overall_wc_stats o 
	on g.team =o.team where g.`rank` = 1 and g.`group` =7;

#4. Write an sql query to show count of all teams

select count(o.team) , o.team from sql_group_team_stats g inner join sql_overall_wc_stats o 
		on g.team =o.team group by o.team  ;


#5. Write an SQL query to show matches_played by each team
	
	select g.matches_played ,g.team from sql_group_team_stats g inner join sql_overall_wc_stats o 
		on g.team =o.team  group by g.team ;

/*6. Write an SQL query to show team, percent of wins with respect....#sum lagao na lagao kuch fark nhi lagega
 to matches_played by each team and name the resulting column as wins_percent*/

 	select g.team,g.wins ,g.matches_played ,g.wins /g.matches_played *100 as "percentage" 
		from sql_group_team_stats g  group by g.team ;


#7. Write an SQL query to show which team has maximum goals_scored and their count

	select team,goals_scored,count(*)  from sql_group_team_stats sgts 
		where goals_scored =(select max(goals_scored)  from sql_group_team_stats sgts2 ) ;

	select goals_scored,team from  sql_group_team_stats sgts  
		where (goals_scored) in (select max(goals_scored) from sql_group_team_stats sgts2);

select team ,goals_scored from sql_group_team_stats sgts ;

#8. Write an SQL query to show percent of draws with respect to matches_played round of to 2 digits by each team

	select g.team,g.draws,g.matches_played ,round(sum(g.draws)/sum(g.matches_played)*100,2) as "percentage" 
		from sql_group_team_stats g  group by g.team ;

#9. Write an SQL query to show which team has minimum goals_scored and their count

	select g.team ,g.goals_scored,count(*) from sql_group_team_stats g 
		group by g.goals_scored having min(g.goals_scored) order by g.goals_scored ;
	select team,goals_scored from sql_group_team_stats sgts ;

#2nd way
select team,goals_scored,count(*)  from sql_group_team_stats sgts 
	where goals_scored =(select min(goals_scored)  from sql_group_team_stats sgts2 ) group by team  ;

select *from sql_group_team_stats sgts ;

#10. Write an SQL query to show percent of losses with respect to matches_played by each team in ascending order by losses and
#name the resulting column as losses_percent

select g.team,g.losses ,g.matches_played ,g.losses /g.matches_played *100 as "losses_percent" 
	from sql_group_team_stats g   order by losses_percent ;


#11. Write an SQL query to show the average goal_difference Skills on your tips

	select avg(g.goal_difference) from sql_group_team_stats g ;

#12. Write an SQL query to show name of the team where points are 0

	select g.team,g.points from sql_group_team_stats g where points =0;

#13. Write a SQL query to show all data where expected_goal_scored is less than exp_goal_conceded
	 
	 select expected_goal_scored ,exp_goal_conceded
		from sql_group_team_stats sgts where expected_goal_scored < exp_goal_conceded ;


#14. Write an SQL query to show data where exp_goal_difference is in between -0.5 and 0.5

select *from sql_group_team_stats g inner join sql_overall_wc_stats o
	on g.team =o.team where g.exp_goal_difference between -0.5 and 0.5;



#15. Write an SQL query to show all data in ascending order by exp_goal_difference_per_90

select *from sql_group_team_stats g inner join sql_overall_wc_stats o
	on g.team =o.team order by g.exp_goal_difference_per_90 ;


#16. Write an SQL query to show team which has maximum number of players_used

select team,players_used  from sql_overall_wc_stats sows 
	where players_used =(select max(players_used) from sql_overall_wc_stats sows2  );

select *from sql_overall_wc_stats sows ;


#17. Write an SQL query to show each team name and avg_age in ascending order by avg_age

select g.team ,o.avg_age  from sql_group_team_stats g inner join sql_overall_wc_stats o
	on g.team =o.team order by o.avg_age ;



#18. Write an sql query to show average possession of teams

select avg(o.possession) from sql_group_team_stats g inner join sql_overall_wc_stats o on g.team =o.team ;

#2nd

select avg(possession) from sql_overall_wc_stats group by possession ; 

#19. Write a SQL query to show team which has played atleast 5 games

select team,games from sql_overall_wc_stats where games >=5;

#20. Write an SQL query to show all data for which minutes is greater than 600

select *from sql_group_team_stats g inner join sql_overall_wc_stats o
	on g.team =o.team where o.minutes > 600;

#21. Write an SQL query to show team, goals, assists in ascending order by goals

select o.team ,o.goals,o.assists  from  sql_overall_wc_stats o order by o.assists ;


#22. Write an SQL query to show team, pens_made, pens_att in descending order by pens_made

select o.team ,o.pens_made,o.pens_att  from  sql_overall_wc_stats o order by o.pens_made desc;


#23. Write an SQL query to show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow

	select o.team ,o.cards_yellow,o.cards_red from sql_overall_wc_stats o 
		where o.cards_red =1 order by o.cards_yellow ;

#24. Write an SQL query to show team, goals_per90, assists_per90,goals_assists_per90 in descending order by goals_assists_per90

	select o.team , o.goals_per90 ,o.goals_assists_per90 
		from sql_overall_wc_stats o order by o.goals_assists_per90 desc;


#25. Write an SQL query to show team, goals_pens_per90,goals_assists_pens_per90 in ascending order by
#goals_assists_pens_per90 Skills on your tips

	select o.team ,o.goals_pens_per90 ,o.goals_assists_pens_per90 
		from sql_overall_wc_stats o order by o.goals_assists_pens_per90 ;

#26. Write an SQL query to show team, shots, shots_on_target,shots_on_target_pct where shots_on_target_pct is less than 30
#in ascending order by shots_on_target_pct

	select o.team ,o.shots ,o.shots_on_target ,o.shots_on_target_pct from  sql_overall_wc_stats o 
		where o.shots_on_target_pct < 30 order by o.shots_on_target_pct ;


#27. Write an SQL query to show team, shots_per90,shots_on_target_per90 for team Belgium

	select o.team ,o.shots_per90 ,o.shots_on_target_per90 from  sql_overall_wc_stats o where o.team ='Belgium' ;


#28. Write an SQL query to show team, goals_per_shot,goals_per_shot_on_target, average_shot_distance in descending
#order by average_shot_distance

	select o.team ,o.goals_per_shot ,o.goals_per_shot_on_target ,o.average_shot_distance 
		from  sql_overall_wc_stats o order by o.average_shot_distance desc;

#29. Write an SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500

	select o.team ,o.errors ,o.touches from  sql_overall_wc_stats o 
		where o.errors=0 or o.touches<1500;

#30. Write an SQL query to show team, fouls which has maximum number of fouls

	select o.team,o.fouls from  sql_overall_wc_stats o
		where fouls =(select  max(fouls) from sql_overall_wc_stats sows2 );

	select *from sql_overall_wc_stats sows ;

#31. Write an SQL query to show team, offisdes which has offsides less than 10 or greater than 20

	select o.team ,o.offsides from  sql_overall_wc_stats o
		where o.offsides<10 or o.offsides>20 order by o.offsides desc ;


#32. Write an SQL query to show team, aerials_won, aerials_lost,aerials_won_pct in descending order by aerials_won_pct

	select o.team ,o.aerials_won ,o.aerials_lost ,o.aerials_won_pct 
		from sql_overall_wc_stats o order by o.aerials_won_pct desc ;

#33. Write an SQL query to show number of teams each group has! har ak group me team kitni hia

	select `group` ,count(team)   from sql_group_team_stats sgts group by `group`  order by count(team);


#34. Write a SQL query to show team names group 6 has...6 wale group me kitna team hai
	
	select team,`group`  from sql_group_team_stats sgts where `group` =6 ;

#35. Write an SQL query to show Australia belongs to which group

	select g.`group` ,g.team from sql_group_team_stats g where g.team='Australia' ;


#36. Write an SQL query to show group, average wins by each group

	select g.`group`, avg(g.wins)  from sql_group_team_stats g  group by g.`group`  ;
	
#37. Write an SQL query to show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored

	select g.`group` ,g.expected_goal_scored from sql_group_team_stats g
		group by g.`group` having max(g.expected_goal_scored) order by expected_goal_scored ;
	
	#2
	
	select *from sql_group_team_stats sgts where expected_goal_scored =
		(select max(expected_goal_scored) from sql_group_team_stats sgts2) group by `group`  ;

#38. Write an SQL query to show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded

	select `group`,exp_goal_conceded from sql_group_team_stats  group by `group` 
			having min(exp_goal_conceded) order by exp_goal_conceded desc ;


#39. Write an SQL query to show group, average exp_goal_difference_per_90 for each group in ascending order 
#by exp_goal_difference_per_90 Skills on your tips

	select `group`,exp_goal_difference_per_90  from sql_group_team_stats sgts  group by `group` 
			having avg(exp_goal_difference_per_90) order by exp_goal_difference_per_90  asc;
		
		
		select sgsts.`group`,avg(exp_goal_difference_per_90) from skysports_group_stage_team_stats sgsts 
             group by sgsts.`group` order by (avg(exp_goal_difference_per_90));


		
#40. Write an SQL query to show which team has equal number of goals_scored and goals_against

select g.goals_scored ,g.goals_against ,g.team  from sql_group_team_stats g 
	having g.goals_scored =g.goals_against ;


#41. Write an SQL query to show which team has maximum players_used

#1
	select team,players_used  from sql_overall_wc_stats o 
		where players_used =(select max(players_used) from sql_overall_wc_stats );

#2
	select team, max(players_used) from sql_overall_wc_stats sows
		group by team order by (max(players_used))desc limit 1;
	
	
#42. Write an SQL query to show team, players_used, avg_age, games, minutes where minutes lessthan 500 and greater than 200

	select team ,players_used ,avg_age ,games ,minutes  from sql_overall_wc_stats sows
		where minutes < 500 and minutes > 200;
	
	
#43. Write an SQL query to show all data of group_stats in ascending order BY points
	
	select  sows.points_per_game , sows.games_starts  from sql_overall_wc_stats sows order by sows.points_per_game ;


#44. Write an SQL query to show ALL UNIQUE team in ascending order by team

	select distinct team from sql_group_team_stats sgts order by team ;

#45. Write an SQL query to show average avg_age of each group and arrange it in descending order by avg_age.

	select avg(o.avg_age),g.`group`  from sql_overall_wc_stats o inner join sql_group_team_stats g  
		on o.team =g.team group by g.`group` order by avg(o.avg_age)  desc;


#46. Write an SQL query to show sum of fouls for each group and arrange it in ascending order by fouls.

	select o.fouls,g.`group`  from sql_overall_wc_stats o inner join sql_group_team_stats g
		on o.team =g.team group by g.`group`  having  sum(o.fouls)  order by o.fouls  ;
	
	
	
	select *from sql_overall_wc_stats sows inner join sql_group_team_stats sgts 
		on sows.team =sgts.team group by sgts.`group` ;
	
	
#47. Write an SQL query to show total number of games for each group and arrange it in descending order by games.
	
	select o.games ,g.`group`  from sql_overall_wc_stats o inner join sql_group_team_stats g 
		on o .team =g .team  group by g.`group`  having count(o.games) order by games  ;
	
	
#48. Write an SQL query to show total number of players_used for each group and arrange it in ascending order by players_used.
	
	select sum(o.players_used) ,g.`group` from sql_overall_wc_stats o inner join sql_group_team_stats g
		on o.team =g.team group by g.`group` order by o.players_used  ;
	
	select players_used,sgts.`group`  from sql_overall_wc_stats sows 
		inner join sql_group_team_stats sgts on sgts.team =sows.team ;
	
#49. Write an SQL query to show total number of offsides for each group and arrange it in ascending order by offsides.
	
	
	select sum(sows.offsides), sgts.`group` from sql_overall_wc_stats sows 
			inner join  sql_group_team_stats sgts on sows.team =sgts.team 
				group by sgts.`group`  order by sows.offsides ;
	
	
#50. Write an SQL query to show average passes_pct for each group and arrange it in descending order by passes_pct.

			
	select avg(sows.passes_pct)  ,sgts.`group`  
		from sql_overall_wc_stats sows 
			inner join  sql_group_team_stats sgts on sows.team =sgts.team group by sgts.`group` ;

		
#51. Write an SQL query to show average goals_per90 for each group and arrange it in ascending order by goals_per90.
		

		select  avg(sows.goals_per90) ,sgts.`group`  from sql_group_team_stats sgts 
			inner join sql_overall_wc_stats sows on sows.team=sgts.team group by sgts.`group` ;
			
		
		select *from sql_group_team_stats g inner join sql_overall_wc_stats o
			on g.team =o.team ;
			
		