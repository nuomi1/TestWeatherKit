import json
from http.client import *
from urllib.request import *


def get_json(url: str, token: str) -> dict:
    request: Request = Request(url=url)
    request.add_header(key='Authorization', val=f'Bearer {token}')

    response: HTTPResponse = urlopen(url=request)
    body: bytes = response.read()

    data: dict = json.loads(s=body)

    return data
