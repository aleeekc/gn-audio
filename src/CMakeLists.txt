# Get inspiration from https://github.com/camillevuillaume/stm32_helloworld/blob/main/testprogram/CMakeLists.txt

enable_language(C ASM)

set(SOURCES
    ...........
)

# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DUSE_HAL_DRIVER -DSTM32F405xx -I${CMAKE_CURRENT_SOURCE_DIR}/Core/Inc -I${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc -I${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32F4xx/Include -I${CMAKE_CURRENT_SOURCE_DIR}/Drivers/CMSIS/Include ")

# set(CMAKE_EXE_LINKER_FLAGS "-specs=nano.specs -specs=nosys.specs -T${CMAKE_CURRENT_SOURCE_DIR}/STM32F405RGTx_FLASH.ld -lc -lm -lnosys -Wl,-Map=test.map,--cref -Wl,--gc-sections")

add_executable(test.elf ${SOURCES})

target_link_libraries(test.elf PRIVATE mylibrary)
