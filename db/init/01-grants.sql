CREATE DATABASE IF NOT EXISTS rails_comunity_production;
CREATE DATABASE IF NOT EXISTS rails_comunity_production_cache;
CREATE DATABASE IF NOT EXISTS rails_comunity_production_queue;
CREATE DATABASE IF NOT EXISTS rails_comunity_production_cable;

CREATE USER IF NOT EXISTS 'rails_comunity'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON *.* TO 'rails_comunity'@'%';

FLUSH PRIVILEGES;