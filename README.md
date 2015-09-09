# GLib Library Hack to sort file like LS

For years, everybody list files on unix based on LC_COLLATE.
Then Gnome developpers decide to interpret number in filename...
Why ??!!

Strange choice, and we cannot personalize this.

ls show something like

``` 001  004  1  A  B  a  b
```

and for example, nautilus show:

``` 1 001  004  A  B  a  b
```

This behavior use command g_utf8_collate_key_for_filename from Glib library.

This little override this function with g_utf8_collate_key.

## Pre-required

Compilation dependencies
	
	sudo apt-get install libglib2.0-dev

## Generate

	make all

## Install and usage

To override this behavior, this library need to be preload before each program who use Glib library.
Todo that you can

### set it before call from command line or from .desktop shortcut:
	
	LD_PRELOAD=/pathToYourLib/glibSortFileNameHack.so nautilus

### set globally on gnome session:
	
	echo "export LD_PRELOAD=/pathToYourLib/glibSortFileNameHack.so" >> ~/.gnomerc

and restart your gnome session. Be careful, this settings produce effect on whole gnome session.

### or more simply

	make install

this command will create a libs directory in your home, copy library, and append LD_PRELOAD to ~/.gnomerc

## Troubleshooting

Before open an issue, please follow this guide

### Test required

to verify that it works, create some dummy files.

e.g.:

	touch 001
	touch 004
	touch 1
	touch 4
	touch a
	touch A
	touch b
	touch B

ls will show:

	001  004  1  4  a  A  b  B

nautilus on a standard installation will show:

	1 001 4 004  a  A  b  B

With hack nautilus will show

	001  004  1  4  a  A  b  B


### Nautilus

before anything, kill any nautilus process

	ps -aux | grep nautilus
	kill -9 nautilusProcess

launch it from lib directory to test it:
	
	LD_PRELOAD=./glibSortFileNameHack.so nautilus .




Enjoy ! 

Alexandre Richonnier









