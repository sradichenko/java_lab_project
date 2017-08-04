/* If you want to reset autoincrement counter in table:*/
ALTER TABLE table_name AUTO_INCREMENT = 1;

INSERT INTO airplane (name, capacity_econom, capacity_business)
VALUES
  ('TU-134',80,8),
  ('TU-154',152,24),
  ('Airbus A310',183,12),
  ('Airbus A320',149,12),
  ('Boeing-737-600',122,0),
  ('Boeing-737-700',145,12),
  ('Boeing-737-800',168,18),
  ('Boeing-737-900',192,36),
  ('Boeing-747-200',298,66);

INSERT INTO account(name, email, password_hash, registration_date)
VALUES
('Polina', 'polina@mail.ru', '827ccb0eea8a706c4c34a16891f84e7b', '2017-07-31 06:07:11'),
('TestUser', 'testuser@test.ru', '5d9c68c6c50ed3d02a2fcf54f63993b6', '2017-07-31 09:11:35');


INSERT INTO flight (airplane_id,flight_number,departure_airport_id,arrival_airport_id,
base_cost,available_places_econom,available_places_business,flight_datetime)
VALUES
(2,'RTY-56',2560 ,1138,6000.00,152,24,'2017-07-25 06:07:00'),
(2,'RRY-78',2560 ,1138,6500.00,152,24,'2017-07-26 09:30:00'),
(3,'YTR-26',2560 ,1138,5500.00,183,12,'2017-07-25 12:10:00'),
(3,'NMR-91',2560 ,1138,5800.00,183,12,'2017-07-27 18:07:00'),
(4,'VPO-13',2560 ,1138,6000.00,149,12,'2017-07-28 15:30:00');

