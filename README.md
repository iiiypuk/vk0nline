
# vk.com set online status service
Набор скриптов для поддержания статуса __Онлайн__ в социальной сети Vk.com  
![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/.preview.png)  
Набор включает в себя скрипт на `Python` и юнит для `systemd`.

## Установка:
+ Скачать и распаковать набор скриптов, например в `/home/$USER/.vk0nline`
+ Создать директорию для юнитов systemd: `mkdir -p ~/.config/systemd/user` 
и перейти в неё: `cd ~/.config/systemd/user`
+ Сделать символические ссылки на сервис и таймер:
```
ln -s /home/user_name/.vk0nline/systemd/user/vk0nline.service .
ln -s /home/user_name/.vk0nline/systemd/user/vk0nline.timer .
```
+ Изменить настройки скрипта и сделать его исполняемым:
```
cd ~/.vk0nline/
mv config.json.example config.json
chmod 755 ./vk0nline.py
edit config.json
```
+ Прописать полный путь к файлу конфигурации в скрипте:
```python
# EDIT IT
with open('./config.json', 'r', encoding='utf-8') as f:
```
+ Прописать полный путь к файлу скрипта в сервисе systemd:  
`edit ~/.config/systemd/user/vk0nline.service`  
`ExecStart=/full/path/to/vk0nline.py`  
+ Активируем автоматический запуск сессии пользователя
```
# Изменить параметр ReadWritePaths=/etc /run /var/lib/systemd/linger
nano /usr/lib/systemd/system/systemd-logind.service
# Перезапустить сервисы
systemctl daemon-reload
# Активировать пользователя
mkdir /var/lib/systemd/linger
loginctl enable-linger $USER
```
+ Активируем и запускаем скрипт:
```
systemctl start vk0nline.{service,timer} --user
systemctl enable vk0nline.{service,timer} --user
```
