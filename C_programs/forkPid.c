/*Write a C program that will create a child process by using the fork() system call , the
parent process will print the PID of itself, as well as the PID of the child. The child process
will also print the PID of its parent as well as the PID of itself.*/

#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/wait.h>

int main(){
	int fd[2];
	pid_t pid;
	pipe(fd);
	pid = fork();
	
	if(pid<0){
		printf("Fork failed\n");
		exit(0);
	}
	if(pid==0){//child process
		printf("Child process PID: %d ,parent PID: %d\n",getpid(),getppid());
	}
	else{
		printf("parent process PID: %d ,child PID: %d\n",getpid(),pid);
	}
	return 0;
}
