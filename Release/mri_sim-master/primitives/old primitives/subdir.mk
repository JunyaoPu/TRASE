################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../mri_sim-master/primitives/old\ primitives/Line_XY.cpp \
../mri_sim-master/primitives/old\ primitives/MultiSphere.cpp 

OBJS += \
./mri_sim-master/primitives/old\ primitives/Line_XY.o \
./mri_sim-master/primitives/old\ primitives/MultiSphere.o 

CPP_DEPS += \
./mri_sim-master/primitives/old\ primitives/Line_XY.d \
./mri_sim-master/primitives/old\ primitives/MultiSphere.d 


# Each subdirectory must supply rules for building sources it contributes
mri_sim-master/primitives/old\ primitives/Line_XY.o: ../mri_sim-master/primitives/old\ primitives/Line_XY.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	/usr/local/cuda-9.1/bin/nvcc -I/usr/local/cuda/lib64/ -I/home/graphics/Dev/external_sources/cub-1.7.4 -I/home/junyao/Documents/cub-1.7.4 -O3 -std=c++11 -gencode arch=compute_61,code=sm_61  -odir "mri_sim-master/primitives/old primitives" -M -o "$(@:%.o=%.d)" "$<"
	/usr/local/cuda-9.1/bin/nvcc -I/usr/local/cuda/lib64/ -I/home/graphics/Dev/external_sources/cub-1.7.4 -I/home/junyao/Documents/cub-1.7.4 -O3 -std=c++11 --compile --relocatable-device-code=true -gencode arch=compute_61,code=compute_61 -gencode arch=compute_61,code=sm_61  -x cu -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

mri_sim-master/primitives/old\ primitives/MultiSphere.o: ../mri_sim-master/primitives/old\ primitives/MultiSphere.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	/usr/local/cuda-9.1/bin/nvcc -I/usr/local/cuda/lib64/ -I/home/graphics/Dev/external_sources/cub-1.7.4 -I/home/junyao/Documents/cub-1.7.4 -O3 -std=c++11 -gencode arch=compute_61,code=sm_61  -odir "mri_sim-master/primitives/old primitives" -M -o "$(@:%.o=%.d)" "$<"
	/usr/local/cuda-9.1/bin/nvcc -I/usr/local/cuda/lib64/ -I/home/graphics/Dev/external_sources/cub-1.7.4 -I/home/junyao/Documents/cub-1.7.4 -O3 -std=c++11 --compile --relocatable-device-code=true -gencode arch=compute_61,code=compute_61 -gencode arch=compute_61,code=sm_61  -x cu -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


