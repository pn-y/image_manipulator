# README
## Requirements:
docker 18+
docker-compose 1.22+
## Gettting started
To build image: docker-compose build

To start project: docker-compose up

To run tests docker-compose run --rm web bin/rails test

To use endpoint
```
curl -X POST http://localhost:3000/image_manipulation -F image='@PATH_TO_IMAGE' -F 'manipulations[rotate]=-90'
```
