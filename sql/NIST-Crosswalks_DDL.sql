/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 14.1 		*/
/*  Created On : 20-Aug-2020 12:49:50 PM 				*/
/*  DBMS       : SQLite 								*/
/* ---------------------------------------------------- */

/* Drop Views */

DROP VIEW IF EXISTS 'CSFPFView'
;

DROP VIEW IF EXISTS 'CSFRMFView'
;

DROP VIEW IF EXISTS 'CSFSP80053RMFPFView'
;

DROP VIEW IF EXISTS 'CSFSP80053View'
;

DROP VIEW IF EXISTS 'CSFView'
;

DROP VIEW IF EXISTS 'PFView'
;

DROP VIEW IF EXISTS 'RMFView'
;

DROP VIEW IF EXISTS 'SP80053View'
;

/* Drop Tables */

DROP TABLE IF EXISTS 'NIST-CSFCategory'
;

DROP TABLE IF EXISTS 'NIST-CSFFunction'
;

DROP TABLE IF EXISTS 'NIST-CSF-PF'
;

DROP TABLE IF EXISTS 'NIST-CSF-RMF'
;

DROP TABLE IF EXISTS 'NIST-CSF-SP800-53'
;

DROP TABLE IF EXISTS 'NIST-CSFSubcategory'
;

DROP TABLE IF EXISTS 'NIST-PFCategory'
;

DROP TABLE IF EXISTS 'NIST-PFFunction'
;

DROP TABLE IF EXISTS 'NIST-PFSubcategory'
;

DROP TABLE IF EXISTS 'NIST-Publication'
;

DROP TABLE IF EXISTS 'NIST-RMFStep'
;

DROP TABLE IF EXISTS 'NIST-RMFTask'
;

DROP TABLE IF EXISTS 'NIST-SP800-53Control'
;

DROP TABLE IF EXISTS 'NIST-SP800-53ControlClass'
;

DROP TABLE IF EXISTS 'NIST-SP800-53ControlDetail'
;

DROP TABLE IF EXISTS 'NIST-SP800-53ControlFamily'
;

/* Create Tables with Primary and Foreign Keys, Check and Unique Constraints */

CREATE TABLE 'NIST-CSFCategory'
(
	'CSFCategoryIndex' INTEGER NOT NULL PRIMARY KEY,
	'CSFID' TEXT NOT NULL,
	'CSFCategoryName' TEXT NOT NULL,
	'CSFCategoryID' TEXT NOT NULL,
	'CSFCategoryDescription' TEXT NOT NULL,
	'CSFFunctionIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_CSFCategory_CSFFunction' FOREIGN KEY ('CSFFunctionIndex') REFERENCES 'NIST-CSFFunction' ('CSFFunctionIndex') ON DELETE Set Null ON UPDATE Cascade
)
;

