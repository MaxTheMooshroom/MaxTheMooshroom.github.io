
## I'm currently working on
- (PMOS)            PM and PMOS dual-standard for IoT devices
    - The Peripheral Module / Peripheral Module OS are a dual-standard describing requirements and limitations for the design and creation of new IoT devices that ensures blazing fast processing times and inter-processor communication, and that users are firmly in control over their own data and devices.
- (N2DTS)           Netlist to DeviceTree
    - This is a python script that takes a netlist, as exported by KiCAD or Altium, and constructs a DTS file for each processor in the schematic. This is primarily for use by QEMU for emulation and validation of designs, but can also used for standard DTB use.
- (DTC)             DeviceTree Compiler Refactor and API
    - N2DT requires operating on live device trees to properly construct the output DTS files. As-is, the DeviceTree Compiler (DTC) has no such functionality or API to do this. You are expected to manually write DTS files for your purposes. This is in stark contrast to the goals of N2DT, so I've begun refactoring DTC and adding an API for both C and Python.
- (Smart Doorbell)  A Smart Doorbell
    - This is a PMOS-compliant device that performs all of the expected functionalities of a smart doorbell device, while keeping all of your data private. Your private data never touches a device that isn't your own and that you haven't explicitly authorized to access that data.



## I have worked on
- (REAGB (RIGBY))       Reverse Emulation of the GameBoy Advance (AGB)
    - Emulation is the process of simulating the hardware environment of a less powerful system on a more powerful system for running software intended for the less powerful one. Reverse emulation, by contrast, is the process of running software written for the more powerful system on the less powerful system. This is a project where I performed reverse emulation on the GameBoy Advance.
- (Splice)              Splice media engine
    - Splice is what I refer to as a media engine. It's similar to a game engine, but purpose-built for not just games, but also other visual and auditory forms of media, such as music, tv-shows, movies, etc. The goal of this engine is to bake AI in at every level, to increase performance wherever possible while increasing the fidelity of the media produced.
- (Full-Body Tracking)  Full-body tracking software
    - This is software I wrote using the Splice engine for performing procedural 3d model animation of humanoid models called VRoid Models (VRMs) using face tracking, pose tracking, and hand tracking, all using only a standard webcam.
- (SFI/BF)              Sound Field Imaging and Beam Formating technology
    - Using the K210 microcontroller from Kendryte, I designed a PM/PMOS compliant device using a microphone and speaker array to limit sound output to a localized space targetet at the specified listener, assuming they are in range.
