#include <stdio.h>

__global__ void add(int a, int b, int *c) {
	*c = a + b;
}


int main(void) {
	int c, *dev_c;

	// Allocate memory on the device
	cudaMalloc( (void**)&dev_c, sizeof(int) );
	add<<<1,1>>>(2, 7, dev_c);

	// IMPORTANT:
	// Do not dereference pointer returned by cudaMalloc() from code that
	// executes on the host.
	//
	// Host code may pass this pointer around, perform arithmetic on it,
	// or even cast it to a different type, but you CAN NOT use it to read and
	// write from memory.

	cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);
	printf("2 + 7 = %d\n", c);
	cudaFree(dev_c);

	return 0;
}
