################################################################################
# Automatically-generated file. Do not edit!
################################################################################

INCLUDES := \
    -I.././drivers/STM32_USB_Host_Library/Core/Inc \
	-I../drivers/BSP \
	-I../drivers/cmsis \
	-I../drivers/STM32F4xx_HAL_Driver/Inc \
	-I../Synth \
	-I../drivers/USBH_midi_class/Inc

ASM_DEFINES := $(DEFINES) -DSTM32F40_41xxx -DSTM32F407VG

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Synth/MIDI_application.c \
../Synth/adsr.c \
../Synth/audio_conf.c \
../Synth/blepvco.c \
../Synth/chorusFD.c \
../Synth/delay.c \
../Synth/drifter.c \
../Synth/main.c \
../Synth/math_tools.c \
../Synth/minblep_tables.c \
../Synth/notesTables.c \
../Synth/oscillators.c \
../Synth/phaser.c \
../Synth/random.c \
../Synth/resonantFilter.c \
../Synth/sequencer.c \
../Synth/sinetable.c \
../Synth/soundGen.c \
../Synth/stm32f4xx_it.c \
../Synth/system_stm32f4xx.c \
../Synth/timers.c \
../Synth/usbh_conf.c 

S_UPPER_SRCS += \
../Synth/startup_stm32f407xx.S 

OBJS += \
./Synth/MIDI_application.o \
./Synth/adsr.o \
./Synth/audio_conf.o \
./Synth/blepvco.o \
./Synth/chorusFD.o \
./Synth/delay.o \
./Synth/drifter.o \
./Synth/main.o \
./Synth/math_tools.o \
./Synth/minblep_tables.o \
./Synth/notesTables.o \
./Synth/oscillators.o \
./Synth/phaser.o \
./Synth/random.o \
./Synth/resonantFilter.o \
./Synth/sequencer.o \
./Synth/sinetable.o \
./Synth/soundGen.o \
./Synth/startup_stm32f407xx.o \
./Synth/stm32f4xx_it.o \
./Synth/system_stm32f4xx.o \
./Synth/timers.o \
./Synth/usbh_conf.o 

S_UPPER_DEPS += \
./Synth/startup_stm32f407xx.d 

C_DEPS += \
./Synth/MIDI_application.d \
./Synth/adsr.d \
./Synth/audio_conf.d \
./Synth/blepvco.d \
./Synth/chorusFD.d \
./Synth/delay.d \
./Synth/drifter.d \
./Synth/main.d \
./Synth/math_tools.d \
./Synth/minblep_tables.d \
./Synth/notesTables.d \
./Synth/oscillators.d \
./Synth/phaser.d \
./Synth/random.d \
./Synth/resonantFilter.d \
./Synth/sequencer.d \
./Synth/sinetable.d \
./Synth/soundGen.d \
./Synth/stm32f4xx_it.d \
./Synth/system_stm32f4xx.d \
./Synth/timers.d \
./Synth/usbh_conf.d 


# Each subdirectory must supply rules for building sources it contributes
Synth/%.o: ../Synth/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	$(GCC) $(ARCH_FLAGS) $(OPTIM_FLAGS) $(GCC_OPTIONS) $(GCC_WARNINGS) $(DEFINES) $(INCLUDES) $(C_STANDARD) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Synth/%.o: ../Synth/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	$(GCC) $(ARCH_FLAGS) $(OPTIM_FLAGS) $(GCC_OPTIONS) $(GCC_WARNINGS) $(ASM_DEFINES) -x assembler-with-cpp  -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


