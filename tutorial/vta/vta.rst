---------------------------------
VTA: Versatile Tensor Accelerator
---------------------------------
Thierry and Luis

TSIM
----

- Why hardware simulation TVM?

  - Evaluate accurately software and hardware at the same time (runtime, code-gen, hardware-architecture, etc)
  
  - Model-to-hardware continuous integration (cross-layer optimizations)
  
  - Flexible hardware exploration (simple to complex)

- Accelerator interface

  - Host
  
  - Memory

- Execution model

  - Host thread
  
  - Accelerator thread

- Hardware simulator (Verilator)

  - Every serious design ends Verilog (at least for the time being)
  
  - Verilog-to-C++ compilation
  
  - Verilog Foreign function interface (DPI)

- Great, so how all this happen in TVM?

  - Software and hardware shared libraries
  
  - Hardware generation, i.e. Chisel3—>Verilator—>C++
  
  - Software driver

- Demo

  - Add-by-one
