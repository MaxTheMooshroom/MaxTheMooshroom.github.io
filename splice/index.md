---
title: Splice Blog
---

<!-- :ballot_box_with_check: -->

No content yet, but here I'll be outlining the goals of my engine and trying to go through various 
iterations of various graphics APIs, what I plan to do with them, and how I plan on learning.

## What is Splice
Splice is a rendering, simulation, and game development engine purpose-built for flexibility and 
artificial intelligence, with a still high focus on visualizing machine learning data. Any physics are drastically reduced 
(by orders of magnitude) in performance cost using [AMPM](https://www.youtube.com/watch?v=wsFgrzYwchQ) and [SSNP](https://www.youtube.com/watch?v=atcKO15YVD8)!

## Outline
I plan on making an MVP engine using OpenGL, then DirectX 11, then Vulkan. After that, I'll 
start over, using OpenGL, DirectX12, and then Vulkan again. Finally, I'll start over once more 
just using Vulkan. Through this, I hope to iterate through various implementations and techniques, 
picking up new knowledges and better ways of doing things as I go. Here is an outline for each of 
my iterations and what I hope to accomplish with each one.


During iteration 3 I'll be working with a team on a small but very polished [tech demo](/splice/tech_demo). You can see the roster [here](/splice/demo_roster)!

### Iteration 1
For each API in the first iteration I will do the following:<br>
:black_square_button: OpenGL    :black_square_button: DirectX11    :black_square_button: Vulkan
- [X] Create an OS interface for Windows 
- [X] Create a Window
- [X] Render a triangle to the Window
- [X] Animate a triangle in the Window [[1]](/splice/reference/1/)
- [X] Implement Shaders using the relevant graphics pipeline
- [X] Implement Index buffers
- [X] Error catching and console logging
- [X] Implement uniforms
- [X] Utilize vertex arrays
- [X] Class Abstraction
- [X] Load texture
- [ ] Implement 3D-Space
- [ ] Render a cube
- [ ] Texture the cube
- [ ] Animate the textured cube
- [ ] Implement a model loader
- [ ] Implement an event bus for dispatching updates throughout the engine
- [ ] Implement a Camera that can move and rotate on all 3 axes
- [ ] Implement Shader File Loading
- [ ] Implement skeletal animation
  - [ ] Implement virtual bones that move connected vertices when the bone moves
  - [ ] Implement weight painting vertice movements caused by bone movement
- [ ] Implement GUIs
  - [ ] Implement environment tick disabling
  - [ ] Implement menus
  - [ ] Implement button objects
  - [ ] Implement texture loading for GUI elements
- [ ] Implement saving
- [ ] Implement Raytracing

### Iteration 2
For each API in the second iteration I will do the following:<br>
:black_square_button: OpenGL    :black_square_button: DirectX12    :black_square_button: Vulkan
- [ ] Everything from iteration 1
  - [ ] Improvements.
- [ ] Implement multi-window support
- [ ] Create an OS interface for Linux and Mac
- [ ] Implement Pathtracing
- [ ] Implement gamestate hooks for AI to hook into the engine from

### Iteration 3
Iteration 3 includes only the Vulkan API, and will really just be 
- [ ] Iteration 1
  - [ ] Improvements.
- [ ] Iteration 2
  - [ ] Improvements.
- [ ] Create a GUI for the engine
- [ ] Use the gamestate hooks to implement AMPM and SSNP
  - [ ] AMPM
  - [ ] SSNP
- [ ] Create an OS interface for PlayStation and XBox
- [ ] Implement Muscular Animation Technique
  - [ ] Design
  - [ ] Plan
  - [ ] Code
