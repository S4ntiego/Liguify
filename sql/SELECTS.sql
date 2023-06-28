-- challenger players puuids
SELECT summoners.puuid FROM summoners LEFT JOIN summonersLeague ON summoners.summonerId = summonersLeague.summonerId WHERE tier='CHALLENGER';

-- augments win rate from last 10 games
SELECT match_participant_augment.augment_api_name, AVG(match_participant.placement), COUNT(match_participant.placement) AS avg_place FROM match_participant LEFT JOIN match_participant_augment ON match_participant.match_id = match_participant_augment.match_id AND match_participant.puuid = match_participant_augment.puuid GROUP BY match_participant_augment.augment_api_name HAVING COUNT(match_participant.placement) > 10 ORDER BY avg_place DESC;

SELECT match_participant_champion_item.champion_api_name, items.item_name, COUNT(items.item_name) AS frequency FROM match_participant_champion_item LEFT JOIN items ON match_participant_champion_item.item_id = items.item_id LEFT JOIN match_participant ON match_participant.match_id = match_participant_champion_item.match_id AND match_participant.puuid = match_participant_champion_item.puuid GROUP BY match_participant_champion_item.champion_api_name,  items.item_name HAVING champion_api_name='Varus' ORDER BY frequency DESC;

--All Sylas items combinations
SELECT mpci.champion_api_name, ARRAY_AGG(i.item_name) as pepega FROM match_participant_champion_item mpci INNER JOIN items i USING (item_id) INNER JOIN match_participant mp USING (match_id, puuid) GROUP BY mpci.champion_api_name, mp.match_id, mp.puuid HAVING mpci.champion_api_name = 'Sylas';

--All Sylas items combinations with average win rate
SELECT mpci.champion_api_name, ARRAY_AGG(i.item_name) as pepega FROM match_participant_champion_item mpci INNER JOIN items i USING (item_id) INNER JOIN match_participant mp USING (match_id, puuid) GROUP BY mpci.champion_api_name, mp.match_id, mp.puuid HAVING mpci.champion_api_name = 'Sylas';

--Varus matches with exactly 3 items ordered by item combination frequency
SELECT AVG(pepo.placement), pepo.pepega, COUNT(pepo.pepega) FROM (SELECT mpci.champion_api_name, mp.placement as placement, ARRAY_AGG(i.item_name ORDER BY i.item_name) as pepega FROM match_participant_champion_item mpci INNER JOIN items i USING (item_id) INNER JOIN match_participant mp USING (match_id, puuid) GROUP BY mpci.champion_api_name, mp.match_id, mp.puuid HAVING mpci.champion_api_name = 'Varus' AND COUNT(i.item_name)=3) AS pepo GROUP BY pepo.pepega ORDER BY COUNT(pepo.pepega) DESC;

--Varus 3 items frequency
SELECT fr.three_items, COUNT(fr.three_items) as frequency, AVG(fr.placement) as average_placement FROM (SELECT ARRAY_AGG(item_name ORDER BY item_name) as three_items, champion_api_name, placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) INNER JOIN items USING (item_id) GROUP BY champion_api_name, placement, match_id, puuid HAVING champion_api_name='Varus' AND COUNT(item_name)=3) as fr GROUP BY fr.three_items ORDER BY COUNT(fr.three_items) DESC;

--Varus 3 items win frequency
SELECT fr.three_items, COUNT(fr.three_items) FROM (SELECT ARRAY_AGG(item_name ORDER BY item_name) as three_items, champion_api_name, placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) INNER JOIN items USING (item_id) GROUP BY champion_api_name, placement, match_id, puuid HAVING champion_api_name='Varus' AND COUNT(item_name)=3 AND placement=1) as fr GROUP BY fr.three_items ORDER BY COUNT(fr.three_items) DESC;

--Varus items frequency
SELECT COUNT(ic.frequency) FROM (SELECT ARRAY_AGG(item_name ORDER BY item_name) as frequency FROM match_participant_champion_item INNER JOIN items USING(item_id) GROUP BY champion_api_name, match_id, puuid HAVING champion_api_name='Varus') as ic;

