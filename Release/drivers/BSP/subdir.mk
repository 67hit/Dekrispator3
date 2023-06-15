################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/BSP/cs43l22.c \
../drivers/BSP/lis302dl.c \
../drivers/BSP/lis3dsh.c \
../drivers/BSP/stm32f4_discovery.c \
../drivers/BSP/stm32f4_discovery_accelerometer.c \
../drivers/BSP/stm32f4_discovery_audio.c 

OBJS += \
./drivers/BSP/cs43l22.o \
./drivers/BSP/lis302dl.o \
./drivers/BSP/lis3dsh.o \
./drivers/BSP/stm32f4_discovery.o \
./drivers/BSP/stm32f4_discovery_accelerometer.o \
./drivers/BSP/stm32f4_discovery_audio.o 

C_DEPS += \
./drivers/BSP/cs43l22.d \
./drivers/BSP/lis302dl.d \
./drivers/BSP/lis3dsh.d \
./drivers/BSP/stm32f4_discovery.d \
./drivers/BSP/stm32f4_discovery_accelerometer.d \
./drivers/BSP/stm32f4_discovery_audio.d 

INCLUDES := \
    -I.././drivers/STM32_USB_Host_Library/Core/Inc \
	-I../drivers/BSP \
	-I../drivers/cmsis \
	-I../drivers/STM32F4xx_HAL_Driver/Inc \
	-I../Synth \
	-I../drivers/USBH_midi_class/Inc

# Each subdirectory must supply rules for building sources it contributes
drivers/BSP/%.o: ../drivers/BSP/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	$(GCC) $(ARCH_FLAGS) $(OPTIM_FLAGS) $(GCC_OPTIONS) $(GCC_WARNINGS) $(DEFINES) $(INCLUDES) $(C_STANDARD) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
