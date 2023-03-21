/*SQL code notes*/
/*
SELECT * FROM table;
'string'
*/

/*
CREATE DATABASE test;
DROP DATABASE test; 
//DROP DATABASE is never used
*/

CREATE DATABASE record_company;
USE record_company;

CREATE TABLE test(
	test_column INT
);
ALTER TABLE test
ADD another_column VARCHAR(255);
/*SQL does not care about line breaks here*/

DROP TABLE test;
