# ubuntu-post-installation
In this Repository Iam going to collect all the littel tweaks I do usually after setting up the system. I am using a Lenovo Thinkpad x240

# Tested in Ubuntu 15.10
## Disable Bluetooth at startup
Follow [this description in order to create a service that deactivates bluetooth at startup](https://wiki.ubuntuusers.de/Bluetooth/Einrichtung#Deaktivierung-beim-Start)

# Not working in Ubuntu 15.10
## Enable 3 finger tapping on the Synaptics Clickpad

As user:
```synclient TapButton3=2```

Additionally it should be added to the list of commands that are executed at startup.