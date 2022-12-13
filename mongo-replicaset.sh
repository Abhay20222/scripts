#Configuring DNS Resolution
sudo vi /etc/hosts   # open the file and paste private ip of all 3 instance

#  Enabling Replication in Each Server’s MongoDB Configuration File

sudo nano /etc/mongod.conf
edit bindIP

/*  security:
    authorization: enabled
    keyFile: /etc/key
    transitionToAuth: true
*/
replication:
  replSetName: rs0


# run the below command to genrate key  run as a root user
sudo openssl rand -base64 756 > /etc/key
sudo chmod 400 /etc/key
sudo chown mongodb:mongodb /etc/key
# connect mongo 
mongo 
rs.initiate()
rs.add('db-node1:27017')	
rs.add('db-node2:27017')
rs.status()
show dbs

# take the reference of below blowogs
https://medium.com/@ratulbasak93/mongodb-relication-in-ubuntu-16-04-acd5baf744a3
https://www.digitalocean.com/community/tutorials/how-to-configure-a-mongodb-replica-set-on-ubuntu-20-04
https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-20-04
