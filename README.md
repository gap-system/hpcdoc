# /!\ WARNING! /!\
This documentation has been converted to GAPDoc format and integrated into the
[HPC-GAP branch](https://github.com/gap-system/gap/tree/hpcgap-default) of GAP.
Please submit updates to the documentation there.

# HPC-GAP Documentation

This repository contains documentation for HPC-GAP (To build HPC-GAP itself, see 
https://github.com/gap-system/gap/wiki/Building-HPC-GAP).

In order to build the documentation for HPC-GAP, you need a version of `Ruby` language 
to be installed. Then call

```
git clone https://github.com/gap-system/hpcdoc.git
cd hpcdoc
make
```

This will create the HPC-GAP documentation in the `hpcdoc` directory as an `hpcdoc.html` file.

If you have `pandoc` installed on your system, you can also build a PDF version of the 
documentation by typing

```
make pdf
```

in the same directory. This will create a file called `hpcdoc.pdf`.

