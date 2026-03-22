/* 🎓 HACKERRANK CHALLENGE : "THE REPORT" (Logic & Sorting)
   Objectif : Générer un rapport de notes avec des règles de confidentialité 
   et un tri dynamique complexe.
*/

SELECT 
    -- Règle métier : Masquer le nom si la note est inférieure à 8 (Grade < 8)
    CASE 
        WHEN g.Grade < 8 THEN NULL 
        ELSE s.Name 
    END AS Student_Name, 
    g.Grade, 
    s.Marks
FROM Students s
-- Jointure non-équivalente (Non-Equi Join) : On lie via un intervalle de notes
JOIN Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark

ORDER BY 
    -- 1ère priorité : Trier par Grade décroissant
    g.Grade DESC, 
    -- 2ème priorité (Si Grade >= 8) : Trier par Nom alphabétique
    CASE 
        WHEN g.Grade >= 8 THEN s.Name 
        ELSE NULL 
    END ASC,
    -- 3ème priorité (Si Grade < 8) : Trier par Note croissante
    CASE 
        WHEN g.Grade < 8 THEN s.Marks 
        ELSE NULL 
    END ASC;
Pourquoi ce fichier est utile :
Montrer que je sais joindre sur des intervalles de valeurs.
Montrer avec CASE WHEN que j'ai la compétence de masquer des noms et donc comprendre l'enjeux de confidentialité des données.
Montrer que je peux changer le règle de tri selon profil de l'élève (nom vs Note)
