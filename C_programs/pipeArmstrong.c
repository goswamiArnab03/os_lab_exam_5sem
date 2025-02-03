#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>
#include<sys/types.h>
#include<stdlib.h>
#include<math.h>
#include<stdbool.h>
bool isArmstrong(int n){
	int temp=n;
	int count=0;
	while(temp!=0){
		temp/=10;
		count++;
	}
	int temp1=n;
	int newno=0;
	while(temp1!=0){
		int digit=temp1%10;
		newno+=pow(digit,count);
		temp1/=10;
	}
	return newno==n;
}


int main(){
	int fd[2],number;
	pid_t pid;
	pipe(fd);
	
	pid=fork();
	
	if(pid<0){
		printf("Fork failed\n");
		exit(0);
	}
	if(pid>0){//parent process
		close(fd[0]);
		printf("Enter a no\n");
		scanf("%d",&number);
		write(fd[1],&number,sizeof(number));
		close(fd[1]);
		wait(NULL);
	}
	else{//child process
		close(fd[1]);
		read(fd[0],&number,sizeof(number));
		close(fd[0]);
		if(isArmstrong(number)){
			printf("This is Armstrong\n");
		}
		else{
			printf("This is not Armstrong\n");
		}
		exit(0);
	}
	return 0;
}
