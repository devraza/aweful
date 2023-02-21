# Aweful
This repository contains my AwesomeWM configuration, made with lots of **Love**. Feel free to steal anything you need.

## Installation

### Dependencies

**Aweful** requires that some programs be installed to the host system in order to be fully functional. Below is a list of those which fit this category.

- `xclip`
- `pamixer`
- `rofi`
- `scrot`
- `xrdb`

> Please keep in mind that all of these are optional for the configuration to load, but necessary if you want some functionality (for example, `scrot` is required for screenshots)

> An appropriately placed `.Xresources` with colour configuration is also essential.

#### Fonts

**Aweful** depends on the fonts `Iosevka` and `Font Awesome 6 Pro`, so make sure to have them installed as well.

### User Configuration

Additionally, all keys bound to an application (those in the **Applications** category) point to an easily customisable variable in `rc.lua` which contain the application to be launched. I recommend you go into the file and change the variables to your liking (e.g. change the 'browser' varianle to your choice of browser). Here's a list of all the variables that can be easily changed:

- `terminal`
- `editor`
- `modkey`
- `file_manager`
- `music_player`
- `browser`
- `monitor`
- `chat`

> Further explanation of the variables is offered in the `rc.lua` file.

### Cloning

**Aweful** utilises the `bling` and `lain` AwesomeWM modules, which are necessary for the config to load successfully. These are their seperate git repositories, so clone this repository with them as follows:

```
git clone --recurse-submodules https://github.com/devraza/aweful
```

Links to submodules are also provided in this document.

## Submodules

The following submodules are used:
- `bling` - Utilities for the awesome window manager - https://github.com/BlingCorp/bling
- `lain` - Awesome WM complements - https://github.com/lcpz/lain
