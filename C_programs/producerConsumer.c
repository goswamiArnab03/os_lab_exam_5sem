#include<stdio.h>
#include<pthread.h>
#include<unistd.h>
#include<semaphore.h>

int buffer[5],in=0,out=0,item1=0,item2=0;
sem_t mutex,full,empty;

void* producer(void* a){
	while(1){
		sem_wait(&empty);
		sem_wait(&mutex);
		item1++;
		printf("Producer %d produced item: %d\n",*(int*)a,item1);
		buffer[in]=item1;
		in=(in+1)%5;
		sem_post(&mutex);
		sem_post(&full);
		sleep(1);
	}
}

void* consumer(void* a){
	while(1){
		sem_wait(&full);
		sem_wait(&mutex);
		item2=buffer[out];
		printf("Consumer %d consumed item: %d\n",*(int*)a,item2);
		out=(out+1)%5;
		sem_post(&mutex);
		sem_post(&empty);
		sleep(1);
	}
}

int main(){
	int p,c;
	printf("Enter no of producer:");scanf("%d",&p);
	printf("Enter no of consumer:");scanf("%d",&c);
	pthread_t th1[10],th2[10];
	sem_init(&full,0,5);
	sem_init(&mutex,0,1);
	sem_init(&empty,0,5);
	
	for(int i=0;i<p;i++){
		pthread_create(&th1[i],NULL,producer,(int*)&i);
	}
	for(int i=0;i<c;i++){
		pthread_create(&th2[i],NULL,consumer,(int*)&i);
	}
	
	for(int i=0;i<p;i++){
		pthread_join(th1[i],NULL);
	}
	for(int i=0;i<c;i++){
		pthread_join(th2[i],NULL);
	}
	
	return 0;
}
