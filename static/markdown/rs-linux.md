
## Preamble

I recently started a project in Python for complex validating conditions provided by a dependency
graph. After implementing a version parser, virtual filesystem, writing a custom search algorithm
(based on binary sorting!), and more, I was fairly satisfied.

Until I decided to start implementing more complex features, however. Once that had happened,
I started running into some issues with Python's performance and general structure. By this point,
it had grown to a size I found difficult to track all of the moving pieces, and
<a href="https://mypy.readthedocs.io/en/stable/index.html" target="_blank">MyPy</a>, a static type
checker for python, wasn't helping very much. I wasn't sure what to do about it yet though. So, I
bided my time.

While I worked on other things, and read up on some things, I decided to do a deeper dive into a
company involved with the community I was developing this tool for. I was directly benefitting them,
and their users, by increasing the accessibility of their platform as a way to develop a collection
of libraries and/or packages, for use by other users of the platform. As it turned out, they look to
be hiring! The downside? Their core softwares are written in Rust. Why is that a downside? Because I
don't know Rust!

Up until this point, I've been wary of Rust. It seems to be getting a lot of hype, but there were
some very strong points against my adoption of it as a regular development language:
1. <a href="https://www.webpronews.com/rust-foundation-trademark-policy/" target="_blank">The
Rust Foundation has pulled a WotC
</a>
    - This is an ***__immediate__*** turn off from Rust as a safe / stable community. If I don't
trust the foundation governing its use, and I don't trust that the community around it is stable,
I can't well trust that Rust itself is going to stick around. Even if it has made its way into
the Linux kernel, I'm not super satisfied with the discord that has struck the community.
    - The foundation has walked back on those changes, but not before it nearly completely
annihilated the trust it had with the community. They're on thin-ice now, until they can prove
that we can trust them again.
    - Fortunately, a fork of rust is currently maintained as a mirror, as a sort of active threat / 
boundary to the foundation: "If you do anything like this again, we're leaving". And it has backing
from a non-trivial percentage of the rust community, so this carries legitimate weight. As a result,
I'm willing to overlook this blunder __for now__, but it's not looking so hot.
2. Rust's Cargo
    - Cargo, much like NPM and other package managers, suffers from easy bloat due to ease of
dependency additions and inclusions. The ability to arbitrarily add dependencies to a package
means that you can fairly easily cause bloat to any downstream dependents. This isn't necessarily
a fault of Cargo itself, however. Rather, it's the responsibility of the industry to implement and
maintain ways of managing packages that at the very least don't facilitate the arbitrary inclusion
of dependencies. I can think of a few ways to reduce the severity of the problem, though that is
outside the scope of this discussion.
    - A nasty side-effect of the ability to include arbitrary packages using Cargo has to do both
with security and stability.
<a href="https://therecord.media/malware-found-in-npm-package-with-millions-of-weekly-downloads" target="_blank">
Bad actors in the JS community have pushed changes to packages that intentionally introduced security
issues</a>, and this isn't a terribly uncommon thing to occur. As far as stability goes, any update
to a package may have breaking changes to their API. Neither of these are necessarily problematic in
and of themselves. However, with version-agnostic dependencies that may automatically include the
most recent versions of a package (which may be compromised), this can result in the compromising of
the current package as well, which only makes the problem even more wide-spread.
        - While it can be said (and should be said) that the onus of responsibility of these security issues
to not be propagated through a package is on the authors/maintainers of that package, mistakes do happen. However,
this is not a condemnation of developers/maintainers failing to check their dependencies. It's only
reasonable for a developer to check the immediate dependencies for any vulnerabilities, and even then,
only for dependencies that are sized reasonably enough to make that feasible.
        - Short of that, devs are required to trust the dependency, trusting that the community will police
itself. But what protections are in place? What layers of security are designed to mitigate this type of exploit?
Much of the responsibility for these issues remains on the floor. Who then needs to clean up the mess? If it's not
something that the package maintainers can themselves watch for, the next logical place to look is the
method by which these propagations occur, which would be the package manager. It not only sets the
standard for how dependencies are specified, it also controls the installation of the malware. I'm not
arguing that the package manager is responsible for each individual compromise of packages, just that
greater protections are needed all around, and that those protections start with the package manager.
        - Doesn't this mean my issue still isn't actually with Cargo, but all package managers that are
architected this way? Yes! But Cargo still exists in this set, so I'm not very keen on using it.

Now that that's out of the way, I hear you asking, "Okay Maxine, but what does that have to do with
Linux?" Great question! Nothing, but that's why this is a preamble.

## Linux in Rust


### What is Buildroot?

"Buildroot is a set of Makefiles and patches that simplifies and automates the process of building a complete
and bootable Linux environment for an embedded system, while using cross-compilation to allow building for
multiple target platforms on a single Linux-based development system." -
<a href="https://en.wikipedia.org/wiki/Buildroot" target="_blank">Wikipedia</a>


### What is crosstool-ng?

Crosstool-NG is a versatile toolchain building system consisting of scripts and configurations. It streamlines
and automates the creation of cross-compilers for various target architectures on a Linux development environment,
enabling efficient development for embedded systems.


### The Plan

In order to reduce complexity in the long-term, I plan on first using buildroot as normal, just to have a working
image. Then I'd like to build that against my custom micro-kernel and toolchain. This also requires rebuilding
libraries like glibc, for example.

A stretch goal of mine is to be able to build the micro-kernel targeting WebAssembly (WASM), build a new toolchain
for that environment, and get Linux running in a browser. Then build my LFS against that toolchain. That gets quite
a bit more complex than this though, which is why it's a stretch goal!

A super stretch goal would be to get the wasm build to meet the standards of the
[Linux Standard Base](https://refspecs.linuxfoundation.org/lsb.shtml) (LSB) Version 5.0 (2015), but I don't
realistically expect this to occur.

