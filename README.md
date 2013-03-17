# resumecls

A LaTeX cls to typeset resume both in English and Chinese

# Usage / How to get it

- [`resumecls`](http://www.ctan.org/pkg/resumecls) has already been included in [CTAN](http://www.ctan.org/) Mirror.
- To get the cls file you only need to update local CTAN Packages.
- For how to use it you can refer to [`resumecls-example`](https://github.com/huxuan/resumecls-example) repo.

## Mnaual Compile

To get the cls file and document manually, you can make it either by Makefile or LaTeX command

### Compile by Makefile (Recommended if your os supported)

#### Get resumecls.cls
```shell
make cls
```

#### Get resumecls.pdf
```shell
make doc
```

#### Clean
Clean all generated files except for cls and pdf
```shell
make clean
```

#### DistClean
Clean all generated files
```shell
make distclean
```

### Compile by LaTeX command

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
