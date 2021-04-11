# currency-database-data

This is a database of all currencies utilized by all countries in the world. The currencies follow ISO 4217 standard and countries follow ISO 3166 standard. All data were extracted from [ISO Organization](https://www.iso.org/).

### Built with
* [Sql/MySql](https://www.mysql.com/)

## Database structure

This database contains three tables: currency, country, country_has_currency. Each one of those tables is described in the sections below.

### Table currency

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `id_iso4217`          | INT(11)         | The unique identifier used by ISO 4217.                                                                                      |
| `code_iso4217`        | VARCHAR(3)      | The alphabetic code representation for currency.                                                                             |
| `symbol`              | VARCHAR(16)     | The symbol representation for currency.                                                                                      |
| `name`                | VARCHAR(255)    | The currency name.                                                                                                           |
| `obsolete`            | BIT(1)          | The indicator to currency obsolete. Default 0 for non-obsolete and 1 to obsolete.                                            |

### Table country

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `id_iso3166`          | INT(11)         | The unique identifier used by ISO 3166.                                                                                      |
| `name`                | VARCHAR(255)    | The country name                                                                                                             |
| `code_alpha2`         | VARCHAR(2)      | The alpha-2 code.                                                                                                            |
| `code_alpha3`         | VARCHAR(3)      | The alpha-3 code.                                                                                                            |

### Table country_has_currency

| Field name            | Field Type      | Description                                                                                                                  | 
|-----------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| `country_id_iso3166`  | INT(11)         | The foreign key for the country.                                                                                             |
| `currency_id_iso4217` | INT(11)         | The foreign key for the currency.                                                                                            |


## Getting started

To get a local copy up and running follow these simple steps.

### Prerequisites

Make sure you have MySQL Community Server 5.7 installed in your development environment.

### Clone the repository
```
git clone https://github.com/tiagogiantini/currency-database-data.git
```

### Create database
```sql
create database your_dabase_name character set UTF8;
```

### Create tables

Just execute the following script.

```
./src/create_tables.sql
```

### Load data

Execute scripts in the following order.  

```
./src/data/data_country.sql
./src/data/data_currency.sql
./src/data/data_country_has_currency.sql
```

## Acknowledgements
* [ISO](https://www.iso.org/)
