.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testOLed testOLed.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testOLed "****"
	$(ADB) push testOLed /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testOLed
	echo 
	echo "**** Run ****"
#	$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testOLed       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testOLed
