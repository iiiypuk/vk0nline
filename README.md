# vk.com set online status service
Набор инструментов для поддержания твоего статуса в социальной сети Vk.com __"Онлайн"__  
![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/.preview.png)  
Набор включает в себя скрипт на `Python` и юнит `systemd`.

## Установка:
+ Скачать и распаковать набор инструметов, например в `/home/user_name/.vk0nline`  
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
+ Активируем и запускаем скрипт:
```
systemctl start vk0nline.service --user
systemctl enable vk0nline.timer --user
systemctl start vk0nline.timer --user
```
