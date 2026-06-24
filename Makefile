OBJECTS = loader.o kernel.o vga.o
CC = gcc
CFLAGS = -O0 -m32 -Iinc -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -ffreestanding -Wall -Wextra -Werror -c
LDFLAGS = -T link.ld -melf_i386
AS = nasm
ASFLAGS = -f elf32


all: kernel.elf
	grub-mkrescue -o niggel.iso iso -d /usr/lib/grub/i386-pc

kernel.elf: $(OBJECTS)
	ld $(LDFLAGS) $(OBJECTS) -o iso/boot/kernel.elf

%.o: src/%.c
	$(CC) $(CFLAGS) $< -o $@

%.o: src/%.s
	$(AS) $(ASFLAGS) $< -o $@

run:
	bochs -f bochsrc

clean:
	rm -rf *.o iso/boot/kernel.elf niggel.iso
