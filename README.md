# TVM Tutorial

A self-contained version of the TVM tutorial which can be easily cloned and
viewed by others.

There is some textual material in the `tutorial` folder, this is from the
first version of the tutorial. I intend to generate this from the notebooks
directly.

# Jupyter Notebooks
The main content of the tutorial is contained in a set of Jupyter notebooks
in `notebooks`. The tutorials are named in chronological order, and provide
information on how to completely build and run TVM locally and in a Google
[Colaboratory]https://colab.research.google.com/notebooks/welcome.ipynb#scrollTo=5fCEDCU_qrC0).

A template notebook can be found [here](notebook/0N_TVM_Tutorial_Template.ipynb).

The template notebook uses the prebuilt version of TVM stored in a Google Cloud
Storage bucket. You can see examples adapted from this template in the `notebook`
directory.

# Old Textual Build (WIP)

You can build a PDF copy of the tutorial using [Pandoc](https://pandoc.org/).
Just install Pandoc and type: `make` in the root directory, you will find the
results in `build/tutorial.pdf`.

Using Homebrew you can install Pandoc easily: `brew install pandoc`.
