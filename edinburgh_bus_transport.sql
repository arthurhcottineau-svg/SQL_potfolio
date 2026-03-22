SELECT DISTINCT 
    r1.num AS bus_1, 
    r1.company AS comp_1, 
    stop_transfer.name AS transfer_stop, 
    r3.num AS bus_2, 
    r3.company AS comp_2
FROM route r1 
-- On joint le départ au transfert pour le bus 1
JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company)
-- Traduction des IDs en noms pour le départ et le transfert
JOIN stops stop_start ON (r1.stop = stop_start.id)
JOIN stops stop_transfer ON (r2.stop = stop_transfer.id)
-- On joint l'arrêt de transfert au départ du bus 2
JOIN route r3 ON (stop_transfer.id = r3.stop)
-- On joint le départ à l'arrivée pour le bus 2
JOIN route r4 ON (r3.num = r4.num AND r3.company = r4.company)
-- Traduction de l'ID en nom pour la destination finale
JOIN stops stop_end ON (r4.stop = stop_end.id)
WHERE 
    stop_start.name = 'Craiglockhart'
    AND stop_end.name = 'Lochend';
