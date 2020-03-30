#include <stdio.h>
#include <unistd.h>
 
int main()
{
    int id;
    printf("Hello, World!\n");
     
    id=fork();
    if(id>0)
    {
        /*parent process*/
        printf("This is parent section [Process id: %d].\n",getpid());
    }
    else if(id==0)
    {
        /*child process*/
        printf("fork created [Process id: %d].\n",getpid());
        printf("fork parent process id: %d.\n",getppid());
    }
    else
    {
        /*fork creation faile*/
        printf("fork creation failed!!!\n");
    }
 
    return 0;
}
/*
mca49@mca49-desktop:~$ gcc fork3.c
mca49@mca49-desktop:~$ ./a.out
Hello, World!
This is parent section [Process id: 10671].
fork created [Process id: 10672].
fork parent process id: 1064.
mca49@mca49-desktop:~$ ^C
mca49@mca49-desktop:~$ 


*/
