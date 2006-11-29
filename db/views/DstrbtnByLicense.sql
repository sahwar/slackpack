CREATE OR REPLACE VIEW DstrbtnByLicense AS
SELECT `name`   AS `Name`,
       packages AS Packages,
       ROUND((packages * 100) /
             (SELECT COUNT(0) FROM packages),
             2) AS Percent
  FROM licenses
 ORDER BY `name`;

