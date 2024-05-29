obj-m += gvusb2-sound.o gvusb2-video.o

gvusb2-sound-y := gvusb2-snd.o gvusb2-core.o
gvusb2-video-y := gvusb2-vid.o gvusb2-v4l2.o gvusb2-core.o gvusb2-i2c.o

KERNELOBJECTS = gvusb2-sound.ko gvusb2-video.ko
KERNELVER := $(shell uname -r)
DESTDIR := /lib/modules/$(KERNELVER)/kernel/drivers/usb/

all:
	make -C /lib/modules/$(KERNELVER)/build M=$(PWD) modules
	install -p -m 644 $(KERNELOBJECTS) $(DESTDIR)

clean:
	make -C /lib/modules/$(KERNELVER)/build M=$(PWD) clean
