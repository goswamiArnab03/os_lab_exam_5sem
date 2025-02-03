#include<stdio.h>
#include<pthread.h>
#include<unistd.h>

pthread_mutex_t mutex;

void* reads(void* args){
	int id=*(int*)args;
	pthread_mutex_lock(&mutex);
	printf("The friend %d is reading the book\n",id);
	sleep(5);
	printf("The friend %d is done reading\n",id);
	pthread_mutex_unlock(&mutex);
	return NULL;
}

int main(){
	pthread_t th[5];
	int th_id[5];
	pthread_mutex_init(&mutex,NULL);
	for(int i=0;i<5;i++){
		th_id[i]=i+1;
		pthread_create(&th[i],NULL,reads,&th_id[i]);
	}
	for(int i=0;i<5;i++){
		pthread_join(th[i],NULL);
	}
	return 0;
}
