# Overview

This repository is a playground for me to experiment with Yocto (PetaLinux) and BuildRoot on my Arty Z7-20 board.

# High-Level Design

This project is inspired by this [Hackster article](https://www.hackster.io/whitney-knitter/introduction-to-using-axi-dma-in-embedded-linux-5264ec). I will want to create a DMA block to access memory and an AXI 4 Data Stream FIFO. Along with that, I will create some simple GPIO blocks to control LEDs and see the states of switches and buttons.

# Vivado

Refer to the [block design PDF](./Vivado/Sources/BD/Block-Design.pdf) and the [top-level BD wrapper](./Vivado/Sources/HDL/Zynq_Top.v).<br>

To import the project: simply execute the [project recreation TCL script](./Vivado/Sources/TCL/Project-Recreation-Script.tcl).
To export the project: `write_project_tcl -paths_relative_to ../ -origin_dir_override ../ -target_proj_dir . -force ../Sources/TCL/Project-Recreation-Script.tcl`<br>

Generate bitstream and export hardware platform.<br>

# Yocto

[TBD]

# BuildRoot

[TBD]