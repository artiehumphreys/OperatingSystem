GPPPARAMS = -m32 -ffreestanding -O2 -Wall -Wextra -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -m elf_i386 -T
objects = loader.o kernel.o

%.o: %.cpp
	i386-elf-g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s
	i386-elf-as $(ASPARAMS) -o $@ $<

mykernel.bin: linker.ld $(objects)
	i386-elf-ld $(LDPARAMS) linker.ld -o $@ $(objects)

install: mykernel.bin
	@echo "Manually copy mykernel.bin to your desired location or VM."
