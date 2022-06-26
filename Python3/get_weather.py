from get_json import *


def get_weather(token: str, language: str, latitude: float, longitude: float) -> dict:
    datasets: list = ['currentWeather', 'forecastDaily', 'forecastHourly', 'forecastNextHour', 'weatherAlerts']
    datasets_para = ','.join(datasets)

    base: str = 'https://weatherkit.apple.com'
    path: str = f'/api/v1/weather/{language}/{latitude}/{longitude}?dataSets={datasets_para}'
    url: str = base + path

    weather: dict = get_json(url=url, token=token)

    return weather
