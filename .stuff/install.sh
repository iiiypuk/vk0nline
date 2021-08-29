#!/bin/sh

# Prepating installation
mkdir -p /home/$USER/.local/share/emilecok/vk0nline
mkdir -p /home/$USER/.config/emilecok/vk0nline

if [ -x "$(command -v git)" ]; then
    echo Installing distribution via Git...

    git clone https://github.com/iiiypuk/vk0nline.git --depth 1 /home/$USER/.local/share/emilecok/vk0nline &> /dev/null
elif [ -x "$(command -v unzip)" ]; then
    echo Installing distribution via zip file...

    cd /home/$USER/.local/share/emilecok/vk0nline
    curl -LsOk https://github.com/iiiypuk/vk0nline/archive/master.zip
    unzip master.zip
    mv vk0nline-master vk0nline
else
    echo Git 
fi

cd /home/$USER/.local/share/emilecok/vk0nline
sed -i "s/USERNAME/$USER/" ./systemd/user/vk0nline.service &> /dev/null
chmod 755 ./vk0nline.py
cp -p ./config.json.example /home/$USER/.config/emilecok/vk0nline/config.json &> /dev/null

echo Installing systemd services...
mkdir -p /home/$USER/.config/systemd/user

cd /home/$USER/.config/systemd/user
ln -s /home/$USER/.local/share/emilecok/vk0nline/systemd/user/vk0nline.service . &> /dev/null
ln -s /home/$USER/.local/share/emilecok/vk0nline/systemd/user/vk0nline.timer . &> /dev/null

echo Installation complete.
echo
echo Start script, authorize and save access token
echo :: python /home/$USER/.local/share/emilecok/vk0nline/vk0nline.py
echo 
echo Edit configuration file
echo :: by /home/$USER/.config/emilecok/vk0nline/config.json
echo
echo And start \& activate systemd services
echo :: systemctl start vk0nline.\{service,timer\} --user
echo :: systemctl enable vk0nline.\{service,timer\} --user
