#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#

########################################################################################
# make sure that a valid path is set bellow                                            #
# this is an Interop module so this file should be placed in the CMakes module folder  #
# usually CMake\Modules                                                                #
########################################################################################

# native code directory
set(BASE_PATH_FOR_THIS_MODULE ${PROJECT_SOURCE_DIR}/InteropAssemblies/cvpcs.Esp32.Native)


# set include directories
list(APPEND cvpcs.Esp32.Native_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Core)
list(APPEND cvpcs.Esp32.Native_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Include)
list(APPEND cvpcs.Esp32.Native_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/HAL/Include)
list(APPEND cvpcs.Esp32.Native_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/PAL/Include)
list(APPEND cvpcs.Esp32.Native_INCLUDE_DIRS ${BASE_PATH_FOR_THIS_MODULE})

# set include directories for Esp32 IDF
list(APPEND cvpcs.Esp32.Native_INCLUDE_DIRS ${ESP32_IDF_PATH}/components/esp_adc_cal/include)


# source files
set(cvpcs.Esp32.Native_SRCS

    cvpcs_Esp32_Native.cpp


    cvpcs_Esp32_Native_cvpcs_Esp32_Native_AdcChannelExtensions_mshl.cpp
    cvpcs_Esp32_Native_cvpcs_Esp32_Native_AdcChannelExtensions.cpp

)

foreach(SRC_FILE ${cvpcs.Esp32.Native_SRCS})

    set(cvpcs.Esp32.Native_SRC_FILE SRC_FILE-NOTFOUND)

    find_file(cvpcs.Esp32.Native_SRC_FILE ${SRC_FILE}
        PATHS
	        ${BASE_PATH_FOR_THIS_MODULE}
	        ${TARGET_BASE_LOCATION}
            ${PROJECT_SOURCE_DIR}/src/cvpcs.Esp32.Native

	    CMAKE_FIND_ROOT_PATH_BOTH
    )

    if (BUILD_VERBOSE)
        message("${SRC_FILE} >> ${cvpcs.Esp32.Native_SRC_FILE}")
    endif()

    list(APPEND cvpcs.Esp32.Native_SOURCES ${cvpcs.Esp32.Native_SRC_FILE})

endforeach()

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(cvpcs.Esp32.Native DEFAULT_MSG cvpcs.Esp32.Native_INCLUDE_DIRS cvpcs.Esp32.Native_SOURCES)
