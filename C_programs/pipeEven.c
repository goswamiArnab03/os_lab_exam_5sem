#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdlib.h>

int main(){
	int fd[2],number;
	pid_t pid;
	pipe(fd);
	
	pid=fork();
	
	if(pid==-1){
		printf("Fork failed");
		exit(1);
	}
	if(pid>0){//parent process
		close(fd[0]);
		
		printf("Enter a no: ");
		scanf("%d",&number);
		write(fd[1],&number,sizeof(number));
		close(fd[1]);
		wait(NULL);
	}
	else{//child proces
		close(fd[1]);
		read(fd[0],&number,sizeof(number));
		close(fd[0]);
		if(number%2==0){
			printf("Even");
		}
		else{
			printf("Odd");
		}
		exit(0);
	}
	return 0;
}
