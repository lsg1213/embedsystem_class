.SILENT:

include C:/AndroXStudio/Tools/make_adb

export ARCH=arm
export CROSS_COMPILE=arm-linux-androideabi-

ifneq ($(KERNELRELEASE),)
obj-m := sjl_fpgalcd.o
else
KDIR := /platform/linux
all:
	$(MAKE) -C $(KDIR) M=$(shell pwd) modules

	echo 
	echo "**** Install:" /system/lib/modules/sjl_fpgalcd.ko "****"
	$(ADB) push sjl_fpgalcd.ko /system/lib/modules/
	$(ADB) shell chmod 644 /system/lib/modules/sjl_fpgalcd.ko
	echo 
	echo "**** Load Module:" /system/lib/modules/sjl_fpgalcd.ko "****"
	$(ADB) shell toolbox rmmod sjl_fpgalcd > /dev/null
	$(ADB) shell insmod /system/lib/modules/sjl_fpgalcd.ko
	$(ADB) shell lsmod | grep sjl_fpgalcd
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
