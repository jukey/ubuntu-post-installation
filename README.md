# ubuntu-post-installation
In this Repository Iam going to collect all the littel tweaks I do usually after setting up the system. I am using a Lenovo Thinkpad x240

# Tested in Ubuntu 15.10
## Disable Bluetooth at startup
Follow [this description in order to create a service that deactivates bluetooth at startup](https://wiki.ubuntuusers.de/Bluetooth/Einrichtung#Deaktivierung-beim-Start)

## Installation of additional Software
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

-----
**Not working in Ubuntu 15.10:**
## Enable 3 finger tapping on the Synaptics Clickpad

As user:
```synclient TapButton3=2```

Additionally it should be added to the list of commands that are executed at startup.
