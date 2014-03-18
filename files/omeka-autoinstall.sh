 #!/bin/bash         

echo "Begining Omeka Install"
cd ~/
#From Omeka Docs 
sudo wget http://omeka.org/files/omeka-2.0.zip
unzip omeka-2.0.zip

sudo mv omeka-2.0/* /vagrant/webroot/
sudo mv omeka-2.0/.htaccess /vagrant/webroot/
#End Omeka Docs Snippet
rootpw=d3v0p5

echo -n "Enter database username: "
read dbuser
echo -n "Enter database user password: "
read dbpw

#From Omeka Docs 
sudo groupadd webdev
sudo usermod -a -G webdev vagrant
cd /var
sudo chown -R root.webdev www

sudo chmod 775 www
cd /var/www 
sudo find . -type d | xargs sudo chmod 775
sudo find . -type f | xargs sudo chmod 664
sudo find files -type d | xargs sudo chmod 777
sudo find files -type f | xargs sudo chmod 666
#End Omeka Docs Snippet


db="create database omeka;GRANT ALL PRIVILEGES ON omeka.* TO '$dbuser'@'localhost' IDENTIFIED BY '$dbpw';FLUSH PRIVILEGES;"
mysql -u root -p"$rootpw" -e "$db"
 
if [ $? != "0" ]; then
 echo "[Error]: Database creation failed"
 exit 1
else
 echo "------------------------------------------"
 echo " Database has been created successfully "
 echo "------------------------------------------"
 echo " DB Info: "
 echo ""
 echo " DB Name: omeka"
 echo " DB User: $dbuser"
 echo " DB Pass: $dbpw"
 echo ""
 echo "------------------------------------------"
fi

echo ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Database Configuration File ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Omeka requires MySQL 5 or newer.
;
; To configure your database, replace the X's with your specific
; settings. If you're unsure about your database information, ask
; your server administrator, or consult the documentation at
; <http://omeka.org/codex/Database_Configuration_File>.

[database]
host     = \"localhost\"
username = \"$dbuser\"
password = \"$dbpw\"
dbname   = \"omeka\"
prefix   = \"omeka_\"
charset  = \"utf8\"
;port     = \"\"" >/vagrant/webroot/db.ini

#Omeka Docs Snippet
echo "
# Enable mod_rewrite
<IfModule mod_rewrite.c>
RewriteEngine On
</IfModule>">>/etc/apache2/apache2.conf
#End Omeka Docs Snippet

