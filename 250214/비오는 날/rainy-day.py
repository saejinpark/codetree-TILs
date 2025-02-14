n = int(input())
date = []
day = []
weather = []

for _ in range(n):
    d, dy, w = input().split()
    date.append(d)
    day.append(dy)
    weather.append(w)

# Write your code here!
class weather_data:
    
    def __init__(self, date, day, weather):
        self.date = date
        self.day = day
        self.weather = weather

    def __str__(self):
        return f"{self.date} {self.day} {self.weather}"

weather_datas = []

for i in range(n):
    weather_datas.append(weather_data(date[i], day[i], weather[i]))

rain_weather_datas = list(filter(lambda x: x.weather == "Rain", weather_datas))

sorted_rain_weather_datas = sorted(rain_weather_datas, key=lambda x: x.date)

print(sorted_rain_weather_datas[0])