#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <asm/uaccess.h>
#include <asm/io.h>
#include <linux/ioport.h>
#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/mutex.h>

#define LED_ADDRESS 0x05000020
#define LED_ADDRESS_RANGE 0x1000

#define DEVICE_NAME "sjl_fpgaled"

static int led_usage = 0;
static unsigned long *led_ioremap;
static int sjl_fpgaled_open(struct inode * inode, struct file * file){
	
	printk("sjl_fpgaled_open, \n");
	
	if (led_usage == -1)
		return -EBUSY;

	led_ioremap = ioremap(LED_ADDRESS, LED_ADDRESS_RANGE);

	if ( check_mem_region( (unsigned long) led_ioremap, LED_ADDRESS_RANGE)) {
		printk(KERN_WARNING "Can't get IO Region 0x%x\n", (unsigned int) led_ioremap);
		return -1;
}

	request_mem_region( (unsigned long) led_ioremap, LED_ADDRESS_RANGE, DEVICE_NAME);
	led_usage = 1;

	return 0;
}
static int sjl_fpgaled_release(struct inode * inode, struct file * file){

	printk("sjl_fpgaled_release, \n");

	release_mem_region( (unsigned long) led_ioremap, LED_ADDRESS_RANGE);
	iounmap(led_ioremap);

	led_usage = 0;
	return 0;
}

static ssize_t sjl_fpgaled_write(struct file * file, const char * buf, size_t length, loff_t * ofs){
	unsigned short *addr;
	unsigned char value;

	get_user(value, buf);
	printk("sjl_fpgaled_write, value : %d \n", value);
	addr = (unsigned short*)led_ioremap;
	*addr = value|0x100;

	return length;
}
static struct file_operations sjl_fpgaled_fops = {
	.owner = THIS_MODULE,
	.open = sjl_fpgaled_open,
	.release = sjl_fpgaled_release,
	//.read = sjl_fpgaled_read,
	.write = sjl_fpgaled_write,
	//.unlocked_ioctl = sjl_fpgaled_ioctl,
};

static struct miscdevice sjl_fpgaled_driver = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "sjl_fpgaled",
	.fops = &sjl_fpgaled_fops,
};

static int sjl_fpgaled_init(void){
	printk("sjl_fpgaled_init, \n");

	return misc_register(&sjl_fpgaled_driver);
}

static void sjl_fpgaled_exit(void){
	printk("sjl_fpgaled_exit, \n");

	misc_deregister(&sjl_fpgaled_driver);
}

module_init(sjl_fpgaled_init);
module_exit(sjl_fpgaled_exit);

MODULE_AUTHOR("Hokyung Sun");
MODULE_DESCRIPTION("fpgaled driver");
MODULE_LICENSE("Dual BSD/GPL");
