#include<stdio.h>
#include<unistd.h>
#include<pthread.h>

pthread_mutex_t mutex;

int count=0;

void* incr(void* id){
	int id1=*(int*)id;
	pthread_mutex_lock(&mutex);
	printf("Thread %d incrementing the count\n",id1);
	count++;
	printf("After incrementing, the count = %d\n",count);
	pthread_mutex_unlock(&mutex);
}

int main(){
	pthread_mutex_init(&mutex,NULL);
	pthread_t th[3];
	int th_ids[3];
	
	for(int i=0;i<3;i++){
		th_ids[i]=i+1;
		pthread_create(&th[i],NULL,incr,&th_ids[i]);
	}
	for(int i=0;i<3;i++){
		pthread_join(th[i],NULL);
	}
	printf("Final count val: %d\n",count);
	return 0;
}
