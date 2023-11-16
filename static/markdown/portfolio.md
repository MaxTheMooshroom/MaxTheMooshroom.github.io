
## I'm currently working on
- (Iris)            A Smart Doorbell
    - Iris is a privacy-focused smart doorbell that comes with native IoT/smart-home support. Zero cloud, zero data misuse. The first release version uses the MangoPi, a RISC-V based single-board computer (SBC) comparable to that of the raspberry pi 0w. It has on-chip video acceleration hardware extensions, so it can encode and decode video codecs quite fast, more than meeting the requirements of a real-time camera streaming device.
- (Unnamed)         Multifactoral Meal Planner
    - Meal planners are a dime a dozen and come in all shapes and sizes, but I've yet to see one that holistically plans for a month based on calory requirements, weight targets, financial restrictions, nutritional restrictions, and time restrictions. Low-income peoples are not often in a situation where they can afford a nutritionist, and are often the ones most in need one one to help optimize their spending and food consumption. It's very much a catch-22 situation. To help address this, I've begun work on an app to help.
- (PMOS)            PM and PMOS dual-standard for IoT devices  (**HIATUS**)
    - The Peripheral Module / Peripheral Module OS are a dual-standard describing requirements and limitations for the design and creation of new IoT devices that ensures blazing fast processing times and inter-processor communication, and that users are firmly in control over their own data and devices.
- (DTC)             DeviceTree Compiler Refactor and API (**HIATUS**)
    - N2DTS requires operating on live device trees to properly construct the output DTS files. As-is, the DeviceTree Compiler (DTC) has no such functionality or API to do this. You are expected to manually write DTS files for your purposes. This is in stark contrast to the goals of N2DT, so I've begun refactoring DTC and adding an API for both C and Python. Currently it has been refactored, but an API has not been written.
- (N2DTS)           Netlist to DeviceTree  (**HIATUS**)
    - This is a python script that takes a netlist, as exported by KiCAD or Altium, and constructs a DTS file for each processor in the schematic. This is primarily for use by QEMU for emulation and validation of designs, but can also used for standard DTB use.


