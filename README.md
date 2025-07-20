|
|-.devcontainer // Run a docker image with all tools needed (i.e. arm build chain) online
|
|-.github // contains github workfows / github specific files
|
|- src // stm32 project code
|
|- doc // Documention and tutorial
|
|- cmake // different cmake files for the different targets
|
|- Jenkinsfile // Jenkins pipeline
|- seed_jenkins.dsl // Jenkins seed job for this repository
|- CmakeLists.txt // example cmake build
|- toolchain.cmake // example cmake toolstain

https://dev.to/pgradot/cmake-on-stm32-the-beginning-3766