INSERT INTO airport (code, city, airport_name, latitude, longitude)
VALUES  ('AAQ','Anapa','Anapa Vityazevo Airport','45.002101898193','37.347301483154'),('ABA','Abakan','Abakan Airport','53.7400016784668','91.38500213623047'),('ACS','Achinsk','Achinsk Airport','56.2682991027832','90.57080078125'),('ADH','Aldan','Aldan Airport','58.60279846191406','125.40899658203125'),('AER','Sochi','Sochi International Airport','43.449901580811','39.956600189209'),('AGF','Agen','Agen-La Garenne Airport','44.17470169067383','0.5905560255050659'),('AJA','Ajaccio','Ajaccio-Napoléon Bonaparte Airport','41.92359924316406','8.8029203414917'),('AMV','Amderma','Amderma Airport','69.76329803466797','61.556400299072266'),('ANE','Angers/Marcé','Angers-Loire Airport','47.560298919677734','-0.3122220039367676'),('ANG','Angouleme','Angoulême-Brie-Champniers Airport','45.72919845581055','0.22145600616931915'),('ARH','Arkhangelsk','Talagi Airport','64.60030364990234','40.71670150756836'),('ASF','Astrakhan','Astrakhan Airport','46.2832984924','48.0063018799'),('AUF','Auxerre','Auxerre-Branches Airport','47.85020065307617','3.497109889984131'),('AUR','Aurillac','Aurillac Airport','44.89139938354492','2.4219400882720947'),('AVN','Avignon','Avignon-Caumont Airport','43.90729904174805','4.901830196380615'),('BAX','Barnaul','Barnaul Airport','53.363800048828125','83.53849792480469'),('BES','Brest','Brest Bretagne Airport','48.447898864746094','-4.418540000915527'),('BIA','Bastia','Bastia-Poretta Airport','42.55270004272461','9.48373031616211'),('BIQ','Biarritz-bayonne','Biarritz-Anglet-Bayonne Airport','43.4683333','-1.5311111'),('BKA','Moscow','Bykovo Airport','55.6171989441','38.0600013733'),('BOD','Bordeaux','Bordeaux-Mérignac Airport','44.828300476100004','-0.715556025505'),('BOR','Belfort','Fontaine Airport','47.655601501465','7.0108299255371'),('BOU','Bourges','Bourges Airport','47.058101654052734','2.3702800273895264'),('BQS','Blagoveschensk','Ignatyevo Airport','50.42539978027344','127.41200256347656'),('BSL','Mulhouse','EuroAirport Basel-Mulhouse-Freiburg Airport','47.59','7.5291667'),('BTK','Bratsk','Bratsk Airport','56.370601654052734','101.697998046875'),('BVA','Beauvais','Paris Beauvais Tillé Airport','49.45439910888672','2.1127800941467285'),('BVE','Brive','Toul Rosières Air Base','48.780001','5.980003'),('BWO','Balakovo','Balakovo Airport','51.8582992554','47.7456016541'),('BZK','Bryansk','Bryansk Airport','53.214199066199996','34.176399231'),('BZR','Beziers','Béziers-Vias Airport','43.32350158691406','3.3538999557495117'),('CCF','Carcassonne','Carcassonne Airport','43.215999603271484','2.3063199520111084'),('CDG','Paris','Charles de Gaulle International Airport','49.0127983093','2.54999995232'),('CEE','Cherepovets','Cherepovets Airport','59.273601532','38.015800476100004'),('CEK','Chelyabinsk','Chelyabinsk Balandino Airport','55.305801','61.5033'),('CEQ','Cannes','Cannes-Mandelieu Airport','43.54199981689453','6.953479766845703'),('CER','Cherbourg','Cherbourg-Maupertus Airport','49.65010070800781','-1.4702800512313843'),('CET','Cholet','Cholet Le Pontreau Airport','47.08209991455078','-0.8770639896392822'),('CFE','Clermont-Ferrand','Clermont-Ferrand Auvergne Airport','45.7867012024','3.1691699028'),('CFR','Caen','Caen-Carpiquet Airport','49.173301696777344','-0.44999998807907104'),('CHR','Chateauroux','"Châteauroux-Déols \Marcel Dassault\"" Airport"""','46.86027778','1.7211111'),('CKH','Chokurdah','Chokurdakh Airport','70.62310028076172','147.90199279785156'),('CKL','Shchyolkovo','Chkalovskiy Airport','55.8782997131','38.0616989136'),('CLY','Calvi','Calvi-Sainte-Catherine Airport','42.5244444','8.7930556'),('CMF','Chambery','Chambéry-Savoie Airport','45.638099670410156','5.880229949951172'),('CMR','Colmar','Colmar-Houssen Airport','48.109901428222656','7.359010219573975'),('CNG','Cognac','Cognac-Châteaubernard (BA 709) Air Base','45.65829849243164','-0.3174999952316284'),('CNN','Neryungri','Chulman Airport','56.913898468018','124.91400146484'),('CQF','Calais','Calais-Dunkerque Airport','50.962100982666016','1.954759955406189'),('CSF','Creil','Creil Air Base','49.253501892089844','2.5191400051116943'),('CSH','Solovetsky Islands','Solovki Airport','65.0299987793','35.7333335876'),('CSY','Cheboksary','Cheboksary Airport','56.090301513671875','47.3473014831543'),('CTT','Le Castellet','Le Castellet Airport','43.252498626708984','5.785190105438232'),('CVF','Courcheval','Courchevel Airport','45.39670181274414','6.6347198486328125'),('CYX','Cherskiy','Cherskiy Airport','68.7406005859375','161.33799743652344'),('DCM','Castres','Castres-Mazamet Airport','43.55630111694336','2.289180040359497'),('DEE','Yuzhno-Kurilsk','Cooma Hospital Helipad','-36.242155','149.130147'),('DIJ','Dijon','Dijon-Bourgogne Airport','47.268901825','5.09000015259'),('DKS','Dikson','Dikson Airport','73.51780700683594','80.37966918945312'),('DLE','Dole','Dole-Tavaux Airport','47.042686','5.435061'),('DME','Moscow','Domodedovo International Airport','55.40879821777344','37.90629959106445'),('DNR','Dinard','Dinard-Pleurtuit-Saint-Malo Airport','48.58769989013672','-2.0799601078033447'),('DOL','Deauville','Deauville-Saint-Gatien Airport','49.3652992249','0.154305994511'),('DYR','Anadyr','Ugolny Airport','64.73490142822266','177.74099731445312'),('EBU','St-Etienne','Saint-Étienne-Bouthéon Airport','45.54059982299805','4.296390056610107'),('EDM','La Roche-sur-yon','La Roche-sur-Yon Airport','46.701900482177734','-1.3786300420761108'),('EGC','Bergerac','Bergerac-Roumanière Airport','44.82529830932617','0.5186110138893127'),('EGO','Belgorod','Belgorod International Airport','50.643798828125','36.5900993347168'),('EIE','Yeniseysk','Yeniseysk Airport','58.47420120239258','92.11250305175781'),('ENC','Nancy','Nancy-Essey Airport','48.692100524902344','6.230460166931152'),('EPL','Epinal','Épinal-Mirecourt Airport','48.32500076293945','6.069980144500732'),('ERG','Yerbogachen','Yerbogachen Airport','61.2750015259','108.029998779'),('ESL','Elista','Elista Airport','46.3739013671875','44.33089828491211'),('ETZ','Metz','Metz-Nancy-Lorraine Airport','48.9821014404','6.25131988525'),('EYK','Beloyarsky','Beloyarskiy Airport','63.686901092499994','66.698600769'),('FNI','Nimes','Nîmes-Arles-Camargue Airport','43.75740051269531','4.4163498878479'),('FRJ','Frejus','Fréjus Airport','43.4175','6.7357'),('FSC','Figari','Figari Sud-Corse Airport','41.5005989074707','9.097780227661133'),('GDX','Magadan','Sokol Airport','59.9109992980957','150.72000122070312'),('GDZ','Gelendzhik','Gelendzhik Airport','44.5820926295','38.0124807358'),('GFR','Granville','Granville Airport','48.88309860229492','-1.564170002937317'),('GNB','Grenoble','Grenoble-Isère Airport','45.36289978027344','5.329370021820068'),('GOJ','Nizhniy Novgorod','Nizhny Novgorod Strigino International Airport','56.230098724365','43.784000396729'),('GRV','Grozny','Khankala Air Base','43.298099517822266','45.78409957885742'),('GVN','Sovetskaya Gavan','Maygatka Airport.','48.926998138399995','140.033996582'),('HMA','Khanty-Mansiysk','Khanty Mansiysk Airport','61.028499603271484','69.08609771728516'),('HTA','Chita','Chita-Kadala Airport','52.026299','113.306'),('HTG','Khatanga','Khatanga Airport','71.97810363769531','102.49099731445312'),('IAA','Igarka','Igarka Airport','67.43720245361328','86.62190246582031'),('IAR','Yaroslavl','Tunoshna Airport','57.560699462890625','40.15739822387695'),('IDY','Île d\'Yeu','Île d\'Yeu Airport','46.71860122680664','-2.3911099433898926'),('IGT','Magas','Magas Airport','43.322299957300004','45.0125999451'),('IJK','Izhevsk','Izhevsk Airport','56.82809829711914','53.45750045776367'),('IKS','Tiksi','Tiksi Airport','71.697700500488','128.90299987793'),('IKT','Irkutsk','Irkutsk Airport','52.268001556396','104.38899993896'),('INA','Inta','Inta Airport','66.0548324584961','60.110321044921875'),('IWA','Ivanovo','Ivanovo South Airport','56.93939971923828','40.940799713134766'),('JOK','Yoshkar-Ola','Yoshkar-Ola Airport','56.700599670410156','47.904701232910156'),('KEJ','Kemorovo','Kemerovo Airport','55.27009963989258','86.1072006225586'),('KGD','Kaliningrad','Khrabrovo Airport','54.88999938964844','20.592599868774414'),('KGP','Kogalym','Kogalym International Airport','62.190399169921875','74.53379821777344'),('KHV','Khabarovsk','Khabarovsk-Novy Airport','48.52799987793','135.18800354004'),('KJA','Krasnoyarsk','Yemelyanovo Airport','56.172901153564','92.493301391602'),('KLD','Tver','Migalovo Air Base','56.82469940185547','35.7577018737793'),('KLF','Kaluga','Grabtsevo Airport','54.5499992371','36.3666687012'),('KMW','Kostroma','Kostroma Sokerkino Airport','57.7969017029','41.019401550299996'),('KRO','Kurgan','Kurgan Airport','55.47529983520508','65.41560363769531'),('KRR','Krasnodar','Krasnodar Pashkovsky International Airport','45.034698486328','39.170501708984'),('KSZ','Kotlas','Kotlas Airport','61.235801696777344','46.6974983215332'),('KUF','Samara','Kurumoch International Airport','53.504901885986','50.16429901123'),('KVK','Apatity','Kirovsk-Apatity Airport','67.46330261230469','33.58829879760742'),('KVM','Markovo','Markovo Airport','64.66699981689453','170.41700744628906'),('KVX','Kirov','Pobedilovo Airport','58.503299713135','49.348300933838'),('KXK','Komsomolsk-on-Amur','Komsomolsk-on-Amur Airport','50.409000396728516','136.9340057373047'),('KYZ','Kyzyl','Kyzyl Airport','51.66939926147461','94.40059661865234'),('KZN','Kazan','Kazan International Airport','55.606201171875','49.278701782227'),('LAI','Lannion','Lannion-Côte de Granit Airport','48.754398345947266','-3.4716598987579346'),('LBG','Paris','Paris-Le Bourget Airport','48.969398498535156','2.441390037536621'),('LBI','Albi','Albi-Le Séquestre Airport','43.91389846801758','2.1130599975585938'),('LDE','Tarbes','Tarbes-Lourdes-Pyrénées Airport','43.1786994934082','-0.006438999902456999'),('LDG','Arkhangelsk','Leshukonskoye Airport','64.8960037231','45.7229995728'),('LED','St. Petersburg','Pulkovo Airport','59.80030059814453','30.262500762939453'),('LEH','Le Havre','Le Havre Octeville Airport','49.53390121459961','0.08805599808692932'),('LIG','Limoges','Limoges Airport','45.86280059814453','1.1794400215148926'),('LIL','Lille','Lille-Lesquin Airport','50.563332','3.086886'),('LME','Le Mans','Le Mans-Arnage Airport','47.94860076904297','0.20166699588298798'),('LPK','Lipetsk','Lipetsk Airport','52.70280075073242','39.53779983520508'),('LPY','Le Puy','Le Puy-Loudes Airport','45.0806999206543','3.762890100479126'),('LRH','La Rochelle','La Rochelle-Île de Ré Airport','46.17919921875','-1.1952799558639526'),('LRT','Lorient','Lorient South Brittany (Bretagne Sud) Airport','47.76060104370117','-3.440000057220459'),('LTQ','Le Tourquet','Le Touquet-Côte d\'Opale Airport','50.517398834228516','1.6205899715423584'),('LTT','La Môle','La Môle Airport','43.20539855957031','6.48199987411499'),('LVA','Laval','Laval-Entrammes Airport','48.03139877319336','-0.7429860234260559'),('LYN','Lyon','Lyon-Bron Airport','45.72719955444336','4.944270133972168'),('LYS','Lyon','Lyon Saint-Exupéry Airport','45.7255556','5.0811111'),('MCU','Montlucon-gueret','Montluçon-Guéret Airport','46.222599029541016','2.363960027694702'),('MCX','Makhachkala','Uytash Airport','42.81679916381836','47.65230178833008'),('MEN','Mende','Mende-Brenoux Airport','44.50210189819336','3.532819986343384'),('MFX','Ajaccio','Méribel Altiport','45.407003','6.577942'),('MJZ','Mirnyj','Mirny Airport','62.534698486328125','114.03900146484375'),('MMK','Murmansk','Murmansk Airport','68.78170013427734','32.75080108642578'),('MPL','Montpellier','Montpellier-Méditerranée Airport','43.57619857788086','3.96301007270813'),('MQF','Magnetiogorsk','Magnitogorsk International Airport','53.39310073852539','58.755699157714844'),('MRS','Marseille','Marseille Provence Airport','43.439271922','5.22142410278'),('MRV','Mineralnye Vody','Mineralnyye Vody Airport','44.225101470947266','43.08190155029297'),('MVV','Verdun','Megève Airport','45.82080078125','6.652219772338867'),('MXN','Morlaix','Morlaix-Ploujean Airport','48.6031990051','-3.81577992439'),('MZM','Metz','Metz-Frescaty (BA 128) Air Base','49.07170104980469','6.131669998168945'),('NAL','Nalchik','Nalchik Airport','43.512901306152344','43.636600494384766'),('NBB','Berezovo','Berezovo Airport','63.92100143432617','65.03050231933594'),('NBC','Nizhnekamsk','Begishevo Airport','55.564701080322266','52.092498779296875'),('NCE','Nice','Nice-Côte d\'Azur Airport','43.6584014893','7.215869903560001'),('NCY','Annecy','Annecy-Haute-Savoie-Mont Blanc Airport','45.9308333','6.1063889'),('NFG','Nefteyugansk','Nefteyugansk Airport','61.108299255371094','72.6500015258789'),('NIT','Niort','Niort-Souché Airport','46.313477','-0.394529'),('NJC','Nizhnevartovsk','Nizhnevartovsk Airport','60.94929885864258','76.48359680175781'),('NLI','Nikolayevsk-na-Amure Airport','Nikolayevsk-na-Amure Airport','53.154998779297','140.64999389648'),('NNM','Naryan-Mar','Naryan Mar Airport','67.63999938964844','53.12189865112305'),('NOJ','Noyabrsk','Noyabrsk Airport','63.18330001831055','75.2699966430664'),('NOZ','Novokuznetsk','Spichenkovo Airport','53.8114013671875','86.877197265625'),('NSK','Norilsk','Norilsk-Alykel Airport','69.31109619140625','87.33219909667969'),('NTE','Nantes','Nantes Atlantique Airport','47.153198242200006','-1.61073005199'),('NUX','Novy Urengoy','Novy Urengoy Airport','66.06939697265625','76.52030181884766'),('NVS','Nevers','Nevers-Fourchambault Airport','47.002601623535156','3.1133298873901367'),('NYA','Nyagan','Nyagan Airport','62.11000061035156','65.61499786376953'),('NYM','Nadym','Nadym Airport','65.48090362548828','72.69889831542969'),('OBS','Aubenas-vals-lanas','Aubenas-Ardèche Méridional Airport','44.5442008972','4.37218999863'),('ODO','Bodaibo','Bodaybo Airport','57.866100311299995','114.242996216'),('OGZ','Beslan','Beslan Airport','43.2051010132','44.6066017151'),('OHO','Okhotsk','Okhotsk Airport','59.410064697265625','143.05650329589844'),('OMS','Omsk','Omsk Central Airport','54.96699905395508','73.31050109863281'),('ORE','Orleans','Orléans-Bricy (BA 123) Air Base','47.9878005981','1.7605600357100002'),('ORY','Paris','Paris-Orly Airport','48.7233333','2.3794444'),('OSW','Orsk','Orsk Airport','51.0724983215332','58.59560012817383'),('OVB','Novosibirsk','Tolmachevo Airport','55.012599945068','82.650703430176'),('OVS','Sovetskiy','Sovetskiy Airport','61.326622009277344','63.60191345214844'),('PEE','Perm','Bolshoye Savino Airport','57.914501190186','56.021198272705'),('PES','Petrozavodsk','Petrozavodsk Airport','61.88520050048828','34.154701232910156'),('PEX','Pechora','Pechora Airport','65.12110137939453','57.13079833984375'),('PEZ','Penza','Penza Airport','53.110599517822266','45.02109909057617'),('PGF','Perpignan','Perpignan-Rivesaltes (Llabanère) Airport','42.74039840698242','2.8706700801849365'),('PGX','Perigueux','Périgueux-Bassillac Airport','45.19810104370117','0.815555989742279'),('PIS','Poitiers','Poitiers-Biard Airport','46.58769989013672','0.30666598677635193'),('PKC','Petropavlovsk','Yelizovo Airport','53.16790008544922','158.45399475097656'),('PKV','Pskov','Pskov Airport','57.78390121459961','28.395599365234375'),('POX','Pontoise','Pontoise - Cormeilles-en-Vexin Airport','49.0966667','2.0408333'),('PUF','Pau','Pau Pyrénées Airport','43.380001068115234','-0.41861099004745483'),('PVS','Provideniya Bay','Provideniya Bay Airport','64.37809753417969','-173.2429962158203'),('PWE','Pevek','Pevek Airport','69.783302307129','170.59700012207'),('PYJ','Yakutia','Polyarny Airport','66.4003982544','112.029998779'),('QNJ','Annemasse','Annemasse Airport','46.1920013428','6.268390178680001'),('QNX','Macon','Mâcon-Charnay Airport','46.295101','4.79577'),('QXB','Aix-les-milles','Aix-en-Provence (BA 114) Airport','43.5056','5.36778'),('QYR','Troyes','Troyes-Barberey Airport','48.32210159301758','4.01669979095459'),('RAT','Raduzhnyi','Raduzhny Airport','62.1585998535','77.32890319820001'),('RCO','Rochefort','Rochefort-Saint-Agnant (BA 721) Airport','45.88779830932617','-0.9830560088157654'),('RDZ','Rodez','Rodez-Marcillac Airport','44.407901763916016','2.4826700687408447'),('REN','Orenburg','Orenburg Central Airport','51.795799255371094','55.45669937133789'),('RGK','Gorno-Altaysk','Gorno-Altaysk Airport','51.9667015076','85.8332977295'),('RHE','Reims','Reims-Champagne (BA 112) Air Base','49.310001','4.05'),('RNE','Roanne','Roanne-Renaison Airport','46.05830001831055','4.001389980316162'),('RNS','Rennes','Rennes-Saint-Jacques Airport','48.069499969499994','-1.73478996754'),('ROV','Rostov','Rostov-on-Don Airport','47.2582015991','39.8180999756'),('RTW','Saratov','Saratov Central Airport','51.564998626708984','46.04669952392578'),('RYB','Rybinsk','Staroselye Airport','58.10419845581055','38.92940139770508'),('RYN','Royan','Royan-Médis Airport','45.62810134887695','-0.9725000262260437'),('SBH','Gustavia','Gustaf III Airport','17.904399871826172','-62.84360122680664'),('SBK','St.-brieuc Armor','Saint-Brieuc-Armor Airport','48.5378','-2.85444'),('SCW','Syktyvkar','Syktyvkar Airport','61.64699935913086','50.84510040283203'),('SEK','Srednekolymsk','Srednekolymsk Airport','67.4805','153.7364'),('SGC','Surgut','Surgut Airport','61.34370040893555','73.40180206298828'),('SKX','Saransk','Saransk Airport','54.12512969970703','45.212257385253906'),('SLY','Salekhard','Salekhard Airport','66.5907974243164','66.61100006103516'),('SNR','St.-nazaire','Saint-Nazaire-Montoir Airport','47.3105556','-2.1566667'),('SOZ','Solenzara','Solenzara (BA 126) Air Base','41.924400329589844','9.406000137329102'),('STW','Stavropol','Stavropol Shpakovskoye Airport','45.10919952392578','42.11280059814453'),('SUY','Suntar','Suntar Airport','62.185001373291','117.63500213623'),('SVO','Moscow','Sheremetyevo International Airport','55.972599','37.4146'),('SVX','Yekaterinburg','Koltsovo Airport','56.743099212646','60.802700042725'),('SWT','Strezhevoy','Strezhevoy Airport','60.709400177','77.66000366210001'),('SXB','Strasbourg','Strasbourg Airport','48.538299560546875','7.628230094909668'),('TBW','Tambow','Donskoye Airport','52.806098937988','41.482799530029'),('TJM','Tyumen','Roshchino International Airport','57.189601898199996','65.3243026733'),('TLN','Hyeres','Toulon-Hyères Airport','43.0973014832','6.14602994919'),('TLS','Toulouse','Toulouse-Blagnac Airport','43.629101','1.36382'),('TNF','Toussous-le-noble','Toussus-le-Noble Airport','48.75189971923828','2.1061899662017822'),('TOF','Tomsk','Bogashevo Airport','56.380298614502','85.208297729492'),('TQL','Tarko-Sale','Tarko-Sale Airport','64.9308013916','77.81809997559999'),('TUF','Tours','Tours-Val-de-Loire Airport','47.4322013855','0.727605998516'),('UCT','Ukhta','Ukhta Airport','63.566898345947266','53.8046989440918'),('UFA','Ufa','Ufa International Airport','54.557498931885','55.874401092529'),('UIK','Ust Ilimsk','Ust-Ilimsk Airport','58.13610076904297','102.56500244140625'),('UIP','Quimper','Quimper-Cornouaille Airport','47.974998474121094','-4.167789936065674'),('UKX','Ust-Kut','Ust-Kut Airport','56.8567008972168','105.7300033569336'),('ULK','Lensk','Lensk Airport','60.7206001282','114.825996399'),('ULV','Ulyanovsk','Ulyanovsk Baratayevka Airport','54.26829910279999','48.226699829100006'),('ULY','Ulyanovsk','Ulyanovsk East Airport','54.4010009765625','48.80270004272461'),('UMS','Ust-Maya','Ust-Maya Airport','60.356998443604','134.43499755859'),('URJ','Uraj','Uray Airport','60.10329818725586','64.82669830322266'),('URO','Rouen','Rouen Airport','49.38420104980469','1.1748000383377075'),('URS','Kursk','Kursk East Airport','51.7505989074707','36.29560089111328'),('USK','Usinsk','Usinsk Airport','66.00469970703125','57.3671989440918'),('UUA','Bugulma','Bugulma Airport','54.63999938964844','52.801700592041016'),('UUD','Ulan-ude','Ulan-Ude Airport (Mukhino)','51.80780029296875','107.43800354003906'),('UUS','Yuzhno-sakhalinsk','Yuzhno-Sakhalinsk Airport','46.88869857788086','142.71800231933594'),('VAF','Valence','Valence-Chabeuil Airport','44.9216','4.9699'),('VGD','Vologda','Vologda Airport','59.282501220703125','39.944400787353516'),('VHY','Vichy','Vichy-Charmeil Airport','46.169700622558594','3.4037399291992188'),('VKO','Moscow','Vnukovo International Airport','55.5914993286','37.2615013123'),('VKT','Vorkuta','Vorkuta Airport','67.48860168457031','63.993099212646484'),('VLK','','Volgodonsk Airport','47.682098388671875','42.07279968261719'),('VLU','Velikiye Luki','Velikiye Luki Airport','56.381099700927734','30.60810089111328'),('VNE','Vannes','Vannes-Meucon Airport','47.72330093383789','-2.718559980392456'),('VOG','Volgograd','Volgograd International Airport','48.782501220703125','44.34550094604492'),('VOZ','Voronezh','Voronezh International Airport','51.81420135498047','39.22959899902344'),('VVO','Vladivostok','Vladivostok International Airport','43.39899826049805','132.1479949951172'),('VYI','Vilyuisk','Vilyuisk Airport','63.75666809082','121.69333648682'),('XAC','Arcachon','Arcachon-La Teste-de-Buch Airport','44.596401','-1.11083'),('XBK','Bourg','Bourg-Ceyzériat Airport','46.20090103149414','5.292029857635498'),('XCD','Chalon','Chalon-Champforgeuil Airport','46.82609939575195','4.817629814147949'),('XCR','Chalons','Châlons-Vatry Air Base','48.776100158691406','4.184490203857422'),('XMU','Moulins','Moulins-Montbeugny Airport','46.53459930419922','3.423719882965088'),('XVF','Vilefrance','Villefranche-Tarare Airport','45.919983','4.634931'),('YKS','Yakutsk','Yakutsk Airport','62.093299865722656','129.77099609375'),('ZIX','Zhigansk','Zhigansk Airport','66.7965011597','123.361000061'),('ZKP','Zyryanka','Zyryanka Airport','65.7485','150.8889');