cmake_minimum_required(VERSION 3.18.1)

add_library(datastore-jni SHARED
        datastore-jni.c)

# Include libraries needed for datastore-jni lib
target_link_libraries(datastore-jni
                      android
                      log)
