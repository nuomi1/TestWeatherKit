import time

import jwt


def get_token() -> str:
    iss: str = 'CUSTOM_TEAM_ID'
    iat: int = int(time.time())
    exp: int = iat + 60 * 60 * 24 * 7
    sub: str = 'CUSTOM_SERVICE_ID|CUSTOM_APP_ID'

    payload: dict = {'iss': iss, 'iat': iat, 'exp': exp, 'sub': sub}

    alg: str = 'ES256'
    kid: str = 'CUSTOM_KEY_ID'
    id: str = f'{iss}.{sub}'

    headers: dict = {'alg': alg, 'kid': kid, 'id': id}

    p8: str = open(file='CUSTOM_P8_FILE').read()

    token: str = jwt.encode(payload=payload, key=p8, algorithm=alg, headers=headers)

    return token