--Champions ordered by popularity
SELECT cl.champion, SUM(cl.frequency), AVG(cl.place) FROM (SELECT champion_api_name as champion, count(champion_api_name) as frequency, placement as place FROM match_participant_champion mpc INNER JOIN match_participant mp USING (match_id, puuid) GROUP BY champion_api_name, mpc.match_id, mpc.puuid, mp.placement) as cl GROUP BY cl.champion ORDER BY SUM(cl.frequency) DESC;

--Champion general frequency
SELECT champion_api_name, COUNT(placement) FROM match_participant_champion INNER JOIN match_participant USING (match_id, puuid) GROUP BY champion_api_name;

--Champion top1 frequency
SELECT champion_api_name, COUNT(placement) FROM match_participant_champion INNER JOIN match_participant USING (match_id, puuid) GROUP BY champion_api_name, placement HAVING placement=1;

--Champion win rate
SELECT cf.champion_api_name, wf.placement, wf.placement / cf.freq::float as win_rate FROM ((SELECT champion_api_name, COUNT(placement) as freq FROM match_participant_champion INNER JOIN match_participant USING (match_id, puuid) GROUP BY champion_api_name) as cf JOIN (SELECT champion_api_name, COUNT(placement) as placement FROM match_participant_champion INNER JOIN match_participant USING (match_id, puuid) GROUP BY champion_api_name, placement HAVING placement=1) as wf ON cf.champion_api_name = wf.champion_api_name) GROUP BY cf.champion_api_name, wf.placement, cf.freq;

SELECT InvestmentName, Weight / (SELECT SUM(Weight) FROM Records) AS AdjWeight FROM Records;

--Champion avg place
SELECT champion_api_name, AVG(placement), COUNT(placement) FROM match_participant_champion INNER JOIN match_participant USING (match_id, puuid) GROUP BY champion_api_name;

--CHAMPIONS Frequency + avg placement + win + % frequency per player
SELECT fr.champion_api_name, champions.champion_name, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND(wfr.winfrequency/fr.frequency::decimal, 2) as win_ratio, ROUND(fr.frequency::decimal/(SELECT COUNT(champion_api_name)/8 FROM match_participant_champion), 2) as percentage_frequency FROM (SELECT champion_api_name, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_champion USING(match_id, puuid) GROUP BY champion_api_name) as fr  JOIN (SELECT champion_api_name, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion USING(match_id, puuid) GROUP BY champion_api_name, placement HAVING placement=1) as wfr USING(champion_api_name) JOIN champions USING (champion_api_name) WHERE champion_name != 'Nomsy' GROUP BY fr.champion_api_name, champion_name, frequency, average_placement, winfrequency ORDER BY fr.average_placement;

--ITEMS Frequency + avg placement + win + % frequency per player
SELECT items.item_name, fr.item_id, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND(wfr.winfrequency/fr.frequency::decimal, 2) as win_ratio, ROUND(fr.frequency::decimal/(SELECT COUNT(item_id)/8 FROM match_participant_champion_item), 2) as percentage_frequency FROM (SELECT item_id, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id) as fr  JOIN (SELECT item_id, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion_item USING(match_id, puuid) GROUP BY item_id, placement HAVING placement=1) as wfr USING(item_id) JOIN items USING (item_id) GROUP BY fr.item_id, items.item_name, frequency, average_placement, winfrequency ORDER BY fr.frequency DESC;

