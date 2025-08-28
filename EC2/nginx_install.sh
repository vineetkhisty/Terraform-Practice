# Create a script to install nginx on an EC2 instance
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Hello from Nginx on EC2" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx
sudo systemctl status nginx
# End of script