CREATE TABLE 'NIST-CSFFunction'
(
	'CSFFunctionIndex' INTEGER NOT NULL PRIMARY KEY,
	'CSFID' TEXT NOT NULL,
	'CSFFunctionName' TEXT NOT NULL,
	'CSFFunctionID' TEXT NOT NULL,
	'CSFFunctionDescription' TEXT NOT NULL,
	'NISTPublicationIndex' INTEGER NULL,
	CONSTRAINT 'FK_CSFFunction_NISTPublication' FOREIGN KEY ('NISTPublicationIndex') REFERENCES 'NIST-Publication' ('NISTPublicationIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-CSF-PF'
(
	'CSFPFIndex' INTEGER NOT NULL PRIMARY KEY,
	'CSFID' TEXT NOT NULL,
	'CSFSubcategoryIndex' INTEGER NOT NULL,
	'PFID' TEXT NOT NULL,
	'PFSubcategoryIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_NIST-CSF-PF_NIST-CSFSubcategory' FOREIGN KEY ('CSFSubcategoryIndex') REFERENCES 'NIST-CSFSubcategory' ('CSFSubcategoryIndex') ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT 'FK_NIST-CSF-PF_NIST-PFSubcategory' FOREIGN KEY ('PFSubcategoryIndex') REFERENCES 'NIST-PFSubcategory' ('PFSubcategoryIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-CSF-RMF'
(
	'CSFRMFIndex' INTEGER NOT NULL PRIMARY KEY,
	'CSFID' TEXT NOT NULL,
	'CSFSubcategoryIndex' INTEGER NOT NULL,
	'RMFID' TEXT NOT NULL,
	'RMFTaskIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_CSFRMF_CSFSubcategory' FOREIGN KEY ('CSFSubcategoryIndex') REFERENCES 'NIST-CSFSubcategory' ('CSFSubcategoryIndex') ON DELETE No Action ON UPDATE No Action,
	CONSTRAINT 'FK_CSFRMF_RMFTask' FOREIGN KEY ('RMFTaskIndex') REFERENCES 'NIST-RMFTask' ('RMFTaskIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-CSF-SP800-53'
(
	'CSFSP80053Index' INTEGER NOT NULL PRIMARY KEY,
	'CSFID' TEXT NOT NULL,
	'CSFSubcategoryIndex' INTEGER NOT NULL,
	'SP80053ID' TEXT NOT NULL,
	'SP80053ControlDetailIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_CSFSP80053CW_CSFSubcategory' FOREIGN KEY ('CSFSubcategoryIndex') REFERENCES 'NIST-CSFSubcategory' ('CSFSubcategoryIndex') ON DELETE Set Null ON UPDATE Cascade,
	CONSTRAINT 'FK_CSFSP80053CW_SP80053ControlDetail' FOREIGN KEY ('SP80053ControlDetailIndex') REFERENCES 'NIST-SP800-53ControlDetail' ('SP80053ControlDetailIndex') ON DELETE Set Null ON UPDATE Cascade
)
;

CREATE TABLE 'NIST-CSFSubcategory'
(
	'CSFSubcategoryIndex' INTEGER NOT NULL PRIMARY KEY,
	'CSFID' TEXT NOT NULL,
	'CSFSubcategoryID' INTEGER NOT NULL,
	'CSFSubcategoryDescription' TEXT NOT NULL,
	'CSFCategoryIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_CSFSubcategory_CSFCategory' FOREIGN KEY ('CSFCategoryIndex') REFERENCES 'NIST-CSFCategory' ('CSFCategoryIndex') ON DELETE Set Null ON UPDATE Cascade
)
;

CREATE TABLE 'NIST-PFCategory'
(
	'PFCategoryIndex' INTEGER NOT NULL PRIMARY KEY,
	'PFID' TEXT NOT NULL,
	'PFCategoryName' TEXT NOT NULL,
	'PFCategoryID' TEXT NOT NULL,
	'PFCategoryDescription' TEXT NOT NULL,
	'PFFunctionIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_PFCategory_PFFunction' FOREIGN KEY ('PFFunctionIndex') REFERENCES 'NIST-PFFunction' ('PFFunctionIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-PFFunction'
(
	'PFFunctionIndex' INTEGER NOT NULL PRIMARY KEY,
	'PFID' TEXT NOT NULL,
	'PFFunctionName' TEXT NOT NULL,
	'PFFunctionID' TEXT NOT NULL,
	'PFFunctionDescription' TEXT NOT NULL,
	'NISTPublicationIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_PFFunction_NISTPublication' FOREIGN KEY ('NISTPublicationIndex') REFERENCES 'NIST-Publication' ('NISTPublicationIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-PFSubcategory'
(
	'PFSubcategoryIndex' INTEGER NOT NULL PRIMARY KEY,
	'PFID' TEXT NOT NULL,
	'PFSubcategoryID' TEXT NOT NULL,
	'PFSubcategoryDescription' TEXT NOT NULL,
	'PFCategoryIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_PFSubcategory_PFCategory' FOREIGN KEY ('PFCategoryIndex') REFERENCES 'NIST-PFCategory' ('PFCategoryIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-Publication'
(
	'NISTPublicationIndex' INTEGER NOT NULL PRIMARY KEY,
	'NISTPublicationName' TEXT NOT NULL,
	'NISTPublicationID' TEXT NOT NULL
)
;

CREATE TABLE 'NIST-RMFStep'
(
	'RMFStepIndex' INTEGER NOT NULL PRIMARY KEY,
	'RMFID' TEXT NOT NULL,
	'RMFStepName' TEXT NOT NULL,
	'RMFStepID' INTEGER NOT NULL,
	'RMFStepDescription' TEXT NOT NULL,
	'NISTPublicationIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_RMFStep_NISTPublication' FOREIGN KEY ('NISTPublicationIndex') REFERENCES 'NIST-Publication' ('NISTPublicationIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-RMFTask'
(
	'RMFTaskIndex' INTEGER NOT NULL PRIMARY KEY,
	'RMFID' TEXT NOT NULL,
	'RMFTaskName' TEXT NOT NULL,
	'RMFTaskID' TEXT NOT NULL,
	'RMFTaskDescription' TEXT NOT NULL,
	'RMFTaskTier' TEXT NULL,
	'RMFStepIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_RMFTask_RMFStep' FOREIGN KEY ('RMFStepIndex') REFERENCES 'NIST-RMFStep' ('RMFStepIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-SP800-53Control'
(
	'SP80053ControlIndex' INTEGER NOT NULL PRIMARY KEY,
	'SP80053ID' TEXT NOT NULL,
	'SP80053ControlName' TEXT NOT NULL,
	'SP80053ControlID' INTEGER NOT NULL,
	'SP80053ControlFamilyIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_SP80053Control_SP80053ControlFamily' FOREIGN KEY ('SP80053ControlFamilyIndex') REFERENCES 'NIST-SP800-53ControlFamily' ('SP80053ControlFamilyIndex') ON DELETE Set Null ON UPDATE Cascade
)
;

CREATE TABLE 'NIST-SP800-53ControlClass'
(
	'SP80053ControlClassIndex' INTEGER NOT NULL PRIMARY KEY,
	'SP80053ControlClassName' TEXT NOT NULL,
	'SP80053ControlClassID' INTEGER NOT NULL,
	'NISTPublicationIndex' INTEGER NULL,
	CONSTRAINT 'FK_SP80053ControlClass_NISTPublication' FOREIGN KEY ('NISTPublicationIndex') REFERENCES 'NIST-Publication' ('NISTPublicationIndex') ON DELETE No Action ON UPDATE No Action
)
;

CREATE TABLE 'NIST-SP800-53ControlDetail'
(
	'SP80053ControlDetailIndex' INTEGER NOT NULL PRIMARY KEY,
	'SP80053ID' TEXT NOT NULL,
	'SP80053ControlDetailID' TEXT NOT NULL,
	'SP80053ControlDetailEnhancement' INTEGER NOT NULL,
	'SP80053ControlDetailEnhancementID' TEXT NULL,
	'SP80053ControlDetailEnhancementTitle' TEXT NULL,
	'SP80053ControlDetailShortTitle' TEXT NULL,
	'SP80053ControlDetailDescription' TEXT NOT NULL,
	'SP80053ControlDetailAssignment' TEXT NULL,
	'SP80053ControlDetailTier' TEXT NULL,
	'SP80053ControlDetailDesignation' TEXT NULL,
	'SP80053ControlDetailSupplementalGuidance' TEXT NULL,
	'SP80053ControlDetailReference' TEXT NULL,
	'SP80053ControlDetailPriority' INTEGER NULL,
	'SP80053ControlDetailAssurance' INTEGER NOT NULL,
	'SP80053ControlDetailBaselineLow' INTEGER NOT NULL,
	'SP80053ControlDetailBaselineMod' INTEGER NOT NULL,
	'SP80053ControlDetailBaselineHigh' INTEGER NOT NULL,
	'SP80053ControlIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_SP80053ControlDetail_SP80053Control' FOREIGN KEY ('SP80053ControlIndex') REFERENCES 'NIST-SP800-53Control' ('SP80053ControlIndex') ON DELETE Set Null ON UPDATE Cascade
)
;

CREATE TABLE 'NIST-SP800-53ControlFamily'
(
	'SP80053ControlFamilyIndex' INTEGER NOT NULL PRIMARY KEY,
	'SP80053ID' TEXT NOT NULL,
	'SP80053ControlFamilyName' TEXT NOT NULL,
	'SP80053ControlFamilyID' TEXT NOT NULL,
	'FIPS200MinReq' TEXT NULL,
	'SP80053ControlClassIndex' INTEGER NOT NULL,
	CONSTRAINT 'FK_SP80053ControlFamily_SP80053ControlClass' FOREIGN KEY ('SP80053ControlClassIndex') REFERENCES 'NIST-SP800-53ControlClass' ('SP80053ControlClassIndex') ON DELETE Set Null ON UPDATE Cascade
)
;

/* Create Indexes and Triggers */

CREATE INDEX 'IXFK_CSFCategory_CSFFunction'
 ON 'NIST-CSFCategory' ('CSFFunctionIndex' ASC)
;

CREATE INDEX 'IXFK_CSFFunction_NISTPublication'
 ON 'NIST-CSFFunction' ('NISTPublicationIndex' ASC)
;

CREATE INDEX 'IXFK_NIST-CSF-PF_NIST-CSFSubcategory'
 ON 'NIST-CSF-PF' ('CSFSubcategoryIndex' ASC)
;

CREATE INDEX 'IXFK_NIST-CSF-PF_NIST-PFSubcategory'
 ON 'NIST-CSF-PF' ('PFSubcategoryIndex' ASC)
;

CREATE INDEX 'IXFK_CSFRMF_CSFSubcategory'
 ON 'NIST-CSF-RMF' ('CSFSubcategoryIndex' ASC)
;

CREATE INDEX 'IXFK_CSFRMF_RMFTask'
 ON 'NIST-CSF-RMF' ('RMFTaskIndex' ASC)
;

CREATE INDEX 'IXFK_CSFSP80053CW_CSFSubcategory'
 ON 'NIST-CSF-SP800-53' ('CSFSubcategoryIndex' ASC)
;

CREATE INDEX 'IXFK_CSFSP80053CW_SP80053ControlDetail'
 ON 'NIST-CSF-SP800-53' ('SP80053ControlDetailIndex' ASC)
;

CREATE INDEX 'IXFK_CSFSubcategory_CSFCategory'
 ON 'NIST-CSFSubcategory' ('CSFCategoryIndex' ASC)
;

CREATE INDEX 'IXFK_NIST-CSFSubcategory_NIST-CSF-PF'
 ON 'NIST-CSFSubcategory' ('CSFSubcategoryIndex' ASC)
;

CREATE INDEX 'IXFK_PFCategory_PFFunction'
 ON 'NIST-PFCategory' ('PFFunctionIndex' ASC)
;

CREATE INDEX 'IXFK_PFFunction_NISTPublication'
 ON 'NIST-PFFunction' ('NISTPublicationIndex' ASC)
;

CREATE INDEX 'IXFK_NIST-PFSubcategory_NIST-CSF-PF'
 ON 'NIST-PFSubcategory' ('PFSubcategoryIndex' ASC)
;

CREATE INDEX 'IXFK_PFSubcategory_PFCategory'
 ON 'NIST-PFSubcategory' ('PFCategoryIndex' ASC)
;

CREATE INDEX 'IXFK_RMFStep_NISTPublication'
 ON 'NIST-RMFStep' ('NISTPublicationIndex' ASC)
;

CREATE INDEX 'IXFK_RMFTask_RMFStep'
 ON 'NIST-RMFTask' ('RMFStepIndex' ASC)
;

CREATE INDEX 'IXFK_SP80053Control_SP80053ControlFamily'
 ON 'NIST-SP800-53Control' ('SP80053ControlFamilyIndex' ASC)
;

CREATE INDEX 'IXFK_SP80053ControlClass_NISTPublication'
 ON 'NIST-SP800-53ControlClass' ('NISTPublicationIndex' ASC)
;

CREATE INDEX 'IXFK_SP80053ControlDetail_SP80053Control'
 ON 'NIST-SP800-53ControlDetail' ('SP80053ControlIndex' ASC)
;

CREATE INDEX 'IXFK_SP80053ControlFamily_SP80053ControlClass'
 ON 'NIST-SP800-53ControlFamily' ('SP80053ControlClassIndex' ASC)
;

/* Create Views */

CREATE VIEW 'CSFPFView' AS 
SELECT CSFID,
       CSFFunctionName,
       CSFFunctionDescription,
       CSFCategoryName,
       CSFCategoryDescription,
       CSFSubcategoryDescription,
       PFID,
       PFFunctionName,
       PFFunctionDescription,
       PFCategoryName,
       PFCategoryDescription,
       PFSubcategoryDescription
  FROM CSFView
       LEFT JOIN
       [NIST-CSF-PF] AS csfpf ON CSFView.CSFSubcategoryIndex = csfpf.CSFSubcategoryIndex
       LEFT JOIN
       PFView ON csfpf.PFSubcategoryIndex = PFView.PFSubcategoryIndex
;


CREATE VIEW 'CSFRMFView' AS 
SELECT CSFID,
       CSFFunctionName,
       CSFFunctionDescription,
       CSFCategoryName,
       CSFCategoryDescription,
       CSFSubcategoryDescription,
       RMFID,
       RMFStepName,
       RMFStepDescription,
       RMFTaskName,
       RMFTaskDescription,
       RMFTaskTier
  FROM CSFView
       LEFT JOIN
       [NIST-CSF-RMF] AS csfrmf ON CSFView.CSFSubcategoryIndex = csfrmf.CSFSubcategoryIndex
       LEFT JOIN
       RMFView ON csfrmf.RMFTaskIndex = RMFView.RMFTaskIndex
;


CREATE VIEW 'CSFSP80053RMFPFView' AS 
SELECT CSFView.CSFID,
       CSFFunctionName,
       CSFFunctionDescription,
       CSFCategoryName,
       CSFCategoryDescription,
       CSFSubcategoryDescription,
       SP80053View.SP80053ID,
       SP80053ControlFamilyName,
       FIPS200MinReq,
       SP80053ControlName,
       SP80053ControlDetailShortTitle,
       SP80053ControlDetailDescription,
       SP80053ControlDetailAssignment,
       SP80053ControlDetailDesignation,
       SP80053ControlDetailTier,
       SP80053ControlDetailPriority,
       SP80053ControlDetailBaselineLow,
       SP80053ControlDetailBaselineMod,
       SP80053ControlDetailBaselineHigh,
       RMFView.RMFID,
       RMFStepName,
       RMFStepDescription,
       RMFTaskName,
       RMFTaskDescription,
       PFView.PFID,
       PFFunctionName,
       PFFunctionDescription,
       PFCategoryName,
       PFCategoryDescription,
       PFSubcategoryDescription
  FROM CSFView
       LEFT JOIN
       [NIST-CSF-SP800-53] AS csfsp80053 ON CSFView.CSFSubcategoryIndex = csfsp80053.CSFSubcategoryIndex
       LEFT JOIN
       SP80053View ON csfsp80053.SP80053ControlDetailIndex = SP80053View.SP80053ControlDetailIndex
       LEFT JOIN
       [NIST-CSF-RMF] AS csfrmf ON CSFView.CSFSubcategoryIndex = csfrmf.CSFSubcategoryIndex
       LEFT JOIN
       RMFView ON csfrmf.RMFTaskIndex = RMFView.RMFTaskIndex
       LEFT JOIN
       [NIST-CSF-PF] AS csfpf ON CSFView.CSFSubcategoryIndex = csfpf.CSFSubcategoryIndex
       LEFT JOIN
       PFView ON csfpf.PFSubcategoryIndex = PFView.PFSubcategoryIndex
 ORDER BY SP80053ControlName
;


CREATE VIEW 'CSFSP80053View' AS 
SELECT CSFID,
       CSFFunctionName,
       CSFFunctionDescription,
       CSFCategoryName,
       CSFCategoryDescription,
       CSFSubcategoryDescription,
       SP80053ID,
       SP80053ControlFamilyName,
       FIPS200MinReq,
       SP80053ControlName,
       SP80053ControlDetailShortTitle,
       SP80053ControlDetailDescription,
       SP80053ControlDetailAssignment,
       SP80053ControlDetailDesignation,
       SP80053ControlDetailTier,
       SP80053ControlDetailPriority,
       SP80053ControlDetailBaselineLow,
       SP80053ControlDetailBaselineMod,
       SP80053ControlDetailBaselineHigh
  FROM CSFView
       LEFT JOIN
       [NIST-CSF-SP800-53] AS csfsp80053 ON CSFView.CSFSubcategoryIndex = csfsp80053.CSFSubcategoryIndex
       LEFT JOIN
       SP80053View ON csfsp80053.SP80053ControlDetailIndex = SP80053View.SP80053ControlDetailIndex
 ORDER BY SP80053ControlName
;


CREATE VIEW 'CSFView' AS 
SELECT subcategory.CSFSubcategoryIndex,
       subcategory.CSFID,
       CSFFunctionName,
       CSFFunctionDescription,
       CSFCategoryName,
       CSFCategoryDescription,
       CSFSubcategoryDescription
  FROM [NIST-CSFFunction] AS function
       INNER JOIN
       [NIST-CSFCategory] AS category ON function.CSFFunctionIndex = category.CSFFunctionIndex
       INNER JOIN
       [NIST-CSFSubcategory] AS subcategory ON category.CSFCategoryIndex = subcategory.CSFCategoryIndex
 ORDER BY function.CSFFunctionIndex,
          CSFCategoryName ASC
;


CREATE VIEW 'PFView' AS 
SELECT subcategory.CSFSubcategoryIndex,
       subcategory.CSFID,
       CSFFunctionName,
       CSFFunctionDescription,
       CSFCategoryName,
       CSFCategoryDescription,
       CSFSubcategoryDescription
  FROM [NIST-CSFFunction] AS function
       INNER JOIN
       [NIST-CSFCategory] AS category ON function.CSFFunctionIndex = category.CSFFunctionIndex
       INNER JOIN
       [NIST-CSFSubcategory] AS subcategory ON category.CSFCategoryIndex = subcategory.CSFCategoryIndex
 ORDER BY function.CSFFunctionIndex,
          CSFCategoryName ASC
;


CREATE VIEW 'RMFView' AS 
SELECT RMFTaskIndex,
       task.RMFID,
       RMFStepName,
       RMFStepDescription,
       RMFTaskName,
       RMFTaskDescription,
       RMFTaskTier
  FROM [NIST-RMFStep] AS step
       INNER JOIN
       [NIST-RMFTask] AS task ON step.RMFStepIndex = task.RMFStepIndex
;


CREATE VIEW 'SP80053View' AS 
SELECT SP80053ControlDetailIndex,
       detail.SP80053ID,
       SP80053ControlFamilyName,
       FIPS200MinReq,
       SP80053ControlName,
       detail.SP80053ControlDetailShortTitle,
       SP80053ControlDetailDescription,
       SP80053ControlDetailAssignment,
       SP80053ControlDetailDesignation,
       SP80053ControlDetailTier,
       SP80053ControlDetailPriority,
       SP80053ControlDetailBaselineLow,
       SP80053ControlDetailBaselineMod,
       SP80053ControlDetailBaselineHigh
  FROM [NIST-SP800-53ControlFamily] AS family
       INNER JOIN
       [NIST-SP800-53Control] AS control ON family.SP80053ControlFamilyIndex = control.SP80053ControlFamilyIndex
       INNER JOIN
       [NIST-SP800-53ControlDetail] AS detail ON control.SP80053ControlIndex = detail.SP80053ControlIndex
 ORDER BY SP80053ControlFamilyName,
          SP80053ControlName ASC
;