--AUGMENTS Frequency + avg placement + win + % frequency per player
SELECT fr.augment_api_name, augments.augment_name, fr.frequency, ROUND(fr.average_placement, 2) as average_placement, ROUND(wfr.winfrequency/fr.frequency::decimal, 2) as win_ratio, ROUND(fr.frequency::decimal/(SELECT COUNT(augment_api_name)/8 FROM match_participant_augment), 2) as percentage_frequency FROM (SELECT augment_api_name, COUNT(placement) as frequency, AVG(placement) as average_placement FROM match_participant INNER JOIN match_participant_augment USING(match_id, puuid) GROUP BY augment_api_name) as fr  JOIN (SELECT augment_api_name, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_augment USING(match_id, puuid) GROUP BY augment_api_name, placement HAVING placement=1) as wfr USING(augment_api_name) JOIN augments USING (augment_api_name) GROUP BY fr.augment_api_name, augment_name, frequency, average_placement, winfrequency ORDER BY fr.average_placement;

--Teamcomps
SELECT comp, COUNT(comp) FROM (SELECT ARRAY_AGG(champion_api_name) as comp FROM match_participant_champion GROUP BY match_id, puuid) as comps GROUP BY comp ORDER BY COUNT(comp) DESC;

SELECT comp, champion_api_name, COUNT(champion_api_name) FROM (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as comp FROM match_participant_champion GROUP BY match_id, puuid) as comps LEFT JOIN (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as build FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name) AS items USING (match_id, puuid) GROUP BY comp, champion_api_name;

--Czyzby????
SELECT comp, MAX(itemized_champion), champion_api_name FROM (SELECT comp, COUNT(comp) as comp_popularity FROM (SELECT ARRAY_AGG(champion_api_name) as comp FROM match_participant_champion GROUP BY match_id, puuid) as comps GROUP BY comp ORDER BY COUNT(comp) DESC) as comps2 LEFT JOIN (SELECT comp, champion_api_name, COUNT(champion_api_name) as itemized_champion FROM (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as comp FROM match_participant_champion GROUP BY match_id, puuid) as comps LEFT JOIN (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as build FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name) AS items USING (match_id, puuid) GROUP BY comp, champion_api_name) as items2 USING (comp) GROUP BY comp, comp_popularity, champion_api_name ORDER BY comp_popularity DESC;

SELECT comp, champion_api_name, COUNT(champion_api_name) as frequency, build FROM (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as comp FROM match_participant_champion GROUP BY match_id, puuid) as comps LEFT JOIN (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as build FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name) AS items USING (match_id, puuid) GROUP BY comp, champion_api_name, build ORDER BY frequency DESC;

--Kazdy dodatkowy champion w liscie to dodatkowy item dla tego championa
SELECT teamcomp, count(teamcomp) FROM (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp, ARRAY_AGG(item_id) as items FROM match_participant_champion_item LEFT JOIN match_participant_champion USING (match_id, puuid, champion_api_name) GROUP BY match_id, puuid) as stack GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC

SELECT * FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as items FROM match_participant_champion_item LEFT JOIN match_participant_champion USING (match_id, puuid, champion_api_name) GROUP BY match_id, puuid, champion_api_name) as stack LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as xD USING(match_id, puuid)

--Ile razy champion w danym compie byl itemizowany, trzeba tutaj dodac filtr na 3 itemy, bo poki co moze byc nawet jeden
SELECT teamcomp, count(teamcomp), champion_api_name FROM (SELECT * FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as items FROM match_participant_champion_item LEFT JOIN match_participant_champion USING (match_id, puuid, champion_api_name) GROUP BY match_id, puuid, champion_api_name) as stack LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as xD USING(match_id, puuid)) as wtf GROUP BY teamcomp, champion_api_name ORDER BY COUNT(teamcomp) DESC;

--Tutaj z 3 itemami
SELECT teamcomp, count(teamcomp), champion_api_name FROM (SELECT * FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as items FROM match_participant_champion_item LEFT JOIN match_participant_champion USING (match_id, puuid, champion_api_name) GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as stack LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as xD USING(match_id, puuid)) as wtf GROUP BY teamcomp, champion_api_name ORDER BY COUNT(teamcomp) DESC;

