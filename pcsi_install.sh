!#/bin/bash

echo "Backing up /var/www/html/index.php as /var/www/html/index.php.bak"
sudo cp /var/www/html/index.php /var/www/html/index.php.bak

python3 pcsi_setup.py
sudo rm /var/www/html/index.php
sudo cp index.new.php /var/www/html/index.php
sudo rm index.new.php
sudo mkdir /var/www/html/pcsi
sudo cp www/pcsi/index.php /var/www/html/pcsi/
sudo cp ~/direwolf.tnc.conf ~/direwolf.pcsi.conf
sudo cp services/pcsi.service /etc/systemd/system/
sudo systemctl daemon-reload

sudo apt install python3-opencv python3-tk python3-pil.imagetk
python3 -m pip install numpy imageio bitstring pylbfgs pyserial pillow
cd ~
git clone https://github.com/maqifrnswa/PCSI.git
