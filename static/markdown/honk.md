
# Honk

<a href="#honk">Honk</a>
is a static code analyzer for bash, intended as an alternative to
<a href="https://www.shellcheck.net" target="_blank">ShellCheck</a>. However,
while ShellCheck is written in Haskell, Honk is written purely in bash.

The primary purpose of this of writing Honk in bash is so that Honk can run
anywhere bash runs. No recompilation needed! And if Bash doesn't run somewhere,
then Honk isn't needed anyhow.

The reason I wrote Honk is because while I was working on [Goose](#goose),
which is also written in bash, it grew to a size that was impractical to constantly
be managing manually on my own. More simply, I could no longer simulate the entire
program in my head because of how complex it had grown over time.

Not only can Honk look for malformed script, it can also recommend improvements
based on rules provided by the user (along with ones provided to Honk by default),
and based on automatic optimizations found by traversing the AST and identifying
shorter paths between 2 states.

```md
$ honk --help
Description:
    Honk is static code analyzer (and linter) for bash, written in bash.
    - Provided files will be analyzed and reported on.
    - Provided directories will be searched for bash files and each of those will be analyzed and reported on.
    - Dotfiles and files/directories found in '.gitignore' are ignored by default.

Main usage:
    honk [flag [flag-argument]]... <file/directory> [additional <files/directories>]...

Help aliases:
    honk
    honk  -h
    honk --help

            name            priority  argument name  argument type     description

            --linter-rules         4  rules file     string            Register linter rules to use while linting (file)

        -l  --lint                 4                                   run the linter

        -h  --help                 0                                   prints this help text

```