--Comp frequency + items
SELECT * FROM (SELECT teamcomp, COUNT(teamcomp) as comp_frequency FROM (SELECT ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as comps GROUP BY teamcomp) as xd LEFT JOIN (SELECT teamcomp, count(teamcomp) as itemization_frequency, champion_api_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as items FROM match_participant_champion_item LEFT JOIN match_participant_champion USING (match_id, puuid, champion_api_name) GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as stack LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as xD USING(match_id, puuid) as wtf GROUP BY teamcomp, champion_api_name ORDER BY COUNT(teamcomp) DESC) as dada USING (teamcomp) ORDER BY comp_frequency DESC, itemization_frequency DESC

--Globalnie jaki champ jest najczesciej itemizowany
SELECT teamcomp, COUNT(teamcomp) FROM (SELECT ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name) as t1 GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC

--most popular teamcomps along with most popular itemized champs within these comps (4 champs per comp)
SELECT o1.teamcomp, comp_frequency, itemization_frequency, most_frequent_itemized_champion FROM (SELECT teamcomp, COUNT(teamcomp) as comp_frequency FROM (SELECT ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as inner1 GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC) o1 LEFT JOIN LATERAL (
SELECT teamcomp, count(champion_api_name) as itemization_frequency, champion_api_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(teamcomp) DESC LIMIT 4
) o2 ON true LIMIT 100

--most popular build in a given teamcomp
SELECT teamcomp, count(teamcomp), build FROM (SELECT * FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id) as build FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as e1 LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as e2 USING (match_id, puuid)) as e3 GROUP BY teamcomp, build ORDER BY count(teamcomp) DESC

--final
SELECT o1.teamcomp, avg_place, comp_frequency, o2.itemization_frequency, o2.most_frequent_itemized_champion, o3.most_frequent_build, o3.build_frequency FROM 
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, AVG(placement) as avg_place FROM (SELECT ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp, placement FROM match_participant_champion LEFT JOIN match_participant USING (match_id, puuid) GROUP BY match_id, puuid, placement) as inner1 GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC) o1 LEFT JOIN LATERAL (
SELECT teamcomp, count(champion_api_name) as itemization_frequency, champion_api_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(teamcomp) DESC LIMIT 4
) o2 ON true LEFT JOIN LATERAL (
SELECT teamcomp, champion_api_name as most_frequent_itemized_champion_o3, items as most_frequent_build, count(items) as build_frequency FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name, items HAVING o1.teamcomp = teamcomp AND o2.most_frequent_itemized_champion = champion_api_name ORDER BY COUNT(items) DESC LIMIT 1
) as o3 ON true LIMIT 20

--test
SELECT * FROM (SELECT * FROM (SELECT ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as inner1 GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC) as o1 LEFT JOIN LATERAL (SELECT champion_api_name, count(champion_api_name) FROM (SELECT match_id, puuid, champion_api_name FROM match_participant_champion GROUP BY match_id, puuid, champion_api_name) as champions LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as inner3 USING(match_id, puuid) GROUP BY teamcomp, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(champion_api_name) DESC LIMIT 8) o2 ON true LIMIT 6

with recursive
    nodes as (
        SELECT x.family_id
        FROM (SELECT ARRAY_AGG(champion_api_name ORDER BY champion_api_name ASC) 			as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as t
        cross join lateral unnest(t.teamcomp) as x(family_id)
    ),
    edges as (
        select n1.id as id1, n2.id as id2
        from nodes n1
        inner join nodes n2 using (family_id)
    ),
    cte as (
        select id1, id2, array[id1] as visited 
        from edges
        where id1 = id2
        union all 
        select c.id1, e.id2, c.visited || e.id2
        from cte c
        inner join edges e on e.id1 = c.id2
        where e.id2 <> all(c.visited)
    ),
    res as (
        select id1, array_agg(distinct id2 order by id2) as id2s
        from cte
        group by id1
    )
select 
    array_agg(distinct n.id order by n.id) as ids, 
    array_agg(distinct n.family_id order by n.family_id) as family_ids
from res r
inner join nodes n on n.id = r.id1
group by r.id2s

--create temp table
CREATE TABLE teamcomps AS
SELECT o1.teamcomp, o1.avg_place, o1.comp_frequency, o1.origins, o1.traits, o2.itemization_frequency, o2.most_frequent_itemized_champion, o3.most_frequent_build, o3.build_frequency FROM
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as o1 GROUP BY match_id, puuid, placement) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second ORDER BY COUNT(teamcomp) DESC, origins DESC) o1
LEFT JOIN LATERAL (
SELECT teamcomp, count(champion_api_name) as itemization_frequency, champion_api_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(teamcomp) DESC LIMIT 4
) o2 ON true LEFT JOIN LATERAL (
SELECT teamcomp, champion_api_name as most_frequent_itemized_champion_o3, items as most_frequent_build, count(items) as build_frequency FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name, items HAVING o1.teamcomp = teamcomp AND o2.most_frequent_itemized_champion = champion_api_name ORDER BY COUNT(items) DESC LIMIT 1
) as o3 ON true LIMIT 200

