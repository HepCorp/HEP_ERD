INSERT INTO haw.continent (continent_cd, continent_nm, lat, lng, zoom) values ('A', '아시아', 23.7724852, 62.6217579, 3);
INSERT INTO haw.nation (nation_serial, continent_cd, nation_cd, nation_nm, lat, lng, zoom) values ('A082', 'A', '082', '대한민국', 35.8406664, 124.8534851, 7);
INSERT INTO haw.city (city_serial, nation_serial, city_cd, city_nm, lat, lng, zoom) values ('A082063', 'A082', '063', '제주특별자치도', 33.3354201, 126.4289177, 11);
INSERT INTO haw.region (city_serial, region_nm, lat, lng, zoom) values ('A082063', '제주시', 33.5038451, 126.4949806, 13);
INSERT INTO haw.region (city_serial, region_nm, lat, lng, zoom) values ('A082063', '서귀포시', 33.2501997, 126.5587452, 15);


select * from haw.continent;
select * from haw.nation;
select * from haw.city;
select * from haw.region;


INSERT INTO haw.team (team_nm, team_tot, images) values ('EAGLES', 10, '/resources/images/eagle.png');
                      
select * from haw.team;


INSERT INTO haw.team_region (team_no, region_no) values (1, 2);

select * from haw.team_region;