#include <cuda.h>
#include <iostream>

int main() {
    CUstream stream;

    // Initialize the CUDA Driver API
    cuInit(0);

    // Create a CUDA stream
    cuStreamCreate(&stream, CU_STREAM_DEFAULT);

    CUresult queryResult = cuStreamQuery(stream);

    if (queryResult == CUDA_SUCCESS) {
        std::cout << "Kernel execution has completed." << std::endl;
    } else if (queryResult == CUDA_ERROR_NOT_READY) {
        std::cout << "Kernel execution has not yet completed." << std::endl;
    } else {
        std::cerr << "Failed to query the stream status." << std::endl;
    }

    // Clean up resources
    cuStreamDestroy(stream);

    return 0;
}