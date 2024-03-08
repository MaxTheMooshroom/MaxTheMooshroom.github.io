
# BASHful

<a href="#bashful">BASHful</a>
is a static code analyzer for bash, intended as an alternative to
<a href="https://www.shellcheck.net" target="_blank">ShellCheck</a>. However,
while ShellCheck is written in Haskell, BASHful is written purely in bash.

The primary purpose of this of writing BASHful in bash is so that BASHful can run
anywhere bash runs. No recompilation needed! And if Bash doesn't run somewhere,
then BASHful isn't needed anyhow.

The reason I wrote BASHful is because while I was working on [DHelper](#dhelper),
which is also written in bash, it grew to a size that was impractical to constantly
be managing manually on my own. More simply, I could no longer simulate the entire
program in my head because of how complex it had grown over time.

Not only can BASHful look for malformed script, it can also recommend improvements
based on rules provided by the user (along with ones provided to BASHful by default),
and based on automatic optimizations found by traversing the AST and identifying
shorter paths between 2 states.

```md
Usage: `bashful [--<flag> [...]] <entry script> [<additional script> [...]]`

Files that are not explicitly sourced with `source <file>` or `. <file>` are to be
provided as an "additional script" for checking.

flags:
      flag name           |  description
-----------------------------------------------------------------------------------------
    --no-advice              do not provide advice on optimizations that can be made
    --ignore-rule <rule>     ignore rule violations for rule <rule>

```
