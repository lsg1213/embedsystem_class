.SILENT:

include C:/AndroXStudio/Tools/make_adb

export ARCH=arm
export CROSS_COMPILE=arm-linux-androideabi-

ifneq ($(KERNELRELEASE),)
obj-m := sjl_fpga7segment.o
else
KDIR := /platform/linux
all:
	$(MAKE) -C $(KDIR) M=$(shell pwd) modules

	echo 
	echo "**** Install:" /system/lib/modules/sjl_fpga7segment.ko "****"
	$(ADB) push sjl_fpga7segment.ko /system/lib/modules/
	$(ADB) shell chmod 644 /system/lib/modules/sjl_fpga7segment.ko
	echo 
	echo "**** Load Module:" /system/lib/modules/sjl_fpga7segment.ko "****"
	$(ADB) shell toolbox rmmod sjl_fpga7segment > /dev/null
	$(ADB) shell insmod /system/lib/modules/sjl_fpga7segment.ko
	$(ADB) shell lsmod | grep sjl_fpga7segment
	echo

endif

clean:
	rm -f *.symvers
	rm -f *.ko
	rm -f *.o
	rm -f *.mod.c
	rm -f *.order
	rm -f .*.cmd
	rm -rf .tmp_versions
