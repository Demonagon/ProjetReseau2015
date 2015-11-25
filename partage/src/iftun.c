#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <sys/socket.h> 
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <sys/select.h>
#include <sys/time.h>

#include <unistd.h>
#include <fcntl.h>
#include <linux/if.h>
#include <linux/if_tun.h>

#define DEBUG printf("passage à la ligne %d\n",__line__);
#define BUFFER_SIZE 1024

int tun_alloc(char *dev)
{
	struct ifreq ifr;
	int fd, err;

	if( (fd = open("/dev/net/tun", O_RDWR)) < 0 ){
		perror("alloc tun");
		exit(1);
	}

	memset(&ifr, 0, sizeof(ifr));
 
	/* Flags: IFF_TUN   - TUN device (no Ethernet headers) 
	*        IFF_TAP   - TAP device  
	*
	*        IFF_NO_PI - Do not provide packet information  
	*/ 
	ifr.ifr_flags = IFF_TUN; 
	//ifr.ifr_flags = IFF_NO_PI; 
	if( *dev )
		strncpy(ifr.ifr_name, dev, IFNAMSIZ);

	if( (err = ioctl(fd, TUNSETIFF, (void *) &ifr)) < 0 ){
		close(fd);
		perror("ioctl");
		return err;
	}
	strcpy(dev, ifr.ifr_name);
	return fd;
}

/*void read_src(int src, char * buffer, int buffer_size) {
	int current_size = strlen(buffer);
	if( current_size == buffer_size ) return;
	read(src, buffer + current_size, buffer_size - current_size);
}

void write_dest(int dest, char * buffer, int buffer_size) {
	char temp_buff[BUFFER_SIZE];
	int current_size = strlen(buffer);
	if( current_size == 0 ) return;
	ssize_t r = write(dest, buffer, current_size);
	strncpy(temp_buff, buffer + r, current_size - r); 
	strncpy(buffer, temp_buff, current_size - r);
}

void prepare_select(int src, int dest, fd_set * set_read, fd_set * set_write, int * max_fd)
{
	FD_ZERO(set_read);
	FD_ZERO(set_write);
	FD_SET(src, set_read);
	FD_SET(dest, set_write);
	*max_fd = src > dest ? src + 1 : dest + 1;
}*/

/*void repeat(int src, int dest)
{
	struct timeval t;
	fd_set set_read;
	fd_set set_write;
	int max_fd = 0;
	char buffer[BUFFER_SIZE] = "";

	t.tv_sec = 0;
	t.tv_usec = 0;

	for(;;) {
		prepare_select(src, dest, &set_read, &set_write, &max_fd);
		select(max_fd, &set_read, &set_write, NULL, NULL);

		if( FD_ISSET(src, &set_read) ) read_src(src, buffer, BUFFER_SIZE);

		if( FD_ISSET(dest, &set_write) ) write_dest(dest, buffer, BUFFER_SIZE);
	}
}*/

void repeat(int src, int dest) {
	char buffer[BUFFER_SIZE] = "";

	for(;;) {
		ssize_t size = read(src, buffer, BUFFER_SIZE);
		write(dest, buffer, size);
	}
}

int main_test_repeat_01(int argc, char ** argv) {
	if( argc < 2 ) {
		fprintf(stderr, "Usage : %s [device name]\n", argv[0]);
		exit(-1);
	}
	char name[20] = "";
	strcpy(name, argv[1]);
	int fd = tun_alloc(name);
	fprintf(stderr, "%d %s\n", fd, name);
	repeat(fd, 1);

	return 0;
}

int main (int argc, char** argv){
	return main_test_repeat_01(argc, argv);
}
