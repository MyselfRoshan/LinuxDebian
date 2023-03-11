# LinuxDebian

## Table Of Contents

- [Connect to wifi from command line](#connect-to-wifi-from-command-line)
- [Change apt package source](#change-apt-package-source)
- [Nala apt front-end for Linux](#install-nala-better-apt-front-end)
- [Automatically download all firmware packages](#automatically-download-all-the-required-firmware-packages)

---

## Connect to wifi from command line

- Show all the available network interface

```shell
$ ip a
```

- Set the wireless interface up which start with wlpxxx since mine is wlsps0b1, the command is:

```shell
$ sudo link set wlp2s0b1 up
```

- Edit the interfaces with your favourite text editor like vim, nano, etc. Since I am familier with nano for my setup.

```shell
$ sudo nano /etc/network/interfaces
```

- Copy and paste the following text at the end of the file and replace ESSID with your `wifi name` and PASSWORD with your `wifi password`

```nano
# my wifi device
allow-hotplug wlp2s0b1
iface wlp2s0b1 inet dhcp
  wpa-ssid ESSID #wifi name/essid
  wps-psk PASSWORD #wifi password
```

- Bring up your interface and verify connection :

```shell
$ sudo ifup wlp2s0b1
$ ip a #To view if wlp2s0b1 is UP or DOWN
```

---

## Change apt package source

> This section is optional. If you want latest and greatest debian packages then changing the source from **'bulleye'** to either **'sid'** or **'testing'** is a great idea.

- If you want to learn more about Debian Release and Stability then refer to the following official articles:

  [About Different Debian Releases](https://www.debian.org/releases/)

  [About Debian Stability](https://wiki.debian.org/DebianStability)

- For my setup I changed my sources in source.list from **'bulleye'** to **'sid'**.

```shell
$ sudo nano /etc/apt/source.list
```

> ### It will look similar to this ( Ignore the comments ) :

```nano
deb http://deb.debian.org/debian bullseye main
deb-src http://deb.debian.org/debian bullseye main

deb http://deb.debian.org/debian-security/ bullseye-security main
deb-src http://deb.debian.org/debian-security/ bullseye-security main

deb http://deb.debian.org/debian bullseye-updates main
deb-src http://deb.debian.org/debian bullseye-updates main
```

> ### Change the fist and second **'bulleye'** to **'sid'** as shown below:

```nano
deb http://deb.debian.org/debian sid main
deb-src http://deb.debian.org/debian sid main

deb http://deb.debian.org/debian-security/ bullseye-security main
deb-src http://deb.debian.org/debian-security/ bullseye-security main

deb http://deb.debian.org/debian bullseye-updates main
deb-src http://deb.debian.org/debian bullseye-updates main
```

> Note : If you want different **'soure.list'** configuration visit [here](https://wiki.debian.org/SourcesList).

- After changing the source list **'update'** and **'upgrade'** your system :

```shell
$ sudo apt update && sudo apt upgrade
```

---

## Install **'nala'** better **'apt'** front-end

- When it come to installing packages from apt it is a mess. When you are installing packages nala provides a better interfaces while installing packages. So it is my prefered way. I recommend nala to everyone. To install nala in debian use the following command:

```shell
$ sudo apt install nala
```

> Note: If nala isn't installed from the above method. Chick [here](https://gitlab.com/volian/nala/-/wikis/Installation) to vist nala official install wiki.

---

## Automatically download all the required firmware packages

- It is rather simple to download all the **'reqired'** and **'missing'** firmware packages inside Debian. For this we need to install **isenkram-cli** package.

```shell
$ sudo nala install isenkram-cli
```

- To install missing **'reqired'** and **'missing'** firmware packages run the following command:

```shell
$ sudo isenkram-autoinstall-firmware
```

> For more details visit [here](https://www.debian.org/releases/stable/i386/ch06s04.en.html).

---

## Install Firefox Developer Edition Browser

`Step 1` : Go to *https://www.mozilla.org/en-US/firefox/developer/* and click on Firefox Developer Edition button to download **.tar.bz2** file

![](/browser.png)

`Step 2` : Open a terminal and install some dependencies before installing the browser using the following command:

```shell
$ sudo apt-get install libgtk2.0-0 libasound2 libdbus-glib-1-2
```

`Step 3` : Use the following command to navigate to the **Downloads** directory:

```shell
$ cd Downloads
```

`Step 4` : Run the following command to install **Firefox Developer Edition**:

```shell
$ sudo tar xjf firefox-*.tar.bz2 -C /opt
```

_`Note: Above command will extract all files from firefox-*.tar.bz2 to the /opt/firefox directory.`_

`Step 5` : Run the following command to install a soft link of `firefox` file under `/usr/local/bin/` directory, so it will be accessible from anywhere the system:

```shell
$ sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox-developer
```

_`Note: You can use use any name instead of firefox-developer like firefox-dev`_

`Step 5` : Start **Firefox Developer Edition** from the terminal by running the following command:

```Shell
$ sudo firefox-developer
```

`Step 6` : Create an GUI executable to start **Firefox Developer Edition** from Application Launcher, Search, etc. by using following commands:

```Shell
$ sudo vim home/<User Name>/.local/share/applications/firefox_developer.desktop
```

Copy and paste the following text:

```desktop
[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=/opt/firefox/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
Actions=New;Private;

[Desktop Action New]
Exec=/opt/firefox/firefox %u
Name=Open in New Window

[Desktop Action Private]
Exec=/opt/firefox/firefox --private-window %u
Name=Open in Private Window
```

## Install nala better alternative to apt and apt-get

## Install nix best package manager

## Install QEMEU instead of virtuax box

## Install docker

## Install File light

## Install kitty or Alacrity

## Install wayland with weston or sway for tile layout

## Install bspwm window manager

## Install with xcfce lightweight desktop environment
