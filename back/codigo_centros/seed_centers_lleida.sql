
WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000031@xtec.cat', '$2b$10$.czgjjsQ107p9wJcdVPPZeczZTekdOYGvg0dHkj3sZg4tRfBcqsmy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Andreu Farran - ZER Montsec', '25000031', 'c. Cabezas, s/n, 25691 Àger', '973455091' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000067@xtec.cat', '$2b$10$mBtdVB8VfmWHCiqT6M8cDOU0cbmXtlyH.ZJ6aap.W20oQy/7wfxSm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Macià-Companys', '25000067', 'av. Agustí Ros, 3, 25310 Agramunt', '973390668' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000080@xtec.cat', '$2b$10$ZbwFJlH06PX2DOUHz48/4.oKTRB4/AnPK2PKbeZlL6oDUCi99IJdO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mare de Déu del Socós', '25000080', 'c. Àngel Guimerà, 1, 25310 Agramunt', '973390083' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000110@xtec.cat', '$2b$10$moDBczd5WLbmIhW7SRIZ.OBejzt5dT05Ct21h.sWiwQ9BaRoRkIWG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Arrels - ZER L''Horta de Lleida', '25000110', 'c. Escolar, s/n, 25221 Els Alamús', '973199211' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000122@xtec.cat', '$2b$10$dxeD0OGtk2/R7wlrmtzqh.R2Pq32CMMd8BKNXMRRhsq1a4JMPaWPq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Esteve - ZER Urgellet', '25000122', 'av. Zulueta, s/n, 25718 Alàs i Cerc', '634769673' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000146@xtec.cat', '$2b$10$OzQYd4yRqXsDLGIJd5c7kuEsjscNXOhEyfA.Jt74K.DnC4exx6xS.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de Montserrat - ZER Vall de l''Aranyó', '25000146', 'c. Ntra. Sra. Montserrat, 25155 L''Albagés', '973121200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000158@xtec.cat', '$2b$10$g.wSSR/.Y7x66eJvN92Vhei5Ez5k87mqeZvKDe3l/gMpJG88Pvpz.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Salvador', '25000158', 'c. Sudanell, 2, 25171 Albatàrrec', '973720639' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000161@xtec.cat', '$2b$10$wnct8nhr2a3cCR4Lg/Kz0.ne3FakVtCec3fjgCoNjOIw.E.HXSVFy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Àlber', '25000161', 'c. de la Creu, s/n, 25135 Albesa', '973186448' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000171@xtec.cat', '$2b$10$Ts4.PggdyggOg7UPlPWtq.BdsgGQqbSdSMqr7/Ie9UnQDhNzdOuHK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Aubis - ZER Riu Set', '25000171', 'av. de Catalunya,17, 25450 L''Albi', '973175505' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000183@xtec.cat', '$2b$10$aA5aWm9EL9RuwG6cDlgjXe1ZUW2YtG0K2fbiafhN9DTLO5d.RmKz6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Dula - ZER L''Eral', '25000183', 'c. de les Escoles, 37, 25162 Alcanó', '973136276' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000195@xtec.cat', '$2b$10$b8p0OtceD/9c5yUFf7ooa.qhoyZB/XNLW2P.aRJ15EVI6Zk2pf/Xm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Comtes de Torregrossa', '25000195', 'c. Escoles Noves, s/n, 25180 Alcarràs', '973784327' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000225@xtec.cat', '$2b$10$GNGC6AzykDVVUjbo7GT1huKZkd6o17NNhzl2ZCqu.fb8fNhm4DHzS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Carme', '25000225', 'c. Bassa Bona, 43, 25660 Alcoletge', '973196200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000250@xtec.cat', '$2b$10$4cYYsY.NeUfkBQzeKOGQoOPvcpblDCvCIoqSLAFrAzrAdRqxlgdn2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària d''Alfarràs', '25000250', 'partida el Sot, s/n, 25120 Alfarràs', '973760100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000274@xtec.cat', '$2b$10$KgzgFg7r4JpOnI39qRkfc.cXUgx7KSJvVOIid3K12uMqBTqmrE2rS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Alfés - ZER L''Eral', '25000274', 'camí de Sunyer, s/n, 25161 Alfés', '973136431' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000286@xtec.cat', '$2b$10$wByae1Geq/VJAsHrIxSQuekZvZdoZGuqWbzsKTl1c14GqPZjIU06G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Blai - ZER Serra Llarga', '25000286', 'Carretera, 25130 Algerri', '973426111' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000316@xtec.cat', '$2b$10$ZzXOClgM0fp8wA7FJc/k/./4eJAXN1jc1nbaNNnZOAjYfHQaLwx86', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Alins - ZER Alt Pallars Sobirà', '25000316', 'carretera, s/n, 25574 Alins', '973624407' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000341@xtec.cat', '$2b$10$p8ZRn1Sh/NH4g6iQfwamSODghw18Sig1S8B1ZlRZc6i4JT7CQQMUu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antònia Simó Arnó', '25000341', 'c. Tossal de les Creus, s/n, 25100 Almacelles', '973740842' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000468@xtec.cat', '$2b$10$WsZK31ZDRysiWA8EsDSzc.P9u40dCbb5So2J/tgy5rt5u4XSnpRZu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Serés', '25000468', 'p. Gaudí, 1, 25110 Alpicat', '973736464' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000481@xtec.cat', '$2b$10$sDSJRHs91BBYedBSWSIq2eyEiNv8hW56N9MC9XwrQi.6rcPYfEt9y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Isidre - ZER Ponent', '25000481', 'c. Lleida, 2-6, 25112 Gimenells i el Pla de la Font', '973748413' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000511@xtec.cat', '$2b$10$Tacy4qBolmwlJ6eJWHKt3On3Atxqqn55hPU6In17F3rJzMtkK8dHe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Inocencio Pardos - ZER Ponent', '25000511', 'c. Escoles, 1 i 3, 25114 Gimenells i el Pla de la Font', '621236188' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000535@xtec.cat', '$2b$10$elnN5VHMIWUD2pfg4UAAs.pJgLi55rvASGGAQxDMdCZl92GgYuBeO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Loseron - ZER Val d''Aran', '25000535', 'c. Mola, 6, 25598 Naut Aran', '973641501' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000559@xtec.cat', '$2b$10$c4w91Thx4Jw5G7HuJpGHi.3vuYvluUmgIL57HQkLDzbnAFssMtHYW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Martí - ZER Val d''Aran', '25000559', 'c. de Sant Jaume, s/n, 25598 Naut Aran', '973645817' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000560@xtec.cat', '$2b$10$kJ/8N56Mu7t1HouuKivG6usUYN3oy8F4J/HhNmeMmvhsTBWA2L0Se', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ruda - ZER Val d''Aran', '25000560', 'c. dels Estudis, s/n, 25598 Naut Aran', '973644564' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000584@xtec.cat', '$2b$10$CtmlXPIClR2lBjAvUtF7aO4K/e18/lyIz0byW.hFn4vBjtqerOIqy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Creu', '25000584', 'av. Catalunya, 40, 25320 Anglesola', '973308452' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000602@xtec.cat', '$2b$10$rhY2TRXZdMs/svfCsBtsGuzN.UR9.jNfpE9qM3YFJL2V63eCqYVZi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Albirka', '25000602', 'c. Rossend Vigata, s/n, 25140 Arbeca', '973160067' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000626@xtec.cat', '$2b$10$16pE92xPj6XgXc.lUwoFz.gU.JejtPzrNGdtdLpOWdDL03xPR8quu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Til·lers', '25000626', 'c. Sant Ramon, 16, 25150 Artesa de Lleida', '973167843' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000638@xtec.cat', '$2b$10$SvfwrMSEY4G4PUCy4fdzb.mYb.B.eWSLWdp5uBM9E6P/GM4A8wFve', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Planells', '25000638', 'ctra. Montsonis, s/n, 25730 Artesa de Segre', '973400196' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000675@xtec.cat', '$2b$10$7u4bLCnWNgsb3EzoVLxQbOsjgmwIcb2STjDwUNp2eGjfXWlL8uK6a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de la Guardiola - ZER El Romaní', '25000675', 'c. de la Mare de Déu, 25617 La Sentiu de Sió', '973424100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000699@xtec.cat', '$2b$10$tfGriVVpjKavH/uAj32zDOfcTxzfzCMW..XpF6MWCBk3sukPayHW6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Les Avellanes - ZER Montsec', '25000699', 'c. Nou, s/n, 25612 Les Avellanes i Santa Linya', '973454202' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000717@xtec.cat', '$2b$10$ink5PUfzXL7zmkerKFHSquFd1Fbm3BXT3RyV8fBl2znT9.6pGJ84i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Tartareu - ZER Montsec', '25000717', 'c. Soldevila, s/n, 25612 Les Avellanes i Santa Linya', '973454191' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000730@xtec.cat', '$2b$10$T.PXZYW8d99km941pKSgbuUtUzQQiYBifmciHdKYU4DEfX/7Fe/we', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Francesc Feliu', '25000730', 'c. Joan Maragall, 25, 25182 Aitona', '973794419' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000778@xtec.cat', '$2b$10$mxDe5DsX8Leg7Q250WukUe/44Yiz8/IWqcenNWjYLgBnKpNnixO/e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Gaspar de Portolà', '25000778', 'c. de les Escoles, s/n, 25600 Balaguer', '973445834' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000781@xtec.cat', '$2b$10$gQsYKs9.00mhVfQpbgxMy.v1ko5fi6iWY3hYxgcW/z26XA68Z3O7.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àngel Guimerà', '25000781', 'pg. Guimerà, s/n, 25600 Balaguer', '973445172' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000811@xtec.cat', '$2b$10$EL3wVBKbQ2WQwyJxr04EHO4o/bnE20W8vE9yePY/LGVqj0wkPqgcy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pia de Balaguer', '25000811', 'c. Barcelona, s/n, 25600 Balaguer', '973445727' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000821@xtec.cat', '$2b$10$ykW8SAGjAwTqcS3Ra45CguKNdNZNVqRfIBtzvUl5WzY9FFxqDjFKa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Balaguer', '25000821', 'c. Sanahuja, 39, 25600 Balaguer', '973445164' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000833@xtec.cat', '$2b$10$PecCu1O8YUKg6lvkXg0xhe5pEf6FBK4MKnmQfS09JVaJl9srN9Wly', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ciutat de Balaguer', '25000833', 'c. Urgell, 94, 25600 Balaguer', '973445721' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000845@xtec.cat', '$2b$10$yTWiGnSp3D6/QxG0TJjvie2mtTGfjuNbjQg6ShJKGPgf3SCfgkiVu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària de Vallfogona de Balaguer', '25000845', 'Finca l''Empalme, 25680 Vallfogona de Balaguer', '973443650' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000857@xtec.cat', '$2b$10$oUKbz5ATNE6x6ZVvcTXKYO7rDWB/mby1voUfdpK6QtJkGQYJZVF6m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Noguera', '25000857', 'c. Joan Miró, 2, 25600 Balaguer', '973446325' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000869@xtec.cat', '$2b$10$y.mWqvdDlsfJKCgUUBoWHuy7Ln8Pelald/axBO7m3KOQUcJMIDXAa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Roc - ZER Riu Ondara', '25000869', 'c. Ramón y Cajal, s/n, 25262 Barbens', '973718158' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000951@xtec.cat', '$2b$10$uVVDXSvzZRA4NGfPW.TRpOy1M1VU9uuL8iHEAfJ4rteMBClcFAyDi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pere Teixiné - ZER Riu Corb', '25000951', 'c. de les Escoles, s/n, 25266 Belianes', '973331118' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000961@xtec.cat', '$2b$10$2kygUObpSsW1LCvDaIAAkuHqfVDAhC6XmwwYfEMPTvBLrsnciItpq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bonavista', '25000961', 'c. Bonavista, 1, 25337 Bellcaire d''Urgell', '973586002' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5000985@xtec.cat', '$2b$10$y4d63ZFZgFjepF9BQHtyk.iHJ1SZtyHNRGcrYohPcfIiWPi7pzhAe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramon Farrerons', '25000985', 'c. Afores, s/n, 25220 Bell-lloc d''Urgell', '973560611' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001001@xtec.cat', '$2b$10$3sDZMm3du1o1VBMwwkSm2.ZldHD57QzUqh/LuoUA9skbdqL9WI4Oi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Bartomeu - ZER Espernallac', '25001001', 'c. Domènec Cardenal, s/n, 25336 Bellmunt d''Urgell', '973610603' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001011@xtec.cat', '$2b$10$N56/FUsdOhe9C9VZQv2f4u.osAlee4xTCspz4SCffYJ4ncDbAXFoW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Valeri Serra', '25001011', 'camí del Coscollar, s/n, 25250 Bellpuig', '973320167' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001023@xtec.cat', '$2b$10$F5dvvZp6/gu6j8bWwlFKWOACGzmmZ5QuNStfvbE8tvkAwOvMGVziW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Bellpuig', '25001023', 'Camí de Castellnou, 7, 25250 Bellpuig', '973320027' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001084@xtec.cat', '$2b$10$1vWSEgCEZw8zJcD7BQyIeuKoYFO4gyUYMxp3KggeVLi0Mo8TDIEIa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joaquim Palacín', '25001084', 'pg. Urgell, 17, 25142 Bellvís', '973565328' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001096@xtec.cat', '$2b$10$6oJE.XH04e1CAcgjHnUKvuDALlCPOf4SBYkfKpRLWbjm83mnGZpwm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Joan', '25001096', 'av. de Lleida, 15, 25132 Benavent de Segrià', '973777517' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001126@xtec.cat', '$2b$10$F/QZSKtKdQpA5oA6eVCLUuoqIsI/0N8F24w67dIokvd0HDM6PwccO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vallmajor - ZER Elaia', '25001126', 'c. de les Escoles, 5, 25178 Bovera', '973133536' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001138@xtec.cat', '$2b$10$nzsZRiAQjoMkOw0.OMRobOv1uuoBoG9lAC8v3RBbMVq5DMmNiTvVq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Casteth Leon - ZER Val d''Aran', '25001138', 'c. Afores, 25551 Es Bòrdes', '973640586' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001141@xtec.cat', '$2b$10$Y5PiZcVRUJbC/Cvi9wFrle1Kr44nUyepLkF1HQekeOuI7fgqiamVC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan XXIII', '25001141', 'c. Diagonal, s/n, 25400 Les Borges Blanques', '973142328' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001151@xtec.cat', '$2b$10$pwFqQxKIDiDc1qBZcH4HwuCIuIje94l3IV1g40LOjW4/36u5hlb0O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mare de Déu de Montserrat', '25001151', 'c. Mare de Déu de Montserrat, 1, 25400 Les Borges Blanques', '973142975' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001175@xtec.cat', '$2b$10$LQHaTW8/X/erN8MZhVBMhO/wXKPb6r/Z9x/YDGJ6jDI85k/imbShK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària de Les Borges Blanques', '25001175', 'Finca La Pujada / Ap.Correus 84, 25400 Les Borges Blanques', '973143169' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001199@xtec.cat', '$2b$10$Ab3cZ6dz3x00SbJTgIw5y.D0ejZzDO4Ea6qfEo3xUmqfT0oU9oL7e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Ròc', '25001199', 'c. Margalida, 2, 25550 Bossòst', '973647200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001229@xtec.cat', '$2b$10$seoYV..8VzYEwVu45wzWZOegW/PPPClzgG9ufbXNBEY26ouiFm7Sa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Dos Rius - ZER El Jonc', '25001229', 'av. de Sant Isidre, 14, 25613 Camarasa', '973420158' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001242@xtec.cat', '$2b$10$dIqIhvODUxUJ/7krgXMFdOba3C7qJe4bQFMN2puNyopm0oKis6A4q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Castell-Ciutat - ZER Urgellet', '25001242', 'c. Sant Isidre, s/n, 25710 La Seu d''Urgell', '634770617' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001254@xtec.cat', '$2b$10$gvw8xujtF0zcDUcZxuPfPOMb7VsA6maEmiAzgcLDbSfQnRuYe4Kma', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Timorell - ZER Vall de l''Aranyó', '25001254', 'pg. Moragues, s/n, 25154 Castelldans', '973120317' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001266@xtec.cat', '$2b$10$nZHR2r1K.omODrWBbPdK2Oj8u9FIRA184zCQlEACjKHn6gs2w//c.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Estel - ZER Vent Serè', '25001266', 'c. del Calvari, s/n, 25265 Castellnou de Seana', '973322202' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001278@xtec.cat', '$2b$10$fb22Qg82MY210EfE3.W8BupbNsreJmX8Xg9s0hR4jf3m7ijNNm3Gq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Maria - ZER Serra Llarga', '25001278', 'pl. Sant Antoni, s/n, 25136 Castelló de Farfanya', '973428100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001281@xtec.cat', '$2b$10$GnPEk3wzoek8RRSQf6ZKpecvAA0Ci69C0/DQR2ev5B6L3pqkMosIe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Terrall - ZER Espernallac', '25001281', 'c. Major, 35, 25334 Castellserà', '973610343' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001291@xtec.cat', '$2b$10$rVSvjwrwawgkxBREJlS1SuD/WyuiYBPRSVpVx51qDn8ZWI08cZ0Wy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jaume Balmes', '25001291', 'pl. de Pius XII, 25200 Cervera', '973530493' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001311@xtec.cat', '$2b$10$zCZGTpoKGaGYpOy22Yg7AOrdpdxpMa9DSv9rc01TJT7gp2z6OdboW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Antoni Torroja', '25001311', 'pl. Universitat, s/n, 25200 Cervera', '973531450' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001321@xtec.cat', '$2b$10$peLq1rnevvHk2i1R7gqjzuQ/7AfySRlvmzvhr0ilUMKePmeSM/BO2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Josep Arques', '25001321', 'av. Mil·lenari de Catalunya, 20, 25200 Cervera', '973530765' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001333@xtec.cat', '$2b$10$WNStnvHBQAo2WZvWGLDGR.qc0AdX08WaMMytFTeTaNUF7bF/MtDwG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Cérvol - ZER Riu Set', '25001333', 'c. dels Països Catalans, s/n, 25460 Cervià de les Garrigues', '973178148' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001357@xtec.cat', '$2b$10$gKZjZHDDyk26XMvWQQo4nOiOaxYvxDHtoOkJcRgLWeHCvCes.RsQS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Ciutadilla - ZER Guicivervi', '25001357', 'c. Afores, 25341 Ciutadilla', '973303336' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001400@xtec.cat', '$2b$10$r4ctBn0/nbUSrLD4SrWUaOhAmEBFBoiEUIQCbuFPnqxK0Db1Kz4je', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Climent - ZER Narieda', '25001400', 'pl. de les Escoles, s/n, 25793 Coll de Nargó', '973383400' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001424@xtec.cat', '$2b$10$KMfsHldLNYgqJcn5pH5xo.FcLYx2Al4aQvryWVsmxXxf48yF9rZK2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sol Ixent', '25001424', 'c. Calvari, s/n, 25137 Corbins', '973190512' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001436@xtec.cat', '$2b$10$xscZ0xCgkCTTQvQOcMOgbeo8rsjJVABQl7WOqMbU5IZFz.Wr3sHYu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sol Naixent - ZER El Romaní', '25001436', 'Carretera, s/n, 25737 Cubells', '973459180' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001473@xtec.cat', '$2b$10$FNShX28ZEFZtwgmOVRXXE.CTFeVfu.VSTAyxmvL5ryYxXmmidjqMO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Porcel de Cervera - ZER Pedrera', '25001473', 'av. Catalunya, s/n, 25410 L''Espluga Calba', '973156258' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001539@xtec.cat', '$2b$10$SDCxLtRsFgU5/RwN0JuKjO6g7lDMauBV9d5TnoSIjPRlmOiIOE9xm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Closa', '25001539', 'pl. de La Closa, 7, 25580 Esterri d''Àneu', '973626048' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001606@xtec.cat', '$2b$10$IYU37Wm5OKv6UnEs9EKz6e.Rj0p4uimJDKGYZBu2QPfPJg2HmLlWq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Minyons d''Urgell', '25001606', 'c. Afores, s/n, 25244 Fondarella', '973711779' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001618@xtec.cat', '$2b$10$IWPL7ol5lRnw.UJTqgTai.HHfb68LC38sUSr4hw5CFpyNwLiOpk8.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Guillem Isarn', '25001618', 'c. Afores, s/n, 25332 La Fuliola', '973713039' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001692@xtec.cat', '$2b$10$7Kfb2LEpxrhzZ3nqlTZXv.WqaMjEPVwF8tcb9Z9fiBN5kpzig0Zsy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Francesc Arenes', '25001692', 'c. Raval, 67, 25241 Golmés', '973603122' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001709@xtec.cat', '$2b$10$mFQ3U9bGNw1I0YeFcb2ihurmcDeqYcHyt6XkYBz7v4K3jgd/6wrjK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Margarida - ZER Alt Berguedà', '25001709', 'pl. Major, 1, 25716 Gósol', '973370264' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001710@xtec.cat', '$2b$10$WMUSyaQ6m9CKc1GxwbH/5.yqLCVw82gNCMVr.3Jy61qOHuOC8lkFm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de la Granadella - ZER Elaia', '25001710', 'pl. les Escoles, 3, 25177 La Granadella', '973133368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001722@xtec.cat', '$2b$10$E38UG/wCvC7cgdAOFw9G5OfN3I1lXmk0rZJ5FpyVEZB/ZUfBYO7za', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jaume - ZER L''Oliver', '25001722', 'c. de Barcelona, s/n, 25185 La Granja d''Escarp', '973782072' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001758@xtec.cat', '$2b$10$PaBuSeDuWwPeYmFVw9XzFOfluO61bjGE2F04GjWO6KB7eiNts2OBq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Guimerà - ZER Guicivervi', '25001758', 'c. La Salud, s/n, 25341 Guimerà', '973303340' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001761@xtec.cat', '$2b$10$MsqfhP1zgnFJayW43DbgKOF2HiXq3ZBEQ7TJsxjN3l.GE5dXDdMrC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramon Faus i Esteve', '25001761', 'av. del President Lluis Companys, 57, 25210 Guissona', '973550319' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001771@xtec.cat', '$2b$10$7De0NPWO2THATHEI6u9pIurvDU4bvPk1RRjDO8H5fEoLjKXrhh70a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'FEDAC-Guissona', '25001771', 'c. Raval Bisbal, 42, 25210 Guissona', '973550082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001795@xtec.cat', '$2b$10$yLBBgPLj/3jfveKmuxMcT.d0gC2B1ZxlrlFONuCnF9J8TJwo4y1zG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Sebastià - ZER Serra Llarga', '25001795', 'pg. Professor Gimeno, 1, 25122 Ivars de Noguera', '973761336' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001801@xtec.cat', '$2b$10$1Si/ZvjfwW2v3D5XcRQFzec5MBtcjRz6tq.8fG4MPHmiDDeNQo5P.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de l''Horta', '25001801', 'ctra. de Barbens, 42, 25260 Ivars d''Urgell', '973580352' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001886@xtec.cat', '$2b$10$zeL2n58mPn7V.6/qpwl3de.eydc3GiYw8rKW8DFYxiZphJdm9ExOS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Aeso - ZER Pallars Jussà', '25001886', 'c. Portal, 26, 25650 Isona i Conca Dellà', '973664072' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001916@xtec.cat', '$2b$10$vcyGlG2WK8dBcP44E0YHXe7iNwTb2ZixNoQgOmgJxZ.wK6jedu1su', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Espígol - ZER Garrigues Altes', '25001916', 'pg. de l''Esport, s/n, 25165 Juncosa', '973128111' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001928@xtec.cat', '$2b$10$NRuEwTFKdCSjFDCLFvI9ieqcASIlAA31JlRLfVldpMLnJayNlb55C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Manuel Ortiz i Castelló', '25001928', 'c. Prat de la Riba, s/n, 25430 Juneda', '973150101' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001953@xtec.cat', '$2b$10$05oq9kyOTu7fDNvgAvNqjOwPd.e9i1HflkePUvCd8r1w1HTpFQOr.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Enric Farreny', '25001953', 'c. de Barbastre, 2 (La Bordeta), 25001 Lleida', '973202141' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5001990@xtec.cat', '$2b$10$mFxBYLPvIEyO2T7W84Vg5eJM8ivfspSDdWmX.t8VFsBiy1TUkbo/2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antoni Bergós - ZER L''Horta de Lleida', '25001990', 'Partida de Butsenit, 43, 25194 Lleida', '973263028' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002003@xtec.cat', '$2b$10$wNZcDf7vPzCyHaTNZewn9.klJqH.ZXc2bIfnoF4JwHLFVEkllgiQa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Maria de Gardeny', '25002003', 'c. Rossinyol, 2, 25003 Lleida', '973271571' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002064@xtec.cat', '$2b$10$cVroqE221S3Jzdq0sM/qAuN9bykJMAW2N9qwse8uBjy8Ee49oVGOK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Camps Elisis', '25002064', 'c. Santa Cecilia, s/n, 25001 Lleida', '973201191' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002076@xtec.cat', '$2b$10$TucJPKcaHVrYjgM//p8tR.JmtiQ9u5bNjL.BzW7c27s0HvwbIVCFK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Seu Vella', '25002076', 'c. Cavallers, 42, 25002 Lleida', '973254742' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002088@xtec.cat', '$2b$10$9YSWZoIAiHsictqn2QCsHucDt1WpJOL/TZXkRa7Yx7i2da7w.kK1S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Riu Segre', '25002088', 'av. Tortosa, 86, 25005 Lleida', '973234507' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002091@xtec.cat', '$2b$10$ZUDzbBDZlZpB4mfV1dRiE./exxRZ2ezKN6qHZQkMu4EP7FYH/ABPO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Magí Morera i Galícia', '25002091', 'pg. Onze de Setembre, 139, 25003 Lleida', '973278884' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002106@xtec.cat', '$2b$10$P0NqA1jb0fqx18ae84gYLuWF/picMge1gE7ZxJ7MjKTz3o9zaRdHy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pardinyes', '25002106', 'c. Anastasi Pinós, 33, 25005 Lleida', '973236863' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002121@xtec.cat', '$2b$10$yY7mJJGuLWcV8UPmK3e5L.GMZCs8f2ydSDVEB5.ivEULuyHIU7gj6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Príncep de Viana', '25002121', 'c. Anselm Clavé, 22, 25007 Lleida', '973233886' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002131@xtec.cat', '$2b$10$NgO5ivfYB.L0Ur3it1/tkuE5WU1aamvSuD7bCxEIVJxSqzekVzi5e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Creu del Batlle - ZER L''Horta de Lleida', '25002131', 'Partida Jensana 11, 25007 Lleida', '973270046' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002222@xtec.cat', '$2b$10$JomYxoYXcuz.hK5D1wmDpeIq6./qENL.x7bpfHCvW7eQQZkr1pnZ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'FEDAC-Lleida', '25002222', 'c. Vallcalent, 42, 25006 Lleida', '973282563' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002234@xtec.cat', '$2b$10$nbB4YWwbSiDoZ6MYAYfNE.LkOougYPO6X03eNZfJU2xKw33WvNhWy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Santa Anna', '25002234', 'rbla. d''Aragó, 15, 25003 Lleida', '973266399' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002313@xtec.cat', '$2b$10$TZMG3fckkjBCaHrwA0lbkesJRrHP1YrybRLuas23qfm0A3RpUcNzC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Maristes Montserrat', '25002313', 'av. Catalunya, 3, 25002 Lleida', '973266799' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002350@xtec.cat', '$2b$10$bKLiTp9QPKIK5Y4V8e4iMOuOpP5Vso9NZ0WaUlxl3Ul5h0L9l.NSG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Lestonnac-l''Ensenyança', '25002350', 'av. Prat de la Riba, 38, 25008 Lleida', '973231304' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002374@xtec.cat', '$2b$10$ryuI0zMijMkYKnvDhP7EGOAognmuo4prMznQ20ctvzVQxYJchg15C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'El Carme', '25002374', 'c. Hostal de la Bordeta, 11 (La Bordeta), 25001 Lleida', '973201181' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002431@xtec.cat', '$2b$10$PbY2G41iNy8XWvX6Et6MM.lQizMbyWgZ9OaFNOTrvwzV7wP0Mogti', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sagrada Família', '25002431', 'c. Democràcia, 20, 25007 Lleida', '973235140' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002489@xtec.cat', '$2b$10$d8aNXK2ta5qlBkD/.BXFKO51YkIzEb5MUOnUzaakOBHsc2B.g/YvK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mater Salvatoris', '25002489', 'c. Partida Pla de Montsó, 30, 25193 Lleida', '973234050' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002571@xtec.cat', '$2b$10$EmL8TgcXoQuYx9hGWRTwreCShDJK9XSFhhe/inwh2jXqqpEnOisRO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EB privada Cuca de Llum', '25002571', 'c. del Pintor Benseny, 3, 25008 Lleida', '973241257' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002623@xtec.cat', '$2b$10$MGQ2XDcqysOduB0Z9.U4HuDSmOPEBeq89Mhkdotg37Jx40ls8u61O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Jaume', '25002623', 'c. Castella, 6, 25003 Lleida', '973261247' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002647@xtec.cat', '$2b$10$.QefzwC58Q0Dr7OxFbXDs.kt9MyqdNsAI0t95rYbCyZKg9p504w/C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Episcopal-Mare de Déu de l''Acadèmia', '25002647', 'c. Dr. Combelles, 38, 25003 Lleida', '973263100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002659@xtec.cat', '$2b$10$Ib4mM5CUSjjjbn61HdlnSOx9PzwzYE5WXx9DZM1PQF0WtOAQ130Ea', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Josep de Calassanç', '25002659', 'c. Pau Claris, 5, 25008 Lleida', '973234949' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002672@xtec.cat', '$2b$10$4shdqh.bbPazth39Pr1InOq.TTX.0Pn4qxR9PgehayAJeQ/9wxSN6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Pràctiques I', '25002672', 'c. Ballester, 21, 25002 Lleida', '973267206' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002684@xtec.cat', '$2b$10$2TBfk5Ny.kKNeIGpiBspsOXC5nkU5PPpZwdTpeZOf9IP/iE085ASe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Samuel Gili i Gaya', '25002684', 'c. Ton Sirera, s/n, 25002 Lleida', '973265438' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002696@xtec.cat', '$2b$10$a4E9Om0TdL1xykW5m2E99.54XnSvpsGPES.TJyNRLKN9AL6zPEBXi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Màrius Torres', '25002696', 'c. Narcís Monturiol, 2, 25002 Lleida', '973260900' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002726@xtec.cat', '$2b$10$RDQrvz7IChXes6KOn/ERB.WznGKTw5D.SgckpMmXQn1dV2LcwHYtC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Guindàvols', '25002726', 'c. Eugeni d''Ors, s/n, 25196 Lleida', '973238047' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002751@xtec.cat', '$2b$10$WBBbYmhXC2uKlUOSDZUciuwxtWkdrITcdNVPHWtQqoR35tpPhDDqO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Martínez', '25002751', 'ptge. Santa Isabel, 7, 25007 Lleida', '973241072' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002775@xtec.cat', '$2b$10$Bqjxg2TJo12lvNy3yIKFpOvdauESs1aeYr..bi5YkeFFgPxOrnLXK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Ilerna', '25002775', 'c. La Palma, 29-33, 25002 Lleida', '973235986' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002787@xtec.cat', '$2b$10$Ys.JoVja1OinBNMG6A6Iuuir/mYsAKQTjNyu1C3auG1Z8qIItUdmu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Oró', '25002787', 'ctra. de Saragossa km. 464,2, 25194 Lleida', '973268399' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002799@xtec.cat', '$2b$10$YcoFYQ.9qlYMOEpS5BQyIel2HVjfQ6luDk8udSuZz8iP..WWkzuVa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Caparrella', '25002799', 'Partida Caparrella, 98, 25192 Lleida', '973288180' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002854@xtec.cat', '$2b$10$sboDnhUZ3N6q0Xj056T4FuAs9H2hv3r7Ngydnpz59dP68ZnR/mp42', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Segrià - ZER L''Horta de Lleida', '25002854', 'c. Gran, 58 (Partida de Llívia), 25195 Lleida', '973230302' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002911@xtec.cat', '$2b$10$kpqvAcHqKI3eQ.Xx0e0zTuhNec5mmEvg8G9uUXBqQOfP/m9u5gKZe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Jesuïtes Lleida - Col·legi Claver-Raïmat', '25002911', 'ctra. d''Osca, Km 17(finca Vallfonda), 25111 Lleida', '973724111' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002921@xtec.cat', '$2b$10$4MB1I2vabiq6y7rQi0W0AOOjTQhQMSQ3ytMO1UMO2FySNLlIXH8b6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Vilot - ZER Ponent', '25002921', 'c. de Suquets, 25113 Lleida', '973748400' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002957@xtec.cat', '$2b$10$voHcqz6kb8fbREIXRL9RoeSFKyfeHhn15Cf2A10EFLrc.J.x/7gyi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Estudi Alejandro Casona', '25002957', 'c. Els Banys, s/n, 25540 Les', '973647300' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002970@xtec.cat', '$2b$10$KhvXTaRD5RPBr8jUQabqdOY4zWhukNss8vA.JShmHUN5WjvA2BKs6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Sitjar', '25002970', 'c. Pau Casals, 2, 25240 Linyola', '973575378' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5002982@xtec.cat', '$2b$10$Fic1iz1bdOmGcFuqgPTnH.U/uKRqZd6WxahEMqkY/WxwD86XCf.p2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Lladurs - ZER El Solsonès', '25002982', 'ctra. de Solsona - Sant Llorenç, km. 7,5, 25283 Lladurs', '973299060' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003019@xtec.cat', '$2b$10$tiLGhU6hGMLn1JLDA1jF1.t.FLopISyrxneo4ZOCMYwr7Z240mi2S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Arc d''Adà - ZER L''Oliver', '25003019', 'c. Raval, s/n, 25179 Llardecans', '973130236' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003032@xtec.cat', '$2b$10$naiw4ZVegJ2Qqs.vYNa.HestRK6P.lsnSzqenASZgJr9aS0ZJ31ze', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Llavorsí - ZER Alt Pallars Sobirà', '25003032', 'av. de la Vall d''Aran, 13, 25595 Llavorsí', '973622125' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003056@xtec.cat', '$2b$10$JczpOd8KAvWfwD8tg159E.x11ZdE83lZ8E1ykuXgCmSNYO7.vyAoy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Portella Blanca - ZER Baridà-Batllia', '25003056', 'c. Major, 1, 25726 Lles de Cerdanya', '973515245' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003093@xtec.cat', '$2b$10$c/dyi2wq1nFtt5Y72wk.gushnQoAymJINw3txlQt2pBEb0eaSs5Ta', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Llobera - ZER El Solsonès', '25003093', 'ctra. de Torà, s/n, 25281 Llobera', '973250058' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003111@xtec.cat', '$2b$10$oljx.nw46926jBc0Cs/Z7O17Z1.yCZhIDm6y.UPQt0w3eEWQZMsKe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Massalcoreig - ZER L''Oliver', '25003111', 'c. Nou, s/n, 25184 Massalcoreig', '973793596' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003123@xtec.cat', '$2b$10$gEg0RmTGdUUAO5V/sTq7O.41Z9gCb6vzk9Xk6ISpvOJnTBRpYqifK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Otogesa - ZER L''Oliver', '25003123', 'pl. Eliseo Sales, s/n, 25179 Maials', '973130075' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003135@xtec.cat', '$2b$10$bcVtOG6sk3aIgzQnddavxuWyz1bZn9P8waADk8fdhjRZeJOWGrPyG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Ros i Porta - ZER El Jonc', '25003135', 'c. Empit del Vall, 10, 25139 Menàrguens', '973181042' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003147@xtec.cat', '$2b$10$pYBu8wsfkd2ovs9D90Z7.uhG6SGEfRoNu.4MkpjcjIrczZ60Z0pD6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Miquel', '25003147', 'c. de les Escoles, 1, 25242 Miralcamp', '973602701' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003184@xtec.cat', '$2b$10$QFDhO857bKatgsGx1OA56OkFricJl3PHR9r/iuow8voVOHKAF9dmC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '25003184', 'c. Ferrer i Busquets, 17, 25230 Mollerussa', '973600270' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003196@xtec.cat', '$2b$10$PEWmxIhMwqYdtk89mBHFieCyfZkzMsxCxL6lyApbrwUsHXBKsECla', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Mollerussa', '25003196', 'c. Crist Rei, 5, 25230 Mollerussa', '973600455' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003202@xtec.cat', '$2b$10$QJOtHl/Xn2iT./ZZxXKNdudwMrQb91RPJwfShy8H/dLpLzLdKxD6q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Mollerussa', '25003202', 'ctra. Torregrossa km. 1,9, 25230 Mollerussa', '973600359' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003238@xtec.cat', '$2b$10$sANU6Dc932/ptbJA66kLUO9VIxHLCnPmKSJebk7CzcT4OZMbHGSf6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Butsènit - ZER El Sió', '25003238', 'c. Buenos Aires, s/n, 25315 Montgai', '973430166' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003241@xtec.cat', '$2b$10$aCJ05yGa0iEpp..8QjJ7LuNhCDBHVpD1JikklU4fKR9SEiezAEsh.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Colomina - ZER El Romaní', '25003241', 'c. Canalejas, 19, 25616 Montgai', '973430131' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003263@xtec.cat', '$2b$10$L0KlOJdju4vTZo8YexTlWOixD3OUdr6iMHQTJ4uaJSY5bhrcFGAiS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pere Sarret - ZER Baridà-Batllia', '25003263', 'pl. Pere Sarret, s/n, 25724 Montellà i Martinet', '973515154' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003275@xtec.cat', '$2b$10$.jIKFe2cXz6VwzzT2rGlKu8HTwNMg0BZs36PMHO/t/NfeSKJCBku6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ridolaina', '25003275', 'c. Tossal, s/n, 25725 Montellà i Martinet', '973515177' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003299@xtec.cat', '$2b$10$RmWvZ/yfLPUnQFprsbWnH.H1nYSIOqUuKIjIhg7ZzbLOCfxucY6nu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rosa Campà', '25003299', 'Cami el Poble, s/n, 25711 Montferrer i Castellbò', '973360421' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003305@xtec.cat', '$2b$10$.9Fm.67BKWY4GZiki1J5leWe9WnKRrrsC2NRFkwlvL7OCI2sApmSW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Isidre - ZER La Coma', '25003305', 'c. de la Creu, s/n, 25172 Montoliu de Lleida', '973720534' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003330@xtec.cat', '$2b$10$m6Vat/DPZCsQVKKlIULO/upRTlZhowu1cKPKWPu49IM3OD.xrOimC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Aiguadora - ZER El Solsonès', '25003330', 'ctra. 26, Km 116,5, 25286 Navès', '973482453' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003469@xtec.cat', '$2b$10$ppPPQHqv91sygypriB/7KOsVwBUaAxnvblxrUER37JtfgGjVujEiG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Miret i Sans - ZER Narieda', '25003469', 'c. Afores, s/n, 25794 Organyà', '973383138' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003470@xtec.cat', '$2b$10$O8X1M.EOc1n/.jq16kq3r.1n9mebJuHidYs1PMhcAgZ1JULrmm3ki', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Espígol - ZER Montsec', '25003470', 'c. de l''Esglèsia, s/n, 25614 Os de Balaguer', '973450082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003482@xtec.cat', '$2b$10$IALEGQ5kEm0axs7AnyrQtum8DfTQU0R.sI2qS9zZP6qz/ewKB0Ucu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Leandre Cristòfol - ZER Montsec', '25003482', 'av. Lleida, s/n, 25610 Os de Balaguer', '973438061' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003494@xtec.cat', '$2b$10$DsCgTcnJkoDsE9LuS5akkuoy1pfNB7dBHvBgcD1/p4X2gFAR/Fkfa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Arnau Berenguer', '25003494', 'av. Sant Roc, 24, 25243 El Palau d''Anglesola', '973600727' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003500@xtec.cat', '$2b$10$RugoK4/RJ9jcRkA4XfU9/OqGOF.ZHLtMEzWKswjVxNwc4XbHNfBGS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de les Pallargues - ZER La Segarra', '25003500', 'Ajuntament, 25212 Els Plans de Sió', '973520276' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003536@xtec.cat', '$2b$10$rzBHfdeSH2iC.f69Z81D2uMie8ckrHhuDaSrIy0uQftVmBvEUvC5y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de la Coma - ZER El Solsonès', '25003536', 'Ajuntament, 25284 La Coma i la Pedra', '973492635' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003551@xtec.cat', '$2b$10$p5RbYhVvPDq9CICu.5AuzO2RZGrV2G7FJbimqKINl333bD3c9Bh7K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramon Gombal - ZER Espernallac', '25003551', 'pl. del Roser, 1, 25335 Penelles', '973610575' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003585@xtec.cat', '$2b$10$mAd2AzhhyzZf.emaxs.RJ.S9.t6bw..fIa5H3P4.mG9LuAU2ZiFya', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Miquel - ZER Narieda', '25003585', 'c. Josep Roca, 12, 25790 Peramola', '973463004' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003627@xtec.cat', '$2b$10$PIy63ztKhQb1wxoDaEn89ePrtwgLw86pHQmR9HB.Tl.4BdqdXDlNi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Sant Climenç - ZER El Solsonès', '25003627', 'c. Sant Climenç, 25286 Pinell de Solsonès', '621213030' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003652@xtec.cat', '$2b$10$4dnPaWn6LZWrlmiKGYSj.uvmLRzhZ9Hjv6iCm3rncGpzKY9w/r/Dm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Roser - ZER Plaurcén', '25003652', 'pl. Catalunya, 1, 25143 El Poal', '973716227' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003676@xtec.cat', '$2b$10$Mk.xchpJsY2jFVJ6IQhvzOOMWWcYm6QM9qIr9hLQ.wjyTq0nCcWFK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Set Focs - ZER Elaia', '25003676', 'c. de les Escoles, 7, 25163 Bellaguarda', '973124075' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003688@xtec.cat', '$2b$10$3AhhCBPV7GoFDr4MAVS9HODK1DWF2HmyGwdPKRTR9I/JBqyoxVEgW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Raiers', '25003688', 'c. de la Industria, s/n, 25500 La Pobla de Segur', '973680232' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003718@xtec.cat', '$2b$10$P7oq8PbI4g0wxrS7c07YxO/VJ1vA119VHn1.iA1cb7Lf/AWpQa7m2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Ponts', '25003718', 'c. Pompeu Fabra, 16, 25740 Ponts', '973460318' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003755@xtec.cat', '$2b$10$T8ADYIO9NNFg7T0EVzbSn.hdiAA3KqtGeTX411/Ozo0GcCbU0H906', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ribagorçana', '25003755', 'c. Aragó, 23, 25520 El Pont de Suert', '973690388' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003792@xtec.cat', '$2b$10$QOVhyv.ePUkTYp698TshIe74Z2fGyzspP5Gb4GsyIYl3RMafyPO7S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Blanca de Villalonga - ZER Alt Segrià', '25003792', 'c. de les Escoles, s/n, 25134 La Portella', '973186103' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003809@xtec.cat', '$2b$10$ph3tFtJnq7JgLjII/.khBOnr7MbBfxUhl2H8xNw.Ubtt.hJTcDHSS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montalbà - ZER Riu Corb', '25003809', 'pl. Catalunya, 25263 Preixana', '973321446' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003810@xtec.cat', '$2b$10$B4ZUuMUQUp219pVOezCOMuW.3/ck8xtJpHiaFjvjctW2tKWWvDn2a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Preixens - ZER El Sió', '25003810', 'c. 1 d''octubre, s/n, 25316 Preixens', '973392229' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003846@xtec.cat', '$2b$10$eJZT8JfQsOgKuYbYTtMQiepGge1uLNptvpY7RftxXUQAkpmaTwZjO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Puig - ZER Baridà-Batllia', '25003846', 'c. del Puig, s/n, 25727 Prullans', '973510671' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003858@xtec.cat', '$2b$10$mF7o0wtcxRGBHy4jFBBAyORO27mn4dm8Oky3HbpEjiaxfJu.hl.xu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Puigverd d''Agramunt - ZER El Sió', '25003858', 'c. Afores, 25318 Puigverd d''Agramunt', '973392510' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003861@xtec.cat', '$2b$10$v8acH7jdiJsRHrVRwznyZOaCxGo.Pj9Xj21sl/R1JYBx8oS1fkKYy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi', '25003861', 'c. Lleida, 1, 25153 Puigverd de Lleida', '973167336' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003871@xtec.cat', '$2b$10$pblLo6H6rMmWTNnFbE7ZZeNQgxk.mNByvd72.InHjjFn.z.1V4CMy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montsent de Pallars - ZER Alt Pallars Sobirà', '25003871', 'av. del Riu, 1, 25594 Rialp', '973620861' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003895@xtec.cat', '$2b$10$yTqPYehLaWW8hPDxpcAh9egOlSXLqst/kItA9ZV3iu2zDMEPzUC..', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Minairons - ZER Alt Pallars Sobirà', '25003895', 'Carretera, s/n, 25570 Vall de Cardós', '973623093' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003950@xtec.cat', '$2b$10$e8Yl5ODQ/5ViLED1XTWQt.ad7vV52a69K9XzSGhIl.yiWXHPXJZDO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Arnau Mir - ZER Urgellet', '25003950', 'pl. Badia, s/n, 25796 Ribera d''Urgellet', '634771456' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5003974@xtec.cat', '$2b$10$1Fvbk.TmigsvqH1XlF1WZuIl.PhYWmneW6XTMlg7z/0Hks7LtwlkO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Freixinet de Solsona - ZER El Solsonès', '25003974', 'c. Freixinet, 25290 Riner', '973481877' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004000@xtec.cat', '$2b$10$yxD77/ByQUt7EmAFsnY.4uuZ1TO4lmizQm3GYN6nIwSNr5w6stcey', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Rosella', '25004000', 'av. Ponent, 12, 25124 Rosselló', '973730306' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004024@xtec.cat', '$2b$10$HQPEY1tjDOSzG7vGOYbXqeqUGohaszG0U9qhA0ZNz22oy0GtwMMGq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Sanaüja - ZER La Segarra', '25004024', 'pg. de Ronda, s/n, 25753 Sanaüja', '973476136' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004036@xtec.cat', '$2b$10$4f4s9dw5.AO6X81fXdRzZeIoIH6kIjMQRhWu2sZfyqPTr64zcY7QK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Estel', '25004036', 'pl. de la Segarra, s/n, 25271 Sant Guim de Freixenet', '973556286' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004073@xtec.cat', '$2b$10$XzNBZX2BUL4sCUuY5h1wkeGkczBY0.SGTFsyg6v9AphycqoN1PoJ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de la Mercè', '25004073', 'av. Santuari, 25215 Sant Ramon', '973524281' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004085@xtec.cat', '$2b$10$7TK/QQQBAgWNqVnLXzGYdu67GkCHx8LetXHnLZ15.6P7Di97F/EdW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vall Ondara - ZER La Segarra', '25004085', 'c. Zona Esportiva, s/n, 25213 Ribera d''Ondara', '973540086' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004103@xtec.cat', '$2b$10$auEBPbF2QzVHS7QFQemTOujS9xsDJWv/f/gIJhx5QASK6tvO6.1AG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Tallat - ZER Riu Corb', '25004103', 'c. les Escoles, s/n, 25344 Sant Martí de Riucorb', '973331100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004115@xtec.cat', '$2b$10$LOSId0H7In43iyLQJCNErejklbgYfurVW.JB2PEMnKbxfi1UEgFe2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Roca - ZER L''Eral', '25004115', 'pl. Escoles, s/n, 25175 Sarroca de Lleida', '973126286' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004140@xtec.cat', '$2b$10$Yf6nDzHoytcTtmWpzGqIceuwsYytUgP0RdGyiFB660YH3uJKQTkLm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Albert Vives', '25004140', 'c. d''Albert Vives, 12, 25700 La Seu d''Urgell', '973351014' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004152@xtec.cat', '$2b$10$XnXuEzEQzQRlTF6gPksRmekFSRtXmNJojoGnDxwAbj58qKaFwAKgq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '25004152', 'c. La Salle, 27-51, 25700 La Seu d''Urgell', '973350144' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004188@xtec.cat', '$2b$10$09rH2FMnqy0Kne3EAIosoeTvITPeSKnMM1UR9FlMpM4p2x7x8v87a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Brudieu', '25004188', 'c. Dr. Iglesias Navarri, 27, 25700 La Seu d''Urgell', '973350403' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004218@xtec.cat', '$2b$10$mIukSZUOiaZov6ffFK/.C.EM4aF0VGE1RbXnyYQvhpvXg99z/0Lka', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Miquel Baró Daban', '25004218', 'c. Mercat, 2, 25183 Seròs', '973780102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004221@xtec.cat', '$2b$10$Ic0zxfavi7D/8EmvR/9v/uS4ZCLTVvVWfd9eBC9M6fe9KHsUMeyqy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Timó - ZER Plaurcén', '25004221', 'Carretera, s/n, 25222 Sidamon', '973717021' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004231@xtec.cat', '$2b$10$FUQt2iVC3qY/tGEeqqUzRe5nAvBN8Wod7R1VVrT8pk3fm0RUDlIrO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola del Soleràs - ZER Garrigues Altes', '25004231', 'pl. de les Escoles, s/n, 25163 El Soleràs', '973133455' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004243@xtec.cat', '$2b$10$vLs3jai3wVKDk9XEQ/1BReFLoDkmRHbr1rOzcpSwUn8AOzy0f.v9q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Setelsis', '25004243', 'av. Cardenal Tarancón, 20, 25280 Solsona', '973482103' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004279@xtec.cat', '$2b$10$UKWVjImjzKRsCZPtwPsZ1ecsP4wzZejfQ.dsnxLfdDdcF3pP5d1eW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Arrels I', '25004279', 'c. Sant Isidre, 1, 25280 Solsona', '973482724' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004309@xtec.cat', '$2b$10$YLemd4vFxrbeHxRYJtIGoemCM5i94PbBIVNPOrA3Tt0Tbo.Q9nx1.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Arrels II', '25004309', 'av. Cardenal Tarancón, s/n, 25280 Solsona', '973480392' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004310@xtec.cat', '$2b$10$1ZjviQHOuAxxP.Ab4VRndujDuFjPqt.ZFEg4Gvg/MisRqYrk17O3.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària del Solsonès', '25004310', 'Finca s. Just,ctra.Manresa-Solsona,km 77, 25286 Olius', '973480713' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004395@xtec.cat', '$2b$10$wPaYdg.ZaX.I76P3pOcvvuRqc4L0d1fpBdTcEoBGrYxYDhNrKext2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jaume Miret', '25004395', 'c. Santiago Miret, s/n, 25181 Soses', '973797315' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004401@xtec.cat', '$2b$10$EPoyHBszSfu3dPiE0z7T3eFP9ybXzpc5CAxIS2Fno9jguts7xVRfK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Roser - ZER La Coma', '25004401', 'c. Mare de Déu del Roser, 25173 Sudanell', '973258133' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004413@xtec.cat', '$2b$10$BqM1IdAWhK4H8XUB6.bwD.MdA4tuhoyFj2OXmAhr4jFnFieXXM4R6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Sunyer - ZER L''Eral', '25004413', 'c. de les Escoles, s/n, 25174 Sunyer', '973136464' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004462@xtec.cat', '$2b$10$H2NtQi6Lno4IRJ9pHWZlK.FIsmOIxMmlK5rhjgAUE.82q17HhPShO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jacint Verdaguer', '25004462', 'c. Ramon y Cajal, 8, 25300 Tàrrega', '973310648' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004474@xtec.cat', '$2b$10$ut2XimQjQd/OGCPSRqPE.O3zA70kiRxjxmWiZiYJeKtpXApux5gJq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pia de Tàrrega', '25004474', 'pl. Pare Carles Perelló, 1, 25300 Tàrrega', '973310155' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004486@xtec.cat', '$2b$10$ShMqfmt5pWwfpF8PSsATau9jLVHfFpDaE97GmEksN4i00zcOOkL5y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Tàrrega', '25004486', 'c. Mare Vedruna, s/n, 25300 Tàrrega', '973310116' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004498@xtec.cat', '$2b$10$mGJz4Xby7e497PLo.aSaNOlnnXuaYYE4dLtVUgOJ1vNi9XeN7VRGi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Manuel de Pedrolo', '25004498', 'av. Tarragona, 2, 25300 Tàrrega', '973310836' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004504@xtec.cat', '$2b$10$.Mx1YEXWa1b1t4HKZ/Oc/uE5UwR5CnauW54h/x7h/0dnH.HPA7Nba', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària de Tàrrega', '25004504', 'av. Tarragona, s/n, 25300 Tàrrega', '973310715' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004516@xtec.cat', '$2b$10$0REi6v/MFtmvTkr2QXtSZ.JGX.PniNJjLfEYiHs6IXpPbI9IJoTd2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Santa Maria del Alba', '25004516', 'c. Simó Canet, s/n, 25300 Tàrrega', '973311837' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004528@xtec.cat', '$2b$10$GSCq5U.GR/TKrls/.JYgresECBMfO7Yo1xIeC65vO8x99fU0BWYiO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EA Ondara', '25004528', 'pl. Centenari, s/n, 25300 Tàrrega', '973310486' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004531@xtec.cat', '$2b$10$JO/RWtc80sypCBsgc2L3aOMe59y28Og8v3N.MK1waOvF8rgx64U8C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àngel Guimerà', '25004531', 'c. Gabriel de Tàrrega, s/n, 25300 Tàrrega', '973310700' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004565@xtec.cat', '$2b$10$Qcz6BJUh7vW9LQYwEzan6e3yBKML6F06WWT5cyiyFbu1tnYPeTEEm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Alfred Potrony', '25004565', 'c. Pompeu Fabra, s/n, 25670 Térmens', '973180135' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004577@xtec.cat', '$2b$10$Bmrcb8LRQycAMKoEmUMNTefgUWiVEqeBWxK5YYgXXC2rCoXkXh.uu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Tírvia - ZER Alt Pallars Sobirà', '25004577', 'Zona Escolar, 25595 Tírvia', '973622077' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004607@xtec.cat', '$2b$10$P6r.phWji1XPwLEnxeJIcuZptnJt3oVsisWtsgC8cHbT/KFGYg4m2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Gil', '25004607', 'pl. de la Vall, 7, 25750 Torà', '973473660' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004644@xtec.cat', '$2b$10$11yYUAkr0k3/fDAf/LvBl.s6tf1spHOr0Qfu1FuvTaB6DAMQvRWjC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Espígol - ZER Riu Ondara', '25004644', 'pl. de la Vila, s/n, 25331 Tornabous', '973570603' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004656@xtec.cat', '$2b$10$FaKYfWAZkpQDNY7agxJLuOOLjUHsLl8r4EwmEoQRI/F6uw058P9g2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Torrebesses - ZER L''Eral', '25004656', 'c. Escoles, s/n, 25176 Torrebesses', '973126212' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004711@xtec.cat', '$2b$10$fss8UFkeBeVg8ncIXVgs/u.6ZOEqvrtr9uSNw1fOLg3tSm2QtwIai', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola la Creu', '25004711', 'av. Europa, 92, 25123 Torrefarrera', '973750250' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004723@xtec.cat', '$2b$10$p2Gkt/kJAOZf4zkBv7rJU.FzZQwTT.WynLnHpRCo95hQkX2P0VhUy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Bassa', '25004723', 'c. Dr. Fleming, s/n, 25141 Torregrossa', '973170041' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004747@xtec.cat', '$2b$10$DrrI7BIKVjTY5YECI2T5Ked/P8Mca2Lzup2ecwAa8bzlp6XJfXg2S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carrassumada', '25004747', 'c. Canal, 20, 25170 Torres de Segre', '973796335' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004759@xtec.cat', '$2b$10$zejdEvcyEFMxf7Qniw43fu2C/sI/fBUDT6cRchbvP36QqGS8y4BQG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Roser - ZER Alt Segrià', '25004759', 'pl. del Dr. Serés, s/n, 25131 Torre-serona', '973751619' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004772@xtec.cat', '$2b$10$aWvS96jlxTQ3JdRUJa8GHe9WQ5lm3RNnqwFkO8GRrvDjc1Ethww.u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Valldeflors', '25004772', 'c. Tarragona, 37, 25620 Tremp', '973652775' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004802@xtec.cat', '$2b$10$69tjr4gpXwwiosFktT43OedgnqvfE8MHcK.W9oOSlurMlvpVD8dsK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'María Inmaculada', '25004802', 'c. Hospital, 16-18, 25620 Tremp', '973650235' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004814@xtec.cat', '$2b$10$QtB/rMYEsl7rvtgykWGB1.zUtqXXwM9VHUg8iqp255p0DXsrl8II.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària del Pallars', '25004814', 'ctra. C-13, km 83, 25630 Talarn', '973252394' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004826@xtec.cat', '$2b$10$.5RFWyEEBq/G7CpRFuvo6ONz6ycbBXtQlciq11D3kQTcmf9jqbrcC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Tuixent - ZER Urgellet', '25004826', 'c. de les Escoles, 2, 25717 Josa i Tuixén', '634770634' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004851@xtec.cat', '$2b$10$Iq1W0qkZEyBZCjlnZWMcBOUp0aVhjPnm/T1umZChQUv3UJOK6xB9S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Salvador Espriu', '25004851', 'pl. Sant Miquel, 4, 25680 Vallfogona de Balaguer', '973432214' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004863@xtec.cat', '$2b$10$moZkzjNd2Rw70L8ParPalu.GQWmmk/SjTgdP5XtRvZUXlLQv5SNHG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jardí - ZER Guicivervi', '25004863', 'pl. Jardí, 25340 Verdú', '973348104' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004929@xtec.cat', '$2b$10$rmFZRcHMCeU3RIPwlhvx8e4oNz1pibMPgq8LdL65gROmX.VO8nb2O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Garona', '25004929', 'c. Pas d''Arro, 35, 25530 Vielha e Mijaran', '973640028' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004966@xtec.cat', '$2b$10$0nD/1ubZdmnOliR3rdNBs.K1qk1BbmTFhF1jELKZTganxeRLxk59y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramon Perelló - ZER Guicivervi', '25004966', 'c. Ramon Perelló, 1, 25330 Vilagrassa', '973500388' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5004981@xtec.cat', '$2b$10$a/gRVVbOSsTLjX6kU4pad.l3nLLqkSjsMu7sNLA/bWv9CCA7ENPTa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vidal i Abad - ZER Alta Ribagorça', '25004981', 'c. Afores, s/n, 25552 Vilaller', '973698127' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005016@xtec.cat', '$2b$10$36H2AR3HE9Z7oUNDSkyi1upnUnf9JArUt4fjSF4mhktTEErxa4axG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marinada', '25005016', 'c. Pare Pacífic, 16, 25264 Vilanova de Bellpuig', '973324334' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005053@xtec.cat', '$2b$10$6HvSNJ6vZy/m7JnQxRZp2OKsIvUCAQVYLdMowiZ3goeUvLSHZwdMC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Puig de Meià - ZER El Romaní', '25005053', 'c. Raval, 25735 Vilanova de Meià', '973415084' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005065@xtec.cat', '$2b$10$slBeExLNHtctGnMd0XLSIuuybizrEfXPBJL1KERk06IQ3xs0B2SHW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Vilanova de Segrià - ZER Alt Segrià', '25005065', 'av. de Catalunya, s/n, 25133 Vilanova de Segrià', '973777353' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005077@xtec.cat', '$2b$10$twB5Q9wxdjNDpLqSfdhF9exwtPTWe66t1BHvdRpDiwdtpDUwklpyS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Ton Clavé - ZER Vent Serè', '25005077', 'c. Ponent, s/n, 25245 Vila-sana', '973711582' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005090@xtec.cat', '$2b$10$TJC8wHFkykXRbqU3akmv5OhuCABQf5gkxZzTbSGa6AJo9/Ly0fdky', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestral - ZER Argelaga', '25005090', 'c. Major, 1, 25690 Vilanova de la Barca', '973191177' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005107@xtec.cat', '$2b$10$PGx/YMPet/1/vvroipnQZuAFZ7.8fiGsxFkzMfJbm/4.7XPABSz1a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Bonifaci - ZER Riu Set', '25005107', 'ctra. de Lleida, s/n, 25440 Vinaixa', '973175013' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005119@xtec.cat', '$2b$10$yCk7GsBraoyUxFfoRPpKMukdFgRgAvSPk5aIN287eDYG/OVpaytvu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pinyana', '25005119', 'c. de la Sisquella, 4, 25120 Alfarràs', '973761467' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005120@xtec.cat', '$2b$10$sQo3/EZ3cjx/PtSI9Z3dh.hErsLlyjJTOLWFM7cDhoWpB2rItE/22', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Teresa Bergadà', '25005120', 'c. Bassa, s/n, 25125 Alguaire', '973756346' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005144@xtec.cat', '$2b$10$zAE1LWdO5OKyFjr1zXkSc.FJtYbiufbPKRJo6PVDw8T6H6j.c2Tty', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àngel Serafí i Casanovas', '25005144', 'c. de les Escoles, s/n, 25560 Sort', '973620222' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005171@xtec.cat', '$2b$10$4BnZO5uVq.KZhg4lhz3nqee.WFOCGHhSVBc/tYoYXXo3b.t2Vx4/2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestre Ignasi Peraire', '25005171', 'av. Pau Casals, s/n, 25230 Mollerussa', '973600351' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005260@xtec.cat', '$2b$10$QA1a2nxWbQeYF5g32yXED.ZXCQ1qi3BCDtELbt794Mt6.GicYPed.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ribera del Sió', '25005260', 'c. Petronel·la, 1, 25310 Agramunt', '973390803' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005341@xtec.cat', '$2b$10$auFV6/maMgZtORHCGp2i5.5dY.3vaOL9QD5.F.Lp7ZF5rZq6pQZGe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aremi', '25005341', 'c. Mestre Tonet, s/n, 25003 Lleida', '973264644' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005417@xtec.cat', '$2b$10$uxAUVJEpYi/hbQGJkaZrMe9Hwhlv6P.l4YK73Hc0iuqeb7k3gb2wK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Plançó', '25005417', 'Partida la Caparrella, 97, 25192 Lleida', '973243289' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005429@xtec.cat', '$2b$10$jnA7wsUBGy2KluuwAn50U.H6oYug/qBtyQZuLTpcThZ2Z/iQahIKa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Els Planells', '25005429', 'ctra. Montsonis, s/n, 25730 Artesa de Segre', '973402327' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005430@xtec.cat', '$2b$10$Lo9Cbl.WUtun/6Sw7Y9iGeqpZIQ.z5wUQotefXC.ggj8XMS9UJ9ZC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan XXIII', '25005430', 'c. de Pius XII, 4, 25003 Lleida', '973263630' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005442@xtec.cat', '$2b$10$i4/fDU78xAh4vCpoIYcV/uIDC3H7YYrcPx6KzMSImIAJdtHUr6cXC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola del Treball', '25005442', 'c. Pi i Margall, 49, 25004 Lleida', '973231549' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005454@xtec.cat', '$2b$10$N81/uBMjectMVqTXbJvzj.frRjNGC2812FRA0FfFkBEwgbnWevo2y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Francesc Ribalta', '25005454', 'c. Francesc  Ribalta, s/n, 25280 Solsona', '973481079' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005466@xtec.cat', '$2b$10$9swdCVlR6/Xq77c.IrrrGuCBIj8ao7PRyxUso.rNeOj2E3nk/YKVq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Escoles Especials de la Llar de Sant Josep', '25005466', 'Partida Caparrella, 97, 25192 Lleida', '973282102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005533@xtec.cat', '$2b$10$oD8ghiEEcE6eIrIAKWpVKOy5IQeIUjEvrHGfhdsHAftJNQbOlwDrm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pau Claris', '25005533', 'c. Bisbe Benlloch, 7, 25700 La Seu d''Urgell', '973352327' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005545@xtec.cat', '$2b$10$aj.jLtqaMKYod1NYib0lleLB8PLFuzXEx4bfnfgd3AjJFnSV6pfSW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pompeu Fabra', '25005545', 'ctra. de Torregrossa, s/n, 25230 Mollerussa', '973602501' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005557@xtec.cat', '$2b$10$Q8nbFrJ9ZjlMxl4qsCr2VeBx.jJdHFtM4BJs1K.pc8MvmuwIpP8Dy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Siloé', '25005557', 'ctra. de Torregrosa, 5, 25230 Mollerussa', '973602565' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005570@xtec.cat', '$2b$10$AhhM5G5SSZdM3LXxR4dCo.kOS74ljGUpHBTt2CzPrdhshMkQAFjES', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària del Pirineu', '25005570', 'Finca Les Colomines (Bellestar), 25711 Montferrer i Castellbò', '973352358' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005582@xtec.cat', '$2b$10$da8PeWVoOO5hra2OLVzFA.2jop0ouJjCntride0qzGxIaO.ttkK8y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Terres de Ponent', '25005582', 'ctra. de Torregrossa, s/n, 25230 Mollerussa', '973602100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005673@xtec.cat', '$2b$10$PzsBoBXnUXhZm.0RB4wDvu.qbpa1HU0LlbOAWWm0aHM/Rs7FcrwXS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Maragall', '25005673', 'c. Ignasi Bastus, 16 (La Bordeta), 25001 Lleida', '973200647' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005685@xtec.cat', '$2b$10$GfGP/PD4cjTXpby5CCpvO.BlIj.8Vd66k3vMaAEEzKnNjGU/ohjb6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Segarra', '25005685', 'c. President Macià, s/n, 25200 Cervera', '973530554' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005697@xtec.cat', '$2b$10$Tx5SbnVMdTgAjF13mSx8oO0O1CRoHOYB4Wp90rxSexomW57Z0Ib0C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mirasan', '25005697', 'c. Sabadell, 13, 25005 Lleida', '973245716' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005703@xtec.cat', '$2b$10$hZjoFtgNXdplvTiaMPkHbO5FsnM4A9Q6N5Fyuy3/lvkAevjlqb6gK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institució Lleida', '25005703', 'ctra. d''Osca, 101, 25001 Lleida', '973243950' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005727@xtec.cat', '$2b$10$93Bd.bGp1zCmgam5122oAe1AWWLafJ7iTNFnL0Tu9nZ3EDt.ug6J6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Almatà', '25005727', 'parc públic el Reial, 25600 Balaguer', '973445691' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005880@xtec.cat', '$2b$10$meQVA8CEWVtI2HvUCRuC5OQwT1O2g4WYwiNBq8o/R4IZdN16j/Qsa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Frederic Godàs', '25005880', 'c. de la Doctora Castells, s/n, 25001 Lleida', '973201315' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005892@xtec.cat', '$2b$10$KIA/2tI3hu.DnhKsRUxC2ep4lOTGRCBbGJcKx8y0QkX4bHzVlV3Qy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Maldanell - ZER Riu Corb', '25005892', 'c. de les Escoles, s/n, 25266 Maldà', '973331152' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005910@xtec.cat', '$2b$10$z5FqOQmTp5IoaQZ87RxeJuLrBP00/DEpcs7LDov8bhI1wzWERwcOG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Abat Ruera - ZER Pedrera', '25005910', 'c. de la Creu, s/n, 25420 Puiggròs', '973143016' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5005983@xtec.cat', '$2b$10$9V7q92G4eJwxdKlT1hjDr.IPGfDxQHYLaquSDmbclgF9quA5OtP9.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Serni - ZER Baridà-Batllia', '25005983', 'pl. La Font, 1, 25721 Prats i Sansor', '972144109' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006011@xtec.cat', '$2b$10$1d/T6OimNAoFMd4eeF1lf.7Md/dDqJA2Llp1REn97qBEKtqP4pAm6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música de Lleida', '25006011', 'c. de Pi i Margall/pl. Jacint Verdaguer,, 25004 Lleida', '973700676' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006021@xtec.cat', '$2b$10$Z3xGj6nLTxgYdjB45VNZ7efZxGaxtYoaDVpVuTysL6gFqxnm3Guue', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '25006021', 'av. de la Generalitat, 5, 25300 Tàrrega', '973312965' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006033@xtec.cat', '$2b$10$OwjbftBRtPLYUF0zElqStuZ88I.RboT1.Op51mHnyid4LlIjbPF2K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EA Municipal Leandre Cristòfol', '25006033', 'c. La Palma, 12, 25002 Lleida', '973700362' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006069@xtec.cat', '$2b$10$Ahf.nL8hil6e4q7t5NGdzepNcQw0vg10F.ZWj1Rlaz5k2K7XEZNYy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Ardèvol - ZER El Solsonès', '25006069', 'c. Major, 1, 25287 Pinós', '973473463' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006082@xtec.cat', '$2b$10$eMm49B7dr6gLimoA8zHkTew4mb6yN58fxmEFldhhV1yYOH8WIILM2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'L''Estel', '25006082', 'c. Jacint Verdaguer, 3, 25600 Balaguer', '973447903' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006094@xtec.cat', '$2b$10$aXKy/.vJnyuWeN/kmrozW.6LdScN8uIHj.JtvKkCANW.3CQW0Q0NK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Apromi', '25006094', 'pl. Catalunya, 2, 25430 Juneda', '973150414' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006136@xtec.cat', '$2b$10$ma6bRoQ4sgjaTxc3kC3MaOeVjtenKVoTsBNZLH7xmD2XIYjpl7hX2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Balaguer', '25006136', 'c. Miracle, 23, 25600 Balaguer', '973446650' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006148@xtec.cat', '$2b$10$bbfXJOt04xuvNe/YmazY9ubPcqfThm8G/B48ieTU1mpz4ua4WYYy2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Ostalaria de Les-Val d''Aran', '25006148', 'c. dels Banys, s/n, 25540 Les', '973647242' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006215@xtec.cat', '$2b$10$RtDX.8fX9LgHWMo97KHlH.pH1xjAQ7XPSZowhG2MYgoFdOaDyvJOy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola de Sobrestants', '25006215', 'c. Salvador Espriu, 2, 25300 Tàrrega', '973312303' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006227@xtec.cat', '$2b$10$QfLfjgRLZdZOIEHbEYXS4ObrK6JS49BbpIpJTl9lqFCW0EtISssKi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Almenar', '25006227', 'c. Espadós, 75, 25126 Almenar', '973770212' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006239@xtec.cat', '$2b$10$3b8sNrCNqP0PLMzPCG9DCOAL1C.H1NWd59RwutHrXVq1EgG9Rhjvy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Aran', '25006239', 'Ctra. de Betren, s/n, 25530 Vielha e Mijaran', '973643761' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006240@xtec.cat', '$2b$10$M6EXJZWI.xOTdDA3Re3pwuKwb3BWEBvKlKioRPUK3dYk4IToB5MEO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut El Pont de Suert', '25006240', 'Barri Aragó, s/n, 25520 El Pont de Suert', '973690040' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006252@xtec.cat', '$2b$10$HBfiln7iVCG47riQiMAkYOXoI90iPg1WFXzJmIIvSmGAhToMDlxVq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Lleida', '25006252', 'c. Corregidor Escofet, 53, 25005 Lleida', '973224321' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006264@xtec.cat', '$2b$10$yqQiZujc/tJD2GpZUnLbpO1jeQwrh4OIk2eSdGWIcuWOFngGmsTTS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Espiga', '25006264', 'Partida Bovà, 14, 25196 Lleida', '973246950' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006276@xtec.cat', '$2b$10$HpZdOsZhdGBK2ryfO6Tr.eLXbcWOb0frUQtaR3oftUptOK9iNK5Ka', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi', '25006276', 'Partida de Montcada, 22, 25196 Lleida', '973245032' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006288@xtec.cat', '$2b$10$.x1NUP3fZa9UqCDHroYmvef0OhRuXHUIdGS9bS1lD.kpXtgsqlgbG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Tremp', '25006288', 'c. Bisbe Iglesias, 5, 25620 Tremp', '973650836' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006291@xtec.cat', '$2b$10$0pw/sAzislyUKi4MHie42.b3.1la1KSYbY11vYgFTz.nOfpC1KmYi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Hug Roger III', '25006291', 'c. Joaquim Sostres, s/n, 25560 Sort', '973620888' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006409@xtec.cat', '$2b$10$Tw1yvTjuXHUXUkt1BuGtiOdful.pYLrT8q4HOSzr55iARQlGCzWwS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joc de la Bola', '25006409', 'c. Segovia, s/n, 25006 Lleida', '973281092' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006410@xtec.cat', '$2b$10$nRhfVBJ.m2c/fguRKWR.vO0uwn9BwGcBTncW5wc9hcNNjs9S2/YkK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Segrià', '25006410', 'c. Juneda, 16, 25001 Lleida', '973205147' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006434@xtec.cat', '$2b$10$F0G/ZFJ7jjKsVlEsVUKhiOQZEu/KRfg0Fc7Rg9pJthUl9sp9/SRQq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '25006434', 'c. Ensenyament, 17, 25310 Agramunt', '973390536' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006446@xtec.cat', '$2b$10$.E6XOoXoc/x4OTP5DzcJzusBTf5eRzE7vPL0HG7QH9vZvuNNWLvkS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Municipal de Música l''Espiga', '25006446', 'pl. Doctor Perelló, 4, 25270 Sant Guim de Freixenet', '973556035' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006483@xtec.cat', '$2b$10$442Bq/Ra5qVKQhw3PY4CQuDydcBKtjgzvsEc9RIA0Hn.kecZ4le3W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Canigó', '25006483', 'c. Canigó, s/n, 25100 Almacelles', '973741006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006495@xtec.cat', '$2b$10$RYDQg94S1B3tjLn/Qx2tE.cRAW.w6rlcaMCaylLXcwNl/3t1HeCjO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Josep Lladonosa', '25006495', 'c. Jeroni Pujades, 16, 25005 Lleida', '973239531' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006501@xtec.cat', '$2b$10$Cjm5oD79LhnIudAn1A21o.lNSsnOseUYfo/wX/i0gdsvJbpIxezYO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Alba', '25006501', 'ctra. de Corbins, Km. 6, 25137 Corbins', '973225013' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006513@xtec.cat', '$2b$10$qa8pot/1bf4PIUicsD652Oqz0pfQpoH8YFLhcqzzR8Z/XWYoGnJcG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Manuel de Montsuar', '25006513', 'Partida de Montcada, 22, 25196 Lleida', '973233556' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006525@xtec.cat', '$2b$10$Cj5yXq3WnCHntMdPuTRHaeN0snZwjl4JlrUrAr8u.WiDZXCwtLp/S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Josep Vallverdú', '25006525', 'c. Dr. Josep Trueta, s/n, 25400 Les Borges Blanques', '973142700' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006537@xtec.cat', '$2b$10$78CArfwUp8qFrS9cR9LGyOt0Q5xEU.sbkFXYIZ5HNvOwBGmySv9B6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Mollerussa', '25006537', 'pl. Pla d''Urgell, 1, 25230 Mollerussa', '973711094' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006549@xtec.cat', '$2b$10$A1B88U05qdqAgio1FMcFb.UNwHNjP8E.CSpLCLothhcNY5jGKvs4e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Espluga de Serra - ZER Alta Ribagorça', '25006549', 'c. de les Escoles, s/n, 25583 Tremp', '973252403' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006574@xtec.cat', '$2b$10$Kj5NGTIC7L2iFvSzOuHdhuYzKOHgTuAMFhq9XbOGBB4CaRS/1dY0O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Ponts', '25006574', 'av. Pompeu Fabra, 59, 25740 Ponts', '973460574' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006598@xtec.cat', '$2b$10$m6d7edIQRAaopDe9EPaaPeDNnYUadEK4p8PP3Dzr4wC8zS7TqyTRW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Lo Pla d''Urgell', '25006598', 'av. d''Urgell, 34, 25250 Bellpuig', '973320083' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006720@xtec.cat', '$2b$10$aLIgXA83n92QsJEClREthuIwP.lGN9nMMuweOb8DlqQ0aSj0iF2ta', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Hoteleria i Turisme', '25006720', 'Partida Caparrella, s/n, 25192 Lleida', '973281182' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006732@xtec.cat', '$2b$10$mDViCzRcWGB9EyzJrf..R.P00J8slU/kn2cKHH57PiddxmQj.ifd2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Torre Vicens', '25006732', 'av. Torre Vicens, 3, 25005 Lleida', '973220033' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006744@xtec.cat', '$2b$10$4fDaKOhCxg4/KXAPbLQm0OU3WkzTWydPKJhCuxb3cPsJ0Zl5npUei', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Esperança', '25006744', 'c. Juneda,2, 25001 Lleida', '973200301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006768@xtec.cat', '$2b$10$xT.2bjNOhOU6vscfUIaNJuvF6XzCRq77Q/VVsA99T5ZGD.9yryMpe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Sarroca de Lleida', '25006768', 'c. Esports, s/n, 25175 Sarroca de Lleida', '973126001' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006771@xtec.cat', '$2b$10$07JzWZnrkyJUAwTzy/FYIejVjaUTBVYCQDs6yMdGJnWYRGD/VGnBG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ronda', '25006771', 'c. Henri Dunant, 3, 25003 Lleida', '973281747' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006781@xtec.cat', '$2b$10$DTfcuE9IKepgavaYYGuC3esz8E7YHPQm.Y.tRiSIUiQ.IMqo60j1W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Alfons Costafreda', '25006781', 'ctra. de Tarragona, s/n, 25300 Tàrrega', '973312204' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006793@xtec.cat', '$2b$10$u/1rGCm/gPXenNIAA8ydeOXB4qW1PaB1YAtVrgdGrrcU.UeUMwk2q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Acser', '25006793', 'c. Sant Lluís, 50, baixos, 25600 Balaguer', '973445912' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006801@xtec.cat', '$2b$10$swlbEOAHD5bo1i4vVJgZHOs1r8tT6UnV.Imm2KNJXKHapj.Sf.966', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Patufet', '25006801', 'pl. Major, 1, 25265 Castellnou de Seana', '973320705' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006811@xtec.cat', '$2b$10$TSPodE8wV05R8PAsm6Pp5eZ47m955zEEDmp7b1ynuij0li7XQo/ua', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Grandalla', '25006811', 'c. Capdevila, 29-35, 25700 La Seu d''Urgell', '973360604' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006835@xtec.cat', '$2b$10$6HMa.dED.gbrm2a7SXCM2eLR5mVaYDEne/Bk7By1bdaOhwih1og3W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Merli', '25006835', 'c. Bassa, s/n, 25125 Alguaire', '973756006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006847@xtec.cat', '$2b$10$zGFhoyt9Zcjge81v/.v37egmT994sI1KE9Zm9FUWoVzmvSA06bxxK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Estel', '25006847', 'av. Espanya, 7, 25620 Tremp', '973652203' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006859@xtec.cat', '$2b$10$oUpt2xpZfQPKN/ERTDqDu.VYl1vqfH1FcftI2JQWzZGKgltISiCN6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal l''Era d''Agramunt', '25006859', 'c. dels Asgous, 22, 25310 Agramunt', '973391682' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006860@xtec.cat', '$2b$10$baYH2epoovcJ4ybgBDI03.SmfX7Zxp9HOHsePA5as3FDbV4NW5bXG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Era Cunhèra', '25006860', 'av. Maladeta, 1, 25530 Vielha e Mijaran', '973641082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006872@xtec.cat', '$2b$10$VI/DEt/ftgqSJytbx2Nrq.fQxUP.sHbb5ECEtYBV./iIawxBr6XvC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Vensi', '25006872', 'c. Balmes, s/n (c.Nebrija/c.Pitàgores), 25100 Almacelles', '973740266' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006884@xtec.cat', '$2b$10$sHEMX9rfgUNuPjKD6vYjz.w1AK5GB9sy3kcA41eNpd1ZjXpxvtrYq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Blau Cel', '25006884', 'c. Ramón y Cajal, 27, 25262 Barbens', '973718038' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006896@xtec.cat', '$2b$10$MhZdZbE9XYzYZgJZ5L.fPeW9IPU3MfOMhcIOwqLJzy2c7nrk5vV.6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Bellpuig', '25006896', 'pl. del Castell, s/n, 25250 Bellpuig', '973337046' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006902@xtec.cat', '$2b$10$nEsFKSJ9FKYV7J21273aU.k2NsCWZvFa5YF7H5J4h1LmYavdXhlyK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Ponts', '25006902', 'c. Bonaire, 33, 25740 Ponts', '973460968' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006914@xtec.cat', '$2b$10$3DXPHDucwiPttf8VCr6tTu2S1/Azt.zt.lkDjgVJ5WgXrcXUsy6DS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Pau', '25006914', 'c. Berenguer IV, 30, 25300 Tàrrega', '973311475' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006926@xtec.cat', '$2b$10$A2zKjPfNLGX5QcWyqCNQ7OxG8/RN1SjifyIiWM/2wYDCwBggY2rT.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Les Basses', '25006926', 'c. Til·ler, 1, 25191 Lleida', '973233573' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006938@xtec.cat', '$2b$10$dngWLspN.3MN29EJo2LII.16qn/YlkF/KNL3V0HOndwm/irnvE/YO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal de Pardinyes', '25006938', 'c. Enginyer Cellers, 2, 25005 Lleida', '973249798' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006941@xtec.cat', '$2b$10$XYeq3ciecnUXVEQPyHPQnubpNj0V7TA391zwc2xZoI0dXo3.54Qam', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Magraners', '25006941', 'c. Vila-rodona, 2, 25001 Lleida', '973211806' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006951@xtec.cat', '$2b$10$FdYKZ95Ddo2ETR.Rx/LNYex/gsNgkW/iBb4L0tQR8GCCx9bOsQHmm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal El Rellotge', '25006951', 'c. Roca Labrador, 2, 25003 Lleida', '973274723' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006963@xtec.cat', '$2b$10$aYXVVLWmUyQGtuqoldDNCuCFIoiUJa/npewWzJzgxg8TVdsdkP2eu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Bordeta', '25006963', 'c. Hostal de la Bordeta, 68, 25001 Lleida', '973206361' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006975@xtec.cat', '$2b$10$rvXEBgl4DcDXUKn1SYJm4ufM50BZS17HssHw9b93P1cIcLtb/9zOO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Cappont', '25006975', 'c. Santa Cecília, 9, 25001 Lleida', '973206383' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5006999@xtec.cat', '$2b$10$aDPMDYA.KPmVpGJy.gLMou9W7oKtH.X98Zjl18Wkqr.QjlSCvIf.y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Suchs', '25006999', 'c. Bou, 1, 25113 Lleida', '973748415' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007001@xtec.cat', '$2b$10$ALA6pxMBMK/7y2m3cRVkNemBp31IxMFm04XWxuR9AebfdpcKW5yGS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '25007001', 'c. Travy, 16, 25720 Bellver de Cerdanya', '973511025' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007013@xtec.cat', '$2b$10$Urb1PtVxbeyFTE.5B2mM4.Zqmk.RlZwBCzLm4PbK5Fr904ElAfvw.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants del Secà de Sant Pere', '25007013', 'c. Llibertat, 1, 25005 Lleida', '973248149' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007025@xtec.cat', '$2b$10$ZR15h4Vvmtrouplypid9seRVvnbwAs5DyhHIdAwU5/3IySkfWy1cu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Morelló', '25007025', 'pl. la Closa, 7, 25580 Esterri d''Àneu', '973626146' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007037@xtec.cat', '$2b$10$f5d6pFRvjVdqZyS1nTZ3jOTwX0oSRzq7XHZgXnA5./4clrIX9uRG.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Garrigues', '25007037', 'c. Escoles, 2, 25177 La Granadella', '973133488' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007049@xtec.cat', '$2b$10$I66tI1b0n/l0DjH0FUbhz.KzlMeJvY11hFhYdhDKLnrKHwof6Dlj6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Pau', '25007049', 'av. Catalunya, 43, 25320 Anglesola', '973308006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007062@xtec.cat', '$2b$10$/Yzw9gaeT3vA6X.je7ODmOuh86Xysx9up.K4RiQdNZoppTnOpvW6W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '25007062', 'ctra. de Lleida, 51, 25440 Vinaixa', '636540013' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007074@xtec.cat', '$2b$10$BEFZBAMTwBUDZW0A8VITzeDQY9knlgPV1ul3CxZb.PookPiAte2e2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Patufet', '25007074', 'c. Mossèn Jacint Verdaguer, 1, 25600 Balaguer', '973445200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007086@xtec.cat', '$2b$10$8eMf0ifmO1kc/dNfvzS9bemfY8wUmMO9WJczSTmVXmDXmX.2EDJLi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Belianes', '25007086', 'c. Escoles, s/n, 25266 Belianes', '973331047' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007098@xtec.cat', '$2b$10$uWrvd/oz5oju994xO0dM0uFKPk8Jn5doydfwJean.1ItESgY/t/pK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sol Solet', '25007098', 'c. Nord, s/n, 25337 Bellcaire d''Urgell', '973586005' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007104@xtec.cat', '$2b$10$ACiuWAvAlkV8NSf3Du6EiO85U4p2BilTNbMBiICMFnPcUh9YGb6dq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Mairau er Audeth', '25007104', 'pl. dera Glèisa, s/n, 25550 Bossòst', '973648157' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007116@xtec.cat', '$2b$10$eUXiZztleWtnj6Ztbri4..6MXTbfwpfiGIF/cbUKLwvDVA.THdwZO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Mainada', '25007116', 'c. de les Escoles, 2, 25680 Vallfogona de Balaguer', '973432275' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007128@xtec.cat', '$2b$10$yWZauYjKShBA/H01sQOBQOUb1KDrscRVB6UTXc3RZAKRd0Lp.N.Ui', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Patufet', '25007128', 'Trav. Anselm Clavé, 13, 25242 Miralcamp', '973710975' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007141@xtec.cat', '$2b$10$WYMEepPB0PFRH8w1eo68XufCwbn2lViuFPaSXILLt5eFPahJwPAwe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Estel', '25007141', 'pg. Zona Poliesportiva, s/n, 25141 Torregrossa', '973170628' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007153@xtec.cat', '$2b$10$1UzWuNsnAgisS7tlZPt4w.JdpxaQJyM5HAFlifiMGwmmQRV6OeFSu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Alcarràs', '25007153', 'pl. de l''Arquitecte Ignasi Miquel, 1, 25180 Alcarràs', '973791456' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007165@xtec.cat', '$2b$10$S4B9LGZx1nYVZn5oIt9tReddTEjXjSxHeE1Q9Fn3dwAf783cAVqQW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Bressol', '25007165', 'c. de les Monges, s/n, 25730 Artesa de Segre', '973402332' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007189@xtec.cat', '$2b$10$/sGwlxgktCl6IdhUxyE1rutkqoEiX4KC23G4CTHh/MoiWHPq/bUaC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Maria Rúbies', '25007189', 'c. Boqué/av. Pla d''Urgell, s/n, 25001 Lleida', '973212208' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007190@xtec.cat', '$2b$10$ktyqb03e6VxiLuSpIS3U4uGd70ilVRTJE7xuuuBmPI95MPmv3k/Bi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Arrel', '25007190', 'Camí dels Pagesos, s/n, 25200 Cervera', '973531224' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007207@xtec.cat', '$2b$10$sWbyvkEcgkuwudDF1vGFAufNn4iMMU14jeeWZ0aSbxp36TQidycQ2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Faldeta', '25007207', 'Camp de Mart, 30, 25004 Lleida', '973233957' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007301@xtec.cat', '$2b$10$jS.j7NeDP8vSeU0Z7gqJ4.JusmOu3Hnl5CfwztLCpE6mWf5WHfM4m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Arc Iris', '25007301', 'c. Gran Passeig Ronda, 105, 25006 Lleida', '973243217' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007323@xtec.cat', '$2b$10$6uKxPLgf0I.e5tf0eVOeXeSvthRWbqT6q5C5oq9mOh7fgjraswJQy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Peter Pan', '25007323', 'pg. Ronda, 107, 25008 Lleida', '973234551' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007438@xtec.cat', '$2b$10$rBJ42M.rlxf6uzQLi45YsOdFvrJklB1/tAzYBedfq6WRmf/To5uGq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Sant Eloi', '25007438', 'c. Montsec, 4, 25300 Tàrrega', '973312301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007499@xtec.cat', '$2b$10$syYcYtEeqmV52DKnt91Ps.Kw55YzZ1BWT5XW4SO.eaq1OXkTu8/26', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut l''Olivera', '25007499', 'pl. Escoles, 3, 25177 La Granadella', '973133605' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007505@xtec.cat', '$2b$10$9SiWLy/t8.Ynr2Vnfl3H1.IJ8/KU8zyVGH2TxeGG5vT6O/43F591a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Guissona', '25007505', 'c. Castanyers, 13, 25210 Guissona', '973551417' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007517@xtec.cat', '$2b$10$sn96QWoZMBfV/B.daky7Juhg8WDhAFI4E2.xNi8mNN8TRqg9Fjqmq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Serra', '25007517', 'ctra. Torregrossa, Km 1,9, 25230 Mollerussa', '973602612' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007529@xtec.cat', '$2b$10$rpPjm/MpBv8tMq2IjSQrNu9iTNyB8AUwin9vAVtscm8RYjVTXD6Aq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Seròs', '25007529', 'pl. de les Escoles, s/n, 25183 Seròs', '973780275' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007566@xtec.cat', '$2b$10$yS9qCl94BAk3zfJbHn.8Zej9j2v9Dt1T0i3uE5z9XtbTNAOLZ5Ilm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '25007566', 'av. Diagonal, s/n, 25400 Les Borges Blanques', '636951861' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007608@xtec.cat', '$2b$10$4jLc4z1WlegMwftfE5cpIOuyR8lYpDbnAT10hS8j0l1xZopTE747e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Eth Cargòlh', '25007608', 'ctra. d''accés a Tredòs, s/n, 25598 Naut Aran', '973644279' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007611@xtec.cat', '$2b$10$eIT5Ou82VLHGS9NO3j3UJexUdxDqn7Xq4qcqIBrXlDi5XSDuRMwWS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Victorina Vila', '25007611', 'c. de la Mercè,1(Casal Cívic Joan Carles, 25003 Lleida', '973260745' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007621@xtec.cat', '$2b$10$Cs0vYZZUFeOx0in19gVld.fRgBzZJf2eADWmlrD7hdtYs/IEEAqs2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa La Dansa Estudi', '25007621', 'av. Prat de la Riba, 57, 25004 Lleida', '973249331' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007670@xtec.cat', '$2b$10$hCbGgBI3NQNGKL107K1vXeRNc6WwfLqLsPsRaKdO2MMDbhCjMlFN.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula Municipal de Música d''Ivars d''Urgell', '25007670', 'c. Felip Rodés, 8, 25260 Ivars d''Urgell', '973718205' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007694@xtec.cat', '$2b$10$oSZteFKGeSFQn2IFuo4E1uEQ65jB/nSGnc1EWzKyz6iOaDHxVLt86', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Lleida', '25007694', 'c. de Pi i Margall / Pl.Jacint Verdaguer, 25004 Lleida', '973222508' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007700@xtec.cat', '$2b$10$DMVPhsSuBWZ9uWfatluhauX5ra3e1p8kz9hha0cQH6myWjuAf3pxu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ermengol IV', '25007700', 'c. Enric Servet, s/n, 25337 Bellcaire d''Urgell', '973586214' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007712@xtec.cat', '$2b$10$n/aV8o6uy.tO6/vSBakC8.Ip0/NumiLYtaxMbD6IICy7F0.gWXbeW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Els Minairons', '25007712', 'av. Estació, cases 11-12, 25620 Tremp', '973652690' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007724@xtec.cat', '$2b$10$QEOUuqAbqRYDEWBJ.rRBUOxLDI007MFXytU66.RUmzSnQnIHiQNeK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Les Garrigues', '25007724', 'c. Dr. Trueta, s/n, 25400 Les Borges Blanques', '973143434' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007751@xtec.cat', '$2b$10$AtCUIHSOm2dAV2PvwVCGCeli9TBHf84BT1vRzsGiF4ckp1E6uDOmq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada El Gegant de Lleida', '25007751', 'c. Serra del Montsec, 6, 25006 Lleida', '973239128' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007955@xtec.cat', '$2b$10$wTqpM9Ec7BA4ekLboQWqtOz1C5IlW148OtRqarPimCj6e2mYlwZLK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '25007955', 'c. Mestre Emili Pujol, 2, 25200 Cervera', '973531102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007967@xtec.cat', '$2b$10$H3tJ.yY7kZ5lrlCknZpAwu0HrNEWzjBOzIcwvPRBWJa.64jH.Z4YW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Josep Maria Llorens', '25007967', 'pl. Vell-Pla, 1, 25210 Guissona', '973551121' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5007992@xtec.cat', '$2b$10$dwp2A8ICNpfHXchpc8ElYuauy6Kg6mMEZ3vfiDErBYatFwndV1Aqm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Almenar', '25007992', 'c. de la Central, s/n, 25126 Almenar', '973770433' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008017@xtec.cat', '$2b$10$lR9Zw.7F.fvMj4cp5UoMdeQo8sBANEXfmc5Logypy4lMHxyTR4qPy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ralet ralet', '25008017', 'Camí d''Alpicat, s/n, 25126 Torrefarrera', '973751732' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008029@xtec.cat', '$2b$10$botV87HXDlUMv8clakMcgO.4DEtmITDV1XghSxcPSeJw7xpbk8V2G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Placeta', '25008029', 'Camí de la Plana, s/n, 25264 Vilanova de Bellpuig', '973324214' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008030@xtec.cat', '$2b$10$saseOu5xr73iQkDzDtF6XOejCthzADBf/2QMXg/WgyrOq5oxhjzYe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Rialles', '25008030', 'c. Jacint Verdaguer, s/n, 25150 Artesa de Lleida', '973167225' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008170@xtec.cat', '$2b$10$AbcFHSvDqXENUVTud0URSeMKabhqtiNUHj2crCIkZTMuOBTMRQnRu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música L''Intèrpret', '25008170', 'p. Castella, 2, baixos, 25003 Lleida', '973836180' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008200@xtec.cat', '$2b$10$91ueFCAagRljYJaGsCZiSeIPlddkS0vQgHOZovlsZ1C4/eLbuvQ0K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Atrapasomnis', '25008200', 'c. Antoni Agustí, 23, 25005 Lleida', '973007932' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008212@xtec.cat', '$2b$10$WwbH7BPuMuA.KAuAp6DukeG9I92MuufscKEv4ymVuf0ogb.MfKhDy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pràctiques II', '25008212', 'av. Alcalde Rovira Roure, 46, 25006 Lleida', '973235847' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008251@xtec.cat', '$2b$10$sUATtAQ0GnXkK2/Ih/FF7.J69uN2qyoJmpBq3/nFRIR3f8b3J7W5W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Escoleta', '25008251', 'c. Pla Molí, s/n, 25430 Juneda', '973150101' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008303@xtec.cat', '$2b$10$LY.sksQl0WpEVnRMltgJx.lfZLzik7uiU5smfnwitoqy7Zx.3jfz6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal del Centre Històric', '25008303', 'c. Tallada, 34-36, 25002 Lleida', '973700458' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008315@xtec.cat', '$2b$10$mzwZ6ob0dSSebIwYQDDeT.CcVEJiH6y8VkTM2yUF5GMYNMgapAYIG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula Municipal de Música d''Artesa de Segre', '25008315', 'c. Mare de Déu del Pla, 25, 25730 Artesa de Segre', '973400757' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008339@xtec.cat', '$2b$10$Ns3kXGWty9ROoqh37vczAu6IyaaDXAWO08NJUB6ZjO6CG1akmrTVK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal d''Esterri d''Àneu', '25008339', 'pl. de la Closa, 5, 25580 Esterri d''Àneu', '973626174' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008340@xtec.cat', '$2b$10$nSYNa/HzdTHDYgv6dPVQB.WBCYqiM4XXEYVb1s1Yxn7XDv86888pu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '25008340', 'c. Major, 1, 25240 Linyola', '973575019' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008352@xtec.cat', '$2b$10$.mWGYdn5TR0hFzc2xMHHaeAqYb4vInLV7Z9rKI5jFNeEmGQuDG.C2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de La Pobla de Segur', '25008352', 'av. Catalunya, 22, 25500 La Pobla de Segur', '973680200' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008364@xtec.cat', '$2b$10$ZH557dlfrzIps5UtPLNZR.57N2SXVlfp5jpC0bi6MFV38zYfGP1dS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Sant Martí de Riucorb', '25008364', 'c. de l''Església, 1, 25344 Sant Martí de Riucorb', '973331100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008376@xtec.cat', '$2b$10$FllZr9FCYtbDWFrbO4guiOxzIWTKx/E5Ce.geSa.tDQbnBPDqymbK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Gimenells i el Pla de la Font', '25008376', 'c. Rentadors, 12, 25112 Gimenells i el Pla de la Font', '973748417' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008388@xtec.cat', '$2b$10$hpDqdSflf6TE8zos718EI.tItMqxwhwrbGJBs3kQsiALQnLBc95Ja', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de La Torre de Cabdella', '25008388', 'c. de La Plana de Mont-rós, s/n, 25515 La Torre de Cabdella', '973663014' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008391@xtec.cat', '$2b$10$EA1LcWzhIpvaLiHOqz.EPOTUG2p9xx62/Qd2U.MrTAg466LPrbTVC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Petit Estel', '25008391', 'c. Bonavista, s/n, 25241 Golmés', '973712543' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008406@xtec.cat', '$2b$10$l.Rw4R036mO2EEFJtF7ahueglesT/aYg2jIpNACMP/y80jKI5Y5Ee', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'AH Hospital Universitari Arnau de Vilanova - AH', '25008406', 'av. Alcalde Rovira Roure, 80, 25198 Lleida', '973248100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008418@xtec.cat', '$2b$10$ZNCBpPgfYMuwjxF4O8bgg.F7q270DZHqasyrA3Aq3rvRm26z7zjF.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Benavent de Segrià', '25008418', 'pl. de l''Ajuntament, 2, 25132 Benavent de Segrià', '973777872' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008421@xtec.cat', '$2b$10$qZgPzvbrHpH9O39xGB776OsjYuAEhq16iMxcArrG6GroOG3PlJJ8C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Solsona', '25008421', 'c. Antoni Gaudí, s/n, 25280 Solsona', '973481846' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008431@xtec.cat', '$2b$10$QIcNTLPM197xXJl9hFP5Eusye.swn1SvjNfgOgOtQAu.Kwk/zmfqK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de l''Albi', '25008431', 'av. de les Garrigues, 4, 25450 L''Albi', '973175004' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008443@xtec.cat', '$2b$10$Bqsw0tpKbUXeQRIWVLQ59eQPlTSHfl9ptlNXjSeQ.LxKjLVad1sH.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada L''Infant dos', '25008443', 'c. Enric Granados, 10, 25230 Mollerussa', '973710449' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008455@xtec.cat', '$2b$10$X4.1f1CGourzTzgZ0/bbxu.0tumK9eFeIkmxcY9O4vcIGRtMvXFl2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Tremp', '25008455', 'c. de Barcelona, 1, 25620 Tremp', '973651061' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008467@xtec.cat', '$2b$10$kubIYJCIC04DPB1vUDMpFuBYldMRIKSkh2EhuUEoeqHMiiIX4hJSa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EFTE Centre Públic de Tècnics Esportius dera Val d''Aran', '25008467', 'Alberg Era Garona, 25598 Naut Aran', '973644595' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008479@xtec.cat', '$2b$10$o7xk1ndEvEKCfMGQEDpIJeoVNsB/3w9C2Wn4eiZ5LGKqI0DrBdFiW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Carrilet', '25008479', 'c. Joan Miró, s/n, 25171 Albatàrrec', '973720710' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008480@xtec.cat', '$2b$10$YWIhtV1K4WoaCNi2/1WekO3DcAMg88A/elNxrKUXmP.rFN1iWgGr2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Picarol', '25008480', 'ctra. de la Vall d''Aran, 55, 25595 Llavorsí', '973622232' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008492@xtec.cat', '$2b$10$wJDMGuj8FjmYs4eT5IbtkuH1N7Zm98cTowRphnl5NmbaXE9CMdqPG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Parc de Gardeny', '25008492', 'pg. Onze de Setembre, 76, 25003 Lleida', '973275239' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008534@xtec.cat', '$2b$10$zWL.R62baoafb0jsPaRJFePgcm3c/5SO5LyCXJSsOAKoEkYpQGaDq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de La Vall de Boí - ZER Alta Ribagorça', '25008534', 'c. del Riu, 6, 25527 La Vall de Boí', '973694142' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008546@xtec.cat', '$2b$10$9pgCLyjevkOwAimd5wbQq.nG0CqsvHZCo/JDssRaE4PWjfga9W1Ca', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Tàrrega', '25008546', 'av. Onze de Setembre, 4, 25300 Tàrrega', '973313006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008558@xtec.cat', '$2b$10$9wZA8VHuDgB2GmSCxRPcy.bEIKTj9E24UGkTxq5nTWO1KVrgt3N1W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de La Seu d''Urgell', '25008558', 'c. de Capdevila, 29, 25700 La Seu d''Urgell', '973354446' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008561@xtec.cat', '$2b$10$nFohjOMkXo9AwNSQAXVkmOwn6R1vKhYbbA0uAqdk.a3goqCfdvhZ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Balaguer', '25008561', 'Camí EScola Gaspar de Portolà, s/n, 25600 Balaguer', '973448159' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008571@xtec.cat', '$2b$10$pK24yqbkesG1FUjoZG5b1.PPr3EfthumLM2aJAcWJQJighcDkEoGi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Joan Comorera', '25008571', 'c. 1 d''Octubre, 2, 25200 Cervera', '973532564' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008583@xtec.cat', '$2b$10$Z3G9amhrAWOVEBd8o0f.4..1dD7yUl3AVwhWPsq9UVLCmcCuVnAQe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA La Seu d''Urgell', '25008583', 'c. de Capdevila, 29-35, 25700 La Seu d''Urgell', '973360604' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008595@xtec.cat', '$2b$10$gF98g1AzFpO8/b5LEoXhQu7vQznn1upxKHFXD.nwNHnkHX9W2ZgdS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Tàrrega', '25008595', 'c. Pau, s/n, 25300 Tàrrega', '973501712' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008613@xtec.cat', '$2b$10$cRn4Fww512FM4gohZTVRWO/KRHU7ZFIj.aGmG9qfPGjFjCIwSPile', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'URPIJ-UCA Hospital Universitari de Santa Maria - URPIJ-UCA', '25008613', 'av. Alcalde Rovira Roure, 44, 25198 Lleida', '973727222' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008625@xtec.cat', '$2b$10$Pc.Vam/2x6Oskkvt7jyFHeGL2wz5CX9otHjw8iu6QjNj0xhc9tQFS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Mollerussa', '25008625', 'c. Arbeca, 34(Edifici Escola de Música), 25230 Mollerussa', '973600955' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008637@xtec.cat', '$2b$10$Up3FqAtc7mMQHXP4EB9YSOxwdi2XEXrW1a7sLTqe.HY1QVTMSMyuq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Les Llavoretes', '25008637', 'c. Sisquella, 4, 25120 Alfarràs', '973760070' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008649@xtec.cat', '$2b$10$XugOBk7Y1kW/MgIcaNg5HOAzYoPP6NjgBbndHXQAiZvXJgYX6W6ka', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Francesco Tonucci', '25008649', 'c. Pont de Suert, 4, 25001 Lleida', '973032279' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008662@xtec.cat', '$2b$10$LvG6RUIS3rohTOAiCpO1t.QJJkISMjXTUNuR7dOtOGO4/EKLVufb6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música de Cervera', '25008662', 'c. Mestre Emili Pujol, 2, 25200 Cervera', '973531102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008674@xtec.cat', '$2b$10$QlLgW3laa82VSupTZa0U7emxOn06FTEeVDdXFR2KgqB7q0PRgJPrW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de La Fuliola', '25008674', 'av. de Catalunya, s/n, 25332 La Fuliola', '973570013' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008686@xtec.cat', '$2b$10$aToQW2WeOZ7DBd4x25kbwuRFcc8nve5F59WBhNHnNMJrl386tzRda', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Matxicots', '25008686', 'c. Riu, 4, 25594 Rialp', '696933441' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008698@xtec.cat', '$2b$10$SQ2up/PEU5EHDMR.I/c.b.iC.lhhMc2eHVngOe4Ke9gibNgBUVugK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Lo Tossalet', '25008698', 'c. del Mirador del Segrià, 3, 25660 Alcoletge', '973196230' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008704@xtec.cat', '$2b$10$U7rXEg/RGEoMZq3F5WZ5C..BvavAmD7Zv7qA4tg3RdBdilWP804b6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Patufet', '25008704', 'av. de Cervera/rbla. dels Segadors, 25210 Guissona', '973550454' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008716@xtec.cat', '$2b$10$o7d.PVqxjvpJXgcbRmtNhOpH.bB9.Wq2kNer/wrJOagHjpld1uwKC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Parasol', '25008716', 'c. de Bellvís, 37, 25230 Mollerussa', '973711063' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008728@xtec.cat', '$2b$10$YAW6LyBmz5mtrl3HR6ygN.e0s51bzyUFNQ1G8eeWSUf73pJHobrZW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Quitxalla', '25008728', 'c. de Bellvís, 39, 25230 Mollerussa', '973712961' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008731@xtec.cat', '$2b$10$RncaA3qXHMIdK8HJbc7eG.UZVazk2lhXWYSQoXEoFfUGooG3QA8yi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal Quitxalla', '25008731', 'c. de les Eres, 17, 25183 Seròs', '973780434' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008741@xtec.cat', '$2b$10$pVvWiSq9QpWTf/T6z.474On1EREVFINXl1nP.Cr780N5svHDgqJ/y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Val d''Aran', '25008741', 'ctra. del Túnel, 2, 25530 Vielha e Mijaran', '973641364' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008753@xtec.cat', '$2b$10$KeeKQorhsaoCDQzKNJXb0eWm8z1iucYNg1VxbGCaFqdiJZSSUpK1G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Solsonès', '25008753', 'c. Dominics, 12, 25280 Solsona', '973481366' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008765@xtec.cat', '$2b$10$vaDRZy9qPB22jMgqOuJ5hODc.z5CqCtoZcwY4y.b7EkQp45XU2j0K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Vall Fosca - ZER Pallars Jussà', '25008765', 'c. Únic, s/n, 25515 La Torre de Cabdella', '973663014' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008777@xtec.cat', '$2b$10$/j00IBX1JsKQGAVtMVwc3OOklFUNNRnd6ai8Ri2di3KJd4B5n4cBO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Parc de l''Aigua', '25008777', 'c. de Sant Paulí de Nola, s/n, 25001 Lleida', '973208289' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008789@xtec.cat', '$2b$10$oRd/ABjjnRexOF.fisLU8uzbzJAhCns4FIwr7FLbKaCTHddptt4NO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mont-roig', '25008789', 'c. Marta Mata, 48, 25600 Balaguer', '973449566' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008790@xtec.cat', '$2b$10$o6Va./STgnUiNNOkk9zANembGGUwD8NTY7d.aX2I2syP9GcBRH8cW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Maria-Mercè Marçal', '25008790', 'c. de Pau Casals, 15, 25300 Tàrrega', '973314306' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008819@xtec.cat', '$2b$10$Q6DCkme31RCODzUr/FZV6OPP9pNx.lMHliwjgi1fXMQ9bPBVN4bjq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Alcarràs', '25008819', 'c. del doctor Castells, s/n, 25180 Alcarràs', '973791109' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008820@xtec.cat', '$2b$10$/0yTJSIg.4c8qAzWjel22e6sxJ/bwfYDcfAEjKfWpT2mE3LruRxia', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Músics-Taller de Música', '25008820', 'c. Vallcalent, 65-67, 25006 Lleida', '973260289' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008832@xtec.cat', '$2b$10$nrxXTQJsjBVyIeY0Y2Xu0.JlRZ3R2DwYdv2xtmXqoN0JInBJCAnQK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol de Bellvís', '25008832', 'pg. d''Urgell, 17, 25142 Bellvís', '973716312' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008844@xtec.cat', '$2b$10$fI7sliRpi9YwpvmOLrAI0eumip4jVZok6HRBAKlHPi3H5iFFP7Cn2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Malfargats', '25008844', 'av. de la Diputació, 24, 25560 Sort', '973620010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008856@xtec.cat', '$2b$10$UilIqYEWMtPaslXigB/2iu25cxGWMG8S4mMKCYEhq9WgCSxxE7xoe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Balàfia', '25008856', 'c. Lérida de Colombia, 1, 25005 Lleida', '973235343' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008868@xtec.cat', '$2b$10$brFeNDu1wH9BpsaAXcyR0uh87k0uPfaKIyGFT9ansuxkCmkx79VL2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Gargot', '25008868', 'c. Bisbe Irurita, 3, 25006 Lleida', '973289613' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008871@xtec.cat', '$2b$10$yr5TRntp.MVtRjLau1PzSecXWsOa2st9f01OXGDJHrlYyCBkGM6qa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Maials', '25008871', 'pl. Eliseo Sales, 32, 25179 Maials', '973130449' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008881@xtec.cat', '$2b$10$G82asFd7MhthDwAeFNQmU.HsRwHCc01AEkI9JfrC/ZOhIiueAxgPe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Solsona', '25008881', 'pg. de St Antoni M.Claret(casa cultura), 25280 Solsona', '973480563' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008893@xtec.cat', '$2b$10$DoqPT4wbet4PLe.78EVN1.YxYLpMAh6/tZQ/AcR/IZ5vKQKjtWwvu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Parc del Saladar', '25008893', 'av. Devesa, 50, 25180 Alcarràs', '973795463' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008901@xtec.cat', '$2b$10$m2oOjkMC.MhLRE/QaIxDGOILVnuDusq1z1E5L6XhH4ZFDli/CYJUK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Pons Roselló', '25008901', 'c. Canonge Brugulat, 16, baixos, 25003 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008911@xtec.cat', '$2b$10$RtvnFerwcn2CgKNi1katFu3QhLPLl/n5idQnwsSsDqtltiDZWZ3lW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Estel', '25008911', 'c. de Pompeu Fabra, s/n, 25110 Alpicat', '973737554' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008923@xtec.cat', '$2b$10$eT5ZOt8zRudHT8ul7sQwE.BylN5FFtBrlbO2D89tksjM40.2wmzO2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Enric Granados', '25008923', 'c. Victòria Kent, s/n, 25071 Lleida', '973220333' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008935@xtec.cat', '$2b$10$TMOMUcU4K10D.0wnpJ6.Je8V80/7BhT912rvykThPqWMGl7TSGWDW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Ràpita - ZER El Jonc', '25008935', 'c. Joaquim Lluch i Rovira, 1, 25617 Vallfogona de Balaguer', '973445018' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008947@xtec.cat', '$2b$10$zmI/lgpRiRPyg19.cp5xX.J6oGpPi3gjePUcuEVXxbi4mwGigeKf2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Plou i Fa Sol', '25008947', 'pg. Moragues, 23, 25154 Castelldans', '973120002' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008959@xtec.cat', '$2b$10$LvhqkdWZmssyoWfhG2vfJO3IAxhp4taOrgjAZm8n8mAjZYB99THpa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'C.Educ.Justícia El Segre', '25008959', 'Partida Rufea, 68, 25194 Lleida', '973280041' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008972@xtec.cat', '$2b$10$GU5oQ8QG/Cj4rH3JgwPZJORgZ/q0qbR17PTOienVvOYsgZUkOHfQy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Picotins', '25008972', 'c. Afores, s/n, 25340 Verdú', '973347210' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008984@xtec.cat', '$2b$10$rbD3MiRKparEoU5IJQFovemP/okeGG0vDdqWcfqbNWEgwD0JSFrHS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Tremp', '25008984', 'pg. de la Conca de Tremp, 5, 25620 Tremp', '973652066' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5008996@xtec.cat', '$2b$10$RTlTo8EBgM9Wz1D6tCp6RuHIClSDcJI6otyNFAtiXI4uTzDjuOUxW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Organyà', '25008996', 'c. Montanisell, s/n, 25794 Organyà', '649128368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009010@xtec.cat', '$2b$10$E5.9hTOVr6k/LcRtKp0n6OB8oGRKurYTc9VOefIdcm7TwTLuyI292', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada El Pati d''Alcarràs', '25009010', 'Travessera de les Escoles, 7, 25180 Alcarràs', '973790512' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009034@xtec.cat', '$2b$10$lMQSUHte2ZdLI79HsDs.ZOqHs2wtjgPVStLoQvfy5.WRv4R.ZGWze', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ciutat Jardí', '25009034', 'c. Carmel Fenech, s/n, 25199 Lleida', '973725710' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009046@xtec.cat', '$2b$10$w7kv1nofUmsu9wADQbu9ye9BNuCGLd26ARKlG5sEfuS430P3sMIv.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Picarol', '25009046', 'c. de les Eres, 2, 25330 Vilagrassa', '973313913' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009058@xtec.cat', '$2b$10$3L.nOzRhsNiEN.xA.Mhmt.u93uVKpq1ZoRYiq2f0eySk1HWTZooYO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ramon Blanch i Verdú', '25009058', 'c. Major, s/n, 25690 Vilanova de la Barca', '636990538' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009071@xtec.cat', '$2b$10$QmgL27/Mt03TnmTwvyO9KehZRhJdcNHlJu9y65LV/MObInTq6/QEW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Països Catalans', '25009071', 'rbla. Corregidor Escofet, 92, 25005 Lleida', '973725340' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009083@xtec.cat', '$2b$10$Oba6Wjaj1Mq0yOspr5KMWuB58K1kARt8nAiddFB.d0mlRa/riGMHW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Sanaüja', '25009083', 'pg. de Ronda, s/n, 25753 Sanaüja', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009095@xtec.cat', '$2b$10$u21QWut4gUZTiuTWgCSkUeKCXredrSGMSsYaybo7DFRDG0jSPiKRW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Savines', '25009095', 'c. Josep Benet de Cervera, 1, 25200 Cervera', '973534404' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009101@xtec.cat', '$2b$10$VIQChdtOsqX6PzKKMat2MOANijLraJ7gabcwlAWlMeR5MDpmdIqvm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Vinyet', '25009101', 'c. de Francesc Ferrer i Guàrdia, 1, 25280 Solsona', '973480777' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009113@xtec.cat', '$2b$10$pe0lO4JjBQ6EIR6cvyoWkOzgbbGv.h1tRXTVXcbp1eusBP02vgo/6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestre Ramon Estadella i Torradeflot', '25009113', 'c. Mestre Santaló, 2, 25210 Guissona', '973552092' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009137@xtec.cat', '$2b$10$3BPY95toD4RrN7LTbaOKEuCbOE5MqewMh/UPPBVgjWiuqAcXkoM2e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Castellserà', '25009137', 'c. Major, 35, 25334 Castellserà', '973610757' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009162@xtec.cat', '$2b$10$JIJRqakguUOljh7qFCnn.u05RF381rHpqYLpdwFIaGGJtuctT10FS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EFTE Catalana de la Caparrella', '25009162', 'Partida Caparrella, s/n, 25192 Lleida', '973272022' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009174@xtec.cat', '$2b$10$F1zttQquT6rbdl9cu3mboOe6mOHerdJ/FUvsPq0KsIJebPD1mfp.S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Vila-sana', '25009174', 'pl. Major, 4, 25245 Vila-sana', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009186@xtec.cat', '$2b$10$lR//D5Cm0prDpXgPNM4DTeLTvl4jFZIxzOQKNXXRsxw3EGFIbKL.i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Valira', '25009186', 'c. de l''Orri, 66, 25700 La Seu d''Urgell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009198@xtec.cat', '$2b$10$EHvUGHOoSHHuv/YiQz1kXuYvEHZ3WZa0Y0kmkllFi1btLUG4bHElG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Escoleta', '25009198', 'pl. del vuitè centenari, s/n, 25420 Puiggròs', '973143016' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009204@xtec.cat', '$2b$10$zq9//GoqZg2TJEnToDkcouB2rP64ZdF.iWPd.sWhNeEYPVY.S0akm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Mainada', '25009204', 'c. Sitgetes, 11, 25139 Menàrguens', '973180767' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009216@xtec.cat', '$2b$10$ATNsM5TZ5.Kj7VB1OXnyvOJbmRsPJ6vORJKPaFcxKLOthtg3d1puq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal de Llívia', '25009216', 'c. Grealó, 5, 25001 Lleida', '973238410' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009228@xtec.cat', '$2b$10$M9E6ZPDGroAfLfgQBrLSfuokWqC0vduHeFBbUpwB7McTTtXYnj6Ju', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Niu', '25009228', 'c. de Balaguer, 29, 25138 Torrelameu', '973190792' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009231@xtec.cat', '$2b$10$G69K1ByBZLSkgYtdZcne7uLFtOkNiG1OyGEqAgD7Wzkq1wO.fcL6m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol La Tenalla', '25009231', 'av. de la Generalitat, s/n, 25222 Sidamon', '699248058' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009241@xtec.cat', '$2b$10$9wF1drxSgPsFDdA5RHYIROx0Xr.6Ig1fJuopKpK05qFglnpkAFjMe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de la Seu d''Urgell', '25009241', 'av. Pau Claris, 16, 25700 La Seu d''Urgell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009253@xtec.cat', '$2b$10$l2zF0SUc7M8U31Y03m/qKem1P7GS4yYTvXrZLxsXftnon8NqKSawS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Carrassumada', '25009253', 'c. Vinyes de Dalt, s/n, 25170 Torres de Segre', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009265@xtec.cat', '$2b$10$PQ9/izG3gRsKyF1JEoQjS.1kve9H2dyshY44AoTSVedXGO4lmlujK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Tabolets', '25009265', 'c. Joan XXIII, 19, 25182 Aitona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009277@xtec.cat', '$2b$10$2mH3JYydYj3K3d/Hd.1hi.BAbYLAkPuxegZBo9T.9yz4hYYdNLp4i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Niu', '25009277', 'c. Germans Castelló, s/n, 25230 Mollerussa', '973600782' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009289@xtec.cat', '$2b$10$f.xQU7iXAwqKZUsfWvNXDOHk.j5b6DCTgYbQuHQFo.a4ZLwUtT4UC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Sant Ramon', '25009289', 'av. de la Font, s/n, 25215 Sant Ramon', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009290@xtec.cat', '$2b$10$xD2tXl3oXqsV56CXwFhD8.R/tTVCDI6BFKM.ob9XmEZLQtEyLXFiW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Puigverd de Lleida', '25009290', 'c. Carretera, 12, 25153 Puigverd de Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009307@xtec.cat', '$2b$10$oLQ6bm.kiXs2CvHV9Kk6seEhwq/IzXe9K0h.rKuA2jBvq157FZ8qG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal d''Alguaire', '25009307', 'c. Bassa, s/n (Esc. Teresa Bergadà), 25125 Alguaire', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009319@xtec.cat', '$2b$10$dxju40owAmMho294nfYxVO96KOoNxBesNw5Mu.IGGJqJ.b5u1lp9y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pia del Pont de Suert', '25009319', 'Barri d''aragó, s/n, 25520 El Pont de Suert', '973690830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009320@xtec.cat', '$2b$10$rjMUhm8wFJeVjdTJs/zOiOKg4zCJeo2DP8AUu4jSwRWzmeqirh.TG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Oliana', '25009320', 'c. de la Pau, s/n, 25790 Oliana', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009332@xtec.cat', '$2b$10$5sxVQSbt9e2yEuO6qjW.Hu84iNG7zXnvYTT8lI0cMWF952DkGSS7O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Niu', '25009332', 'Av. Ondara, s/n, 25300 Tàrrega', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009344@xtec.cat', '$2b$10$jdGCN6W7i/13HwaKRr9k5uMZSbUm7V9wGwUtKICSyooKXC0fh52Qq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Mitjana', '25009344', 'c. Josep Pallach, 1-9, 25005 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009356@xtec.cat', '$2b$10$dbg7pKZvUIFnOYpPyEi9XumkfqPcHYdfUajR9ifOTRMRSTzhFUJS2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Arrels', '25009356', 'c. Girona, 35, 25230 Mollerussa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009371@xtec.cat', '$2b$10$6io6mZsi6CB3CsxCMG024.ijpDyHtCY/cby3bu75vrWuTL3.qBCZe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Os', '25009371', 'c. Germà Peralba, 2, 25610 Os de Balaguer', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009381@xtec.cat', '$2b$10$LakeVULRLDFC1rZHj5I/teblFbeIIUN3ST5cD13jQf/NFd4u1Izzq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada La Tribu', '25009381', 'c. Xavier Puig i Andreu, 13 (Brasil,s/n), 25001 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009393@xtec.cat', '$2b$10$SWNad1Bsrp0o/cOUlGrYoeFjRY.P/ImAyHleLIWGKRNBkspMxwiFy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre Tècnic Ilerdense', '25009393', 'c. Garrotxa, 11, 25001 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009401@xtec.cat', '$2b$10$eJ0GbXneB70SqgA.MIIIseMegqAz7ZniWDxP2krBx/UcNtP7xxC/m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Arts Musicals', '25009401', 'c. Segrià, 13, 25003 Lleida', '973289389' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009411@xtec.cat', '$2b$10$GOLc0UvZy2NkcPlobSpblO.XUNJHPgFm5HYpAztxtxt3CgV9Rsp/S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Bambarol', '25009411', 'c. Carretera, 1, 25126 Almenar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009447@xtec.cat', '$2b$10$4O9164TTmXZghahB7MU2MOSjaATI/VWuK74Slxb5eYNUNB15z2EPm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Montferrer', '25009447', 'c. de l''Esglèsia, 3, 25711 Montferrer i Castellbò', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009459@xtec.cat', '$2b$10$LVVtSOcefGGiUF5q.XQqLOSS6809mag5zpOWt54WfrIJzxEJ7EDmK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de l''Orfeó Lleidatà', '25009459', 'c. Darrera de Sant Martí, 61, 25004 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009460@xtec.cat', '$2b$10$510cP2R5Rm8bufKglBQQX.k6boDYWRroszpW9KS72dlAZ.Pci8d4y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Lo Carrilet', '25009460', 'c. Pompeu Fabra, s/n, 25670 Térmens', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009472@xtec.cat', '$2b$10$Q2OgJgEEQtc0B69C.qzkXurrDDnnWHkAFLUrgGFsiEjWuSfJ81G1W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Fondarella', '25009472', 'ctra. Palau, s/n, 25244 Fondarella', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009484@xtec.cat', '$2b$10$gHpyPH3gNjrP9/6fuJc9CeEmisdwR2PWFlwD8itogN808YhnnPvxO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Blanquerna', '25009484', 'c. Riu Ter, 5, 25001 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009496@xtec.cat', '$2b$10$wSPcD2TESVbj.BywrYBj4ul7sYfcNKyFGCRih9ITfNZt7MqnvaDGa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Les Arreletes', '25009496', 'c. de Lleida, s/n, 25221 Els Alamús', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009514@xtec.cat', '$2b$10$KnuSG8O1k2YXvyVW5poYO.6QZqu94OtfQwT1lolmunHarNqZMs/Iu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Itinerant del Pallars Sobirà', '25009514', 'c. del mig, 9, 25560 Sort', '973621190' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009538@xtec.cat', '$2b$10$QvFEDDrnhteqGJZqNRF4B.Uc81MeMzkCV8xHKSAUYxQXu/./n3fgu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Bell-lloc d''Urgell', '25009538', 'c. Lleida, 3, 25220 Bell-lloc d''Urgell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009541@xtec.cat', '$2b$10$tGC1nZHUZhr3hhHcy4ozseRMCZ.HnnjrRv2yNmtoucbXq5KhAnpoO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Abella', '25009541', 'c. Escoles, 1, 25613 Camarasa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009551@xtec.cat', '$2b$10$3eB8XeXc1jb7xTHxC7T2je5guACxZ7DYs1Jl6iBFI3VY0Vpu0FMxi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Vilanova de Segrià', '25009551', 'Illa d''equipaments SAU-1, 25133 Vilanova de Segrià', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009563@xtec.cat', '$2b$10$im/Sd34/BemOzjHSAo8zaO2XkTuQ453solbPlxYI/XzS0fYeoUh0i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Pi', '25009563', 'c. del Colom, 2, 25286 Olius', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009575@xtec.cat', '$2b$10$eyaoiLSJzm5xO7XYQvf2qeyWV0Zo6lq6P/a8Zgmq6K45RE0nVSHUe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Putxinel·lis', '25009575', 'c. Escoles, 14-16, 25600 Balaguer', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009587@xtec.cat', '$2b$10$xRAJq9ig2Kxk9Le7TJb45.sngu9rR0uAl/QnF1xoIft5CF.EGsPCW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Albarés', '25009587', 'c. Miquel Batllori, 62, 25001 Lleida', '973202742' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009599@xtec.cat', '$2b$10$CK2QkWYGv5yfSA5rV5f4xO0fQ9HekemKv8GOUjwZ05MfAxvRx.kqm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Jardí de la Mainada', '25009599', 'c. Sant Llorenç, s/n, 25181 Soses', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009605@xtec.cat', '$2b$10$I5e6ScsswZ00srb64Ye6dePM9QBMdCPFqAUcxAqJfyxBu4Z6FkwSW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Piteuets', '25009605', 'c. Cap de Balç, s/n, 25282 Sant Llorenç de Morunys', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009617@xtec.cat', '$2b$10$uOHbDHSpt2ez49IXhqdD6eQHILOECEr4Mgh08lOz6ByOKnfqTGIYK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Esquirol', '25009617', 'ctra. de Santa Coloma, s/n, 25270 Sant Guim de Freixenet', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009629@xtec.cat', '$2b$10$zD9m5uoPnHoKtgoKKO1m0.uDJsbG0YTWm4MAubdzDxf/7SJpu99lG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Rosselló', '25009629', 'av. Ponent, 12, 25124 Rosselló', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009630@xtec.cat', '$2b$10$4jJaqY/8lsFGgJE3OeTjm.3qez3YhlyIRITFejebsLEjNz2xjXcnu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Julià Carbonell', '25009630', 'c. Miralbó, 38, 25660 Alcoletge', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009642@xtec.cat', '$2b$10$.xo49Shxz0UQ73RFoklEK.8L5mK8nRdhhvQye1Mv/zhf3WP2tLZzq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Nova Baldufa', '25009642', 'c.de la Mare de Déu d''Horta(ed.adjacent), 25260 Ivars d''Urgell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009654@xtec.cat', '$2b$10$dznVrC9aZ3t2vuLSq7RKVOBXD03/QOOwXngP3n31eowDR27/luk9.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Patim Patam', '25009654', 'pl. Catalunya, 5, 25263 Preixana', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009666@xtec.cat', '$2b$10$WYUL6IWx8/TZNsB4Xk/2KOGxX/KDxuwvXn/uzr8vvb5W9.7AINZEi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Minairons', '25009666', 'c. de Sant Ermengol, 73, 25700 La Seu d''Urgell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009681@xtec.cat', '$2b$10$DWyGS1dL3XBg82nTW6INbuUi4VSnyMnXk.ftl2.UN/0HD8pgC8hr2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA del Pont de Suert', '25009681', 'c. Aigüestortes, s/n, 25520 El Pont de Suert', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009691@xtec.cat', '$2b$10$ljGFWPz1JGfDTHUiSSWRp.sTWUYokT9KDTwR3Pnb2V4qt6JVYj93a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música d''Alpicat', '25009691', 'c. Major, 28, 25110 Alpicat', '973233554' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009708@xtec.cat', '$2b$10$mlPQSzgMzTyAT9ZN8QuLveH7S/IIUKSUENaqrkKUKx6QwVSrVms5m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Benavent de Segrià', '25009708', 'av. Segrià, 8, 25132 Benavent de Segrià', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009711@xtec.cat', '$2b$10$PRxhylYf.njeS9kZhWojEefEWSCUA33lopUSRyxJQmxTh8iMluA8u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Deu pometes', '25009711', 'c. de Fermí Palau, s/n, 25135 Albesa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009721@xtec.cat', '$2b$10$t/YszkCAgH7Euo.VkK0hMeGZbD6B3O9gZb3nLedLxuOdCmkljP/vS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Alpicat', '25009721', 'c. Pompeu Fabra, 1, 25110 Alpicat', '973675599' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009733@xtec.cat', '$2b$10$RxZUfTLBD/y01vZsODF8Hu3v6kdLpTF6xU481xq7FGEJ0cJAMwF7i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Solà', '25009733', 'c. Corts Catalanes, 31, 25123 Torrefarrera', '873490030' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009757@xtec.cat', '$2b$10$sDesuAwobHFUap1xtO0MF.HSZTRVXQFpDH6L7K6.lErrn9oOADTLm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Baldufa', '25009757', 'camí de Tarrós, s/n, 25331 Tornabous', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009769@xtec.cat', '$2b$10$dc6TiaGLodUcZfnndpoPsOnCMiJedrTIhOcZIfCKs7oY8q28.p8lu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Sant Jaume', '25009769', 'c. La Bassa, s/n, 25140 Arbeca', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009770@xtec.cat', '$2b$10$HXsGRSXlGQealc0JsR0ApO3ASWDG.3kFPAm0j.Abas6/lMf1OMobq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música d''Artesa de Lleida', '25009770', 'c. Lleida, 5, 25150 Artesa de Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009782@xtec.cat', '$2b$10$c9jwyKUu/NV9xsgyts84Zu9NxvLYJoBGBMDSv57jZSPB9sv2tYjZS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula de Música Municipal de Vilanova de Segrià', '25009782', 'av. Catalunya, s/n, 25133 Vilanova de Segrià', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009794@xtec.cat', '$2b$10$JwQ7w2iyzFUg5KEhvcKlFOVbNeMJuYcvpL/pHktq6tf8e9Ux0Hq1u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Torrefarrera', '25009794', 'av. Europa, 92 (dintre Escola La Creu), 25123 Torrefarrera', '973233554' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009800@xtec.cat', '$2b$10$e0Im51dAytaAmRZt2/o0bOISyqC7i20vyrjxyrZb9kJ6yjrH1RCGq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Torrelameu - ZER Argelaga', '25009800', 'c. de la Bassa, s/n, 25138 Torrelameu', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009812@xtec.cat', '$2b$10$aFmY8F7jrUuzjH.Je33XtO2REzgsJsfMRnC.tm3U1Z39KzynRMFvO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Raimat', '25009812', 'c. Les Escoles, s/n, 25111 Lleida', '973724237' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009824@xtec.cat', '$2b$10$z1WMUBqvTLWYl2IbePm8N.Hem4TEZcmHUjKviE1gteJyvSWCaR5pm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Ronda', '25009824', 'Rbla. La Mercè, s/n, 25003 Lleida', '973275682' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009836@xtec.cat', '$2b$10$eiu38VzugmPFJCstJ0eFtOX8Hsoas3Ty2ng7u0lmkczIb.55mWp5K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Mitjana', '25009836', 'c. Vicenç Ximenis, 4, 25005 Lleida', '973982370' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009848@xtec.cat', '$2b$10$868SMGtXzxzqF67aqfTnW.IuYgWbYhReIXpSC7Tq58ITIqgDeJ5be', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Linyola', '25009848', 'c. Pons i Arola, 88, 25240 Linyola', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009851@xtec.cat', '$2b$10$NxA/lUnZL1B.nDSB3vusNumVHHtzVR5zmAP9px1WuIO8pH5Xv.gUi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Puigverd de Lleida', '25009851', 'c. Lleida, 1 (dintre Escola Sant Jordi), 25153 Puigverd de Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009873@xtec.cat', '$2b$10$20Hrn.v5Sd9jQBGVXq1aeela.ZyeAn7eK2PZKT8Flw4/J2xryjXlq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula de Música Municipal d''Oliana', '25009873', 'c. Germà Frederic, s/n, 25790 Oliana', '973470576' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009885@xtec.cat', '$2b$10$NhPgeLE1ej.je/M3tnI/b.PQdOSlDN7r6cIaU8kRkBHtgz7MXiUoK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol La Lluna', '25009885', 'av. del Parc, 280, 25110 Alpicat', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009915@xtec.cat', '$2b$10$BefphAffhPN2U8pzfwdU/.kZojCgTOHnLka1mhuMf/oOPRB.SVXze', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Ponts', '25009915', 'c. Santa Maria, 1, 25740 Ponts', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009927@xtec.cat', '$2b$10$iaixMt1PkFZFv5MHmSVzs.Xe16yzEfT4hg1K/kLhsV2jWWH7/hKBK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cent.Prof.Mús. L''Intèrpret', '25009927', 'c. Dolors "Lolín" Sabaté, 11, baixos, 25003 Lleida', '973263906' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009939@xtec.cat', '$2b$10$gw9cV2UE37zEX/4/ydcU5u2Fhlt1Cqz.dMqrgb.8K6sfDPFVV/Mzq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Portella', '25009939', 'c. Escoles / c. La Bassa, 25134 La Portella', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009940@xtec.cat', '$2b$10$AocMuOleqjBItjORequLv.dL/yNZq4RqJq0jyBPdluFX1klCm.jEC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Pas a Pas', '25009940', 'av. de Ponent, s/n, 25124 Rosselló', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009964@xtec.cat', '$2b$10$KiGY5vz2zsrPPHW71x4A6.k7ojy.V75GqczQTTrUVIIEiBZfmmIIi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Jardí', '25009964', 'pg. dels Rosers, s/n, 25750 Torà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009976@xtec.cat', '$2b$10$MLRgVGoUDsoO421GuW.Nj.LykzrAH3jFpS8VsfbJZ5x0HKbns5Vtu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal', '25009976', 'c. Doctor Durany, 2, 25500 La Pobla de Segur', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009988@xtec.cat', '$2b$10$xFHppZVzNEMyUDKQOIf9/.dhz8uJrIA3pVuyUodsRgp1NtSeTwoNq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants del Soleràs', '25009988', 'ctra. Bellpuig, 23, 25163 El Soleràs', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5009991@xtec.cat', '$2b$10$U9ubLHmxISKOV3mTbiAg6enwIm4n5ODxTv1EksV8ydLsuFbiBOFNG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Llardecans', '25009991', 'c. del Raval, s/n, 25186 Llardecans', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010000@xtec.cat', '$2b$10$t9Fp5CKnglB7fXX06mR8U.neiFfNwF1xmkPgID1Y3V0PGq2Z12MRu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Isona i Conca Dellà', '25010000', 'c. La Posa, s/n, 25650 Isona i Conca Dellà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010012@xtec.cat', '$2b$10$RByDY6cRKfhb9pxT8EYbmu47fRlnbbTUbXRT36v.6jo7kYoB.VDw2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol de Bellpuig', '25010012', 'c. Orient, s/n, 25250 Bellpuig', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010024@xtec.cat', '$2b$10$G9UFeJIqsXnf6WHQpe50FOPuFpCrd2HVak0kuhYm0mhUq15iRq0Mi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal La Mitjana', '25010024', 'c. Vicenç Ximenis, 2, 25005 Lleida', '973788199' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010036@xtec.cat', '$2b$10$/ZXkRMNiZZkwqyEoGqdY3uuZ63fg4NdHH32NbeYKhYTnylU4CWZWi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Rei Petit', '25010036', 'c. Zona Esportiva, 8, 25213 Ribera d''Ondara', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010048@xtec.cat', '$2b$10$sqAFpYg8ijmhE9ZZNph1WOCY6w0ZTEYhhjKHEf78U2nCauo8EOGkq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants del Pont de Suert', '25010048', 'c. d''Aragó, 25, 25520 El Pont de Suert', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010051@xtec.cat', '$2b$10$MLY/rivHITdOYa3lmd4vKOKRyO4HoWt9/c.5wrEGdoHA7uOANpvE2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de l''Espluga Calba', '25010051', 'av. Catalunya, s/n, 25410 L''Espluga Calba', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010061@xtec.cat', '$2b$10$rTajie8hgcOX30HFUOx/Yev5eK2GzJhGsstOC17fedg.bCauGHdty', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Les Astes', '25010061', 'c. Talladell, 7-9, baixos, 25300 Tàrrega', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010085@xtec.cat', '$2b$10$8l6e/AC4ygwVNAPmSjjVcu0zP2lm54a9S6/mUZZYyVcZDt.xX6jfK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Mañé i Gavaldà - ZER Ponent', '25010085', 'p. Major, 1, 25111 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010097@xtec.cat', '$2b$10$NKpKMVxxD41sYLmBA5js4.EzITnZ7wEz3BfAAQJ6uTjqezzjhKX1a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de la Vall de Boí', '25010097', 'c. del Riu, 6 bis, 25527 La Vall de Boí', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010127@xtec.cat', '$2b$10$L9uxxU7Z9k8yXtf3lCMDpeP2Qf.9qHItYDTbityj3nwv.fTZep4zu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Castell dels Templers', '25010127', 'c. Mart, 7, 25003 Lleida', '973272472' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010139@xtec.cat', '$2b$10$mKI.e2OxkQ1JGbIG4iW4euzv/gISjgkWpEFYWXSvMc2Qw.rLv9pFa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Mairau de Les', '25010139', 'p. dera Gleisa, 1, 25540 Les', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010152@xtec.cat', '$2b$10$Zb58Xo7AgFjETylX9Z6iDeIOF8cY71rEtxBHdxa7fRirz9PP5j9pu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Niu', '25010152', 'p. Nova, s/n, 25185 La Granja d''Escarp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010164@xtec.cat', '$2b$10$Wn2F4rW/sm0mint9Lyzn1.pxPvP9KHoicXMsWouTSyAkf1dMX5Cq6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'El Pla', '25010164', 'pg. Compositor Beethoven, 8, 25230 Mollerussa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010176@xtec.cat', '$2b$10$9UL.iDe0nVSRW67NeDGnAu9b7zB4RHEFX7cjcTfgfwc6a7fy6SRcq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa de Solsona', '25010176', 'c. Camp del Molí, 15, 25280 Solsona', '973483943' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010188@xtec.cat', '$2b$10$eQ/PL5hgW0o/CUqScZFlpOiTGwS31oILB7lyCvyha972MGStNTKCe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Les Heures', '25010188', 'p. Ricard Vinyes, 6, 25006 Lleida', '973222980' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010191@xtec.cat', '$2b$10$M7D.25mcZpHZnnG8CQpLwuHWO/vOmUXIGoD/f.WwtN9i2JXAF6Eta', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música C.M. d''Alcarràs, de Torres de Segre i d''Aitona', '25010191', 'c. Major, 82-84, 25180 Alcarràs', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010206@xtec.cat', '$2b$10$9yysjYDk2FUV7kVQBY70YO3P8vPEDwrbqYZnr024nlgx1.A4hnwkK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'General d''Estudis', '25010206', 'c. Alcalde Costa, 18, 25002 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010218@xtec.cat', '$2b$10$eXtTmsyy.PA3aD4eu1TKku7nSiSWgUl88TT0h4WaPZuFpSKIYx72O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Francesc Xavier', '25010218', 'c. Comtat d''Urgell, 97, 25700 La Seu d''Urgell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010221@xtec.cat', '$2b$10$muvileDCkZ.GWZN4lJsqI.LuN/pK0HYUdBLbVbc0yOScZPulI.e2e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada TIC-TAC', '25010221', 'c. Comtessa Elvira, 1, 25008 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010231@xtec.cat', '$2b$10$wOond/2PZAaSxy.f5FSu2.7xH1rHFxoGRAgJBwtKyyRqoK9MtE0nS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Salàs de Pallars - ZER Pallars Jussà', '25010231', 'c. de les Escoles, 2, 25693 Salàs de Pallars', '973676274' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010243@xtec.cat', '$2b$10$pTPF0SzM43D17OJj/cVqxeD5yC95VJ8wPkcv.rphYF0NWUEhyzVsW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Art Aula Municipal de Teatre', '25010243', 'c. Roca Labrador, s/n, 25003 Lleida', '973268318' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010279@xtec.cat', '$2b$10$LHUjFHQZa9E71qjQ5UZUE.7jlu6tWVft7DH.u3TZrLdnhR39TvF46', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Dalcroze, Centre d''estudis musicals', '25010279', 'c. Bonaire, 43-45, 25003 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010280@xtec.cat', '$2b$10$YGmySFqIDkf3ChOYLh.lT.Yrqlu7nKPoq6KI6ZARXsxEKhYOCTb3y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Torre Queralt', '25010280', 'av. Sant Pere, 54, 25001 Lleida', '973236497' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010292@xtec.cat', '$2b$10$2FnxfR67fJjqc2oBRQ8DFOEPDm1iAFlAJARS9sKgNAcBUpVTouN.i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de l''Alta Ribagorça', '25010292', 'c. Barri d''Aragó, s/n (CRP ESC Ribagorç), 25520 El Pont de Suert', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010309@xtec.cat', '$2b$10$BdwcfeRfsxQOutd7pRxAo.7SqAL36V27LbIJK98MM3CpqeazFRxmy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mifra', '25010309', 'c. Vallcalent, 40, 25006 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010310@xtec.cat', '$2b$10$W.QihYvjhpXaJKYholMjvelXcKT2smzj7IRW/MM1H2KamzLDeLDSm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Salt del Duran', '25010310', 'trav.  Josep  Tarradellas, s/n, 25230 Mollerussa', '973677893' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010322@xtec.cat', '$2b$10$mWRD.eFkCS1WfB/fY57VKuxJPJWMX2EBM6GalUnP8X8v5f2k5BwnG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'HDA Hospital Sant Joan de Déu - HDA', '25010322', 'av. de la Canadenca, 28, 25001 Lleida', '671510064' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010334@xtec.cat', '$2b$10$KStyZZvZr5qvHF.cWCa8te8pRWLexcUzJsdgqGSLFOuc5V2iBFzOy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Magraners', '25010334', 'c. Vila-Rodona, 34, 25001 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010346@xtec.cat', '$2b$10$BFsZDiRXlJe4AbBEUL0H/.evt9YG2Il73QpDmZUndhWxMIt29YVg6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants municipal de Corbins', '25010346', 'pl. de la Vila, s/n, 25137 Corbins', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010358@xtec.cat', '$2b$10$cOYmmKkbNRl0GMUUFesqUuUBxIUuM2kS8qhSEnlvYnsWDfGFkXCGi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Vall de Lord', '25010358', 'c. de la Creueta, s/n, 25282 Sant Llorenç de Morunys', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010361@xtec.cat', '$2b$10$A/Yyeoo7um/aZfiHmLzS7.4XTy9mQl33SisZJ6ATvXzpwZzBBOhwe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Centre d''Esports de Muntanya del Pallars', '25010361', 'pça. de les Pobles, s/n, 25500 La Pobla de Segur', '973681590' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010383@xtec.cat', '$2b$10$b2FA/VEveIEbJm/E5HOMbut.j4dC0usmhtc8kMVU/mAQRlCSuzACe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola d''Oliana', '25010383', 'c. Germà Frederic, s/n, 25790 Oliana', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010401@xtec.cat', '$2b$10$PjUCkvf8YPpalcgA/kxqb.sfBFejclLocCXLq086GDZbAK1XdAVty', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada El Trenet', '25010401', 'c. Baró de Maials, 88, 25005 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010413@xtec.cat', '$2b$10$kM2KNk.TqcD.XEykNSOFTO2xIZrolTzidxjEJE.vhcrdlqS7ZcPFO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Minerva', '25010413', 'c. de les Valls d''Andorra, 43-45, 25001 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010425@xtec.cat', '$2b$10$muTZYqP.U897ht5i4JZTo.ulOoYL36YIfLEkC73D9jZ2F0NrEUNNK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal del Palau d''Anglesola', '25010425', 'c. Mercè Rodoreda, 3, 25243 El Palau d''Anglesola', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010437@xtec.cat', '$2b$10$IhwjVHLdalWSLeglKqyPeuQlBmUvQhym8LNOxX3hZ6ZNg2dTnFRa.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Dancescape Studios', '25010437', 'av. Sant Ruf, 41, 25004 Lleida', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010450@xtec.cat', '$2b$10$Jw3FeJ09pP93a5dDtR/.oO.4fM/Dt65MPk5iV83GQJJmr2yhJjeeS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Nou Alcarràs', '25010450', 'c. de Fraga, 115, 25180 Alcarràs', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('c5010462@xtec.cat', '$2b$10$rECraONYFjI3svQNFBk/kuq/0B6TiK4y8P26siAtBmKxOLFbCzetK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola de Bellver de Cerdanya', '25010462', 'c. Travy, 11, 25720 Bellver de Cerdanya', '' FROM new_user;