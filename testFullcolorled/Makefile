.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testFullcolorled testFullcolorled.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testFullcolorled "****"
	$(ADB) push testFullcolorled /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testFullcolorled
	echo 
	echo "**** Run ****"
	#$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testFullcolorled       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testFullcolorled
