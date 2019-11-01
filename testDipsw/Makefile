.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testDipsw testDipsw.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testDipsw "****"
	$(ADB) push testDipsw /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testDipsw
	echo 
	echo "**** Run ****"
#	$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testDipsw       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testDipsw
