MAKEFLAG = -sR
MKDIR = mkdir
RMDIR = rmdir
CP = cp
CD = cd
DD = dd
RM = rm

ASM = nasm
CC = gcc
LD = ld
OBJCOPY = objcopy

ASMBFLAGS = -f elf -w-orphan-labels
CFLAGS = -c -Os -std=c99 -m32 -Wall -Wshadow -W -Wconversion -Wno-sign-conversion -fno-stack-protector -fomit-frame-pointer -fno-builtin -fno-common  -ffreestanding  -Wno-unused-parameter -Wunused-variable
LDFLAGS = -s -static -T hello.lds -n -Map HelloOS.map
OJCYFLAGS = -S -O binary

HELLOOS_OBJS :=
HELLOOS_OBJS += entry.o main.o vgastr.o
HELLOOS_ELF = HelloOS.elf
HELLOOS_BIN = HelloOS.bin

.PHONY: build clean link bin

all: clean build link bin

clean:
	$(RM) -f *.o *.bin *.elf

build: $(HELLOOS_OBJS)   	# 指定依赖的所有.o文件

link: $(HELLOOS_ELF) 		# 指定依赖的elf文件
$(HELLOOS_ELF): $(HELLOOS_OBJS)	# elf依赖.o文件
	$(LD) $(LDFLAGS) -o $@ $(HELLOOS_OBJS)  # 链接所有.o文件

bin: $(HELLOOS_BIN) 	 	# 最后的可执行文件见依赖elf文件
$(HELLOOS_BIN): $(HELLOOS_ELF)
	$(OBJCOPY) $(OJCYFLAGS) $< $@

%.o : %.asm
	$(ASM) $(ASMBFLAGS) -o $@ $<
%.o : %.c
	$(CC) $(CFLAGS) -o $@ $<

#update_image:
#	$(MKDIR) -p /mnt/kernel
#	sudo mount floppy.img /mnt/kernel
#	sudo cp HelloOS.bin /mnt/kernel/hx_kernel
#	sleep 1
#	sudo umount /mnt/kernel
#
#umount_image:
#	sudo umount /mnt/kernel
#
#qemu:
#	qemu-system-i386 -display gtk -fda floppy.img -boot a
#	#add '-nographic' option if using server of linux distro, such as fedora-server,or "gtk initialization failed" error will occur.

