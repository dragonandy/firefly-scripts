# firefly-scripts
This repo stores scripts I created to solve the problems I met in my Firefly RK3288 ARM board

all the scripts are not fully tested and may terrible broken  
I try to write scripts with variables which can easily modify
use the code at your own risk

the scripts licences are all separatly located in different folders
all the scripts written by me are licences under UNLICENCE others depend

## fix_ldconfig

the ubuntu arm firmware have a tiny issue when I do a apt upgrade. it seens that `ldconfig` find that the libgst* have duplicated .so library.
the solution is use `ln -s` to create symbolic link to overwrite the duplicated files.this only works on particular hardware and versions of firmware

## build_blender_arm

the script originate in blender master git repo,located in `git.blender.org/blender.git/build_files/build_environment/install_deps.sh` which help build dependencies when you want compile blender yourself 
unfortunately blender doesnt provide official compile option to build blender on arm platform.this script is modified making building blender on arm less painful :-(
