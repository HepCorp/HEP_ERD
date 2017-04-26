INSERT INTO haw.continent (continent_cd, continent_nm) values ('A', '아시아');
INSERT INTO haw.nation (nation_serial, continent_cd, nation_cd, nation_nm) values ('A082', 'A', '082', '대한민국');
INSERT INTO haw.city (city_serial, nation_serial, city_cd, city_nm) values ('A082063', 'A082', '063', '제주특별자치도');
INSERT INTO haw.region (city_serial, region_nm) values ('A082063', '제주시');
INSERT INTO haw.region (city_serial, region_nm) values ('A082063', '서귀포시');


select * from haw.continent;
select * from haw.nation;
select * from haw.city;
select * from haw.region;

INSERT INTO haw.arms (arms_nm, description, arms_img, color, enabled_yn) VALUES ('EAGLES', '맑은 영혼을 지닌 독수리처럼 멋지게 날개를 펼쳐보세요!', '/resources/images/eagle.png', '336699', true);
INSERT INTO haw.team (arms_no, team_nm, team_tot, description) values (1, 'EAGLES', 10, '맑은 영혼을 지닌 독수리처럼 멋지게 날개를 펼쳐보세요!');
                      
select * from haw.team;


INSERT INTO haw.team_region (team_no, region_no) values (1, 2);

select * from haw.team_region;

select A.badge_no
     , B.badge_no
     , A.required_yn
     , C.badge_cnt
  from haw.quest_badge A
       LEFT OUTER JOIN haw.member_quest_log B ON (A.badge_no = B.badge_no)
       LEFT OUTER JOIN haw.quest C ON (A.quest_no = C.quest_no)
 where quest_no = 3 

' 6   6   Y    4'
' 7   7   Y    4'
' 8   null N   4'
' 9   9    N   4'
' 10  null N   4'