--
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, AVG(placement) as avg_place FROM (SELECT ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp, placement FROM match_participant_champion LEFT JOIN match_participant USING (match_id, puuid) GROUP BY match_id, puuid, placement) as inner1 GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC) o1

--create short table
CREATE TABLE teamcompsShort AS
SELECT o1.teamcomp, avg_place, comp_frequency FROM 
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, AVG(placement) as avg_place FROM (SELECT ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp, placement FROM match_participant_champion LEFT JOIN match_participant USING (match_id, puuid) GROUP BY match_id, puuid, placement) as inner1 GROUP BY teamcomp ORDER BY COUNT(teamcomp) DESC) as o1 LIMIT 200

--short table with origins
SELECT origins_first || origins_second as origins, traits_first || traits_second as traits, teamcomp, COUNT(teamcomp) FROM (SELECT coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) WHERE champion_name != 'Nomsy') as o1 GROUP BY match_id, puuid) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second ORDER BY COUNT(teamcomp) DESC, origins DESC

--final table
CREATE TABLE teamcomps AS
SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, o1.comp_frequency, o1.origins, o1.traits, o2.itemization_frequency, o2.most_frequent_itemized_champion, o3.most_frequent_build, o3.build_frequency FROM
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as o1 GROUP BY match_id, puuid, placement) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second ORDER BY COUNT(teamcomp) DESC, origins DESC) o1
LEFT JOIN LATERAL (
SELECT teamcomp, count(champion_api_name) as itemization_frequency, champion_api_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(teamcomp) DESC LIMIT 4
) o2 ON true LEFT JOIN LATERAL (
SELECT teamcomp, champion_api_name as most_frequent_itemized_champion_o3, items as most_frequent_build, count(items) as build_frequency FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_api_name, items HAVING o1.teamcomp = teamcomp AND o2.most_frequent_itemized_champion = champion_api_name ORDER BY COUNT(items) DESC LIMIT 1
) as o3 ON true LIMIT 5


JOIN (SELECT champion_api_name, COUNT(placement) as winfrequency FROM match_participant INNER JOIN match_participant_champion USING(match_id, puuid) GROUP BY champion_api_name, placement HAVING placement=1) as wfr USING(champion_api_name)

--table with win rate
SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, win_frequency, o1.comp_frequency, o1.origins, o1.traits FROM

