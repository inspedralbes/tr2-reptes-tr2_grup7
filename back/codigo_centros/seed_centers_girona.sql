
WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000019@xtec.cat', '$2b$10$GuS7pF3EcrHuR8/7/zbAL.utMatl2llMzdwcVBsYBTfsIjmzo1R7e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Lluís Marià Vidal', '17000019', 'c. del Nord, 1-2, 17707 Agullana', '972535580' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000032@xtec.cat', '$2b$10$gjbAwz2AJ82B/CJkrHocoOq5S/rOzSBfpGhtCy9.Kfbm1McKiL.8m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vilademany', '17000032', 'c. Despoblat, s/n, 17181 Aiguaviva', '972232489' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000056@xtec.cat', '$2b$10$MD66Hbz5s/UiVpROP.rX8.hCgj/37qiGEHMR0PjUJkHpTX2iB440K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola la Branca - ZER Montgrí', '17000056', 'c. Tor, 1, 17136 Albons', '972788434' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000068@xtec.cat', '$2b$10$jbw5l0gBZFNVLERU.palae3tNNGiwWjPO9AZrzmnllMTCO/mzQYFq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola del Far d''Empordà', '17000068', 'c. Fortia, s/n, 17469 El Far d''Empordà', '972670088' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000071@xtec.cat', '$2b$10$z.lFfwollzN9KiIfeZUZXOTN4ARJsDHckD9w/1uHTlQs.XyYYPEri', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bac de Cerdanya', '17000071', 'c. Mancomunitat, 10, 17538 Alp', '972144299' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000093@xtec.cat', '$2b$10$eMDzYWeM2mH8LjP67FPa3OGxgwIxawxp3Cf/VENgSyXwT4xapygRG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Gaspar de Queralt', '17000093', 'c. Folch i Torras, s/n, 17170 Amer', '972430795' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000123@xtec.cat', '$2b$10$ZIVBhtsEhPAyDOyfPGgWu.bBxVde2rfhwWGkbUbG5OKzx1eVyxxCK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi', '17000123', 'pl. J. Massana, 1, 17164 Sant Julià del Llor i Bonmatí', '972421070' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000135@xtec.cat', '$2b$10$m4czAC9S5Je8o.GlHa.AN.cgtQjLuVNzBR5TcOki3WnUAv0gOkKdO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pompeu Fabra', '17000135', 'c. Floricel, 1, 17160 Anglès', '972423362' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000147@xtec.cat', '$2b$10$zYLbrnBm68PwGu7F0Hmh/ukHP6g/iGUmhp.7dYMLn3rWuZi3CZFcO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'FEDAC - Anglès', '17000147', 'c. Raval, 19, 17160 Anglès', '972420259' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000160@xtec.cat', '$2b$10$vIfccOIKMu8QQCSXyHZLGec9ty5gelG/HP.9vmySbZ1iOiWwH3sQC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Carulla', '17000160', 'av. dels Països Catalans, s/n, 17401 Arbúcies', '972860368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000184@xtec.cat', '$2b$10$UbSg6fwZn4y3fRknXcaF/OB4rvhZ/Fhgb.uvtPVF3livjG70LaPci', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Arbúcies', '17000184', 'c. de Magnes, 3, 17401 Arbúcies', '972860051' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000241@xtec.cat', '$2b$10$f.ZSA/07kDio9tLSo9k6xOJRiro2ThJIdSNRDOypJ.PGMvpajEt0a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Fluvianets', '17000241', 'pg. de les Escoles, 1, 17472 L''Armentera', '972520502' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000251@xtec.cat', '$2b$10$AN4uNTEUGL4OAipZfXzkZe/8ymbpQjQMYl9uaOiJwrFhzlpmRUL8.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Gonçal Comellas', '17000251', 'c. Escoles, 3, 17742 Avinyonet de Puigventós', '972546301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000263@xtec.cat', '$2b$10$s/3larYHYcVU5E/77aapa.geN/t1/PnAMN.lnlFoG35gDy6Yd7EBa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Arruga', '17000263', 'c. del Pavelló, 1, 17255 Begur', '972624114' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000299@xtec.cat', '$2b$10$WNEoucvcwIFahHNFxd08FOYNlRu7Sv0aiub5rUBk6kUrh6bE4aknO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Casa Nostra', '17000299', 'c. Barca, 13, 17820 Banyoles', '972570966' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000305@xtec.cat', '$2b$10$h7LQH2BZR9hM56ssDcwdneD19QTwropptrVTcjZE4fnS2D9vaC5IW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Pere Alsius i Torrent', '17000305', 'c. Sardana, 17, 17820 Banyoles', '972570991' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000329@xtec.cat', '$2b$10$Ap1oKxzrjlbWngY8BMeOsuIs7oQ9cSpCT8aDbTdedajI6gExZPWb6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pla de l''Ametller', '17000329', 'c. Formiga, 117, 17820 Banyoles', '972571528' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000330@xtec.cat', '$2b$10$3QhoVmxV5Kory9Su7w7WuOfRCKS6Rwi/c.Y3VrTteTW9y6PEUokbG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Josep Brugulat', '17000330', 'ctra. de Figueroles, 19, 17820 Banyoles', '972571431' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000342@xtec.cat', '$2b$10$CXq86z86U0IkeF3HbsJB6er0q/QFwfwnX9SYoLAYcIkr2gknz0zZG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de la Vila Baldiri Reixac', '17000342', 'c. Llibertat, 80, 17820 Banyoles', '972570660' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000354@xtec.cat', '$2b$10$GYgh3KAB/8ykioC9rc1vye/ltjXWfPiofOOw25EbMwb/WNTASNW5K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Reglà', '17000354', 'c. Alt Empordà, 26, 17483 Bàscara', '634761685' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000381@xtec.cat', '$2b$10$Ya4UQzdyCMTCkTGucpkidOzW6qNIZ9RPaeaK/XfCOpXpNrfmHP6.S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Rajaret - ZER Montgrí', '17000381', 'c. Ponç-Hug, 12, 17141 Bellcaire d''Empordà', '972788035' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000408@xtec.cat', '$2b$10$OIWxmbByRJw2BAFzopHAHeRizyU.QVmTSoP0lS/Fw1UwNK0ecv6WC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Sobrequés', '17000408', 'pl. de les Nacions, 8, 17162 Bescanó', '972440228' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000411@xtec.cat', '$2b$10$rYXQjR4OGi2wQu/aVl8qj./YgBWiJYqIKnGynw8RNqMgUnjLdYKeW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan de Margarit', '17000411', 'c. Morró, 37, 17100 La Bisbal d''Empordà', '972640236' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000421@xtec.cat', '$2b$10$e/y15EzwiDYqPWvbhUv9FONTP2pLk3PwWvHEKtVzNwFGwgV40PNKi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cor de Maria', '17000421', 'c. de Coll i Vehí, 2, 17100 La Bisbal d''Empordà', '972640162' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000469@xtec.cat', '$2b$10$cuGs.xlizr5d7o.wH1xtmu3Zs7jyiD/D6n89ZDTm.ky4jg7kgOQqS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joaquim Ruyra', '17000469', 'c. Méndez Nuñez, 49, 17300 Blanes', '972350425' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000470@xtec.cat', '$2b$10$zvUD/R0G78RxbJul9.891.aVR1YvYL4GQffdDvi5aYq6tXYTZxnfm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carles Faust', '17000470', 'ptge. Vila de Lloret, 5, 17300 Blanes', '972336766' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000482@xtec.cat', '$2b$10$BSkf4StUN5lRagbwQpxF7e0.OuRU5uJClaSnXbMH1pIYVUJPVCA/q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cor de Maria', '17000482', 'c. Santa Bàrbara, s/n, 17300 Blanes', '972333087' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000512@xtec.cat', '$2b$10$DyK/v4qIFT007fdqc483QOR5ud6W8sUg5RS5drDwnTaCtVCsJ8B5K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Santa Maria', '17000512', 'c. Santa Bàrbara, 1, 17300 Blanes', '972330091' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000551@xtec.cat', '$2b$10$U0RhSrkNpVcjLJuz0aWV4OE3/VIaMmbGlIhWmN.OLPYSZNvEvYrya', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Sa Palomera', '17000551', 'c. Vilar Petit, s/n, 17300 Blanes', '972350909' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000561@xtec.cat', '$2b$10$RjPsMISxHK3J1.qRd35nX.I4X8/5k9ZRJF8sSswG0pncLe20Syy3u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Bordils', '17000561', 'c. Almeda, 52, 17462 Bordils', '972490115' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000573@xtec.cat', '$2b$10$nrjigkvMy9hTyTY8VaKVyuURSdedEW3fROfqC5nDXjYGjfR0G26FG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Andreu de Borrassà', '17000573', 'c. Escola, 2-4, 17770 Borrassà', '972525395' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000603@xtec.cat', '$2b$10$jNd3MHYx7THLx8iUcuD3DeTnt/OA42MzJRqfwX82mPcNPUXK/VEMm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Cecília - ZER Les Salines', '17000603', 'c. Nou, 1, 17723 Boadella i les Escaules', '972569127' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000676@xtec.cat', '$2b$10$X09XUL/3ZPPzvVmG8Bb8POdMQZ2KVukFiEqQ75vgoyN2yFUEIHM3C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Esteve', '17000676', 'c. Vall-llobera, 62, 17455 Caldes de Malavella', '972472344' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000688@xtec.cat', '$2b$10$BgsmCVuldvanXfzITedwCOA5bDoPLSIbuLQB6h5SzIAqEOefoXLlq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pere Rosselló', '17000688', 'p. de les escoles, 1, 17251 Calonge i Sant Antoni', '972660285' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000706@xtec.cat', '$2b$10$PWaORErkRHUrvN2lNq43bOhwZDAf9YFp1nMuDjDr.jc0SZ3IWNTKS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Puig Cargol', '17000706', 'Pla de Calonge, s/n, 17251 Calonge i Sant Antoni', '972652598' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000718@xtec.cat', '$2b$10$nCgd54maP6Vaw3/IqfCPUOFk93B0LGmDGd9iEy3sUfHXVnnQxwe/m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Llevantí de Mar', '17000718', 'c. Mestra Numància,3, 17251 Calonge i Sant Antoni', '972660414' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000731@xtec.cat', '$2b$10$F9wd3ZkiNoXLLGJbcGqsTOv97FJlia1qiGF/U9iG071DAaHUNkWzi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pirineu', '17000731', 'c. Puigmal, 10, 17530 Campdevànol', '972730196' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000779@xtec.cat', '$2b$10$jrkjw/pLPMXqPV.kXtn3Ve0A9gYUOGHM8QEW/qy0XsifYfPSEkAIq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Robert', '17000779', 'pl. Sta. Maria, 8, 17867 Camprodon', '972740260' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000822@xtec.cat', '$2b$10$mnsCgiDO4/ARwgufES1M/uUUJrvkis7f/BHbacgFf0OgVAA6AHWmS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Dòlmens - ZER Requesens', '17000822', 'c. Vilarnadal, s/n, 17750 Capmany', '972549137' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000846@xtec.cat', '$2b$10$Q23JlRH4xAVnHL0aRFYup.wkbAlakXTmY4Jq.gkd7Aal9ZKastmey', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puig d''Arques', '17000846', 'rbla. Onze de setembre, 59, 17244 Cassà de la Selva', '972463733' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000858@xtec.cat', '$2b$10$dY5KW3OB6kAz7cfPQ0PDneSf1mSkVnX/Qj3QfMsgZT.fOnMVdX9vW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle de Cassà', '17000858', 'c. Germà Agustí, 25, 17244 Cassà de la Selva', '972460261' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000861@xtec.cat', '$2b$10$mzQktwh4SRoF2UoTZSD9I.wWabs48lqAVPkxMak8QPKef2z9rAW6u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Castellroc', '17000861', 'ctra. Vella d''Olot, 4, 17856 Castellfollit de la Roca', '972294128' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000871@xtec.cat', '$2b$10$69JSozdQqROyY/DvaSaWGu6EybugY4RQ6GaQTREfc7yd2RVcMFG8W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ruiz Amado', '17000871', 'c. Pau Casals, 11-13, 17486 Castelló d''Empúries', '972250234' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000883@xtec.cat', '$2b$10$hNGMe7HB4ALUwF1L8QWE5OOdGDNHLpia8DVnFDBEx/.EWS5czWg9u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vall d''Aro', '17000883', 'c. Rosa Sensat, s/n, 17249 Castell d''Aro, Platja d''Aro i s''Agaró', '972817112' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000895@xtec.cat', '$2b$10$yf1a0Wg3lLc0MDJcf.eBLuyKigDkIXtloP5wu9zq263u3ouUXw13S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Estanys', '17000895', 'prtge. Els Estanys, s/n, 17250 Castell d''Aro, Platja d''Aro i s''Agaró', '972817407' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000913@xtec.cat', '$2b$10$s9.rCkubPxHGXXaYWNe.Ee3Jietq6OrzWRvXwlT4F09.KhurFR2tC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Aulet', '17000913', 'ctra. de Juià, 106, 17460 Celrà', '972492305' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000925@xtec.cat', '$2b$10$VoSgBzRrSOmnIARyVADhMuzNZvN2F1NvELSbu4rI/ckrgQLCNFpb2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Aixart', '17000925', 'c. Torroella, 47-49, 17464 Cervià de Ter', '972496161' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000937@xtec.cat', '$2b$10$7G1krbgCrK9JwJmptqIfJejc30WVQp4QlCrdl5pUOaWO7pznA1hzC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Josep Maria Albert - ZER Empordà', '17000937', 'c. Figueres, s/n, 17741 Cistella', '972546585' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000950@xtec.cat', '$2b$10$jG1hFQOYSgRiQLESXfOSPeb2l29AIL4TVtqQSjoadOCiTeJ2S2uMS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puig d''Esquers - ZER Cap de Creus', '17000950', 'c. del Mar, 77, 17469 Colera', '972389010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000986@xtec.cat', '$2b$10$knRBZlHJVe4fQrZQOUfrnu//A4f42anrBjqAz2JCQjg/6fUvxvCSm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Vall del Terri', '17000986', 'av. de Girona, s/n, 17844 Cornellà del Terri', '972594120' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7000998@xtec.cat', '$2b$10$mUf1xwBOVrewRVqgaSSdOuUDnB.kckR6Wc/plAJRJYMhDc1tuUYB2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Rodonell', '17000998', 'c. Major, 10, 17121 Corçà', '972630079' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001024@xtec.cat', '$2b$10$ow0IfjiUYAie2SOtVFQ6Je.evYnROeeVDtDtRpg2XLXfgvbrxVyNK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Gavarres - ZER Empordanet-Gavarres', '17001024', 'c. Raval, 8, 17116 Cruïlles, Monells i Sant Sadurní de l''He', '972640569' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001036@xtec.cat', '$2b$10$gnbsSKqCJA0liT6G4Q6mEORMqgPbMFR8ggcpi2zEey4uL3YXA/LLi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mont-roig - ZER Requesens', '17001036', 'c. Arnera, 2, 17722 Darnius', '972535494' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001048@xtec.cat', '$2b$10$eZyQbdyCzQ9mOE3wIsrSROQuf8Y6QTFozgjaDYgh8l.b14pSGzw.W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Empúries', '17001048', 'c. Garrotxa, s/n, 17130 L''Escala', '972104015' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001085@xtec.cat', '$2b$10$e1YqVdrok8kZ/4EPVMHtkOwM9sY01IRMpUfq6ULzZObr.z8SqWs7q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antoni Balmanya - ZER Requesens', '17001085', 'c. Figueres, 18, 17753 Espolla', '972563463' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001097@xtec.cat', '$2b$10$C80fH4Mi1Yfn7iaOirZJA.FuApC5amTGh/QDzUxC1ecAxpa4yR1qq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carles de Fortuny', '17001097', 'c. Carles de Fortuny, s/n, 17832 Esponellà', '972597135' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001103@xtec.cat', '$2b$10$4jmOaKJ/PAmI4w4cMtMB/.h2bwFE/cCeLE1JBdN2U3jp3eTbm2LrG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Salvador Dalí', '17001103', 'c. Compositor Serra, 9, 17600 Figueres', '972501191' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001164@xtec.cat', '$2b$10$2NjROcKoE1hpsdyw9eqxreMz4CkiOm7cE2sQ9AweuM2I6n0UMBzZu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cor de Maria', '17001164', 'c. Jonquera, 48, 17600 Figueres', '972501251' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001191@xtec.cat', '$2b$10$5nuFKhkhm7fVumrQ1ia98u2ZUFrjQ7u2GyqIxh7FpVITW89OJ6X0C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '17001191', 'c. Fossos del Dr. Burgàs, 17, 17600 Figueres', '972500812' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001206@xtec.cat', '$2b$10$lbBrEay03fQ/mhJslTyfHO9t3xBOb2BrY9Its4gd8RJjhLHn.TqJ2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escolàpies Figueres', '17001206', 'c. Perelada, 55, 17600 Figueres', '972500731' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001218@xtec.cat', '$2b$10$IzaBE6kWSZsl86c1nc0h0uWuT/DsXKTxGos4bzoBnMyynn1Uf1swy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ramon Muntaner', '17001218', 'c. Sant Pau, s/n, 17600 Figueres', '972672559' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001221@xtec.cat', '$2b$10$wkiU6mhBSX4NAyjCB9nza.rCJFRj2he91Vb8XVDFa1bkD0LfM69Ri', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Narcís Monturiol', '17001221', 'c. Compositor Joaquim Serra, 30, 17600 Figueres', '972671604' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001231@xtec.cat', '$2b$10$uJjTCeKOsfpdOg2JhZaMwOOMcr4.tGUtu3RQqT2Vl/iAryHNy37B6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària i Alimentària de l''Empordà', '17001231', 'Finca Camps i Armet, 17116 Cruïlles, Monells i Sant Sadurní de l''He', '972630123' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001279@xtec.cat', '$2b$10$T4eKA/vyDIjN7K09bQSAhe5h6Q/SjlYF3rHx6z.O0ccmrGlDZDnCu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Pau', '17001279', 'c. Muntaner, 4, 17600 Figueres', '972500487' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001280@xtec.cat', '$2b$10$3BInEYQXQ9k/xh/EXKzYpedRbs7jGU8pVlUWMxCqUiRXYyvSylLOe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joaquim Cusí i Furtunet', '17001280', 'c. Met Miravitlles, 1, 17600 Figueres', '972505036' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001292@xtec.cat', '$2b$10$WoSOLnWkVFqqBD0DoDiene4BEZFovjpdDmGTNcpSVs8LKSPQ0ypzK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Moreres', '17001292', 'Cami Ral,1, 17463 Flaçà', '972488016' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001346@xtec.cat', '$2b$10$Ua2Z9GlxQTsgHRlmwlY7guxaj4vxsY6CDyIG5I/CpRQGip4dFmTh6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Forn d''Anells', '17001346', 'c. Salvador Espriu, 6, 17458 Fornells de la Selva', '972476331' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001361@xtec.cat', '$2b$10$jMRB24K62ufSqsEF9Dzz0.M1xqRHPD/zO/Jx9TVOeHdZC7Bw8sImC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Teresa de Pallejà', '17001361', 'pl. de l''Empordà, 1, 17469 Fortià', '972534149' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001371@xtec.cat', '$2b$10$UxAoBk17KK0HuxTGKUvn7Okr7Svg7vpu7uuECNfEBCaB9DJipy6ZW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Garrigàs - ZER Empordà', '17001371', 'c. Gran, 26, 17476 Garrigàs', '972547465' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001383@xtec.cat', '$2b$10$tdLeRFeLWE8la0SnVt36NeZYmzM6SEUR2uvWCxJzhv1IIklWWVxdK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joaquim Gifre', '17001383', 'c. Escoles, s/n, 17780 Garriguella', '972530113' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001395@xtec.cat', '$2b$10$TtD0n12bUlrurlkAw4xuS.riSW/8LvL4EltgJIxG/RSHPU5gbOGjC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Coloma - ZER Cerdanya', '17001395', 'av. Rita Casamitjana, s/n, 17539 Ger', '972894250' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001413@xtec.cat', '$2b$10$Kak0wNs9GYPy1OgtTySUN.F42In4hUNzr0Cd8kxGBhUSRw4duktyi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Les Alzines', '17001413', 'c. La Creu de Palau, s/n, 17003 Girona', '972980606' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001425@xtec.cat', '$2b$10$7WkFL/ush9DKxVJlXsQqdOkeCWXMxxGzQrmsM03XovFgLCeKY9RdK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Eiximenis', '17001425', 'c. Eiximenis, 7, 17001 Girona', '972202974' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001449@xtec.cat', '$2b$10$0YrI5xcqhem6E0sQDqUwkuyuAjWlyTNyOsRhajHAuzjXtmg9S4cNy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Annexa - Joan Puigbert', '17001449', 'c. d''Isabel la Catòlica, 24, 17002 Girona', '972202186' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001450@xtec.cat', '$2b$10$o8AW3RyT/GhAoKdShBbc9uGfJw5FqBfwu0rluymT.5rncADgrbHIW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Bruguera', '17001450', 'Gran Via Jaume I, 24, 17001 Girona', '972203424' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001462@xtec.cat', '$2b$10$bkYN1UJKKnF.dy3OAMosHuyL/hGcnX1jv5VQ9T1NGQYdJyqV4iqKG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Verd', '17001462', 'c. Joan Maragall, 32, 17002 Girona', '972202399' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001486@xtec.cat', '$2b$10$gncwKd/FIXow00Op8xKQnu0PRF/HogpGasqrhPBmNGjJiYaO6elkW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montjuïc', '17001486', 'Pujada Montjuïc 1, 17007 Girona', '972200637' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001516@xtec.cat', '$2b$10$el9a0hBZ02Q/pF8cEAAj8uayv5IEbT.Rm5Y9gWYFDSY9Oc/uX9aKW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pla de Girona', '17001516', 'av. Lluis Pericot, 16-18, 17003 Girona', '972212642' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001541@xtec.cat', '$2b$10$R/gfBx6UdajS6Hs21BwVhOIViGenIINnYWy8hmLWZPN0Y1LNo0VZi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Doctor Masmitjà', '17001541', 'pg. Joan Maragall, 56, 17002 Girona', '972203683' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001553@xtec.cat', '$2b$10$gHQgfvwGCD0UVXM4DukG8ONd6FgjtpuceZDWYHK9oNs7og6f3QGp.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Girona', '17001553', 'ctra. Barcelona, 21, 17002 Girona', '972202084' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001565@xtec.cat', '$2b$10$Il.Glm4RoF9CH4pMR2pZtuf2Fds91grlnzJ0tTQNqnIG5gcNH5poy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'FEDAC - Sant Narcís', '17001565', 'c. Pare Coll, 1-3, 17005 Girona', '972233212' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001577@xtec.cat', '$2b$10$ral08sqHcQgUkT8puwav0OI01CIDBTxkH/md4MAWXSVVdav0jw5lC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '17001577', 'c. Sant Joan Baptiste de la Salle, 12, 17002 Girona', '972200292' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001589@xtec.cat', '$2b$10$TSBgcoVQyWpJSr7hz8lhi.98Wv13xSHfWXdMa7h6RSs9ACyJ9oIW2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Maristes Girona', '17001589', 'av. Josep Tarradellas, 5-7, 17005 Girona', '972232211' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001590@xtec.cat', '$2b$10$4u21XwK1oEmMOr8tTQSANOrvnidog952line5UiG0GzjofJtkZX2G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Bell-lloc del Pla', '17001590', 'Can Pau Birol, 2-6, 17005 Girona', '972232111' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001693@xtec.cat', '$2b$10$4Yd3HHCSbLtihc8w.rKrLeNPgvhgvs7vNI09X1hMbv5VwZdYY7v/a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Font de l''Abella', '17001693', 'av. Montilivi, 100, 17003 Girona', '972206547' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001723@xtec.cat', '$2b$10$ddceGYpbqnPjtC1l4wsmp.B48LBTFYe/JOzki.venqnL.ufN/VRbq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Jaume Vicens Vives', '17001723', 'c. d''Isabel la Catòlica, 17, 17004 Girona', '972200130' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001735@xtec.cat', '$2b$10$6ufQCFthWok8fMxh1D7Mt.Ef2bQSOW/HL0Pc.wnH5/O37xLl029z2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Montilivi', '17001735', 'av. Montilivi, 125, 17003 Girona', '972209458' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001759@xtec.cat', '$2b$10$Sc/yhLOxR3IW/00b.LQVoetc0rUmsZ8IO9bq6wHYH1JKaAx4u.3Ha', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola d''Hostaleria i Turisme de Girona', '17001759', 'c. Josep Viader Moliner, 11, 17005 Girona', '972220122' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001838@xtec.cat', '$2b$10$LzU8xUxBshQLwScPriYKs.wG4ztV4FKJ9zX2YJfG90aijssghbfcq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àgora', '17001838', 'pg. Ramon Berenguer II, 4, 17005 Girona', '972239942' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001863@xtec.cat', '$2b$10$D1y20Utvpjmld5WBW2jIHOH50AgKKYYDqa/Z3O9/a4VQt8KM03VKq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Montessori-Palau', '17001863', 'c. Camí vell de Fornells, 33, 17003 Girona', '972417676' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001887@xtec.cat', '$2b$10$ZR0RzWhckHuZ.Pl2Qr/0b.AL2gE3SDupFI9rgT6MMijuXL3i4MyNq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carme Auguet', '17001887', 'c. Port Lligat, 11, 17007 Girona', '972212745' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001905@xtec.cat', '$2b$10$wxCeMzpFdJZrkrSH8gcgneZN8PKbSYdPkV9/lbWebjceX3DGH.nMm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'FEDAC - Pont Major', '17001905', 'c. Pont Major, 21, 17007 Girona', '972207279' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001930@xtec.cat', '$2b$10$Qif0vl2H/YaBOtc8hiqgGegTwTgTU9RMLkdQ9f/ssmIAJoJ4fSlQ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Dalmau i Carles', '17001930', 'c. Taga, 1 (Sta. Eugènia Ter), 17005 Girona', '972237037' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001942@xtec.cat', '$2b$10$BwlFMXBGBNsdVMoHmTMByurtI/WtiSNFvxiM5mTsUg5A96yfLJGYC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sagrada Família', '17001942', 'ctra. de Sant Feliu de Guíxols, 40, 17004 Girona', '972200100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001954@xtec.cat', '$2b$10$xJJYt/4BmFgLA6qstu5mg.z3Eobn5M8v6R5IZlm29f3DRVRHyOUqu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Vila-roja', '17001954', 'c. Grup Vila-Roja, 180, 17004 Girona', '972201992' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7001981@xtec.cat', '$2b$10$.Bd0tA3g0amyBX.r5aGI6.D0L6advfMbKCogfQjKD98Tmnrht07D.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu dels Socors', '17001981', 'av. Fortalesa, 26, 17850 Hostalric', '972864469' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002004@xtec.cat', '$2b$10$8z.3vAesuA69mpHuzRYqdedT7xo1JYHAIx2UnqT4X7x6Gj/Ye5wcG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Peñuelas del Rio', '17002004', 'ctra. N II, 18, 17700 La Jonquera', '972554620' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002028@xtec.cat', '$2b$10$8lTm7z3bqNjnEy7YkoCCfu5Nt6ScN/8OQd7kpnEGWVR7AobhWbP1G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montserrat Vayreda i Trullol', '17002028', 'c. de les Escoles, 8, 17745 Lladó', '972565301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002031@xtec.cat', '$2b$10$L9GfpO4Gdix0b0syK03nZeWkotigDSMwwb.MfM0An8GGC4rv84McK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Lacustària', '17002031', 'c. Lleó I, 6, 17240 Llagostera', '972830339' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002065@xtec.cat', '$2b$10$f1ecAbUKLDWll9HoSTZm9uZ6kn/fIqAIFAtN03LTJaQG/kopDY4J6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Moreres - ZER Vall de Ter', '17002065', 'c. Del Quintà, 2, 17869 Llanars', '972130019' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002077@xtec.cat', '$2b$10$cJ2gsdo13o/tuf4A24qqd.mcmOY2cHNZf.1hkPekrMqHYLfxP7Rna', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pompeu Fabra', '17002077', 'c. Les Esplanes, s/n, 17490 Llançà', '972380495' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002089@xtec.cat', '$2b$10$E8kbid9R9YTaBPVfDD.hluHR2xkj..QBfA8DHoHp0TXWxqTghPdai', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Llers', '17002089', 'c. Orient, 2, 17730 Llers', '972528207' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002090@xtec.cat', '$2b$10$Xe439s4QC9q4c0nr2KfYMOn/qcCJrw0u4PXwmZN6Iaa8q4vY8bYbW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jaume I', '17002090', 'av. de Catalunya, 91, 17527 Llívia', '972896224' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002107@xtec.cat', '$2b$10$1F2SzrsAXqBxg7IUEBGREO2iCFww6T4ojOBrIUyeJGhck8he4sQp2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pere Torrent', '17002107', 'c. Escoles, s/n, 17310 Lloret de Mar', '972366869' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002119@xtec.cat', '$2b$10$g2M1g/PsmF4u6Gnt59PMM.LGKpsqccGeEemRd55YvH/oMH9OFD7/.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Immaculada Concepció', '17002119', 'c. de Felip Gibert, 38, 17310 Lloret de Mar', '972364740' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002168@xtec.cat', '$2b$10$o/4Q2gv3hROWNz2uqkx4VeRqo8G3GPCHkhORpNzPX7ZoLYv4XAOSG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Salines - ZER Les Salines', '17002168', 'c. Les Salines, s/n, 17720 Maçanet de Cabrenys', '972544242' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002181@xtec.cat', '$2b$10$AF4TxgvobhCfy3W/cDsDp.I0MLhJzG38WnApj6gwfsE4dzSTkDsx6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi', '17002181', 'c. Escoles, 23, 17412 Maçanet de la Selva', '972858065' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002193@xtec.cat', '$2b$10$BSd5ZgjL.c02Ls5McDLra.fZMGoqihag8ElhnaPPt7AFcU6odmOyO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Fe', '17002193', 'Pujada del Castell, s/n, 17481 Sant Julià de Ramis', '972498292' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002201@xtec.cat', '$2b$10$PVZIfaOcq1ZO3TH.FgBsSeJPmTKKpkBB87CxZSTQNqBSeio/Hj/1i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Finestres', '17002201', 'Can Caló, s/n, 17830 Mieres', '972680462' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002247@xtec.cat', '$2b$10$.8vFCMAzUfw3Np4UF.9RQuX2IWUPWvnALfqMT7z0gNHgJ1LLSEDba', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mont Cós - ZER El Llierca', '17002247', 'c. Escoles, 1, 17855 Montagut i Oix', '972687535' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002259@xtec.cat', '$2b$10$7gevITbf5L9LhFp9/AHi/uF5RuOTE.a60cUFNVi3S.Sjz9dm8KMui', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Torres Jonama', '17002259', 'c. Torres Jonama, 9, 17253 Mont-ras', '972304769' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002260@xtec.cat', '$2b$10$OAZ5ey./YO.muqQ6iypJY.Qjp/hnVN0HNiJH5Hym6.3Tx3DY0Few6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joaquim Vallmajó', '17002260', 'c. Escoles, 12, 17744 Navata', '972553552' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002296@xtec.cat', '$2b$10$fkAhSlf6p5W9XJw6sydzHOcXWZ2Z2o2sxCL.Y4Tn/lk9QFUT4y9EO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Malagrida', '17002296', 'av. de les Corts Catalanes, 30, 17800 Olot', '972260421' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002314@xtec.cat', '$2b$10$8HZhnoEGYSbEev6uvkvFO.nr8aWCaVqNdlrSwRG6nXOOEddXqLnbK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pla de Dalt', '17002314', 'c. Alforja, 2-4, 17800 Olot', '972261044' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002326@xtec.cat', '$2b$10$yGR/1NNq6W7a70VwNbItwO8QnU5tUoZVhDFpZ5YjXoVValMRFTgUK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Volcà Bisaroques', '17002326', 'c. Pare Nolasc del Molar, 6, 17800 Olot', '972266157' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002341@xtec.cat', '$2b$10$2QBRjRsbkitmJe9kXJdqDueyj5LxnC7AhXelorEvanGHoBIM37WVK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pia d''Olot', '17002341', 'pl. Clarà, 9, 17800 Olot', '972260212' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002387@xtec.cat', '$2b$10$rPcUjocu1i7WE6Vuf6UBRO2ZftQHgIv92rkQBK.Reb5ENS2tq6j76', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Montsacopa', '17002387', 'av. Joan de Cabirol, s/n, 17800 Olot', '972267000' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002399@xtec.cat', '$2b$10$PfZhDICnWa7lmX41F9IXeuUdl2MiswpFT7K5uxcyZK6UHuH51K796', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Garrotxa', '17002399', 'ctra. de Riudaura, 110, 17800 Olot', '972262200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002405@xtec.cat', '$2b$10$YRdZE3/udj1aBFzWC5Q/wu37KmJ2Ny.8IFJIGqGqWJHDZNU7O2Bfm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Petit Plançó', '17002405', 'c. Joaquim Vayreda, 23, 17800 Olot', '972260712' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002417@xtec.cat', '$2b$10$.5bU31fnrdcnKIZ3BJ.gx.JnMc6BfoFPtzq4lqe2oI3K3LMbLNgzm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cor de Maria', '17002417', 'c. Esglaiers, 1, 17800 Olot', '972261391' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002429@xtec.cat', '$2b$10$PhVkTF.y7eDujQm0vwzCSeEFxJW7QyyQizlVqFP4oIE/IFTyx8qJq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Roc', '17002429', 'c. Còrdova, 1, 17800 Olot', '972262565' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002430@xtec.cat', '$2b$10$1k48rgSQb/R2L1b2Fiut1uShc2wFG3fgYYLdXFvU8LcLI7rvO5RHq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Maria Pagès i Trayter', '17002430', 'c. Sa Mar, s/n, 17772 Ordis', '972525513' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002442@xtec.cat', '$2b$10$JrtjC0LPZdVYk5z7TQeTf.M38P5atxV2.Nqeol0xayALGnkbA44bS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Vall', '17002442', 'c. França, s/n, 17161 Osor', '972446176' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002481@xtec.cat', '$2b$10$LY2b/iUV3I1oZBdEOcKoY.Un1IY/.rPfDI6vN6yM3TEUfBSq07o4y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Torres Jonama', '17002481', 'c. Escoles, 10, 17200 Palafrugell', '972610882' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002491@xtec.cat', '$2b$10$t9cmzEwfzr4Z2lOGaE3seuVyciEEfj0dJwoLM2Yj1qS3SNeo2vYPG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Barceló i Matas', '17002491', 'c. Pals, 75, 17200 Palafrugell', '972300924' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002508@xtec.cat', '$2b$10$oK63nrkFBbBu3MxPv9D.AO7eQlmd6i9zpMqaxfHzIs4b1Eo5ZnDBC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Prats de la Carrera', '17002508', 'c. Clavé, 33, 17200 Palafrugell', '972300204' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002511@xtec.cat', '$2b$10$KM641i9Zzo37AqcXs2Vvd.Ejj150VUNR.dGZ6ZxuA58jO4tg0qfp6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Palafrugell', '17002511', 'c. Sant Sebastià, 85, 17200 Palafrugell', '972300739' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002521@xtec.cat', '$2b$10$AHYLqBwMHZAl5bsN/e03FuyEjw1JEMILI.MVNiSIFbQtnHNNfXl8C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Jordi', '17002521', 'c. Tarongeta, 65, 17200 Palafrugell', '972302898' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002533@xtec.cat', '$2b$10$QU2P06xhyrTx8vMZl4n5Suoau7mUMdNMs/CK/CBE06m/lf4cFK4iG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Ca la Tulita', '17002533', 'c. Caritat, 50, 17200 Palafrugell', '972301042' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002545@xtec.cat', '$2b$10$YFjJrA/EBeu9ZmbqDiplvOudDh8aq.4fS9XR.0dlNwCgUD6K1H16O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Frederic Martí i Carreras', '17002545', 'c. Frederic Martí Carreras, 13, 17200 Palafrugell', '972301079' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002557@xtec.cat', '$2b$10$1ftdZcqZ2M.0tKTscsdTe.U2mLaS1pS4OimTF5sqwOYoBY4aFLtLa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Baix Empordà', '17002557', 'av. de les Corts Catalanes, s/n, 17200 Palafrugell', '972300323' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002569@xtec.cat', '$2b$10$rLMmOBaiPO3UmcI2w5q5eutn7zHk2Y//kh6FfFzm5JIPgqt1.zKhO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Vila', '17002569', 'c. Foment, 18, 17230 Palamós', '972314344' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002570@xtec.cat', '$2b$10$dkZDloSpGyoo68cYGU5MzeABZuS3.sk6t7uaTd/qjsp8CasI6A3sG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Palamós Centre', '17002570', 'c. Sant Josep, 15, 17230 Palamós', '972314236' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002594@xtec.cat', '$2b$10$bJB6ZHAxhokSM4L3Nce1k.W..ZigZUmQdGf3ueW0b0xhBLg.AiWdi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Palamós Xaloc', '17002594', 'c. Xaloc, 22, 17230 Palamós', '972314286' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002624@xtec.cat', '$2b$10$NDrH1IhZnxaKWD.hpM6RwOw8AL2ppyz3ADg5AGMC30ohYdsiKcLM2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Martí Inglès', '17002624', 'av. Mas Oriol, s/n, 17495 Palau-saverdera', '972530748' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002651@xtec.cat', '$2b$10$O/UnbfLrwcfVZBw4hW/EMOpt3gO3YDWfSYhdW/GQJmW5ciJ/IKI8m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Quermany', '17002651', 'c. Aniceta Figueras, 14, 17256 Pals', '972636439' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002703@xtec.cat', '$2b$10$gsXpiJVGGdNKFgAo3Mun1uVB8q1UOBbukq4zuLEnNAmZmeAILJfOa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pau', '17002703', 'c. Migjorn, 2, 17494 Pau', '972552039' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002715@xtec.cat', '$2b$10$xMcF7FwYDCSSWKJQL9/mTeNnY9yZisV4Niohtmy/6Ljl55hNpL2Jq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pedra Blanca - ZER Empordanet-Gavarres', '17002715', 'p. de l''U d''octubre, 17120 La Pera', '972488540' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002740@xtec.cat', '$2b$10$D/vFkCKOIahYv3SBdl86Ju6IK6S5.9jGg.83IoQZ58B3LEOzptwbq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramon Muntaner', '17002740', 'av. Constitució, s/n, 17491 Peralada', '972538084' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002752@xtec.cat', '$2b$10$Tt5igtL7v5H2/LC0.ELdZ.5vjTeJpNWzF37hSq3n1jDw9LkY6sZeG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Cristòfol', '17002752', 'av. Narcís Arnau, 58, 17172 Les Planes d''Hostoles', '972448041' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002764@xtec.cat', '$2b$10$FU/xe7F4dJP05QkRV9Yu2eITabPDwG/7OAqzFrWFmgy80Es1qkuNO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Núria Morer i Pi - ZER Comte Arnau', '17002764', 'c. Escoles, 7, 17535 Planoles', '972736201' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002776@xtec.cat', '$2b$10$RrRY8BEInW1PFANz9JaXCeBNcKNYe24ERR4DQRmhZ3/7UWPJF321i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Tramuntana - ZER Empordà', '17002776', 'c. Carles Jordà, 2, 17706 Pont de Molins', '972529038' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002791@xtec.cat', '$2b$10$UV7mlypmPkwhxxaENyOfx.iYc5jnDn0QAnvU2Doqi1n5R.4U7I23K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Entorn', '17002791', 'c. Montseny, 15, 17834 Porqueres', '972574017' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002818@xtec.cat', '$2b$10$JpwcSAsW8M3WVhKZ3zM/Aeo.aFpL1bc1OY.qbaB0UJJSjP2dUhRnG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Frigolet', '17002818', 'Paratge Frigolet, s/n, 17834 Porqueres', '972574629' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002831@xtec.cat', '$2b$10$5ZtYNIM86XUOaPcknlftFeLFBAbfw232dwCSU7uGytnDOExpSLRey', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jaume', '17002831', 'c. Sant Jordi, 2, 17497 Portbou', '972390760' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002879@xtec.cat', '$2b$10$MgPBchbPcSOsijt6KNNGnuecEBqyO8bB/vjMUWuQ3NHb4QLjpDnd2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Clisques - ZER Cap de Creus', '17002879', 'c. Lloia, 2, 17489 El Port de la Selva', '972126432' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002880@xtec.cat', '$2b$10$n5nNLyC5Dcxzd14T8CQHl.LtTBdlmi95iX7TyWbVJ2CVixE05/i4O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Alfons I', '17002880', 'av. Schierbeck, 2, 17520 Puigcerdà', '972141026' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002892@xtec.cat', '$2b$10$0UY77ubAJFr1LAaw1gP0keFUKmjXghrShJf3iiLP9kDmRbWnls6Ru', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Puigcerdà', '17002892', 'c. Carmelites, 4, 17520 Puigcerdà', '972880384' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002922@xtec.cat', '$2b$10$2t/AffnHCQ0WIG.XPxxTzOZK4I6ryww1gNIPo50y7bTsBrnkigz0C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Margarida', '17002922', 'c. del Tren, s/n, 17242 Quart', '972469381' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002983@xtec.cat', '$2b$10$IcNWYvAn.qAkBS1tfY9lPu5mUDZNzHe9WgRr8sy2p5HZ0K.2AwuMi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Bruc', '17002983', 'Urbanització Can Salvà, s/n, 17404 Riells i Viabrea', '972870289' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7002995@xtec.cat', '$2b$10$4zyWq24VS3C5sMFottv7A.bwuHyyY/Sl/EX0oY4Iv/BSVV2AXIO16', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Maragall', '17002995', 'ctra. Barcelona, 8, 17500 Ripoll', '972700451' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003011@xtec.cat', '$2b$10$NWiW6I7gD/zWbcNs2mJ.K.ACQMYxEPM2tLZhDJW6VrTFXYaQqA.WO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Salesians Ripoll', '17003011', 'c. Viñas, 1, 17500 Ripoll', '972700152' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003021@xtec.cat', '$2b$10$Q6T7o3e.HWEBa2VqnxkxW.lSthHim92lzKlkoBRJhIfJBDkybqdZ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Ripoll', '17003021', 'c. Berenguer, 10, 17500 Ripoll', '972700061' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003070@xtec.cat', '$2b$10$yJU.NZjTJRg4AKMAPcJq/./bvYfhtC2ruMrfAeHg1KSE.oP2ONPdS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Boada', '17003070', 'av. Mas Rechs, s/n, 17421 Riudarenes', '972856111' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003082@xtec.cat', '$2b$10$VD93zi1N.H5m/hR6iIQqBOL0Kwq8Zzp51iV4h.5M5PFdwTv3eKOKC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Lluís Castells', '17003082', 'c. de l''Escola, s/n, 17814 Riudaura', '972266944' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003094@xtec.cat', '$2b$10$5Tozxpns3XB0KYo9WLmzeuWGqaaM7hn15o7n9p8NG3JJakn9djcCK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Riudellots de la Selva', '17003094', 'av. Girona, s/n, 17457 Riudellots de la Selva', '972477133' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003124@xtec.cat', '$2b$10$mQhNQpoWHZydF3AjfTMfu.N8fSB79Eh3F5dTe3864BcZra4Xsi8Wi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre escolar Empordà', '17003124', 'c. Riera Ginjoler, 196, 17480 Roses', '972257397' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003136@xtec.cat', '$2b$10$ynHxDvqQfBgj47q8QJQ7e.V6hV6MJloP6GHvXNDLtG/KYT5H2WAbW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Narcís Monturiol', '17003136', 'av. Rhode, 239, 17480 Roses', '972256267' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003151@xtec.cat', '$2b$10$d5JO/jDBzR3kZwal7KP.MeojzORsPhHDRCKk5aHdVwglit68RYYau', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Silvestre Santaló', '17003151', 'c. Folch i Torras, 8, 17190 Salt', '972238619' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003161@xtec.cat', '$2b$10$ly0aQTuUdfbm/2dYCXibnuiCksftcK/lNBwtjmgTzQrAsKIRE2OGa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Pompeu Fabra', '17003161', 'c. Sant Dionís, 41, 17190 Salt', '972405702' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003185@xtec.cat', '$2b$10$bEn2rN7eq4zozmgVsUTNUu3ofYia/SU9ywCbi/GqLZDlUWhQQZ1Cy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vilagran', '17003185', 'c. Cervantes, 13-15, 17190 Salt', '972241757' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003197@xtec.cat', '$2b$10$Giz3hac41FvwOB7d25NKEerztun5Yqc6wxRJjRl4sMoILfJFSJ2mK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'FEDAC - Salt', '17003197', 'c. Llarg, 60, 17190 Salt', '972233681' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003203@xtec.cat', '$2b$10$ZuQfY6YA/yAID.Re2lZJ.u.FM/bG48medD7kalkIJ1lq/ZiXoIJDS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Salvador Espriu', '17003203', 'av. Folch i Torres, 4, 17190 Salt', '972240246' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003215@xtec.cat', '$2b$10$3PjLRrV35VsYM2lplBEI3.CwXVDJCriGri1tPj8HlDjr94gbUsHyu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Farga', '17003215', 'c. Sant Dionís, 40, 17190 Salt', '972235637' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003227@xtec.cat', '$2b$10$QWNi58AIvcosQ1ib3J/zReqqCdq5B9xjjBgoAYMsj9J.ukA/pdlT6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Sebastià - ZER Requesens', '17003227', 'c. Icària, 17, 17751 Sant Climent Sescebes', '972563432' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003264@xtec.cat', '$2b$10$Mdp4Qa6jfGPkBh81ywMpQOgzGJ.XRv9aFowL5xkP2wvRqR04x8GLG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Gaziel', '17003264', 'c. Del Mall, 98. Apartat 165, 17220 Sant Feliu de Guíxols', '972321126' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003288@xtec.cat', '$2b$10$BWHbLDL8cdMy2XtpMCXNP.4xwg/QKO3D2DSguFT5R7ouRxHOoMydi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cor de Maria - Sant Josep', '17003288', 'c. Ferran Romaguera, 20, 17220 Sant Feliu de Guíxols', '972320435' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003306@xtec.cat', '$2b$10$hkCC3t7txUPxT3ucBeAglujWUhyJ023014NEprsy8OdNmPeDY1Ts.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Sant Elm', '17003306', 'c. Abat Sunyer, s/n, 17220 Sant Feliu de Guíxols', '972321381' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003318@xtec.cat', '$2b$10$Pfrc.UFul8mS/X0MuBY1JefUBlEeBfB7BNXKVzbRcSdQSw7y3E/PS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Sant Feliu de Guíxols', '17003318', 'c. Canigó, 41, 17220 Sant Feliu de Guíxols', '972820118' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003321@xtec.cat', '$2b$10$XCqT7jAPgH3uc1CVdKAviOopdES5/Obtyju/g311COKUMkvmosL1.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Baldiri Reixach', '17003321', 'c. Corunya, s/n, 17220 Sant Feliu de Guíxols', '972320071' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003343@xtec.cat', '$2b$10$pmNbMKkcjKSS8wVC4KiB7uAJAUzHOyLr0W2xTNXkEcz/pJio0WJ7m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rocalba', '17003343', 'c. Les Valls, 15, 17174 Sant Feliu de Pallerols', '972444096' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003392@xtec.cat', '$2b$10$k2u4jqisCeiGouvWQgz6l.7jPmNkMP65hjFWwPH9vsZa2DMU0REZi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Agustí Gifre', '17003392', 'pl. del Poble, s/n, 17150 Sant Gregori', '972428182' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003422@xtec.cat', '$2b$10$dLTu8MykqyHZ/w6SyLm4WueeSNHHE/04Ysi7aUGzPQucBJkTqXC0e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Taialà', '17003422', 'ctra. de Taialà, 75 (Germans Sàbat), 17007 Girona', '972216637' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003434@xtec.cat', '$2b$10$QZEE1RFfANxZiyFZEEhOD.Wj614YF3wMo9khVfY57vGHrSZ2CEKCe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Guilleries', '17003434', 'c. Sant Josep, 12, 17403 Sant Hilari Sacalm', '972868729' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003461@xtec.cat', '$2b$10$e.WBfI/9M8scBjhOBot.RusEoLtQZiDusnSEny4azXjO2USyzdwuK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Escomes', '17003461', 'c. Isidre Carcassona, 3, 17854 Sant Jaume de Llierca', '972687401' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003471@xtec.cat', '$2b$10$ndJuLrisunADPcG2QSUXzeH5JyTQBc6q/uyUj734kjQpuzm0vB88O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi', '17003471', 'c. Escoles, 2, 17464 Sant Jordi Desvalls', '972798028' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003537@xtec.cat', '$2b$10$AjafMUl2lUXlMZvaUTDmdOtXXG1jZl3uHqYKV.nzbJEb8jpl6Mgi6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Vallfogona de Ripollès - ZER Comte Arnau', '17003537', 'c. Puig Estela, 15, 17862 Vallfogona de Ripollès', '972702073' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003598@xtec.cat', '$2b$10$Rd8XGaoMnrUhKCQoJEQp/ug9QBdzXC7bqG5tl.F9Ablhyg9iq/rpO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vallgarriga', '17003598', 'c. Ferrer Fàbrega, 1, 17475 Sant Miquel de Fluvià', '972568187' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003616@xtec.cat', '$2b$10$1o3cKhAqdvAeyrGjxblcHudhFEUdf5iZQiWrjOQKeMAaJ../cS0am', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Pinets - ZER Vall de Ter', '17003616', 'c. del Ter, 2-4, 17864 Sant Pau de Segúries', '972747156' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003628@xtec.cat', '$2b$10$leJTOIlztazCPMNSBzYrRuPJ6Vzto0pudUmicWzOfGkJ1i5Ftjk76', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Llagut', '17003628', 'c. Escoles, s/n, 17470 Sant Pere Pescador', '662360484' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003631@xtec.cat', '$2b$10$aleM.y/2RoQX73lFac3vguIZvpCIq5BD6biCRsHzhiIOgVqYYYGJi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Pedra Dreta - ZER Empordanet-Gavarres', '17003631', 'av. Catalunya, 2, 17116 Cruïlles, Monells i Sant Sadurní de l''He', '972641717' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003641@xtec.cat', '$2b$10$NcV/Tx6tnSqHdG.UfiFvIeNhSapJFGzefZxxICwVkM17e8UudmCUC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Salvador d''Horta', '17003641', 'pg. Sant Salvador, 12, 17430 Santa Coloma de Farners', '972840927' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003653@xtec.cat', '$2b$10$6qteTQ4wbGjoigb/NikXSur1Br.u8wUI.3rVWLUeM6zEsUvT7S4HO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '17003653', 'c. Pujada la Salle, 10, 17430 Santa Coloma de Farners', '972840294' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003689@xtec.cat', '$2b$10$H48D8qrkIvZEqS1JDpjiueidgqM99K9HUPl9t7Jh2VEm.OKdss8h6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pedralta', '17003689', 'av. de l''Església, 4, 17246 Santa Cristina d''Aro', '972837752' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003719@xtec.cat', '$2b$10$A68aqWWx334bNrgeeH7.W.5uEcWceSNzdPNHjF4ol2i8Njap6Dm9.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Maragall', '17003719', 'c. Escoles, 26, 17811 Santa Pau', '972680059' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003732@xtec.cat', '$2b$10$Cvas19/Ptgwdr115uruUueGVagcSpxXYDIUY41zLf3oUGFgSRr23O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Castanyer', '17003732', 'c. Castanyer, 4, 17857 Sant Joan les Fonts', '972290777' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003756@xtec.cat', '$2b$10$Z8ubMMboMzB/6AuXCBCxU.2deBjt1yBYQi8xiaLh89xnkyvUAEDeS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montserrat', '17003756', 'c. Afores, s/n, 17840 Sarrià de Ter', '972170718' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003768@xtec.cat', '$2b$10$Yd2tg71LqkqgLBKK/s0ws..8K3tGv9pAjXY4Bozj0neKHKEBvqioa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Terraprims', '17003768', 'c. Banyoles, 8, 17465 Saus, Camallera i Llampaies', '972794087' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003781@xtec.cat', '$2b$10$K2.WQrwBXlEPRZsCbcCeducfHqAuJxMFKY72MJd/mtELRfX3ewc76', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Juncadella', '17003781', 'ctra. Escoles, 2, 17165 La Cellera de Ter', '972421605' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003801@xtec.cat', '$2b$10$I7BvK0ES.PElTZyY7GD2cOFUSCUw87sUUGAamq4azw.p2Hkc7ECzC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bora Gran', '17003801', 'pl. de l''Ajuntament, 6, 17852 Serinyà', '972593060' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003823@xtec.cat', '$2b$10$R9LmVRl80QbbBQMNmykYseBD8Fk./RrqbeRUNf/MW2JAOocetJFfa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Verdaguer', '17003823', 'c. de Jacint Verdaguer, 72, 17410 Sils', '972853165' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003860@xtec.cat', '$2b$10$CFrw92I4O1sop5pbVgO7COs6M40AJnk4azAv5k0HYxDttB3yVN68m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Portitxol', '17003860', 'c. Roca Maura, 15, 17258 Torroella de Montgrí', '972751447' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003872@xtec.cat', '$2b$10$kH5ozbY5c4QbpkCGo0jdh.i5FyWx/v9CHmU4YeTSki.PJv/jJuhRW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Guillem de Montgrí', '17003872', 'c. del Roser, 81-83, 17257 Torroella de Montgrí', '972757272' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003896@xtec.cat', '$2b$10$Ap13Eg8GQYbOFLm/anQbZOecPPMNiqL3wdaRmOzg5fgXWBVaMpJgO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Gabriel', '17003896', 'rda. Pau Casals, 121, 17257 Torroella de Montgrí', '972758416' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003902@xtec.cat', '$2b$10$BbQddkp1EH3r7lbAsL.BkOyuustAR39YGx6murWJ71rUmyIWowRQy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Roura i Parella - ZER El Llierca', '17003902', 'c. Sales, s/n, 17853 Tortellà', '972687115' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003926@xtec.cat', '$2b$10$gICEGItLi4QJZbI2kislu.Hw7.27bOF9L7bdQTi5IXDYTNh/YhKii', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ignasi Melé i Farré', '17003926', 'av. Puerto Rico, 18, 17320 Tossa de Mar', '972341368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003938@xtec.cat', '$2b$10$4d/HvlWShzkWTM6k2N3aWurHVheByl40hqkUPKcTEgMkeNSXmZBw.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puig Rodó - ZER Montgrí', '17003938', 'ctra. Torroella, s/n, 17140 Ullà', '972760616' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003941@xtec.cat', '$2b$10$4C8J.wwZF.S67rpZ8JjbU.atsQxJUPvBDfL6Mo6u8JpHt7MFYNUTW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Estany - ZER Empordanet-Gavarres', '17003941', 'c. Tramuntana, 19, 17114 Ullastret', '972760303' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7003951@xtec.cat', '$2b$10$KjQ/TAJytzbHfx.IWGl1zeBy/gjS8wyJf7lN75KwRuf5v0RnJqBz2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Parvulari de Sant Esteve d''en Bas', '17003951', 'av. de Fernando Laparte, 2, 17176 La Vall d''en Bas', '972690375' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004001@xtec.cat', '$2b$10$fKqIbOu5WmXYmzuH1835ROyBkXeGUw/e8qE4H0y.iM9vMCX8k.jV.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Verntallat', '17004001', 'ctra. de Sant Privat, s/n, 17178 La Vall d''en Bas', '972693209' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004049@xtec.cat', '$2b$10$aZRCUGT1Us73PbaxgMd1AOeia96Q54ccfgntDt5DYJyjotQA8qc3C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Oliveres Mil·lenàries - ZER Tramuntana', '17004049', 'c. Escoles, 1, 17473 Ventalló', '972793006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004062@xtec.cat', '$2b$10$u1Hp4R.OBq782YtW4I4H..f7gZTXTkxKLB6YT9fkItyHOwItIxT8.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Bàrbara - ZER Els Castells', '17004062', 'ctra. de Ciuret, 17515 Vidrà', '938551277' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004074@xtec.cat', '$2b$10$b5lusCz9rz52P6zjhnFYQunGTcYeWKkJryywZalNg6TC2mVPeYRaq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Iscle', '17004074', 'c. Tossa, s/n, 17411 Vidreres', '972850103' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004098@xtec.cat', '$2b$10$pvaO4bebFPZV9dBdPVFsX.EOOp7BKP8upRKOBQt81CtW4oqQx8JyO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Torre d''en Reig', '17004098', 'c. Ramon Reig, 3, 17760 Vilabertran', '972505504' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004116@xtec.cat', '$2b$10$Z9u0pVOoUx11IgrAhxRHD.KTwCIuXNaJ2vr4e4waPYqI.C7qEpaDa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Madrenc', '17004116', 'c. Rafael de Casanovas, 2, 17180 Vilablareix', '972242612' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004128@xtec.cat', '$2b$10$7N6lMYzNvAlxRI.r/IiyVOfAkM.UxAD3Q3gjDFifGZPwJmtC7mnRG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puig Segalar - ZER Tramuntana', '17004128', 'c. de les Escoles, 3, 17137 Viladamat', '972765082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004153@xtec.cat', '$2b$10$Jq.ksmZ.yozcSj4jNzjmAuuJ/75XkW4GeOrfCH6lC2svK4hSWVeUS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Sant Esteve de Guialbes', '17004153', 'Carretera Creu a General, 17468 Vilademuls', '972561002' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004189@xtec.cat', '$2b$10$Pz.1FI0YxlT5Q1asvX9PnuqXenrew0dCJtpcQiJcj2tFDgC2Ve3Ri', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Castanyers - ZER Guilleries', '17004189', 'ptge. Pomaret, s/n, 17406 Viladrau', '938848087' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004190@xtec.cat', '$2b$10$UyMSNOeaVVuognR4N.rwDuIXF965S3AOF9mNRMU2zaGykLWWFUfOi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sol i Vent', '17004190', 'c. de les Escoles, 14, 17740 Vilafant', '972546311' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004207@xtec.cat', '$2b$10$CwQlL5qnru2AZDMsh1I2qO.N/CUeITP.gpBiG/PLVBWi8ghgg6vby', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santiago Ratés', '17004207', 'c. Sant Sebastià, 8, 17493 Vilajuïga', '972530039' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004219@xtec.cat', '$2b$10$KZ3nr56EeQqJKmo2UkeL0uFNsijLkrrjVYsh1UwMkUCz3BRKMrtUO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Daina - ZER Vall de Ter', '17004219', 'pl. De les Escoles, 2, 17869 Vilallonga de Ter', '972740025' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004220@xtec.cat', '$2b$10$ktGF/2sPlc1PHzBcmM5xreBYHr1FsLPiMjVcB1DoATzsjj3xoA89.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Valentins - ZER Tramuntana', '17004220', 'c. Escoles, 5, 17474 Vilamacolum', '621227231' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004232@xtec.cat', '$2b$10$nZxkbKpce2flbjyZFKW61uZOPMsXTkseyeSS2DMREhjEErM3gZTgK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep de Ribot i Olivas', '17004232', 'c. Figueres, 23, 17469 Vilamalla', '972525525' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004244@xtec.cat', '$2b$10$vfLOisnVkYzXIodsHR9cZ.O1U6C6rLT6FRW838FeBK5Fn98jWqmiK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Tramuntana - ZER Empordà', '17004244', 'c. Figueres, 2, 17743 Vilanant', '972547061' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004281@xtec.cat', '$2b$10$uGn1UQEYOxAQ0jslOjmJi.weM8amNQnVD1xD6STOWS9pehLZcrtdi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Madrenys', '17004281', 'ptge. Pompeu Fabra, 4-6, 17185 Vilobí d''Onyar', '972473286' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004293@xtec.cat', '$2b$10$VbQVGvGSpyHL6yaEt0gr5OTZCRlT/XQhbS9Mn977QKjulGx5UtEz6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Manuel de Pedrolo - ZER Les Salines', '17004293', 'pl. Nova, 3, 17723 Biure', '972529291' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004335@xtec.cat', '$2b$10$HBQNeS65JWjorwLr.DMV7Ozc/M5cxJYff9hkqk9JE5SyyGpGaF2jq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Eugènia', '17004335', 'c. Mare de Déu de la Salut, 30, 17005 Girona', '972233988' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004347@xtec.cat', '$2b$10$4J5XKP2Yte7mZ6z4XwT83uMH7BtHFUFs4UEZuML4lM8hJVr9n6czy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Font de la Pólvora', '17004347', 'av. de la Font de la Pòlvora, 4, 17004 Girona', '972219992' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004360@xtec.cat', '$2b$10$wWU7KNap6taT0TpWcfQryOEVLuPVJPWveY4Ovw3eOy4Mz8p.NT0j2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE La Maçana', '17004360', 'c. Folch i Torras, 6, 17190 Salt', '972235930' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004438@xtec.cat', '$2b$10$MQGbdnBwW5WT6.FqdzUPRObj49BoVGdzpxFcpB27CTSh/mZetFJmG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Alexandre Deulofeu', '17004438', 'c. Joaquim Cusí Fortunet, 3, 17600 Figueres', '972505674' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004441@xtec.cat', '$2b$10$0b1Yk2RAk2KUlgjm3sGDlOXXE3h5r7N91s9Y8PYVcNtyt1F/Mnozq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Joan XXIII', '17004441', 'c. Les Fonts, s/n, ap. C. 107, 17800 Olot', '972272316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004451@xtec.cat', '$2b$10$WI6AgrX.pV6M9xu7OBzHguBf9ZXES/zCj7OzFax4r8zjGvBYLIWLa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jaume Vicens i Vives', '17004451', 'c. Ponent, 41, 17480 Roses', '972257535' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004463@xtec.cat', '$2b$10$ifJaWE6HCRH5tdnWxbpDUeoM4iM60V0S6sjUWVFU6q0KtDtfn5f1O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Anicet de Pagès i de Puig', '17004463', 'La Marca de l''Ham (Vilatenim), 17600 Figueres', '972501514' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004487@xtec.cat', '$2b$10$QTlBk6/SqJIyax6DR48EG.kYMV7hMx.mDLsxkKDIe3iWDfoFOL.b2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Rafael Campalans', '17004487', 'pl. del Remei, s/n, 17160 Anglès', '972421207' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004499@xtec.cat', '$2b$10$IT.3p7LVvnwhen/E.HoW9un0u711Cu3UTvB0KDKRxvZV/I/JOzMlC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Narcís Xifra i Masmitjà', '17004499', 'pg. Sant Joan Bosco, 1, 17007 Girona', '972212612' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004529@xtec.cat', '$2b$10$X4qsBrGF.veAE56YrGgyjOBcFRDHNR6qIla6qQl0LUrhnJ6yDfY9e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Migdia', '17004529', 'c. Sant Agustí, 37, 17003 Girona', '972226170' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004530@xtec.cat', '$2b$10$TE42mwoRfrmQqOCfNG2Ff.CyMJoWYbxTwyP/NjwomfIGDrJ0m7xeu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Santiago Sobrequés i Vidal', '17004530', 'c. Joan Reglà, 2-4, 17003 Girona', '972218550' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004566@xtec.cat', '$2b$10$AxJZLx90Tfn0U1IPU5NAAe7ily0Gog/C2q4.1wwSsV19L0IohmDRm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Napoleó Soliva', '17004566', 'c. Astúries, 13, 17300 Blanes', '972333568' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004578@xtec.cat', '$2b$10$rX/Fd8vZVEYuQSpne48jxO8z0Q3h2ThED62ENyekT.31zao8WiOvu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Castell d''Estela', '17004578', 'pujada de l''Estació, 4, 17170 Amer', '972430347' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004657@xtec.cat', '$2b$10$yyx6wPlIu6WKu0JnsqzE8.z2X7bTJNlyCuSc1wZAnn3vpgNrp3muO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Esteve Carles', '17004657', 'c. de l''Oliva, 4, 17310 Lloret de Mar', '972365329' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004682@xtec.cat', '$2b$10$xzRfqBE5otjylApAJHVQdeVQSWIYHuFiuia0opFuHQKYr5clqC76q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Estació', '17004682', 'c. Santa Teresa, 49, 17220 Sant Feliu de Guíxols', '972323050' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004694@xtec.cat', '$2b$10$MzSJpKvNvj6Q9nAY8o2pWOfybZG13I6UcpXfAFMo9BR6BVnHRS1lO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cassià Costal', '17004694', 'c. Cassià Costal, 1, 17003 Girona', '972202776' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004700@xtec.cat', '$2b$10$pkkCLVr.27MoIdiDaQKHaeeD7QFCR6rfNa3uraBygfIATtuOwSN1a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mare de Déu del Carme', '17004700', 'pl. Paulí Torras, s/n, 17840 Sarrià de Ter', '972170794' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004712@xtec.cat', '$2b$10$n8jQjBZaSdN7uWoe7Cbdbui9Yhfgi.53ch.0z72gRf0CX63WiMgAO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Ventijol', '17004712', 'c. Joan Benejam i Vives, 5, 17300 Blanes', '972330701' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004724@xtec.cat', '$2b$10$Y2g.X6kjweDRqsrRzQ8ZTe3L6fQKXJKl3CCUVWo8LlNBgzedzJrfe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Palau', '17004724', 'ctra.Creu de Palau, 43 (Palau-Sacosta), 17003 Girona', '972213939' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004736@xtec.cat', '$2b$10$zFUGik37UlAqdCGByHtQ9.VmhOfunXK9DHvFL1VbQFbUn9AfW3MNm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Els Àngels', '17004736', 'c. Almogàvers, s/n, 17230 Palamós', '972315769' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004748@xtec.cat', '$2b$10$0RL5FOkfsXZ0QQ1IjgYe2u/3bpuUHnNVCRMmhYybqOYJd0cH92.qy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Mare de Déu del Mont', '17004748', 'rda. Molí, 2, 17740 Vilafant', '972513480' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004751@xtec.cat', '$2b$10$L8LdSYj6BcDSLli4QVcjDuYgjOeSdM6S4Ppr9qETGODZ47zZCmuwK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Tomàs Raguer', '17004751', 'av. Comte Guifré, 18-20, 17500 Ripoll', '972702323' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004761@xtec.cat', '$2b$10$T4W2s1JgdDLAH0eeI/5Zd.o0I.ekMrLnJjvYzypcBYC/UAyhwG8tu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Doctor Ramon Suriñach', '17004761', 'av. Comte Guifré, 18-20, 17500 Ripoll', '972714176' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004773@xtec.cat', '$2b$10$4V3LkdTG4OGUPNfFglS/SuW5iu/aHvI8RPCWO0tTuOfNfDKY1Z0v6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música Isaac Albéniz', '17004773', 'ctra. de Barcelona, 70(Casa Ensesa), 17002 Girona', '972200129' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004827@xtec.cat', '$2b$10$CPwGn7kP8IFG0O0PewGw3uO.2PLCScTJ07jUtzKhAypTiYNRAQJDq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Alzina Reclamadora', '17004827', 'pl. dels Països Catalans, 1, 17833 Fontcoberta', '972574271' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004852@xtec.cat', '$2b$10$ViT/u5EPRw9pfhvJlc4xFOcQxeNDdAmq5cLTDX1m3zvHOJYANmuwa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Girona', '17004852', 'c. Josep Viader i Moliner, 16, 17001 Girona', '972219100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004864@xtec.cat', '$2b$10$0vgLl1Hd6KFdKUS3ypR6E.AeaLwW2m.oHwt3acM2jgt36TaqG6p8e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Pla', '17004864', 'pg. Marquès de Camps, 50, 17190 Salt', '972400710' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004876@xtec.cat', '$2b$10$3gB95Upt3SmqYsSWbN7iJuUxJ90hI7QsWixBWfTjDNEYAKuIXvVYu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola l''Olivar Vell', '17004876', 'Veïnat Colomina, s/n, 17255 Begur', '972611990' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004888@xtec.cat', '$2b$10$BzIfXfTKaGFM/JSehhL4QeF/0qvSfKp31iAUhLgb9QIUZMB3tc34K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Cecília - ZER Cerdanya', '17004888', 'c. Estaragalls, s/n, 17539 Bolvir', '972895055' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004891@xtec.cat', '$2b$10$qdoasNPzTicq9sf3QoKF2O91JiSxqiw7PxPoivHCugeB0tP2JMd4a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Pallach', '17004891', 'c. Fossos del Dr. Burgàs, 1, 17600 Figueres', '972509653' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004906@xtec.cat', '$2b$10$7U1CnQ.J22ozSX2bmyppvu8kxd3hpYRsUjW8a4UpTv/Uz5hmK5HnS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Salvador Espriu', '17004906', 'av. Mediterrania, s/n, 17411 Vidreres', '972850808' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004918@xtec.cat', '$2b$10$Oz6s4HA/WhgeCoR9FDsrQuVszpHqlIGv5417XZEodhnIi7TFAwFTm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Montjuïc', '17004918', 'c. Bellpuig, 8-10, 17007 Girona', '972212838' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004943@xtec.cat', '$2b$10$78T3hRpUIBZCjPVhGf3VC.aXApuT5WAQmTl4vmDZ24WRREStFWoPC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montfalgars', '17004943', 'c. Montfalgars, 4, 17006 Girona', '972401976' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004955@xtec.cat', '$2b$10$I.SPSm3AbPtHLLY.WyaOm.OgzvXK/0wEt6glM.sFuFd82DHJT/tve', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pompeu Fabra', '17004955', 'Camí de l''Angel, 6, 17310 Lloret de Mar', '972369215' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7004992@xtec.cat', '$2b$10$BU/z5wxc9psH1rXo8mJ2oOIB3KQgKZ2H4Hmh7DCzYgJXTCNg.Wuc2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària Forestal de Santa Coloma de Farners', '17004992', 'Finca Casa Xifra, 17430 Santa Coloma de Farners', '972841765' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005017@xtec.cat', '$2b$10$SpCoRfHRRmhdF7YLdtGgR.VEoZoOIu7RvPQQN5GaX4TyshtOYmKJ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Quatre Vents', '17005017', 'av. Els Pavos, 54, 17300 Blanes', '972330241' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005029@xtec.cat', '$2b$10$cyeU10GCC6SY519xUd9k9evCWNr0BG4BZn.gUpaTykY8x122nXR/O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Esquirol - ZER Vall de Ter', '17005029', 'av. de les Mines, 13, 17861 Ogassa', '972721315' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005042@xtec.cat', '$2b$10$eVhJEUE2USiXiwDIBWCz9uN7qWyImDm3VthHZaAWerDUrrkpy9zVi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Carles Rahola i Llorens', '17005042', 'c. Joan Miró i Ferrà, 10, 17007 Girona', '972213118' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005182@xtec.cat', '$2b$10$hDHGAb6AKzRPdL3IOK86T.rPkM0Ds9LPTY3DLikOVRKnVTRs1yoyG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Can Puig', '17005182', 'c. Salvador Espriu, s/n, 17820 Banyoles', '972574465' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005200@xtec.cat', '$2b$10$VALk4k81UDefMtypAIzliebc41heyzHVJAF7WCnK2UQAGe.JYUJVm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Aula Musical', '17005200', 'c. Migdia, 45, 17002 Girona', '972210671' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005248@xtec.cat', '$2b$10$sj6KoA0iGLPKFlItz.ju0.KMXTdn3zFP49bCBfzux32Y/kty6HeOC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mas Clarà', '17005248', 'av. Mas Clarà, 23-31, 17100 La Bisbal d''Empordà', '972642910' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005251@xtec.cat', '$2b$10$MpDfADxajHAJPSRwtzU8.uZvweIm30nJi7lvQwyMdPm0e36D8eNke', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut El Pedró', '17005251', 'c. Vilabertran, 2-4, 17130 L''Escala', '972772128' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005261@xtec.cat', '$2b$10$h8xGKzg/x9nRlDvKQskXIOpyS.ZR5LmKkrmbSzhqXZC0rI8fd0v22', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montpalau - ZER El Llierca', '17005261', 'c. Major, 104, 17853 Argelaguer', '972287059' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005297@xtec.cat', '$2b$10$iEvgMoCVuerp.KzYcUBX8Og3397NcI6fiOVtVjUxQq7y7uZUQ80dW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Xavier Montsalvatge', '17005297', 'av. Anselm Clavé, 7, 17800 Olot', '972270044' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005315@xtec.cat', '$2b$10$zqr8/N/4boSEmFBBubVlReSPuG0w.EjolYfgI2ffztMqc62KUtBk6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Palafrugell', '17005315', 'c. Sant Joan, 23, 17200 Palafrugell', '972304215' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005327@xtec.cat', '$2b$10$rgN2M42xs.yPz/t.HOhb/.f3cq.0mqvXDCZTME2pfXmob79Yh0/tu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '17005327', 'Capmany, 23-25, 17220 Sant Feliu de Guíxols', '972821393' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005339@xtec.cat', '$2b$10$HU1dKcn8cDYzdYkltcSCSewdbGG0oGNqIPzWURlE1UJUKNTRZtHeq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Les Bernardes', '17005339', 'c. Sant Dionís, 40-42, 17190 Salt', '972241410' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005340@xtec.cat', '$2b$10$kflpbBWtlS4sz22rg/gH5O.ZNm1Uu55Ef5gVFYi.Rz7ynZ9E1KT4m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EA d''Olot', '17005340', 'c. Pare Antoni Soler, 1-3, 17800 Olot', '972262403' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005352@xtec.cat', '$2b$10$fLXke8WFDK2UGAlX3EtEJebK3UFKtet6a62gi1sluT3EmDkrAmtGS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Palamós', '17005352', 'c. Nàpols, 22, 17230 Palamós', '972602344' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005364@xtec.cat', '$2b$10$.Pc9ZeoAO2OCRE96tRXl1eyBRofxMf1sCeOKCrMjOw2ArLJZoGSrq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Cap Norfeu', '17005364', 'c. Ponent, 15-19, 17480 Roses', '972150567' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005376@xtec.cat', '$2b$10$XNIeRNLFOT4GB3Hlznmq.O6xpztaqowlCNiC0Skvu.QMzIZvkBXoi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Santa Coloma de Farners', '17005376', 'av. Salvador Espriu, s/n, 17430 Santa Coloma de Farners', '972842105' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005388@xtec.cat', '$2b$10$t43Z0qxj3IEfOOIZnOMg8u.cUC8ZsaNM3g.wIEvO1NOcwT67hVLgW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Vallvera', '17005388', 'ptge. de la Fàbrica Tèxtil Coma Cros, 4, 17190 Salt', '972231919' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005391@xtec.cat', '$2b$10$uC0e7AHfCbG2gDRCHtfw9edwYoJH9g2uU41Ue7p7IfYhdio6hlaZm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Jordi', '17005391', 'ctra. de Girona a Fornells(urb.FornellP), 17458 Fornells de la Selva', '972476065' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005406@xtec.cat', '$2b$10$kxnWqIOFFjz9DdKuLPLRieR/v/YECtfLKdEi5p6iSBWoZ3jvB6pTC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Joan Riu', '17005406', 'ctra. de les Planes, s/n, 17150 Sant Gregori', '972428200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005418@xtec.cat', '$2b$10$DNlRp48zYeqwPD86V5qbG.lRF0emB4EczWq3twWYUqB7kQsJjzxsm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música la Flauta Màgica', '17005418', 'c. Colom, 22, 17600 Figueres', '972511798' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005522@xtec.cat', '$2b$10$UcJ/zvcSajxDCkLnedn2z.ceoLdAYj9tkEXVSLAddQ5kpbH6mbMzq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Veïnat', '17005522', 'c. Enric Granados, 8, 17190 Salt', '972400092' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005534@xtec.cat', '$2b$10$ANauxVRT6J4RrBh8zEI0oOZxcqgAD0UkrsLPmpSmAAgjB1bhJcov.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Cucut', '17005534', 'c. de Joan Coromines, s/n, 17160 Anglès', '972423362' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005546@xtec.cat', '$2b$10$oGul.0gxFFxShIPL6bsiEe9nwNQc9C0G56zpHH0UZHPyZj2GX8bSS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '17005546', 'c. Pau Casals, s/n, 17486 Castelló d''Empúries', '972250388' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005558@xtec.cat', '$2b$10$8g5GNofHgJeTiDMTGuuFueem.NDpkUhBXFAXH8Vc4bPeYgoKc/AZu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Baldufa', '17005558', 'c. de les Escoles, s/n - sector El Celrè, 17242 Quart', '972468783' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005561@xtec.cat', '$2b$10$EbUPPHQDH3C1fxirmgMbyu4IsVXUzLogO4uDDdkGbV0cSwIJfKXcu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Belluguets', '17005561', 'c. Escoles, s/n, 17744 Navata', '972565327' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005571@xtec.cat', '$2b$10$wRjtVCOCDa9p6BIHLpurGeM9vv6JD.iPAAmMEHjdhWP.hn1NZmN12', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Tren Petit', '17005571', 'c. de Josep Ma. Folch i Torres, s/n, 17100 La Bisbal d''Empordà', '972641605' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005583@xtec.cat', '$2b$10$FfzUp3qVAA6uQGUBTpWRwOM669FrphGCBPxV2DZXABa3icXZIoAKa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Barrufet', '17005583', 'av. Pau Casals, s/n, 17530 Campdevànol', '972730836' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005601@xtec.cat', '$2b$10$zkw0CdfyN/vedKgVFGf81umLAPV2lfad2lmU1zqf7urOKzUyCClNu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Oreneta', '17005601', 'c. Córdoba, 43, 17220 Sant Feliu de Guíxols', '972823018' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005613@xtec.cat', '$2b$10$hS0ASvP0BCEv0r4jXwJZ6.5g8VXmAhoelj0PmcbS55M58bMPLxI8u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Patufet', '17005613', 'c. Madrenys, 1, 17185 Vilobí d''Onyar', '972473125' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005625@xtec.cat', '$2b$10$8sU5c4QmxYiqlTdOXT46SO0sQC7wGDF/ujtaX81mGaZWXDutzTdT2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ses Falugues', '17005625', 'c. Bonaventura Carreras, 11, 17255 Begur', '972624304' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005637@xtec.cat', '$2b$10$Rbl1Z3vy5Rpy4fcPIbN.su49XHlKlqpdTT34bmE5RtA18kA5dodma', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Terra de Vents', '17005637', 'pl. Nova, 9, 17700 La Jonquera', '972554704' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005649@xtec.cat', '$2b$10$zl4Iro2H9sJd/PWU4oTJc.UEkhMf41RrUFKSKPGFZ0WnUoLLivofK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Cendrassos', '17005649', 'c. Arquitecte Pelai Martinez, 1, 17600 Figueres', '972507908' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005650@xtec.cat', '$2b$10$FzCWMDIpWDRo.Izkc.UID.9dmqR2FjIlNdm2GUL7mWAq4pTbYXmA.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Cassà de la Selva', '17005650', 'c. Josep Pla, s/n, 17244 Cassà de la Selva', '972460630' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005662@xtec.cat', '$2b$10$XL.y3htNARzdPMkeATHLXemZ07eX.eAoXidrMJzfA9.RU/IjvqyvS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Serrallarga', '17005662', 'c. Joan Benejam, 1, 17300 Blanes', '972331005' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005674@xtec.cat', '$2b$10$56cMqzpBxKCFkfK1uMWvweC8/2EXYmJUT5W6PvoLWPStD6/Ami2Wa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '17005674', 'c. Mosquera, 4, 17520 Puigcerdà', '972141250' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005686@xtec.cat', '$2b$10$1GFgUQLU5Et6yQpBXbQ4EeYtOal9r3FXmy1U23Vz5LCohuMk356WO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Bressol', '17005686', 'c. de les Escoles, s/n, 17412 Maçanet de la Selva', '972858849' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005698@xtec.cat', '$2b$10$d5DSY1Us5VUzkcziU/ySWuoJg5p3G6hyf/3SwhHeWkoRIOnyi.DVm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Pins', '17005698', 'Pujada del Castell, s/n, 17600 Figueres', '972503362' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005704@xtec.cat', '$2b$10$5Mw/UnQe/uNy01ckrQzEZeXf0ZsGZIAwHX/a5VlHGFhzrD2jEKvW.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Abat Oliba', '17005704', 'ctra. Barcelona, 57, 17500 Ripoll', '972701150' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005728@xtec.cat', '$2b$10$Dpvod9KD9YTHmAULvmmLZOZLdx0A8zfk6/Vlz.nDnaIcHGhthOIK6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Tomanyí', '17005728', 'c. Sant Ramon, 51, 17200 Palafrugell', '972305576' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005731@xtec.cat', '$2b$10$edummFCqppqrdnsuWT2cLeu.EIji4QPFrQ8nyzyPKMhgYPJbIHT5W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut S''Agulla', '17005731', 'ctra. de Malgrat, 13, 17300 Blanes', '972331460' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005741@xtec.cat', '$2b$10$7Jtgq3aNyaKQVTrLzng1AeaXDXcOrygruNwDGoOcu35BaLyqOVUm.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Pere Borrell', '17005741', 'c. Escoles Pies, 46, 17520 Puigcerdà', '972884642' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005753@xtec.cat', '$2b$10$V2fsG8siTOD9TWUCcTA7qOUtLXOPNFJ43Jdfq7g6nOLK2WAclWoye', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '17005753', 'c. Germans Vila Riera, 7, 17867 Camprodon', '972740137' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005765@xtec.cat', '$2b$10$e.KG1nx6D8Xf4U1gy/VvteoPJ..oQkP8BOPZxRBW4zUhNiMc7CPbK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Lola Anglada', '17005765', 'c. Aiguaviva, s/n, 17310 Lloret de Mar', '972367002' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005777@xtec.cat', '$2b$10$RyCRKUtg2q6iovUEQ5QaHu9txBzPiFlsTJnMywGrBpwvUH0p7gAHq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Quitxalla', '17005777', 'c. Gaudí s/n (Urb. Mallorquines), 17410 Sils', '972853371' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005790@xtec.cat', '$2b$10$w5KxkyJ7rTXdN8llGoQsguEp2rHevPG8JkmdOIVZt9MGtTs0KNo8m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '17005790', 'av. Girona, 39-41, 17457 Riudellots de la Selva', '972477136' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005819@xtec.cat', '$2b$10$H5RxjN3RXFmTW.q0NhfGO.00x88uGOOMN382mPJG2VDfADz2T7soe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Escarlets', '17005819', 'c. Serra i Caballé, s/n, 17150 Sant Gregori', '972428434' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005820@xtec.cat', '$2b$10$keoDFkqegH6v6GTmp7q6fu4tfk7UHLd6DTobvY8X2J5lNaaijAAEu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol La Baldufa', '17005820', 'c. Josep M. Prat, 13-15, 17007 Girona', '972207292' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005832@xtec.cat', '$2b$10$olg/kib7YApH3z6UV83XEeYD.QckJgUkC9ehKL58ZcCxyO8zVNtqy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Cavall Fort', '17005832', 'c. Pruner, 1, 17004 Girona', '972208047' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005844@xtec.cat', '$2b$10$w7bgxG4zvQ12I4.i8Z5ugOc2FEvv8hBMg/FQcpOvJn.nBLeGCTdl.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Castell-Platja d''Aro', '17005844', 'c. Ginesta, 25, 17249 Castell d''Aro, Platja d''Aro i s''Agaró', '972818906' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005856@xtec.cat', '$2b$10$kYlLyxwkCmDImDYyqxM7Re7a1MKXaIq8uvvekbDqtpGYfN4fK5Uti', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Niu', '17005856', 'c. Ganix, 2, 17240 Llagostera', '972831051' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005868@xtec.cat', '$2b$10$1VfWyw9/RdSESUcLXOR.3el7IMv7iaVZ46CC6jxoWrkv0rlqaytGG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ca la Guidó', '17005868', 'c. Lope de Vega, 9, 17300 Blanes', '972351051' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005881@xtec.cat', '$2b$10$O8lbq4tkSEYpPoYOwoBeruwhpvCi9nTrAJrAgEaGzGBcnmhEpmIw6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Pere Màrtir', '17005881', 'c. Clavells, 1 - Circumval·lació Jaume I, 17800 Olot', '972270114' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005893@xtec.cat', '$2b$10$k8lKpGDZTJZlt7PWvYLOEOfIIFOa/esn7BpzUk3H9pZcKy7uPPmSG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Bosc de la Coma', '17005893', 'c. Toledo, s/n, 17800 Olot', '972267012' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005911@xtec.cat', '$2b$10$kU/OCWFmf37wVnvZA2dpNORR3ykinJYCUq.YcuMzMWb/wsuWccycm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ramon Coll i Rodés', '17005911', 'c. Senyora de Rossell, 28-30, 17310 Lloret de Mar', '972370385' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005923@xtec.cat', '$2b$10$hGyAGwYwdfE2aMgLRBCHruK4X.WQmAzz2jl4L.wIQbxOEzfP7DZ8.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Montgrí', '17005923', 'c. Santa Caterina, 137, 17257 Torroella de Montgrí', '972759242' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005947@xtec.cat', '$2b$10$6aR2idAX95wipSau3RJBmO0/von0EXqPKHl6ACRK13Ct53Su70nsi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Cavallet de Mar', '17005947', 'c. Pescadors, 56-58, 17480 Roses', '972254980' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005959@xtec.cat', '$2b$10$uDekY4hnoJzIg.2gT6o4yuIDS3CWzxC8fjqhCvxengCP5YyifNpCW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Barrufets', '17005959', 'c. de les Monges, 8, 17497 Portbou', '972125121' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005960@xtec.cat', '$2b$10$PNzSjw301vhOJWqNMTgAQuOjVi6AouNK7vGjDMtSqc4sAU8EaE4uS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Iscle-Santa Victòria', '17005960', 'c. de l''11 de setembre, 26, 17411 Vidreres', '972850917' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005972@xtec.cat', '$2b$10$Dpgarrl7f/uiu1r16fsSY.XbFB/e1SxRKgC4PUgjX2I384JgCwlbS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Tabalet', '17005972', 'c. Ave Maria, 7, 17430 Santa Coloma de Farners', '972841310' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005984@xtec.cat', '$2b$10$5HGO1F7p2LteJ.HmTr9IrejFEDUvXDktySdoisT3c0Y6UjCCyhHbG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Rajolet de les Preses', '17005984', 'c. Sant Sebastià, 45, 17178 Les Preses', '972693426' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7005996@xtec.cat', '$2b$10$u0Hk4A9KW2M84eCXkXcPLeiXnRKMe/13LmSqLGSACmLeduWngII.i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '17005996', 'c. Josep Pla/Dr. Sobrequès, 17162 Bescanó', '972440363' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006009@xtec.cat', '$2b$10$K58jbFORmh2izujIpLEQN.6RzEeR3FzJIGRY6CA8YERxTEY05c466', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Es Papanell', '17006009', 'c. Vigilant,  2, 17488 Cadaqués', '972159282' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006010@xtec.cat', '$2b$10$lptf1jHwH16fcL5mrky4lOkFwfm3PQxlAf.gEAlkxzzHVTucEWUGq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '17006010', 'c. Roureda, 5, 17172 Les Planes d''Hostoles', '972448041' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006022@xtec.cat', '$2b$10$tvD4tSn4r70Dpv/dQcThc.whKjji6t4XN1H.s.SV.mOraR1RdkSCK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Petit Montseny', '17006022', 'c. Montseny / c. Montnegre, 17400 Breda', '972871374' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006046@xtec.cat', '$2b$10$LXETcKSimtNZCAAbt70HGOpEaGLwZnelq.TEnoT/KwO5DHaQ7LGZ.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Rodamóns', '17006046', 'c. Sant Martí, 43, 17421 Riudarenes', '972856216' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006061@xtec.cat', '$2b$10$hZ9tkmWKV1stUere24vPqOCTrD9ZyJSIHxQRti6eWnqsMhKUKCB1G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal El Guirigall', '17006061', 'Pujada de l''Esglèsia, s/n, 17246 Santa Cristina d''Aro', '972838198' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006071@xtec.cat', '$2b$10$IG0gQxVw8iTBwSy21FfOr.o3WhFJu7y3DyjBickFyjw5pO4LI3iXa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Joan Maragall', '17006071', 'c. Major, 1, 17811 Santa Pau', '972680526' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006083@xtec.cat', '$2b$10$LTAGhCNpCwOOQlFPsdTj4OuUgyjFfvCLx7ELYR1Kt8uAX6PC522Ne', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Castelló d''Empúries', '17006083', 'c. Santa Clara, 55, 17486 Castelló d''Empúries', '972250768' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006101@xtec.cat', '$2b$10$jZyncK8W8qFWkQJUmXO/DeuGa9Y2NAS4Hbb9TGTW5Qgu8Wg8/uQh2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Petits Mariners', '17006101', 'pça. Sant Joan, 1, 17320 Tossa de Mar', '972341166' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006113@xtec.cat', '$2b$10$oKZ9h9R8sh9mEpQ0ZAsoGu3qKsAgjN4RafOMSLYp64CkqCB54lwXO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal Castellet', '17006113', 'c. dels afores, s/n, 17856 Castellfollit de la Roca', '972294003' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006149@xtec.cat', '$2b$10$BF52rQdCEyfhHJJMgDq3nORcIA.yY.4cfhY83V7gBRthEBBXSKuxy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Mar i Cel', '17006149', 'c. Eivissa, 30, 17258 Torroella de Montgrí', '972751917' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006150@xtec.cat', '$2b$10$c9i3V.3ztT6IyXDsJxGsSOZ3gdVuSRshgaCDIC1G0htoVJhz2fcUa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Marta Coll', '17006150', 'pl. del Sol, 3, 17600 Figueres', '972506123' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006162@xtec.cat', '$2b$10$xLCNYQ3IYIx0S9n5ywZIN.dgPTBS4QrEJoDZ0v1CsSLuwLLPfYxqS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa L''Esclat', '17006162', 'c. Esperança, 87, baixos, 17300 Blanes', '972331463' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006186@xtec.cat', '$2b$10$rt6X5luxWP4jET/ky8cU/.IXrsF85kl/i8KmRbECuMC.UJpG1T9J.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Maribel Bover i Viñals', '17006186', 'rda. del Pare Claret, 30, baixos, 17001 Girona', '972214638' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006198@xtec.cat', '$2b$10$QIt.CfT/VLEr9//Wwl3G1ueXycxo.xTPv3ZYlDBoGlUc0anPQ4G4u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa M. Mercedes Ribera', '17006198', 'c. Dr. Ametller, 8 baixos, 17003 Girona', '972222830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006216@xtec.cat', '$2b$10$JRPY2A2kNED4/r60vi4cPushuPTInuw7Oj0jOrqZow.OQjFGp8mtq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Roc', '17006216', 'c. Sant Feliu, 60, 17800 Olot', '972265891' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006228@xtec.cat', '$2b$10$0rSB02C6WN0e4KWzrtVLsOCJxxAc5WdyzJJcatC0QH2iUQp6zaLMS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Ramon Nonat', '17006228', 'Pujada Montjuïc, s/n, 17007 Girona', '972203084' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006231@xtec.cat', '$2b$10$qisBPc5H3Ld9n4AEpWpR/.xkBiy6vV5sIBX2CtHDlkr6pkWo7pfyi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Tarlà', '17006231', 'c. Sant Sebastià, 45, 17005 Girona', '972238219' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006241@xtec.cat', '$2b$10$5biS.kX4JbMRoJfkTXVfhewQqHm1qI23tcsQ/WJ9Hhp2jvHIuP6Uu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Mare de Déu de Núria', '17006241', 'av. Comte Guifré, s/n, 17500 Ripoll', '972701554' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006253@xtec.cat', '$2b$10$Lpx6JU7KI6Wng8hfqkqiwOdZdzBXYL.cvHPBe64LdI/R034RMD1Eq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Carrilet', '17006253', 'c. Folch i Torras, 3, 17170 Amer', '972430049' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006290@xtec.cat', '$2b$10$QYku7gRuaW/6sb2Seiw/pOjuJp8sAy6Uo.A3UwVdN5fNtQX4OqjS6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada L''Avet', '17006290', 'c. República Argentina, 17800 Olot', '972269109' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006332@xtec.cat', '$2b$10$CfW.XscBD49.TvTpVGJ/Zu2rgAve9U4nWzsy/jhj9Bl2D3B4SA1MS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada L''Esquirol', '17006332', 'c. Mare de Déu del Mont, 22, 17005 Girona', '972239830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006344@xtec.cat', '$2b$10$m/q3rH7irS8FT7DdX8QiteGjUbdIC73FeUepbiAmsRMPQtsElI8Be', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'L''Estel', '17006344', 'c. Orient, 10, 17005 Girona', '972230960' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006371@xtec.cat', '$2b$10$rn5NCT492HvvqhX4oP.o3Og7spigUqPnKeN0j3mkmbK1sHq1lEew6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Barrufets', '17006371', 'c. Cervantes, 26, 17190 Salt', '972231299' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006393@xtec.cat', '$2b$10$sTSL2XdtslWM4OlPqJHk2.DYOzq0nmweUTVU0JMSdgZD6Y1tfQOKG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Petit Príncep', '17006393', 'c. Montseny, 12-14, baixos, 17190 Salt', '972236559' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006435@xtec.cat', '$2b$10$jgCbVbmfvGFNgs04Et2Hxuxe7/hxujaOzu5QAxZiurZCG/fbC4cJe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Bambi', '17006435', 'c. Montferrant, 13, 17300 Blanes', '972336499' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006502@xtec.cat', '$2b$10$pQjv4sLi79x/VkrYLWdg6uBtpPZM.OzWLb.A3bmUZfWN2lnDuAYrC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Patufets', '17006502', 'c. Ponent, 45, 17820 Banyoles', '972573603' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006587@xtec.cat', '$2b$10$W3k8DRnTjUkAaTaL9OQtKOOY9dZ9h244NHR/U08LCKZvoweejzb2C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Montessori-Palau', '17006587', 'c. Sant Antoni, 43, 17257 Torroella de Montgrí', '972758223' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006605@xtec.cat', '$2b$10$QL5SOiVb8ndsxB3Hx/T5JOTRbwVPDj9tVbsVedamc3575H8UitzCK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Montsoriu', '17006605', 'av. Dr. Carulla, s/n, 17401 Arbúcies', '972860154' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006666@xtec.cat', '$2b$10$F2ZccRdB5TdEzffSdfFK0Odhg2ykUJcOXqnm8PKrvyPv/HvZoEJN.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Pla de l''Estany', '17006666', 'c. Jaume Farriol i Montserrat, 31, 17820 Banyoles', '972580793' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006681@xtec.cat', '$2b$10$yLyhdGKD6EhXT5LiRoTr9ep112LldixbzRPBX2PhS7T5/Aqr2Q4Lm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Germans Vila-Riera', '17006681', 'ctra. de Molló, s/n, 17867 Camprodon', '972740761' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006691@xtec.cat', '$2b$10$rZbEyBpRdZMmP18SQu7F8u7b4pSxsGAe/jXDEq1TRnXGLu0iQhkUm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ridaura', '17006691', 'c. Amadeu Vives, 42, 17249 Castell d''Aro, Platja d''Aro i s''Agaró', '972817830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006708@xtec.cat', '$2b$10$BG/RxAOvOTh8IZyW1Be/JuWlix254dQVRWdgm0bE9bQ50hW2VIHV6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Celrà', '17006708', 'c. Països Catalans, s/n, 17460 Celrà', '972492405' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006711@xtec.cat', '$2b$10$EpeyB17Yqj7EKjlXAgiwH.lrkHjGfPuvLRXL6xR/ijSlTHPa2p5ta', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola M. Àngels Anglada', '17006711', 'c. Nou, 211, 17600 Figueres', '972507563' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006721@xtec.cat', '$2b$10$sZH8N7kuaIa/nWiNEQc9yOI.cEKIiTFraojIfkNf73NwevBCQtlb.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marta Mata', '17006721', 'c. Joaquim Riera i Bertran, 18, 17003 Girona', '972396523' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006733@xtec.cat', '$2b$10$.mMVjHHQ5L1QzbN65m2d9ebpBVj/1gunlaKCBBz2evFTEpYzoU4sy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Vescomtat de Cabrera', '17006733', 'pl. Catalunya, 1, 17850 Hostalric', '972864987' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006745@xtec.cat', '$2b$10$FHmOyY.SXOfrpVWbSKGqR.qd0UrvD6Y5m7Qa1BVZPp7oAXtjBzySq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de La Jonquera', '17006745', 'c. de Lluís Companys, s/n, 17700 La Jonquera', '972554440' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006757@xtec.cat', '$2b$10$ioNnELk5OspGZq0MRYDlV.oW7JKjRmuAJQ.IhTJRQAveplFcl3gQm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Llagostera', '17006757', 'av. del Gironès, 51, 17240 Llagostera', '972831593' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006769@xtec.cat', '$2b$10$gJaJXBR6j9NHEwk0ZdEe.uulOLM2WB4C2BjC7DeQdsCSOe9dVvu.q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Llançà', '17006769', 'c. Vuit de març, s/n, 17490 Llançà', '972121489' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006770@xtec.cat', '$2b$10$FoAJVc1vGdpt1SIT2tQBRuGLvFrtriVC3Xcq5lwlbG0QIA2AHCqEy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Rocagrossa', '17006770', 'c. Rosa Sensat, 1-11, 17310 Lloret de Mar', '972367489' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006782@xtec.cat', '$2b$10$a/plUNOooetEL0KOGqVsCuy/PtYReJLvMo6Bp/gIRvqGLFcwcUTQG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carrilet', '17006782', 'pl. Narcisa Oliver i Deulofeu, s/n, 17200 Palafrugell', '972306765' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006800@xtec.cat', '$2b$10$y/4yDNs3tbJ7r6tYz04v3epPHVa8iTrxlKJZHeTgAgSDst.uhHhdu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Grecs', '17006800', 'c. Bernat Desclot, 12, 17480 Roses', '972152520' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006812@xtec.cat', '$2b$10$7OlgKvc55zOV/7aGtE4Xguc6LbC7tCw7Bf.u5umcQQ9lrszH1cJMS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Tossa de Mar', '17006812', 'av. Catalunya, s/n, 17320 Tossa de Mar', '972342578' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006824@xtec.cat', '$2b$10$4rBM/woKhrv0hSFFgSU/J.akxe0rC0Mq8PjgAEPgT2Dh.IRNAoReO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Vidreres', '17006824', 'c. de l''Institut, s/n, 17411 Vidreres', '972850711' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006836@xtec.cat', '$2b$10$7CRJ4Vqy7mLFS/RmWvM8A.vCXSyut4PH9eU.YoU6vzaryH5SBZxzS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Mèlies', '17006836', 'c. Les Comes, 5, 17740 Vilafant', '972510742' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006851@xtec.cat', '$2b$10$EgSfgj6T1SgLXPWXiuSnWO7snbrF7b23I005TUSeUYJr5/3sS8hla', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Illa de Rodes', '17006851', 'ctra. de les Arenes, 57, 17480 Roses', '972154383' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006861@xtec.cat', '$2b$10$clZIH9IqL.dB75Vm2uSOeeoelFQmffznkAl53z4YXf3v9CrwJxk9q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Taps', '17006861', 'pl. Xesco Boix, s/n, 17244 Cassà de la Selva', '972460229' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006873@xtec.cat', '$2b$10$6OlUP6HxXTin8jM.c.Rh6eWJ93oX7JC8TWa39S4Z2BLhBnrroYdpu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Castellum', '17006873', 'c. Bondia, 1, 17481 Sant Julià de Ramis', '972171646' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006903@xtec.cat', '$2b$10$/QpntymCLw4opGU4zLwdA.PN9k5Edyl9eDziDq9pj5nZLku/Q00w2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Niu', '17006903', 'c. Castanyer, 4, 17857 Sant Joan les Fonts', '972290130' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006939@xtec.cat', '$2b$10$3z/1xKqpv9AqHZOXSIE7OOeGHriAxeveE0SuqaxMxJoQGqbKtrSKe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Santa Eugènia', '17006939', 'c. Enric Marquès i Ribalta, 3, 17006 Girona', '972230111' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006940@xtec.cat', '$2b$10$ePz6mKELlHY6NIdA3X0t3eqUDWdEqg2ig5.jlwzDLreSvpbvAOT2K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Lliurona', '17006940', 'Veïnat Massanella, 17733 Albanyà', '972980673' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006952@xtec.cat', '$2b$10$2Gb6DE3a5jn9uetktGGVkueksAUsv4TKiZQ2.zYCZAWE5tLZweIeS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Draga', '17006952', 'pg. Lluís Maria Vidal, 32-42, 17820 Banyoles', '972572356' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006976@xtec.cat', '$2b$10$0wm8E1aqU2LpcX.9cNOcHe2mTlE0ZAn5kH5zj4zGt24CePCbfAb/O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sol Solet', '17006976', 'ctra. Plantadís, s/n, 17165 La Cellera de Ter', '972421510' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7006988@xtec.cat', '$2b$10$0LmFX9RJP24VKMoLntEK5./2IC7V330u27p9s5uhCFyRrmNyEDRNO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Narcís Monturiol', '17006988', 'c. Pere III, 48-50, 17600 Figueres', '972502025' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007014@xtec.cat', '$2b$10$or5e3ftQPkELCbL0Ac7EtO0iHC3GQF5B/6pNJytlRQsgsJVz6LR6O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Lloret de Mar', '17007014', 'p. Pere Torrent, s/n, 17310 Lloret de Mar', '972362020' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007026@xtec.cat', '$2b$10$YDE4uEz9jkYn4eToR5d1O.1R6EHINzIgCiZgh8MhPxEwYL.drPF.W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal El Gavià', '17007026', 'c. Cargol, 1, 17130 L''Escala', '972771556' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007041@xtec.cat', '$2b$10$SVC36P8D4/6hIAr3o.5dBuYQxX3b6QOZA97YHzAihozzo9WUS5b0u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Harmonia', '17007041', 'pl. Clarà, 4, entl, 17800 Olot', '972260720' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007117@xtec.cat', '$2b$10$g5OE77Lkw0jeNcNKokF/oOtQ9I5tHLyVva.soA5zrusR.peGQVfUi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '17007117', 'c. Pescadors, 4, 17250 Castell d''Aro, Platja d''Aro i s''Agaró', '972817196' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007129@xtec.cat', '$2b$10$955c55L2rjMyon4bIkQT3emuC81Ff4N1GVBGgeJCBxiSp.7Vijbj2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Es Piteus', '17007129', 'c. les Alberes, 7, 17300 Blanes', '972350918' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007130@xtec.cat', '$2b$10$j0GLlQhYYNdXv/USlwjvAuDFK4HnnxYNnjp7TFumPJ6S19kB8ucrC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA de Roses(EMFAR)', '17007130', 'pl. Pep Ventura, s/n, 17480 Roses', '972256144' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007142@xtec.cat', '$2b$10$HLV.yOP9kxM3WfMRTZokWe6aE36U1WwvjQhe1h1XnbCM5vDwPttYW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Torroella de Montgrí', '17007142', 'c. Onze de Setembre, 2, 17257 Torroella de Montgrí', '972755144' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007178@xtec.cat', '$2b$10$bI85UID/un0y4kvGtYbWTewsFwbXZwxSqhNItmopCgg2qF7UrV1Mq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Maria Verdaguer', '17007178', 'c. Avinyonet, 38, 17600 Figueres', '972673069' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007181@xtec.cat', '$2b$10$JokAJoEtXWwVbYzyFb/b6.C4zmpO.rVJCM0d40inYzVTekk5Nu4MG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Girona', '17007181', 'Travessia de la Creu, 1-3, 17002 Girona', '972228820' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007211@xtec.cat', '$2b$10$M8aHhgSbl614VlSbLm9YHuYVzwZxeqc3ETn4WWUHDPJE71FRiFiqa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA de Sant Hilari Sacalm', '17007211', 'pl. Doctor Gravalosa, s/n,Casa de Cult., 17403 Sant Hilari Sacalm', '972868656' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007245@xtec.cat', '$2b$10$2bkg9KvWo0YtwvcNmn.dg.nKr/VV.KmtuknA.gOJXoROs2Zbqhqde', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Les Baldufes', '17007245', 'av. Santa Coloma, 87, 17800 Olot', '972271644' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007300@xtec.cat', '$2b$10$69mkALHPcpBwGqw7eiuJluTlqFv4aTZLTBqJ4AIxiMQ.SqzYA.SNm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Bisbal', '17007300', 'c. Eusebi Díaz Costa, 16-38, 17100 La Bisbal d''Empordà', '972640016' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007312@xtec.cat', '$2b$10$/DsafREf3e7McxdstAGXMOspW/KwZP8J4VJTJhzJczwojC8W/QOry', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA de Palamós', '17007312', 'c. Salvador Albert i Pey, 3, 17230 Palamós', '972600810' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007324@xtec.cat', '$2b$10$tNyeNdzDA1ZoR7t.L0LpcuNtJhUKHrZdSOUrYM36DCCS4.tFzAj9O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Girona', '17007324', 'ctra. Barcelona, 70 (Casa Ensesa), 17002 Girona', '972210030' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007351@xtec.cat', '$2b$10$lC/H.sRUVf.N8F1CB6jE.OqJomh9mTjQ8H0AXMB/uNVZSaivdMRTy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Cel Blau', '17007351', 'c. Castell de Requesens, 11-13 baixos, 17003 Girona', '972411441' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007579@xtec.cat', '$2b$10$OveYtcsd.RstuTRIjh60dOCasuidO7SqDuGyioJa3SKCJvr00JCe6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Trapelles', '17007579', 'c. Isidre Rosell Gimbernat, 60, 17460 Celrà', '972492452' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007580@xtec.cat', '$2b$10$74Izo18daLlnRCclHOoM/OJPpqooqlBs5lhx7k94ppg8L7X37/XKa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA de Calonge', '17007580', 'pl. Major, 2, 17251 Calonge i Sant Antoni', '972660476' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007609@xtec.cat', '$2b$10$nmf2H9XJZpyz0cmvyIab3uVJbg9whoFLDaS/TdeUqeaUW6FflhRWe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Olivar Gran', '17007609', 'av. Maria Àngels Anglada, 11, 17600 Figueres', '972504562' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007634@xtec.cat', '$2b$10$LyJWAQB9cI1K21a7wPOy9.YiARBemuHJP4vVl.AC0Py0Mb5YYksa.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Sol Solet', '17007634', 'av. Salvador Dalí, 5, 17600 Figueres', '972510304' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007646@xtec.cat', '$2b$10$8IdFSHJMuYDwbyt08ngQ5edelO6wewoUuALvX299QPVfTmOeS0jBW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Maristes La Caseta dels Infants', '17007646', 'c. Güell, 55-57, 17001 Girona', '972221737' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007658@xtec.cat', '$2b$10$bE9ERJaAnb9B3yWoPsg2S.SWNUnq4ltv3Y3pIsYb0vqu9lgTIwnPm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Sant Feliu de Guíxols', '17007658', 'pl.Salvador Espriu (C.cívic Vilatargues), 17220 Sant Feliu de Guíxols', '972821022' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007661@xtec.cat', '$2b$10$LCp1SkVvlbDW8sgnA2TdJ.fmhT0Rf6Wj4qBXDsIoGCytwjnk4eK/W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Josep Carbó', '17007661', 'c. de Sant Sebastià, 91-93, 17430 Santa Coloma de Farners', '972842365' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007671@xtec.cat', '$2b$10$mptKxveaGr2UhcEFwQ91QO5P26aLfa0l16hTWnR5iG.Kr5237XT9S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA La Garrotxa', '17007671', 'Av. de l''Estació, 13, 17800 Olot', '972271445' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007725@xtec.cat', '$2b$10$/cCCEF/wKmWCDNmr6IcnautMX445Cy/2f6EaGOmSZS/Joft.iwZd.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Treball del Ripollès', '17007725', 'av. Eduard Soler, 1, 17500 Ripoll', '972701131' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007749@xtec.cat', '$2b$10$GX8aATn.p3MYnefxTLmj7.Dk6v3n2PDssdyvVUJVfocJd1jPeFeOW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Issi Fabra', '17007749', 'c. Pere Borrell, 6 (Torre Font), 17520 Puigcerdà', '972881426' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007750@xtec.cat', '$2b$10$iJ4HITenM4OWBa..VApHTuKvUTPH0fs1i.H1pmO92G/hJFXuL/st6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música del Gironès', '17007750', 'c. del Sac, 4-5, 17003 Girona', '972213262' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007762@xtec.cat', '$2b$10$LFRLItenAvfQE/.rzN0Uhu8JQwiFJ11WpE9y5wECek6y1jOIXSH/e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants 7 pometes', '17007762', 'c. Muga, s/n, 17740 Vilafant', '972675946' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007804@xtec.cat', '$2b$10$S/2NYPiqZjFa4WXCss9bP.m9AGdhv.Xe9JwkVeVpnOa7MHrxZ563G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Mainada', '17007804', 'c. Filadors, 10, 17300 Blanes', '972352044' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007828@xtec.cat', '$2b$10$5DCAprgfy0KgIJ0rcRS/TOVfkZ214RLorblNB/EGX0BaaRKLO0EFq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pinya de Rosa', '17007828', 'c. Rubén Darío, 12, 17300 Blanes', '972336615' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007831@xtec.cat', '$2b$10$v4LJKSRrB06HbI2Mc2oLdujnpF59vby24aWXySQzRw84LYAXs4TXm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Trapelles', '17007831', 'c. Escoles de Miànegues, 40, 17834 Porqueres', '972574904' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007841@xtec.cat', '$2b$10$yjQziS0WQrbBIor7mgXA1uNwtxwSQu1l9d1snmsOaGr3ks3ECwHEG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Anselm Viola', '17007841', 'c. Onze de setembre, 2/Sant Agustí, 13, 17257 Torroella de Montgrí', '972760087' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007853@xtec.cat', '$2b$10$8Tgb13KyF7oZJMHpkpQuI.aH.EDOlSd5tR1A8o4aogeHVStQxWf6G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Miquel', '17007853', 'c. Circumval·lació Jaume I, s/n, 17800 Olot', '972265766' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007865@xtec.cat', '$2b$10$xS0b24n4l/is.1iEbKxfEuNYV3wQoFwDwzxu8DkGz0LeF/tTtm1le', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Sant Esteve d''En Bas', '17007865', 'c. Fernando Laparte, 29, 17176 La Vall d''en Bas', '972690486' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007890@xtec.cat', '$2b$10$mR8A0tZ2pjIrdabjAlOZdeWETMKgQsYqVVIXNWufDcNBebBfxGjG.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Municipal de Celrà', '17007890', 'c. Països Catalans, s/n, 17460 Celrà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007907@xtec.cat', '$2b$10$BQNZjE3k6d8uxkI3oZx5qO4EA88OqvJy2dMbT/IkG6u0NheJE2a0W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joana d''Empúries', '17007907', 'ctra. Palau Saverdera, 3, 17486 Castelló d''Empúries', '972158606' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007919@xtec.cat', '$2b$10$YCmwr1GyTaXpasu4WTJ9kObPwgJFw4IsSww5q..e7qufWoOIkPVTO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mas Masó', '17007919', 'c. de Pep Ventura, 1, 17190 Salt', '972941382' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007920@xtec.cat', '$2b$10$ScLS.sgOd.w6.w/obSbFN.WtYUNU1/48rPBJhYNk0A7s7g9fnWNJi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'AH Hospital Universitari Josep Trueta - AH', '17007920', 'av. de França, s/n, 17007 Girona', '972940200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007932@xtec.cat', '$2b$10$joWZYjL47szVajrNdd6wqO/7Pt5wCDfDSiIYJnk7CjjmdULG1GY6a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada La Nina de Drap', '17007932', 'c. Escultor Amadeu, 6, 17800 Olot', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007944@xtec.cat', '$2b$10$99H9DLInvihVR36VV8Bs.eTSuqkV8664ag63aM3s4BuYnpx6bXqcy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Paitides', '17007944', 'c. Migdia, 1 baixos, 17406 Viladrau', '938848062' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007956@xtec.cat', '$2b$10$FRBs63zpF8J0vWKZP4heOObSHMXJaTbCrHtl3McaRMaiW9od0jrqi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Verges', '17007956', 'c. Escoles, 1/ Pedró, 1, 17142 Verges', '972780582' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007968@xtec.cat', '$2b$10$ttxuHU5X4pNXZ3z.K5Mq.eHkQ00QqOeF.XKU/7guHTFM7eMisWtoW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'ETG', '17007968', 'ctra. Barcelona, 199, 17005 Girona', '972208316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007981@xtec.cat', '$2b$10$A7sSeJIbW5nRriDA.5Y.nOFW9JcjmPeJY6ieSbFrHbMfwqEpFkaKa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI d''Olot', '17007981', 'av. Sant Joan de les Abadesses, 20-22, 17800 Olot', '972262108' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7007993@xtec.cat', '$2b$10$CNajYy9/1AmAzGG6WZxQkOuEZARKZYSuBT7kzdik2q8khAqnwY50O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CESI Alta Formació', '17007993', 'pl. President Terradellas, s/n, 17600 Figueres', '972509640' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008006@xtec.cat', '$2b$10$qCIfyl0XpZui2MMJJLY9J.nb4CJV8u.daNkIdAQVEnOTdZFjrds.W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Amistat', '17008006', 'c. Apel·les Mestres, 2, 17600 Figueres', '972502683' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008018@xtec.cat', '$2b$10$EUyCZGMIaLYIqvKtpK8mtu/LkRlZOGayzfj3meZxGFNqfrX/Ow2j6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ardenya', '17008018', 'c. Pere Pascual, 9-27, 17220 Sant Feliu de Guíxols', '972328013' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008031@xtec.cat', '$2b$10$OA3gSDZG55jN7WhPCRBzvupBgtWO1/W1D7q9ME2uET8wZoEuufo3.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Muntanyeta', '17008031', 'c. Mas Bohera, s/n, 17495 Palau-saverdera', '972530268' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008043@xtec.cat', '$2b$10$rWOSDqOagafhZJjo/kGatuUj6PTmGzz.z.4Noxr3jPhcHkRqfAmZ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de la Canya', '17008043', 'c. de Fco. de Goya/Lluís de Bolós, 17813 La Vall de Bianya', '972290611' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008055@xtec.cat', '$2b$10$n9rKfoiuA6agJ7AU34yzhu1jdeV5FNrFCG4TSq6VZeoA/HM2ZWjPO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Patinet', '17008055', 'c. Zona Les Esplanes, s/n, 17490 Llançà', '972121077' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008067@xtec.cat', '$2b$10$TnqrwzOv.hB1/iushPPi1ePC8oDELHSBYU3rBTArmr55wkSzRWT8S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ballmanetes', '17008067', 'c. Joan Gich, 2, 17707 Agullana', '972535580' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008079@xtec.cat', '$2b$10$IDHeuWR9blqUFHYBumMkLOxPktFzbzA049Q54sdI0YplklkGdu3CO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Solets', '17008079', 'c. de les Escoles, 4, 17832 Esponellà', '972597237' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008080@xtec.cat', '$2b$10$28NdU4PdIqd4JHWf8t.1qemyK8ncx9xbawCGAOds3WIc8841qaEt6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àngels Alemany i Boris', '17008080', 'c. Josep Pla i Casadevall, 4-10, 17310 Lloret de Mar', '972377070' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008092@xtec.cat', '$2b$10$6NOskITzyJaEwKVPgYnlzORb.LlTOJJvF7L9EMfIk/zqw8PH2HKJS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Patufet', '17008092', 'c. Balmes, 1, 17850 Hostalric', '972864435' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008109@xtec.cat', '$2b$10$2UQxOXGP3b4f5ql/GLHFW.uPl7MaHpbx2KJCzxUrhBFUC1yP.j2b.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Jordi 2', '17008109', 'c. Josep Pla, 15-17 (Urb. Fornells Park), 17458 Fornells de la Selva', '972476065' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008110@xtec.cat', '$2b$10$LKWRfXStj1mmXIa6coyn7egO4htpeInla/5bXBELdSlTittI2Jm0O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Sant Feliu de Guíxols', '17008110', 'c. del Canigó, 41, 17220 Sant Feliu de Guíxols', '972821646' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008122@xtec.cat', '$2b$10$4V1a4bvbjUxF3htpvizZUuQrHkzCeGkShtCjRhpkZyrJ49nXlYY5.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Blanes', '17008122', 'c. Jaume Arcelós, 7, 17300 Blanes', '972331345' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008134@xtec.cat', '$2b$10$GsQv8ES1Azue20G4.YoByeC7W83/ls/rbBfBviVW72GDVPX9Z1iQm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Figueres', '17008134', 'Ronda Sud, 3, 17600 Figueres', '972512124' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008146@xtec.cat', '$2b$10$muOJMOhfnXdwRvlUSg8zWuY9Q4vnxu0e8wdqwZgH3wjSziYTHI4DO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Palafrugell', '17008146', 'c. del Bruguerol, 12, 17200 Palafrugell', '972981917' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008158@xtec.cat', '$2b$10$oGsLF8cNT9tR70mejVZsUeAQL4f7.aCelneNJhbHtBOx18UUO9cWW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de La Jonquera', '17008158', 'c. Major, 2, 17700 La Jonquera', '972555713' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008161@xtec.cat', '$2b$10$IXq/lH69oTWGz4QJdnZIYuhA3mzmpvgSaQiaN2KEEwTCmYtXooYRS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'HDA Hospital de Dia Santa Caterina - HDA', '17008161', 'Dr. Castany, s/n (Parc Els Til·lers), 17190 Salt', '972182515' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008171@xtec.cat', '$2b$10$6z7/0SBKSR1Ls2bO.xoHeu1cVFhx0GFdpJ/9A2Qnj694tFzjXlbAm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Lledoner', '17008171', 'c. Sant Dionís, 25, 17190 Salt', '972238388' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008183@xtec.cat', '$2b$10$6g9CiFXBmr2G0Htg1otrq.mLBDZe/i8kVRiK3fsFTabWqRzn7cWGy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Caldes de Malavella', '17008183', 'ctra. de Llagostera/c. Garrotxa, 17455 Caldes de Malavella', '972471038' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008195@xtec.cat', '$2b$10$PIYFiG6qnHsq.CWfhmSUP.xEZysG1loftlpt83zQ6PcR5AaxISrim', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Palmera', '17008195', 'ptge. de les Escoles, s/n, 17251 Calonge i Sant Antoni', '972652139' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008201@xtec.cat', '$2b$10$YS9I/.2renYYBssl02eLteWgmqVWIYGr2tr7K8Jpv9n0CCGoZtiXC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Vall-llobrega', '17008201', 'c. del Raval de Baix, s/n, 17253 Vall-llobrega', '972314325' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008213@xtec.cat', '$2b$10$bx8EUc3LqtEVMg/0U.87GuvoZ771tq0OMjyioTh4wbtIWuUVZmUFm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Confetti', '17008213', 'pg. Mossen Cinto Verdaguer, 1, 17840 Sarrià de Ter', '972171600' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008237@xtec.cat', '$2b$10$PMJiCTSH5DnyNufgLa4DUea3Pkp3bFEUriMynTCAT8VXeAo/1rz/m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montserrat Vayreda', '17008237', 'rda. de Dalt, 27-31, 17480 Roses', '972458083' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008249@xtec.cat', '$2b$10$6PWiEdXXH1uPUFKZh2zSz.tX.Xo/LnbIbUvYLvoUyb05hm.mpWIle', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Castell de Farners', '17008249', 'c. Sorrai, s/n, 17430 Santa Coloma de Farners', '972877535' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008250@xtec.cat', '$2b$10$DKaATfHXyoQmaPnWmHx1g..2QIhEKjKNK8QvIkMLKXP5iT2rClRQu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Coloraines', '17008250', 'c. de Mercè Roura i Duran, s/n, 17458 Fornells de la Selva', '972476439' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008274@xtec.cat', '$2b$10$TyIaO45zG.cVwf8M.k5VFe0/xsUc2ami11DCaNh0rROoTQdyTsM5W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sa Forcanera', '17008274', 'av. de la Pau, 31, 17300 Blanes', '972353629' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008286@xtec.cat', '$2b$10$YvivJljq7iU3F3CwWlJ2EuGxNbNSjR4iqrswTsrUFHqdaL.KU1xTS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Domeny', '17008286', 'c. Roberto Bolaño, 2, 17007 Girona', '972415259' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008298@xtec.cat', '$2b$10$lDOSg5DQ99Ns7tEqtxkmYuBfxwcuQmjP3U4Uhftw1Dqc2k05Zkphq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Gegant del Rec', '17008298', 'ptge. de Joan Güell Olivé, 1, 17190 Salt', '972232127' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008304@xtec.cat', '$2b$10$IE1pGh7WD725Urho9FV/4uxLGdpypUrNZ5DhvIQEfdpd9r1FIFaCm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Bon Pastor', '17008304', 'c. del Doctor Barraquer, 2, 17600 Figueres', '972502957' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008316@xtec.cat', '$2b$10$dTGuiqdeo3Mvr2jL8vmjLuyVkv3.DE41wYJro4RLyoFVFzA5WusEK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Riells i Viabrea', '17008316', 'av. de la Moreneta, s/n, 17404 Riells i Viabrea', '938470375' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008328@xtec.cat', '$2b$10$AS9e.R2Rwq10iMq7UIBrVeoAEH2kBIFtHEK7WjY3e1V4z5lWn4o.y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Girasol', '17008328', 'c. Torres Jonama, s/n, 17253 Mont-ras', '972305030' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008331@xtec.cat', '$2b$10$bJpP3TCFSP2LZeG.o7DzMejA4TPiDUwZJNxdscD7R7psDZ4sjGDVe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Pont', '17008331', 'c. de les Illes Filipines, 8, 17007 Girona', '972200528' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008341@xtec.cat', '$2b$10$O68eTcfbobhXzpgqPWaoAOe2fdk.WdfZ/OgA.XEikez4WGZxVtUW6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Vidreres', '17008341', 'c. Orient, 122, 17411 Vidreres', '972850067' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008353@xtec.cat', '$2b$10$kj2INnI1AtrtqW8r043ewODv3h2pUf/wfBcWIt//38UF1tjRUDl8i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Ullastret', '17008353', 'c. Tramuntana, s/n, 17114 Ullastret', '972757767' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008365@xtec.cat', '$2b$10$JAbzV/wek0OegK/V7O8TSubsJgvFy8cy6oTQlsLDgGKu9kKlGPIOi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Pla de l''Estany', '17008365', 'c. Pere Alsius, 10-14, 17820 Banyoles', '972571080' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008377@xtec.cat', '$2b$10$LGT.CAk5mNp2bxN1hxE8luCDonqNvnAcDfVlfnF5b87JTIMXvIlw6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Ripollès', '17008377', 'ctra. de Barcelona, 57, 17500 Ripoll', '972703211' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008389@xtec.cat', '$2b$10$n.oKsHBA/SK6gKgGI.bYHuxOSE8XVgFr.wPxf6t17IHtmIciIkj8i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA La Selva', '17008389', 'c. Ave Maria, 7, 17430 Santa Coloma de Farners', '972840262' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008390@xtec.cat', '$2b$10$flgAqgji6jNCtx.mwXBfr.CkanWFRhisAaDCUELehvrBuFVeI1wiG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Vilafant', '17008390', 'c. Pla de l''Estany, s/n, 17740 Vilafant', '972508285' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008407@xtec.cat', '$2b$10$f7ljfKi8GdS.3oejLaBV5OOGVhluTutVx9riSbUJ2cLkjnCl1lAnK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Salvador Sunyer i Aimeric', '17008407', 'c. de Miquel Martí i Pol, s/n, 17190 Salt', '972234975' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008419@xtec.cat', '$2b$10$kz5F1qsQtkfiWiuwhRNQj.JhOrSOPSFKsaEw9VHXsJdGBhP.yS6.S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Llums del Nord', '17008419', 'c. Sebastià Bosom, 2-8, 17520 Puigcerdà', '972882649' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008420@xtec.cat', '$2b$10$nA/jOEjbT6OrXYQihZGMD.6GjeNBLkFd8PCK/GdwH5B9LWvxgI/cW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Temps de Música', '17008420', 'c. Mare de Déu de Montserrat, 21, baixos, 17600 Figueres', '972676383' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008444@xtec.cat', '$2b$10$x6boMrRqwJRwEDXSoYSfuuYGWZOO.FJZuk1.E1rcgcO/c98j20fdq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Parc de les Aigües', '17008444', 'c. Sant Pere de Rodes, 2, 17600 Figueres', '972509924' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008468@xtec.cat', '$2b$10$b/H2XfJ5PvyGjt1sHYloAuHcs1x5azEYFrcZl2I0P17sYqkL97Wo6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Sínia', '17008468', 'c. Mascarell, 10, 17251 Calonge i Sant Antoni', '972662271' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008471@xtec.cat', '$2b$10$NbsyWZeJWDtR.SvD/85/IesEDsOCOKz5Ub977/KZ/ZtkEpNOTd2Hu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Falgueres', '17008471', 'c. dels Països Catalans, s/n, 17460 Celrà', '972492125' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008481@xtec.cat', '$2b$10$JzZBQtaayBBRyJM.tAn3tuKXQB2K7EVM33zg9M0LvjOFDPLky9QEO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Esculapi', '17008481', 'c. Teranyina, 6b, 17130 L''Escala', '972776764' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008493@xtec.cat', '$2b$10$d76PRHr4XZKQvbVbIGcW6.l3mV3W7x3WV10mtR6c3.tO9iGKpDziG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vall-llobrega', '17008493', 'c. Rei Lotari, 13, 17253 Vall-llobrega', '972601913' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008501@xtec.cat', '$2b$10$pAjbxk/zksQM21ac9orgWePL6ops7PKc2YD1ComFqV1Xe0PfVfLh2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Aldric', '17008501', 'c. Xavier Carbó, 105-107, 17244 Cassà de la Selva', '972464501' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008523@xtec.cat', '$2b$10$q6h3Cc2c2m3FSXXtbJAdlOesE63QPFr0SsmfpHglj2KFTUkXQOqDy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pi Verd', '17008523', 'c. Vicenç Roure i Armadà, 12, 17200 Palafrugell', '972610457' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008547@xtec.cat', '$2b$10$dJDow.TQ2hs90k2MDT057O6kXKSPY/d9RchG00usgSyU1tEKQS3ye', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Arrels', '17008547', 'av. Bellavista, 35, 17412 Maçanet de la Selva', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008560@xtec.cat', '$2b$10$IuMKXl4sZtsIna5PIxrmVOpIyn/OXmq65VgZAmmNxnJ.3K1R0upv.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Belluguets', '17008560', 'av. de la Generalitat, 13-15, 17200 Palafrugell', '972306029' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008572@xtec.cat', '$2b$10$5BtIeDdLe0Pu3XHLxeRp1u//PP2N.LY8HkvISDchaIjF9um.3QVpK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Xuclamel', '17008572', 'c. Narcís Soler, 8, 17600 Figueres', '972509239' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008584@xtec.cat', '$2b$10$eXuD.GsocA2KJGxJGpZZlu5Y13Drr.9XxsOp76skPZwtX31hroCqu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Plantera 2', '17008584', 'c. d''Astúries, 15, 17300 Blanes', '972335686' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008596@xtec.cat', '$2b$10$VNZ2O2fTDQFbzsDwwXIvKO2vGEYjo4ZdGagbKSQtE4.nZm9WBP5vK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'C.Educ.Justícia Montilivi', '17008596', 'c. Lluís Santaló, 1, 17003 Girona', '972222273' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008602@xtec.cat', '$2b$10$iqgOwLQ/cBaK8ckC91f7quZCVGqk9F6G4zNwXxiDe17cfDP8i4eVS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal L''Arbreda', '17008602', 'pl. de l''Ajuntament de Serinyà, 1, 17852 Serinyà', '972593349' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008638@xtec.cat', '$2b$10$96QwCg9Ir0eZ03n1r1Rbo.SoViSlKWXp1mrv1CRf3cYQpRg4Ivr.W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Tècnica Girona', '17008638', 'ctra. Barcelona, 199, 17005 Girona', '972208316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008641@xtec.cat', '$2b$10$SVoxaXbK.FEmtMCUIe.o4eCGq.pgKO54XmVcYYaQpMPQOglN7aH1O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Cabanes', '17008641', 'c. Cristòfol Colom, 6-8, 17761 Cabanes', '972678072' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008651@xtec.cat', '$2b$10$W5D/5j9CPcWxZY3x2kBcHuzIi/WH5BZBdE/HgoKDVt0Q9axM7GkOK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Caldes de Malavella', '17008651', 'av. Països Catalans, 1, 17455 Caldes de Malavella', '972480225' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008675@xtec.cat', '$2b$10$6CEDfKddqw8qz38XzW9mduOJB6k4zMpZSIpUbiNjTxgfJAULNpquq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pericot', '17008675', 'c. Andreu Tuyet Santamaria, 35, 17003 Girona', '972228524' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008687@xtec.cat', '$2b$10$yjydOBuIAL2hJ3hxo2MM5e8a4jbW1e.AWIgxKknpfwOlts61j9lam', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Deveses', '17008687', 'c. Doctor Ferran, 88, 17190 Salt', '972941290' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008742@xtec.cat', '$2b$10$bb12Lcl4R6X.Yl0IGtwfMOiJWbbvPSluD/LeGuRnaropVjzliDrce', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Balca', '17008742', 'c. Maria Montessori, 20, 17820 Banyoles', '972573536' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008754@xtec.cat', '$2b$10$96ArV2B28pmdjU9d6Xv6y.05sA7gH2IJzIqBdCnAD2FPzq2eCWiay', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Avinyonet de Puigventós', '17008754', 'Rbla. de Santa Eugènia, 1, (Urb.Mas Pou), 17742 Avinyonet de Puigventós', '972546297' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008766@xtec.cat', '$2b$10$XzOiGLO9JIt5c525Sy0t3eQola/G1.LiyT73C7Dku/mhBHdIP9UCO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CTA', '17008766', 'c. Garrigas, s/n Polígon Clos de Fires, 17600 Figueres', '972505498' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008778@xtec.cat', '$2b$10$c9PCNjP2myB7dDyq1W/66eKUnJqOWAiTbQ9oOixasbtCLbCJdifQC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Morrot', '17008778', 'av. del Morrot, 25, 17800 Olot', '972271155' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008781@xtec.cat', '$2b$10$/g.3YCTt2fbPslgLrhskn.MnDJFBsXDlVbtQ.vp2I6FOEGx7Or.La', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Benaula', '17008781', 'av. Onze de Setembre, 19, 17455 Caldes de Malavella', '972480056' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008791@xtec.cat', '$2b$10$7olFgFLzRenX0cTPtMqa4ekf3KkfmGHeCzojKA/4LBxjt7Zs7xEqu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Tren', '17008791', 'c. Empúries, 45, 17005 Girona', '972236228' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008808@xtec.cat', '$2b$10$7Trrjhtnuqt1LpUyxJOylee66PH7xp8wqFMOpdz83zQh0VhTCq3dC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carme Guasch i Darné', '17008808', 'c. de Josep Maria de Segarra, s/n, 17600 Figueres', '972512422' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008821@xtec.cat', '$2b$10$nyAegPpXABOBZdtGA0lP8.n/4Xgimjz784xrcOOc/n2JvyXSSBrM.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Banyoles', '17008821', 'p. Lluís Maria Vidal, 32-42, 17820 Banyoles', '972584929' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008845@xtec.cat', '$2b$10$gzjvlyqC3dy1/gcTgxIDmeYHyVwEclrYoCuL.dlJNOupfEf3gyKm2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Ninots', '17008845', 'c. Caldes de Montbuí, 81-83, baixos, 17001 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008882@xtec.cat', '$2b$10$xdszzeJ15kS31J7Uc6EgDOk3gGxqLd5NjFeOLdctVA4tELKJsgXlW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Bòbila', '17008882', 'c. de la Mata, 2, 17178 Les Preses', '972682540' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008894@xtec.cat', '$2b$10$8KP2oR5JbLcw6i0H9RKnKuNK1ScKmN7.jmwI8COthEMLOkU0Dm3FS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Alzines Balladores', '17008894', 'ctra. Gaserans, 189, 17451 Sant Feliu de Buixalleu', '972864881' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008900@xtec.cat', '$2b$10$ZaH1Mt1rj1k99ymX71rm/.54ee4Gsa2aJiTMpfqQNki6u66eQptFS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Cabanes', '17008900', 'c. Colon, 8, 17761 Cabanes', '972678071' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008912@xtec.cat', '$2b$10$ErxRuDFCa5p4.UyOMaiqCOEjwVRVnRHMc.Qv8TCT1BJ5.uWyAq93m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Pauta, Centre Psicopedagògic', '17008912', 'c. Bernat Boades, 70, baixos, 17005 Girona', '972222609' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008936@xtec.cat', '$2b$10$4u57aY3VAJb1qU/HTpKcIuDOZAtJOguj2GT2vCvFoS/HD1zvx3Xri', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Banyoles', '17008936', 'p. Major, 40/c. Canal, 22-26, 17820 Banyoles', '972576049' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008948@xtec.cat', '$2b$10$qv5g0IdE9SA4t654zxTTVuLVxLA56pVkZwokCGeOQ84YWLfi1YxPm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Nins', '17008948', 'pl. Onze de Setembre, 1, 17493 Vilajuïga', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008951@xtec.cat', '$2b$10$baX.KxZBTMQqHJzQnbq1keISH00DevHf70IKmJEG7kaLy2mptmnXC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Maçanet de la Selva', '17008951', 'c. Escoles, 19, 17412 Maçanet de la Selva', '972165634' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008973@xtec.cat', '$2b$10$6eA/1hRZg2.XIBRQE/46HOFASdPVtpBAyii2eLJbVjNKa5Ib.Iuwi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Santa Coloma de Farners', '17008973', 'pl. Miquel Martí i Pol, 1, 17430 Santa Coloma de Farners', '972843881' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008985@xtec.cat', '$2b$10$7pwOpYZgu3WN/fJARegLPePLWJn0/KPUfyS9fjRWvKdwd/qR2tLWq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre Tècnic d''Automoció', '17008985', 'c. Garrigàs, 1, 17600 Figueres', '972505498' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7008997@xtec.cat', '$2b$10$MQtYjUvbjHGgQXmGkBxBOeuD9j77EzHTMjL8zGGrygbn0Lhpx13Ya', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Forallac', '17008997', 'c. Miquel de Sarriera, 3, 17110 Forallac', '972641830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009035@xtec.cat', '$2b$10$SpQd/C70Ct7IOuuT5CFixeWqq5QkSpWUwt5ELClx3S6zYbo6l8IXi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Miriam Beltran', '17009035', 'av. Joan Carles I, 29, baixos, 17300 Blanes', '972335016' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009047@xtec.cat', '$2b$10$5ER9ZyvI40ajBZEHUTnwPe1kBwTE5sxNTS6mqK0YEekdV3K7JQ06u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Farigola', '17009047', 'c. Pirineus, s/n, 17180 Vilablareix', '972249824' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009059@xtec.cat', '$2b$10$GPz4G6J9H/GRLS6mcmsL0.rGS5PTnUUX6KkOYwayyXyZYkwB0jx7.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Comarcal del Ripollès', '17009059', 'c. 27 de maig, 1-5, 17500 Ripoll', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009060@xtec.cat', '$2b$10$CyP4ToHQlTLLXNAYDaBnYOLNETCq9HVRXnQqYFA04UsXxxax/NVLe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Can Geli de l''Era', '17009060', 'c. Priorat, 23, 17464 Cervià de Ter', '972496101' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009072@xtec.cat', '$2b$10$RIw2zwtcqYM0D/NM6SOgB.BFTsHEaxA2p6iDg7hP7dNsizRm3Gcje', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Alpi', '17009072', 'av. Mancomunitat, 10, 17538 Alp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009084@xtec.cat', '$2b$10$6PmhHx2DAfQ1ng1sXvyu1.qrZ7ioJmGMlw5cE6qhlF0nlp1UZwDUW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Garbí', '17009084', 'c. Francesc Macià, 65, 17190 Salt', '972405130' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009096@xtec.cat', '$2b$10$pKT4eJKMmnAsrpzXHsuo0edy6SgYvjBCDB0gWYzFmkp88UU.lVE/a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Ordis', '17009096', 'c. de la Mar, s/n, 17772 Ordis', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009102@xtec.cat', '$2b$10$Lxy/ZFr6rYTxWpG87FbDgeD461YgprfbovXz5mZlIAXDi9r24SAEO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Can Borell', '17009102', 'c. Ruben Dario, 14, 17300 Blanes', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009114@xtec.cat', '$2b$10$CmDzZrm7ev3WsPJbJw4XIebhsiskFdU8GL7pMEphfb09ZtxJ0vlSO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Petit Montgrí', '17009114', 'c. Roser, 85, 17257 Torroella de Montgrí', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009126@xtec.cat', '$2b$10$w.Injo9q5zh9QSKdjlpDTusoStbzhD3YR9r983oz5SQ/XcEHouKy2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Bosc de la Pabordia', '17009126', 'c. Riera de Mus, 19 A, 17007 Girona', '972941385' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009138@xtec.cat', '$2b$10$GE93KxnqFsYIlgPQhHFeVujIHbNzhaMJPz.vYNfzuiqg5bto9siqm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puig de les Cadiretes', '17009138', 'c. Amical de Mauthausen, 14, 17240 Llagostera', '972831487' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009141@xtec.cat', '$2b$10$puAhzDDU7prCuJiVvEreQuzH0fXTh2D4/LitcVlYDbBo0YyhU9wq.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Arrels', '17009141', 'av. d''Onore, s/n (El Serrat de Portugal), 17780 Garriguella', '972552529' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009151@xtec.cat', '$2b$10$KT/mTVj8B9SLpWnZh33Hx.xg.D7i4JS4BtFkt2T5uASxpYkvDkJi.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Pops', '17009151', 'av. Josep Pla i Casadevall, 2, 17310 Lloret de Mar', '972377497' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009199@xtec.cat', '$2b$10$koLkq6lTybQQTgAuplbl6OWf5VtB2exVaO.IZ4TBswd0zLVhsbmfe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Estanys', '17009199', 'av. Barceloneta, s/n, 17410 Sils', '972854278' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009205@xtec.cat', '$2b$10$nuoicn6zPrA1M/py13gdEuDLDsRGrEhYrggxp6BI46KMn32sEFo52', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Vilablareix', '17009205', 'c. del Perelló, 15, 17180 Vilablareix', '972406005' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009229@xtec.cat', '$2b$10$evqq/3WILxxKkuevLUD4t.9NsnJ5eggim2wyaZU0oJnok.IAfErei', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Pinet Xic', '17009229', 'c. Ter, 2-4, 17864 Sant Pau de Segúries', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009242@xtec.cat', '$2b$10$PDpExZQ90sV/HvV3aMcPneLXuxDKIBf.2eV6Nmrxic7wtgYarTTjG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Nou de Quart', '17009242', 'c. Mas Ferriol, 1-3, 17242 Quart', '972468344' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009254@xtec.cat', '$2b$10$Dkxlv41WRauvmlBGzmaLkuax7/paqeEZXtRMCSDLbzj.cSmE4Gyma', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EB privada L''Arc de Sant Martí', '17009254', 'c. San Miquel, 20, baixos, 17001 Girona', '972204531' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009278@xtec.cat', '$2b$10$Uz9mWa7tlkCweQdaDOH.8.SK3c.zyd6tywv8jPRQi6kQCD4sua/Dm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Fanals d''Aro', '17009278', 'c. Josep M. Vila, 7, 17250 Castell d''Aro, Platja d''Aro i s''Agaró', '972829800' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009308@xtec.cat', '$2b$10$XKGoQTjlVE8I/29WAesEw.IVkdt6BV/WqiZi/gS8NezSXPA12Op0m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Sils', '17009308', 'c.de l''Abat Oliva-c.Lluís Llach-c.JoseC, 17410 Sils', '972853977' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009345@xtec.cat', '$2b$10$9/zrzR0ZdXY5kEH.JzK1qecBDYYu3/dTs5NmH2lb12mU6X6ed/8aS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Camins', '17009345', 'c.Concòrdia Aigües de l''Estany, s/n, 17820 Banyoles', '972580342' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009370@xtec.cat', '$2b$10$Mf7q9ZHR2K.qPLJga8a9lu0EY9KzBNDn7/2mGfaAX1227396KKH8y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Carrilet', '17009370', 'Pg. dels Països Catalans, 1, 17190 Salt', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009394@xtec.cat', '$2b$10$0FxDHtwfUoWRog/TrK7Yqu0z7HkYBEEEoYuI1rxYrEaCuTnsS4H7a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Aiguaviva', '17009394', 'c. Major, s/n, 17181 Aiguaviva', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009400@xtec.cat', '$2b$10$SiGz6GMk8.irz3teOCKS7.U8xp3UmNJKDi6mJ6cKsRliKoVbX/Gpq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Garbí', '17009400', 'c. Joaquim Riera Bertran, s/n, 17002 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009412@xtec.cat', '$2b$10$2Ig4L0Ml7LxQ3Iy9GzcA/OZnWBOXaL4iDLCauM8tARc5ax3bRq3nW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Orlina', '17009412', 'av. de la Constitució, s/n, 17491 Peralada', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009424@xtec.cat', '$2b$10$IrutLpfTaS8Y6Xi3IefKJuGwsD6M3GxDcywdJ1e2EYOmKAM6ALMJK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Estel de Mossèn Gumersind', '17009424', 'c. València/c. Provença/av. Catalunya, 17230 Palamós', '972602088' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009448@xtec.cat', '$2b$10$vFzPzJ1FJGQEGfk9bTrfFusLq/p/O.iJQ45v3pizOkebJzTiFh6ue', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Molí Petit', '17009448', 'av. de Jaume I, 2-4, cantonada C-26, 17860 Sant Joan de les Abadesses', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009451@xtec.cat', '$2b$10$L2r9jUY0WynrRq32yZKZ1ulVQ6nIsH79yJAozRgoRYgetLXBf5A6a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Maçanet de Cabrenys', '17009451', 'ctra. de les Salines, s/n, 17720 Maçanet de Cabrenys', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009461@xtec.cat', '$2b$10$HYngLoUFW1qOOxujsl4XDOREwrSFaZVnRX8GlPxThrGt2Lpgkkhmm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Camallera', '17009461', 'Prolongació del c. Raval (Camallera), 17465 Saus, Camallera i Llampaies', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009485@xtec.cat', '$2b$10$5fj2Ov.2BqS99I4mIcIvO.oHFlkTxJympHzxZkasEYaMHYIBzoN9y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Sant Miquel de Fluvià', '17009485', 'c. Ferrer Fàbrega, 1, 17475 Sant Miquel de Fluvià', '972568389' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009503@xtec.cat', '$2b$10$uSnMTxzpBFyatzlwTuQFJOLlaXUiCd4QNsRlx0iT6Jh96W2eGh9CO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Monells', '17009503', 'Ctra. de Monells a Madremanya, s/n, 17116 Cruïlles, Monells i Sant Sadurní de l''He', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009515@xtec.cat', '$2b$10$5W.PSa2VLq99NpPMb/HCTuLQsdCe/0E4L2kVXZEDjSsi9G3fu.h4y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Tractoret', '17009515', 'Urbanització Els Prats, s/n, 17468 Vilademuls', '972561332' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009527@xtec.cat', '$2b$10$baJK8pNt4DLStUcQefsUluf13MWVOCIZmDLfhRX18YVaFizPMjOAq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar inf. rural Cau de les Goges', '17009527', 'c. Xavier Montsalvatge, 1, baixos, 17481 Sant Julià de Ramis', '972173082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009576@xtec.cat', '$2b$10$ryPPwhATB114kv2XW4iA/Ou9zWaRJgdQWuny2nsHLExUCASez5ceK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Carrilet', '17009576', 'c. Mas Sec, 71, 17240 Llagostera', '972805228' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009606@xtec.cat', '$2b$10$.MdyfiicHUygJw7VDQinIe1O5tYaBvIeBHqzSNoupQzhD/bVwDsW2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Ger', '17009606', 'Rita Casamitjana, s/n, 17539 Ger', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009618@xtec.cat', '$2b$10$p8z/y5PoaLaWuoWa6Ix/oOyS6bBGpDoaFusyj8hzvHZj/ewmmhD0a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Fonts', '17009618', 'Rda. de les Fonts, 25, 17800 Olot', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009621@xtec.cat', '$2b$10$p9quc.IjFVEVwteQoVcSpuEznYkAhxj5Jp7QtTNfitCaa2rUfT2vm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Gínjols', '17009621', 'c. Canigó, s/n, 17460 Celrà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009643@xtec.cat', '$2b$10$Urz8kdO1uHfjaCpj3y9OmeE4HRi.QCKqDfcyV9pKSJNmVxn4knzM6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Maçanet de la Selva', '17009643', 'c. Sant  Sebastià, 6-8, 17412 Maçanet de la Selva', '972165120' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009655@xtec.cat', '$2b$10$1ebi5XHXOJw59pGnV0TgjOOVsi.nDWgR8zPLGuk0aG946SYys2ecS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Jardinet', '17009655', 'pg. del Doctor Carulla, s/n, 17401 Arbúcies', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009679@xtec.cat', '$2b$10$3PXhZY3AmKM0nCqx3KJp6OkR.ju/aJlx9JU1x3LEJ8r9bJJTkLqti', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Franquet', '17009679', 'c. Ponent / Gran Via de Pau Casals, 17480 Roses', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009680@xtec.cat', '$2b$10$MCrpOs8sHAGXqoS9scT4eeOgfa24Qzfec./LQRPPPmcnkDM/azUn6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Ventalló', '17009680', 'c. de la Bassa, 42, 17473 Ventalló', '628894019' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009710@xtec.cat', '$2b$10$y5OHXTktqb1u8elMLqWHSOPC1die1saEoE7CnvtJWs7pF5SRXGDMu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Empordanet', '17009710', 'av. Sant Francesc, 23, 17100 La Bisbal d''Empordà', '972643896' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009734@xtec.cat', '$2b$10$s.kyeQ3CxBEVw3mjZ/eUFeXJ2MhZ7He2DWl9Lvnsf2aaEkxuijBVm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Montori', '17009734', 'c. Salvetat, 3, 17133 Parlavà', '972769288' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009746@xtec.cat', '$2b$10$nxfyNnGLu5lJMMuTUdBupuLr3CWlx48yWdciCl5wkM0L35ujSNE7G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Petit Lledoner', '17009746', 'c. dels Afores, s/n, 17854 Sant Jaume de Llierca', '972687005' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009758@xtec.cat', '$2b$10$zltTRf2COSJv5k/j3QkQOO9VDvCmdHcNsUN3d03bGwid29ealp6ku', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Carrilet', '17009758', 'Parc del Canigó, 2, 17162 Bescanó', '972442285' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009761@xtec.cat', '$2b$10$FMphb8QJCC1SAE/VGbsgdu9qEUM/ZNMNg/V61AazdjJM2StDnpCoK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal La Baldufa', '17009761', 'c. Roques del Rei, 40, 17403 Sant Hilari Sacalm', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009771@xtec.cat', '$2b$10$z6rgs/hY6XDIL1WkuISXce6YYPy4L19/.i1Sxtna2v63JcwtMuiUi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Vallfogona de Ripollès', '17009771', 'p. de la Salut, s/n, 17862 Vallfogona de Ripollès', '972007986' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009783@xtec.cat', '$2b$10$lKzIHtMz2MtwJjyzB1aM3et4l623yoRLUGP5ZE/9TxzzNbj0VshqW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Miquela', '17009783', 'c. Salvador Dalí, 2, 17162 Bescanó', '972442413' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009795@xtec.cat', '$2b$10$6jmpOJYPyqWutmKPkyYv2u/2wvaNnUwzTARedmFQN0z0ZuQ0kwb4W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Francesc Cambó i Batlle', '17009795', 'c. Escoles, 1, 17142 Verges', '972780141' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009801@xtec.cat', '$2b$10$jbsfsOiPefkdYwIPkOYSaO99F5JTMbo26fKeivukimThyDSYBTQsu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Salvador Vilarrasa', '17009801', 'pg. Pare Pujiula, 29, 17850 Besalú', '972590109' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009813@xtec.cat', '$2b$10$YauTPVWwtWC0aXuzKJCOS.BGxaykN2Gbg2gTUPqLKMuDAW4bk/12e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Mestre Andreu', '17009813', 'c. Mestre Josep Maria Andreu, 2, 17860 Sant Joan de les Abadesses', '972720343' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009849@xtec.cat', '$2b$10$p3qR0I9aAXxkx1pl8Oy8EetTcL6GQ1tvac96KQL.v1ZGpsb0cvMkS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Petit Comte', '17009849', 'c. Jacint Verdaguer, s/n, 17850 Besalú', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009850@xtec.cat', '$2b$10$c.pH0jN5POucjJzjUW/Hj.8al2vm7oP6Qzog5KolQODKav3ilNXHy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Arrels', '17009850', 'pl. de Maria Rosa Puig Dalmau, 1, 17190 Salt', '972234699' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009862@xtec.cat', '$2b$10$RM6641w13kRc5mx6GGjKfedCLZkz.O4dsq2Dgn411TVBwFlqIjQOi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Santa Cristina d''Aro', '17009862', 'c. Plataneda, s/n, 17246 Santa Cristina d''Aro', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009874@xtec.cat', '$2b$10$d2dDGDeVyr.XePda1dTGFeVAiH0wcI2H7Nc/mzpZ8oNeMlqRbkyXW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Els Plançons', '17009874', 'c. President Cárdenas, 20, 17833 Fontcoberta', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009898@xtec.cat', '$2b$10$4bhzEjwB4rGpTQfnWY4TR.tFUurWcNIeHTl8xzqcTLb2zg.ThuJ4a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Lloret de Mar', '17009898', 'c. Santiago de Cuba, s/n, 17310 Lloret de Mar', '972361495' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009904@xtec.cat', '$2b$10$eu7Rjr5ME6IRElR7fsmfX.Pbg/Y7AZwhXU2givLhL8h7jJ1631QYW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Mas Balmanya', '17009904', 'av. Martí Sureda, s/n, 17220 Sant Feliu de Guíxols', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009916@xtec.cat', '$2b$10$8QR8KfRKcWEmEwRu099soe.3.3YFToBdKVx9v/zSd8lb5ZdBPUw7W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Petits Pescallunes', '17009916', 'c. de Soler / av. del Brugent, 17174 Sant Feliu de Pallerols', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009928@xtec.cat', '$2b$10$tTRMZBwoVyCkk6n5HZZZdexI42lphiZ8iwqhE9UOj7upk3FziENH.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Ribes de Freser', '17009928', 'c. Balandrau, 21, 17534 Ribes de Freser', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009931@xtec.cat', '$2b$10$OxNcekCZYxPG6QISvj2wRuG3vdf9BuJpbiqflBYtJm.snUlyGQmqO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal Passet a Passet', '17009931', 'c. de la Figuera, s/n, 17472 L''Armentera', '972521826' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009941@xtec.cat', '$2b$10$EiKMj6hFt5RNyzhoIL3z7ufWJ8gq6Igd7cPZROuvW5G250GWHXIX6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar inf. rural privada Parc i Joc', '17009941', 'c. Font Alta, 15, 17170 Amer', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009953@xtec.cat', '$2b$10$M/J1BW9z62L2Nhq9y75WPOEQsiNWyoClr.ew8wGX5Mz03XTdT.zF.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula de Música Municipal de Tossa de Mar', '17009953', 'av. del Pelegrí, 8, 17320 Tossa de Mar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009965@xtec.cat', '$2b$10$4DabXRYU7M5Zc9iXYehS7ueVHGlsRUiik.h5dkGuLIx3gXDmaGGDq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Montessori-Palau', '17009965', 'ctra. C-260, (Vilatenim-Sud), 17600 Figueres', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009989@xtec.cat', '$2b$10$2d6SWFlm7KciVcvRNkfaruqEAYWZKAsufH1ZJJt1Zmm2SdyBjGIC6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Xiquets de Llers', '17009989', 'c. Orient, 4, 17730 Llers', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7009990@xtec.cat', '$2b$10$o88LKSOHhVS8jKr9y4nI8OZU5zzez06q1WkE2XSMVtYKFB96FpZIW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal la gredera del Morrot', '17009990', 'av. Morrot, 23, 17800 Olot', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010001@xtec.cat', '$2b$10$GEWAlJO72F73VKUC9vtE/eXbOqe4kOX1Gxn6sV5ySeKckm7Fc5yJG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol L''Olivera', '17010001', 'c. Àngel Serradell i Pérez, 8, 17003 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010037@xtec.cat', '$2b$10$adTMa6.a5lL/VycNsVUOi.Ja88gwqPQ5VNDXPIoIpgyEhfrwf.ZCq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut El Bruc', '17010037', 'c. dels Prats, 2, 17404 Riells i Viabrea', '938470053' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010049@xtec.cat', '$2b$10$s8eB5YC4UGrXFsxuTHuq4uVg/2VkoNvvcx.HMK59G8Srngev5Qf32', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Balandrau', '17010049', 'ctra. de Talaià, 2, 17007 Girona', '972942152' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010062@xtec.cat', '$2b$10$detmLtjph8yTZ8kge7ReVOSE0/xT2EWei1V6J1CwnG1.jUQco9DMS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Patuleia', '17010062', 'c. de les Escoles, 2, 17745 Lladó', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010074@xtec.cat', '$2b$10$V/E2XFtR/yQmTPoeLrR4ueNc/sd27Nkj95NOI0vF26EhT2HxzeBIG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Maria Elvira Gili B', '17010074', 'c. Ibèria, 5-7, baixos, 17005 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010086@xtec.cat', '$2b$10$QpZAugI6sZ9J37MBtoUSB.vhq.1iQsdsADKd0cN28XrxUc61RWqDe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ginjoler', '17010086', 'c. Gavina, 51, 17251 Calonge i Sant Antoni', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010098@xtec.cat', '$2b$10$YyOn3A5/lBtXKRyoTrmNF.nCtB3SAjnnmjFqi.0Em8.hTN/5IfSm6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA de Vidreres', '17010098', 'c. Orient, 18, 17411 Vidreres', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010104@xtec.cat', '$2b$10$qLo4ObZEfJ1.PMCJttKj1OZDrQZRdGnyCSFGXFOZDc7TS5h/jVVHy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Campllong', '17010104', 'c. Esglèsia, 26, 17459 Campllong', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010128@xtec.cat', '$2b$10$iKNMMX9bDyfLrMKu2jjKoOd96lrBCXULJbh5qcB8wlY.vlZyW7UXy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Baldufes', '17010128', 'c. Cruanyes, s/n, 17834 Camós', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010131@xtec.cat', '$2b$10$8fsCwjA.D10MyLbTMp5K5.d0DrkjPoKfXdwbICieoQJoNzu9558mC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Belluguets', '17010131', 'ctra. de Banyoles, s/n, 17844 Cornellà del Terri', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010141@xtec.cat', '$2b$10$0lov4/lyfMOF/ifXAVh/huux.IS7cZ4UHNxGo0B2W0yKzdx6419oi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol de l''Escala', '17010141', 'c. de la Teranyina/c. de Figueres, 17130 L''Escala', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010153@xtec.cat', '$2b$10$l7eiaXcPtEqUpOMYhUjT8.FPcPf7t.ScmHis6EcGfwxS60K10ZUfO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Petit Llagut', '17010153', 'c. Delícies/Marinada (Z.Equip.Nord-Oest), 17470 Sant Pere Pescador', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010189@xtec.cat', '$2b$10$djWKOcvN/Qy8DsNtvNS2vOhkCeh6jtHV7FKTgnUM4t2fpL3H2vaBG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Vall de Llémena', '17010189', 'p. Rafel Masó, s/n, 17150 Sant Gregori', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010207@xtec.cat', '$2b$10$N.ZqeSLpBBdcrB03cnJBO.E7Vz..kGJWNtodDff6wfw87t2/gYfr6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Sorrer', '17010207', 'c. Mediterrània, s/n, 17411 Vidreres', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010219@xtec.cat', '$2b$10$CulOkueSbLTrOjpUVMc7O.8MinaRaEutKc.vqU0sIJcHuBLVuWX4i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Tortellà', '17010219', 'Camp de Sant Antoni, s/n, 17853 Tortellà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010220@xtec.cat', '$2b$10$BYI.Pww6HNufmn/DC0zFeubZliVailYEf7PnVL2Z/6pjcWy3WweAm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Melic', '17010220', 'c. Font de l''Àliga,, 17172 Les Planes d''Hostoles', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010232@xtec.cat', '$2b$10$GQUUVzO.g.mMcxrMApB77uoF/cazsL6egxHfL5LdSUYSpFh/pKayK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Quitxalla', '17010232', 'c. Santa Maria, 17, 17760 Vilabertran', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010244@xtec.cat', '$2b$10$YH4t73mIwCzbullJK1985eEfgVgjVfO7cC7HD508L9lEhvVGhEUlq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Baldufa', '17010244', 'av. Alt Empordà, 27, 17483 Bàscara', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010268@xtec.cat', '$2b$10$y0lY2B6vzw7MTbWJsj/e3.sdXwUMeCOMCgX5Wb8mX9KkOkEk3Edf.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EB privada Castells i Cavallers', '17010268', 'c. Josep Morató i Grau, 4, baixos, 17004 Girona', '972081112' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010271@xtec.cat', '$2b$10$tgRAKwtbYTdim7j/C6NO7uxdCnKYIIGyrCsoDxoMXMu6RdhSac9Na', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Lilaina', '17010271', 'c. Met Miravitlles, 3, 17600 Figueres', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010281@xtec.cat', '$2b$10$83COQ3rGLGoZBOlrrcMlueAqBeGJWFQwhLc0juH1ya5ebn38exHY2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pia de Salt', '17010281', 'c. Pla de Salt, 10, 17190 Salt', '972249993' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010293@xtec.cat', '$2b$10$ejlMp3/zrWCS1nKWxrNV8.DfaxOejhyALfpclzc3iY2oaRC.4kS0m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Santa Pau', '17010293', 'c. Escoles, 26, 17811 Santa Pau', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010311@xtec.cat', '$2b$10$.GvVh7ccBaDoxcxDmsm8S.YB4f9l24RIe6U6vzHS3ZvnANXmFucvG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Rajolí', '17010311', 'c. Travessia Molí, 1, 17141 Bellcaire d''Empordà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010347@xtec.cat', '$2b$10$XfYMA5q5jg7lKVr8Ry629uWzoV5Vxlqg8IfnUkxLlp7f9EB7AxsyW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol de la Devesa', '17010347', 'ptge. Massaguer, 9, 17001 Girona', '972010270' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010360@xtec.cat', '$2b$10$IqY71tqwTQjEHK01FldfTuankcAOx507OlMkziUz3We7QgAdVogl.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CIFOG-EGE', '17010360', 'ctra. Santa Coloma de Farners, 115, 17005 Girona', '972401300' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010372@xtec.cat', '$2b$10$KN3LxckwqyawpGfuXl9I2.7ApTOrGH.7aVK2FhzXbYquhKlj3EQRS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre de Formació Eqüestre C.A.V.A.', '17010372', 'Can Bonic, s/n, 17462 Sant Martí Vell', '972491046' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010384@xtec.cat', '$2b$10$/.RE1uoAyvITiM37sq/4d.iA.N.hdDbsk2EYFzq8hKQtLD338GrAC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'L''Energia-C.aut.ens.art.pro.de Música Palafrugell', '17010384', 'Pi i Margall,114/Manufactur.Suro,51-67, 17200 Palafrugell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010396@xtec.cat', '$2b$10$EXMPBMOX8bTHwy1H8s3/S.xHJ//R6Zt7pAsicOhrOUWJJPYAsd41a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Flaçà', '17010396', 'Camí de Sant Fermí, s/n, 17463 Flaçà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010402@xtec.cat', '$2b$10$Gcfkx7O1Xhn6VQAGsuHDKORNoI7xaUIfkB8tktMKwBT5LHzBvP5t6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal La Bòbila', '17010402', 'av. de Can Caramany, s/n, 17121 Corçà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010414@xtec.cat', '$2b$10$KqLJGQQNeR2q2.bKom97C.6J2R.jHBHwq5vJnCUENbGnXwZeRtVMW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ermessenda de Girona', '17010414', 'c. Doctor Antic Roca, 38, 17003 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010426@xtec.cat', '$2b$10$Gsh/sXVr0owmRUkvsy4ae.8Wn2aM8pjyQeYlGUh/92oNbJgDYujWa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Kreas', '17010426', 'c. Joan Pere Fontanella, 3, 17800 Olot', '972260714' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010438@xtec.cat', '$2b$10$Ln4jCbT2sHWvfJfkhTa7d.rOxnmaSquL1ekIbDhz1Sm.SbCe9tvL6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'ETECAM', '17010438', 'c. Sant Antoni, 1 (Coma Cros), 17190 Salt', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010441@xtec.cat', '$2b$10$H5mfDH5GtovdZ7K32inygOnHJW81.oonoOwp1WQYSmLm/dg6Ws.qS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Nou Girona', '17010441', 'c. Narcís Xifra i Masmitjà, 43, 17005 Girona', '972230403' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010451@xtec.cat', '$2b$10$QDUr1pGW43OBjCPywlpsD.zhqCweDiSf3C/9YvUk/Lkz2BRGvEcYO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Tramuntana', '17010451', 'ctra. Figueres a Llers. GI-P-5106,km 1, 17600 Figueres', '972657300' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010475@xtec.cat', '$2b$10$0r1jS9iTJN7HHf078gcGdOmSZ/gN1N0pxYTyF.KeuoBynN3Wn5ynO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Oreneta', '17010475', 'c. dels Estaragalls, 16, 17539 Bolvir', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010499@xtec.cat', '$2b$10$b8zKINKnjgUi8Di6icgX6u4s2mD1WdD9aLjB10j7fDJGtC7QG5BpW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aurea', '17010499', 'c. Emili Grahit, 2, 17001 Girona', '972298082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010505@xtec.cat', '$2b$10$D9F5C6IKt.m2ctYdBd6lk.yY44EfAvsrEB8Wkc80oMOBTwO9a76v.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Pals', '17010505', 'c. Quermany, s/n, 17256 Pals', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010529@xtec.cat', '$2b$10$vttMwp1wyi2RTichNe0NQe5UzChGc3941233yuMlUF3NMoFwKQD16', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EB privada Olot Montessori', '17010529', 'c. Fontanella, 10, baixos, 17800 Olot', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010542@xtec.cat', '$2b$10$onY3.KVOUryt75NTOJT15umnOHet.jnPySCPehKWHtWychZv27MEy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Draguiló', '17010542', 'C. del Dr. Joher, s/n, 17464 Sant Jordi Desvalls', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010554@xtec.cat', '$2b$10$goJjGbRptHRjx.5gDVoCo.e4NFnkMRB526fU413Y4n9xUkyK/Bw3e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Petits Gegants', '17010554', 'c. Alfonso Castelao, 29, local, 17300 Blanes', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010578@xtec.cat', '$2b$10$RCLJ5wKdb6JOcDp44IWBhuAzlYCgN9jURlVbOn9ES.dQE5qq/7q9m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vitae Girona', '17010578', 'c. Església de Sant Miquel, 18, 17003 Girona', '934170514' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010581@xtec.cat', '$2b$10$JIiuN9RjLxH0x04el5.aa.gA.4WjvYdfGvckhWyp1QbDus8bUwAWu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'OMEGA Centre de Formació de Tècnics en equitació', '17010581', 'Veïnat de Can Serra, 15, 17458 Fornells de la Selva', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010591@xtec.cat', '$2b$10$mN2bU0v8.6WEN9tn5glEBOJfOtZ2Ed4bz17Dt/QYNjUQ6DFVEjq0e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Entrenadors de Futbol i formació', '17010591', 'Camí Vells Fornells, 33, 17003 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010611@xtec.cat', '$2b$10$ld1E6syAS0sj3osrdckC4e5ezY2s4NIQPAF7kF021kbmuLKLKQg5G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Pere Mercader', '17010611', 'c. Molí, 9, 17244 Cassà de la Selva', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010621@xtec.cat', '$2b$10$OB7WGmTOCDCKw2t6AL.4QuD4oy1h/dQ7FvudpEcGdoJwrYGJmDms2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre de formació teatral El Galliner de Girona', '17010621', 'c. Dr. Gaspar Casal, 5, 17001 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010682@xtec.cat', '$2b$10$68G9HOcefBDgwiLxhvcG2eVrcZ1kQhvmSyjxm04VyRuDhRLcRxs8y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ticeris', '17010682', 'c. Joan Fuster, 45, 17840 Sarrià de Ter', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010694@xtec.cat', '$2b$10$MkY4fJLQCm7nIb7Q7iN4bugypycUdUy39V7T5p8NqChXBa8fXdwF6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola El Bruel-Empuriabrava', '17010694', 'c. de l''Olivera, 74-86, 17486 Castelló d''Empúries', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010700@xtec.cat', '$2b$10$fmDCQ7U8ukblyRIPn7u3YOhnq8RRRVrbNvabkRGbkRkD3fNhl7sdi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Sant Quirze', '17010700', 'av. Càndida Masgrau i Campeny, s/n, 17310 Lloret de Mar', '677071297' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010736@xtec.cat', '$2b$10$oQeCUT9jXYRldCvJgF8/Bu9SweFHxXMJGr4VW6ojcjTF5Ik9imhly', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Dans', '17010736', 'c. Conill, 20-22, 17820 Banyoles', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010751@xtec.cat', '$2b$10$G4T.Zw2Hc1Eg1od/T1kgCOi9k6idBQ4OleKKk9qq2KVK74G51b5M2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre Politècnic Comas', '17010751', 'av. Estació, 54, 17300 Blanes', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010761@xtec.cat', '$2b$10$L3e2AoSFXk24g767MpeKD.IHOPbLi1NUZd9OK70AFEovQnI40rB3u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Petit Regne', '17010761', 'c. Universitat de Montpeller, 3, 17003 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010773@xtec.cat', '$2b$10$.xm87ZpR5myikmIP0Zvk1OmADgXbv9sJYYyxUXbPaUJeXN70wpUeK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CNTEC', '17010773', 'c. Marquès de Caldes de Montbuí, 7-9, 17003 Girona', '972655747' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010785@xtec.cat', '$2b$10$imnv1i5mxuLxyafztttRJuNqn8cq68DQmCj5heJQs5WLLzjOSGq1.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Petit Món', '17010785', 'c. Josep Joan, 27, 17230 Palamós', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010797@xtec.cat', '$2b$10$G3XsATtt9kcPwTWSktcXYezJ6gC0CT2ic3ltc/o7TKH/zyaTpR/rK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Caritat Serinyana - Cap de Creus', '17010797', 'c. Teresa Miramont, s/n, 17488 Cadaqués', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010803@xtec.cat', '$2b$10$d9wjdoAIYvVZZeSTY1HQUOp2xvXXJtorrZrwrq7h3nNOrNoF2GLJe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Vall de Ribes', '17010803', 'pg. d''en Guimerà, 1-3, 17534 Ribes de Freser', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010815@xtec.cat', '$2b$10$BZOUX9GFmBBgdcWmkaxTTupP4adOopiwr1dQh6d6wEJnRX18SMnZq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Vila-romà', '17010815', 'c. Riera, 29-31, 17230 Palamós', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010827@xtec.cat', '$2b$10$5dmDV5y5l9jRnkKN38e6D.n2GCqJeBdCO4sUJRcJqfCIK0Tx09BIK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Greda', '17010827', 'c. dels Garganta, 11, 17800 Olot', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010839@xtec.cat', '$2b$10$tvSqoq5Kh2nvQYx2nPdW7Oaw.Z50Bkm75CyFkNXbwgv7ZmU4aLz0G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Peralada', '17010839', 'Camí de la Garriga, 4, 17491 Peralada', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010840@xtec.cat', '$2b$10$le4cRmI3vkljanKKkCIBy.XyXNIS0Xgg6tF/Gcpw67mtMeVKUl4q2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Sureda', '17010840', 'c. de Pals, 91, 17200 Palafrugell', '972903976' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010852@xtec.cat', '$2b$10$U32Arqkevp6SDsieGTDTkuUj26ix01SeKUKe0sjoPJqqp8iRBZ086', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Daina', '17010852', 'av. de la Pau, 18, 17300 Blanes', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010864@xtec.cat', '$2b$10$gmaHlS0R652Y4r96Eqw.fOjVnfxD4NTJRY3d8oQyY6KGy4lyirFxe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Conrad Saló', '17010864', 'c. Estació, 2/pg. Marimón Asprer, 7-9, 17100 La Bisbal d''Empordà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010876@xtec.cat', '$2b$10$tJas5qDCdGUxSvjiRu6cMeKyZEM1zsB6YriG6JXXKxWbaAcHQdnBi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'El Rusc', '17010876', 'ctra. de La Pinya, s/n., 17176 La Vall d''en Bas', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010888@xtec.cat', '$2b$10$6Ys83s2btXlXTDH2Mi5pxOdkzadeoOuUqRn6wR2lRaarVF2LjMf9i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Mimz', '17010888', 'c. Bisbe Lorenzana, 19, 17002 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010891@xtec.cat', '$2b$10$kl/2cPVxjEt.KRBmwCMRs.kAX1jZukUnbi6DTgjDHvySRG0lpvI5S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'International School of Costa Brava', '17010891', 'av. Fanals, 70, 17250 Castell d''Aro, Platja d''Aro i s''Agaró', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010906@xtec.cat', '$2b$10$KlQmVvn0iJVgoWYLpA6P9uBGt4V.lD8lJBrfvhGHqXlMIQm5zxhUO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Fitdanstudio', '17010906', 'av. Estació, 15, 1r., 17300 Blanes', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010921@xtec.cat', '$2b$10$kVm3twUlVle8H/dOmG07SuRPh/FAPvrZGaWgLypxtgk7JhZz00T9a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Montseny', '17010921', 'pg. de les Escoles, 28, 17400 Breda', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010931@xtec.cat', '$2b$10$cajeSI2A7U/xy85CRoxwUucRVJ8lVdpU4J23gPF0dQzP2zTJPfvtq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Curculles-ZER Empordà', '17010931', 'pça. de l''1 d''octubre de 2017, 1, 17476 Palau de Santa Eulàlia', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010943@xtec.cat', '$2b$10$NyQMjZqPxTXIrIY.HcnLPOfln9u2h0.mvIHUlt9wbZ4gtjq6dOzXi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Sarriart', '17010943', 'c. del Firal, 22, 17840 Sarrià de Ter', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010955@xtec.cat', '$2b$10$iu8JGaEhN/sizW5NfvV2pOMq.1v37JqCu7QnFF8bqPST33sbEmUgC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Preludi', '17010955', 'c. Marquès de Caldes de Montbui, 111-113, 17003 Girona', '972203936' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010967@xtec.cat', '$2b$10$5hnESF7nHSkv1nMWir6wveEMPhEmRURTcNi7E0fvaABSfXEc/jgrG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Caldes de Malavella', '17010967', 'c. Vall-llobera, 62, 17455 Caldes de Malavella', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010979@xtec.cat', '$2b$10$aWAVWBSVeDRQ27vpzGZtiu8im0IBi4G6eLNhCQU8OOftYozWOHRxa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'UTCA Parc Hospitalari Martí Julià - UTCA', '17010979', 'C. Ramón i Cajal s/n (ed. La República), 17190 Salt', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010980@xtec.cat', '$2b$10$1FG8M82Sf.RyCsR9abm/tOaNqWPStKwtM4XnmH38S01rIFLtwrQ92', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal Els Esquirolets', '17010980', 'av. Catalunya, 89-91, 17527 Llívia', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7010992@xtec.cat', '$2b$10$6cX7WIL8sDXkNRXTOquqWueKy9QSMZ9TtayKq2tiqTP5iVVxOzEM6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Forallac', '17010992', 'c. Empordà, 29, 17110 Forallac', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011042@xtec.cat', '$2b$10$6TyofHdkmuIFV1ArFHCYA./guhvuaKtGX/zWMK/IoB90PFm.TkmEG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Mossen Joan Batlle', '17011042', 'c. Lope de Vega, 1, 17300 Blanes', '972331087' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011054@xtec.cat', '$2b$10$2YL/3q5AizkwysXkl.IZYurMdayC6uNchWhL39r60DjRI6mv0CHQG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Campllong', '17011054', 'c. de l''Església, 26, 17459 Campllong', '972527407' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011066@xtec.cat', '$2b$10$L/ChnNcbIO03vMqgpYaISOZY1Jcu40i7AAXWzqLeC4jwbFmDSKyWe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Josep Pous i Pagès', '17011066', 'c. Avinyonet, 201, 17600 Figueres', '972503970' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011078@xtec.cat', '$2b$10$38oBl.UUlPO6Paz5vEarC.BkKUlBRG/80PA.EoguRDwXgpNVZAvZe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Domènech i Moner', '17011078', 'av. Càndida Masgrau i Campeny, s/n, 17310 Lloret de Mar', '972111150' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011081@xtec.cat', '$2b$10$XhmA7XRvYzrOBzk.tm/6G.gCEaSIYCiYyrK3F538JPMf0emKapLGe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Cent Fonts', '17011081', 'c. Sant Benet, 25, 17403 Sant Hilari Sacalm', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011091@xtec.cat', '$2b$10$HkiwYmUQsGNt90/r8XI9AOs5NG1h3z94Jnx3benzQNwUNm.DM/3/i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'HDA Hospital de Dia de Figueres - HDA', '17011091', 'c. Pi i Maragall, 5, 17600 Figueres', '972182600' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011108@xtec.cat', '$2b$10$iwcCzwKucITNpIzZckFGEOOnezJ8MwY7gEMS0R1vHzDqzia8Pmm0q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'URPIJ Parc Hospitalari Martí Julià - URPIJ', '17011108', 'c. Ramón i Cajal, s/n (ed. La República), 17190 Salt', '972182530' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011111@xtec.cat', '$2b$10$oq9wkj6BeirR5xpMJr8hAerOTkto/4mOQ/Qg.baeq2FyuHVR/3.Pm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre de Dansa de Girona', '17011111', 'c. del Mossèn Baldiri i Reixac, 14, 17003 Girona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011133@xtec.cat', '$2b$10$33NbobsDLvkWbqlN7r8yXubom45k8heZXmxvPOdMkeLyf33nl10IG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'ETG Empresa', '17011133', 'c. Emília Xargay, 4, 17003 Girona', '972208316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('b7011157@xtec.cat', '$2b$10$RA5wKDfvywI7ZQMT6ScB1OXyjWp8Vu6w1W1mbuVHqD8j0uimQj06y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Noima', '17011157', 'c. Fluvià, 25, 17800 Olot', '689175996' FROM new_user;