# LinuxDebian

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
$ ln -s /opt/firefox/firefox /usr/local/bin/firefox-developer
```

_`Note: You can use use any name instead of firefox-developer like firefox-dev`_

`Step 5` : Start **Firefox Developer Edition** from the terminal by running the following command:

```shell
$ firefox-developer
```
