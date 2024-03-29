# Table Of Contents

- [Installation Without Desktop Environment](#installation-without-desktop-environment)
- [Fix Grub dual boot problem](#fix-grub-boot-and-dual-boot-problem)
- [Install Firefox Developer Edition Browser](#install-firefox-developer-edition-browser)
- [Uncompress Common linux file types](#uncompress-common-linux-file-types)
  - [Cli Compression Programs](#cli-compression-programs)
  - [Graphical Compression Programs](#graphical-compression-programs)

# Installation Without Desktop Environment

- ### [Visual Tutorial](./VisualTutorial.md)

- ### [Article Style Tutorial](./ArticleStyleTutorial.md)

---

## Fix Grub Boot And Dual Boot Problem

### Grub failed to load or detect other Operating System after 'System Update'

- This problem occurs when you update and upgrade your system. A simple way to fix this is by following given commands:

```shell
$ sudo nano /etc/default/grub
```

- Search and uncomment the following line :

  ```nano
  GRUB_DISABLE_OS_PROBER=false
  ```

- Run the following command to enable **'os prober'** and **'update grub'**. This will automatically detect your another operating system.

  ```shell
  sudo os-prober
  sudo update-grub
  ```

### Other Grub related fixes

`Visit following sites to fix grub related issues`

- **`ARTICLES`**
  - [Grub Rescue](https://phoenixnap.com/kb/grub-rescue)
  - [Grub Terminal](https://unix.stackexchange.com/questions/329926/grub-starts-in-command-line-after-reboot)
- **`ISO`**
  - [Rescatux & $uper Grub](https://www.supergrubdisk.org/)
    - [SourceForge](https://sourceforge.net/projects/supergrub2/)
    - [Github](https://github.com/supergrub/supergrub)
  - [Boot Repair Disk](https://sourceforge.net/p/boot-repair-cd/home/Home/)
  - [System Rescue](https://www.system-rescue.org/)

---

## Install Firefox Developer Edition Browser

- Click [here](https://www.mozilla.org/en-US/firefox/developer/) to visit **'Firefox Developer Edition'** download page and click on Firefox Developer Edition button to download **'.tar.bz2'** file.

![](images/browser.png)

- Install some dependencies for browser to work properly run the following command:

```shell
$ sudo nala install libgtk2.0-0 libasound2 libdbus-glib-1-2
```

- Navigate to the **'Downloads'** directory :

```shell
$ cd Downloads
```

- Install **'Firefox Developer Edition'** browser with the following command:

```shell
$ sudo tar xjf firefox-*.tar.bz2 -C /opt
```

> Note: Above command will extract all files from firefox-\*.tar.bz2 to the /opt/firefox directory.

- Create a soft link or symlink of **'firefox'** file under **'/usr/local/bin/'** directory, so it will be accessible from anywhere the system:
  - For all users
  ```shell
  $ sudo ln -s /opt/firefox/firefox /usr/bin/firefox-developer-edition
  ```
  - For Single user with name **'Username'**
  ```shell
  $ sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox-developer-edition
  ```

> Note: You can use use any name instead of **firefox-developer-edition** like **firefox-dev**

- Start **'Firefox Developer Edition'** from the terminal by running the following command:

```Shell
$ sudo firefox-developer-edition.desktop
```

- Create an GUI executable to start **'Firefox Developer Edition'** from Application Launcher, Search, etc. :

  - For all users

  ```Shell
  $ sudo nano usr/share/applications/firefox-developer-edition.desktop
  ```

  - For Single user with name **'Username'**

  ```Shell
  $ sudo nano home/<Username>/.local/share/applications/firefox-developer-edition.desktop
  ```

> ### Copy and paste the following text:

```desktop
[Desktop Entry]
Name=Firefox Developer Edition
GenericName=Web Browser
Comment=Web Browser
Exec=/usr/bin/firefox-developer-edition %U
StartupNotify=true
Terminal=false
Icon=firefox-developer-edition
Type=Application
Categories=Network;WebBrowser;
MimeType=application/pdf;application/rss+xml;application/rdf+xml;application/xhtml+xml;application/xhtml_xml;application/xml;application/vnd.mozilla.xul+xml;image/gif;image/jpeg;image/png;image/webp;text/html;text/xml;x-scheme-handler/http;x-scheme-handler/https;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=/usr/bin/firefox-developer-edition

[Desktop Action new-private-window]
Name=New Incognito Window
Exec=/usr/bin/firefox-developer-edition --private-window

```

---

## Install wayland with weston or sway for tile layout

- Visit [here](https://blog.aktsbot.in/swaywm-on-debian-11.html) to setup sway in debian.

---

## Install bspwm window manager with rofi

- Visit CTT [here](https://github.com/ChrisTitusTech/Debian-titus) to setup bspwm with rofi.
- Customize rofi [here](https://github.com/adi1090x/rofi).

---

## Install system utilities tool

bpytop - Cli Based system monitor
stacer - System utility program
reshift-gtk - Equivalent to f.lux in windows
neofetch - shows system information

## Install nix best package manager

## Install QEMEU instead of virtuax box

## Install docker and docker compose, portainor

## Install File light

## Install with xfce lightweight desktop environment (Optional)

Install Material-Black-Pistachio-2.9.3 theme

## Some Linux Commands

- apropos (Find command related to a keyword)

```shell
$ apropos <keyword>
```

> For example : You can use `apropos disk` to find the commands related to keyword **'disk'**.

- whoami (Print the user name associated with the current effective user ID)

```shell
$ whoami
```

- disk and partaition commands
  blkid
  fdisk

## Uncompress common linux file types

> ### CLI Compression Programs
>
> Note: We will learn to uncompress common linux files like .tar, .tar.gz and .tar.bz2

- To uncompress .tar file use one of the following commands :

  > Copy in same working directory

  ```shell
  $ tar -xf <filename>.tar
  ```

  > Copy to a destination directory

  ```shell
  $ tar -xf <filename>.tar -C /path/to/destination/directory
  ```

- To uncompress .tar.gz file use one of the following commands :

  > Copy in same working directory

  ```shell
  $ tar -xzvf <filename>.tar.gz
  ```

  > Copy to a destination directory

  ```shell
  $ tar -xzvf <filename>.tar.gz -C /path/to/destination/directory
  ```

- To uncompress .tar.bz2 file use one of the following commands :
  > Copy in same working directory
  ```shell
  $ tar -xjvf <filename>.tar.bz2
  ```
  > Copy to a destination directory
  ```shell
  $ tar -xjvf <filename>.tar.bz2 -C /path/to/destination/directory
  ```

> ### Graphical Compression Programs:

- [File Roller](https://gitlab.gnome.org/GNOME/file-roller)

```shell
$ sudo nala install file-roller
```

- [Ark](https://github.com/KDE/ark)

  ```shell
  $ sudo nala install ark
  ```

- [PeaZip](https://peazip.github.io/)
  > For GTK version
  ```shell
  $ wget "https://github.com/peazip/PeaZip/releases/download/9.1.0/peazip_9.1.0.LINUX.GTK2-1_amd64.deb"
  ```
  Or
  > For Qt version
  ```shell
  $ wget "https://github.com/peazip/PeaZip/releases/download/9.1.0/peazip_9.1.0.LINUX.Qt5-1_amd64.deb"
  ```
  Then
  ```shell
  $ cd ~/Dowloads
  $ dpkg -i peazip_*.deb
  ```
