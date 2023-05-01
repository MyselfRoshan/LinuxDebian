# Table Of Contents

- [Tools To Make Bootable ISOs](#tools-to-make-bootable-isos)
- [Connect to wifi from command line](#connect-to-wifi-from-command-line)
- [Change apt package source](#change-apt-package-source)
- [Nala apt front-end for Linux](#install-nala-better-apt-front-end)
- [Automatically download all firmware packages](#automatically-download-all-the-required-firmware-packages)

---

## Tools To Make Bootable ISOs :

- [Ventoy](https://www.ventoy.net/en/download.html) (Recommended)
- [Etcher](https://www.balena.io/etcher) (Beginner Friendly)
- [Rufus](https://rufus.ie/en/)

---

## Connect to wifi from command line

> ### Note: If you have ethernet connected for internet connection jump to next step [here](#change-apt-package-source).

- Show all the available network interface

  ```shell
  $ ip a
  ```

- Show your wireless network interface

  ```shell
  $ sudo iw dev
  ```

- Set the wireless interface up which start with wlpxxx since mine is wlsps0b1, the command is:

  ```shell
  $ sudo ip link set wlp2s0b1 up
  ```

- Edit the interfaces with your favourite text editor like vim, nano, etc. Since I am familier with nano for my setup.

  ```shell
  $ sudo nano /etc/network/interfaces
  ```

- Copy and paste the following text at the end of the file and replace ESSID with your **'wifi name'** and PASSWORD with your **'wifi password'**

  ```nano
  # my wifi device
  allow-hotplug wlp2s0b1
  iface wlp2s0b1 inet dhcp
    wpa-ssid ESSID #wifi name/essid
    wpa-psk PASSWORD #wifi password
  ```

- Bring up your interface and verify connection :

  ```shell
  $ sudo ifup wlp2s0b1
  $ ip a #To view if wlp2s0b1 is UP or DOWN
  ```

> Note: If this method doesn't work visit official wiki [here](https://wiki.debian.org/WiFi/HowToUse).

---

## Install NetworkManager

```shell
sudo apt install network-manager
# start networkmanager service
sudo systemctl start NetworkManager
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
deb http://deb.debian.org/debian bullseye main non-free
deb-src http://deb.debian.org/debian bullseye main non-free

deb http://deb.debian.org/debian-security/ bullseye-security main non-free
deb-src http://deb.debian.org/debian-security/ bullseye-security main non-free

deb http://deb.debian.org/debian bullseye-updates main non-free
deb-src http://deb.debian.org/debian bullseye-updates main non-free
```

> ### Change the fist and second 'bulleye' to 'sid' as shown below:

```nano
deb http://deb.debian.org/debian sid main non-free
deb-src http://deb.debian.org/debian sid main non-free
```

> Note : If you want different **'soure.list'** configuration visit [here](https://wiki.debian.org/SourcesList).

- After changing the source list **'update'** and **'upgrade'** your system :

  ```shell
  sudo apt update
  sudo apt upgrade -y
  ```

---

## Install 'nala' better 'apt' front-end

- When it come to installing packages from apt it is a mess. When you are installing packages nala provides a better interfaces while installing packages. So it is my prefered way. I recommend nala to everyone. To install nala in debian use the following command:

  ```shell
  $ sudo apt install nala
  ```

> Note: If nala isn't installed from the above method. Click [here](https://gitlab.com/volian/nala/-/wikis/Installation) to vist nala official install wiki.

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
