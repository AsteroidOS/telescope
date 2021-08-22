# Telescope - Ubuntu Touch synchronization app for AsteroidOS

<img src="assets/icon.png" width="150" />

## Compatibility matrix

|               | Bass | Dory | Lenok | Sparrow | Smelt | Sturgeon |
| ------------- | ---- | ---- | ------- | ------- | ----- | -------- |
| arale         | ❗    | ❗    | ❔     | ❔       | ❔     | ❔        |
| bacon         | ✔️    | ❔    | ❔     | ❔       | ✔️     | ❔        |
| cancro        | ❔    | ❔    | ❔     | ❔       | ✔️     | ✔️        |
| hammerhead    | ✔️    | ❌    | ❔     | ✔️       | ❔     | ❔        |
| krillin       | ❔    | ❔    | ❔     | ❗       | ❔     | ❔        |
| mako          | ❔    | ❔    | ❔     | ❌       | ❔     | ❔        |
| turbo         | ✔️    | ✔️    | ❔     | ✔️       | ❔     | ❔        |
| pinephone     | ❔    | ✔️    | ✔️     | ❔       | ❔     | ✔️        |
| sargo         | ✔️    | ❔    | ❔     | ❔       | ❔     | ❔        |


| Symbol | meaning                  |
| ------ | ------------------------ |
|  ✔️     | Working fine             |
|  ❌     | Doesn't connect          |
|  ❗     | Looses connection        |
|  ❔     | No information available |

## How to get it

[![OpenStore](https://open-store.io/badges/en_US.png)](https://open-store.io/app/telescope.asteroidos)

Or build it yourself following instructions below.

## Translating

We are happy to receive any help with the translation. For this please use our [Weblate Webservice](https://hosted.weblate.org/projects/asteroidos/telescope/)

## Building the app

You need to checkout the submodule once:

    git submodule update --init --recursive

### Using clickable
To build and run the app on the desktop run:

```
clickable desktop
```
To build and install a click package for an armhf device:

```
clickable
```
To build and install a click package for an arm64 device:

```
clickable --arch=arm64
```

See [clickable documentation](http://clickable.bhdouglass.com/en/latest/) for details.


## Contributors

- Florent Revest (FlorentRevest)
- Florian Blasius (FloVanGH)
- Stefan Weng (StefWe)
