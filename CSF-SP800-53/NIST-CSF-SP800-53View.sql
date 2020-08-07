/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.1 		*/
/*  Created On : 07-Aug-2020 4:12:30 PM 				*/
/*  DBMS       : SQLite 								*/
/* ---------------------------------------------------- */

/* Drop Views */

DROP VIEW IF EXISTS 'CSFSP80053View'
;

/* Create Views */

CREATE VIEW 'CSFSP80053View' AS 
SELECT CSFFunctionName,
       CSFCategoryName,
       CSFSubcategoryDescription,
       SP80053ControlFamilyName,
       SP80053ControlFamilyFIPS200MinReq,
       SP80053ControlName,
       SP80053ControlDetailDescription,
       SP80053ControlDetailPriority,
       SP80053ControlDetailBaselineLow,
       SP80053ControlDetailBaselineMod,
       SP80053ControlDetailBaselineHigh
  FROM CSFView
       LEFT JOIN
       CSFSP80053 ON CSFView.CSFSubcategoryIndex = CSFSP80053.CSFSubcategoryIndex
       LEFT JOIN
       SP80053View ON CSFSP80053.SP80053ControlDetailIndex = SP80053View.SP80053ControlDetailIndex
 WHERE SP80053ControlFamilyName IS NOT NULL
 ORDER BY SP80053ControlName
;

