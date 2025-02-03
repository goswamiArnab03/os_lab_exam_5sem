#include<stdio.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdlib.h>
#include<math.h>
int main(){
	int fd[2],number;
	pid_t pid;
	pipe(fd);
	pid = fork();
	
	if(pid<0){
		printf("Fork failed");
		exit(1);
	}
	if(pid>0){//parent process
		close(fd[0]);
		printf("Enter a number: ");
		scanf("%d",&number);
		write(fd[1],&number,sizeof(number));
		close(fd[1]);
		wait(NULL);
	}
	else{//child process
		close(fd[1]);
		read(fd[0],&number,sizeof(number));
		close(fd[0]);
		if(number<=1){
			printf("Not prime\n");
			exit(0);
		}
		else{
			for(int i=2;i*i<=number;i++){
				if(number%2==0){
					printf("Not prime\n");
					exit(0);
				}
			}
			printf("Prime\n");
		}
		exit(0);
	}
	return 0;
}
