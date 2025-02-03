#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>
#include<sys/types.h>
#include<stdlib.h>

int main(){
	int fd[2];
	pipe(fd);
	pid_t pid1,pid2;
	
	printf("Parent process PID: %d and PPID: %d\n",getpid(),getppid());
	
	pid1=fork();
	if(pid1<0){
		printf("Fork failed\n");
		exit(1);
	}
	if(pid1==0){//First child
		printf("The child1 --> PID: %d PPID: %d\n",getpid(),getppid());
		
		pid2=fork();
		
		if(pid2<0){
			printf("Fork failed\n");
			exit(1);
		}
		if(pid2==0){
			printf("GrandChild --> PID: %d PPID: %d\n",getpid(),getppid());
		}
		else{
			wait(NULL);
		}
	}
	else{//parent process
		pid2=fork();
		if(pid2<0){
			printf("Fork failed\n");
			exit(1);
		}
		if(pid2==0){
			printf("Child2 --> PID: %d PPID: %d\n",getpid(),getppid());
		}
		else{
			wait(NULL);
		}
	}
	return 0;
}

/* The process tree
Parent (PID = 1001)
├── Child 1 (PID = 1002)
│   └── Grandchild (PID = 1003)
└── Child 2 (PID = 1004)
*/
