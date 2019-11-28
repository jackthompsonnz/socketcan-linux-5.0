mod-name += ixx_usb
obj-m += ixx_usb.o
ixx_usb-objs := ixx_usb_v2.o ixx_usb_fd.o ixx_usb_core.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	mkdir -p /lib/modules/$(shell uname -r)/kernel/drivers/net/can/usb/ixxat/
	install $(mod-name).ko /lib/modules/$(shell uname -r)/kernel/drivers/net/can/usb/ixxat/
	depmod -a
	modprobe $(mod-name)
    
uninstall:
	rm -f /lib/modules/$(shell uname -r)/kernel/drivers/net/can/usb/ixxat/$(mod-name).ko
	modprobe -r $(mod-name)
	depmod -a