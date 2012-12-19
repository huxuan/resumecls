# resumecls

A LaTeX cls for resume, simply, support English and Chinese natively.

## Makefile
First you need `cp config-sample.mk config.mk` to make Makefile script work.
You can change the variable in config.mk corresponding to your own tex file.
For example, I have `huxuan-zh.tex`, `huxuan-en.tex` and `huxuan.bib`, so I
Set `RESUME=huxuan`, `RESUMEZH=huxuan-zh`, `RESUMEEN=huxuan-en`.

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

### Get your own resume
```shell
make resume-zh
make resume-en
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
First, you need to get the cls file as described above.
Then you also need to replace `example` in code snippet
to `example-en` or `example-zh` as you want.

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

### Get your own resume
First, you need to get the cls file as described above.
Then you also need to replace `resume` in code snippet
corresponding to your own tex file.

- if has bib
```shell
xelatex resume.tex
-bibtex resume
```

- And then or if has no bib
```shell
xelatex resume.tex
xelatex resume.tex
```
