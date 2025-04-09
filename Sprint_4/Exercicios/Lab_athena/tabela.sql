    CREATE EXTERNAL TABLE IF NOT EXISTS `meubanco`.`nomes` (
      nome STRING,
      sexo STRING,
      total INT,
      ano INT
    )
    ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
    WITH SERDEPROPERTIES (
     'serialization.format' = ',',
     'field.delim' = ','
    )
    LOCATION 's3://exemplo.pb/dados/'
    TBLPROPERTIES ('skip.header.line.count'='1');