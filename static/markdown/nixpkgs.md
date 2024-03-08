
## nixpkgs (Nix Packages)

### GStreamer

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
2. The plugins should all be under a namespace specific to them being plugins, and this should not
include the core gstreamer package. This is so that derivations can be cached in nix binary caches.
3. The way gstreamer is packaged is such that the plugins depend on the current profile already
having gstreamer. So it relies on the pre-existing system state, which goes against nixos' intended
use. This resulted in a failed build when I tried to build a nixos system image that contained
gstreamer with plugins, because there was no existing gstreamer package to reference during the
build.

TODO: document the solution

TODO: link to the solution's implementation

### Meson

The Nix package for Meson isn't bad at all, and was fairly easy to use, especially with utilities found
in `lib` for `23.11` such as `lib.mesonOption`, `lib.mesonBool`, and `lib.mesonEnable`. That said, we
found it rather lacking, as it took extra work to get more complex behaviour from it that should
probably already exist in the package. This isn't important enough to warrant addressing immediately,
but is important enough to note for addressing later, when there are less tasks in the queue.

TODO: What specifically wants to change / be updated?

### Future

The system that we're using to build the system image with is using nixpkgs version `22.11`. Fairly
recent, but not up-to-date either. Previously in the meson section I mentioned using `23.11` features.
How was this done? We discussed an interface for referencing packages in future releases of `nixpkgs`.
That is, any particular version of nixos can use packages from higher versions. This is the mechanism
by which we accessed `23.11` features on a system with `22.11`, for the purposes of building a
separate image. The interface is designed as such: `nixpkgs.future.<nixpkgs-branch>.<package>`. When
accessing a future package, you must provide the package's dependencies, and the resulting derivation
is overlayed onto `nixpkgs`.

If you wish to use the default dependencies (which still exist only in the future) you must access
`nixpkgs.future.defaults.<nixpkgs-branch>.<package>` instead. This is discouraged though, because it
dramatically increases the size of the dependency graph, output size, and build time.

TODO: Link to source (current implementation is only a partial)
