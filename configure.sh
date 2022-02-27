#!/bin/bash
apt update
apt -y install sks nginx
sks build
chown -Rc debian-sks:debian-sks /var/lib/sks/DB
echo '# Empty - Do not communicate with other keyservers.' > /etc/sks/mailsync
echo '# Empty - Do not communicate with other keyservers.' > /etc/sks/membership
systemctl enable sks
systemctl start sks
cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;
    location / {
        proxy_pass http://127.0.0.1:11371;
    }
}
EOF
systemctl restart nginx
