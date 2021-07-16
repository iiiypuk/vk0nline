# vk0nline
Утилита для поддержания статуса __Онлайн__ в социальной сети Vk.com.

Включает в себя `systemd` юнит.

![preview](https://raw.githubusercontent.com/iiiypuk/vk0nline/master/asset/.preview.png)

## Установка
Активировать автоматический запуск сессии пользователя
```console
# Изменить параметр ReadWritePaths=/etc /run /var/lib/systemd/linger
nano /usr/lib/systemd/system/systemd-logind.service
# Перезапустить сервисы
systemctl daemon-reload
# Активировать пользователя
mkdir /var/lib/systemd/linger
loginctl enable-linger $USER
```

Скачать и запустить установщик:
```console
curl -Lsk https://raw.githubusercontent.com/iiiypuk/vk0nline/master/install.sh | sh
```

Следовать инструкциям установщика.

## Использование
* Скачать исполняемый файл программы
* Заполнить `appID` и `userIds` в `config.json`
* Запустить программу `vk0nline` и получить `accessToken`

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/src/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Alexander Popov](https://github.com/iiiypuk) - creator and maintainer
