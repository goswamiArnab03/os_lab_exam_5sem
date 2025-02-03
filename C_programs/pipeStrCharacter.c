#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>
#include<sys/wait.h>
#include<string.h>
int main(){
	int fd[2];
	char str[20];
	pid_t pid;
	
	pipe(fd);
	pid=fork();
	
	if(pid<0){
		printf("Fork failed");
		exit(0);
	}
	
	if(pid>0){
		close(fd[0]);
		printf("Enter your string: ");
		scanf("%[^\n]s",str);
		write(fd[1],str,sizeof(str));
		close(fd[1]);
		wait(NULL);
	}
	else{
		close(fd[1]);
		read(fd[0],str,sizeof(str));
		int len=strlen(str);
		int alpha=0,numeric=0,special=0;
		for(int i=0;i<len;i++){
			char ch=str[i];
			if((ch>='a' && ch<='z') || (ch>='A' && ch<='Z')) alpha++;
			else if(ch>='0' && ch<='9') numeric++;
			else special++;
		}
		printf("Alphabate: %d\n",alpha);
		printf("Numeric: %d\n",numeric);
		printf("Special character: %d\n",special);
		close(fd[0]);
		exit(0);
	}
	return 0;
}
		
