/*Write a C program that will create a child process. The parent process will announce that
it is the parent process and taking a input from user it will send it to the child process. The
child will announce that it is the child process and will display the Fibonacci series of the
number (Up to the range).*/

#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdlib.h>

int main(){
	int fd[2],n;
	pid_t pid;
	pipe(fd);
	pid=fork();
	if(pid<0){
		printf("Fork failed\n");
		exit(1);
	}
	if(pid>0){//parent process
		close(fd[0]);
		printf("In parent process\n");
		printf("Enter the no:");
		scanf("%d",&n);
		write(fd[1],&n,sizeof(n));
		close(fd[1]);
		wait(NULL);
	}
	else{//child process'
		close(fd[1]);
		read(fd[0],&n,sizeof(n));
		close(fd[0]);
		printf("In child process\n");
		printf("Fibonacci series up to %d: ", n);

        if (n >= 1) {
            int a = 0, b = 1;
            printf("%d ", a); 
            if (n >= 2) {
                printf("%d ", b); 
                for (int i = 3; i <= n; i++) {
                    int c = a + b;
                    printf("%d ", c);
                    a = b;
                    b = c;
                }
            }
        } else {
            printf("Invalid input. Please enter a positive number.");
        }

        printf("\n");
	}
	return 0;
}
			
