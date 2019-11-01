.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testPiezo testPiezo.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testPiezo "****"
	$(ADB) push testPiezo /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testPiezo
	echo 
	echo "**** Run ****"
	#$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testPiezo       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testPiezo
