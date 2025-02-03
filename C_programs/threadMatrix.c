/*Create two threads one thread will take the input of a matrix and 2nd thread will check the matrix is symmetric or not.*/

#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
#include<unistd.h>
#include<stdlib.h>
int arr[10][10],rows,cols;

sem_t mutex1,mutex2;

void* thread1(void* args){
	sem_post(&mutex1);
	printf("Enter the no of row: ");scanf("%d",&rows);
	printf("Enter the no of cols: ");scanf("%d",&cols);
	printf("Enter the matrix\n");
	for(int i=0;i<rows;i++){
		for(int j=0;j<cols;j++){
			scanf("%d",&arr[i][j]);
		}
	}
	sem_post(&mutex2);
	sleep(1);
}

void* thread2(void* args){
	sem_wait(&mutex2);
	for(int i=0;i<rows;i++){
		for(int j=0;j<cols;j++){
			if(arr[i][j]!=arr[j][i]){
				printf("Its not symmetric\n");
				sem_post(&mutex2);
				exit(0);
			}
		}
	}
	printf("Its symmetric\n");
	sem_post(&mutex2);
	
}

int main(){
	sem_init(&mutex1,0,1);
	sem_init(&mutex1,0,0);
	pthread_t th1,th2;
	pthread_create(&th1,NULL,thread1,NULL);
	pthread_create(&th2,NULL,thread2,NULL);
	pthread_join(th1,NULL);
	pthread_join(th2,NULL);
	return 0;
}
