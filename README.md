# resumecls

A LaTeX cls for resume, simply, support English and Chinese natively.

## Makefile

### Get cls
```shell
make cls
```

### Get cls document
```shell
make doc
```

### Get example
```shell
make example-zh
make example-en
```

### Get all files above
```shell
make all
```

### Clean
Clean all generated files except for cls and pdf
```shell
make clean
```

### DistClean
Clean all generated files
```shell
make distclean
```

## LaTeX

### Get cls
```shell
latex resumecls.ins
```

### Get cls document
```shell
xelatex resumecls.dtx
makeindex -s gind.ist -o resumecls.ind resumecls.idx
makeindex -s gglo.ist -o resumecls.gls resumecls.glo
xelatex resumecls.dtx
xelatex resumecls.dtx
```

### Get exmaple
Replace `example` in code snippet to `example-en` or `example-zh` as you want.

- if has bib
```shell
xelatex example.tex
-bibtex example
```

- And then or if has no bib
```shell
xelatex example.tex
xelatex example.tex
```
