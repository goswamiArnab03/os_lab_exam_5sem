/*Write a C program to create two threads. 1st thread will take input of a matrix and 2nd thread will perform Transpose of the matrix i.e after 1st thread, 2nd thread will start execution.*/

#include<stdio.h>
#include<unistd.h>
#include<pthread.h>


int arr[10][10],trans[10][10],rows,cols;

pthread_mutex_t mutex;

void* input(void* args){
	pthread_mutex_lock(&mutex);
	printf("Enter no of rows: ");scanf("%d",&rows);
	printf("Enter no of cols: ");scanf("%d",&cols);
	printf("Enter the matrix: \n");
	for(int i=0;i<rows;i++){
		for(int j=0;j<cols;j++){
			scanf("%d",&arr[i][j]);
		}
	}
	pthread_mutex_unlock(&mutex);
	return NULL;
}

void* output(void* args){
	pthread_mutex_lock(&mutex);
	for(int i=0;i<rows;i++){
		for(int j=0;j<cols;j++){
			trans[j][i]=arr[i][j];
		}
	}
	printf("The transpose matrix: \n");
	for(int i=0;i<rows;i++){
		for(int j=0;j<cols;j++){
			printf("%d ",trans[i][j]);
		}
		printf("\n");
	}
	pthread_mutex_unlock(&mutex);
	return NULL;
}

int main(){
	pthread_t th1,th2;
	pthread_mutex_init(&mutex,NULL);
	pthread_create(&th1,NULL,&input,NULL);
	pthread_create(&th2,NULL,&output,NULL);
	pthread_join(th1,NULL);
	pthread_join(th2,NULL);
	return 0;
}
