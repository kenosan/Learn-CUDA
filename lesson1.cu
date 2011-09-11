#include <stdio.h>

////////////
//	Notes:
//
//	 host: CPU + system's memory
// device: GPU + system's memory


/**
 * A kernel is a function that executes on the device.
 *
 * __global__ alerts the compiler that a function should be compiled to run on
 * a device instead of the host.
 *
 */
__global__ void kernel(void) {

}


int main(void) {
	// <<<>>> denote arguments passed to the runtime system. They are not arguments
	// to the device code but are parameters that will influence how the runtime
	// will launch the device code
	kernel<<<1,1>>>();

	printf("Hi, I'm learning CUDA!\n");

	return 0;
}
