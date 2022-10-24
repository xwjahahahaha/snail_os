//
// Created by 许文杰 on 2022/7/17.
//
int _strwrite(char* string) {
    char* p_strdst = (char*)(0xb8000); // 指向现存的开始地址
    while (*string) {
        *p_strdst = *string++;
        p_strdst += 2;      // +2是不管控制颜色的第二个字节
    }

    return 0;
}

int printf(char* fmt, ...) {
    _strwrite(fmt);
    return 0;
}