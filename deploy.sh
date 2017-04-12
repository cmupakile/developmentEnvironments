# pull down new code
cd ~/developmentEnvironments
git pull
berks vendor cookbooks
sudo chef-client --local-mode --runlist 'recipe[node-server]'


cd ~/app
git pull
sudo npm install
pm2 restart app