(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM

(SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as i1 GROUP BY match_id, puuid, placement) as i2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second ORDER BY COUNT(teamcomp) DESC, origins DESC) as o1 JOIN(SELECT teamcomp, COUNT(teamcomp) as win_frequency FROM (SELECT ARRAY_AGG(champion_api_name ORDER BY champion_api_name DESC) as teamcomp FROM (SELECT * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as ii1 GROUP BY match_id, puuid, placement HAVING placement=1) as ii2 GROUP BY teamcomp) as oo2 USING (teamcomp) LIMIT 2

--Win rate/Top 4 rate
SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, ROUND(win_frequency/comp_frequency::decimal, 2) as win_ratio, ROUND(top4_frequency/comp_frequency::decimal, 2) as top4_ratio, o1.comp_frequency, o1.origins, o1.traits FROM

(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, COUNT(teamcomp) FILTER (where placement=1) as win_frequency, COUNT(teamcomp) FILTER (where placement IN (1,2,3,4)) as top4_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM

(SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as i1 GROUP BY match_id, puuid, placement) as i2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second ORDER BY COUNT(teamcomp) DESC, origins DESC) as o1 LIMIT 2

--FINAL TABLE
SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, ROUND((win_frequency/comp_frequency::decimal)*100, 2) as win_ratio, ROUND((top4_frequency/comp_frequency::decimal)*100, 2) as top4_ratio, o1.comp_frequency, o1.origins, o1.traits, o2.itemization_frequency, o2.most_frequent_itemized_champion, o2.champion_api_name, o3.most_frequent_build, o3.build_frequency FROM
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, COUNT(teamcomp) FILTER (where placement=1) as win_frequency, COUNT(teamcomp) FILTER (where placement IN (1,2,3,4)) as top4_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as o1 GROUP BY match_id, puuid, placement) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second ORDER BY COUNT(teamcomp) DESC, origins DESC) o1
LEFT JOIN LATERAL (
SELECT teamcomp, count(champion_api_name) as itemization_frequency, champion_api_name, champion_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN champions USING (champion_api_name) LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_name, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(teamcomp) DESC LIMIT 4
) o2 ON true LEFT JOIN LATERAL (
SELECT teamcomp, champion_name as most_frequent_itemized_champion_o3, items as most_frequent_build, count(items) as build_frequency FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN champions USING (champion_api_name) LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_name, items HAVING o1.teamcomp = teamcomp AND o2.most_frequent_itemized_champion = champion_name ORDER BY COUNT(items) DESC LIMIT 1
) as o3 ON true WHERE comp_frequency > 100 AND NOT (teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}' AND cardinality(teamcomp) >= 8) ORDER BY win_ratio DESC LIMIT 5 

--Short table by win_frequency and count teamcomp > 100 and champion != Nomsy
CREATE TABLE teamcompsShort AS
SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, ROUND((win_frequency/comp_frequency::decimal)*100, 2) as win_ratio, ROUND((top4_frequency/comp_frequency::decimal)*100, 2) as top4_ratio, o1.comp_frequency, o1.origins, o1.traits FROM
(SELECT teamcomp, COUNT(teamcomp) as comp_frequency, COUNT(teamcomp) FILTER (where placement=1) as win_frequency, COUNT(teamcomp) FILTER (where placement IN (1,2,3,4)) as top4_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid) WHERE champion_name!='Nomsy') as o1 GROUP BY match_id, puuid, placement) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second) o1 WHERE comp_frequency > 100 AND NOT (teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}' AND cardinality(teamcomp) >= 8) ORDER BY win_ratio DESC LIMIT 400


