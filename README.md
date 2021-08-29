Утилита для поддержания статуса __Онлайн__ в социальной сети Vk.com.

Бонус: `systemd` юнит.

![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/.stuff/.preview.png)

## Установка
Активировать автоматический запуск сессии пользователя, если будет использоваться **systemd**
```bash
# Изменить параметр ReadWritePaths=/etc /run /var/lib/systemd/linger
nano /usr/lib/systemd/system/systemd-logind.service

# Перезапустить сервисы
systemctl daemon-reload

# Активировать пользователя
mkdir /var/lib/systemd/linger
loginctl enable-linger $USER
```

Подготовка рабочей директории
```bash
mkdir -p /home/$USER/.local/share/emilecok/
cd /home/$USER/.local/share/emilecok/
wget https://github.com/iiiypuk/vk0nline/releases/download/2.0.0/vk0nline-2.0.0-x86-64.tar.xz
tar -xf vk0nline-*.tar.xz
cd vk0nline/

# Заполняем конфигурационный файл, поля appID и userIds
cp config.json.example config.json
vi config.json

# Запускаем, получаем accessToken и запускаем ещё раз
./vk0nline.x86_64-lnx
```

Systemd
```bash
# Правим имя пользователя в сервисе
sed -i "s/USERNAME/$USER/" ./systemd/user/vk0nline.service &> /dev/null

mkdir -p /home/$USER/.config/systemd/user &> /dev/null
cd /home/$USER/.config/systemd/user

ln -s /home/$USER/.local/share/emilecok/vk0nline/systemd/user/vk0nline.service . &> /dev/null
ln -s /home/$USER/.local/share/emilecok/vk0nline/systemd/user/vk0nline.timer . &> /dev/null

# Запуск и активация сервисов
systemctl start vk0nline.\{service,timer\} --user
systemctl enable vk0nline.\{service,timer\} --user
```
