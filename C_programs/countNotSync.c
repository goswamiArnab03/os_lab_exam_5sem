/*a count variable is shared among two threads, each thread will increment the count.
show the output if the threads are not synchronized.*/


#include<stdio.h>
#include<unistd.h>
#include<pthread.h>

int count=0;

void* incr(void* args){
	int id=*(int*)args;
	for(int i=0;i<2;i++){
		printf("Thread %d now reads the count\n",id);
		int temp=count;
		temp++;
		printf("Thread %d increments the count,now count%d\n",id,temp);
		count=temp;
		usleep(3);
	}
	return NULL;
}

int main(){
	pthread_t th1,th2;
	int th1_id=1,th2_id=2;
	pthread_create(&th1,NULL,incr,&th1_id);
	pthread_create(&th2,NULL,incr,&th2_id);
	pthread_join(th1,NULL);
	pthread_join(th2,NULL);
	printf("Finally the count %d\n",count);
	return 0;
}
