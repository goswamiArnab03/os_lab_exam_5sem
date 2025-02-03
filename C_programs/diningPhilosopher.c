#include<stdio.h>
#include<unistd.h>
#include<pthread.h>
#include<semaphore.h>
#include<sys/wait.h>
#include<sys/types.h>

int i=0,p;
sem_t chopsticks[5];

void *din_phil(void *a){
	while(1){
		i=*(int*)a;
		sem_wait(&chopsticks[i]);
		sem_wait(&chopsticks[(i+1)%p]);
		printf("Philosopher %d is now holding chopsticks %d and %d\n",i,i,(i+1)%5);
		printf("Philosopher %d is now eating\n",i);
		sleep(1);
		sem_post(&chopsticks[i]);
		sem_post(&chopsticks[(i+1)%p]);
		printf("Philosopher %d is now leaving chopsticks %d and %d and thinking\n",i,i,(i+1)%5);
	}
}

int main(){
	p=5;
	for(int i=0;i<p;i++){
		sem_init(&chopsticks[i],0,1);
	}
	pthread_t th1[10];
	
	for(int i=0;i<p;i++){
		pthread_create(&th1[i],NULL,&din_phil,(int*)&i);
	}
	for(int i=0;i<p;i++){
		pthread_join(th1[i],NULL);
	}
	return 0;
}
