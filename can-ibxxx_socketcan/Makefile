obj-m += ixx_pci.o
ixx_pci-objs := ixx_pci_core.o ixx_pci_ib_fd_passive.o ixx_pci_ib_passive.o ixx_pci_ib_active.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
