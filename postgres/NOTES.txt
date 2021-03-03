# install
sudo apt update
sudo apt install postgresql postgresql-contrib

# start, stop, status
sudo service postgresql status
sudo service postgresql start
sudo service postgresql stop

# need to set password for postgres user
sudo passwd postgres

# start postgres shell
sudo -u postgres psql

# psql - list users
\du

# psql - list databases
\list
\l

# psql - switch databases
\connect
\c {database}

# psql - list tables
\dt
