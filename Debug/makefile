################################################################################

PROJECT_NAME := Dekrispator_v2

GCC := arm-none-eabi-gcc
GCC_OPTIONS := -ffunction-sections -fdata-sections -fsingle-precision-constant -flto
GCC_WARNINGS := -Wuninitialized -Wall -Wshadow -Wconversion -Wfloat-equal -Wunused

GCC_DRIVER_BUILD_WARNINGS = -Wall
#GCC_DRIVER_BUILD_WARNINGS += -Wuninitialized -Wshadow -Wfloat-equal -Wunused
#GCC_DRIVER_BUILD_WARNINGS += -Wconversion

ARCH_FLAGS := \
   -mcpu=cortex-m4 \
   -mthumb \
   -mfloat-abi=hard \
   -mfpu=fpv4-sp-d16
DEFINES := -D__FPU_USED=1 -DHSE_VALUE=8000000 -DUSE_HAL_DRIVER -DUSE_STM32F4_DISCO -DSTM32F407xx
OPTIM_FLAGS := -O0 -g
C_STANDARD := -std=c11

#-include ../makefile.init

RM := rm -rf

# All Target
all: $(PROJECT_NAME).elf secondary-outputs


# All of the sources participating in the build are defined here
-include sources.mk
-include drivers/USBH_midi_class/Src/subdir.mk
-include drivers/STM32_USB_Host_Library/Core/Src/subdir.mk
-include drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include drivers/BSP/subdir.mk
-include Synth/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH = $(PROJECT_NAME).bin
SECONDARY_LIST = $(PROJECT_NAME).lst
SECONDARY_MAP = $(PROJECT_NAME).map

# All Target
all: $(PROJECT_NAME).elf secondary-outputs

# Tool invocations
$(PROJECT_NAME).elf $(PROJECT_NAME).map &: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross ARM C Linker'
	$(GCC) $(ARCH_FLAGS) $(OPTIM_FLAGS) $(GCC_OPTIONS) $(GCC_WARNINGS) -T "../STM32F407VG_FLASH.ld" -Xlinker --gc-sections -Wl,-Map,$(PROJECT_NAME).map --specs=nosys.specs -o $(PROJECT_NAME).elf $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

$(PROJECT_NAME).bin: $(PROJECT_NAME).elf
	@echo 'Invoking: Cross ARM GNU Create Flash Image'
	arm-none-eabi-objcopy -O binary $(PROJECT_NAME).elf $(PROJECT_NAME).bin
	@echo 'Finished building: $@'
	@echo ' '

$(PROJECT_NAME).lst: $(PROJECT_NAME).elf
	@echo 'Invoking: Cross ARM GNU Create Listing'
	arm-none-eabi-objdump --source --all-headers --demangle --line-numbers --wide $(PROJECT_NAME).elf > $(PROJECT_NAME).lst
	@echo 'Finished building: $@'
	@echo ' '

size: $(PROJECT_NAME).elf
	@echo 'Invoking: Cross ARM GNU Print Size'
	arm-none-eabi-size --format=berkeley --totals $(PROJECT_NAME).elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS) $(SECONDARY_FLASH) $(SECONDARY_LIST) $(SECONDARY_MAP) $(ASM_DEPS) $(S_UPPER_DEPS) $(C_DEPS) $(PROJECT_NAME).elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_LIST) $(SECONDARY_MAP)

flash: $(PROJECT_NAME).bin
	st-flash write $(PROJECT_NAME).bin 0x8000000

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
