.SILENT:

include C:/AndroXStudio/Tools/make_comm

all: $(OBJECTS)
	$(CC) $(CFLAGS) $(EXEC_LDFLAGS) -save-temps -O2 -o sjl_fpga7segment_test $(OBJECTS) \
		$(LLIB)/libgcc.a

	echo 
	echo "**** Install:" /data/local/tmp/sjl_fpga7segment_test "****"
	$(ADB) push sjl_fpga7segment_test /data/local/tmp
	$(ADB) shell chmod 755 /data/local/tmp/sjl_fpga7segment_test

clean:
	rm -f *.o
	rm -f *.i
	rm -f *.s
	rm -f sjl_fpga7segment_test
