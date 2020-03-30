#!/usr/bin/env python3

import json
import requests
from datetime import datetime
import getpass


__author__ = 'Alexander Popov'
__copyright__ = '2019 by iiiypuk'
__credits__ = ['Alexander Popov']
__license__ = 'Unlicense'
__version__ = '1.0.2'
__maintainer__ = 'Alexander Popov'
__email__ = 'iiiypuk@fastmail.fm'
__status__ = 'Production'

username = getpass.getuser()
with open('/home/{user}/.config/emilecok/vk0nline/config.json'
          .format(user=getpass.getuser()), 'r', encoding='utf-8') as f:
    _C = json.load(f)


def getStatus():
    response = requests.get('https://api.vk.com/method/users.get?'
                            'fields=online,last_seen&v=5.95'
                            '&access_token={key}&user_ids={user}'
                            .format(key=_C['serviceKey'], user=_C['clientId']))
    userLoginTime = json.loads(response.content.decode('utf-8'))
    userLoginTime = userLoginTime['response'][0]['last_seen']['time']
    userOnline = json.loads(response.content.decode('utf-8'))
    userOnline = userOnline['response'][0]['online']

    return([userOnline, userLoginTime])


def setOnline():
    response = requests.get('https://api.vk.com/method/account.setOnline?'
                            'voip=0&v=5.95&access_token={key}&user_ids={user}'
                            .format(user=_C['clientId'],
                                    key=_C['accessToken']))
    content = json.loads(response.content.decode('utf-8'))

    if 'error' in content:
        # User authorization failed
        if 5 == content['error']['error_code']:
            print('User authorization failed.\n',
                  'Open this link in browser, and copy access token.')
            print('https://oauth.vk.com/authorize?client_id={appid}'
                  '&redirect_uri=vk.com&display=mobile&response_type=token'
                  '&v=5.95&revoke=1&state=01010&scope=offline'
                  .format(appid=_C['clientId']))
        else:
            print('Error: {}.'.format(content['error']['error_code']))
    elif 'response' in content:
        if 1 == content['response']:
            print('Ok!')
            onlineStatus, lastSeen = getStatus()
            lastSeen = datetime.fromtimestamp(lastSeen) \
                .strftime('%Y-%m-%d %H:%M:%S')
            print(onlineStatus, lastSeen)


if __name__ == "__main__":
    setOnline()