--
CREATE TABLE teamcomps AS
SELECT * FROM (SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, ROUND((win_frequency/comp_frequency::decimal)*100, 2) as win_ratio, ROUND((top4_frequency/comp_frequency::decimal)*100, 2) as top4_ratio, o1.comp_frequency, o1.origins, o1.traits FROM (SELECT teamcomp, COUNT(teamcomp) as comp_frequency, COUNT(teamcomp) FILTER (where placement=1) as win_frequency, COUNT(teamcomp) FILTER (where placement IN (1,2,3,4)) as top4_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as o1 GROUP BY match_id, puuid, placement) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second) o1 WHERE comp_frequency > 100 AND ROUND((top4_frequency/comp_frequency::decimal)*100, 2) >= 20 AND ((cardinality(teamcomp) <= 7 AND NOT 'TrainerDragon' = ANY(teamcomp) AND teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}') OR (cardinality(teamcomp) >= 8 AND 'TrainerDragon' = ANY(teamcomp) AND NOT teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}') OR (cardinality(teamcomp) <= 8 AND 'TrainerDragon' = ANY(teamcomp) AND teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}') OR (
cardinality(teamcomp) <= 8 AND NOT 'TrainerDragon' = ANY(teamcomp) AND NOT teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}')) ORDER BY win_ratio DESC) o1
LEFT JOIN LATERAL (
SELECT count(champion_api_name) as itemization_frequency, champion_api_name, champion_name as most_frequent_itemized_champion FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN champions USING (champion_api_name) LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_name, champion_api_name HAVING o1.teamcomp = teamcomp ORDER BY COUNT(champion_api_name) DESC LIMIT 4
) o2 ON true
LEFT JOIN LATERAL (
SELECT items as most_frequent_build, count(items) as build_frequency FROM (SELECT match_id, puuid, champion_api_name, ARRAY_AGG(item_id ORDER BY item_id DESC) as items FROM match_participant_champion_item GROUP BY match_id, puuid, champion_api_name HAVING COUNT(item_id)=3 ) as teamcomp_of_each_player_with_items_ungrouped LEFT JOIN champions USING (champion_api_name) LEFT JOIN (SELECT match_id, puuid, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM match_participant_champion GROUP BY match_id, puuid) as teamcomp_of_each_player_without_items USING(match_id, puuid) GROUP BY teamcomp, champion_name, items HAVING o1.teamcomp = teamcomp AND o2.most_frequent_itemized_champion = champion_name ORDER BY COUNT(items) DESC LIMIT 1
) as o3 ON true 
LIMIT 300

--Filtered short teamcomps
CREATE TABLE teamcompsShort AS
SELECT * FROM (SELECT o1.teamcomp, ROUND(o1.avg_place, 2) as avg_place, ROUND((win_frequency/comp_frequency::decimal)*100, 2) as win_ratio, ROUND((top4_frequency/comp_frequency::decimal)*100, 2) as top4_ratio, o1.comp_frequency, o1.origins, o1.traits FROM (SELECT teamcomp, COUNT(teamcomp) as comp_frequency, COUNT(teamcomp) FILTER (where placement=1) as win_frequency, COUNT(teamcomp) FILTER (where placement IN (1,2,3,4)) as top4_frequency, AVG(placement) as avg_place, origins_first || origins_second as origins, traits_first || traits_second as traits FROM (SELECT placement, coalesce (array_concat_agg(origins) FILTER (WHERE origin_first IS NOT NULL)) as origins_first, coalesce (array_agg(origin_second) FILTER (WHERE origin_second IS NOT NULL)) as origins_second, coalesce (array_agg(trait_first) FILTER (WHERE trait_first IS NOT NULL)) as traits_first, coalesce (array_agg(trait_second) FILTER (WHERE trait_second IS NOT NULL)) as traits_second, ARRAY_AGG(champion_api_name ORDER BY rarity ASC, champion_api_name ASC) as teamcomp FROM (SELECT ARRAY_FILL(origin_first, array[origin_quantity]) as origins, * FROM match_participant_champion LEFT JOIN champions USING (champion_api_name) LEFT JOIN match_participant USING (match_id, puuid)) as o1 GROUP BY match_id, puuid, placement) as o2 GROUP BY teamcomp, origins_first, origins_second, traits_first, traits_second) o1 WHERE comp_frequency > 100 AND ROUND((top4_frequency/comp_frequency::decimal)*100, 2) >= 20 AND ((cardinality(teamcomp) <= 7 AND NOT 'TrainerDragon' = ANY(teamcomp) AND teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}') OR (cardinality(teamcomp) >= 8 AND 'TrainerDragon' = ANY(teamcomp) AND NOT teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}') OR (cardinality(teamcomp) <= 8 AND 'TrainerDragon' = ANY(teamcomp) AND teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}') OR (
cardinality(teamcomp) <= 8 AND NOT 'TrainerDragon' = ANY(teamcomp) AND NOT teamcomp && '{"AurelionSol", "DragonBlue", "DragonGold", "DragonPurple", "DragonGreen", "Shyvana", "AoShin"}')
) ORDER BY win_ratio DESC) o1
   

