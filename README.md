# ubuntu-post-installation
This Repository conntains all the littel tweaks I do usually after setting up the system. I am using a Lenovo Thinkpad x240. I am using currently version 18.10. This means Gnome Shell as default desktop environment.

# Tested in Ubuntu 18.10

## Two-finger scrolling does not work after resume

Edit the file `/etc/default/grub` and change the line:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

to
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash psmouse.synaptics_intertouch=0"
```

then
```
sudo update-grub
sudo reboot
```

# Tested in Ubuntu Gnome 17.04

## In use

- Installed (and used) Gnome Shell Extensions
  - [Suspend Button](https://extensions.gnome.org/extension/826/suspend-button/)
  - [Applications Menu](https://extensions.gnome.org/extension/6/applications-menu/)
  - [Open Weather](https://extensions.gnome.org/extension/750/openweather/)
  - [Places Status Indicator](https://extensions.gnome.org/extension/8/places-status-indicator/)
  - [RSS Feed](https://extensions.gnome.org/extension/948/rss-feed/)
  - [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
- Install tor browser bundle: `torbrowser-launcher`
- Add `powertop --auto-tune` to startup applications
  - In order to add this to `/etc/crontab`: `@reboot 	root	powertop --auto-tune`
  - there are problems when using a USB mouse as the USB port get's into some power save mode and one need to click before moving the mouse further...

## Problems and Workarounds

- Bluetooth Headphone does not work corretly (no A2DP for Music). The [problem is described here and the proposed solution](https://askubuntu.com/questions/934381/bluetooth-speaker-not-doing-a2dp-ubuntu-gnome-17-04) worked fine for me.

## Working but not in use

- Enable [Touch Gesture support](https://github.com/bulletmark/libinput-gestures)
  - under construction: The ideal touch configuration based on [this guide](https://wiki.gnome.org/Design/OS/Gestures)

# Tested in Ubuntu 16.04 (and 15.10)
## Disable Bluetooth at startup
Follow [this description in order to create a service that deactivates bluetooth at startup](https://wiki.ubuntuusers.de/Bluetooth/Einrichtung#Deaktivierung-beim-Start)

## Application Specific Changes

### Use Firefox ProfileManager

According to [this
article](https://developer.mozilla.org/en-US/Firefox/Multiple_profiles) it is possible to let Firefox ask for a specific
profile when launched.

In the file `/usr/share/applications/firefox.desktop` the following line needs to be changed:
```
Exec=firefox %u
```
needs to be changed to:
```
Exec=firefox --ProfileManager %u
```

## Installation of additional Software

### Install Tor Browser Bundle

Start Tor Browser when a new Network Connection is established only (see also [general infromation how to run a script when connecting to a network](https://wiki.ubuntu.com/OnNetworkConnectionRunScript)):

add this script to `/etc/network/if-up.d/`

```bash
#!/bin/bash
pkill firefox
/path/to/tor-browser_en-US/Browser/start-tor-browser &
```
*[see example script](https://github.com/jukey/ubuntu-post-installation/blob/master/scripts/restart-tor-browser.sh)*

### Install Extensions for Thunderbird

1. [Manually Sort Folders Extension](https://addons.mozilla.org/de/thunderbird/addon/manually-sort-folders/)
2. Enigmail

### Install Geary E-Mail Client

```bash
sudo add-apt-repository ppa:yorba/ppa
sudo apt-get update
sudo apt-get install geary
```
### Installation of Telegram
* Get the [tar.xz archive](https://desktop.telegram.org/)

```bash
mv ~/Downloads/tsetup* ..
tar xvf tsetup*
rm tsetup*
~/Telegram/Telegram
```

* Attach Telegram to the starter dock
* Run as user: ```gnome-session-properties```
* Add entry: ```~/Telegram/Telegram```

### Installation of Spotify

```bash
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install spotify-client

# 5. Starting in Ubuntus 15.04 this lib needs to be installed
cd ~/Downloads
wget https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
```

-----
**Not working in Ubuntu 15.10:**
## Enable 3 finger tapping on the Synaptics Clickpad

As user:
```synclient TapButton3=2```

Additionally it should be added to the list of commands that are executed at startup.
