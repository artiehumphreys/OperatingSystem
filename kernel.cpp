void printf(char *str)
{
    unsigned short *videoMemory = (unsigned short *)0xb8000;
    for (int i = 0; str[i] != '\0'; i++)
    {
        videoMemory[i] = (unsigned short)(videoMemory[i] & 0xFF00) | str[i];
    }
}

extern "C" void kernelMain(void *multibootStructure, unsigned int magicNumber)
{
    while (1)
        ;
}