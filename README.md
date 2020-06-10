# Telescope - Ubuntu Touch synchronization app for AsteroidOS

<img src="assets/icon.png" width="150" />

## Compatibility matrix

|               | Bass | Dory | Sparrow |
| ------------- | ---- | ---- | ------- |
| arale         | ❗    | ❗    | ❓       |
| hammerhead    | ✔️    | ❌    | ✔️       |
| krillin       | ❓    | ❓    | ❗       |
| mako          | ❓    | ❓    | ❌       |
| turbo         | ✔️    | ✔️    | ✔️       |


| Symbol | meaning                  |
| ------ | ------------------------ |
|  ✔️     | Working fine             |
|  ❌     | Doesn't connect          |
|  ❗     | Looses connection        |
|  ❓     | No information available |

## How to get it

[![OpenStore](https://open-store.io/badges/en_US.png)](https://open-store.io/app/telescope.asteroidos)

Or build it yourself following instructions below.

## Building the app

You need to checkout the submodule once:

    git submodule update --init --recursive

### Using clickable
To build and run the app on the desktop run:

```
clickable desktop
```
To build and install a click package on the device run:

```
clickable
```

See [clickable documentation](http://clickable.bhdouglass.com/en/latest/) for details.


## Contributors

- Florent Revest (FlorentRevest)
- Florian Blasius (FloVanGH)
- Stefan Weng (StefWe)
