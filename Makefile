obj-m = nbd.o

all:
	$(MAKE) -C /lib/modules/`uname -r`/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/`uname -r`/build M=$(PWD) clean

install:
	rmmod nbd; \
	cp nbd.ko /lib/modules/`uname -r`/kernel/drivers/block/
	depmod -a
	modprobe -v nbd

