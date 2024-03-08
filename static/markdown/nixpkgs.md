
# nixpkgs

On my journey to develop a nixos configuration for [Iris](#iris), I required use of gstreamer on
the riscv platform. When I tried to use it though, I was surprised to find that while it did build,
none of the plugins were accessible.

So I needed to do some investigating. Looking into the architecture of the gstreamer packages,
I found that all components of gstreamer were packaged separately, under the `gst_all_1` namespace.

This is bad practice for multiple reasons:
1. There are more modern idioms and programming patterns that would accomplish this functionality in a
more cohesive way. The way it is currently implemented is an anti-pattern. The `withPackages` mechanism
provided by nixpkgs is specifically for instances like this, allowing you to precisely declare what
sub-packages are required by and included in this environment.
2. 
3. <>

