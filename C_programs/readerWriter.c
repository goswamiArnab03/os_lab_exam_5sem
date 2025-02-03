#include<stdio.h>
#include<unistd.h>
#include<pthread.h>
#include<semaphore.h>

sem_t db,mutex;
int rc=0;

void* reader(void* a){
	while(1){
		sem_wait(&mutex);
		rc++;
		if(rc==1){
			sem_wait(&db);
		}
		sem_post(&mutex);
		printf("The reader %d is reading\n",*(int*)a);
		sem_wait(&mutex);
		rc--;
		if(rc==0){
			sem_post(&db);
		}
		sem_post(&mutex);
		sleep(1);
	}
}

void* writer(void* a){
	while(1){
		sem_wait(&db);
		printf("The writer %d is writing\n",*(int*)a);
		sem_post(&db);
		sleep(1);
	}
}

int main(){
	pthread_t readers[10],writers[10];
	sem_init(&mutex,0,1);
	sem_init(&db,0,1);
	for(int i=0;i<5;i++){
		pthread_create(&readers[i],NULL,reader,(int*)&i);
	}
	for(int i=0;i<2;i++){
		pthread_create(&writers[i],NULL,writer,(int*)&i);
	}
	for(int i=0;i<5;i++){
		pthread_join(readers[i],NULL);
	}
	for(int i=0;i<2;i++){
		pthread_join(writers[i],NULL);
	}
	return 0;
}
