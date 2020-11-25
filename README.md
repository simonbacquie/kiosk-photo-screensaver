docker build .
docker run -p 0.0.0.0:4567:4567/tcp 3cd2361e2288

docker build -t kiosk-photo-screensaver . && docker run -p 0.0.0.0:4567:4567/tcp --env-file env kiosk-photo-screensaver


## Options
- ORDER: alpha, reverse_alpha, random, creation_time, default: alphabetical
- stop_time
- transition_time
