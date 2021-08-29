# vk0nline
Утилита для поддержания статуса __Онлайн__ в социальной сети Vk.com.

Включает в себя `systemd` юнит.

![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/.preview.png)

## Установка
Активировать автоматический запуск сессии пользователя
```bash
# Изменить параметр ReadWritePaths=/etc /run /var/lib/systemd/linger
nano /usr/lib/systemd/system/systemd-logind.service
# Перезапустить сервисы
systemctl daemon-reload
# Активировать пользователя
mkdir /var/lib/systemd/linger
loginctl enable-linger $USER

Подготавливаем рабочую директорию
mkdir -p /home/$USER/.local/share/emilecok/vk0nline/
wget https://github.com/iiiypuk/vk0nline/blob/master/config.json.example -O /home/$USER/.local/share/emilecok/vk0nline/config.json
wget $BINARY -O /home/$USER/.local/share/emilecok/vk0nline/vk0nline.x86_64-lnx
chmod +x /home/$USER/.local/share/emilecok/vk0nline/vk0nline.x86_64-lnx

# Заполняем конфигурационный файл, поля appID и userIds
vi /home/$USER/.local/share/emilecok/vk0nline/config.json

# Запускаем, получаем accessToken и запускаем ещё раз
/home/$USER/.local/share/emilecok/vk0nline/vk0nline.x86_64-lnx
```

## Systemd
```bash
...
```
