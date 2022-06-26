from get_json import *


def get_availability(token: str, latitude: float, longitude: float, country: str) -> dict:
    base: str = 'https://weatherkit.apple.com'
    path: str = f'/api/v1/availability/{latitude}/{longitude}?country={country}'
    url: str = base + path

    availability: dict = get_json(url=url, token=token)

    return availability
