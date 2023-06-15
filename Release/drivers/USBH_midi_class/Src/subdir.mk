################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/USBH_midi_class/Src/usbh_MIDI.c 

OBJS += \
./drivers/USBH_midi_class/Src/usbh_MIDI.o 

C_DEPS += \
./drivers/USBH_midi_class/Src/usbh_MIDI.d 

INCLUDES := \
    -I.././drivers/STM32_USB_Host_Library/Core/Inc \
	-I../drivers/BSP \
	-I../drivers/cmsis \
	-I../drivers/STM32F4xx_HAL_Driver/Inc \
	-I../Synth \
	-I../drivers/USBH_midi_class/Inc

# Each subdirectory must supply rules for building sources it contributes
drivers/USBH_midi_class/Src/%.o: ../drivers/USBH_midi_class/Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	$(GCC) $(ARCH_FLAGS) $(OPTIM_FLAGS) $(GCC_OPTIONS) $(GCC_WARNINGS) $(DEFINES) $(INCLUDES) $(C_STANDARD) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


