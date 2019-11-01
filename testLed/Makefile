.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testLed testLed.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testLed "****"
	$(ADB) push testLed /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testLed
	echo 
	echo "**** Run ****"
#	$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testLed       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testLed
