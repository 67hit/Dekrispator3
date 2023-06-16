################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/STM32_USB_Host_Library/Core/Src/usbh_core.c \
../drivers/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.c \
../drivers/STM32_USB_Host_Library/Core/Src/usbh_ioreq.c \
../drivers/STM32_USB_Host_Library/Core/Src/usbh_pipes.c 

OBJS += \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_core.o \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.o \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_ioreq.o \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_pipes.o 

C_DEPS += \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_core.d \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_ctlreq.d \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_ioreq.d \
./drivers/STM32_USB_Host_Library/Core/Src/usbh_pipes.d 

INCLUDES := \
    -I.././drivers/STM32_USB_Host_Library/Core/Inc \
	-I../drivers/BSP \
	-I../drivers/cmsis \
	-I../drivers/STM32F4xx_HAL_Driver/Inc \
	-I../Synth \
	-I../drivers/USBH_midi_class/Inc

# Each subdirectory must supply rules for building sources it contributes
drivers/STM32_USB_Host_Library/Core/Src/%.o: ../drivers/STM32_USB_Host_Library/Core/Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	$(GCC) $(ARCH_FLAGS) $(OPTIM_FLAGS) $(GCC_OPTIONS) $(GCC_DRIVER_BUILD_WARNINGS) $(DEFINES) $(INCLUDES) $(C_STANDARD) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


