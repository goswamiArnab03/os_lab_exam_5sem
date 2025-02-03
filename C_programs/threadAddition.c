#include<stdio.h>
#include<stdlib.h>
#include<semaphore.h>
#include<pthread.h>

int a,b,result;
sem_t mutex1,mutex2;

void* thread1(void* arg){
	printf("Thread1: Enter a: ");
	scanf("%d",&a);
	sem_post(&mutex1);
	return NULL;
}

void* thread2(void* arg){
	sem_wait(&mutex1);
	printf("Thread2: Enter b: ");
	scanf("%d",&b);
	sem_post(&mutex2);
	return NULL;
}

void* thread3(void* arg){
	sem_wait(&mutex2);
	result=a+b;
	printf("Thread3: the result: %d\n",result);
	return NULL;
}

int main(){
	pthread_t t1,t2,t3;
	
	sem_init(&mutex1,0,0);
	sem_init(&mutex2,0,0);
	
	pthread_create(&t1,NULL,thread1,NULL);
	pthread_create(&t2,NULL,thread2,NULL);
	pthread_create(&t3,NULL,thread3,NULL);
	
	pthread_join(t1,NULL);
	pthread_join(t2,NULL);
	pthread_join(t3,NULL);
	
	return 0;
}
