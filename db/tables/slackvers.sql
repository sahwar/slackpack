CREATE TABLE slackvers (
  id        INT(10) UNSIGNED  NOT NULL,
  `name`    VARCHAR(30)       NOT NULL              COMMENT 'Descriptive version name',
  released  DATE                       DEFAULT NULL COMMENT 'Release date',
  def       ENUM('no','yes')  NOT NULL DEFAULT 'no' COMMENT 'Whether this version should be preselected in GUI elements such combos',
  packages  INT(10) UNSIGNED  NOT NULL DEFAULT '0'  COMMENT 'Number of the packages for this Slackware version',
  `str`     VARCHAR(10)       NOT NULL              COMMENT 'Version as a string',

  PRIMARY KEY  (id),

  KEY idx_released (released) USING BTREE,
  KEY idx_name (`name`) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COMMENT='Slackware Versions';

