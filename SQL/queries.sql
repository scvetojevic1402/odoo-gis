ALTER TABLE project_task
ALTER COLUMN geo_point TYPE geometry(Point, 4326)
USING ST_SetSRID(geo_point, 4326);


select name, state, website
from ir_module_module imm
where imm.website ilike '%github%'
order by 1 asc


SELECT id, geo_point, project_task.project_id, project_task.partner_longitude, project_task.partner_latitude  FROM project_task WHERE geo_point IS NOT NULL;

select * from project_task where project_task.geo_point is not null;


update project_task set project_id =4 where project_task.geo_point is not null


INSERT INTO project_task (id, kanban_state,name, project_id, partner_latitude, partner_longitude, geo_point, task_address, company_id)
VALUES
-- Miami-Dade County
(101, 'normal', 'University of Miami', 1, 25.7174, -80.2784, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2784, 25.7174), 4326), 3857), '1320 S Dixie Hwy, Coral Gables, FL 33146', 1),
(102, 'normal', 'Miami International Airport', 1, 25.7959, -80.2871, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2871, 25.7959), 4326), 3857), '2100 NW 42nd Ave, Miami, FL 33126', 1),
(103, 'normal', 'Vizcaya Museum and Gardens', 1, 25.7489, -80.2102, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2102, 25.7489), 4326), 3857), '3251 S Miami Ave, Miami, FL 33129', 1),
(104, 'normal', 'Wynwood Walls', 1, 25.8011, -80.1995, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1995, 25.8011), 4326), 3857), '2520 NW 2nd Ave, Miami, FL 33127', 1),
(105, 'normal', 'Zoo Miami', 1, 25.6118, -80.3983, ST_Transform(ST_SetSRID(ST_MakePoint(-80.3983, 25.6118), 4326), 3857), '12400 SW 152nd St, Miami, FL 33177', 1),
(106, 'normal', 'Dolphin Mall', 1, 25.7884, -80.3530, ST_Transform(ST_SetSRID(ST_MakePoint(-80.3530, 25.7884), 4326), 3857), '11401 NW 12th St, Miami, FL 33172', 1),
(107, 'normal', 'American Airlines Arena', 1, 25.7814, -80.1870, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1870, 25.7814), 4326), 3857), '601 Biscayne Blvd, Miami, FL 33132', 1),
(108, 'normal', 'Little Havana', 1, 25.7652, -80.2195, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2195, 25.7652), 4326), 3857), 'SW 8th St, Miami, FL 33135', 1),
(109, 'normal', 'South Beach', 1, 25.7907, -80.1300, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1300, 25.7907), 4326), 3857), 'Miami Beach, FL 33139', 1),
(110, 'normal', 'Coral Gables Museum', 1, 25.7503, -80.2606, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2606, 25.7503), 4326), 3857), '285 Aragon Ave, Coral Gables, FL 33134', 1),

-- Broward County
(111, 'normal', 'Sawgrass Mills Mall', 2, 26.1504, -80.3248, ST_Transform(ST_SetSRID(ST_MakePoint(-80.3248, 26.1504), 4326), 3857), '12801 W Sunrise Blvd, Sunrise, FL 33323', 1),
(112, 'normal', 'Fort Lauderdale Beach', 2, 26.1224, -80.1040, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1040, 26.1224), 4326), 3857), 'Fort Lauderdale, FL 33304', 1),
(113, 'normal', 'Las Olas Boulevard', 2, 26.1199, -80.1373, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1373, 26.1199), 4326), 3857), 'Las Olas Blvd, Fort Lauderdale, FL 33301', 1),
(114, 'normal', 'Hollywood Beach Broadwalk', 2, 26.0173, -80.1170, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1170, 26.0173), 4326), 3857), 'Hollywood, FL 33019', 1),
(115, 'normal', 'Seminole Hard Rock Hotel & Casino', 2, 26.0512, -80.2098, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2098, 26.0512), 4326), 3857), '1 Seminole Way, Hollywood, FL 33314', 1),
(116, 'normal', 'Butterfly World', 2, 26.2790, -80.1833, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1833, 26.2790), 4326), 3857), '3600 W Sample Rd, Coconut Creek, FL 33073', 1),
(117, 'normal', 'Flamingo Gardens', 2, 26.0629, -80.3100, ST_Transform(ST_SetSRID(ST_MakePoint(-80.3100, 26.0629), 4326), 3857), '3750 S Flamingo Rd, Davie, FL 33330', 1),
(118, 'normal', 'Deerfield Beach Pier', 2, 26.3184, -80.0728, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0728, 26.3184), 4326), 3857), '200 NE 21st Ave, Deerfield Beach, FL 33441', 1),
(119, 'normal', 'Young At Art Museum', 2, 26.1123, -80.2673, ST_Transform(ST_SetSRID(ST_MakePoint(-80.2673, 26.1123), 4326), 3857), '751 SW 121st Ave, Davie, FL 33325', 1),
(120, 'normal', 'Markham Park', 2, 26.1204, -80.3632, ST_Transform(ST_SetSRID(ST_MakePoint(-80.3632, 26.1204), 4326), 3857), '16001 W State Rd 84, Sunrise, FL 33326', 1),

-- Palm Beach County
(121, 'normal', 'The Breakers Palm Beach', 3, 26.7153, -80.0391, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0391, 26.7153), 4326), 3857), '1 S County Rd, Palm Beach, FL 33480', 1),
(122, 'normal', 'Lion Country Safari', 3, 26.6868, -80.3182, ST_Transform(ST_SetSRID(ST_MakePoint(-80.3182, 26.6868), 4326), 3857), '2003 Lion Country Safari Rd, Loxahatchee, FL 33470', 1),
(123, 'normal', 'Morikami Museum and Japanese Gardens', 3, 26.4322, -80.1564, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1564, 26.4322), 4326), 3857), '4000 Morikami Park Rd, Delray Beach, FL 33446', 1),
(124, 'normal', 'Norton Museum of Art', 3, 26.6983, -80.0556, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0556, 26.6983), 4326), 3857), '1450 S Dixie Hwy, West Palm Beach, FL 33401', 1),
(125, 'normal', 'Palm Beach Zoo', 3, 26.6689, -80.0728, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0728, 26.6689), 4326), 3857), '1301 Summit Blvd, West Palm Beach, FL 33405', 1),
(126, 'normal', 'Delray Municipal Beach', 3, 26.4615, -80.0728, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0728, 26.4615), 4326), 3857), 'Delray Beach, FL 33483', 1),
(127, 'normal', 'Jupiter Inlet Lighthouse', 3, 26.9488, -80.0856, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0856, 26.9488), 4326), 3857), '500 Captain Armours Way, Jupiter, FL 33469', 1),
(128, 'normal', 'Mounts Botanical Garden', 3, 26.6887, -80.1131, ST_Transform(ST_SetSRID(ST_MakePoint(-80.1131, 26.6887), 4326), 3857), '531 N Military Trl, West Palm Beach, FL 33415', 1),
(129, 'normal', 'South Florida Science Center', 3, 26.6835, -80.0718, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0718, 26.6835), 4326), 3857), '4801 Dreher Trail N, West Palm Beach, FL 33405', 1),
(130, 'normal', 'Peanut Island', 3, 26.7783, -80.0481, ST_Transform(ST_SetSRID(ST_MakePoint(-80.0481, 26.7783), 4326), 3857), 'Palm Beach, FL 33404', 1);
