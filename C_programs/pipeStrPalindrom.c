#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<stdbool.h>

bool isPalindrom(char str[]){
	int len=strlen(str);
	for(int i=0;i<=len/2;i++){
		if(str[i]!=str[len-i-1]) return false;
	}
	return true;
}

int main(){
	int fd[2];
	char str[200];
	pid_t pid;
	pipe(fd);
	pid=fork();
	if(pid<0){
		printf("Fork failed\n");
		exit(0);
	}
	if(pid>0){//parent process
		close(fd[0]);
		printf("Enter your string: ");
		scanf("%[^\n]s",str);
		write(fd[1],&str,sizeof(str));
		close(fd[1]);
		wait(NULL);
	}
	else{
		close(fd[1]);
		read(fd[0],&str,sizeof(str));
		if(isPalindrom(str)){
			printf("Palindrom");
		}
		else{
			printf("Not palindrom");
		}
		close(fd[0]);
		exit(0);
	}
	return 0;
}
