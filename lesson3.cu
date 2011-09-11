#include <stdio.h>

int main(void) {
	cudaDeviceProp prop;

	int count;
	cudaGetDeviceCount(&count);
	printf("We have %d devices\n", count);

	for(int i = 0; i < count; i++) {
		cudaGetDeviceProperties(&prop, i);

		printf("\t--- General information for device %i ---\n", i);
		printf("Name: %s\n", prop.name);
		printf("Compute capability: %d.%d\n", prop.major, prop.minor);
		printf("Clock rate: %d\n", prop.clockRate);

		printf("Device copy overlap: ");
		if(prop.deviceOverlap) {
			printf("Enabled\n");
		} else {
			printf("Disabled\n");
		}

		printf("Kernel execution timeout: ");
		if(prop.kernelExecTimeoutEnabled) {
			printf("Enabled\n");
		} else {
			printf("Disabled\n");
		}

		printf("\t--- Memory information for device %i ---\n", i);
		printf("Total global mem: %ld\n", prop.totalGlobalMem);
		printf("Total constant mem: %ld\n", prop.totalConstMem);
		printf("Max memory pitch: %ld\n", prop.memPitch);
		printf("Texture alignment: %ld\n", prop.textureAlignment);

		printf("\t--- MP information for device %i ---\n", i);
		printf("Multiprocessor count: %d\n", prop.multiProcessorCount);
		printf("Shared mem per mp: %ld\n", prop.sharedMemPerBlock);
		printf("Registers per mp: %d\n", prop.regsPerBlock);
		printf("Threads in warp: %d\n", prop.warpSize);
		printf("Max threads per block: %d\n", prop.maxThreadsPerBlock);
		printf("Max thread dimensions: (%d, %d, %d)\n", prop.maxThreadsDim[0], prop.maxThreadsDim[1], prop.maxThreadsDim[2]);
		printf("Max grid dimensions: (%d, %d, %d)\n", prop.maxGridSize[0], prop.maxGridSize[1], prop.maxGridSize[2]);
		printf("\n");
	}

	return 0;
}
