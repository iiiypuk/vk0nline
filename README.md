# service for set status online on vk.com
Скрипт для поддержания статуса __Онлайн__ в социальной сети Vk.com  
включает в себя `Python` скрипт `systemd` юнит.  
![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/asset/.preview.png)  

## Установка:
+ Активировать автоматический запуск сессии пользователя
```console
# Изменить параметр ReadWritePaths=/etc /run /var/lib/systemd/linger
nano /usr/lib/systemd/system/systemd-logind.service
# Перезапустить сервисы
systemctl daemon-reload
# Активировать пользователя
mkdir /var/lib/systemd/linger
loginctl enable-linger $USER
```

+ Скачать и запустить установщик
```console
curl -Lsk https://raw.githubusercontent.com/iiiypuk/vk0nline/master/install.sh | sh
```

+ Следовать инструкциям установщика
