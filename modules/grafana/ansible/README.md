# Playbook to deploy and configure Grafana

This ansible playbook will configure grafana on Ubuntu, CentOS and Amazon Linux

## Key Parameters
### Role Grafana
* `grafana_port` Port to run grafana on. Defaults to `3000`
* `grafana_domanin` Base URL for Grafana. Defaults to `grafana.example.com`
* `grafana_db_type` Database type of Grafana. Defaults to `postgres`. The value can be `sqllite3`, `postgres` and `mysql`. Value has to be `postgres` or `mysql` to run in HA
* `grafana_db_host` Database host for Grafana. Defaults to `127.0.0.1`
* `grafana_db_port` Database connection port. Defaults to `5432`
* `grafana_db_name` Database name to connect to. Defaults to `grafana`
* `grafana_db_user` Database username for connecting to the database. Defaults to `grafanauser`
* `grafana_db_password` Password for the database. Default it generates a 10 string password.
* `grafana_enable_sql_logging` Change to true if you want to enable SQL Logging. Default is set as `false`
* `grafana_secret_key` Encryption key for grafana. Default: it generates a random string
* `grafana_default_password` Default password for the admin user. Default: it generates a random string

## Running the playbook. 

### Prerequisites
* You have already provisioned a postgresql database open on port 5432 and have the following details handy 
  * FQDN of the datbase
  * Database User
  * Databas Name
  * Database password
* You have access to a linux machine which can ssh your servers.
* You have installed Ansile on you linux machine that will run ansible
* The SSH user has to have access to `NOPASSWD:ALL` permissions to manage the server. 
### Steps
1. create a group_vars directory
```
mkdir group_vars
```

2. Create a file named `group_vars/all` with the contents below. 
```
vim group_vars/all
```
```
grafana_domanin: <Base URL of Grafana>
grafana_db_host: <FQDN of the database>
grafana_db_name: <Name of the database>
grafana_db_user: <Name of the database user>
grafana_db_password: <Database password provided by the DB admin>
```
3. Create a hosts file with the following content
```
vim hosts
```
```
<hostname 1> ansible_host=<IP of host 1> ansible_user=<SSH user for host 1> ansible_ssh_private_key_file=<path to private key>
<hostname 2> ansible_host=<IP of host 2> ansible_user=<SSH user for host 2> ansible_ssh_private_key_file=<path to private key>
<hostname 3> ansible_host=<IP of host 3> ansible_user=<SSH user for host 3> ansible_ssh_private_key_file=<path to private key>
```

3. Run the playbook
```
ansible-playbook -i hosts playbook.yml
```
