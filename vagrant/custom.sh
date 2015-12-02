# Your custom stuff here.
echo "Linking: /home/vagrant/$1 to: /$1"
sudo rm /$1
sudo ln -s /home/vagrant/$1 /$1
sudo ln -s /home/vagrant/$1 /railsapp

echo "SETTING UP POSTGRES USER INSTALL"
sudo su --login postgres --command "createuser -D -A vagrant"
sudo su --login postgres --command "psql -c 'ALTER ROLE vagrant CREATEDB'"

echo "RUNNING BUNDLE INSTALL"
cd /home/vagrant/$1
bundle install
rake db:setup

echo "SETTING UP NGINX PROXY"
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/nginx
sudo rm /etc/nginx/sites-available/nginx
sudo ln -s /home/vagrant/$1/vagrant/config/nginx /etc/nginx/sites-enabled/nginx
sudo ln -s /home/vagrant/$1/vagrant/config/nginx /etc/nginx/sites-available/nginx
sudo service nginx restart

