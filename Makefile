LibName=glibSortFileNameHack

all: clean libs test

libs:
	gcc -Wall -fPIC -DPIC -c $(LibName).c `pkg-config --cflags --libs glib-2.0`
	 ld -shared -o $(LibName).so $(LibName).o -ldl

test:
	gcc test.c `pkg-config --cflags --libs glib-2.0` -o test

clean:
	rm -f *.*~ *.o *.so *~ test

install: all
	mkdir -p ~/libs
	rm -f ~/libs/$(LibName).so
	cp $(LibName).so  ~/libs/$(LibName).so
	#$(eval PathLibTMP := $(shell readlink  -f ~/libs))
	echo "export LD_PRELOAD=$(shell readlink  -f ~/libs)/$(LibName).so" >> ~/.gnomerc

	
