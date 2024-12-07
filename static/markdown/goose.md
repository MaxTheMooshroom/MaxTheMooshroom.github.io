
# Goose

<a href="https://github.com/nucleus-labs/goose.template" target="_blank">Goose</a>
is a practical development tool that simplifies development environments and automates
various tasks. It has an intuitive command-line interface with a structure that's built
specifically for easy customization.

Goose uses a hierarchical registration model, allowing users to define common flags,
helper functions, and configurations. Flags that are commonly used are provided out of
the box, and users can extend functionality by defining additional flags and functions
in the targets/common.bash file.

Goose has 2 kinds of flags: Common and target-specific. Common flags are present
regardless of target, while other flags are only present for specific targets. Flag
registration in Goose is straightforward, using the `add_flag` function to define flags
at both common and target-specific levels. Flags can be assigned short and verbose names,
descriptions, and argument specifications for flexible command-line options.

Target registration involves creating files in the targets/ directory, where each file
corresponds to a distinct target. They are defined as `targets/<target>.bash`, and expect a
variable `description` to be set, and a function `target_<target>` to be defined for the
target's functionality. Users can define target-specific flags by calling `add_flag` within
the target file, and providing the corresponding handler function. Users can also define
arguments for a target by calling `add_argument` for each one, providing the name of the
argument, the type, and a description of what the argument is for.

