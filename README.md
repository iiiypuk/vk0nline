# Будь __ОНЛАЙН__ в контакте.

## Установка

Подготовка рабочей директории:
```bash
mkdir -p /home/$USER/.local/share/emilecok/vk0nline
cd /home/$USER/.local/share/emilecok/vk0nline
wget https://github.com/iiiypuk/vk0nline/releases/download/2.0.0/vk0nline-2.0.0.linux-x86_64

# Заполняем конфигурационный файл, поля appID и userIds
cp config.json.example config.json
vi config.json

# Запускаем, получаем accessToken и запускаем ещё раз
./vk0nline*
```

## Systemd
Активируем автоматический запуск сессии пользователя:
```bash
# Изменить параметр ReadWritePaths=/etc /run /var/lib/systemd/linger
nano /usr/lib/systemd/system/systemd-logind.service

# Перезапустить сервисы
systemctl daemon-reload

# Активировать пользователя
mkdir /var/lib/systemd/linger
loginctl enable-linger $USER
```

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

