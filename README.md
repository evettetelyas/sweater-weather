# SweaterWeather
solo project by Evette Telyas

## Endpoints
### Root
`sweataweatha.herokuapp.com`

### Local Forecast
returns local forcast at a given location

`GET /api/v1/forecast?location=denver,co`

### Background Image
returns an image from a given location

`GET /api/v1/backgrounds?location=denver,co`

### Create a User
creates a user and returns a unique API key

`POST /api/v1/users`

request body example:
```
  {
   "email": "whatever@example.com",
   "password": "password",
   "password_confirmation": "password"
   }
```

response body example:
```
{
    "api_key": "sample_api_key"
}
```

### Login User
Logs in an existing user and returns their api key

`POST /api/v1/sessions`

request body example:
```
  {
   "email": "whatever@example.com",
   "password": "password",
   }
```

response body example:
```
{
    "api_key": "sample_api_key"
}
```

### Road Trip
returns the local forecast at destination and length of travel

request body example:
```
  {
    origin: "Denver,CO",
    destination: "Aspen,CO",
    api_key: "YOUR_API_KEY"
   }
```

response body example:
```
{
    "data": {
        "id": "623d3f7c969042f1",
        "type": "road_trip",
        "attributes": {
            "id": "623d3f7c969042f1",
            "arrival_forecast": {
                "id": "12dd376e71f4713b",
                "temp": 55.93,
                "time": 1573765200,
                "timezone": "America/Denver",
                "formatted_time": " 2 PM"
            },
            "origin": "Denver,CO",
            "destination": "Aspen,CO",
            "approx_hours_to_destination": 4
        }
    }
}
```


## local setup
```
$ git clone
$ bundle install
$ rake db:create
$ rake db:migrate
$ bundle exec figaro install
```

_to application.yml_
```
GOOGLE_API_KEY: 
DARKSKY_API_KEY: 
FLICKR_API_KEY: 
FLICKR_SECRET: 
ANTIPODE_API_KEY: oscar_the_grouch
```

_testing_
```
$ bundle exec rspec
```
