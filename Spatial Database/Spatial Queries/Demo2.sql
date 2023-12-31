-- WE WILL USE "cs621maynoothbirds" TABLE

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This is an automatically generated SQL table. This has been generated by the RADIAN tool (developer Mr. Paddy Gorry)

DROP TABLE IF EXISTS CS621MaynoothBirds; 

CREATE TABLE CS621MaynoothBirds ( 
	 pkid SERIAL PRIMARY KEY NOT NULL, 
	 thegeom GEOMETRY DEFAULT ST_GeomFromText('POINT(0,51)', 4326), 
	 obsnum INTEGER, 
	 obscode VARCHAR, 
	 obstime TIMESTAMP,
	 bird VARCHAR
); 
-- Spatial index is now created

 CREATE INDEX CS621MaynoothBirds_spatial_index ON CS621MaynoothBirds USING gist (thegeom); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.581052688247403,53.38019649790774),4326), 992, 'rdtmeahb1wvCTdx', '2022-09-11 06:34:36', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580878518145863,53.37949141452251),4326), 218, 'WCwSBYFW1CwC4Vg', '2022-09-14 05:41:03', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.58211542201515,53.38035386737116),4326), 357, 'DyvuPziGbo4MGNc', '2022-09-17 10:19:10', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580133690083455,53.37915274703175),4326), 971, 'rhj1IJMlsJk0WHO', '2022-09-07 07:33:01', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.582211434724225,53.380472840269526),4326), 776, 'LqmgFPA0lcZJ4mJ', '2022-09-22 20:28:56', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.579578276648217,53.38120886227063),4326), 783, 'Fe1E3PFdG73t9FY', '2022-09-17 07:03:31', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.583463158753095,53.3821509977187),4326), 738, '3QOkRYGbjqNAWal', '2022-09-25 02:43:26', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.584039918306822,53.38089139763301),4326), 988, 'EXkByLSYpTCzPbY', '2022-09-28 17:21:39', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5788316746714965,53.38139532873621),4326), 564, '6YctecNv0QHOEX0', '2022-09-19 14:20:38', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585361600295443,53.377957804880985),4326), 809, '6UOZiDhCxro2gvX', '2022-09-24 15:35:55', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585496819633917,53.37804077070036),4326), 782, 'vcz2ytLB3e4eli9', '2022-09-08 03:16:37', 'owl'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580807777577702,53.37703128396154),4326), 297, 'uL9tildwm9ohHdi', '2022-09-23 07:51:35', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.584184576789144,53.38363009579256),4326), 264, 'pTgD0rlWt8Jc2l8', '2022-09-06 05:47:54', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.57965612556048,53.37635218826006),4326), 265, '0MMwRsRwXrkH1g0', '2022-09-17 11:36:04', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589376446285688,53.380932678681084),4326), 271, 'elPxTbCCr6AxGDD', '2022-09-01 09:59:26', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.588266404780402,53.381403013365784),4326), 838, '7AD4LRtkHKCobWi', '2022-09-12 05:36:17', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5864415454527325,53.37830712513941),4326), 43, 'SsuPXpEM26qrvqU', '2022-09-27 06:21:14', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585267875132866,53.380902262481925),4326), 990, 'amzbYGhhsUgVeIg', '2022-09-01 22:55:11', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589732986479543,53.378537015678475),4326), 793, 'HXyW4rszotbuf1o', '2022-09-30 11:00:49', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589274355389017,53.380327413062076),4326), 694, '8yMVSpgXDRsDIgY', '2022-09-06 16:06:26', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.581520003102897,53.37906347816489),4326), 842, 'L41jfmayju4gOCj', '2022-09-10 19:30:59', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.594245179374013,53.38136982558096),4326), 157, 'xgvHIVSgpL0isLq', '2022-09-06 03:15:39', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5867422297367035,53.375286788338585),4326), 309, '4BuHldUrDH6Gcu7', '2022-09-21 12:32:29', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580730781905482,53.37995975966395),4326), 7, 'vJ9DiwEyru95G68', '2022-09-14 13:02:41', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.582895788729906,53.384631160966194),4326), 874, '5kdbjgrnwQa5nCq', '2022-09-23 13:21:34', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589589412979076,53.38183907665222),4326), 878, 'ARRQlVQNfDUUzsy', '2022-09-05 08:27:29', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585051261406308,53.38577496143038),4326), 364, 'azKi2XpyYJe5gsu', '2022-09-07 03:55:49', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.584466547743891,53.3729514899762),4326), 801, 'C6fjG6V0qgKuHgD', '2022-09-04 18:02:59', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.593964348469784,53.379434603116465),4326), 149, 'Ivl9Z7MD0gYmZAm', '2022-09-05 12:16:48', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.58251279629993,53.383443938525204),4326), 977, 'pwHEYK8wXy3qeUj', '2022-09-24 21:34:26', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5879534705591825,53.381245713924315),4326), 177, 'vEgKCGcVV5EOe9r', '2022-09-09 18:08:58', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.586294977621938,53.378373289761875),4326), 765, 'roDn0zJ5Q4hBjbW', '2022-09-18 05:25:08', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.58579340964383,53.378302262046915),4326), 316, 'rgHVMFBMJ4cRhoe', '2022-09-09 11:22:30', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.587088319374376,53.3759538606226),4326), 577, 'iiMEnKhVTdDMoUk', '2022-09-28 12:57:35', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.590788503616052,53.379978698110634),4326), 28, 'lO29KiQK6C5EnQf', '2022-09-28 02:49:21', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.591968239121925,53.378503399775994),4326), 584, 'vQV1iQhYF8Y5uOp', '2022-09-03 21:04:53', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5837330551025195,53.377565048076086),4326), 898, 'bqrk16UZYdTuGWS', '2022-09-05 22:33:31', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.579933364485603,53.38029639938748),4326), 272, '6Qt69Wr6ufpmxS8', '2022-09-01 06:06:37', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5861531961698025,53.38198448990177),4326), 807, 'CtgogZx1gLI9OgG', '2022-09-17 01:52:16', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595776483180935,53.37340444280537),4326), 938, 'Y6T9bNQ5XXzhqFG', '2022-09-26 10:00:00', 'hawk'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585285217697136,53.37040558969392),4326), 530, 'DTNq0f2F3M7suXx', '2022-09-02 14:16:23', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585638450335159,53.37933775547844),4326), 872, 'Aye5MXmPXwbPEYF', '2022-09-03 23:52:21', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.59334832862745,53.373226464444926),4326), 429, 'nOkzrhSSnKPewou', '2022-09-16 07:25:43', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595893895414719,53.381504826949204),4326), 361, 'jFfxAEamroEXYa4', '2022-09-13 13:32:09', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.586881500822965,53.38752153321063),4326), 705, 'iUQJVveFmwJfIb4', '2022-09-09 21:49:53', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.588036326153614,53.380019407893),4326), 213, 'GG0SjWzpW1EHrS7', '2022-09-07 22:13:45', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.586547154900517,53.383401718115195),4326), 63, 'aEcg856xDkKNjrE', '2022-09-30 05:17:44', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.588287155464565,53.38362469283343),4326), 156, '3NAPRMQjQy7OkkI', '2022-09-15 19:26:02', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.579267893492215,53.38151579315691),4326), 854, '3cneK4MTPfUskWa', '2022-09-20 19:19:11', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.592587555006015,53.384767520015586),4326), 822, 'PtdJiQv6sCC5L6E', '2022-09-28 07:23:42', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.588613790355798,53.3859866112689),4326), 765, 'PRMBP7FectwUbxG', '2022-09-17 21:00:47', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.598169144692305,53.387400375681686),4326), 414, 'oN82mzHwwbpmOtp', '2022-09-29 05:41:25', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.599488177976314,53.38075323503608),4326), 306, 'S37Sf8ZIWTgcbJl', '2022-09-14 00:53:01', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.583401904822234,53.37594388376738),4326), 967, 'gcd1qO2hZB54AFC', '2022-09-22 01:45:09', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580126155868597,53.3794128365117),4326), 518, 'vcbVjK6FdWZRQki', '2022-09-03 13:59:39', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5960677274356625,53.39062486533079),4326), 89, 'OImCRuB35E5toTS', '2022-09-11 23:23:37', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.593541610767025,53.38807656654879),4326), 99, 'xwnhMvYIqMRyF8c', '2022-09-13 22:31:43', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.608758985460242,53.375458295351244),4326), 494, 'LJeCufjwpXChA0Y', '2022-09-17 23:49:07', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.602354080645693,53.37728275449101),4326), 756, 'wALGRZO0SUchjI7', '2022-09-21 13:52:24', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.59733136943068,53.3810174158686),4326), 313, 'GBdBVBqr9fb2wd7', '2022-09-09 23:06:24', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.594257911220997,53.37951484902588),4326), 405, 'n4JoYBqjiwwKaHG', '2022-09-15 20:06:48', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.588516563368822,53.381376060242324),4326), 357, '7fWsRnSg5YWSqe0', '2022-09-03 13:23:17', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.596716368488813,53.37899963107497),4326), 901, 'B78oEB7AMHRp5QQ', '2022-09-05 09:30:50', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.592482670355777,53.37930647982899),4326), 649, 'ZqEsEffvVtdBmbC', '2022-09-04 19:03:23', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.58965225742211,53.37951927409734),4326), 25, 'Zdz3ed4bT4Zgun5', '2022-09-28 01:22:33', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.593854487655421,53.38630991181956),4326), 275, 'xXdIBTimKc4J95R', '2022-09-21 08:13:31', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595511317778154,53.38147878722959),4326), 364, 'je0rVzrkVOkXHKb', '2022-09-20 21:23:15', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595120949923313,53.378670784661765),4326), 96, 'TWB4dcmd2ICE8RQ', '2022-09-02 12:18:52', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.603639096538133,53.37619920363344),4326), 873, 'uDWZ20RsPcwJ9C6', '2022-09-20 04:41:06', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.610134743620754,53.379290370017095),4326), 233, 'FnZcfDfXtpFhNY4', '2022-09-21 02:02:13', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595428173541895,53.37977212935718),4326), 277, 'dVNWf2jYXzlppeF', '2022-09-20 09:03:59', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.603839654309008,53.388672030774565),4326), 552, 'K1OZFfA2QM7VBHa', '2022-09-24 09:30:25', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.593146635837592,53.392102637159105),4326), 163, 'LcMJvk9mbkM9wRJ', '2022-09-07 02:29:30', 'hawk'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.605621244774706,53.3796575746779),4326), 986, 'U9oO2b18VLEaVfL', '2022-09-15 14:36:48', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5831252638945355,53.37067695371818),4326), 610, 'JJA9DaxkFPEfUCz', '2022-09-01 10:36:38', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589188174661559,53.38243538007201),4326), 664, 'TgTdApj04IMySn4', '2022-09-11 09:42:12', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5924754463756985,53.38245659943444),4326), 5, 'taUDGE9xv7J59bQ', '2022-09-20 16:23:00', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.591061488819717,53.38097313061022),4326), 111, 'rLluOrcCXIZlIA6', '2022-09-20 15:42:54', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589244719443633,53.38140961072242),4326), 952, 'z6gZmlJqcQYBFIx', '2022-09-13 07:10:42', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.586960245910862,53.391539981460554),4326), 872, 'ZBxXwd7X2z7H0Al', '2022-09-06 07:07:02', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585766243741672,53.391730355219835),4326), 254, 'WuVuzj6j4n9KIKE', '2022-09-18 17:53:04', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.587020980047938,53.391035547345325),4326), 576, 'VZgMr3gD9xvkTJc', '2022-09-16 16:20:59', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.583382203143658,53.38974026239094),4326), 186, 'Qohh7l51pGk4FeD', '2022-09-23 04:36:45', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585157793236555,53.390944248121656),4326), 26, 'p9cZ9AiWL9XH7JU', '2022-09-20 17:37:09', 'hawk'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.590324122296208,53.38960687839927),4326), 163, 'PgQ5wZN5aqQt90P', '2022-09-29 06:50:23', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5875792944332145,53.39111134396255),4326), 848, 'kTLbb3wv2krb04S', '2022-09-03 23:02:51', 'WAGtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.589561663323729,53.39271953994711),4326), 550, 'VCzz72Rt8qizPHO', '2022-09-17 04:10:03', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.591744399038989,53.392428061945196),4326), 409, 'zJBi9OUweTKi0lF', '2022-09-19 23:11:41', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.584125030876553,53.38882239562574),4326), 999, 'a374FJgI8ImH69P', '2022-09-25 13:04:36', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.58005556164738,53.392233922762166),4326), 623, 'tdoxLCc8OWmecBN', '2022-09-27 10:36:11', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.593495898998802,53.38990024284239),4326), 90, 'dX2IjTYUi9IEw3A', '2022-09-23 09:30:28', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580416491895823,53.38954569948914),4326), 500, 'rigSXfyc69fpaLs', '2022-09-30 15:52:17', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.578628858707779,53.38154083157372),4326), 741, 'qWaZZSPJrfXhQo1', '2022-09-07 19:11:24', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.578463208825026,53.38166225943176),4326), 755, 'AMqrOH6nu5z3LH4', '2022-09-23 21:41:28', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.578236871786328,53.3799600911377),4326), 139, 'co1as0jQxgnd2yy', '2022-09-22 22:40:32', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5766434870879715,53.37975608978275),4326), 211, 'jSTJ9u74KEd08Wx', '2022-09-01 16:35:17', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5802588785716445,53.382549938505484),4326), 146, '9iZeGvM4Uj54l3t', '2022-09-08 14:28:59', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580278086688673,53.379613677674335),4326), 893, 'FeCr8Nwzg0gPHJP', '2022-09-15 10:58:40', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585167295908032,53.38045349861031),4326), 573, 'nSBaK7YmDpLDJVg', '2022-09-10 23:20:02', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.578512081102786,53.38088483704599),4326), 263, 'XaSmBrQOvp45SX0', '2022-09-02 06:03:41', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.604302049011527,53.387486687468076),4326), 117, '3vduifAfJr9g1vi', '2022-09-10 14:03:43', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.602987074748993,53.38815835858576),4326), 879, '3LjxG0c6EShowFJ', '2022-09-03 15:52:50', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.6067604309532495,53.385457612669256),4326), 760, 'mYHrQphDym5uSNX', '2022-09-20 12:32:52', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.604738916591297,53.38515233409234),4326), 357, 'msnHXvLYDwxzGUY', '2022-09-07 00:21:12', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.604789940486917,53.390967880064224),4326), 200, 'Zv33jZYuub7d6au', '2022-09-28 20:38:52', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.602806083870366,53.38381039522045),4326), 344, 'gKcuidSdARWCCWu', '2022-09-26 03:46:33', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.599536654660883,53.39021597309605),4326), 896, 'YLWyCSLN5Bedhln', '2022-09-06 05:06:13', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.605909270425798,53.382789113486005),4326), 96, 'juay7eFdqhHgK7T', '2022-09-16 21:28:55', 'rook'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.597607421715045,53.3917419337024),4326), 708, 'NCXuwGJdcolTVSD', '2022-09-12 15:51:47', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.613814754507133,53.386487313735834),4326), 106, 'TURiGHRpqN14Cyd', '2022-09-14 17:14:39', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.609540088974988,53.385634821563364),4326), 363, 'gfSgdfUdC6pKjZb', '2022-09-04 21:29:24', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.596725277077391,53.373196607814585),4326), 189, '6vptmFHVMQzfcYL', '2022-09-01 05:09:36', 'Sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.598408868408594,53.37351915068379),4326), 932, '5hHakxcGAgfYHBF', '2022-09-10 15:51:26', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5984527449978705,53.37547859627857),4326), 263, 'qPapw2vghz7nd02', '2022-09-14 08:22:44', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.598987564693984,53.3726401559779),4326), 463, 'fvwoovNeMDd9u0K', '2022-09-12 10:12:32', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595517784867405,53.375240901130866),4326), 322, '6oxreag5in5Et52', '2022-09-19 04:24:56', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.600273139761094,53.37550052563151),4326), 586, 'GSfpFQhvqbTg5pK', '2022-09-21 18:07:19', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.59793292647624,53.37029360502721),4326), 133, 'bxOV6DaZYMM8oYf', '2022-09-02 08:16:05', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.599377923613695,53.37444911634437),4326), 185, 'OwQAzYbzdLVguMj', '2022-09-15 09:52:55', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.597686273271704,53.381086166776115),4326), 645, '8HVv8jT9vrOz9ar', '2022-09-17 20:20:23', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.596572427328288,53.380430852913776),4326), 586, 'CFJ8tbGlHBjsKY0', '2022-09-24 17:44:24', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5934912969868105,53.38039916933933),4326), 7, 'aGkqZiabixFJD2U', '2022-09-08 07:07:54', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.595716559353815,53.379418021104456),4326), 233, 'HK43tUhDQxsZGs5', '2022-09-25 22:19:13', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.6109605256854405,53.377502107871834),4326), 925, 'uvSWk15ExKgdpUW', '2022-09-30 15:45:26', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.612276785554211,53.37932090593076),4326), 860, 'V9Py1aEt4WqSXtm', '2022-09-10 22:03:53', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.607460015545175,53.379513576705655),4326), 265, 'DcLGfyTFDfsE1kh', '2022-09-01 10:09:15', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.614048842157807,53.37911075659391),4326), 972, 'WxmVLQYrThaPoTv', '2022-09-05 08:07:59', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.616067187294264,53.38073699556651),4326), 948, 'ERUewVTNs721FoH', '2022-09-26 06:12:05', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.607163238508866,53.37827567731107),4326), 298, 'qtMs240NjTiUtsA', '2022-09-04 09:08:32', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.60616070744416,53.3773478442562),4326), 364, 'coP69HhlZtDN7dT', '2022-09-29 21:07:10', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.612333092458336,53.37646910775876),4326), 517, 'AxVcO1o63xKFWAZ', '2022-09-19 08:22:57', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.613325362121604,53.380114065612595),4326), 543, '3C7wFPPbCSNYtWx', '2022-09-22 05:27:18', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.603909166705248,53.37910561511535),4326), 150, 'wb2sQkyFZgG6KNB', '2022-09-25 02:18:06', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.6131493126093455,53.374108279551585),4326), 402, 'niSVUZTsLWoMJrp', '2022-09-20 11:02:14', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5844573109056626,53.37340380249353),4326), 426, 'qfZXTp9fc3buvMj', '2022-09-22 21:35:22', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.584501283922303,53.373367544610254),4326), 466, '4Rnl4gSdN02vczV', '2022-09-07 20:26:56', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585192985984163,53.37345903230139),4326), 694, 'lWZt46u0Hkcby8G', '2022-09-03 11:54:41', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.583386493470299,53.374543773906545),4326), 588, 'DlDFK2UEpqqX9jp', '2022-09-07 23:26:58', 'wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.584274252285606,53.3744421943414),4326), 273, 'xvOZLHR1OTryEeP', '2022-09-06 12:24:06', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.587585082850121,53.374465709596386),4326), 480, 'RxtuXPetreYskXh', '2022-09-18 08:54:46', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.590294871330538,53.37280362724247),4326), 679, 'oxMvctkmbf7RAWM', '2022-09-30 07:00:13', 'hawk'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.586322241153614,53.370954802328384),4326), 227, 'qOoSfQ6xnzEpBzA', '2022-09-03 18:05:29', 'Wagtail'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.5835085865468255,53.37362440073968),4326), 679, 'QctcYFbmwdeUbYW', '2022-09-10 13:49:24', 'magpie'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.576719116340556,53.372515157648394),4326), 691, 'qYrwBcW14s9rvzf', '2022-09-22 03:29:30', 'rook'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.577203625460329,53.37340820127757),4326), 404, '57v9BppMFQHmQbd', '2022-09-25 19:00:21', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.580260449605195,53.37692395359343),4326), 899, 'QdEhOyzJ6nWxbYg', '2022-09-20 20:22:03', 'blackbird'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.585101307703078,53.36762268135888),4326), 180, 'GWJOWz2K7WTGy6U', '2022-09-28 21:27:05', 'crow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.587704987802845,53.37416360033688),4326), 552, 'Dh1baf268c1BN4l', '2022-09-06 20:15:36', 'sparrow'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.587373756705781,53.37308105083764),4326), 254, 'RwFXpGIUS1w2M9H', '2022-09-01 01:13:20', 'robin'); 
