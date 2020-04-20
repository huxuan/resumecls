# resumecls

A LaTeX document class to typeset a resume or cv both in English and Chinese with more ease and flexibility.

## Online Preview & Edit (with Overleaf Template)

An overleaf template is available [here](https://www.overleaf.com/latex/templates/resumecls-example/xncvhkjgyjvf) for preview.

You can also edit it directly on the overleaf.

## Installation (for Offline Usage)

Since [`resumecls`](http://www.ctan.org/pkg/resumecls) is included in the CTAN.
You can install it by any package managers.

Take `tlgmr` as example,

```shell
tlmgr install resumecls
```

## Usage / Examples

please refer to [`resumecls-example`](https://github.com/huxuan/resumecls-example).

## Offline Compile

To get the document class file and document manually, you can compile via Makefile or LaTeX commands.

### Makefile

#### Get resumecls.cls
```shell
make cls
```

#### Get resumecls.pdf
```shell
make doc
```

#### Clean intermediate generated files
```shell
make clean
```

#### Clean for distribution
```shell
make distclean
```

### LaTeX

#### Get resumecls.cls
```shell
latex resumecls.ins
```

#### Get resumecls.pdf
```shell
xelatex resumecls.dtx
makeindex -s gind.ist -o resumecls.ind resumecls.idx
makeindex -s gglo.ist -o resumecls.gls resumecls.glo
xelatex resumecls.dtx
xelatex resumecls.dtx
```
