
## Active Projects
- ([Peacock](#peacock))     A Rust-Based GUI Framework for Web Developers
    - A cross-platform framework written in rust that consumes XML and CSS to build GUI
    applications with as little or as much rust as you want! Peacock grows with you as you
    learn to use it, and is purpose-built to give as seamless a transition to Rust as possible!
    - ([Pinion](#pinion))       Peacock's core library for parsing and templating XML files!
        - WIP
    - ([Crest](#crest))         Peacock's core library for parsing, validating, and transforming CSS
        - Created as an alternative to the lightningcss crate with a different use-case, Crest
        provides strong type definitions for every CSS attribute, along with helpful abstractions for
        how to apply the CSS to any object that implements the Element trait!

## Inactive Projects
- ([Goose](#goose))         A CLI developer tool for managing environments
    - A command-line tool to help developers manage their projects by setting up tasks that
    can be operated as if Goose is a task runner of sorts, or you can (WIP Feature) use Goose as a full
    build system
<!-- - ([Iris](#iris))               A Smart Doorbell (**ACTIVE DEVELOPMENT**)
    - Iris is a privacy-focused smart doorbell that comes with native IoT/smart-home
support. Zero cloud, zero data misuse. The first prototype version uses the MangoPi,
a RISC-V based single-board computer (SBC) comparable to that of the raspberry pi 0w.
It has on-chip video acceleration hardware extensions, so it can encode and decode
video codecs quite fast, more than meeting the requirements of a real-time camera
streaming device.
- ([NixPkgs](#nixpkgs))         Nix Packages
    - gstreamer (**ACTIVE DEVELOPMENT**)
        - <a href="https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/development/libraries/gstreamer/default.nix" target="_blank">
The current <code>gstreamer</code> package</a>
is outdated and fails to use more modern idioms and best practices, and isn't available on all
platforms.
    - meson (**DEFERRED DEVELOPMENT**)
        - <a href="https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/by-name/me/meson/package.nix" target="_blank">
The current <code>meson</code> package</a>
is fine, but leaves some stuff to be desired. I'd like to see a more robust nix package for it.
    - future (**DEFERRED DEVELOPMENT**)
        - This is a new package I'm working on with the sole purpose of being able to reference packages in future versions of nixpkgs. Optionally able to apply as an overlay to the current
nixpkgs, else it is accessed via `nixpkgs-future.<version>.<package>`
- ([Honk](#honk))         A static code analyzer for bash (**ACTIVE DEVELOPMENT**)
    - A quick and easy way to analyze your bash scripts for errors and have it refactor
them if desired

- ([DTC](#dtc))                 DeviceTree Compiler Refactor and API (**HIATUS**)
    - Several projects that I have planned for the future require operating on live device trees
to properly construct the output DTS files. As-is, the DeviceTree Compiler (DTC) has no such
functionality or API to do this; you are expected to manually write `.dts`/`.dtsi` files for
your specific purposes. This is in stark contrast to the goals of my projects, so I've begun
refactoring DTC and adding an API for both C and Python. Currently it has been refactored, but
an API has not yet been written. -->

<!-- ## Planned Projects -->

