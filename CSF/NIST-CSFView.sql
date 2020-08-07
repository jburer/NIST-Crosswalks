/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.1 		*/
/*  Created On : 07-Aug-2020 3:39:05 PM 				*/
/*  DBMS       : SQLite 								*/
/* ---------------------------------------------------- */

/* Drop Views */

DROP VIEW IF EXISTS 'CSFView'
;

/* Create Views */

CREATE VIEW 'CSFView' AS 
SELECT CSFSubcategory.CSFSubcategoryIndex,
       CSFFunctionName,
       CSFFunction.CSFFunctionID,
       CSFCategoryName,
       CSFCategory.CSFFunctionCategoryID,
       CSFSubcategoryDescription,
       CSFSubcategory.CSFFunctionCategorySubcategoryID
  FROM CSFFunction
       INNER JOIN
       CSFCategory ON CSFFunction.CSFFunctionIndex = CSFCategory.CSFFunctionIndex
       INNER JOIN
       CSFSubcategory ON CSFCategory.CSFCategoryIndex = CSFSubcategory.CSFCategoryIndex
 ORDER BY CSFFunction.CSFFunctionIndex,
          CSFCategoryName ASC
;
