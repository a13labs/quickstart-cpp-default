# Template for a Ogre3D C++ application

This is a minimal template for creating a Ogre3D application in C++

# Dependencies

## Fedora
```
sudo dnf install mesa-libGL-devel mesa-vulkan-devel glslang-devel
sudo dnf install SDL2-devel libXt-devel libXaw-devel doxygen pugixml-devel
```

# Folder structure

```
.
├── 3rdparty
│   ├── CMakeLists.googletest.in
│   ├── CMakeLists.googletest.txt
│   ├── CMakeLists.ogre.in
│   ├── CMakeLists.ogre.txt
│   └── < add your 3rd party libraries >
├── CMakeLists.txt
├── config.h.in
├── src
│   ├── CMakeLists.txt
│   ├── launcher
│   │   ├── cmake
│   │   │   ├── plugins.cfg.in
│   │   │   └── resources.cfg.in
│   │   ├── CMakeLists.txt
│   │   └── main.cpp
│   └── < add other libraries here >
└── tests
    ├── CMakeLists.txt
    ├── sample_test
    │   ├── CMakeLists.txt
    │   ├── main.cpp
    │   └── simpletest.cpp
    └── < add other tests here >
```