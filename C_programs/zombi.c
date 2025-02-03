#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdlib.h>

int main(){
	int fd[2];
	pipe(fd);
	pid_t pid;
	pid=fork();
	
	if(pid<0){
		printf("Fork failed\n");
		exit(0);
	}
	if(pid==0){
		printf("Child process --> PID: %d PPID: %d\n",getpid(),getppid());
		exit(0);
	}
	else{
		wait(NULL);
		printf("Parent process --> PID: %d PPID: %d\n",getpid(),getppid());
		printf("Child process(Zombi) --> PID: %d\n",pid);
		
		sleep(5);
		printf("Parent process checking process table\n");
		wait(NULL);
		printf("Zombie process cleaned.Parent process exist\n");
	}
	return 0;
}
