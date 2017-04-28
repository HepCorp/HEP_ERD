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
            
INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('level', '10', 'Beginner');
INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('level', '20', 'Intermediately');
INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('level', '30', 'Expert');
INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('level', '40', 'Master');

INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('type', 'B', 'Basic');
INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('type', 'D', 'Download');
INSERT INTO haw.gubun (column_nm, gubun_cd, gubun_nm) values ('type', 'S', 'Server');

ALTER TABLE haw.quest
ADD COLUMN archive_yn boolean NOT NULL DEFAULT false;

ALTER TABLE haw.mission
ADD COLUMN archive_yn boolean NOT NULL Default false;

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
 
-- quest list query
SELECT A.quest_no
     , E.nation_nm || ' > ' || D.city_nm || ' > ' || C.region_nm
     , A.quest_seq
     , B2.gubun_nm AS type
     , B1.gubun_nm AS level
     , (
        SELECT string_agg(inA.tag_nm, ',') AS tag_nm
          FROM haw.tag inA
         WHERE inA.tag_no IN (SELECT CAST(UNNEST(string_to_array(SUBSTR(inB.tag_str, 2, LENGTH(inB.tag_str)-2), '|')) AS Integer)
                                FROM haw.quest inB
                               WHERE inB.quest_no = A.quest_no)     
       ) AS tag_nm
	 , A.open_yn
     , A.badge_cnt
     , A.quest_clear
     , A.quest_nm
     , A.auth
     , A.description
     , A.point
     , A.input_dt
  FROM haw.quest A
       LEFT OUTER JOIN haw.gubun B1 ON (A.level = CAST(B1.gubun_cd AS Integer) AND B1.column_nm = 'level')
       LEFT OUTER JOIN haw.gubun B2 ON (a.type = B2.gubun_cd AND B2.column_nm = 'type').
       LEFT OUTER JOIN haw.region C ON (A.region_no = C.region_no)
       LEFT OUTER JOIN haw.city D ON (C.city_serial = D.city_serial)
       LEFT OUTER JOIN haw.nation E ON (D.nation_serial = E.nation_serial)
 WHERE A.region_no = 2
 ORDER BY A.quest_seq ASC 