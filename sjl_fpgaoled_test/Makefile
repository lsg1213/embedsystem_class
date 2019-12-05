.SILENT:

include C:/AndroXStudio/Tools/make_comm

all: $(OBJECTS)
	$(CC) $(CFLAGS) $(EXEC_LDFLAGS) -save-temps -O2 -o sjl_fpgaoled_test $(OBJECTS) \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/sjl_fpgaoled_test "****"
	$(ADB) push sjl_fpgaoled_test /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/sjl_fpgaoled_test

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f sjl_fpgaoled_test
