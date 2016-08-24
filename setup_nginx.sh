et -e
source /webapp_build/buildconfig

header "Setting up NGINX"

run apt-get update
run apt-get install -y nginx

