compile on intel 64bit linux using: 
    nasm -f elf64 -o output.o output.asm
link using:
    ld -s -o output output.o
