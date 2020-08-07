# NIST Crosswalks

The NIST Cybersecurity Framework (CSF) and Security and Privacy Controls (SP 800-53 Rev. 4) lend themselves pretty well to a relational data model.
So, to have more flexibility than the xlsx NIST puts out, I laid them out *(with some interpretation, mind you)* and imported them.


## Cybersecurity Framework Core (CSF) to 
## Security and Privacy Controls (SP 800-53 Rev. 4) Crosswalk

The CSF-SP800-53 folder contains the DB for the crosswalk.  Included are the SQL queries to create the tables and view,
as well as the data used for mapping.  The source data for each of the documents is in the repsective folders.  (See below.)

![CSF to SP 800-53 Data Model](/images/CSF-SP800-53.gif)


## Cybersecurity Framework Core (CSF)

An separate DB is available just for the CSF.  Included are the SQL queries to create the tables and view, 
along with the original data.  (These are the source files - minus the DB - for the top level NIST-Crosswalk DB.)

![CSF Data Model](/images/CSF.gif)


## Security and Privacy Controls SP 800-53 (Rev. 4)

An separate DB is available just for SP 800-53 (Rev. 4).  Included are the SQL queries to create the tables and view, 
along with the original data.  (These are the source files - minus the DB - for the top level NIST-Crosswalk DB.)

![SP 800-53 Data Model](/images/SP800-53.gif)



