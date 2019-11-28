all: ixx_usb ixx_pci

ixx_usb:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(PWD)/usb-to-can_socketcan modules

ixx_pci:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(PWD)/can-ibxxx_socketcan modules

clean:
	$(MAKE) -C can-ibxxx_socketcan clean
	$(MAKE) -C usb-to-can_socketcan clean

install: install_pci install_usb

install_pci:
	cp can-ibxxx_socketcan/ixx-can-ib-1.9.3.fw /lib/firmware
	mkdir -p /lib/modules/$(shell uname -r)/kernel/drivers/net/can/ixxat/
	install can-ibxxx_socketcan/ixx_pci.ko /lib/modules/$(shell uname -r)/kernel/drivers/net/can/ixxat/
	depmod -a
	modprobe ixx_pci


install_usb:
	mkdir -p /lib/modules/$(shell uname -r)/kernel/drivers/net/can/usb/ixxat/
	install usb-to-can_socketcan/ixx_usb.ko /lib/modules/$(shell uname -r)/kernel/drivers/net/can/usb/ixxat/
	depmod -a
	modprobe ixx_usb

uninstall:
	rm -f /lib/modules/$(shell uname -r)/kernel/drivers/net/can/usb/ixxat/ixx_usb.ko
	rm -f /lib/modules/$(shell uname -r)/kernel/drivers/net/can/ixxat/ixx_pci.ko
	modprobe -r ixx_usb
	modprobe -r ixx_pci
	depmod -a
	rm -f /lib/firmware/ixx-can-ib-1.9.3.fw