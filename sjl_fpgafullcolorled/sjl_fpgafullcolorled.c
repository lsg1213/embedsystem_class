#include <linux/miscdevice.h>
#include <linux/platform_device.h>
#include <linux/fs.h>
#include <linux/file.h>
#include <linux/mm.h>
#include <linux/list.h>
#include <asm/io.h>
#include <asm/uaccess.h>
#include <asm/cacheflush.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/errno.h>
#include <linux/types.h>
#include <linux/ioport.h>
#include <linux/delay.h>


#define DRIVER_AUTHOR			"hanback"
#define DRIVER_DESC			"full color led test program"

#define FULLCOLORLED_NAME    		"sjl_fpgafullcolorled"
#define FULLCOLORLED_MODULE_VERSION	"FULL COLOR LED V0.1"
#define FULLCOLORLED_ADDRESS 		0x05000000
#define FULLCOLORLED_ADDRESS_RANGE 	0x1000

#define FULL_LED1	9
#define FULL_LED2	8
#define FULL_LED3	7
#define FULL_LED4	6
#define ALL_LED		5

static int fullled_usage = 0;
static int led_num=0;
static unsigned long  *fullled_ioremap;
static unsigned short *full_led_addr[4][3];


static int numOfLed = -1;

static int sjl_fpgafullcolorled_open(struct inode * inode, struct file * file)
{
	if(fullled_usage != 0) return -EBUSY;

	fullled_ioremap=ioremap(FULLCOLORLED_ADDRESS,FULLCOLORLED_ADDRESS_RANGE);

	if(!check_mem_region((unsigned long)fullled_ioremap, FULLCOLORLED_ADDRESS_RANGE)) {
		request_mem_region((unsigned long)fullled_ioremap, FULLCOLORLED_ADDRESS_RANGE, FULLCOLORLED_NAME);
	}
	else printk("driver: unable to register this!\n");


	full_led_addr[0][0] =(unsigned short *)((unsigned long)fullled_ioremap+0xa0);
	full_led_addr[0][1] =(unsigned short *)((unsigned long)fullled_ioremap+0xa2);
	full_led_addr[0][2] =(unsigned short *)((unsigned long)fullled_ioremap+0xa4);

	full_led_addr[1][0] =(unsigned short *)((unsigned long)fullled_ioremap+0xa6);
	full_led_addr[1][1] =(unsigned short *)((unsigned long)fullled_ioremap+0xa8);
	full_led_addr[1][2] =(unsigned short *)((unsigned long)fullled_ioremap+0xaa);

	full_led_addr[2][0] =(unsigned short *)((unsigned long)fullled_ioremap+0xb0);
	full_led_addr[2][1] =(unsigned short *)((unsigned long)fullled_ioremap+0xb2);
	full_led_addr[2][2] =(unsigned short *)((unsigned long)fullled_ioremap+0xb4);

	full_led_addr[3][0] =(unsigned short *)((unsigned long)fullled_ioremap+0xb6);
	full_led_addr[3][1] =(unsigned short *)((unsigned long)fullled_ioremap+0xb8);
	full_led_addr[3][2] =(unsigned short *)((unsigned long)fullled_ioremap+0xba);

	fullled_usage = 1;
	return 0;
}

static int sjl_fpgafullcolorled_release(struct inode * inode, struct file * file)
{
	iounmap(fullled_ioremap);

	release_mem_region((unsigned long)fullled_ioremap, FULLCOLORLED_ADDRESS_RANGE);
	fullled_usage = 0;
	return 0;
}

static ssize_t sjl_fpgafullcolorled_write(struct file * file, const char * buf, size_t length, loff_t * ofs)
{
	int ret,i=0,j=0;
	unsigned char data[3];

	printk("sjl_fpgafullcolorled_write, \n");
	ret = copy_from_user(data,buf,length);
	for(j=0;j<3;j++)
	{
		if(data[j]%0x10 >= 0xA)
			data[j]+=0x06;
		if(data[j]%0x100 >= 0xA0)
			data[j]+=0x60;

		if(led_num != 4)
		{
			for(j=0;j<3;j++)
			{
				*full_led_addr[led_num][j] = data[j];
			}
		}
		else
		{
			for(i=0;i<4;i++)
			{
				for(j=0;j<3;j++)
				{
					*full_led_addr[i][j] = data[j];
				}
			}
		}
	}

	return length;
}

//static DEFINE_MUTEX(sjl_fpgafullcolorled_mutex);
static long sjl_fpgafullcolorled_ioctl(struct file * file, unsigned int cmd, unsigned long arg){
	switch(cmd)
	{
		case FULL_LED1:
			led_num = 0;
			break;
		case FULL_LED2:
			led_num = 1;
			break;
		case FULL_LED3:
			led_num = 2;
			break;
		case FULL_LED4:
			led_num = 3;
			break;
		case ALL_LED:
			led_num = 4;
			break;
	}

//	mutex_unlock(&sjl_fpgafullcolorled_mutex);
	return 0;
}


static struct file_operations sjl_fpgafullcolorled_fops = {
	.owner = THIS_MODULE,
	.open = sjl_fpgafullcolorled_open,
	.release = sjl_fpgafullcolorled_release,
//	.read = sjl_fpgafullcolorled_read,
	.write = sjl_fpgafullcolorled_write,
	.unlocked_ioctl = sjl_fpgafullcolorled_ioctl,
};

static struct miscdevice sjl_fpgafullcolorled_driver = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "sjl_fpgafullcolorled",
	.fops = &sjl_fpgafullcolorled_fops,
};

static int sjl_fpgafullcolorled_init(void){
	printk("sjl_fpgafullcolorled_init, \n");
	
	return misc_register(&sjl_fpgafullcolorled_driver);
}

static void sjl_fpgafullcolorled_exit(void){
	printk("sjl_fpgafullcolorled_exit, \n");

	misc_deregister(&sjl_fpgafullcolorled_driver);
	
}

module_init(sjl_fpgafullcolorled_init);
module_exit(sjl_fpgafullcolorled_exit);

MODULE_AUTHOR("Hanback");
MODULE_DESCRIPTION("fpga_fullcolorled driver test");
MODULE_LICENSE("Dual BSD/GPL");
