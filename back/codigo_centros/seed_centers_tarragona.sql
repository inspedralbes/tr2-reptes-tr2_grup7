
WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000020@xtec.cat', '$2b$10$fgXbsRFSQxHaCBQ2.kLl.uaaWNL9Cc5Rbw03wrW4fOzGos0ZS9cpq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Miquel', '43000020', 'c. Sant Miquel, s/n, 43714 Aiguamúrcia', '977639335' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000081@xtec.cat', '$2b$10$V0xJK5XqeU8wRssz4c.iXuiQja512Euq6UzeQici2R2M66vR6SPjS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Baptista Serra', '43000081', 'av. de la Constitució, s/n, 43530 Alcanar', '977730254' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000135@xtec.cat', '$2b$10$uhYPoXWiMuY5O/bLcjUUL.kQGHKx1enArqWM8lVhLqCkkQvZ6S1MC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Remei', '43000135', 'c. les Rodes, 8, 43460 Alcover', '977846176' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000184@xtec.cat', '$2b$10$43DIfcrB5e2wxHv/SBVCEuGwcLjTYR.7KnQGjefKIe9GzzssXaXp.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Teresa Salvat i Llauradó - ZER Baix Camp Nord', '43000184', 'c. Joaquin Mir, 32, 43381 L''Aleixar', '977815001' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000214@xtec.cat', '$2b$10$CJhP82Wdvd/gDBgB4bbXIONKgFtgiKuMw3QhfYUF8VQC.7yfOIeRu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Fusté', '43000214', 'av. de Catalunya, 51, 43365 Alforja', '977816204' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000226@xtec.cat', '$2b$10$nZNt1wg4NkeTYm0yxZnZhucPT4m1MTzgqE3RpyDOIG4tdKt10XuQy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Barquera - ZER Atzavara', '43000226', 'c. Marià Fortuny, s/n, 43813 Alió', '977613006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000251@xtec.cat', '$2b$10$ro9FoCFIciTB3q2wgZqzFeqBLeK4CB2tV3sc6jZ1goHCd4YDydH3K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Portalada', '43000251', 'c. Portalada, 7, 43893 Altafulla', '977650323' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000263@xtec.cat', '$2b$10$i/07.RdzOvJu7IujouG5HumAAz/D1CJlfbI7GKybxO6m0a/grVZsW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi', '43000263', 'av. de l''U d''Octubre, 13, 43860 L''Ametlla de Mar', '977456480' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000275@xtec.cat', '$2b$10$ln4jKdUuBSOP98qBt8nRqem8cZUgJLM4giJqkQUr82Ujs.e8xalWS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Miquel Granell', '43000275', 'c. Sebastià Juan Arbó, 121, 43870 Amposta', '977701949' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000299@xtec.cat', '$2b$10$snUhIBcFQ/rURKecebzZvebgyYxkutwIHXKtNvNqiIaxWZDKiaAZG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sagrat Cor', '43000299', 'c. Germana Teresa Mira, s/n, 43870 Amposta', '977700094' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000329@xtec.cat', '$2b$10$RG/S13TAuNeAOs.KfKUyr.tBwKH0EN5kVQErtDUs2P0dT98r3pOyy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ramon Berenguer IV', '43000329', 'av. Mestre J. Sunyer, 1-37, 43870 Amposta', '977701556' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000330@xtec.cat', '$2b$10$f3MYPei3GSbdkEPCIejaJOZa1nGWUziwz1Smk.qihhVwEi3ET2MgO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària d''Amposta', '43000330', 'av. Josep Tarradellas, 2-12, 43870 Amposta', '977701500' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000378@xtec.cat', '$2b$10$229j2rMDSDDh9bWQ7luDPOMexAsnAAhLtCrzQqRvW4C7dCc0plVOm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Julià', '43000378', 'av. Priorat, s/n, 43720 L''Arboç', '977671353' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000391@xtec.cat', '$2b$10$341EtS7d9KkqRrinTfDfUe1ed8Sn1LAdrUOV68ownlYPf6p8dakuG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'L''Arboç', '43000391', 'rbla. Gener, 30, 43720 L''Arboç', '977670344' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000421@xtec.cat', '$2b$10$jpM8u2um9IJLFvtmCVS4t.vWSZQvCph6J1mfOqHZcP2xp6BB4yH9S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Miranda - ZER Ports-Algars', '43000421', 'c. Dr. Trueta, s/n, 43597 Arnes', '977435467' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000433@xtec.cat', '$2b$10$FTOhcUaTfluWPAyvop9AlunzGa57tj5941kfac1dWWHhDhaBbWwt.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Miquel', '43000433', 'c. Sant Miquel, s/n, 43791 Ascó', '977405114' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000470@xtec.cat', '$2b$10$bhbCVUBSJsdpoRzciDsxGeBkhBe6tIsWGzbO1vS85hp1aLioKkkmy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Valldemur - ZER Conca de Barberà', '43000470', 'c. Anton Vidri, s/n, 43422 Barberà de la Conca', '977887304' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000512@xtec.cat', '$2b$10$xOanekT2chN8gVhCaGPGaOQtavxoX9xXnqlPkIMF.YoZhUj5NcILq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Sarraí - ZER Baix Priorat', '43000512', 'pg. del Priorat, 2, 43738 Bellmunt del Priorat', '977830937' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000548@xtec.cat', '$2b$10$PMHwFzJdN6bIcMVRRgy4qOzpvIdpCcbmms18bmk4SjXPfL3Vdwbp6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Muntanyeta', '43000548', 'c. Montserrat. s/n, 43719 Bellvei', '977168147' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000551@xtec.cat', '$2b$10$qKMDZ9U.z0.InwNDbTVw9ecIbJkQhUIAuqOXnMpezY./4shvl0eI.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Benifallet - ZER Riu i Serra', '43000551', 'c. Hospital, s/n, 43512 Benifallet', '977462127' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000561@xtec.cat', '$2b$10$rsWbD5oVGMUscdcYhXVPz.j2QlIAHDTlFDXHFbKAUsEJ5fRm1u2mG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antoni Nat - ZER Benissanet-Miravet', '43000561', 'c. Reus, s/n, 43747 Benissanet', '977407464' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000597@xtec.cat', '$2b$10$D/lUUAS60Vk6vzfdOa9YA.wUHUhqVy1.ChYnPlG6gargAhJdaz1FG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ull del Vent', '43000597', 'av. Baix Penedès, s/n, 43717 La Bisbal del Penedès', '977688352' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000603@xtec.cat', '$2b$10$fxL1WXRgrSf.DWa4LFvmxupET2Ngv5RG5AFTJYX2ealPt3LKraCXq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Blancafort - ZER Poblet', '43000603', 'c. Raval del Portell, 1, 43411 Blancafort', '977892175' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000615@xtec.cat', '$2b$10$pzsXedRAPD4WqbFwLa.sIeF2uZjzf84xi4zD6Vlq/Zq68Ej6TuOCO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Estel - ZER Els Ceps', '43000615', 'c. Muralla, s/n, 43884 Bonastre', '977809220' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000627@xtec.cat', '$2b$10$KXJnz/S62XiDESYJxP9bm.kbF5KWab8YCci1LdjT3M4nG2DryyTkm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rocabruna', '43000627', 'Camí de la Creueta, s/n, 43350 Les Borges del Camp', '977817400' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000639@xtec.cat', '$2b$10$wnI10bX33av4G7kTaQOWcO8DkCYbuQj8qpto.oXiTTCydsk78Cfva', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Blai - ZER Terra Alta-Centre', '43000639', 'c. Caseres, 50, 43785 Bot', '977428246' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000640@xtec.cat', '$2b$10$Z4bgE7CG/wHUfM2Cg8mm6O/VRttQQIyrAPy25918WSx0LAOxTI8tK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de la Candela', '43000640', 'c. Pompeu Fabra, 5, 43772 Botarell', '977826571' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000652@xtec.cat', '$2b$10$N5b3GG.0iBxqrIkCVvwT8.XHTXBaCVMGoy/Uzh9IKYu10GfS3z0F2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jaume de Bràfim - ZER Atzavara', '43000652', 'av. Verge del Loreto, 14, 43812 Bràfim', '977620436' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000676@xtec.cat', '$2b$10$SxR7coXiMIRGwxvRmSNAvOpP4ewnotADcqlom/i/RLhp6m25ZDy9W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Castell - ZER Montsant', '43000676', 'c. Major, 78, 43373 Cabacés', '977839457' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000688@xtec.cat', '$2b$10$d7vAv58lofYid7IC/6Gw0.4qEijkjyys42z/dEDwXyDzs0kE7NNq6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Cabra del Camp - ZER La Parellada', '43000688', 'c. Dr. Adserà, s/n, 43811 Cabra del Camp', '977631195' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000706@xtec.cat', '$2b$10$rWDZlzzTUJ5bfB9sUIFI8.cKcyaejoD5wLHwo6NjEpQschjYNMVXO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Creu de Calafell', '43000706', 'c. Joan Nin, s/n, 43820 Calafell', '977691760' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000721@xtec.cat', '$2b$10$.xLKQiOehoH7nF8HGwRipOQ4IZ79y8Mq1neWOGNAgnGj.ifXyJus.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Jacint Verdaguer', '43000721', 'c. Josep Lluís de la Rosa, 43882 Calafell', '977160431' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000755@xtec.cat', '$2b$10$AGmPqaXIL0D8VItpKUVCUube/NglH0OcbY16dZZ4EivTrvabBuHJy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cardenal Vidal i Barraquer', '43000755', 'c. Creus, 11, 43850 Cambrils', '977369809' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000779@xtec.cat', '$2b$10$dPoIvJBK.u03zbdrVJ1f8OR4ZQC17AHjy6yvKh5GBw9dFR7HK491m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ramon Berenguer IV', '43000779', 'c. Bertran de Cambrils, s/n, 43850 Cambrils', '977361496' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000792@xtec.cat', '$2b$10$YWr1slAnectuF0NJm3sZ1OZr9oE3uZyPATQV3fS.avquLehUFpZqe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Isidre - ZER Les Vinyes', '43000792', 'pl. Carrasclet, s/n, 43776 Capçanes', '977178317' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000809@xtec.cat', '$2b$10$T56kvrBlNXfYL1Zdf6qZ6uY8I2bBBgzfNX/WVMcdBwztRL3.svPBy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Gessera - ZER Ports-Algars', '43000809', 'c. les Eres, s/n, 43787 Caseres', '977431864' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000871@xtec.cat', '$2b$10$z4UQpWASFT4LfS1PtRTXNOSKNGbeL3uzrcJSntK8blaB2to6ukYvW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Maria Jesús Ortí i Abella', '43000871', 'c. Pompeu Fabra, s/n, 43560 La Sénia', '977713265' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000895@xtec.cat', '$2b$10$9olAnf5kNoC3T.VPiXxa8u15o2Zfy/eMwn958rxAQHASRXlDxmkra', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mossèn Ramon Bergadà', '43000895', 'c. Jaume I, s/n, 43120 Constantí', '977521790' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000949@xtec.cat', '$2b$10$obUWQONvJMXz71feeHx3ZuKmdvdmL.u4ck/ZgKWjPqYU/VTSqkE12', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària Mas Bové', '43000949', 'Mas Bové,ct.Reus-Morell km.4(ap.cor.527), 43120 Constantí', '977343289' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000950@xtec.cat', '$2b$10$uCVCuFfq.6zv0EdfrL4NAOWEa0JXDMwzgp.fqseaU/i/egpVQ.nsm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Ferran - ZER Terra Alta-Centre', '43000950', 'c. Calvari, 18, 43784 Corbera d''Ebre', '977421102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3000998@xtec.cat', '$2b$10$miwRF1qcCedfQ3tBQ1aQdO3sYyBwL80deteKoU41h1nPr5p55veK2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pompeu Fabra', '43000998', 'av. Barcelona, 70, 43881 Cunit', '977673077' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001000@xtec.cat', '$2b$10$byLtyebyXh.INENIx0Gu5uC8zF8uVsJIM72//ZmiDR404WhbDTyUq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Xerta', '43001000', 'pl. Catalunya, s/n, 43592 Xerta', '977473050' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001036@xtec.cat', '$2b$10$y2hZ.8Z5zouMBoEQXrL6GO/yTSWmOS9NgmkN6AQltUhJ.brWtwt72', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Martí Poch', '43001036', 'c. Lluís Carulla, 61, 43440 L''Espluga de Francolí', '977870455' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001048@xtec.cat', '$2b$10$0ehSZAkY1u6Vr7a.eJrU.uUsCOhueQ84txyvOAcGhSoYl/0UCXKd2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna l''Espluga de Francolí', '43001048', 'c. Pompeu Fabra, 3, 43440 L''Espluga de Francolí', '977870062' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001051@xtec.cat', '$2b$10$INadcioYNNx0yiAxbbS4lOhgiZ/Rich8tuuVeMo5X99zFrzGj0x9G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antoni Vilanova', '43001051', 'av. de Reus, 2, 43730 Falset', '977831247' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001097@xtec.cat', '$2b$10$6BPX/JDhDsDO/d1qNCvjO.MbwhAMZzOkGz7z0x9W4VhrUQ0pW4uca', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Los Castellets - ZER Terra Alta Nord', '43001097', 'ctra de Camposines, 4, 43781 La Fatarella', '977413610' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001115@xtec.cat', '$2b$10$g.cBptuD1dNa13z.gmdaw.caHzw0S7DGFivxqotxZ.0G9ra3olcIW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de l''Esperança - ZER La Parellada', '43001115', 'c. de les Escoles, 4, 43811 Figuerola del Camp', '977631053' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001127@xtec.cat', '$2b$10$L35nvGqyGOBlsZGM5xrQmuTjuZaOvaxpdr8lRVNlyAd0ouCpvhpEW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Enric Grau i Fontserè', '43001127', 'c. Salvador Espriu, 2, 43750 Flix', '977411045' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001231@xtec.cat', '$2b$10$d9/9Z3ES2ZdSLzY9LSpVGuvA7DpJXPm4cNEefgL72GhIbjDWWXvO2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puig Cavaller', '43001231', 'c. Teresa Borràs Domènech, s/n, 43780 Gandesa', '977420185' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001243@xtec.cat', '$2b$10$Js8TKFRfpBHyU25eX3FiEeyqmtCl/IaLLWXbFKiAAIjfU7CQalL32', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola agrària de Gandesa', '43001243', 'c. Teresa Borràs i Domènech, s/n, 43780 Gandesa', '977420164' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001280@xtec.cat', '$2b$10$FWpRpFdmamUCeflWq8xzqujL6IP0vTkjne7TNnaNC7pfyNGMnWas2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pàmies - ZER La Font de l''Aiguadí', '43001280', 'c. Riu, 9, 43748 Ginestar', '977409380' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001310@xtec.cat', '$2b$10$xER1DBMGsd9qXH6UYtRKruz8jbKj31UVALw6YnI5FoS3tIiCmPzgu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Llicorella - ZER L''Aglà', '43001310', 'c. Piro, s/n, 43737 Gratallops', '977839437' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001334@xtec.cat', '$2b$10$DMwQfxTy7orsQk9rYtUbG.1caDRjDXn3N9T6A0eVRnc5lbgJFTCj2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Feliu - ZER Les Vinyes', '43001334', 'Carretera, s/n, 43777 Els Guiamets', '977413037' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001346@xtec.cat', '$2b$10$ohBt5JDNKwzIhv7fB1hTmeUpnHEfu0GQRPyuec0fimosoiKczGwj6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montsagre', '43001346', 'c. Escoles, s/n, 43596 Horta de Sant Joan', '977435093' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001361@xtec.cat', '$2b$10$e0ZvQDFrwpkVHjKOluOUZus9pZ.17qJSs6ZQdiTBvZnYR39bgyzAq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Cometes', '43001361', 'c. Escoles, s/n, 43712 Llorenç del Penedès', '977677368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001383@xtec.cat', '$2b$10$8E6.vCbCXLB4mAbHlwGYNugbrNmqmHVu.DxNAW8gopMnjYrW7eF.q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Anicet Villar - ZER Les Vinyes', '43001383', 'c. Baixada de la Font, 14, 43775 Marçà', '977178216' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001395@xtec.cat', '$2b$10$BSTkYneVWXDK.xeONRXgbez0h8e820dbNop6VBWQLbw2KYFXrtcqa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Teresa Subirats i Mestre - ZER Montsià', '43001395', 'c. Afores, s/n, 43514 Mas de Barberans', '977739135' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001437@xtec.cat', '$2b$10$SHdjAKCv9PyB/wcOQkE7ZOPkW0yIlNq.6lQiV/QTxQXeEikZmPhFu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rosa Gisbert - ZER Montsià', '43001437', 'c. de la Galera, s/n, 43878 Masdenverge', '977719199' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001462@xtec.cat', '$2b$10$S5vRNAwTudVd8nlpQ5gvcuuTCucuIbuJ5gl1B/mzhPEjBtMwfZO82', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Til·lers - ZER El Francolí', '43001462', 'c. Sant Isidre, s/n, 43143 La Masó', '977637501' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001498@xtec.cat', '$2b$10$itZ2h8Fpru1i70DDVZDMF.NqJO08F/XzqK9Jgj2T4i1wDOHn3iace', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Onze de Setembre - ZER Baix Priorat', '43001498', 'c. Joaquim Royo i Vidal, 10, 43736 El Masroig', '977825436' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001553@xtec.cat', '$2b$10$Me2RSH0fmg9oBPTNTPkfTuD460XJRTABceVs8CGbGysMU8dXUyUl.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Muralles', '43001553', 'c. Dr.Folch, 4, 43400 Montblanc', '977860199' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001565@xtec.cat', '$2b$10$he0mYQ.9NymQWnMQM1VhzunmmuKHh1QpkKYwjWgTYTcxrRSNCzXJe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Tilmar', '43001565', 'av. Nostra Senyora de Montserrat, 3-5, 43400 Montblanc', '977860196' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001577@xtec.cat', '$2b$10$ewQEti1bkVNJEuVzqWjW8uMqOCgCehCXNswuF8kBo0tDmWbbjuaa2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mare de Déu de la Serra', '43001577', 'av. Nostra Senyora de Montserrat, 3-5, 43400 Montblanc', '977860122' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001607@xtec.cat', '$2b$10$kuoAqkm0sLaX3aCAhGAbhOolU9N7gGCBkdx6Ylhqww8u/8TtDEEEa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep M. Soler i Gené', '43001607', 'av. dels Països Catalans, s/n, 43340 Montbrió del Camp', '977826520' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001656@xtec.cat', '$2b$10$5A4anCar3NpnShxFL0ie/uwgJlPaBimb2d1I96TUl9hpoJH7TQU36', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Teresa Godes i Domènech', '43001656', 'Carretera, s/n, 43718 El Montmell', '977688433' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001668@xtec.cat', '$2b$10$X/4P1U6bWzlSuh3jqMtjBe4hfuqc0intk73pnjLvn3frIiHXs4H0O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de la Roca', '43001668', 'av. Doctor Sagarra, s/n, 43300 Mont-roig del Camp', '977837283' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001681@xtec.cat', '$2b$10$up9HYgrauSJV0smWSEcaSeV0N0lCKxlbXhNog8FYIImWlXm.EHBwu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Lluís Viñas i Viñoles', '43001681', 'c. Mestres, 7, 43740 Móra d''Ebre', '977400314' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001701@xtec.cat', '$2b$10$gOeqf05cs4BrPPALtvYxYOT5qUtRlvVgZlLXFSijdcgjghFfJ9RHC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Santa Teresa', '43001701', 'c. Santa Madrona, 89, 43740 Móra d''Ebre', '977400123' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001735@xtec.cat', '$2b$10$npgCSMgCTeVc2WDMX4T/P.1iGfGhsCvHBiNbqjXAci5uM1r4oAWmi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ventura Gassol', '43001735', 'camí de Reus, 13, 43760 El Morell', '977840209' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001796@xtec.cat', '$2b$10$fr6smHUrwDBfUKjftlJp6uhYSyKjm.tcWP/CylsKPs5rapAI97M2K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Sebastià', '43001796', 'c. de les Escoles, s/n, 43887 Nulles', '977601644' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001826@xtec.cat', '$2b$10$Qmvdkxh1XBcUiKblc3ecleapY2K71EOGC8pXtlhuMvt0FDU7X0Gkm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Sebastià', '43001826', 'av. Catalunya, 12, 43151 Els Pallaresos', '977610539' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001851@xtec.cat', '$2b$10$wtap4ZQe9RVxg1bMTrsw5eQysROTbpIhRPRfyRX//5rs4u7NVHyee', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Roc - ZER Riu i Serra', '43001851', 'c. les escoles, s/n, 43593 Paüls', '977492327' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001942@xtec.cat', '$2b$10$lxjtrkJjdnecisLepa2DIehHPdyXeZveWjvjbeolf86jO.ozwM6Fm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cèsar Martinell - ZER Terra Alta-Centre', '43001942', 'av. de Catalunya, 4, 43594 El Pinell de Brai', '977426216' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001954@xtec.cat', '$2b$10$/khJMQ9wcCN/kQkNJoqtcuG1UULoLdWQJyIP5XPJDK.t9pnCciosO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antoni Tous - ZER Conca de Barberà', '43001954', 'c. Arnau de Ponç, 42, 43423 Pira', '977887489' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3001966@xtec.cat', '$2b$10$5Q5ql96uyWIu4M1.CdgHA.d5Ih4UnyE/g1jy.5f68ZmlmXcQvwgam', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Ramon', '43001966', 'c. Raval Sant Ramon, s/n, 43810 El Pla de Santa Maria', '977630605' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002016@xtec.cat', '$2b$10$7aoUp9fqZE8avV.qL9eIH.hZsWW77qTYzqp2tyiqIO2QfHuf5wCJ6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Ametller - ZER Terra Alta Nord', '43002016', 'c. La Bassa, 66, 43783 La Pobla de Massaluca', '977439729' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002053@xtec.cat', '$2b$10$zN33hfqBCak8qxBb0Bqbm.ileYpCQJ3vHxN3cCKimsqtElv9Fj5/K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Garbí - ZER Montsant-Serra de Prades', '43002053', 'c. Nou, 94, 43376 Poboleda', '977827127' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002144@xtec.cat', '$2b$10$j6xKBSy.p6nvNGFHgP/kreDGHdx.x04CFW041q3QmBm6m9D41HAmi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de la Fontcalda - ZER Ports-Algars', '43002144', 'c. La Bassa, s/n, 43595 Prat de Comte', '977428307' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002171@xtec.cat', '$2b$10$LVAtFRhMPhyfzGYPRdOCYu6HrsauQ2f46yQjuiVze2wg0DoVMFDJG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Plana', '43002171', 'c. de les Vinyes, s/n, 43812 Puigpelat', '977601716' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002211@xtec.cat', '$2b$10$EGc30Wd8aFdPLuIPSIptmetMuYH5gER3ntmTML8fCMPNkZtFlyeR.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Prat de la Riba', '43002211', 'av. Prat de la Riba, 36, 43201 Reus', '977313911' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002235@xtec.cat', '$2b$10$NuE.CWhsLtCTnFvIDkOOqO1iPw8CUcavm5emisMLP/lXcNXgq2Y8K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pompeu Fabra', '43002235', 'c. Sardà, 23, 43201 Reus', '977344676' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002247@xtec.cat', '$2b$10$lSTlTLUw3RjWtEyeMBcOyenEieSqxzPJMeqNl1918oFCAaQFFqsZO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Misericòrdia', '43002247', 'c. Gandesa, 13, 43205 Reus', '977310272' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002259@xtec.cat', '$2b$10$q8/wAp1jZZzwtUsN33139.7GXcThjra9v2tTqU3z4Lj1qXHTu.um.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marià Fortuny', '43002259', 'c. Astorga, 19, 43205 Reus', '977754270' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002272@xtec.cat', '$2b$10$v/bjwjyOIZC4CRFxLoO/0.NE/DNfXXZ91vWMj7UkaXPlZhWA/UPmy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola General Prim', '43002272', 'c. Dr.Ferran,42, 43202 Reus', '977312593' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002314@xtec.cat', '$2b$10$YlHDUcIVMheIoEyxJzNVj.B/HrbLUJY.Dd1tNwXgSulz/yUQcqa.W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Arce', '43002314', 'c. Serra Pàmies, 1, 43204 Reus', '977755418' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002338@xtec.cat', '$2b$10$1pMQ7n0J6H1DVF73pz4g0eBMwWyXPTtQ1Qee9WmJL7D2Z1mwuAdSO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Presentació', '43002338', 'c. Selva del Camp, 2, 43201 Reus', '977343550' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002351@xtec.cat', '$2b$10$e8UVR42P0NRnSG73ndiE7uetB18Yhvq7xyP25uxn/PjyzhcymbLzu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Maria Rosa Molas', '43002351', 'c. Mare Molas, 38, 43202 Reus', '977312740' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002375@xtec.cat', '$2b$10$kdjrJov2Se5.9VgT5EetIe.lUsXNJIdSiQco.7zoml.FTU6QEPYAi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Maria Cortina', '43002375', 'c. Gaudí, 20, 43203 Reus', '977315720' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002387@xtec.cat', '$2b$10$f/s18Se1kw/HZPRucL1/suKuG/iQP9NZuWWF3J0IfMc4X9iWBGMom', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Verdaguer', '43002387', 'c. Verdaguer, 12, 43202 Reus', '977326273' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002417@xtec.cat', '$2b$10$ibP/.LBXd5n0TIy5xAWQ.OLz9BDULGy3qCwtuIzFDSPEN4kWXcHEO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '43002417', 'pl. la Pastoreta, 10, 43205 Reus', '977754606' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002429@xtec.cat', '$2b$10$0gyH.aEF3.sbwhvSbmCNZuSZo5uUVjuYdkvEJRoSQmHjhOhJYtEsi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Pare Manyanet', '43002429', 'c. Pare Manyanet, 25, 43205 Reus', '977330832' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002442@xtec.cat', '$2b$10$EyBgPvpQwto6vVO1XmmI/ea1CqKghvAEmqT21r6ndWdBlLLmYpU2G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Josep', '43002442', 'c. Raval Robuster, 30, 43204 Reus', '977755703' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002478@xtec.cat', '$2b$10$/2NC5JLv72DR87UZ/KfWMOc41C0zeB2Z5Y3Ibx06sBQbtRdtsRR9q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Pau', '43002478', 'av. de Marià Fortuny, 86, 43203 Reus', '977343487' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002511@xtec.cat', '$2b$10$L7wdGfCF6J4fntwND.9ErOvNQ9/r7W6PA9lSHcJd7JcU3.0XlPUeu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Puigcerver', '43002511', 'c. Astorga, 13, 43205 Reus', '977756931' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002570@xtec.cat', '$2b$10$bkRXG/utyPmKhZcJxFwrIe6nLZVDgovSOOlyoaFbpLokdiApoTy2e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Gaudí', '43002570', 'ctra. d''Osca, 1 (Barri Gaudí), 43206 Reus', '977313395' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002582@xtec.cat', '$2b$10$hi5Y8ypv4ozys6XCkDFJ8erV9bjIZwlUcT6DKpfXSnlN3SCFbako.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Salvador Vilaseca', '43002582', 'c. Misericòrdia, 12 bis, 43205 Reus', '977756047' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002594@xtec.cat', '$2b$10$wO42Oo2cz12IAlqVO.re7uNwac7m8/spqDUQ.4fdd10Vd4rmxctpW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Baix Camp', '43002594', 'c. Jacint Barrau, 1, 43201 Reus', '977310953' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002661@xtec.cat', '$2b$10$OhHlZW1T0RDyBwyU1o06c.sEzwAqthmtOV1qV4LckdNLlEZx6Qf.m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Agustí - ZER Ebre', '43002661', 'c. Sant Agustí, s/n, 43790 Riba-roja d''Ebre', '977416155' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002752@xtec.cat', '$2b$10$zIpK8I3sSNFkinDnxDvIvuDZ1bfywJtrgSJ5K/e1poWkx3umDG32y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Beat Bonaventura Gran', '43002752', 'c. Dr. Fleming, s/n, 43330 Riudoms', '977850414' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002776@xtec.cat', '$2b$10$VqG/Z2pDNr1oUYVaGKuVTOzF.8gmeXjbVxTQGbDtXoTlnPTvatYau', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Salvador Espriu', '43002776', 'c. de la Font, 3, 43883 Roda de Berà', '977809924' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002831@xtec.cat', '$2b$10$ifXxwsNj9TTulElR7aiJVeHPpwKEHBobEqsgSJX3aVhSscajhoWJi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestre Marcel·lí Domingo', '43002831', 'av. Pare Romanyà, s/n, 43520 Roquetes', '977501139' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002892@xtec.cat', '$2b$10$gFbqsE4RxQm49qC1dJVp5.hC.dcL3pa3uo/0jk2Z/SX8dxeiEnVBW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Carles III', '43002892', 'av. de la Constitució, 64, 43540 La Ràpita', '977740015' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3002958@xtec.cat', '$2b$10$jPCkH0YNE3/suKavwfWKE.1KMben7ql8I9THVhApvndsbGDcVZl.O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sagrada Família', '43002958', 'pl. Carles III, 9, 43540 La Ràpita', '977740162' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003008@xtec.cat', '$2b$10$l6EfwS3FUONUCjXWB3R.Y.I1zm/tIMqXGK..5ji1JwQeyGTl1Hg1u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Jaume Balmes', '43003008', 'c. Escoles, 7, 43570 Santa Bàrbara', '977718029' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003011@xtec.cat', '$2b$10$Th6tSF5A34gXYxmvxiMDO.8BOOf9At6otgWoqN9stWC/N0BqVq7CC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cor de Roure', '43003011', 'pg. Mossèn Segura, s/n, 43420 Santa Coloma de Queralt', '977880533' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003021@xtec.cat', '$2b$10$h/.deu/27ii0Ho.5sH/g6.Y3HIRI9U5FevNw8iI72Kr3vAArufdb2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Santa Coloma de Queralt', '43003021', 'c. Mercè, 17, 43420 Santa Coloma de Queralt', '977880222' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003069@xtec.cat', '$2b$10$AZ5IB1vRf8/B/fNOPtSvW.eVExo9payif46FFcsxLXy9wmbGtMFSy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Salvador Ninot', '43003069', 'c. Targa, 38, 43424 Sarral', '977890108' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003082@xtec.cat', '$2b$10$frS.AWdHzXjYSjA1PL3kFOggoOxjiOCDx0pyuiI//Rbzhc.1Vn8..', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Guillem de Claramunt', '43003082', 'c. Ctra. de Vallmoll, s/n, 43765 La Secuita', '977611421' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003100@xtec.cat', '$2b$10$QcStmFwHfr/p.XToMIMcpuO85od5T2CgfF7Rsayqe3YfDmC6ZmheS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Abel Ferrater', '43003100', 'c. d''Abel Ferrater, s/n, 43470 La Selva del Camp', '977844232' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003112@xtec.cat', '$2b$10$S/IMuxdQkp4rKzARX/SRpO0mkGaOzikwfeie9BjT9lugH7cJ3MT9C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Rafael', '43003112', 'c. Raval de Sant Rafael, 19, 43470 La Selva del Camp', '977844062' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003124@xtec.cat', '$2b$10$lbiB8dajAl//6P07d1I9Ve02ADZv1Hc6arWfImcaSHakGLxUSck.6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sagrat Cor - ZER Conca de Barberà', '43003124', 'ctra. d''Artesa, s/n, 43412 Solivella', '977892361' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003136@xtec.cat', '$2b$10$sYC/x4t88BiDYf80LPIiK.foG3cItiCcbtZ5zswM7w0UE09fJosKC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bonavista', '43003136', 'c. 21, s/n, 43100 Tarragona', '977546289' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003151@xtec.cat', '$2b$10$sqRlJS0ToQJCAgJdQaFlRu7om8.tqng2cGFGqbtGYkWwo.4hByiMS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Joan XXIII', '43003151', 'c. Catorze, s/n, 43100 Tarragona', '977542807' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003185@xtec.cat', '$2b$10$y75BkZLes.akDxbotNV/.OLj05FyFkRRsnPEaiJ0rs7OwnGUk7.N2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Canonja', '43003185', 'c. Carrasco i Formiguera, 8, 43110 La Canonja', '977545627' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003227@xtec.cat', '$2b$10$IO.TnYPQQ.CyL4dyhPUu4.zyXj.dvA4ggvKTUp95bf6t1PGfBJh/.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Salvador', '43003227', 'av. de Sant Salvador, 13, 43130 Tarragona', '977520970' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003306@xtec.cat', '$2b$10$cxwa0rdIWRxec4S3n4/sT.KUgyDVE7k7oHlZVIHoGhndGa4IdehKm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Serrallo', '43003306', 'c. Xavier Montsalvatge, 8, 43004 Tarragona', '977228876' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003321@xtec.cat', '$2b$10$Ao1ELZCkO3Nq8TDP9W1GDu2l3d3S.Nf/jgOt.t6SnGPZvToFr9K0a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Pere i Sant Pau', '43003321', 'Urb. Sant Pere i Sant Pau, s/n, 43007 Tarragona', '977201227' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003410@xtec.cat', '$2b$10$vGws3gV7.WhOFNrXTXzTe.waYS5WLkmSECZhfD9evxNyaP8jCcNP2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Joan Roig', '43003410', 'c. Cristòfor Colom, 9, 43001 Tarragona', '977240223' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003461@xtec.cat', '$2b$10$B612h1zmIyLPjl73Ed1O2upxqT6tnZX3bgU1ATHZeDi2bfnIsYAl.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Tic-Tac', '43003461', 'av. Lluís Companys, 12, 43005 Tarragona', '977214288' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003483@xtec.cat', '$2b$10$6relUfFIfGV3bKXXylevrOazH2qnJw9K7r952MUlljKox.ik5Pv/S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Lestonnac-l''Ensenyança', '43003483', 'c. de l''Arc de Sant Llorenç, 2, 43003 Tarragona', '977232519' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003495@xtec.cat', '$2b$10$k7EvATXj8TmQHUzgbddjcezVH4zx3BjYJ0wNi/3W588PMkpKAEYUm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mare de Déu del Carme', '43003495', 'av. Estanislau Figueres, 31, 43002 Tarragona', '977220105' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003501@xtec.cat', '$2b$10$hv7aDGDmOdvuM0ELUixTcOj/kDiEH.GeMpiC2aiUvJbM4Vx1kopKC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'El Carme', '43003501', 'c. del Mar, 17, 43004 Tarragona', '977212752' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003525@xtec.cat', '$2b$10$AcoGmVqrpCftEG1eJGlNH.bXI/AWbv7Kaj5r.lh1WFWb2ofAW4kJy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Dominiques Tarragona', '43003525', 'c. Rovira i Virgili, 16, 43002 Tarragona', '977216151' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003537@xtec.cat', '$2b$10$5PNhzDDLQwAnzYqjqlAtG.FPhpOVptNKh2uB0l1TagesuICRuGJiC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle', '43003537', 'av. Països Catalans, s/n, 43007 Tarragona', '977218600' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003549@xtec.cat', '$2b$10$QKmAR7CwS6BnYNOC6JZ2h.60i5ovdMbSf.phyDfkxuF3B15Aduxai', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Tarragona', '43003549', 'c. Santa Joaquima de Vedruna, 10, 43002 Tarragona', '977217979' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003550@xtec.cat', '$2b$10$SbhNGE2b2DBrV6EUjGsxTOfd.hiF/lE5C126/rDKWVrPu/1MHrls6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Santa Teresa de Jesús', '43003550', 'rbla. Nova, 79, 43003 Tarragona', '977248800' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003586@xtec.cat', '$2b$10$OkiChS8.6sg96yh69bnnNuoWMdVLkZOdN.xcRax5DMTbv2icJAxJ2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sant Pau Apòstol', '43003586', 'pg. Torroja, 1, 43007 Tarragona', '977224314' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003616@xtec.cat', '$2b$10$vigAqNbvuDTQa6rjXI6ARe1lFyqF8JqyUs5z.CmJCPtkHwp3zKE4m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE San Rafael', '43003616', 'ctra. de Valls, 45, 43007 Tarragona', '977211758' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003631@xtec.cat', '$2b$10$vSAICOyfRPMwytU.jEFHuellbZbABnQn2aJo9Sp7qoNgLMBihLRF6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Estela', '43003631', 'ctra. de Valls, s/n (Zona Educacional), 43007 Tarragona', '977216316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003641@xtec.cat', '$2b$10$Vd08KA0KUcgQNS/QHn2aiOKdqYjCwqMuddQFH9F05ys3smyC4iLYG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Antoni de Martí i Franquès', '43003641', 'c. Enric d''Ossó, 3, 43005 Tarragona', '977240214' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003653@xtec.cat', '$2b$10$EhExGm6VeOR3q.o.8FDW7elPS4xsIhGjPWNQdabn6bGVFYQAvmOt6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Comte de Rius', '43003653', 'ctra. de Valls, s/n (Zona Educacional), 43007 Tarragona', '977241384' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003690@xtec.cat', '$2b$10$accsYpHB0tHl.Cdadr1nQuG5KWBYuEvg.RKGo7rcBYoKlaZQsyMKG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Pràctiques', '43003690', 'ctra. Valls, s/n(Zona Educacional), 43007 Tarragona', '977217711' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003707@xtec.cat', '$2b$10$1zNNEzz8Bludvrjw74Xc7.n2yswu6CyLgu5X1R.rY3XpHv/U4Wpau', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mare Nostrum', '43003707', 'Camí Nou de la Budellera, s/n, 43007 Tarragona', '977290613' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003719@xtec.cat', '$2b$10$9d2cMTpts7.TS878I4kmFOe04OAksyNNqQ0HilG2RN5orhrsWl2Fa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Espallargas', '43003719', 'c. Castellers, 1-3-5-7-9, 43002 Tarragona', '977230751' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003720@xtec.cat', '$2b$10$WZeJTg/Izh2HnAbMbH99.uFdoF0EcIIgsTPzTj3pyAY.MhD0jIkSi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Miracle', '43003720', 'pl. del Cardenal Arce Ochotorena, s/n, 43003 Tarragona', '977239922' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003732@xtec.cat', '$2b$10$VlrSXE3gJByxP0qvhCN/I.GZjTePiFGqEZz4jO9e.ZBlCoA7Sm8jG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Pons d''Icart', '43003732', 'Rambla Vella, 30 B, 43003 Tarragona', '977237927' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003756@xtec.cat', '$2b$10$Sln1.PC/Q18/FJH.zrngg.ZE1D0lwpsyjAI3PWigJA2I7fX5Hnxni', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Torreforta', '43003756', 'c. Tortosa, 49, 43006 Tarragona', '977543408' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003768@xtec.cat', '$2b$10$.PTLsFden3kvGaNmcygzaOCeBtQBgmItnL/j5SADGpIFDi4APwF8q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Àngels', '43003768', 'c. Menorca, 24, 43006 Tarragona', '977596429' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003793@xtec.cat', '$2b$10$2YjrWP8eEET3PdtF.ztBbe3ScvnhJF7YZcYD9Zc2VcWqzr8rty6L6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Salle Torreforta', '43003793', 'c. Sant Benilde, 15, 43006 Tarragona', '977543209' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003801@xtec.cat', '$2b$10$6IzOjCCV15O8YuYMGQ9sTuEy0jgf2l3pMyHgoM8oclnCE0mTAuodK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Pineda - ZER Riu Avall', '43003801', 'c. Calvari, 46, 43511 Tivenys', '977496067' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003835@xtec.cat', '$2b$10$kIue2I/5Q90X6R8vu7hW2eugNLNGwsgUP1ZFDfWrrT/RBETeCtD.W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Riba - ZER Les Vinyes', '43003835', 'c. de les Escoles, 18, 43746 Tivissa', '977417400' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003847@xtec.cat', '$2b$10$GlnqdMME3P43VDKs6X914ecIVCzGIniXXqmPKizdx86hRN8KC0x6u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marcel·lí Domingo', '43003847', 'c. Costa de l''Era, 18, 43746 Tivissa', '977418128' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003884@xtec.cat', '$2b$10$rFbDY7x0.IpTb0JQ/Du3Be.de2n3mfXrchKxPMhVn8asLRLf5ncei', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Antoni Roig', '43003884', 'av. Sant Jordi. núm. 1(ap.correus 142), 43830 Torredembarra', '977640836' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003941@xtec.cat', '$2b$10$OtGMnor6yZUp5Jc/gt7xl.zy0SWWXP8Ek.IWeXlzU4y2KQk9SkDeC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Sant Jordi', '43003941', 'av. Santa Teresa, 4-8, 43590 Tortosa', '977500817' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003951@xtec.cat', '$2b$10$shgNj/Y36j9h4KX.d8D.reKbMEEfyRsm9zeJYKWB9Ozt3GX9iCXHq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bítem - ZER Riu Avall', '43003951', 'c. d''en Gasol, 62, 43510 Tortosa', '977596538' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003975@xtec.cat', '$2b$10$2waHhWxzhRvnpw/Pako5O.43ZkgWfx8rBGEoFsPd8gRupvuFDA6Ve', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Àngel', '43003975', 'c. Vint-i-sis, 8, 43894 Camarles', '977470301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3003987@xtec.cat', '$2b$10$N.CSukNn4GDaM5qccGyV0e2uhAMQNYXBF9mbOTr6n3k2oy0FBPK.6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Port rodó - ZER Mestral', '43003987', 'av. Don Álvaro, 166, 43897 Tortosa', '977597010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004013@xtec.cat', '$2b$10$FnPICmxwhRQ5Ka3IpCGKUOoDtcJ2IdGjgAzGgZmfyqlmOhAOJFNZq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Miquel', '43004013', 'c. Sant Miquel, 100, 43580 Deltebre', '977480297' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004037@xtec.cat', '$2b$10$EMEV.FPypqlSU5LnWSar8O/X1q7e.cy5wV6uYJ60apilzi/0gDaBS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Maria García i Cabanes', '43004037', 'c. Francisco Javier Sánchez Latre, 1, 43896 L''Aldea', '977450301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004050@xtec.cat', '$2b$10$NbBTBROczbVRY1A512afP.4KAqUaEUGOUGFY0cR3dmBtk26KRD6jO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola 21 d''Abril', '43004050', 'c. Narcís Monturiol, s/n, 43896 L''Aldea', '977452010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004074@xtec.cat', '$2b$10$NcBVw1nq3qxNzrrGf6PjkuWFhMUGuGY34VIM30aJj7nrFUA1W/fvC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Assumpció', '43004074', 'c. La Pau, 17, 43580 Deltebre', '977489593' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004116@xtec.cat', '$2b$10$bQWFjG52eP0.B/ixmy3sWuiPWY49zcJMFKR0EJYAj76iA5Z17h5Ci', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola del Lligallo del Gànguil - ZER Mestral', '43004116', 'av. Conseller Navarro, 16, 43894 Camarles', '977470484' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004189@xtec.cat', '$2b$10$l9/pDZlQPI158oOC44Aewu7xoZoo10AjRcrs3AVdkpv2Mr8xK29FS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jaume', '43004189', 'av. de Mallorca, 56, 43877 Sant Jaume d''Enveja', '977468402' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004232@xtec.cat', '$2b$10$FaMDQxwmIortsqEeQxTmquox.Awg.3XDoVJJE0ujB4U0.296A84B.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Mercè', '43004232', 'c. Providència, 11-15, 43500 Tortosa', '977441566' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004256@xtec.cat', '$2b$10$3BNHpGCUxsbX7wmi1sZClucVADfx5OzSrHLNErRGm/N8SnnOi22Ey', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ferreries', '43004256', 'av. Marcel·lí Domingo, 28, 43500 Tortosa', '977503299' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004268@xtec.cat', '$2b$10$trQbPrPNrdhu5quw8CnBFehAEHX7ITtfZ2.1mkUmX2jqPGEJVdizu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Remolins', '43004268', 'c. Sta. Anna, s/n, 43500 Tortosa', '977442158' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004311@xtec.cat', '$2b$10$02U9yYUuL7q96AE5vSo3reZIibFTHk.fxqgSRSrQ2ADINyIcWVniK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Nuestra Señora de la Consolación', '43004311', 'c. Argentina, 32-34, 43500 Tortosa', '977440326' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004372@xtec.cat', '$2b$10$8WM6eHR75aUUyNeWj8GnuO4BKmBWkz7zwlFmBMy8n.aANECTWwSle', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Teresià', '43004372', 'c. Rosselló, 31-37, 43500 Tortosa', '977440444' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004402@xtec.cat', '$2b$10$q4LZEYPhvuUfNh4ikDbRPuojvmlvKcTHvreskbi3PYAKjmF3JyZU.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sagrada Família', '43004402', 'c. Pujada al Seminari, 16, 43500 Tortosa', '977440888' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004438@xtec.cat', '$2b$10$cfmPsGiUIfIqE1lGiY8rseUYwKDGSCikAX3tNKizDRhAQzFIVKCAe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Dertosa', '43004438', 'av. Estadi, 14, 43500 Tortosa', '977501310' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004441@xtec.cat', '$2b$10$1zoW4jsdWFUwFmg/AwfRme/luZIM9jPmrrP410uPNeHP.vAFdsE2i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de l''Ebre', '43004441', 'av. Colom, 34-42, 43500 Tortosa', '977500949' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004463@xtec.cat', '$2b$10$q0u/YdcjkBT2CBQSVq7tt.zez6JdRNZcT.10qkAWnPl2jwAIXF8mi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramón y Cajal', '43004463', 'av. de les Escoles, 4, 43550 Ulldecona', '977720066' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004487@xtec.cat', '$2b$10$LBAWEH8YnnxUE7uDV2e78esSZdGwICqTMEHNYgC8UQ.GQQ1uEZ4.6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montsant - ZER Montsant-Serra de Prades', '43004487', 'c. Verge de Montserrat, 2, 43363 Ulldemolins', '977561680' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004505@xtec.cat', '$2b$10$hLha3ziqI9lnGLWKDufVU.z/40adb5wzZcuNEzkD2wolIzGKzE54m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Roser', '43004505', 'c. Major, 1, 43144 Vallmoll', '977637215' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004517@xtec.cat', '$2b$10$N.kEp5I5J9V7l3nW.6NpfOEQ2s5IDBOe5axGyHTFfYyU2OR4ok5qO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rocabruna - ZER El Francolí', '43004517', 'c. Rosari, 25, baixos, 43491 Valls', '977606859' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004529@xtec.cat', '$2b$10$GHBJ.H.vDbIKcpv.7i/TW.neSw9ykcYOaw2uT8/EjBBPwF0tJprGC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu de la Candela', '43004529', 'pg. dels Caputxins, 16, 43800 Valls', '977608429' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004530@xtec.cat', '$2b$10$4.nmfHH9unQu3uvSzpWvpeMrgMmDnZMR0CK5ZIyN61nUD1.3YPhS6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pública Baltis de Valls', '43004530', 'c. Creu de Cames, s/n, 43800 Valls', '977600044' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004554@xtec.cat', '$2b$10$oFPUc1EX8dKzsBna0WWGMOAK3jp2VprrSIIQXuAm7kTPWNIOJF0nm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cor de Maria', '43004554', 'c. Cor de Maria, 2, 43800 Valls', '977601172' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004581@xtec.cat', '$2b$10$NDsHrPDNgg1dtI51P0GYxuZtecZSDztKFCpuPxWVGDy76pj0nxE3C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Claret', '43004581', 'pl. de la Creu, 1, 43800 Valls', '977600421' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004591@xtec.cat', '$2b$10$ml2kTHnA8qXQHCjkuBQX1OJNsKEGMGF0qip7MflTgkp2qGP1yKZd2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Valls', '43004591', 'c. Santa Joaquima de Vedruna, 2, 43800 Valls', '977600452' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004608@xtec.cat', '$2b$10$EfAA0llDcmsnFjuvvzs89uR7joCazi4gz6TJQFEn6cKZOewUdLR52', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Narcís Oller', '43004608', 'c. Francesc Gumà Ferran, 1, 43800 Valls', '977601094' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004611@xtec.cat', '$2b$10$IBgERYWH2qw957IrhqNM6eS77HufjF4Rlz4eCN3Oauq6odr3FEO32', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Jaume Huguet', '43004611', 'c. Creu de Cames, s/n, 43800 Valls', '977600938' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004633@xtec.cat', '$2b$10$iDU6K9mcqLiwBHoq0ElaEO7KgmZU4/K8qnTf9FSz6aa/xPX64Tawq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Eugeni d''Ors', '43004633', 'pl. de l''Estació, 2, 43800 Valls', '977605405' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004657@xtec.cat', '$2b$10$pBkqDBiiSVB00MvL9PSKhObbX4KQQRR0Xk48GdtBvy7AxAi0FbQmm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestral', '43004657', 'c. Vandellòs, 10, 43890 Vandellòs i l''Hospitalet de l''Infant', '977823190' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004700@xtec.cat', '$2b$10$z/hX4USDO1hYG6iifIVgMesoG/RJoo6YKC1iqZSnosZC1PRVzuHc2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Valdelors', '43004700', 'c. Afores, s/n, 43890 Vandellòs i l''Hospitalet de l''Infant', '977824014' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004748@xtec.cat', '$2b$10$3dWSwVwngDBv7u1ExI0hIuXb5vbewZ3NqNMsP3T.7yzoni.3F9/OW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àngel Guimerà', '43004748', 'c. Apel.les Fenosa, 9, 43700 El Vendrell', '977660860' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004761@xtec.cat', '$2b$10$ZeGdU8tFWhj641049.J4ZOO5MLqVWDkAHKrgVoIEFhXekJMpSyIFC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Sagrat Cor', '43004761', 'ctra. de Valls, 26, 43700 El Vendrell', '977660173' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004797@xtec.cat', '$2b$10$WsJa5ogmzRB0Xj74NspvFOY3QMrqFgu/u5L0EHCuRlo3X1FAsIVva', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Baix Penedès', '43004797', 'av. Salvador Palau Rabassó, 1, 43700 El Vendrell', '977667082' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004803@xtec.cat', '$2b$10$49oR.6VUFSwKwOpziDlPbe9Kh.CCiXJBvkKE1PgXV0pMwe1XpNSS2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Andreu Nin', '43004803', 'av. Salvador Palau Rabassó, 18, 43700 El Vendrell', '877056921' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004815@xtec.cat', '$2b$10$.0KY043dCVwGQKIaTxS6GueuG8IFwPAWJCGH9skHTolNlwUL7xZMK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pau Casals', '43004815', 'av. S. Palau Rabassó, 7, 43700 El Vendrell', '977661358' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004864@xtec.cat', '$2b$10$xvFzv93A95sP6vfDwqR5guC41/kWxopGCZJfbKl25Xswjun4qrc4S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pere Virgili', '43004864', 'pl. de la Pau, s/n, 43141 Vilallonga del Camp', '977840353' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004888@xtec.cat', '$2b$10$vXW8Ej5nVWAVungbUKC/juM1Lt7FI8KsIOOvuZ0ND20M.aMWrdPS.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Font de l''Arc - ZER Baix Camp Sud', '43004888', 'c. Escoles, 1, 43311 Vilanova d''Escornalbou', '977837670' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004921@xtec.cat', '$2b$10$durb3AQrVMQJxFy3fv1JhO1JybwkIRFhHP/zjdpMb8npMScU7L07O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bernardí Tolrà', '43004921', 'c. Afores, s/n, 43814 Vila-rodona', '977638038' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004931@xtec.cat', '$2b$10$PagC3wHkedDp/PeZIdfBtOI6xXXsA9cONgK6.gOK.EzjURk3yW6lC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Maria del Mar', '43004931', 'c. Juan Manuel Muñoz Rodriguez, 5, 43840 Salou', '977382302' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004967@xtec.cat', '$2b$10$OZwiRS8BLCHlfGc9gT.2PepcSS2mKIliuOa.TbSsvQFLfZ6PPRz8S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Elisabeth', '43004967', 'c. Miquel Martí i Pol, 1, 43840 Salou', '977383851' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3004979@xtec.cat', '$2b$10$kQhrmnZfUxzmReWyi7k2ZuvTTc/.BQKQrrqCt9sijfNk7P329YmyC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Torroja i Miret', '43004979', 'c. Tarragona, 9, 43480 Vila-seca', '977390616' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005005@xtec.cat', '$2b$10$yK/k46Sckc3j55VNM.sfE.dmguACWgmOL4FOBmMtCL3YPJYQ1OA1q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Bernat Calvó', '43005005', 'c. Requet de Fèlix, 22, 43480 Vila-seca', '977391921' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005017@xtec.cat', '$2b$10$CvZ5RPJ7MHfWT150cVTOH.wFGw2Wtx8TeQ9aim3TS3UjgxcKezMQ.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola del Montgoi - ZER Poblet', '43005017', 'c. de les Escoles, s/n, 43490 Vilaverd', '977876021' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005081@xtec.cat', '$2b$10$SVna6GldCUJbFUQbPAUaVOHysE.xAVwIAqbhxPZeLXfccDduBqslW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu dels Torrents - ZER Poblet', '43005081', 'pg. Mestre Garcia, 1, 43430 Vimbodí i Poblet', '977878244' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005108@xtec.cat', '$2b$10$RFkyWOLukmooAgFYBGJ0EupWCCS3csPRgbW4Pn020BX3ioZPjAWwG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Eres - ZER Ribera d''Ebre Nord', '43005108', 'c. Torre, s/n, 43792 Vinebre', '977405574' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005121@xtec.cat', '$2b$10$VrmRR6hM3hC45XvZMsPKu.nMequwEvrrR1PjIUeIfRqHyJY2ln8H2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Caterina', '43005121', 'Camí del Montroig, 4, 43391 Vinyols i els Arcs', '977768480' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005133@xtec.cat', '$2b$10$3C4kxyicomQNw6B9NSrJUeU5h1pNHeOBN5LWBOoQdb8zr3ptizq0i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Priorat', '43005133', 'av. Verge del Priorat, s/n, 43711 Banyeres del Penedès', '977670743' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005145@xtec.cat', '$2b$10$EFSTmo9wcrSZLg8rutFLzuvckVgUJfbvH55frhjDfTieEtttFk/m.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Ametllers', '43005145', 'pg. de l''Estació, 2, 43761 La Pobla de Montornès', '977648259' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005157@xtec.cat', '$2b$10$z/ybBQXfKIgk6qcbfTMl4.5563cxcuJB7O0ibtA1rbLEcjedj07C2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montoliu', '43005157', 'c. Sant Jordi, s/n, 43762 La Riera de Gaià', '977655539' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005169@xtec.cat', '$2b$10$TLxKNkoXPcmuXHwK4kuSSOSGkzqkIl03Eq.s58uUn8N9dyDoIy.Le', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pau Delclòs', '43005169', 'c. Méndez Núñez, 14, 43004 Tarragona', '977234316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005170@xtec.cat', '$2b$10$6gUvr800/gVb5068i4OCe.xH.7UoaGXfvYE1GDIMb7oSYZRM4ve4e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Floresta', '43005170', 'Urbanització la Floresta, 43006 Tarragona', '977547807' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005182@xtec.cat', '$2b$10$plzNC4lGfS5EBgcizAp6guuUVdlw2rBe2r2we4w3aQlzHkn0.6uCS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Mercè Pla', '43005182', 'ctra. de l''Aldea a Tortosa, 135, 43500 Tortosa', '977597220' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005194@xtec.cat', '$2b$10$Se6R2F1Q0vLzus3FMI7oheNL19ygyccLRbUS/Qw4MsIdZpuN5gFs6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mediterrani', '43005194', 'c. Girona, 2, 43895 L''Ampolla', '977460151' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005297@xtec.cat', '$2b$10$vNx4Vfb/AgO2GphhpEGBC.JKKB1ciPij0zdpfQMomp4kgEUG6PkNa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Perucho', '43005297', 'c. Francesc Macià, 1, 43716 Albinyana', '977180003' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005303@xtec.cat', '$2b$10$VqtjzIayfRYI.DCziaHB8.LZIpLf900Rlf.Bs5AFXGwYS.WhZyDVS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Jordi - ZER Riu i Serra', '43005303', 'c. Sant Jordi,1, 43591 Aldover', '977473681' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005315@xtec.cat', '$2b$10$1jyepb/WwbpOQlfsF9OLIe6z61r.FZuIuvkOPL7MCNBovSs2PyKJa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola d''Alfara de Carles - ZER Mont Caro', '43005315', 'c. Afores, s/n, 43528 Alfara de Carles', '977455062' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005327@xtec.cat', '$2b$10$NGxbBQ2m3gOObYSB8wcrR.8RtiBOW.ErDAvUb1nGZnbn.hwKDNCkS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Ramon Sugrañes', '43005327', 'c. de Reus, s/n, 43393 Almoster', '977762020' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005339@xtec.cat', '$2b$10$ZJ7d5jkFVMN4MeVcSHPAu.HFSBaxykSc/DzbTJoFxDKv/DTDEq2GW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montsant - ZER Montsant', '43005339', 'c. Escoles, 1, 43372 La Bisbal de Falset', '977819243' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005340@xtec.cat', '$2b$10$jdKcLoQ7iIF8144pgeL3tO7fjFbeqi0BYj/CntzWFDEr1RNHJ1GAW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Anna', '43005340', 'Camí de la Mineta, 1, 43392 Castellvell del Camp', '977855802' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005364@xtec.cat', '$2b$10$DTli9BzplK4k4r5LfvFEwejHu9Q.wNHwQ80KNkv0r2egTk2mmgSTK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Eres', '43005364', 'c. Onze de Setembre, s/n, 43838 Creixell', '977800597' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005376@xtec.cat', '$2b$10$aaBYsog5CqweQmz1Oe3XOu3edbBBrWzbAdxmxhrdRl89OBJ8Rj.ku', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Puigmarí - ZER Baix Camp Sud', '43005376', 'c. Enseula, 7, 43773 Duesaigües', '977834417' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005388@xtec.cat', '$2b$10$yATiRKLGgMSDvyb8ZshPyOFpsRlZIZ/Bx0Hsyf.G4LgEMz2yiv756', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestre Josep Roncero i Pallarès - ZER Montsià', '43005388', 'c. Escoles, s/n, 43558 Freginals', '977572700' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005391@xtec.cat', '$2b$10$gBgGg3HPXq5dinKDBV09Vutc68yQfNzCSdxUxczWnVsID3.UT2.5C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Llorenç - ZER Montsià', '43005391', 'av. Catalunya, 2-4, 43515 La Galera', '977719368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005406@xtec.cat', '$2b$10$ao8G5tzv9tvpv0e2eFtXuO6Jlt/uOjxuK09KeOv0/peOFuQZwnv0W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Verger - ZER Ribera d''Ebre Nord', '43005406', 'c. Afores, s/n, 43749 Garcia', '977402028' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005418@xtec.cat', '$2b$10$ctPwNrqS.5HZvRzoB439HuDh6Dtg5NHn.kAMy8nAjfFt26x4vriJy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Salvador - ZER Montsià', '43005418', 'c. del Molí, 42, 43516 Godall', '977738054' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005421@xtec.cat', '$2b$10$ISb6kKaMrmHUG4csCSzonOkuo.E6w.5VYfMG.8X.R0XXlgpGwI/xe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Berenguer de Montoliu - ZER Els Ceps', '43005421', 'c. Major, 48, 43718 Masllorenç', '977628347' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005443@xtec.cat', '$2b$10$ehjjc6pztIhh80CPHokwY.xM6pN99q9ojXXObPyqWKzfBFvL/KkOi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Roc Llop i Convalia - ZER Benissanet-Miravet', '43005443', 'c. La Creu, s/n, 43747 Miravet', '977407400' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005455@xtec.cat', '$2b$10$rd6SDsLaJG7bjT.vDXkS6uj0osNGPYOGWrP17aE.vNm2WPj04cAT2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Galena - ZER L''Aglà', '43005455', 'ctra. al Masroig, s/n, 43736 El Molar', '977825472' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005467@xtec.cat', '$2b$10$icQTKysEgol/7re2EMRsme2KveSUtOFCqKWCodXaRG.pufpEYb99q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Codinetes', '43005467', 'Raval dels Hostalets, s/n, 43763 La Nou de Gaià', '977655390' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005479@xtec.cat', '$2b$10$sNUn.nH3SehUgHnmXmne2OE5XRBlEzfV5yMpAEK.Du2atJGXcGSCC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola 1 d''Abril - ZER Ebre', '43005479', 'c. Major, s/n, 43370 La Palma d''Ebre', '977819074' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005480@xtec.cat', '$2b$10$ve9DnchM3JaDvVDkt1cn/.ZPTPKnYE83DYNBgT/y8MGNXZWZQoelK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Lledó', '43005480', 'av. Guillem de Montoliu, s/n, 43140 La Pobla de Mafumet', '977840851' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005492@xtec.cat', '$2b$10$iMK9LVsqkUIO/FI.ryBJJe59QHwxNlS0CK.g9XNuBIXGBPh00dT7q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Magdalena - ZER La Parellada', '43005492', 'c. Darrera Vila, s/n, 43817 El Pont d''Armentera', '977638065' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005509@xtec.cat', '$2b$10$9SV3RDeZJS840dCVvY5Z9efYQyT9Q0nCkmsXJVSjd0DQyvAjtH7k2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rossend Giol - ZER Baix Priorat', '43005509', 'c. Rossend Giol, s/n, 43739 Porrera', '977828227' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005510@xtec.cat', '$2b$10$3WkpjC/RDgP60N6yXLm8Xuz49/qmupZk.jk8Zk4NlADYx6ucaP9B6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Serra de Prades - ZER Montsant-Serra de Prades', '43005510', 'c. Pau Picasso, s/n, 43364 Prades', '977868011' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005522@xtec.cat', '$2b$10$MoZjJayXf2iVkAP1Hj4l9u1lVUFNMTWBzGNpaQyS552aeLnclNWky', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Santa Marina', '43005522', 'c. Onze de setembre, s/n, 43320 Pratdip', '977566033' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005534@xtec.cat', '$2b$10$UgT10YG2yvTH8whrvS8YXuij2eSx4VtPP/CbDI2AxK/brVqd5Es/a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Eres de Rasquera - ZER La Font de l''Aiguadí', '43005534', 'c. Júlia Pellisa, s/n, 43513 Rasquera', '977409404' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005546@xtec.cat', '$2b$10$gj8F4xeliLG6euBreQHIpOGQFX3JfLJa0pOALVbvip6QA.A70Naj6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de La Riba - ZER El Francolí', '43005546', 'c. Pages, s/n, 43450 La Riba', '977876106' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005558@xtec.cat', '$2b$10$fL7ZQNSEcHUW0vSv5U2EEOAEQEqKyr/mYoHgERNn220DBD5yVJ5PW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Mateu', '43005558', 'c. Nou, 1, 43771 Riudecanyes', '977834372' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005561@xtec.cat', '$2b$10$zrtEQ.nEIriWKvh1UPAFouGed1FdW/TxN8scDQbBbiS6vsONrCfG.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mare de Déu del Roser', '43005561', 'av. d''Alforja, s/n, 43390 Riudecols', '977560023' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005571@xtec.cat', '$2b$10$BsglXwLdSFFmRkMS2xn9PeCbdPbsfSNis8rJQ6lVaFzndkwZKdhIy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Comes', '43005571', 'c. Prat de la Riba, 3, 43812 Rodonyà', '977628352' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005583@xtec.cat', '$2b$10$EFcKFUVvKbqaPos9XnCZjO3LPO10iIcl7CZ2u6HfM6HqPfrzhfbzi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Quatre Vents', '43005583', 'Carretera, s/n, 43713 Sant Jaume dels Domenys', '977677682' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005595@xtec.cat', '$2b$10$1o0omJcxf0QB0pVBUvUMDeMie7aYzbe3ftjii1ZjHdJhIHOAQYnLi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Parellada', '43005595', 'c. Josep M. Mas, s/n, 43710 Santa Oliva', '977679536' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005601@xtec.cat', '$2b$10$NgFYer5TNMB0nTRGp72TLOHDOMhGez7kDHYiok6cR/ZZ6PW0v5zUe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Tormo - ZER Ribera d''Ebre Nord', '43005601', 'c. Era, s/n, 43792 La Torre de l''Espanyol', '977405425' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005613@xtec.cat', '$2b$10$OWPDjI1u50Suq0H.wUBn3Os9UwGcunxSrcNyxItMhpS5is7raR/Ym', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Setze de Febrer - ZER Mediterrània', '43005613', 'c. Major, 219, 43879 Sant Jaume d''Enveja', '977479064' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005625@xtec.cat', '$2b$10$xv7jmesBrH/Qub96a28rGuUpdpkImWQyrkfDD//.zQiStRj/1OYgS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Antoni Abat - ZER Mont Caro', '43005625', 'c. Rioja, 9, 43527 Tortosa', '977474101' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005637@xtec.cat', '$2b$10$79KO8ZSe1E5vHoCONu3n4emCKwKViAk5/k7b63qyYW.t0AIAPYRa.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Manuel de Castellví i Feliu - ZER Atzavara', '43005637', 'c. Castellví, 14, 43886 Vilabella', '977620302' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005650@xtec.cat', '$2b$10$XiR.yyLHOb3llNfcV3mjbeFsDGWqHHyQTb7QyivfQBXdjVPlBYUpC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Diví Mestre - ZER Terra Alta Nord', '43005650', 'ctra. de Gandesa, s/n, 43782 Vilalba dels Arcs', '977438306' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005662@xtec.cat', '$2b$10$vGHZQ5VnRK60J5mwB.DtO.Shrm4N2s68Q6N9uKmAYaRIeyK4QZu/S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Nin', '43005662', 'c. Raval de cal Toni, 9, 43885 Salomó', '977629085' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005674@xtec.cat', '$2b$10$zND0l4hL47PHPB7jBs54GOnq/gWkUqXSdqCobcWETB3YXuIoGwJa2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Raval de Cristo - ZER Mont Caro', '43005674', 'c. Tarragona, s/n, 43520 Roquetes', '977503008' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005686@xtec.cat', '$2b$10$Ykpf53yTwVBh5U06pclz9e6OJoP04IqVhy/DNQjAYCu8DcVgTY2.O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Riu Clar', '43005686', 'Urbanització Riu Clar, s/n, 43006 Tarragona', '977548109' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005698@xtec.cat', '$2b$10$kWfaiDtwAovXid5l9AMUguotPW/Qu6zBcNlp4Ab/lBk9cg3y2ZbNu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marjal - ZER Mediterrània', '43005698', 'c. Hernán Cortés, s/n, 43569 Alcanar', '977737377' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005704@xtec.cat', '$2b$10$JeLCetSohtmIuyMHKXBBQedS/ZwF8K07pq4kCGQE8NWkP6LL3/xv.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Francesc Vidal i Barraquer', '43005704', 'av. Lluís Companys, 1, 43005 Tarragona', '977212836' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005731@xtec.cat', '$2b$10$aroQPfEXDb6ZnH0RoKJPs.FIs4atCT3EKK3rxInx0ayTrHnMRfFdu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Muntanyeta', '43005731', 'c.Muntanyeta S.Pere/ctra. Pallaresos Km1, 43007 Tarragona', '977217604' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005741@xtec.cat', '$2b$10$NOO5rF9qTnQu8BKCyO5sPO9BQXRhW3Vd.w/D5.tY0e1Iy1AMuezlq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Ntra. Sra. del Mar', '43005741', 'Autovia de Bellissens, parc.12 políg.64, 43204 Reus', '977757965' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005753@xtec.cat', '$2b$10$lIM.1Yh0LGlPEeuAi17xE.IT5OpHzQxNMn1a53XegSdsqAwVC0qwq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Doctor Alberich i Casas', '43005753', 'c. Cèlia Artiga, s/n, 43205 Reus', '977332362' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005765@xtec.cat', '$2b$10$zs8D4kVcXL0nBaJYXQaZcuvBTLUgd2fcE5HPOhytR71CVlY9ZSLGy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Eduard Toda i Güell', '43005765', 'c. Montserrat Roig, 2, 43204 Reus', '977751778' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005820@xtec.cat', '$2b$10$JjqVZ4.J.ypuGXg4V8OYhuCB10mS.I2S.7LT7fc87wjjzn7.83DF2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institució Tarragona', '43005820', 'ctra. de Tarragona- Reus, s/n, 43206 Reus', '977547033' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005893@xtec.cat', '$2b$10$dwCnpEniHvLSDgcudvUrkeqjAQ1cxd11BYaazjDAuWxYkB.uKrp3y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Centcelles', '43005893', 'c. Joan Maragall, s/n, 43120 Constantí', '977520504' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005901@xtec.cat', '$2b$10$St9dIQ.oPTXnAM6d.zDvVuINBksY4bdB4VHz.P4jQniJypkDFQKEy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Rebull', '43005901', 'c. Onze de Setembre, 10, 43203 Reus', '977316812' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005911@xtec.cat', '$2b$10$iXxXs3EORsHQaWjZNGmXU.u0DjKLzjmve1X9RuNm0eMbJAI/N0I5W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Campclar', '43005911', 'Urbanització Verge del Pilar, s/n, 43006 Tarragona', '977548280' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005935@xtec.cat', '$2b$10$1FmbWgQWXPhCpOp7FrtqSOFy4zF0GRaADjowcJNBZDdur9PtnLvIK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Bernat Calvó', '43005935', 'c. dels Velers, 83, 43205 Reus', '977754381' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005947@xtec.cat', '$2b$10$8dF.ZfUyIp9iG8DsjMs.ru2x5BS2EzOTrv8RBobRufBtyvqhjDcZi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cal·lípolis', '43005947', 'c. Alfredo Kraus, 22, 43481 Vila-seca', '977371711' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005959@xtec.cat', '$2b$10$pYuQ8hKvpX6Q50jMi6X1j.Iuq/BD5N18kapiS4FT17xlgsJEUAL4q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cèsar August', '43005959', 'c. Joan Bta. Plana, 9, 43005 Tarragona', '977230352' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3005972@xtec.cat', '$2b$10$xVDswfeOZd8F0pc0RlX17ebMWpIBqbHtnN1VZAVPKFPdmSUuaNsKO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ramon Barbat i Miracle', '43005972', 'av. de l''Alcalde Pere Molas, s/n, 43480 Vila-seca', '977391379' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006046@xtec.cat', '$2b$10$3jJhWgjHoU9RyXVLpNWhjexX9EqAqAP4xw.ZWafB6M5l7ZnmwLQjS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Divina Pastora - ZER Mestral', '43006046', 'c. Santa Tecla, 8-10, 43517 Tortosa', '977474435' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006061@xtec.cat', '$2b$10$9g6s/5vZYBzCqFuJD4.D8.l3cBnEY9sPSpogZ3X31RaRDoCjt0SvG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rubió i Ors', '43006061', 'pl. de l''Abat Oliva, 33, 43204 Reus', '977755843' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006095@xtec.cat', '$2b$10$/8sVJXDKxlZ/.WcnaYLkWuZ1E.3uwRJxXBCl3cip9YbZgaGC1x1om', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Jerónimo de Moragas', '43006095', 'av. de la Diputació, s/n, 43740 Móra d''Ebre', '977400782' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006101@xtec.cat', '$2b$10$BiPDA09oiQHhJvGiShuN/uvoedhVq3kADyyePXLtX1bBQq5KGc5hq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Montsià', '43006101', 'c. Madrid, 35-49, 43870 Amposta', '977700043' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006125@xtec.cat', '$2b$10$EwL03KD/ILK/jLphClu3b.yK6yz87Lec7wmgBG4E17gXzNppYA9Qu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Campclar', '43006125', 'Rambla de Ponent, 66, 43006 Tarragona', '977541007' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006162@xtec.cat', '$2b$10$maoOPF0wjcQFULjs3JaQe.Gj1WrbUKmqRILU1FIa6duPBNTs3EH.e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Solc', '43006162', 'c. Apodaca, 3, 43004 Tarragona', '977554375' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006174@xtec.cat', '$2b$10$xGXrbSgQ.CPfbnAxg9DdhuaFc4mPUb4A95GZpQSl1nxN62I39yWZK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Les Moreres', '43006174', 'camí Mas d''en Parés, 1, 43815 Aiguamúrcia', '977639163' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006186@xtec.cat', '$2b$10$xmPR.UiLAgXT1bR0dPy3iObAZvlUMN.EpATyRpWNzKXwZ4DxsFz9i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Soriano Montagut', '43006186', 'c. Balada, s/n, 43870 Amposta', '977702014' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006216@xtec.cat', '$2b$10$1I7LeSQ5Y/kvuELfAenyJOrWAx8NBgg9YxxOJ1hT7k0zCdLA.EVzC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cèlia Artiga', '43006216', 'c. Mont-caro, 2-6, 43206 Reus', '977317614' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006228@xtec.cat', '$2b$10$c9Haj9a8tao2Adu5eCgM/uKA97U6sFV7deSz/5QGKqcZwlSu7LZRy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Rosa Sensat', '43006228', 'c. Mas Pellicer, 63-Barri S. Josep Obrer, 43204 Reus', '977771672' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006241@xtec.cat', '$2b$10$y4sztfdjHKTVzq/JJzM1Z..Kkd8yHeBZagSWODE1DCv5CpYdek.QS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Plana', '43006241', 'Camí Mas de la Cuca, s/n, 43480 Vila-seca', '977391819' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006253@xtec.cat', '$2b$10$BiarVYN87O7lOAtpw0SFjeNPd/MVv5GxzgZPhpnuapEbHiLjoZRYC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EASD de Tarragona', '43006253', 'ctra.de Valls, s/n,Zona Educacional, 43007 Tarragona', '977211253' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006265@xtec.cat', '$2b$10$B0AGLRiBoxEXHHZXQJLIeePaRwmqTT4kv4/3JklH9xTVpjTsNhgaO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Artemis', '43006265', 'ptge. Cobos, 5-7, 43001 Tarragona', '977218626' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006277@xtec.cat', '$2b$10$wfsGlZWzML11mwH/i6rob.ybU51ypDgV5S0j0Cj7VxtPv.d9VLC42', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música de Tarragona', '43006277', 'c. Cavallers, 10, 43003 Tarragona', '977235830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006289@xtec.cat', '$2b$10$w1byLpSTTgBSyYjOAghB4.kzScGAVBg6oX8iu5s1xAC2oDTQo4UxC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música de Vila-seca', '43006289', 'av. de la Generalitat, 27, 43480 Vila-seca', '977392368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006290@xtec.cat', '$2b$10$R.QbeRWXjugoOMDo/qbcXuerc4/Ni78W59k.dHJIIDFbmI3iqP1YW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc.Fam.Agr.Campjoliu', '43006290', 'ctra. 340 km. 1202, 43720 L''Arboç', '977670102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006332@xtec.cat', '$2b$10$CmvoZPKEqMZOoCRmuAxjPOb04saKwrdEnXY30NuFF2ZqipDLY6pUi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mestral', '43006332', 'c. Santiago Rusiñol, s/n, 43480 Vila-seca', '977391820' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006356@xtec.cat', '$2b$10$3LKLn8o3S0pt2rHZVaK0tOCFq6FMikTndOesKOsMzD2vwKoVCBA6.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marinada', '43006356', 'c. Molí d''Avall, 13, 43850 Cambrils', '977793702' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006371@xtec.cat', '$2b$10$qWpwakiNtQnHmd6JkFOHhuz1IuoadSqpq39oUNoH9xk6nli5b.wP2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Roc - ZER Conca de Barberà', '43006371', 'av. de la Conca, 29 A bis, 43426 Rocafort de Queralt', '977898113' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006393@xtec.cat', '$2b$10$ZoUs4hSEhzPJpyvCChDyPeyrcGhcRTQiNny4W2Ay4L/1Vu.uPUm9C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Europa', '43006393', 'pl. de la Segregació, 2, 43840 Salou', '977384996' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006459@xtec.cat', '$2b$10$ftglNz1ifPmtU3GK9pOQ7O7/RKz96wU8GNAxI0TlZsSeMe5V.1lLC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada L''Avet', '43006459', 'c. Domènec Soberano, 6-8, 43203 Reus', '977319051' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006496@xtec.cat', '$2b$10$JtsvYeY0wrGiy7TXcfTFweudURRo4yYE1oYZBvvYRrPNtPWXtkaju', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Manuel Sales i Ferré', '43006496', 'av. de les Escoles, 6, 43550 Ulldecona', '977573365' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006541@xtec.cat', '$2b$10$t9ZLQN4y2LFz2pkkyxZzVewjVLHL.luWSMaz4ImUiYCfyqZ08.V5C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Teresa Miquel i Pàmies', '43006541', 'pg. Misericòrdia, 9 A, 43202 Reus', '977321766' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006551@xtec.cat', '$2b$10$WKee7jE/cJb1tcoiFzd9N.fngbDnSmuSqxja3kAy2Tl/IfaHA5iey', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Horta Vella', '43006551', 'c. de Mendez Núñez, s/n, 43540 La Ràpita', '977741771' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006563@xtec.cat', '$2b$10$1kcLjS3ZCuV/HZnCRgBD3OX3nOIZCMVzDdT1QfXBgxqHXOEU07Q7O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marcel·lí Domingo', '43006563', 'ctra. Pallaresos (Ub. S. Pere i S.Pau), 43007 Tarragona', '977225465' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006575@xtec.cat', '$2b$10$DElCRPPpQAKEPk770iOuZO/s99z1C0G92nPCbKaKIpxJOczNfdep.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Eladi Homs', '43006575', 'ctra. del Pla, 145, 43800 Valls', '977604100' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006587@xtec.cat', '$2b$10$Ihn2WBgJDnbYC.IjGg0YLuBK6fYTqjRk2WpQKBzO4PKVq0W0tM5mO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Àngels Garriga', '43006587', 'av. Salvador Palau Rabassó, s/n, 43700 El Vendrell', '977663900' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006599@xtec.cat', '$2b$10$KnQQ1QpUx9Mir5R8yjvst.BAonkdnrmfLC6WEiopBCDAuHj1QreEO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'L''Àngel', '43006599', 'c. Josep Tarradellas, 101-103, 43870 Amposta', '977704636' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006617@xtec.cat', '$2b$10$bfDWrIwdi7h14JUKFyFC9OmXmlSMiNQpQ50mVpYR7WJp1cVM5t5Hu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Amigó i Callau', '43006617', 'c. del Serè, 10, 43440 L''Espluga de Francolí', '977870154' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006630@xtec.cat', '$2b$10$iFSDZkmyrkzzaDJVv7oz/Ov1X8/aXDWuTntO0fKW4D17qyEJZiQ72', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Pere Martell', '43006630', 'Autovia de Salou, s/n, 43006 Tarragona', '977556338' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006642@xtec.cat', '$2b$10$KJC/DSLcnbCV9Q43McnknO1atGg0u3xZMaRrcxyYRr2S4ojhvYX5q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Terra Alta', '43006642', 'ctra. de Vilalba, 30, 43780 Gandesa', '977420195' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006654@xtec.cat', '$2b$10$EUmTp9wHQ98RO1xymz37zu09E9Pq2iZ5gKsZtCx.dZZEkUOgSeZ6S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Cambrils', '43006654', 'pl. Ajuntament, 7, 43850 Cambrils', '977361833' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006678@xtec.cat', '$2b$10$f4.29.f45EycwhWGw7mpYu6hQuiHT/BtDZKBd7FDNMLhoq4rVSbZe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Gabriel Ferrater i Soler', '43006678', 'ctra. de Montblanc, 5-9, 43206 Reus', '977342010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006681@xtec.cat', '$2b$10$sc7aAZbQxUv1FrQIUmDEyeW.2yF8Rz580snsZa6Pl5fYBLWXTEuye', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de La Sénia', '43006681', 'c. Domenges, s/n, 43560 La Sénia', '977713065' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006691@xtec.cat', '$2b$10$uvvBfWHPWwKIcvn2F3kp..DYl127rQ4.rl1bfF0cFKZ/Yil9Y.nwm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Priorat', '43006691', 'ctra. de Porrera, s/n, 43730 Falset', '977830338' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006708@xtec.cat', '$2b$10$evAxszZr4q8oLVE/gUmgFObB3lK1yA3Uc.Z50CXi.MQFqIIscZ.9S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Segura i Valls', '43006708', 'c. Progrès, 7, 43420 Santa Coloma de Queralt', '977880009' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006733@xtec.cat', '$2b$10$F7XJO3hHg9wReGxyZjr6ZuWIUgEchukLylOL/3aJkynk.PeiTjiaK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Robert Gerhard', '43006733', 'pg. de l''Estació, s/n (Parc Barrau), 43800 Valls', '977604454' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006851@xtec.cat', '$2b$10$Q.0THYzF546g0L9m9p4MXuMbvFl8cQzI6MtpedkA33Xno5CaAt5iC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Molí de Vent', '43006851', 'c. de les Escoles, 13-15, 43830 Torredembarra', '977130246' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006861@xtec.cat', '$2b$10$0l8jiOUk1gcxB9lvgneLIu9ygqjXN/ssLhl.X7iUIe7XwgUKMDCae', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Enxaneta', '43006861', 'pl. del Carme, 5, 43800 Valls', '977600508' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006873@xtec.cat', '$2b$10$Rma6MRnsWlfUYG81sK2/NehQKmdCvLTKhorB/UnfWaY4AHxy9ExSW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Riumar', '43006873', 'c. Ignasi, 26, 43580 Deltebre', '977480545' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006903@xtec.cat', '$2b$10$1A7KXjpysO/RfCm7YD3tXOISrFEI5tTVN46YE5lAX8FS1fMJqKM9e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Pau Casals', '43006903', 'ptge. Tívoli, 3-7, 43700 El Vendrell', '977663306' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006939@xtec.cat', '$2b$10$DCR5YFC6Rn/0H1LxM0ykK.TrfkiTmObN5.q7GWRopRIEece.nOO.i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43006939', 'c. Sant Jordi, 3, 43750 Flix', '977410959' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006940@xtec.cat', '$2b$10$xKpzUTtXNJDtNuuP6J2Wiep6ciZNquVXeiswBx9Gt8xTAZi8IuB.6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Tarragona', '43006940', 'C. Smith, 55, 43001 Tarragona', '977226936' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006952@xtec.cat', '$2b$10$9.zSwMBKswbEPZ9HzOZEOexD7WcF.lBhy4O9gnAoOcI2b1oV6js.u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Torredembarra', '43006952', 'av. de Sant Jordi, 62-64, 43830 Torredembarra', '977640312' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006964@xtec.cat', '$2b$10$13IphpkCSboZOP7c26mL9uO/UxI/4Qg2Qmng8RV3TFVxJIAgViSU.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Deltebre', '43006964', 'av. de Catalunya, 19, 43580 Deltebre', '977489123' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006976@xtec.cat', '$2b$10$K/6nymRt4KAK8uklCDZqnubcyebkncMdJu6yJ6I7Ds35m.9k34STC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Candelera', '43006976', 'av. U d''Octubre, s/n, 43860 L''Ametlla de Mar', '977456442' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006988@xtec.cat', '$2b$10$Bg0dLpu/plO6hhq/uEAs6ujBPv9LkhHFVGjQ7/KN7D1qy118Yt5yy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Garbí', '43006988', 'p. Àngel Garriga, 3, 43700 El Vendrell', '977661702' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3006991@xtec.cat', '$2b$10$dam1oKorugVgexgfXRJvJ.8GYNn5O2/m283pkwejQt1me6R7l5PM6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Col.Français inter. de Reus - Marguerite Yourcenar', '43006991', 'Partida Rojals, 22.Mas Ossos,políg.55, 43204 Reus', '977771917' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007002@xtec.cat', '$2b$10$eapXk9t3TFXa2pfxvuf5cuj7BZKW63liKcb5Iulqgn51I70/rKuzq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. Mús. i D. i de Dansa', '43007002', 'pl. de la Cultura, 1, 43740 Móra d''Ebre', '977401600' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007026@xtec.cat', '$2b$10$qOuXk8N0u/shPzRuwT04q.7nQ/o/ECJCoDeVcniQBA.D95vKg.IhK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Nou Esplai', '43007026', 'c. Berlín, s/n, 43840 Salou', '977383274' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007038@xtec.cat', '$2b$10$EmYrAgUyW1QjgFHoTrtPcOJ07lrD9TEFRubKc8mIau82vKHJCgHoC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola d''Hoteleria i Turisme', '43007038', 'c. Estel (Pg. Marítim), 43850 Cambrils', '977792837' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007051@xtec.cat', '$2b$10$ecai..lLH3x7Lx8o5tbxb.9MwumFpZWhl9XYyLQXvXbFVv5SUHPRm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Josepa Massanés i Dalmau', '43007051', 'c. Fra Antoni Cardona i Grau, s/n, 43002 Tarragona', '977237860' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007087@xtec.cat', '$2b$10$w32XWnqd23Nz0OAaHkh1Hej2o61DwL.oOBTZwDZ08EzwOKly1VEia', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Sòl de Riu', '43007087', 'c. Joan Maragall, s/n, 43530 Alcanar', '977731026' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007105@xtec.cat', '$2b$10$gX6LrD5kBJNGZx0axeuXj.HR.IvTi3T2LLtuylZQ9Es8HaxVLZHcm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Montsant', '43007105', 'c. Borges del Camp, s/n, 43203 Reus', '977315110' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007117@xtec.cat', '$2b$10$DxuxlJAiZix/P.PXIEUy3.LlwGZmKpjAhgjaBSuVr7Ke.apH5ElLC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Pax', '43007117', 'av. Josep Gramunt i Subiela, 55-57, 43007 Tarragona', '977217757' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007129@xtec.cat', '$2b$10$Bz8SjYpYHArX8rTRMYUqQeM3jmMroB9P2FgTtuDmuTKyzs7obLvlq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Julio Antonio', '43007129', 'c. Comarques Catalanes, 103, 43740 Móra d''Ebre', '977400121' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007130@xtec.cat', '$2b$10$8o2f/pccgRPaNLe7A3y3fOMwju1.b6ZcC2fNbLWjzcwxB.g/pt2X.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43007130', 'pg. Albert, s/n, 43850 Cambrils', '977368102' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007166@xtec.cat', '$2b$10$83fyMjQcOZJ9nRxRRczKt.8YFLZ.XSSdtJRyB1x21oa63sKD/FbLG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Lluís Domènech i Montaner', '43007166', 'c. Maspujol, 21-23, 43206 Reus', '977312381' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007178@xtec.cat', '$2b$10$.HefDDVif4F7ObcTvCS9teyGTE7gHSY4SVwIoLR.sbQpSqk3rYo6C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mowgli', '43007178', 'pg. Boca de la Mina, s/n, 43206 Reus', '977312647' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007181@xtec.cat', '$2b$10$wT8U0gAl3ifoM.H3ES3BgODF7q8.VihVIBBivcaR2EzLrII8eqF1y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43007181', 'c. de la Música, 4, 43330 Riudoms', '977850287' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007208@xtec.cat', '$2b$10$aqGgB2.bJcIOZURKTShysuaQGu2Kj1ZRZMSws3YFq96Uj1MGQ.kje', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Berenguer d''Entença', '43007208', 'c. Ramon Berenguer IV, 7, 43890 Vandellòs i l''Hospitalet de l''Infant', '977820427' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007221@xtec.cat', '$2b$10$kYXbBmUOsL/uGq24o0T3oOypEHVFTL3Ko/K2OtH8CiBeRlmSQODMC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Els Alfacs', '43007221', 'c. Dr. Torné, s/n, 43540 La Ràpita', '977746982' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007233@xtec.cat', '$2b$10$6QTe5qEIDlf/8mXo40LTu.mxED7.2BdI98cKJA5RZrOnPr/IYPdvS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Flix', '43007233', 'c. Salvador Espriu, 1, 43750 Flix', '977410459' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007245@xtec.cat', '$2b$10$GfJYf9ymALlQeGW902yPBupgcyHzCjJwZPFXQCz6aMwrnvakABmui', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música La Lira Ampostina', '43007245', 'c. Mestre Casanoves, 44, 43870 Amposta', '977701004' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007257@xtec.cat', '$2b$10$vT4DytKzZCCJIOHng.1Xm.QA0NKkvUKjyJn35RoXRe.GpJRlbIhs2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Camí de Mar', '43007257', 'c. Jaume Pallarès, s/n, 43820 Calafell', '977695711' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007373@xtec.cat', '$2b$10$9wDb0GlPJr967hHP3Hrolu9S0rHSgQBGOokCCV8EiyxWI9Mj8b90C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Alba', '43007373', 'pg. Boca de la Mina, s/n, 43206 Reus', '977313381' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007385@xtec.cat', '$2b$10$7YiAY9O.WNic7RbQMpH5tOVSsn2RQv2WGIazx89MoV9AuNqFJn4RG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Horticultura i Jardineria', '43007385', 'Autovia de Bellissens, 41, 43204 Reus', '977753929' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007397@xtec.cat', '$2b$10$jITZGGmiXM4MdQ5QTAB/Lu7scH2oHHjy5dNoC9jBRTdKszXJcmPsK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música La Unió Filharmònica', '43007397', 'c. Miralles, 4 i 8, 43870 Amposta', '977701024' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007415@xtec.cat', '$2b$10$JtOM.3.cz1rXagGBS.pXzOHp.HBQRfKooLxWoVbMgXOKq4k3D7.2i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Gruneta', '43007415', 'av. Santa Bàrbara, 83, 43870 Amposta', '977703454' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007427@xtec.cat', '$2b$10$3jTaS7aGOEkVyoaBr3AVyu7Zdm3dyE4oZ0DWizeAqUcRZmXLYTQPC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '43007427', 'av. Catalunya, 3 baix, 43781 La Fatarella', '977413561' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007440@xtec.cat', '$2b$10$fF6H6Q6noew9ZZkO6xAg6uLbAKvoHXgAwSfy8nDS6GH4kHECJP/xe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Patufets', '43007440', 'c. Pompeu Fabra, 3, 43772 Botarell', '977826130' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007452@xtec.cat', '$2b$10$5b5OSDe70c6/nRMpxHhpy.XO9UZsY3v9b0F3LfsT3SsCesUA2.uBS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Picarols', '43007452', 'av. Catalunya, 2, 43330 Riudoms', '977768096' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007464@xtec.cat', '$2b$10$plIYl/qCS/FO7wgC5aiXzetZ4k8e61B9TqfsmGuVsoePywelzMU6i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Xiu-xiu', '43007464', 'c. les Rodes, s/n, 43460 Alcover', '977846704' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007476@xtec.cat', '$2b$10$7rp.vS7eRvastVAdGON.SuS7mLrulUdvCzq1aaLPEZ6WFVQCQxAR2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Perafort', '43007476', 'av. de Catalunya, s/n, 43152 Perafort', '977610123' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007488@xtec.cat', '$2b$10$DOsBlOJsLoOdVh6NbJaSjOAxglqk0hAchnU3R9s7EgdNddj4gQ46S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Francesc Blanch i Ribé', '43007488', 'c. de la Mainada, s/n, 43893 Altafulla', '977650008' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007491@xtec.cat', '$2b$10$VmQ0JgZNYmBiCG6I2Hu7D.w7hF56fvL2S9AmPiNwMUAGBr2nOuPr6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Pam i Toc', '43007491', 'c. Escoles, 43, 43750 Flix', '977411240' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007506@xtec.cat', '$2b$10$rc7Jtoa34T8Ewc3Fr2Nnl.xDNugm.hgxjoO710aktplPpCQEzdUnW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Cargolins', '43007506', 'pl. Església, 1, 43719 Bellvei', '977663947' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007518@xtec.cat', '$2b$10$Ioabu3AbnoBJlI6Ue9lOPecHpUPnn/xp1nTGm1pNgJZGQXHUFt4Ua', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43007518', 'c. advocat Gallego, 2/arquit.Ubach, 1, 43840 Salou', '977381008' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007521@xtec.cat', '$2b$10$rdUCkF5SOy1ABQwiGLGKr.hHIeX9v2.aHszvaOS4/WTRY2zI8cTGO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Municipal de Música de Vandellòs i l''Hospit', '43007521', 'c. Alamanda, 3, 43890 Vandellòs i l''Hospitalet de l''Infant', '977823714' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007531@xtec.cat', '$2b$10$Hsa5w7x.XgxrGannvVRRZe4jKwaCLxoDYKZI9aHWn3P7/VtsmfZdq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Patufets', '43007531', 'c. de les Escoles, 12 i 14, 43890 Vandellòs i l''Hospitalet de l''Infant', '977820461' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007543@xtec.cat', '$2b$10$Z/bPRGkxumnfGBYordhzLOYFJ4.kOmOaLNeKU/KRdow1FDO1lQcgK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Jaume I', '43007543', 'c. Advocat Gallego, 6, 43840 Salou', '977384771' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007555@xtec.cat', '$2b$10$JP2vSMre3wEPLW0kyaVgLungN/QZH5k2Waau0ucpQEXTAOJShSz7u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Espígol', '43007555', 'pl. Quatera, 41, 43730 Falset', '977830057' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007579@xtec.cat', '$2b$10$sVDY/Tk2niof4uRLwLZB.utSMqcOdjH9kQUZQx9EhvND5yQBTsiFG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Vailets', '43007579', 'c. Farinera, s/n, 43791 Ascó', '977405663' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007580@xtec.cat', '$2b$10$NxnSfSwUMP9gG5tPD0/PIOeXBbbpEBofDkX6amMZSxwLnJV1hc/My', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de L''Arboç', '43007580', 'c. Pompeu Fabra, s/n, 43720 L''Arboç', '977671065' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007610@xtec.cat', '$2b$10$FN9qSjFimbEn4kDck6G9feVr2aSFfo8bUAsAw55Elkegl8VpU7D4K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ding-Dong', '43007610', 'c. Costa de l''Era, s/n, 43746 Tivissa', '977417447' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007634@xtec.cat', '$2b$10$vPxKEkAc.DabTX8oJSMJO.1C/i7PdSl8QFI76mlv6WCkxlGR586Ce', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Barrufets', '43007634', 'Zona Esportiva, s/n, 43500 Tortosa', '977596666' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007646@xtec.cat', '$2b$10$IWIWQGTRoYSUpBg8cX8xXOj6AfdmMCte6p/u0N9AzQk44MUHl8/v6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Constantí', '43007646', 'c. Onze de Setembre, s/n, 43120 Constantí', '977524011' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007658@xtec.cat', '$2b$10$KT6O5d9eXIi25qyuV9Pf4eC1yOAluB96txt.Q/VB0d3yq1aq5N7eG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Guinjoan i Gispert', '43007658', 'c. Baltasar de Todà i de Tàpies, s/n, 43330 Riudoms', '977768432' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007661@xtec.cat', '$2b$10$wLGljBmw2q14qyJbzReibOy/zH19zM50t4vR1Bzz8quZddzrF3zAK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ramon de la Torre', '43007661', 'c. Camí del Moro, 28-40, 43830 Torredembarra', '977642402' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007671@xtec.cat', '$2b$10$wi8bRzP1S7YMfoTIkec.neXAVgFe1QS8jXMBuAmuFPFu8r9p4.LZq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Santes Creus', '43007671', 'pl. Sant Bernat Calbó, 1, 43815 Aiguamúrcia', '977638301' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007683@xtec.cat', '$2b$10$JUZ8xtQ2syFwyZF4B1uj5eo9HZ0uTZAKUDXSEEUI8cZz46ngqFowy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Bonastre', '43007683', 'c. Albinyana, 2, 43884 Bonastre', '977657019' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007713@xtec.cat', '$2b$10$tpfCsLHn29L9IfTTn43pbuHXUrcOW4mObh7pYbDoS1hHSc19VVx1G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Ninot', '43007713', 'c. Riu Onyar, s/n (Campclar), 43006 Tarragona', '977550230' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007725@xtec.cat', '$2b$10$gmteCLY/23b.R0wqCf1dBuEOohh.RDFoVX6cd73s4jrhKrAA7kTQi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Taronja', '43007725', 'c. Riu Llobregat, s/n (Campclar), 43006 Tarragona', '977550220' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007749@xtec.cat', '$2b$10$vMEQTmTKmoY0XyHh8TN8eOA2RTM7kd9p7ynBHq24KoNfqSK3f9ode', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '43007749', 'pl. Major, 1, 43812 Rodonyà', '977628006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007798@xtec.cat', '$2b$10$dzTERRchEXF38SmUCD4GUOOjeshp7.okBePGkD6S.vXYIsAMXZAfi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Dips', '43007798', 'c. Joan Perucho, 2, 43320 Pratdip', '977566242' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007804@xtec.cat', '$2b$10$siDhU1.kP.Xi5mcuRGlFc.c7U30F9l0c3T.KHVhvt7waN.0zWSSWa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Vimbodí', '43007804', 'pg. Mestre Garcia, 1, 43430 Vimbodí i Poblet', '977878244' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007828@xtec.cat', '$2b$10$uwNEMLAAMwP61pKB5/jAM.uuXaQHPL8SVx2sJYPQSQHjmKXqFatRO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Quitxalla', '43007828', 'c. Avenir, 37, 43800 Valls', '977614905' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007831@xtec.cat', '$2b$10$lgoj6hy7cCN4O/q3qM6XvejkdvGbNbemkmlGLUIemSPU2Is/GBuXy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Barrufet', '43007831', 'c. Astorga, 17, 43205 Reus', '977771715' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007841@xtec.cat', '$2b$10$NlB1v96h0BT.YbA7Qk5UIOQ1LZRHuZiqNH/LSNZ7U/qHhnWF/aDUC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Rossinyol', '43007841', 'c. La Segarra, s/n, 43420 Santa Coloma de Queralt', '977880060' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007853@xtec.cat', '$2b$10$w/Um/jlYdwjjGSW76AAs/.9fMA0e0mA1MUYkTj4W6AH/D87gHMVI.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Baldufa', '43007853', 'ctra. de València, s/n(barri del Pilar), 43006 Tarragona', '977540609' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007907@xtec.cat', '$2b$10$a5GHG05hvpOghOLKAr.sWuyGUaC40X5NsuME1PPDuD9gr3gbfxTgu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Sargantana', '43007907', 'c. Cervantes, 41, 43203 Reus', '977314606' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007919@xtec.cat', '$2b$10$on/7Nq0HEkPmtN/26w02He1lnA5B2QDIbw36gRTeG6MJBydPxOLKK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vailets', '43007919', 'c. Frederic Soler, 60, 43203 Reus', '977312373' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3007981@xtec.cat', '$2b$10$j8JrZ.CXWqdV9.zLN8iSceh4xJEUM.WQYyqDE56zgsMohhPNAqsP.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Bao Bab', '43007981', 'Via Augusta, 34, 43003 Tarragona', '977238832' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008067@xtec.cat', '$2b$10$v/f9agcIhTIk8rwhyk3TZuaBCXNDZjjrl38skDSZatwjdZqEhqaVC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Babi', '43008067', 'c. Tarragona, 35, 43204 Reus', '977756594' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008158@xtec.cat', '$2b$10$W9pIqIr3tzdYf4Zha3gVlu9JDotXwe2ZAfSK6py3yF8H2HUhDn5CG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Pineda', '43008158', 'c. Jacint Verdaguer, 6, 43480 Vila-seca', '977391713' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008195@xtec.cat', '$2b$10$RIM4uXoLHmE5gRVkwHoXs.zz91fMUSEEQ8iua9Z/VcnSMNHD2SUSC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Vicki', '43008195', 'av. Baix Camp, 31-33, 43850 Cambrils', '977365091' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008237@xtec.cat', '$2b$10$RkTpMqOoAHmEDsrw.3CgXegCWfhy0YWn6GHrccVgqcFbJ9PPcG0I2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Mare de Déu de l''Esperança', '43008237', 'c. Major de Masricart, 10, 43110 La Canonja', '977550550' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008262@xtec.cat', '$2b$10$gWxak2WbnNmbH7UVXPHBYOYSGIoUXUCT0nhDwtLPpoIBJv2o.9dGC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada La Cuca', '43008262', 'c. Carrasclet, 36, 43850 Cambrils', '977361796' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008331@xtec.cat', '$2b$10$s6wiTJxFaxFT24OvTucaGOfR6AMT7AXdJOmwggJ/aaZcHPmegdM96', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Mafalda', '43008331', 'c. del Vent, 27, 43201 Reus', '977321320' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008377@xtec.cat', '$2b$10$1vPjPXqHySMcvCfpjH1/5.OiYO4AaYv9WrHM3sg.wfKjgQIgsaNEq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Mare de Déu de la Roca', '43008377', 'c. de la Roca, 5, 43300 Mont-roig del Camp', '977837005' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008389@xtec.cat', '$2b$10$BFQzZV1oBFD6yNeDXqboJ.pe5v8up3HESQew7kKdtuIcHQ0.lwnyC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Sant Llatzer', '43008389', 'c. Rubí, 16, 43500 Tortosa', '977443546' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008390@xtec.cat', '$2b$10$M6u8JSmgkgM80xBSmVK6Be4/OfyxI6vL6B6ap7bxKbHjM0zAQG76y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Torreforta', '43008390', 'c. Móra d''Ebre, s/n, 43006 Tarragona', '977545721' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008407@xtec.cat', '$2b$10$JdcaviMkK18twa4p//MbeOePs3Wz7V8vg657iP39.jxF3mrTVzGaK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut El Morell', '43008407', 'c. César Martinell, 1, 43760 El Morell', '977842057' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008419@xtec.cat', '$2b$10$zw5k8YnYblZ34pcE0Aaqk.JqnuxcWb9q4umff8QxzJEtZS0LjXCIm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Camarles', '43008419', 'c. de la Granadella, s/n, 43894 Camarles', '977470444' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008420@xtec.cat', '$2b$10$s4b616OiImbBdxuYZbgGF.ukNwlM/06AcW1Jm8ui5jlv6iWv48owi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Roquetes', '43008420', 'c. Anselm Clavé, 8, 43520 Roquetes', '977502833' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008432@xtec.cat', '$2b$10$chTUMmk15qRP1qmI9yWz5OfkKktH6JU8bGfQBCYiC2RD9f03cD2Bi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Sant Pere i Sant Pau', '43008432', 'c. de l''Institut, s/n, 43007 Tarragona', '977213248' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008444@xtec.cat', '$2b$10$zxXVPg8d4NVIxa0NcoPvZe0pYvFI1hHrjbnB95aN3LZ/xWCc4xUea', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Josep Tapiró', '43008444', 'c. Astorga, 37-39, 43205 Reus', '977773471' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008456@xtec.cat', '$2b$10$z3s48r4rgNsXiDcAH1VZleJVy/5o5QIx3KxoT7VvHDkA.BdnmnEpW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Les Planes', '43008456', 'pl. Catalunya, 1, 43570 Santa Bàrbara', '977719416' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008468@xtec.cat', '$2b$10$7NIfZvU4RETZFQs9E/ejj.MqQiTSPStMUwEb8H8lxCiWiSVs3cSb.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Tortosa', '43008468', 'c. de la Rosa,8 (Palau Cavaller Despuig), 43500 Tortosa', '977444124' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008481@xtec.cat', '$2b$10$GpVjfuaDUGOGB0RKnSCUWO9dTDSCvw1VaqzChudwsKeoCovrcrZBS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Collblanc', '43008481', 'c. Carrasco i Formiguera, 12, 43110 La Canonja', '977551716' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008493@xtec.cat', '$2b$10$NwZeMpgoHi53gxgj8sLsLuszieCQy4oGUkNkuO6nQ5wgV46lYGD4a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola de Capacitació Nauticopesquera de Catalunya', '43008493', 'c. del Mediterrani, 2, 43860 L''Ametlla de Mar', '977457775' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008501@xtec.cat', '$2b$10$WQEsLSedSwZ7ezEYXefBUOW37sXX6d8C3DrB2TRcztCNv2adN73ua', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Pont del Diable', '43008501', 'av. de Sant Salvador, 17-A, 43130 Tarragona', '977523011' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008511@xtec.cat', '$2b$10$NrU9ZzvXfqc9DZFI8OJTru3y0dtddTv327ngrk7J4.g8xZpXpgICu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Joan Puig i Ferreter', '43008511', 'c. Abel Ferrater, s/n, 43470 La Selva del Camp', '977845930' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008523@xtec.cat', '$2b$10$9u2st8PwHr/tBzXEtMTjEuWPoZrWzo0NFoQNhObnxv1.qNhOMdKiW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Vila-seca', '43008523', 'av. de l''Alcalde Pere Molas, s/n, 43480 Vila-seca', '977394244' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008535@xtec.cat', '$2b$10$KWinxi8ANRyF5hhOVhoN5O5FfaDXhEIp8Z6dhUOxE5x2KIf12C.vi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Solcunit', '43008535', 'c. La Selva, 36-38, 43881 Cunit', '977676104' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008547@xtec.cat', '$2b$10$.Bq8zq/tsumcL8XG7pbhkuug6JN3XEB4.y8mhNw2aROxKFcomyno.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cambrils', '43008547', 'c. Joan Bardina, 1, 43850 Cambrils', '977368348' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008560@xtec.cat', '$2b$10$QcmRtq/Qt.l1AA/RuynWO.W1R5eFo76iKOueqIhqNQhEVyOUzAwiO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Àngel de la Guarda', '43008560', 'c. Prat de la Riba, 18, 43001 Tarragona', '977221322' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008602@xtec.cat', '$2b$10$GnbV0O/ZFQ9ypULe8iz3zOQjp83K97/SDx/3G2u30sXaquhEF3rce', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Puig', '43008602', 'Zona Residencial El Puig, 43700 El Vendrell', '977666966' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008638@xtec.cat', '$2b$10$ry4QCIg7db8bW6oXnUlDNOFaz0mKQa5PodxhBtZ6nDwD/2BKxslbe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Antoni Ballester', '43008638', 'c. de l''1 d''Octubre, 5, 43300 Mont-roig del Camp', '977838609' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008687@xtec.cat', '$2b$10$Iia7/jxTdIZVDAaPZOYA1.b3PSIe46jLBZV7eQJSDBydVO7iIroRa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Yo-Ni', '43008687', 'c. Rovira i Virgili, 54, 43007 Tarragona', '977220625' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008729@xtec.cat', '$2b$10$xRuIA0O2MIjkCtOvZGIeyeFI/p.vJKBKvMPxszR.cwr057oUD2fpS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Tarragona', '43008729', 'Perllongació carrer B,s/n(Barri Riu Clar, 43006 Tarragona', '977551888' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008742@xtec.cat', '$2b$10$pMjVGwWF12Cn4RxEqiE8jeOYuR/TapE.fq1t60d/H19Qo7wbfLExa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Vila-seca', '43008742', 'av. de la Generalitat, 27, 43480 Vila-seca', '977392368' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008754@xtec.cat', '$2b$10$v.Mns.vaobmNtzIronP9s.9cDeO6LxMslTAiidahlZSpFVH6pi/C2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Sebastià Juan Arbó', '43008754', 'c. Madrid, 35-49, 43870 Amposta', '977700043' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008766@xtec.cat', '$2b$10$TEj.rvx3aPvtndgpNlGz2e6QLvU.GchNPVDTSEhesNwdWuhi066nC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43008766', 'c. Armanyà, 10, 43003 Tarragona', '977245236' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008778@xtec.cat', '$2b$10$Msosf/xfzB3Y3mZM8JIwYu/3ZVCKlIZLMA23ApJkqLcRtStbLTYy6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Fòrum', '43008778', 'av. Ramon i Cajal, 70, 43001 Tarragona', '977242833' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008781@xtec.cat', '$2b$10$Vi/jRHG9FK66pDRmu1pktu2eSx7V1/oDsEw4DRiA.fNfHXWfjJg.e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Rosa dels Vents', '43008781', 'c. Horta de Santa Maria, 14, 43850 Cambrils', '977361350' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008791@xtec.cat', '$2b$10$WLa3baaOsDs1H.zafFdQZedsJ/oz4q8OuP.JO2eBF8b0omRHfrcma', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de la Diputació de Tarragona', '43008791', 'c. Cavallers, 10, 43003 Tarragona', '977235830' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008821@xtec.cat', '$2b$10$Z8l9jV9MmFpDjJbTh3qzIugPpNRzqNXna6KDQeIQ12oO6u3krM6yW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Benifallet', '43008821', 'c. de l''Hospital, 11, 43512 Benifallet', '977462291' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008833@xtec.cat', '$2b$10$BIJP8bI4xzgFsXf3QUqB8O/Nk1X6GjHodmaqVfa3QR5AThuGV9oRG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Institut Musical de Reus', '43008833', 'c. d''Antoni Gaudí, 14, 43202 Reus', '977317341' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008845@xtec.cat', '$2b$10$T/LKnw6RjdhabzexlStcA.gsrb7oqXZ2cVjJqkp3IO8GmBKPhMrX.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Nuria Diez', '43008845', 'c. Mare Molas, 27-29, 43202 Reus', '977311667' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008857@xtec.cat', '$2b$10$MaL0QDcWlJDNgGaPq2mSKeanyb9qCbn.0ZErCwAxbGgbSqovgeFB6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Reus', '43008857', 'c. d''Astorga, 19, 43205 Reus', '977300632' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008870@xtec.cat', '$2b$10$VKW141Yumwtryf4B9tOGFOuFNOJi3itSFEJ22MVhykS/SY.o5SC1a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43008870', 'pl. Major, 1, 43791 Ascó', '977404022' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008882@xtec.cat', '$2b$10$Agr8tE22WusF5CPRxElRaOeIeoXMfkECBKPVqM4Djkcv8i6p5fh4W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Marta Mata', '43008882', 'c. Terol, 1 (Mas Carandell. Barri Gaudi), 43206 Reus', '977010850' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008894@xtec.cat', '$2b$10$5Ho8lBrQ7MFbJ/a12fdivOG.huKyitRpHX9ASp9usmPWSo3sNWPsK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Xerinola', '43008894', 'av. de l''Ensenyament, 12, 43860 L''Ametlla de Mar', '977493710' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008900@xtec.cat', '$2b$10$nUifnLv8MCszIVLnUEYo6uwJBGdzfp8o6MTmdQc21fNIjL5jiaszK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal', '43008900', 'c. de Mossèn Jacint Verdaguer, 2, 43440 L''Espluga de Francolí', '977870591' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008912@xtec.cat', '$2b$10$lCg8okFRC1XfwYXjI1Jisu7TYJvN0MGW9bHUiDLGfDVs13yXovWTa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cinta Curto', '43008912', 'c. de Juan Sebastian Elcano, s/n, 43500 Tortosa', '977588831' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008936@xtec.cat', '$2b$10$cuxFkIFzIqVuX0P41qPBruO1e1S4rip4wlDexhJgTAR9d3iCmyZK.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Esquirol', '43008936', 'c. Marià Fortuny, s/n, 43140 La Pobla de Mafumet', '977842241' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008948@xtec.cat', '$2b$10$QpFGz5xID0p.wcC2UMa0xemoC5DGx27UMm/nFMsQFS5h02Ai3WQiy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Santa Coloma de Queralt', '43008948', 'pl. del Castell (Castell dels Comtes), 43420 Santa Coloma de Queralt', '977880445' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3008985@xtec.cat', '$2b$10$DCsVfIHVoT1ZBWrACNb3IOamMhj1c5cNnmdfqmGmCidOBEeMQU7uu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Migjorn', '43008985', 'av. Generalitat/Av. Parlament de Cat., 43880 El Vendrell', '977682139' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009151@xtec.cat', '$2b$10$hWxZXK3t2GN2avAItojGi.I6rtbI/jF1fT1fvS9M77gFNLNJqVrLa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Artis', '43009151', 'av. Pere el Cerimoniós, 78, 43205 Reus', '977310844' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009163@xtec.cat', '$2b$10$mly5hMt1eGtAb3IR8IL6.O.mlxDkEEK5oClSKMx4PoGDPvbcPPYBC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula Municipal de Música de la Torre de l''Espanyol', '43009163', 'c. Balmes, 7, 1r 2a, 43792 La Torre de l''Espanyol', '977405815' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009175@xtec.cat', '$2b$10$PI3NzDnTABk6Z0fqXQY03.6LL29Kkq2KfP.RebwfL2ZnAJ.MUCrSy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'L''Alba i La Cigonya', '43009175', 'c. Reding, 6, 43001 Tarragona', '977214108' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009187@xtec.cat', '$2b$10$ersyO4F.n1xwfELoD3Y9ieH4AQd17wlyoEuZfHypf8mZ8TnCZJN1e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Martí l''Humà', '43009187', 'av. Dr. Folch, s/n, 43400 Montblanc', '977862539' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009199@xtec.cat', '$2b$10$s6g/Ynl9uaMpEimnP/fEiO5B5lAO9jVJOt0AApo8yrAC59U9HRCOu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Reus', '43009199', 'c. LLovera, 15, 43201 Reus', '977345950' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009205@xtec.cat', '$2b$10$NTyBUjkfin8KT3wAgyjEJ./Qn5CEnWSwJQlVVyf9kydE6iRf4iR7C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Adagi', '43009205', 'c. Bisbe de Palau, 22, 43800 Valls', '977602305' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009217@xtec.cat', '$2b$10$WfR3T1rT8XuKGTj.7KF3vO0pWgHQskZhlUG6Ixkcp6lhlEIo7nZ7e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola del Poble Nou del Delta - ZER Mediterrània', '43009217', 'pl. del Jardí, s/n, 43870 Amposta', '977744705' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009230@xtec.cat', '$2b$10$1u69f7JPsWNL3OX.Of7HI.IrvEwEjuyDSCX7UCV.zSPWOnOEvgh2C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Tarragona', '43009230', 'c. Guillem Oliver, 3, 43005 Tarragona', '977232947' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009242@xtec.cat', '$2b$10$t6vcrym5HjJ87G2b8Iqoy.g4pEMenasTOD16lkzRQ5laxqOvdIjqS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola L''Antina', '43009242', 'pg. Miramar, 190-200, 43830 Torredembarra', '977642496' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009254@xtec.cat', '$2b$10$qpFw5TQm22brxy2Iw5GpseSZmzbyZdkGX1YH0KRALsWO8uVBcntGW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Xicalla', '43009254', 'pg. Sant Antoni, 29, baixos, 43740 Móra d''Ebre', '977403054' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009266@xtec.cat', '$2b$10$zzBeyIxWmyJ5UFBHACCDEeSTgCidVN6UvtDFFiIHld8mYMkh9uXQe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Mare Natura', '43009266', 'av. dels Ports Tortosa-Beseit, 23-29, 43500 Tortosa', '977503009' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009278@xtec.cat', '$2b$10$M/DyS1v0LlARTyBHNreK4.7sBLy1ZwGDAoiEWleQ.WGZaqV3YLmhe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol l''Espurna', '43009278', 'Ctra. de Roquetes, s/n, 43590 Tortosa', '977500735' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009369@xtec.cat', '$2b$10$XNN.PpJt8EIE4Bk/WHmrHu9c4rOzSU3Cb54L8.iJ01yg7PMJ9fs2y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Saavedra', '43009369', 'Via de l''Imperi, 1, 43003 Tarragona', '977237619' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009451@xtec.cat', '$2b$10$dgUe8miaN6GMOGpB/SIbT.hDNp3DLeRIQ5Fr6QaonnS5Dm2Hm/Nmu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Salou', '43009451', 'c. Rosa Sensat, 2, 43840 Salou', '977383646' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009473@xtec.cat', '$2b$10$X71wD7KC4tJW7DDVH83DHuBpw6YXkQ4TO4NO8MKEsfmkEP8Zb4822', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EA Esardi', '43009473', 'c. Racó del Castell, 2, 43870 Amposta', '977703474' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009485@xtec.cat', '$2b$10$mpL1NfZhErqETeRIgphxuejgnczmHDv1kHkBK7Uy6EfQsuB/eRk/q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EA de Reus', '43009485', 'c. del Vent, 6, 43206 Reus', '977318750' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009497@xtec.cat', '$2b$10$0LyO9L9qVXTXzXkzmjnIHO.V0m40RjqMiQdE0iLl5yKkVOFA6vuqu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Fonts del Glorieta', '43009497', 'av. de Martí i Pol, 2, 43460 Alcover', '977760839' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009515@xtec.cat', '$2b$10$gnuv7FAhqrAU65Il2hKh5OL9b44yR4TzEEofgMUc2gtYQrkcyItZW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Hiberus', '43009515', 'c. Pizarro, 14, 43870 Amposta', '977702442' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009527@xtec.cat', '$2b$10$9QWNzBnfjAUKqXJugL7mgexkI5P741nvMw0rsM4evxSvooNUvdU8K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EA Municipal d''Arts Plàstiques i Disseny Josep Casadó', '43009527', 'av. Lluís Companys, 17, 43770 Móra la Nova', '977400523' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009539@xtec.cat', '$2b$10$OtscyuCOIIJhfDwm0YQOHOCfDrn47XDBezrRzrkakuktG9OcIBuCC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Baobad-rosa', '43009539', 'Via Augusta, 74, 43003 Tarragona', '977218279' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009540@xtec.cat', '$2b$10$fuVW4DenNTuzCBdxEg1VTuXLE6zyNXID6bUXKJ6JyPMoMFcPgpZiq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Petits Arcs', '43009540', 'p. de les Escoles, s/n, 43713 Sant Jaume dels Domenys', '977678529' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009552@xtec.cat', '$2b$10$JVOHJCRq51wMixyOVy9yM.Ve/dbEXaxL2v2dHVffauv7TNusMcqm.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa del Centre de Lectura de Reus', '43009552', 'c. Major, 5, 43201 Reus', '977340780' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009564@xtec.cat', '$2b$10$mCZJEmt99W948CFoBkgnUelornQ9F3tn9iDLDYCsaQKEotSRU4U.K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Can Petits', '43009564', 'c. Tarragona, 6, 43151 Els Pallaresos', '977610658' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009576@xtec.cat', '$2b$10$tUErtzADyBps9t1.0/VsturhZvtoltW5YqQcna8SpqFyJnQDSb8vW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Estudi de Música', '43009576', 'c. Sant Francesc, 4, 43003 Tarragona', '977231720' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009588@xtec.cat', '$2b$10$OG7kF5mOBXSvI9HPZMy6w.8dncKm0hIcjNSuWkWJ855oqHUvH2nma', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Miquel Bosch', '43009588', 'c. de la Torre, s/n, 43792 Vinebre', '977405781' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009643@xtec.cat', '$2b$10$9VPiod5DC7.ZlHfChHWdm.1F6saZOiwstVfDBujXvib/EsXPsMura', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Cirerer', '43009643', 'c. Camí de l''Era, 52-54, 43830 Torredembarra', '977642535' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009667@xtec.cat', '$2b$10$JpdTNdIDfVD9N3ySXLNL5.y.ZCPu.xrA2a8hABXPDyfc5EnZVMorO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Creixell', '43009667', 'c. Coma, 30, 43838 Creixell', '977801265' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009680@xtec.cat', '$2b$10$F9GLEa6237ZuKnJjaOX3sulJjLJXCpBnfhadFCsnrpKoHAae5uRWy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants l''Oreneta', '43009680', 'av. del Baix Penedès, s/n, 43717 La Bisbal del Penedès', '977688014' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009709@xtec.cat', '$2b$10$jfL3qyj3GyU7G1biuQCsHOUFw9bSr5Zv8dizS61DDZOEgniAQFHZm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Banyeres del Penedès', '43009709', 'c. Penedès/av.Marta Mata, 43711 Banyeres del Penedès', '679836909' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009710@xtec.cat', '$2b$10$bansSTT6Ht2sA.ncglfaM.Q54mjSAP0ENu4DTmCY.RbgJPTu4yTyO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Reus', '43009710', 'pg. de la Boca de la Mina, 35, 43206 Reus', '977323573' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009722@xtec.cat', '$2b$10$FVoOmAIW3uCJB4QtQRIh5eZInUYnk0av30LI3mqP3X7UiFW2FUqXa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Cal·lípolis', '43009722', 'Autovia de Salou, s/n, 43006 Tarragona', '977544202' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009734@xtec.cat', '$2b$10$G1770SoJVqVWoVc3ZSYNre2wFKE.hZkyD6rO9dQ1jZH94J7lyj0cq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal', '43009734', 'c. de Tarragona, 3, 43470 La Selva del Camp', '977766145' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009746@xtec.cat', '$2b$10$K6sinfjCpAJDi1chTAixc.Zxnm8N70uoy3WkdyhIjkpHGTyV43QnW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Torredembarra', '43009746', 'c. Alt de Sant Pere, 35, 43830 Torredembarra', '977644308' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009758@xtec.cat', '$2b$10$15eOsRhRSEUvJZ8SsMPXk.7GJJWWYh61BA3YCOy2dOPrMLum8b9eq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa de Montbrió del Camp', '43009758', 'c. Dr. Gené, 2, 43340 Montbrió del Camp', '977826453' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009761@xtec.cat', '$2b$10$MPNBYqLBy3G/le3ZNTz87ewQFJWMWmcAu4YKyijb7NsjyxffZKVRS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Jacqueline Biosca', '43009761', 'c. Sebastià Juan Arbó, 83, 43870 Amposta', '977702687' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009771@xtec.cat', '$2b$10$clrVYGXB0e94d9NMoFAaGeKtcRgiqJnZTNk8Pm/tjg9xFqHf0s52W', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Tortosa', '43009771', 'c. Esplanada Orleans, s/n (Ed.Betània), 43500 Tortosa', '977588995' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009783@xtec.cat', '$2b$10$5fQZtm7GKzzSPXxeaSx5X.zY7qap2i2HR9cUKVzujnD2fJitGgRHK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Cu-cut de Vinyols i els Arcs', '43009783', 'c. Raval Sant Joan, 1, 43391 Vinyols i els Arcs', '977851683' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009801@xtec.cat', '$2b$10$6ATBr8Q/UpmapNSxKjFADOYSA8keQZneAolaVNw1hmlPwlJmO3doS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Pinar', '43009801', 'p. de les Alzines, s/n, 43814 Vila-rodona', '977638006' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009813@xtec.cat', '$2b$10$f8FXpEGI9v8SFc3.RLki5u7OeSiT6Wz0ifFnNxOWMKijl43NK9wjG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Benissanet', '43009813', 'c. de la Barca, s/n, 43747 Benissanet', '977407430' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009825@xtec.cat', '$2b$10$DICjphxtLqnBoVyWUV.h6OqVLz4i6Yisg3vSm.Rr2f59Cuft35qfO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Merlets', '43009825', 'av. Dr. Folch, 4, 43400 Montblanc', '977862251' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009837@xtec.cat', '$2b$10$Zz.3O1Kf.8nYBMIYy2fV2.lWoKV6CMqjNRVd/Wm60l.3OU/Muu0uO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Petits', '43009837', 'c. de les Vinyes, 1, 43812 Puigpelat', '977600915' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009850@xtec.cat', '$2b$10$63TN6odw3W7DAuC2XHeNoeXLWiYrpWtqW9IKPhKhQJ6fhyVBlMxI6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Ernest Lluch i Martí', '43009850', 'av. del Castell, s/n, 43881 Cunit', '977674340' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009862@xtec.cat', '$2b$10$qV9mQBKYiBAjx8KRSH6FquJ7EOYhB7KGnhl8.aI9CdP7tlOAdsGuy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Tortosa', '43009862', 'c. Sant Domènec, 14, 43500 Tortosa', '977440079' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009874@xtec.cat', '$2b$10$esRVJiwgXfQ1IorpHl1Nf.F3rupb8PrDb9yj.pFsOKBh/bMsq.8ry', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol La Ginesta', '43009874', 'c. de Figueres, 2, 43201 Reus', '977311094' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009886@xtec.cat', '$2b$10$uBDKMIfMWf/pf2rrNfEHg.iqmbCztWgUX9lt6ZXrZZzJCOT3hoO2O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Josep Veciana', '43009886', 'av. Catalunya, s/n, 43152 Perafort', '977610404' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009898@xtec.cat', '$2b$10$Zd6ipao4W3QFGTNfbTfvaulHXNgd5d.gYFlO5yhnK9RfiGRfX6xBq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Castell de Calafell', '43009898', 'c. Cosme Maine, s/n, 43820 Calafell', '977694120' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009904@xtec.cat', '$2b$10$S5KRDZhX5nRrIFQuIz3KcuKeTgLmNGoPxcuusZIzgRWe7bx0b6WRe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada La Lluna a Cullerades', '43009904', 'c. Costa Brava, 6 baixos, 43205 Reus', '977333208' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009916@xtec.cat', '$2b$10$eFiCc2s0epiyLEPL8.1Go.T1Di3flf3pfpMn1HZLhG8lcLbfIVVmK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Niu', '43009916', 'pl. Major, s/n, 43144 Vallmoll', '977637087' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009928@xtec.cat', '$2b$10$PH0QGwjJ0oCJ/pUT0Sf0UeWlF.4tulMk/U/8wSde08VlgPW3wJjwG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Petitons', '43009928', 'c. de la Reina Sofía, 17, 43883 Roda de Berà', '977657009' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009931@xtec.cat', '$2b$10$3epmXNp9ncRUO7ExCfwDGuGROTxXNgHtCfgpem2jpCDKZDXezVoAu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Dolça del Morell', '43009931', 'pl. de l''Estatut, s/n, 43760 El Morell', '977841510' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009941@xtec.cat', '$2b$10$U.29MF87p5mK2W/tOUocJemoRCrO2Nk7cVZGGU.WU3b5gcopuVnPC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Xerta', '43009941', 'Camí del Portal, 8, 43592 Xerta', '977473005' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009953@xtec.cat', '$2b$10$xEwmt0WQGWrAjVZ7IxFR0uu4oiAcffoA7Zgmy9p6jjeiOmChrPzU2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Tracalets', '43009953', 'av. de Catalunya, 21, 43594 El Pinell de Brai', '977426231' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009965@xtec.cat', '$2b$10$mXNT.4P6e8a9JTbLgI4QyuID0vODz/w2iAbvVQbwjW49MmEwqt2aC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal d''Ulldecona - Joan Nadal Girona', '43009965', 'c. Major, 49, 43550 Ulldecona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009977@xtec.cat', '$2b$10$WP/JlX.edsrp0WyjMdXhQej/kOfnEYmrNAr4PwTBn3Y3iBjJNKBvi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Altafulla', '43009977', 'c. Camí de l''Oliverot, s/n, 43893 Altafulla', '977651662' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3009990@xtec.cat', '$2b$10$BGrh13qDQ0n.f2Y9pFFPiOFqWJGbNfIRrGrRxKsGb/Ndy3UHBgyg2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Mare de Déu del Roser', '43009990', 'c. Mianes de Masdenverge, s/n, 43878 Masdenverge', '977718404' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010001@xtec.cat', '$2b$10$Vj/QaiO97cIhDIrhq/ifTe1OEb4ZA7GX9fLpG2DRXoivafjtTPN1S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Trenet', '43010001', 'c. del Castell/ c. de les Sorres, 43881 Cunit', '977159115' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010013@xtec.cat', '$2b$10$pIaW966a7mHG33Ls4b2gc.JlzihrVuPx4CHoOfYCMKw2rzrN/VXaS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Petete', '43010013', 'av. de Cádiz, 83, 43300 Mont-roig del Camp', '977810351' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010025@xtec.cat', '$2b$10$qOkZZLZRcQ3aFZBaF1uHj.AFSq7WkdqVBNJY0t7SW2CGtCgF.74C2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants municipal de Ralet Ralet', '43010025', 'c. Ribera d''Ebre, 13, 43700 El Vendrell', '977155315' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010037@xtec.cat', '$2b$10$4Wc6Hztb.oQH6e0hlnQHLeDt8LiHC/UgF7ZOtx9xw2URwMjPbWQze', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI del Vendrell', '43010037', 'av. Salvador Palau Rabassó, 1, 43700 El Vendrell', '977660995' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010049@xtec.cat', '$2b$10$NQDzGg/dFshBsasNAa1IbuujlT7mKyIWDhXCexs2oS2.bOy8OrMtS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Monges', '43010049', 'c. Doctor Pittaluga, 2, 43762 La Riera de Gaià', '977655715' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010062@xtec.cat', '$2b$10$CYOtii6hGv7ZV/MhQsuPh.mRGG9BFvfyVGAGGuKsIhjPQQ4ykL/im', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA El Vendrell', '43010062', 'av. de les Escoles, 19, 43700 El Vendrell', '977155674' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010074@xtec.cat', '$2b$10$LIh.OFvoMKaVebJAhxSEoeiep6On8IzmJO62HFUyWH6nlSdd3ljfy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Valls', '43010074', 'ctra. del Pla, 37-A (Casa Caritat), 43800 Valls', '977612010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010086@xtec.cat', '$2b$10$OkzTzK6iBWzk1A7ydWjLoOS9HHHH3eToI4MnDmGpFyQ9y9ScN53wO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Vilaseca', '43010086', 'c. Sant Pere, 25 (cant. pl. Estudi, 1), 43480 Vila-seca', '977391811' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010098@xtec.cat', '$2b$10$kBDE/BrcvhGEQjNPCHDrLO9OrzkAbVNj5ARDTNzNHDfxgnzfPU5ZW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Ginesta', '43010098', 'c. de Les Garrigues, s/n, 43882 Calafell', '977164723' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010104@xtec.cat', '$2b$10$qk12jxkVPQ7INSlqZbB2oec7h393.SPY5TS9iydBhypoaXoMmdWkC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Patufet', '43010104', 'rbla. Mare de Déu del Roser/pl.de la Pau, 43141 Vilallonga del Camp', '977842062' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010116@xtec.cat', '$2b$10$BEpRsn/.g.VhUDqOnUNjn.DbEtw83yGdp.MTQf/C7QNaroPMQoAl6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'HDA Institut Pere Mata - HDA', '43010116', 'c. Camí de Riudoms, 13, 43201 Reus', '977326499' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010128@xtec.cat', '$2b$10$/5AYuyEkXC25BxycD8ZhB.93NsmostzLGIJnx5Azi3YWlNSeSjz4.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música de Tortosa', '43010128', 'c. de la Rosa, 6 (Palau Oriol), 43500 Tortosa', '977444124' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010131@xtec.cat', '$2b$10$ODyevaEm6AZm7VU9r/bFqOi4glVZZSIgDnfz.XjsZUdIeDlryhVg.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cons. de Música de Reus', '43010131', 'c. de Llovera, 15, 43201 Reus', '977345950' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010141@xtec.cat', '$2b$10$u9Y.h28IU7vTg5..ExSB9O1u3kedDEK4XuXXp51kKqUnor8qYAWrO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Guillem Fortuny', '43010141', 'c. Pisa, 3, 43850 Cambrils', '977378034' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010153@xtec.cat', '$2b$10$LEFQ6aNL6Y9J8ukHdWavluDpP2NC.FbB1qhAoRAIuHd2YNnwfK7LO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vora Mar', '43010153', 'c. Maria Castillo, s/n, 43840 Salou', '977352900' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010165@xtec.cat', '$2b$10$Hw8Ic0gXG7IuaUAjHHNIWu6jfct1hn4GpFVaSF8hsvYN0wBu/W7Hu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marta Mata', '43010165', 'av. Tancat de la Plana, 131-135, 43700 El Vendrell', '977666062' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010189@xtec.cat', '$2b$10$drHCIpQCLr1.BkZ8rr138u6UKRpvpRD5db3AsFnTqCWlNqNtVju6e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Mediterrània', '43010189', 'c. Ramon Casas Carbó, s/n, 43700 El Vendrell', '977662844' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010207@xtec.cat', '$2b$10$SsjHyhG9HH.XW5ejDIxKUOQNYq74qRseZ3LF5R2GR3ZI9gttFiuge', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Mafalda II', '43010207', 'c. Astorga, 7, 43205 Reus', '977770924' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010220@xtec.cat', '$2b$10$f3vyyWCBpuHcCZYQLSgF/ucoIIKruLQj7PNow417Q45OEAAJ5hVO.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Maspujols', '43010220', 'av. del Poliesportiu, s/n, 43382 Maspujols', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010232@xtec.cat', '$2b$10$4CQUfp8GfvI5xAlIBVj6Ruxay9oTHQrUj5HOO0tWmAnwJPY7Obumy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de la Sénia', '43010232', 'travessia Pompeu Fabra, s/n, 43560 La Sénia', '977570274' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010244@xtec.cat', '$2b$10$iGkJx1EVumFLEIWDAdKxH.gRVkOaPxlzrDiLkUJokfDSdN/XAu8xm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Tortosa', '43010244', 'c. Sant Enric d''Ossó, 16 B, 43500 Tortosa', '977510144' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010256@xtec.cat', '$2b$10$cT7MiO23/fFfMXWI.8eQ6.FZ2OG/Z0GHoJEHh7FIyPy3UBSDNFtBu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Serrallo', '43010256', 'Barri del Serrallo, s/n, 43003 Tarragona', '977248592' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010268@xtec.cat', '$2b$10$LqClfQm5.T/NiLdSjH5TL.q.CDtYd2Gp.UlL5egTc78ZcZF2kmCA.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Tivenys', '43010268', 'c. Abadia, 10, 43511 Tivenys', '977496233' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010271@xtec.cat', '$2b$10$0KVCkTauQIP9hhL7WH47uORaHyVFTDTmaX.T4RWb.8wTB/rM7e3/6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sol Solet', '43010271', 'av. de Catalunya, 1-3, 43761 La Pobla de Montornès', '977648700' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010281@xtec.cat', '$2b$10$/qlmCzAFalqUEd7RA5pbXuzR949AsUvF0UZOPl61N7C1moKpLkEx6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada El Bosquet', '43010281', 'urb. Els Pinars, 45, 43007 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010301@xtec.cat', '$2b$10$FkFVa98aPY7Bc9g2Q7Az9.pCM/2vlI5s3Acck8Dmw/xh5fJ3.IDYC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Picarols', '43010301', 'c. Teresa Toda i Juncosa, 2, 43771 Riudecanyes', '977834470' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010311@xtec.cat', '$2b$10$TrWFrYUu4DjAj.kHEw3gLujXdl2F5Wgxh07.sw2rfilH8cOhdci1e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Ribera d''Ebre', '43010311', 'av. Comarques Catalanes, 103, 43740 Móra d''Ebre', '977402779' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010323@xtec.cat', '$2b$10$h8Mj0T5cjNmPTE/h1h6tVeWuYCbNz3RMZBvXKbxUnGW8N4/tj6iYK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Montblanc', '43010323', 'Camí del Cementiri, s/n, 43400 Montblanc', '977860484' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010335@xtec.cat', '$2b$10$/pKxeDSHA7V97t839djfde5PCmNsqIHOleAY9IFkEnofwtwcm6Kyi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Mar de la Frau', '43010335', 'c. Mas de Vileta, 1-3, 43850 Cambrils', '977368414' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010347@xtec.cat', '$2b$10$n.U62lAVkpnKFaiX2eOtzOfyW9JfAkTZuRtSB0z.FkV0EEaFBk2nW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Marta Mata', '43010347', 'c. Domènech Sugrañes i Gras, s/n, 43840 Salou', '977353242' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010372@xtec.cat', '$2b$10$dIeWtOV2cENVUQQwmQUP9..VyEROF1C6Ai4nMqX5qQwIeau2TeDZG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut La Talaia', '43010372', 'c. Brasil, 8, 43882 Calafell', '977159233' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010396@xtec.cat', '$2b$10$IOhEoLXRDaovnlKiLEAr0uVjD2IqrtuJlo/Mq9rgql4znBL9SwF42', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Ponent', '43010396', 'av. del President Tarradellas, s/n, 43006 Tarragona', '977260701' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010402@xtec.cat', '$2b$10$ujX9OBkCQiUZHBHFlOjTOe/zr70CRj8BMJa6SNTqiafwJy1r9De5C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Roquissar', '43010402', 'c. Roquissar, 8, 43893 Altafulla', '977651969' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010414@xtec.cat', '$2b$10$fbQ7HSOereJR7ZB7F5eg6.RxOZd581a39qSidbrZCEdgCgWnM5YoK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Coster de la Torre', '43010414', 'av. de la Diputació, s/n, 43717 La Bisbal del Penedès', '977169183' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010426@xtec.cat', '$2b$10$CXUyq.JrIOxem.6QpES.PekTzTEPLLN91ODrigRPaH17/vNmILTy2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EB privada L''Estel', '43010426', 'c. de Sant Jordi, 25, 43480 Vila-seca', '977396244' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010438@xtec.cat', '$2b$10$0Z/cuQdD3YipN2G4s170rOp1qz8OxNa6gb9kiuaRuuYONO2/fS5py', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Miracle', '43010438', 'pl. Cardenal Arce Ochotorena, s/n, 43003 Tarragona', '977249722' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010441@xtec.cat', '$2b$10$utAhnmo88DnUmP9Bgi5kZ.4wbFOcZYw3ld1xuG/8VPDvzOmgsHRxy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal d''Alcanar', '43010441', 'p. Lluís Companys, s/n, 43530 Alcanar', '977732013' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010451@xtec.cat', '$2b$10$pkpdG4q0AmLPdKjsdHu3zOrQUGViOXzj4YcqJqTxTo1aiaZQNyyCm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Gu-gu', '43010451', 'pl. de les Escoles Velles, s/n, 43120 Constantí', '977523214' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010463@xtec.cat', '$2b$10$O1xwAdrPQlWitD89eiwMWurH.UCMZCiqz1.71ufbXWqUZUCF86Sh2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Benissanet', '43010463', 'p. de la Reinaxença, 1, 43747 Benissanet', '977407810' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010475@xtec.cat', '$2b$10$STXBw.oGMS3dqG60WT.c5.EkTr8gYeDZpT1Y2EMFtmqumeMAzT3Pm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Josep Porter i Rovira', '43010475', 'c. Major, 81, 43400 Montblanc', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010487@xtec.cat', '$2b$10$2nTPHt4t0xke4LxFFzjP/uVKb/adYRQpzMj3UuDsPF28hf1a/VqDe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Marcel·lí Esquius', '43010487', 'c. Brasil, 15(Miami Platja), 43892 Mont-roig del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010499@xtec.cat', '$2b$10$kY./707DydhzORp0XCLuB.CzftZNIU4w0SE8c7irLXBsKRKGu0vOC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Pau Casals', '43010499', 'Trav. Comella Moro, 15 (CP Mas Enric), 43764 El Catllar', '977240142' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010505@xtec.cat', '$2b$10$38Nhi8YFewkKT4kBSHIObuF/i3md1vmNXgIh5fEPHaQAQbO3.Nld6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Vitxeta', '43010505', 'pg. del Nord, 120, 43202 Reus', '977327539' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010529@xtec.cat', '$2b$10$Oav2hzW9Yk66EpVYK.PVf..RFvL9hBky9BgR17MVYCHDWfIL1UQC.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cavaller Arnau', '43010529', 'pg. Germans Nebot, 77, 43330 Riudoms', '977595497' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010530@xtec.cat', '$2b$10$L9QAeqpDscUN/WYeZodJ9.Zga46M/TiNq9GBljjGanyeBtMCfbXEe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Miramar', '43010530', 'c. Era del Delme, 20, 43480 Vila-seca', '977396280' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010542@xtec.cat', '$2b$10$O43wcVibHgpKSaD1bEUUfu4miGfNo.6.pyLQ5db5Npqq1HCEvUiV6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de l''Ametlla de Mar', '43010542', 'c. Països Catalans, 16, 1r., 43860 L''Ametlla de Mar', '977456046' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010566@xtec.cat', '$2b$10$FNvl5Ruk03kjfqcj/kWb7utIiGGr.u738ArRhW.Qf08gUzTOjP6Lm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Barberà de la Conca', '43010566', 'c. Anton Vidri, 1, 43422 Barberà de la Conca', '977887437' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010578@xtec.cat', '$2b$10$uIq5x5qC1RCzwDeP5c2xKe7No0IH5OFAgeHLHdVvYF0JmhWRChE0y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Fontanelles', '43010578', 'c. Cultura, 1, 43350 Les Borges del Camp', '977560842' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010581@xtec.cat', '$2b$10$p3hiEBXVZR8qZ4c98k8uS.M.t3DvaQEczON4y2u5tncJS2.5Rpk4G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Mas Clariana', '43010581', 'c. Castell de Siurana, 1, 43850 Cambrils', '977378722' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010608@xtec.cat', '$2b$10$EGNFUI6TLEyZ5lNO1n6EVe46oT70XsZct8FC1ACH3Adx3IgAcWDWS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Serra de Miramar', '43010608', 'pl. del Quarter, s/n, 43800 Valls', '977609150' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010621@xtec.cat', '$2b$10$7SFDASk3Sa5D7SOO24kWX.OzKmCEWY2xWpNbhst/5uyBPS/EAALfS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Cingle Roig - ZER Baix Camp Nord', '43010621', 'c. Dr. March, 13, 43380 Vilaplana', '977815807' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010633@xtec.cat', '$2b$10$IWHwaBzmCmHFy7ocYOo6AuXAgVuQqMtXYJlsgmekUkt/GWIsu5kVO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants d''Albinyana', '43010633', 'c. de Barcelona, 11 (Les Peces), 43716 Albinyana', '977687561' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010645@xtec.cat', '$2b$10$4sBba.OcCux8afSNIM1UAe2aHDPENbEuV20OWMAEcFpBjMVPFgYru', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Eixerits', '43010645', 'c. de Roquetes, 1, 43392 Castellvell del Camp', '977855749' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010657@xtec.cat', '$2b$10$qUzVVx98iu2F.2oulaY4kuzZwZMTpFdLHs5F7k4HlUdIAu5Yh8UJu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Racó del Petit', '43010657', 'c. Vint-i-sis, 6, 43894 Camarles', '977470007' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010669@xtec.cat', '$2b$10$FzgM2zJ51mjBmMGNcCgUOea4ZzmGwzssWuw7.6Oa0qPUznSVSL6f2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI d''Amposta', '43010669', 'av. Mestre J. Suñer, 1-37, 43870 Amposta', '977701556' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010670@xtec.cat', '$2b$10$9HC.EKz9HRcfzDgfGCGKE.9g7Fk73Bqn8aeeMZkSidK76gJu2qQXG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Valls', '43010670', 'pl. del Blat, s/n, 43800 Valls', '877062581' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010694@xtec.cat', '$2b$10$8nXmT4cmTGkbKcUNQCSwlep32FBVmhy6Xrm90I1ybQV/BbDxLZ1JW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Paüls', '43010694', 'c. Escoles, 3, 43593 Paüls', '977492283' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010700@xtec.cat', '$2b$10$T1L5BSz/DkLPyiWou3WVYusNwr57fXw6zslByVK9JZySsDUljN/bK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CASASFORMACIÓN.ES', '43010700', 'c. Dr. Zamenhoff, 3 bxs., 43001 Tarragona', '977220890' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010712@xtec.cat', '$2b$10$cym15vZFRe2urErpgL0nmumAs0HwDawhWvd9B10Linsec1KMQW0aO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Terrossets', '43010712', 'c. d''Alfons Mané, s/n, 43820 Calafell', '977699197' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010724@xtec.cat', '$2b$10$svJedXY2hR87zRKKJMgXi.MkgaD95VJk2olulbYzxP0nATBICHn3C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Petit Trenet', '43010724', 'c. del Terral de Dalt, s/n, 43820 Calafell', '977699195' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010736@xtec.cat', '$2b$10$1fwJqANcQqcwTRl5CVlRAe.x3EMebGhCnBkmUIc654J4djekLjVU6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada La Tribu de Cris', '43010736', 'c. Sedera, 40/av. Pere el Cerimoniós,s/n, 43205 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010748@xtec.cat', '$2b$10$wQt1RMICzrDmTxRdthEVguVQrVyLx9/1zAQYrQhQl43j17beR3QNO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Els Pallaresos', '43010748', 'av. Catalunya, 12, 43151 Els Pallaresos', '977627203' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010751@xtec.cat', '$2b$10$JgSYziVRc28KfLqchkicu.c1cutZUE1Invl.LQzDL1r0N3ODgTtPK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Pesolets', '43010751', 'av. d''Alforja, s/n, 43390 Riudecols', '654339254' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010761@xtec.cat', '$2b$10$ROxMvr/y5pnkfhpLUsxj1O9LAlKuJifyrZToZYQeoJxopQ1ztphxy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Minyons', '43010761', 'av. Nostra Sra. de Montserrat, 1, 43720 L''Arboç', '977671755' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010773@xtec.cat', '$2b$10$pY696gP43Vp8x0iBJzfcR.CA8LWtAjqJAV5IfJSdXhBhP0ZrVBbwO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Consol Ferré', '43010773', 'c. Valentins, 20-26, 43870 Amposta', '977701840' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010785@xtec.cat', '$2b$10$.D7RJIaf8bKCkpRnT.FfoePG6rEmdCShwjSb/2X7nAVLoGN0JEyVy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Els Tabalets', '43010785', 'c. Hort del Carme, s/n, 43800 Valls', '977606001' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010797@xtec.cat', '$2b$10$6BW.MjwGXxvdBBYf0QfHK.wmcX.rSDqhb/ynOh8xkXjErxFDEvhv.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sol i Vent', '43010797', 'c. de l''Alamanda, s/n, 43891 Vandellòs i l''Hospitalet de l''Infant', '977820461' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010803@xtec.cat', '$2b$10$b/YS6ufbuuZ0eBZ0YlG6n.Sppny.Eo6cW/OY8km8wvvmgV/Uid6xC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada El Barrufet', '43010803', 'c. Ribera d''Ebre, 3, 43820 Calafell', '977693020' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010815@xtec.cat', '$2b$10$qCLZVATY.otdpOgZf7fJIeINiwbSghx1z90Q5.PrEM0tCELANcviy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Cossetans', '43010815', 'av. Roca Plana, 28, 43881 Cunit', '977159256' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010839@xtec.cat', '$2b$10$7bgtv8fJIppAD4xi6eg9yOa/WmRC4xldbvdcc/ZapygYasTubkBj2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Serra Major - ZER L''Aglà', '43010839', 'ctra. de Gratallops, s/n, 43374 La Vilella Baixa', '977839025' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010852@xtec.cat', '$2b$10$IgoElLfVRLJNWkD0uYbxeOcgBkRPSPa30lNijHMoF0k9mtClA8l46', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Roseta Mauri', '43010852', 'c. Jaume Vidal i Alcover, 17-19, 43204 Reus', '977301189' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010864@xtec.cat', '$2b$10$PTW.KxOtDPI60mTc75pSae9DzQL9lJbjopa.ku4XsFz2qC5MXIsTm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Isabel Besora', '43010864', 'c. Fuster Valldeperes, 7, 43204 Reus', '977595360' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010888@xtec.cat', '$2b$10$vk8mN7XWG14rcfifs0x0/up5EAKrXZEqm59Vgj5z7Vy11EWw7CRdC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Tecnificació', '43010888', 'c. França, 19-21, 43870 Amposta', '977707849' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010891@xtec.cat', '$2b$10$qh.k0tbqvZ2MLblHtF2sx.jPcjl289eJXNjFEl3GO8QcToJpLg4qC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Musterets', '43010891', 'c. de Reus, 2, 43393 Almoster', '977761010' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010906@xtec.cat', '$2b$10$mTsfjWrnpM/ZBTT5CPGnpeu4WDOePey3KbG5Ik1tsKEvNIsfFHJvq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Mestral', '43010906', 'c. Conflent, 111, 43700 El Vendrell', '977154290' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010918@xtec.cat', '$2b$10$PNMuaHCLjBzBr6odSsodwOb92tZYGJLgrKECchZNwzxBApEHYfnNK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa Centrescènic', '43010918', 'c. Eduard Benot, 11/c. Carnisseria, 9, 43830 Torredembarra', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010921@xtec.cat', '$2b$10$xTKD3jxX.PKn5W2KBmJvPO20GzD0mQCjErLCY2n7Rb3YsmMg58Aoy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Balena Blava', '43010921', 'c. de Barcelona, 95, 43840 Salou', '977383409' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010931@xtec.cat', '$2b$10$oJvlNenjT2Oocm9l6HWrHuFk0xUGhofvfkHXhPw6n1qtYKkUwi3u.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada La Cuca de Llum', '43010931', 'c. D, parcel·la 28, UA-15, 43550 Ulldecona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010943@xtec.cat', '$2b$10$KfeeaIVeCHeYW2WoLSyS/e6SWQJEMbkWzXySVo6JJ5cu45V28EY1O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Beceroles', '43010943', 'c. Genar Bartrolí, 3, 43570 Santa Bàrbara', '977719781' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010955@xtec.cat', '$2b$10$ILcjaDp6Lk7tgrQbqQwH3erbJ5m0F8XHFV3WgbfLz5bsInYdfdi/u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Pere i Sant Pau', '43010955', 'rbla. de Sant Pere i Sant Pau, 43004 Tarragona', '977203550' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010967@xtec.cat', '$2b$10$/FuU60suxuZ7b6pfJocyKu4x1TfidfxKnmKC2qVpUeaCyvsEEN3hq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Pira', '43010967', 'av. d''Arnau de Ponç, 42, 43423 Pira', '977887464' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010979@xtec.cat', '$2b$10$hB4jO7twdvwrUBa6ddQEX.Xrsa3PzCOhCjAb.sLrgcO7ADhVMAGUC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Sant Salvador', '43010979', 'av. Sant Salvador, 13, 43130 Tarragona', '977293045' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010980@xtec.cat', '$2b$10$VzN9/HIpDw3ZJbv9MZXt2.xsPcBpJMLfmzeVyYOpeZYnePaNXaVUW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI Ribera d''Ebre', '43010980', 'c. de les Comarques Catalanes, 103, 43740 Móra d''Ebre', '977414357' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3010992@xtec.cat', '$2b$10$kJ0eI7TwQdpo4XaY4L4vMO3z/RgpwflGcx0oN.Xj.3Sx1hVA0b8Ci', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de l''Espluga de Francolí', '43010992', 'c. Lluís Carulla, 63 (CEIP Martí Poch), 43440 L''Espluga de Francolí', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011005@xtec.cat', '$2b$10$EGeR7./lvX4/SLmYUxUvkOPID5/m9ct0Kf7Zwgw5DCcYfffRkj3Hq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Papallona', '43011005', 'c. Bernat Metge, 10, 43205 Reus', '977754261' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011017@xtec.cat', '$2b$10$NogA1GnSFQYwJdrAKsZVCugl0ozokUkmwBPChIzZ85Ni2fzSH8e9m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Cireretes', '43011017', 'av. Loreto, s/n, 43812 Bràfim', '977620436' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011042@xtec.cat', '$2b$10$uu38DeLrTCpqkVmrwqN2VOGYgORPypfzvddv9MF.JAfn65vf2yYw6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Palmera', '43011042', 'c. Sants Cosme i Damià, 4, 43763 La Nou de Gaià', '977655258' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011066@xtec.cat', '$2b$10$e37IBfzLvIf6D2foYV8p5.LyYvz41lj6YD14/POhfL9MLz0yfV9t2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Montsant', '43011066', 'c. Borges del Camp, s/n, 43202 Reus', '977315206' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011078@xtec.cat', '$2b$10$HuHX1j7wxKaUtFX4dlfqNuYHJGI8JYhQqom6faGBhK8UvMBMP8Z76', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants M. Dolors Medina', '43011078', 'c. Mineta/c. Antoni Fabra i Riba, 43850 Cambrils', '977369702' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011091@xtec.cat', '$2b$10$2jTgsiQvgcgFU1y3NJ1fIenVBwX3fSYgVuoExPGA6uA/mksWTsSFW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Figuereta', '43011091', 'c. de Dalt, 8, 43811 Figuerola del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011108@xtec.cat', '$2b$10$SQsJlOCC33sEsBC0/MbSEeJp4msbxueSHjBaWUO60/eHHuRsd3FDG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants l''Esquirol', '43011108', 'c. d''Aureli Serres, 8, 43596 Horta de Sant Joan', '977435707' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011111@xtec.cat', '$2b$10$GoXZgZUiJOmtfU3zuNNeVOeLn0q4zShuZ14oUv7noOr4p2VhJVrMW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal d''Alcover', '43011111', 'c. de Les Rodes, s/n, 43460 Alcover', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011121@xtec.cat', '$2b$10$n9AE.TaVrb2V4AVb.6mA8eYaT3mXfR6vfbnOdDFFbEcM.j2bXtYKu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Vilamar', '43011121', 'ptge. del Ferrocarril, s/n, 43820 Calafell', '977691848' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011145@xtec.cat', '$2b$10$2TWKjKI9L4Owu5Oie3DnG.NGFg7.AP6odiE7.GeE1L6teu2ZZGX5S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Els Ganxets', '43011145', 'pg. del Nord, 3, 43206 Reus', '977929148' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011170@xtec.cat', '$2b$10$.cb7B1mp4F5bqayYX8wyVOxJ90E2tl9phgqXsMfhIh0fTR.m4FkwO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Cristòfol Despuig', '43011170', 'c. Rubí, 16, 43500 Tortosa', '877060058' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011194@xtec.cat', '$2b$10$t.I8HiSDRNWfq2r3jaf6CenMUZ/9K9AfXjlyZwY.W9XeMvDRFxVy.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Cucurull', '43011194', 'c. Joan Carles I, 17, 43883 Roda de Berà', '977657190' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011200@xtec.cat', '$2b$10$e49FG6JgmsbTdTwS9UaMuOc.jVIe0Ss5jONAwhkY4LBf/PJxqc9eC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EOI de Salou', '43011200', 'pg. 30 d''octubre, 4, 43840 Salou', '977353008' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011212@xtec.cat', '$2b$10$YT8VqoLBNcrAEqyTnFBSn.j8cBPbzo2rKeNitlfhsk5nEO/xETJ32', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Bòbila', '43011212', 'c. Pla de l''Estany, 5-7, 43850 Cambrils', '977361815' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011224@xtec.cat', '$2b$10$zGNTzGbaQTei6fqldWj2puZzgLrPCr03dRMeC0AwI3B.tdDn59UMy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol de Sarral', '43011224', 'c. Patufet, s/n, 43424 Sarral', '625671025' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011248@xtec.cat', '$2b$10$SeWZajbRZsed.Na5o3PPiOHtjC.SQaakDjTqMvw0Y0MDpb75oH5qm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Morera', '43011248', 'c. Santiago Rusiñol, 22, 43740 Móra d''Ebre', '977401360' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011251@xtec.cat', '$2b$10$28JD3T66kZPbTxpcgaiwSu3CKo3S30TuiD9/TS3GHL45bAt5Q/Txm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Orenetes', '43011251', 'c. de Josep Maria Mas, s/n, 43710 Santa Oliva', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011261@xtec.cat', '$2b$10$6OWA62rI3/PzJdXGq4P8PuqE8k.5uDbPxLUyCqw6k95JUNbECUmh2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Agulla del Catllar', '43011261', 'c. de França, s/n, 43764 El Catllar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011273@xtec.cat', '$2b$10$QIuA.PV8LNvPCynqQJ2W3uHZk1/R4pLjr6WMErmfSjYBZR6AjwI6a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Sequieta', '43011273', 'pg. Canal Marítim, s/n, 43870 Amposta', '977707739' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011285@xtec.cat', '$2b$10$Cl19d7Vdo1PWxQ08iGhcyeXoZHSuYbLW7Je2GP0wAu2LoHKUynvh6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Cabretes', '43011285', 'pl. Església, 1, 43811 Cabra del Camp', '977631243' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011297@xtec.cat', '$2b$10$7kqiANWGS6uu3bau41seVuW0OCg/FeaoJ.CCgqwx3om9886N5Xt9m', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Hort de Pau', '43011297', 'c. de la Cabana-Sector PP5 l''Hort de Pau, 43893 Altafulla', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011418@xtec.cat', '$2b$10$oHcH7jm7PUGNbeU0SEA70unX93UarDp6y3J.ItIudpMZLSughMzri', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Roda de Berà', '43011418', 'c. de la Font, 3, 43883 Roda de Berà', '977657505' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011479@xtec.cat', '$2b$10$.eD3s2jSLbNjpgQVS3h2yOdKmvFm3eoEhrTKxvO5glY6dM52Jk24q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Tarragona', '43011479', 'pl. de la Imperial Tarraco, 1, 43003 Tarragona', '977238277' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011492@xtec.cat', '$2b$10$5KDtuzTegogDUoIjRN3q/uqRaQz3ApEukgYXvJbAiI2sYVLCAWc22', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola La Canaleta', '43011492', 'c. d''Alfons I, 18, 43480 Vila-seca', '977783565' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011558@xtec.cat', '$2b$10$hCgkDR2E11IOnafq.HrWr.Ahl8p0JcbB8QAuFwagkKLC1il7TUsNe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Ribeta', '43011558', 'av. Catalunya, 68-A, 43365 Alforja', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011561@xtec.cat', '$2b$10$oc9w9apknbTMwdKOvqX3fuk5RPxfoltdaL3In18fYIEtf6S6hZaxa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Arrabassada', '43011561', 'c. Internet, s/n, 43001 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011595@xtec.cat', '$2b$10$tVgJmC7r7HcdHK7.kqwTyu9VAaMdFw4AR2cXY8x0S3EUSJ.XXi6mC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Fartets', '43011595', 'c. Luis Mariano, 4, 43480 Vila-seca', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011601@xtec.cat', '$2b$10$sY0mbm7BYu0JV/YxEE2itu9WenKUeWAoo/NPnWgaOzs5mYOnhvRsq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Margalló', '43011601', 'Av. de Salou, 127-A, 43205 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011637@xtec.cat', '$2b$10$A1yLRS3fQJae.DcUuuW4Re272v.JaKBMSwOcTVC.mj5iJBOaPOCOS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Brugent', '43011637', 'c. Pagès, s/n, 43450 La Riba', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011649@xtec.cat', '$2b$10$HtmLb5eKj3ewC6K3nu4OSuIhM3bc0F.j95sJjdQWNO0EK2RYMcshu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Nova Guarderia', '43011649', 'c. Onze de Setembre, 4, 43838 Creixell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011650@xtec.cat', '$2b$10$Tzui7iye8iakj5qN63.e9u6RVvlmvzlRiSL7FZXn6p2P28lbIkHae', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EB privada La Casa de les Fades', '43011650', 'c.Joaquim Torres Ibern, 7 local I, 43830 Torredembarra', '977130810' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011662@xtec.cat', '$2b$10$rtmiXZwZbYiAdj.p5/BVDe5DWj3EaNmhuFzgS573TBwkeWTXvvqAa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Vila dels Xiquets', '43011662', 'c. Sant Jaume I, 25, 43530 Alcanar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011674@xtec.cat', '$2b$10$Yg2mqOsU0y5oFpPJvMkIC.E.ZN.u4Dx3CmKrQyy48n/TbBJZVxs8G', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal d''Altafulla', '43011674', 'c. Sant Antoni Abat, 11-13, 43893 Altafulla', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011686@xtec.cat', '$2b$10$KBJN67f1wOVl7eNWCmuCDeiz0j8/9HpmYfhuyCcoxJAdT0cjg.2qm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Corbera d''Ebre', '43011686', 'c. de Sant Isidre, s/n, 43784 Corbera d''Ebre', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011698@xtec.cat', '$2b$10$IBhfjaL2eknZrP2aZOaOoedJi5RC4JzppfZ31UgRaIC8htXUzUkFe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de La Sénia', '43011698', 'c. del Bisbe Berenguer de Prats, 7, 43560 La Sénia', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011704@xtec.cat', '$2b$10$zixVhRc1PbNlkrsIXu1nneypdldQ9MuvgH5BCNQaWtGQsfz0uy4WC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Gat Galeret', '43011704', 'c. Catalunya, 2-4, 43515 La Galera', '977718339' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011716@xtec.cat', '$2b$10$eC.Ia2bEW.7FR.aLGz3tJucHVq2TQAlFATtY1WEUi0H3bMPpJhIk2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Marietes', '43011716', 'c. Rosselló / c. Progrés, 43881 Cunit', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011741@xtec.cat', '$2b$10$pWuHoJR/HC4D.abiZlsaleDQ8Rs3pB.ROvL4jZfCmeZK/Vtx7LM1C', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Xip-xap', '43011741', 'c. d''Aragó, 15, 43540 La Ràpita', '977743148' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011753@xtec.cat', '$2b$10$/Fn8N7UYjQDwB5HHPPwCuujnlne..WtgnOVoy0e5EXH5AI98oqLS2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Cabirol', '43011753', 'c. de l''Esglèsia, s/n, 43718 El Montmell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011765@xtec.cat', '$2b$10$L9VE.epR6gJP3onZvNKlIew8SfgUl0nuWvbUvLIMJIixjI5r4EyTq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Àgora', '43011765', 'av. de Pau Casals, s/n, 43840 Salou', '977388851' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011790@xtec.cat', '$2b$10$LQ80DWSunAjyhltCvf4YOugwmL1s7o6xupr1hcPGOiyBHF1QrEoiy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Los Raïmets', '43011790', 'c. Major, 27, 43786 Batea', '977430417' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011807@xtec.cat', '$2b$10$2J.ZCCPs5lYknisDSKqRA.qjOowwam3IxvyyJX501NrLIatrnBYYu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Picabruna', '43011807', 'c. del Rosari, 25, 43491 Valls', '977600936' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011819@xtec.cat', '$2b$10$EiOSe4IxrJCAx.jSeHzew.E3Eqra74eS9kUi/HDcnLzeOOY1EKnDG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de l''Agrupació Musical Rapitenca', '43011819', 'c. Sant Sebastià, 47, 43540 La Ràpita', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011832@xtec.cat', '$2b$10$nwqz9mpDnEsQf4GHvbCNpeEACW4Wb3SLbV0fH/LtCZrU/x1yJOZqe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Marfull', '43011832', 'pl. de l''Abat Oliba, 35, 43201 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011844@xtec.cat', '$2b$10$a0NlSYDHMcXeqcN5ZLmE1..x8N5sB9/RLr8FuaQbbwEra5YCatpYy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol L''Olivera', '43011844', 'c. Puig i Ferrater, 6, 43201 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011856@xtec.cat', '$2b$10$Cu0K08QiqqNHaxEWpn.6AusN0Ynp5F4yHEXKv9SRj3pVglcPYHTPu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Marinada', '43011856', 'Zona d''Equipaments, Unitat d''Acció 5, 43895 L''Ampolla', '977460765' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011871@xtec.cat', '$2b$10$LhteOKSZybk79RuZGy9FUeJDNnSRhJdzZ1LoEU1ATTTjjUTvtucye', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Botafoc', '43011871', 'av. Baix Penedès, 90, 43700 El Vendrell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011893@xtec.cat', '$2b$10$2k6nsCqdcDpcjEuviQT8tOIB/sm9OGV7wjAUHyE8RJ6ZyGrlE.g9S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de l''Agrupació Musical  Canareva', '43011893', 'c. Sant Ramon, 109, 43530 Alcanar', '615979474' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011901@xtec.cat', '$2b$10$9UiPXdGzgjho4Q1DtsmxR.9HPQIjQbZt2V.3vSbvYtqo4xu/haMoy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants l''Arc de Sant Martí', '43011901', 'c. de la Bòvila, s/n, 43340 Montbrió del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011911@xtec.cat', '$2b$10$1AHp7//gHn8b0Aj9RbsD.esyrFTM0Dy0hDrRcbfZ31trt/qtts0Gu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Manuel Martínez Solà', '43011911', 'ctra. de Jesús a Roquetes, 1, 43590 Tortosa', '977500446' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011923@xtec.cat', '$2b$10$Q2PtjZR15Fyw06YtnxUQMunhnSKWSAC471Uhni6q.fgzdXnRQ/eqa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Eixerits', '43011923', 'c. del Recer, 1, 43350 Les Borges del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011935@xtec.cat', '$2b$10$XgWxCUxCTl.ioyNIpZ2uN.HNFnSJekaEAa3s66SulH3l.cpQITf1S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA M. Dolors Paul', '43011935', 'c. de la creueta, s/n, 43881 Cunit', '977674601' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011959@xtec.cat', '$2b$10$Z0ad3KS0nonww9qfsTIlSOaop00nJ8FOCiCpmC7PXuWo16KeBCtwO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Lligabosc', '43011959', 'c. d''Apel·les Mestres, 39, 43201 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011960@xtec.cat', '$2b$10$CJ4HMJ93K0OlkfUJesZ0MOc4Nmxo4b.i6./gB8M0JYt9fF3XRfdki', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal del Perelló', '43011960', 'p. de l''U d''octubre de 2017, s/n, 43519 El Perelló', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011972@xtec.cat', '$2b$10$1cJjprZ3jtgZ3haHqE1o2.XdsrGeIYCBj43mr2xENje7MLWLTCCjG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Torre de l''Espanyol', '43011972', 'c. de l''Era, s/n, 43792 La Torre de l''Espanyol', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3011984@xtec.cat', '$2b$10$mo5aQ5yd/8F5d0XOEgwv2.GokGwMbbPpBbZb7OVv9Fys9V89ctUKe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de l''Aldea Bressol del Delta', '43011984', 'c. Independència, 1, 43896 L''Aldea', '610580715' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012010@xtec.cat', '$2b$10$bd5j4xZeKdHJGfgrIC6fnuisXNWdh0lP/W4Ss84QgAxj2ZD3OMika', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Pons', '43012010', 'av. Jacint Verdaguer, 12, 43540 La Ràpita', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012022@xtec.cat', '$2b$10$HU/B4Gx7XMcggd3Qed.dgezFyqd0f7J6aKRzGk5ZBB6f99lnv6zDq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Cavallet de Mar', '43012022', 'c. de Domènech Sugra¦es i Gras, 2, 43840 Salou', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012034@xtec.cat', '$2b$10$JhtFSNaO98gfIVsvNqbtL.7.69MlzsEcmot3AXQKSccTYlOhOpgvW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Ferrer i Guàrdia', '43012034', 'av. Mallorca, s/n, 43877 Sant Jaume d''Enveja', '977468242' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012061@xtec.cat', '$2b$10$z/PPbFuA1SPCYxU6fphFwuDXP.0SYPvzI/gvpu11I84UKoGTaLi4K', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Pontarrinets', '43012061', 'pg. de Sant Isidre, 3-5, 43817 El Pont d''Armentera', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012071@xtec.cat', '$2b$10$TAEvvi3WuYy4Z7m0dlEHvOvReeCY7AdypO1a8x1.bpstWAo8Y1Rai', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Baldufa', '43012071', 'c. Sant Isidre/Escoles/Sant Joan, 43887 Nulles', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012083@xtec.cat', '$2b$10$ZToTIlPclh5y03C/r0VtyOJi0KsgziKD885vm8N2DY644R8vYVeXC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Pi del Burgar', '43012083', 'c. Josep Vidal i Llecha, 1, 43204 Reus', '977302912' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012095@xtec.cat', '$2b$10$bIF6k4YGtFgmS7JWxfQ42eV70Qub.UDC6WoZl2D2tCu4hU7uKeb8y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Joan Miró', '43012095', 'av. de Cadis, s/n, 43892 Mont-roig del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012113@xtec.cat', '$2b$10$pS2MP.fg/2kbgBIzJWVBduBMcJKF1xhPHte4WRPzOBZ15dEutzjsq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Mare de Déu del Portal', '43012113', 'c. del Cós, 8, 43786 Batea', '977430016' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012125@xtec.cat', '$2b$10$Wb4njX47hl1y2hFvtS.YZuzX40Pee2qTm/tywwjK8STJn1qMkDajC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Novatècnica', '43012125', 'c. Francolí, 52-54, baixos, 43006 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012137@xtec.cat', '$2b$10$YKDvWhpYqbndGZeSLaj.hOAml76NhWtY6A9tbkYhDtrz/meLWPPKa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol L''Hortet', '43012137', 'av. de la Pau, 180, 43580 Deltebre', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012149@xtec.cat', '$2b$10$QPLbu1gtYimRT9m7aW5QF.wikREDGoJmZdyR2fDiwII6Wjl3Wzdhq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Galereta', '43012149', 'c. de Cristòfol Colom, 34, 43850 Cambrils', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012150@xtec.cat', '$2b$10$2IX8P/i.ynhBzy6Kwu7hQeaUeE72nBqZmxjcYdbfFpqgl/AoRtft6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Marramiaus', '43012150', 'av. Reus, 1, 43311 Vilanova d''Escornalbou', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012162@xtec.cat', '$2b$10$sYRpwbyuKVshnXzTwlZKVO9nCTUgF0Xg8AdqieqNCTRtAKNnqvapu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Bonavista', '43012162', 'c. Vint-i-u, s/n, 43100 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012174@xtec.cat', '$2b$10$nYZ/xUEwcGxoR4DEMG9YtO8QmOHYuOQn80kdJOOzFxDyO1IUqceH2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Napets', '43012174', 'av. Joaquim Mir, 30, 43381 L''Aleixar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012186@xtec.cat', '$2b$10$An8SF3gvlMbAT8/E6eg2De6Woaa.G.Gk5nyKA4UZoMq0ZVIdYknpu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Nou Esquirol', '43012186', 'c. Mina de Madró, cantonada Molí Tendre, 43140 La Pobla de Mafumet', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012204@xtec.cat', '$2b$10$Ggf60zji6J261og5qQP05.eijkqtwRuSfVsT9mD4J5xqGY1mjWdMG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants del Perelló', '43012204', 'c. Escoles, 2, 43519 El Perelló', '977490490' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012216@xtec.cat', '$2b$10$O3zKzbKRzazZwSb28iLcD.M4GbBgZ8zfB0GzhvxcJUi2DsD54gZw6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Cèsar August', '43012216', 'c. Joan Baptista Plana, 9, 43005 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012228@xtec.cat', '$2b$10$vFIGOMdwv/1e32hdM5F2WuLA1lqFH03au9x4075pHHoTeOHpjaga.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Rasclet', '43012228', 'c. del Repós, 44-46, 43882 Calafell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012231@xtec.cat', '$2b$10$ThFDVetHpDqLd27ljVNgwOOge3fdptazyu3LtsQ0aTWnLTGzPUK1u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal El Morell', '43012231', 'rbla. Maragall, 40, 43760 El Morell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012241@xtec.cat', '$2b$10$lEMt/.GDMRjiQNQMVoi.MOHpSw4.d2vKwaOrYYlxc3a4GJY7clQSu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol L''Estel de Mar', '43012241', 'c. Vendrell, 7, 43838 Creixell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012253@xtec.cat', '$2b$10$RCJdm7fCSA4HiP4N7BtKQ.2q5U7QfcmA4xLSv4p0ID6iAyuowmRaq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Gegants de la Torre', '43012253', 'c. de les Escoles, s/n, 43830 Torredembarra', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012265@xtec.cat', '$2b$10$UJI018Hu/QyNW4GFqSt5j.PlKtlPHTbLQjh6L2on1owOBgNbfZOhG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Móra la Nova El Comellar', '43012265', 'Prolongació del Carrer de la Vinya, s/n, 43770 Móra la Nova', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012277@xtec.cat', '$2b$10$I446CUNJHrqHKZ2ZVMi/FelJQw2EvEg2zMbX.ZQVNXlD19flFpHU.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Vent de Migjorn', '43012277', 'c. dels Ocells, s/n (Urban.Les Clotes), 43700 El Vendrell', '977680936' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012289@xtec.cat', '$2b$10$FMK3xaDwERWT2Sm0jYQQkeZZ2ZebFhbwG0KERZM/lGbCqu/YiVQoa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola 3 d''Abril', '43012289', 'c. Àngel Guimerà, 2, 43770 Móra la Nova', '977400784' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012307@xtec.cat', '$2b$10$r2vKDPmB7bWAhEdAG5XxjOmm9z240ec3GoQOyjtH32rQdxqfQsOdm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Daniel Mangrané', '43012307', 'ctra. Jesús-Roquetes, s/n, 43590 Tortosa', '977502316' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012319@xtec.cat', '$2b$10$L.tawqWACap8hgQdS10CY.OXKcPvQDXHfUDiPXcBA/OYtv4KIpNU6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola El Perelló', '43012319', 'av. Sant Jordi, 1, 43519 El Perelló', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012320@xtec.cat', '$2b$10$M4pCtYHrTbTw2JaPtUPFu.9R5JIftfT2OKtNcEjiG6z1soRQuPBDO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Quatrevents', '43012320', 'Raval de Sant Ramon, 1, 43810 El Pla de Santa Maria', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012344@xtec.cat', '$2b$10$1FOdZTmO8wHbSaY.RnXG0.REWITIQgl/dvmqkX0eiGneNggy3L1iq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol El Petit Príncep', '43012344', 'av. Central, s/n, Calafell Park, 43820 Calafell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012356@xtec.cat', '$2b$10$8VMIN8MgtrLePCPRRSILq.TJDfIFbfBYUiAo8M7vt.ClSDEfHGxt2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Gandesa', '43012356', 'c. Teresa Borràs Domènech, 4, 43780 Gandesa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012368@xtec.cat', '$2b$10$NdlfXbKRPnbKZ5kgrnxb3exdykka0Qb01ZmDIkmHu0MFp.Tdtq2tO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Germans Arasa los Flarets', '43012368', 'c. de les Escoles, 27, 43570 Santa Bàrbara', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012371@xtec.cat', '$2b$10$Fy73t1IU8oQ6V1XFE7gAseFqq5t9ccPtcsKQ8YmNDdvSA1ecwOWnq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Solivella', '43012371', 'ctra. Montblanc - Artesa, 3, 43412 Solivella', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012381@xtec.cat', '$2b$10$BVXMKnQzksJRtc/DRXuwnugGgtVArBXpCCBB7GkVQs.XZxfq14UQW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Godall', '43012381', 'c. Molí, s/n, 43516 Godall', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012393@xtec.cat', '$2b$10$mpi4M76BjFosB.g4gnxxG.wDs8A22m7k/5E99.uwmmIdFUmauQZcm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants L''Espígol', '43012393', 'Zona d''euipaments, Polígon Mas Vell, 43144 Vallmoll', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012401@xtec.cat', '$2b$10$qL35E39DbpR1bneQqeHW1OqMR4AMxn00UL3kwHtfgIFG26wRn1DbK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol La Rasa', '43012401', 'c. Abel Ferrater, s/n, 43470 La Selva del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012411@xtec.cat', '$2b$10$aYJsXtjAvAReVdvI.XwAleHydcNTE.zlqqh1zv9Sg.49cDWTs2Q.2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol L''Estel', '43012411', 'c. Balmes, 62-64, 43205 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012435@xtec.cat', '$2b$10$BERHzBmy/b4uuM1hke/vdepGhkAPv6ERMJBZb/6v9hba42v0PRFHO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'HDA Hospital de Dia de Tortosa- HDA', '43012435', 'c. Comerç, 36, 43500 Tortosa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012447@xtec.cat', '$2b$10$j5y6bsySRNaXqAHw7.JCgOmiGfpwPjDTgkA0lesNU9dlenfh8V4/y', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Bettatur', '43012447', 'Via de l''Imperi Romà, 11, 43001 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012459@xtec.cat', '$2b$10$uCXKG.xR2lKaDZeRdYOSluqLX6dyF/6I.eyT/VFTCyod28S1HfE1e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal Los Carrollets', '43012459', 'av. Terra Alta, 64, 43786 Batea', '977430500' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012502@xtec.cat', '$2b$10$YqxhqAelHxewzxzD249eiettpI77G1ZKgwefoXj5vL6ps4JgMKwwm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Cornudella de Montsant', '43012502', 'c. Comte de Rius, 10, baixos, 43360 Cornudella de Montsant', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012551@xtec.cat', '$2b$10$0QFdnH5ktRk1XWS/rC7Zt.e3FtZ2HCnwvokwJreNwodBFV967E6EO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Les Vimeteres', '43012551', 'c. de l''Era del Delme, s/n, 43480 Vila-seca', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012563@xtec.cat', '$2b$10$kNz4UNfRuZQqHZh8uAPby.odw2ghw5pqPmgaHiWIgEk.g0kIB9V.S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Els Pallaresos', '43012563', 'c. Gregal, 2-4, 43151 Els Pallaresos', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012575@xtec.cat', '$2b$10$3aN4v1.DTWYWbxqT.6PTWehn6uKcpOdzBVdTl8tBgnDybfMzz99wu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Els Catxapets', '43012575', 'c. Gandesa, 22, 43782 Vilalba dels Arcs', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012587@xtec.cat', '$2b$10$DtL.YeVderyy2A5GvAjbJ.SX/nBwXtaNzt7nLC6UN1fySN7roX3Rq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal Xiquets i Xiquetes', '43012587', 'c. Figuerola, 10, 43800 Valls', '977608783' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012599@xtec.cat', '$2b$10$3C2k/dkbq6ITssCCe1LRBuDPubhHzkIi4ChRtaiuTIiJeRfgI5EK2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de La Fatarella', '43012599', 'c. del Forn, 2,, 43781 La Fatarella', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012629@xtec.cat', '$2b$10$u.RetTh.Vb2Kd0DEs65GZeffaP5Z/vxKYgAgSnwc6Z.JutqL7dom2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula Magna', '43012629', 'av. República Argentina, 11, 43007 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012630@xtec.cat', '$2b$10$55aF4i5YX92EPZnbU7pOteJNUK.2VCtoI9SXbc2yweaEXHXAFTDFy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Els Figotets', '43012630', 'c. Reus, 3, 43790 Riba-roja d''Ebre', '977095155' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012642@xtec.cat', '$2b$10$NvAl2JCoN8wHuXY3YWHQSe5oSCGORCFCwdotpVPUhJZorsxevrSgi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Xino-Xano Joan XXIII', '43012642', 'c. Arquebisbe Josep Pont i Gol, 19, 43005 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012654@xtec.cat', '$2b$10$tXHaNNyMnL7TD4t49Ln1ruXngkbrrHSGOoMTz7pzQnondUm4QiD.u', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Nieró', '43012654', 'c. d''Antoni Gaudí, s/n, 43712 Llorenç del Penedès', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012666@xtec.cat', '$2b$10$SVg3BJBgYnqiQmlnFfz0S.u2mNr3JbAtzEd6K1Q80NjsfYnk8LHpm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'EIC', '43012666', 'c. Salvador Espriu, s/n, 43840 Salou', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012678@xtec.cat', '$2b$10$Xzmj1fvo73LDSccImjHTquolebM5yNfECYhdBXL1R.bR.S3SLQc8a', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants El Til·ler', '43012678', 'av. Catalunya, 2, 43885 Salomó', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012681@xtec.cat', '$2b$10$FONAPON8hm5YtX/7b72UCOFq84wPk0bmWtdUM6LwFAZQ3cMsNvKQS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Aula', '43012681', 'c. Joan Maragall, 6-8, 43202 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012691@xtec.cat', '$2b$10$GiRRNhanUowyAx6ZmFTkFO0Sr69gHP1w154z0khWeuM.E.pGaCzjq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Joventuts Unides', '43012691', 'c. Major, 5-7, 43560 La Sénia', '977575307' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012708@xtec.cat', '$2b$10$gO/EKonhAAI.02M/IwUR0u4I7zC4dX6MSyOStX6Cvs7TuNiAnxNXm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEOP', '43012708', 'av. Roma, 5C, 1-2, 43005 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012711@xtec.cat', '$2b$10$euWFq.Lfg6sqDAc9OIzezeDBYUJW8ZE1IMRe4P3VgFuyrotFslpQe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Garbí Terres de l''Ebre', '43012711', 'c. Pujada al Seminari, 16, 43500 Tortosa', '977448093' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012721@xtec.cat', '$2b$10$yH0cjw4KlWlAVVTSH5vfl.ccUzkOjCkB7xVKpFFpCr4kcHAWT5iM6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Lo Pont', '43012721', 'av. La Pau, 178, 43580 Deltebre', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012733@xtec.cat', '$2b$10$CvcpJ7ihQsMCiSg87IEqS.0kkwN3yl4KnccmM2f1cCFs.fC.PqWE.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Bisbe Martí', '43012733', 'p. de l''Església, s/n, 43143 El Milà', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012745@xtec.cat', '$2b$10$atNXeNX2JWLoEx2.M5TNxOUL97Zr0jcpDu3FEfiPgBiDvOI9L3t4S', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'The British School of Costa Daurada', '43012745', 'c. del Mas de la Creu, 4, 43764 El Catllar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012757@xtec.cat', '$2b$10$IwuFOnpViIKX2JbE/l1yoOP2rmj90dMAB.3q1CGTcbWCrZXZT1ve6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants de Masllorenç', '43012757', 'av. Catalunya, 24, 43718 Masllorenç', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012769@xtec.cat', '$2b$10$x5v24S3SYa2CZbjnyHedbuP7eXMU7i7ZuiFom4wLKTSvImvicSRmu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CEE Font del Lleó', '43012769', 'c. Badalona, 15, 43201 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012770@xtec.cat', '$2b$10$nYyyVj177Olx/1Bkc2.Fdu73scjKP0NhDEMabsKCLinZ4vrnEkhfm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola Bressol Municipal els Guillemets', '43012770', 'ctra. de Vallmoll, s/n, 43765 La Secuita', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012794@xtec.cat', '$2b$10$kpkczuulQ2Gy6T./7c7FxOc5uF6x/T/qIQHkuYT2AqnbzpMIkqOOG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre d''Estudis Eqüestres Torredembarra', '43012794', 'ctra. La Riera, s/n, 43830 Torredembarra', '977640282' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012800@xtec.cat', '$2b$10$lUHW0dcleDh.jcyy9o8Ijur83n4tTVifTmkXfOmTXSSdmh/RZwA.i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Afen', '43012800', 'c. Nova Estació, 27, 43500 Tortosa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012812@xtec.cat', '$2b$10$ZUYMIQNTp6WoiOASw4kwW.7v3uiOJnlmENYwB6yBUYEtaoBTvZiz2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola L''Agulla', '43012812', 'av. Catalunya, 3, 43764 El Catllar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012824@xtec.cat', '$2b$10$EUSDw2kUuQMncl6Y7OyvZezopVCRkx3M1Ed93OH.2XiA89A2gUjxW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants La Granja', '43012824', 'p. de Catalunya, 6, baixos, 43201 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012836@xtec.cat', '$2b$10$EZCijWrIYSg.N7uWAREebuSz2mxPbt/KBs08wo0rXVA8DAdV4jj4q', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Els Petits Somriures', '43012836', 'av. La Salle, 19, baixos, 43201 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012851@xtec.cat', '$2b$10$h1vxJ/mJ/TufJG56kzJsTe.Ly/t8g1LkshKNdk2gRK56l7vn0wQLi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Risk 112 formació en emergències', '43012851', 'ctra. Botarell a les Borges del Camp,s/n, 43772 Botarell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012873@xtec.cat', '$2b$10$AjE.orEEa9d88HNc4cmhyexfWOvaA1hLSTUCaW4Ur7XdipY0oeI8i', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cent.Prof.Mús. La Lira Ampostina', '43012873', 'c. Mestre Homs, 10, 43870 Amposta', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012885@xtec.cat', '$2b$10$j64AlEcIXMtQzKbIKcICieLc.95sKID1954c1eClwaOE36QtFLZxW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CENAFE La Pobla de Mafumet', '43012885', 'av. Generalitat, 20, 43140 La Pobla de Mafumet', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012897@xtec.cat', '$2b$10$2VTwvQHuPClgvpfu0kcij.bU2vM6/Z5C6oRjTe1h0tPuc2u3G9eN2', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'AFENTD', '43012897', 'c. Sant Benilde, 15, 43006 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012903@xtec.cat', '$2b$10$KTv77iVF1c69J0Htketz/OWmmq4KwZur/oUgqyQN10W5jeAX.tnXW', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola El Bosc - ZER El Francolí', '43012903', 'c. Major, 4, 43364 Mont-ral', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012915@xtec.cat', '$2b$10$TZBDYyaw3ipBcoQ2TOLAf.04o/CRyeb6n6CSAqeSDnKoUwApg13EC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal de Maspujols', '43012915', 'c. Josep Tarradellas, s/n, 43382 Maspujols', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012927@xtec.cat', '$2b$10$9hsxjLj2145TDcEnv07Jme3XGC6OPVGO3WXxaFReif8B2B3U8yWaq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Societat Musical Espiga d''Or', '43012927', 'av. de la Pau, 180, 43580 Deltebre', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012939@xtec.cat', '$2b$10$MTFsmZ5PDfN93HUKNRn33OA6Z.Y0j2FpFmg.rmW6pnoFNNKM/Kdx6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Òrgan Gestor del Complex Educatiu de Tarragona', '43012939', 'ctra. de Salou, s/n, 43004 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012964@xtec.cat', '$2b$10$9XGF.CuflvQ3XUoKMON4s.al3vwyO1zbu70JY7P68E0QBVyb8d6hy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Cent.Prof.Mús. La Unió Filharmònica d''Amposta', '43012964', 'c. Navarra, 5-7, 43870 Amposta', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012976@xtec.cat', '$2b$10$LlpuGuWHODdDoTT0.kWAt.dLhFkqDj3q53SgV7yhih2DntKKDHUCe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Mediterrani', '43012976', 'c. Riu Ter, s/n, 43001 Tarragona', '977540706' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3012988@xtec.cat', '$2b$10$SUFMoXnQjEZBfqMDWzlHfe5RjRbs1Pn7wb0fUZ2ZhTTntuig0Oaia', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut de Miami', '43012988', 'av. de Cadis, s/n, 43892 Mont-roig del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013002@xtec.cat', '$2b$10$gv3OW0Ujbkc1QU5TLYxTYe54RF/Xp6ffxxSsgltLKshQz75wR7xcO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'HDA Hospital de Dia de Tarragona - HDA', '43013002', 'av. Vidal i Barraquer, 27,esc.9,local 2, 43001 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013014@xtec.cat', '$2b$10$Z.Pxof1BdF4NTRMWvJ3y8uazkC5Sf2mAosLcqugN2.sw2NnqLGwOG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música de Falset', '43013014', 'av. de Reus, 2, 43730 Falset', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013026@xtec.cat', '$2b$10$8Lml/ZBwCrDCjibGQaoR8ehuqPewTaxsWitG0YjMMlzTrRcw2Wyy6', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal de Sant Jaume d''Enveja', '43013026', 'av. Catalunya, 25 (cant. c. Sant Joan), 43877 Sant Jaume d''Enveja', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013038@xtec.cat', '$2b$10$.GQp7P6ArtxfnAklIqwHneBQ9yjjGW3xpkl5b35RUTB2oGSlEfvLS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Baptista Nogués de Mont-roig del Camp', '43013038', 'c. Granada, 39, 43892 Mont-roig del Camp', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013041@xtec.cat', '$2b$10$scXZoEtzY5b3H4HSZFMWzeeD/GrAsSxeFlCPR4adMdMZ6sMccz9IO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Estudi Giselle', '43013041', 'c. Gaudí, 8-10, 43850 Cambrils', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013051@xtec.cat', '$2b$10$zL/z4.1mjnyOUGVaqTWhR./rbnpvr/ZksvXiNQR6pNlx.8yKptaQS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Saba Verda International School', '43013051', 'Camí de Mianes, 3, 43500 Tortosa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013063@xtec.cat', '$2b$10$8ytIoy6nE8RBjI4UNeK0q.iaRIKGQK5LV.IsX5DGt80DnzuTnHljG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Teresianes-Jaycar', '43013063', 'c. d''Ixart, 10, 43003 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013075@xtec.cat', '$2b$10$r2pdhbistcNSpltgaYTTBuqWUa60jqdHeGI6OcKI8R1ZaUlZBeSHa', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Àngel de Tobies', '43013075', 'Partida Botafoc, ctra. de Valls, s/n, 43700 El Vendrell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013087@xtec.cat', '$2b$10$MV9/V5DIgPdpIYuzpXQrNe4jzfbeETtd4DQd0SUlIZanOmNM.AjOC', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Corbatera', '43013087', 'c. Comte de Rius, s/n, 43360 Cornudella de Montsant', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013099@xtec.cat', '$2b$10$gnYbPWCm9ndzgCfunwmCieS.cc9hLZyS/z7Wi7WDWUSQjk4XFPEwq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Agustí Barberà', '43013099', 'c. Madrid, 55, 43870 Amposta', '977701137' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013117@xtec.cat', '$2b$10$pJawrru4y.6hr64.q1Su5uC7NhH3WeU1J0CdEgocpLZ9vF0Q1hjvq', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut d''Est. Profes. Aqüícoles i Ambientals de Catalunya', '43013117', 'ctra. Poble Nou, km. 6,435, 43540 La Ràpita', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013129@xtec.cat', '$2b$10$hgVyLFUTUCf3.OQTbuvRdeYCY9LWT4tORfr0n6jqsFLyGGUdjx5Jy', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Coma-ruga', '43013129', 'c. dels Ocells, 43700 El Vendrell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013130@xtec.cat', '$2b$10$nIUfAlDmkZ4bfifRYJ.b7uvovzmVje.Q3veh7PoPDx2opSLcCm7Ie', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola Joan Ardèvol', '43013130', 'c. Joan Ardèvol, 1, 43850 Cambrils', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013142@xtec.cat', '$2b$10$lnSWWIhNNfM1Daw88gIh3em.QtgfQOUHGXQURz60xetWObg.LSPCO', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola El Temple', '43013142', 'pg. de Jaume I, 19, 43500 Tortosa', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013154@xtec.cat', '$2b$10$ZjiKBj7VvtTCSkwbAQ1lv.OibJ/xLs8NNDscK8x8lvanLFSNv3g1O', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Banda i escola de Música La Ginesta', '43013154', 'c. Reus, 52, 43748 Ginestar', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013166@xtec.cat', '$2b$10$RRJFdQVkfFcaEn86lq6dcOuhMU7ID3ccuAJaGKAlmjug/2OH63Zru', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Centre de Formació CBS', '43013166', 'c. Ventallols, 5, 43003 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013178@xtec.cat', '$2b$10$1TwBEe1M8ZL1Wyyc1wigi..swPdbe/2N3F.SBbvhGT1uqQZ2iIaxS', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Esc. de Música Municipal Dionisio Calvet Melich', '43013178', 'av. de Catalunya, 114-116, 43896 L''Aldea', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013181@xtec.cat', '$2b$10$5aUcATrOH72AkcmptIID3O9Pd9NNVpU15zZv9pdJhDtWiGtIzazw.', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CFA Cal Bolavà', '43013181', 'av. de la Generalitat, 2-3, 43820 Calafell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013191@xtec.cat', '$2b$10$7fqI0assFRFHn4p6U6eOuuLyqJUDpkxK4VoekdLamfR9wWTOWqo4e', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Institut Escola L''Arrabassada', '43013191', 'c. Mercè Rodoreda, s/n, 43001 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013211@xtec.cat', '$2b$10$Yb.ug32r1cf3biviYPDL1e7OSWpAMmIIwv.Is127kn.66vSJ8tjMi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'CAT Sports Formació Reus', '43013211', 'c. Joan Maragall, 6-8, 43202 Reus', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013221@xtec.cat', '$2b$10$ItFjEfUeyjzsMrGBX1GsUu29.u2MonhQYVAc0CZKhpVZHzrGUM2IK', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'LLI privada Creixem Jugant', '43013221', 'ptge. de Margarida de Prades, 4, 43700 El Vendrell', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013233@xtec.cat', '$2b$10$1fwH2btrFReFMOSwF9FfMeFQgIrmQiwFrwXFF89wVe9ni0/zvZeHe', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Ilerna Tarragona', '43013233', 'c. Joan Serra i Vilaró, 7, 43007 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013245@xtec.cat', '$2b$10$o0Vkyl6RAo8LMmtjreTuLO7EazLaveEDZ0Fy5jUzXDziezLAyMQRu', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'URPIJ Institut Pere Mata - URPIJ', '43013245', 'av. Doctor Josep Laporte, 2, 43204 Reus', '977943900' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013257@xtec.cat', '$2b$10$Gxqfm8O8cAC2zyv65LTC6eL1Om.uKwraw4bjHTlcdMQeUGoxckuxm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'La Solada', '43013257', 'av. Catalunya 103-109, baixos, 43870 Amposta', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013270@xtec.cat', '$2b$10$ecm72gZMty8IBjWYd6kGRe3RTwjNayxZuiRY1HNAGplZh/WQNYLnG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Vedruna Dansa', '43013270', 'c. Santa Joaquima Vedruna, 10, 43001 Tarragona', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013282@xtec.cat', '$2b$10$4hp/Cw.sA6efYt54RiZODO0jbVm6i6xprDRsxu3w33zosrlk4YMwi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Municipal La Caramella', '43013282', 'Urb. Torre d''en Gil, s/n, 43520 Roquetes', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013294@xtec.cat', '$2b$10$.rF1pqZTxrzXHF.PO.xWwOVJO7h5nQKqSLQYvqeRqiGohP6kfjnDm', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Claudio L''Academia', '43013294', 'pg. Francesc Macià, 2, local 2, 43850 Cambrils', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013348@xtec.cat', '$2b$10$Y2WqfQNdNYfWyjp9tEN5I.oiLlmVGCaip3oFl8g/ChDWP3JoVz6RG', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Escola de Dansa África Aguilar', '43013348', 'c. Doctor Gibert, 8, baixos, 43480 Vila-seca', '' FROM new_user;

WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('e3013361@xtec.cat', '$2b$10$ZObeBTbdgGcD7.28L32sfO.hUKs6m5jx1xdn7W2ol19pmPuCiNdTi', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, 'Llar d''infants Baobab-Lestonnac', '43013361', 'c. Joan Fuster i Ort, 24-26, 43007 Tarragona', '' FROM new_user;