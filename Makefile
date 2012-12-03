obj-m = nbd.o

all:
	$(MAKE) -C /lib/modules/`uname -r`/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/`uname -r`/build M=$(PWD) clean

install:
	rmmod nbd; \
	mkdir -p /lib/modules/`uname -r`/updates/drivers/block/
	cp nbd.ko /lib/modules/`uname -r`/updates/drivers/block/
	depmod -a
	modprobe -v nbd

