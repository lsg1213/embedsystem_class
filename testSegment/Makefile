.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testSegment testSegment.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testSegment "****"
	$(ADB) push testSegment /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testSegment
	echo 
	echo "**** Run ****"
#	$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testSegment       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testSegment
