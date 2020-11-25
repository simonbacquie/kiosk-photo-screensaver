# Kiosk Photo Screensaver

## Purpose

This is a simple rotating image slideshow app, meant to convert an old device you have lying around into a digital picture frame. Run it on a server, most likely one that's inside your home, and then load it up in a browser like Fully Kiosk Browser for Android.

## Setup

Ideally, you'll want to run this as a Docker container. If your server is already set up to run Ruby apps, you can do it that way too.

Drop your images into the `public/img` folder. It can be any type of image that's supported by modern browsers.

## Options

`MODE` - the order in which images are loaded. Can be `name` to order by filename, `created` to order by created timestamp, or `random` for a random order on each load. Default is `name.

`SORT` - an additional level of sorting, default is `asc` but can be changed to `desc` to reverse the order imposed by the `MODE` option

`STRETCH` - default is `fit` which stretches the image so that the entire image fits inside the frame, leaving some black space if the aspect ratio of the image doesn't match that of the device's screen - if you prefer to fill the whole screen and have some of the image hidden from view, use the `fill` option

`STOP_TIME` - the time to spend stopped to show an image, in milliseconds, default is `6000` for 6 seconds

`TRANSITION_TIME` - the time to spend fading between images, in milliseconds, default is `1000` for 1 second

These options can be set in the `env` file if using Docker, or at the command line if running through Ruby installed on your server.

## Run with Docker

Edit the `env` file with the options you want, then run:

```
docker build -t kiosk-photo-screensaver . && docker run -p 0.0.0.0:4567:4567/tcp --env-file env kiosk-photo-screensaver
```

## Run with Ruby

```
bundle install
MODE=RANDOM bundle exec rackup -p 4567
```
