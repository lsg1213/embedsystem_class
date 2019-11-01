.SILENT:

include C:/AndroXStudio/Tools/make_comm

all:
	$(CC) $(CFLAGS) $(LDFLAGS) -save-temps -march=armv7-a -O2 -o testDotmatrix testDotmatrix.c \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/testDotmatrix "****"
	$(ADB) push testDotmatrix /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/testDotmatrix
	echo 
	echo "**** Run ****"
	#$(ADB) shell TIMEFORMAT="" time /data/local/tmp/testDotmatrix       

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f testDotmatrix
