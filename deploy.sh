# pull down new code
cd ~/developmentEnvironments
git pull
berks vendor cookbooks
sudo chef-client --local-mode --runlist 'recipe[node-server]'

# initial
cd ~/app
git pull
sudo npm install
pm2 restart app
pm2 stop app
pm2 start app.js
