# Weatherbird

Simple application to tweet a message about a city weather.  
Get weather info from [Openweathermap API](https://openweathermap.org/api) and utilize [Twitter API](https://developer.twitter.com/) to post the message.  

## Requirements
* ruby >= 2.6
* rails >= 5

## API
This application expose an API with a unique endpoint to tweet a message with a city weather info.
| Endpoint | Method|
|----------|:-----:|
| /weather | POST  |

###  Usage example
```
curl -XPOST localhost:3000/weather \
-H 'content-type: application/json' \
-d '{"city_id": "3467865"}
```

## Configuration
This application need API keys to authenticate in Open Weather Map and Twitter APIs.  
The following env vars are required for running the application:
```
OWM_API_KEY=<your_openweathermap_api_key>
TWITTER_CONSUMER_KEY=<your_twitter_consumer_key>
TWITTER_CONSUMER_SECRET=<your_twitter_consumer_secret>
TWITTER_ACCESS_TOKEN=<your_twitter_access_token>
TWITTER_ACCESS_TOKEN_SECRET=<your_twitter_access_token_secret>
```

## Deployment instructions
Clone this repo locally.  
Its contains a Dockerfile and docker-compose.yml to easy deploy the application.
```
$ docker-compose up
```
This will spin up the application in a container listening on host `0.0.0.0:3000`

Also you could either build the image and push for your preferable registry.
```
$ docker build -t my/weatherbird .
```