INSERT into CS621MaynoothBirds (thegeom, obsnum, obscode, obstime, bird ) VALUES (ST_SetSRID(ST_MakePoint(-6.583302373226175,53.36826758168758),4326), 234, 'Mdj4l7sscPoHJ8C', '2022-09-28 22:07:58', 'magpie'); 
---- END OF SQL FILE --

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- The Eolas Building north entrance has longitude -6.60155 and latitude 53.38522. Write an SQL query to return all rows in the CS621MaynoothBirds table where the
-- observation location (thegeom column) is WITHIN 500m of this location? 
select * from cs621maynoothbirds where ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.60155 53.38522)',4326),32629), 
				   ST_Transform(thegeom,32629)) < 500;


-- The College Chapel South Campus has longitude -6.5982 and latitude 53.3798. Write an SQL query to return all rows in the CS621MaynoothBirds table
-- where the observation location (thegeom column) is WITHIN 500m of this location? Use the select statement to show the distance (in meters), the bird and the obstime only. 
select obsnum, obstime, ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.5982  53.3798)',4326),32629), 
									ST_Transform(thegeom,32629)) as distance 
									from cs621maynoothbirds 
									where ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.5982  53.3798)',4326),32629), 
													  ST_Transform(thegeom,32629)) < 500;


-- Suppose you are given the WKT in EPSG:4326 as follows POINT(-6.59269 53.38109). Write an SQL
-- query to return the 10 closest observations from the CS621MaynoothBirds to this point location. Show
-- distances in ascending order of distance (meters) ! Display only the bird and distance.
select bird, st_distance(st_transform(st_geomfromtext('POINT(-6.59269 53.38109)', 4326),32629), 
						st_transform(thegeom,32629)) as distance from cs621maynoothbirds order by distance LIMIT 10 ;


-- Suppose you are given a point with the latitude and longitude as 53.388 and -6.6 respectively. Write an
-- SQL query to return all observations from the CS621MaynoothBirds which are at least 1KM away from this point. Return only observations where the
-- OBSCODE begins with an uppercase vowel!
select obscode, ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.6  53.388)',4326),32629), 
									ST_Transform(thegeom,32629)) as distance 
									from cs621maynoothbirds 
									where ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.6  53.388)',4326),32629), 
													  ST_Transform(thegeom,32629)) > 1000 and obscode ~ '^(A|E|U|I|O)'
			