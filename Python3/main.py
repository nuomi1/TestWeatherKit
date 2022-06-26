from get_availability import *
from get_token import *
from get_weather import *

if __name__ == '__main__':
    token: str = get_token()

    country: str = 'US'
    language: str = 'en-US'
    latitude: float = 40.73061
    longitude: float = -73.935242

    availability: dict = get_availability(token=token, latitude=latitude, longitude=longitude, country=country)
    weather: dict = get_weather(token=token, language=language, latitude=latitude, longitude=longitude)

    print(availability)
    print(weather)
