# resumecls

A LaTeX cls for resume, simply, support English and Chinese natively.

## Workflow

```shell
git clone https://github.com/huxuan/resumecls.git
cd resumecls
cp config-sample.mk config.mk
cp example-zh.tex resume-zh.tex
cp example-en.tex resume-en.tex
cp example.bib resume.bib
# Edit resume-zh.tex resume-en.tex and resume.bib
# Compile in the way listed in following section
```
## Compile

### Compile via Makefile (Recommended if your os support)
First you need `cp config-sample.mk config.mk` to make Makefile script work.
You can change the variable in `config.mk` corresponding to the your file name.
Default and recommended value is `RESUME=resume`, `RESUMEZH=resume-zh`,
`RESUMEEN=resume-en` which means you need to name your files as
`resume-zh.tex`, `resume-en.tex` and `resume.bib` to make `make` work.

#### Get resumecls.cls
```shell
make cls
```

#### Get resumecls.pdf
```shell
make doc
```

#### Get example-zh.pdf & example-en.pdf
```shell
make example # Get both below
make example-zh
make example-en
```

#### Get all files above
```shell
make all
```

#### Get resume-zh.pdf & resume-en.pdf
```shell
make resume # Get both below
make resume-zh
make resume-en
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

### Compile by raw LaTeX command

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

#### Get example-zh.pdf & example-en.pdf
First, you need to get the cls file as described above.
Then you also need to replace `example` in code snippet
to `example-en` or `example-zh` as you want.

- if has bib
```shell
xelatex example.tex
bibtex example
```

- And then or if has no bib
```shell
xelatex example.tex
xelatex example.tex
```

#### Get resume-zh.pdf & resume-en.pdf
First, you need to get the cls file as described above.
Then you also need to replace `resume` in code snippet
corresponding to your own tex file.

- if has bib
```shell
xelatex resume.tex
bibtex resume
```

- And then or if has no bib
```shell
xelatex resume.tex
xelatex resume.tex
```
