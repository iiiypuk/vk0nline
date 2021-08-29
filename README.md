# vk0nline
Утилита для поддержания статуса __Онлайн__ в социальной сети Vk.com.

Включает в себя `systemd` юнит.

![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/.preview.png)

## Установка
Активировать автоматический запуск сессии пользователя, если будет использовться **systemd**
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
...
```
