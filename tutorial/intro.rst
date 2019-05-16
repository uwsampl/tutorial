=======================
TVM: For Fun and Profit
=======================

----------------------
Introduction: Why TVM?
----------------------

Upon hearing about TVM, you are excited to accelerate your ML application
and navigate to the Github or website. Both describe TVM as an end-to-end
deep learning compiler. **What does that mean for you?**

You may be:
    * A research looking develop new machine learning algorithms, or model optimizations.
    * A machine learning engineer looking to optimize a model you are deploying.
    * A machine learning framework designer or implementator.
    * A hardware engineer looking for a software stack for hardware accelerators.

If you are any of these people you are in the right place.
TVM is a toolkit which can help solve your problems.

TVM is a learning-based learning system that targets machine learning
workloads as a first-class citizen. More importantly, it introduces
the use of machine learning to automatically optimize the learning system
itself.

Building a compiler solution for machine learning is extremely difficult --
Not only the proposed solution has to compete against traditional compilers,
but must also be competitive with machine learning frameworks hand-optimized by expert
engineers to gain adoption.

TVM is the first ML compiler to automatically generate code which outperforms to state of art
industrial ML frameworks, as well as targeting emerging specialized accelerators. The powerful
feature set of TVM has recently lead to adoption in both academia and industry.

Facebook uses it to optimize for both mobile and server workloads,
AWS uses it to optimize for deep learning deployment services.
Berkeley uses it to provide secured and privacy aware ML stack.

TVM provides this functionality via several systems which *must* interoperate. We use machine learning to
optimize tensor programs (AutoTVM), a full stack solution including high-level differentiable IR (Relay),
tensor expression and optimization search space, distributed runtime environment, and hardware runtime.
We need to co-design these layers together so that high-level IR can generate hints for hardware runtime, and
we can collect feedbacks to the machine learning algorithm in our distributed experimentation infrastructure.

TVM, like compiler frameworks such as LLVM, provides a useful set of common tools and abstractions
for producing high performance, machine specific code. TVM helps you focus on the interesting and
important details of your work and leaves the framework to solve systems challenges
once and for all.

The goal of this document is to help you quickly figure out the lay of the land,
and get up to speed using TVM to solve your problems. This tutorial first provides
a short and high-level summary of TVM, and then splits into focused areas.


If you already know "Why TVM?" you can jump right in with tutorials which demonstrate
common use cases:
    ...

If you are looking for help using TVM's APIs one can find a complete
API listing for both the Python and C++ APIs here and here.

If you have question please check out the discussion forum: `discuss.tvm.ai`.

Now back to the TVM stack.

TVM is a large project full of sub-systems which connect to make the whole system.


First we will cover the architecture, and design of TVM as a system.
Next we will discuss TVM's tensor IR, used for defining dense linear
algebra primitives such as convolution, and matrix multiplication.
We will next
We will then talk abou

---
FAQ
---

*What is the relationship between TVM and Halide?*

Halide is an image processing language, more recently it has been rebranded to a general purpose language for data-parallel processing. Halide introduces an important concept of compute-schedule separation. TVM used Halide’s IR structure as a basis of the tensor expression IR layer. Note that TVM introduced many more components other than the tensor IR layer, all of which need to work together to for, end to end machine learning optimization. The following section will focus on the difference between TVM’s Tensor IR layer and Halide.

Specific Difference from Halide in the Tensor IR Layer


Expressiveness We need to express workloads beyond simple data-parallel computations in order to support the end to end ML. TVM introduces new constructs including scan (for recurrence) and hybrid script for irregular computations in such as bounding box computation.

Tensorization for DSAs TVM introduces tensorization, as a way to target TPU-like domain specific accelerators. Tensorization enables support for DSAs and allows us to target TPU-like specialized accelerators effectively.

New Schedules TVM introduces new scheduling primitives such as virtual threading, explicit use of memory hierarchy, and double buffering.

IR Dialect and Special Optimization Due to the need to support new schedules, backends, and co-design with other layers of the stack. We introduce dialects and annotations in the tensor IR to annotate regions such as DMA, pure computations and device code. Halide, due to its own set of requirements, has a different set of dialects. Different optimization passes need to be developed to respect these dialects.

Co-design Perhaps the biggest difference between TVM’s Tensor IR layer and Halide is that TVM aims to co-design this layer with the rest of the stack. For example, TVM leaves optimizations such as choices of algorithms(Winograd vs direct), data layout, operator fusion to the high-level IR, which simplifies the problem for the Tensor IR layer. TVM also generates functions that run on the distributed experiment runtime with heterogeneous devices to collect feedbacks for machine learning.

We want to note that both TVM and Halide have their own set of design choices for their target workloads, and both of which are valid in their own context.

Summary

TVM introduces ML-based automatic optimization, and build an end to end compiler that deploys ML workloads to diverse hardware backends. The stack from existing solutions both in terms of the need for more components and co-design in the tensor IR layer.


*Could you provide some examples of how TVM is being used?*

There are quite a few users of TVM in the wild, we explain
a few interesting ones selected from industry and academia
below.

Facebook is using TVM to optimize models on mobile (vision task)
and server workloads(for advertising)[FacebookOpt]_.
Facebook has contributed back to TVM, and provided
benchmarking against Glow[FacebookGlowBench]_. They recently have also
made use of TVM in research as well[FacebookOctave]_.



Amazon Web Services (AWS) has also contributed heavily to
TVM, and has talked about using it in AWS's deep learning
compiler service[AWSTalk]_, specifically providing state-of-the-art
performance on x86 [AWSPaper]_.
Deep learning compilers services using TVM



In academia researchers at Berkeley have used it to build
a secure and privacy-aware solution for ML[BerkeleyPaper],
and researchers at MIT have applied TVM to robotics tasks
as well [MITPaper]_.

.. [FacebookOpt] https://sampl.cs.washington.edu/tvmconf/slides/Andrew-Tulloch-TVM-FB.pdf
.. [FacebookGlowBench] https://discuss.tvm.ai/t/improved-direct-winograd-nchwc-cpu-implementation-with-resnet-50-results/1017
.. [FacebookOctave] https://arxiv.org/pdf/1904.05049.pdf
.. [AWSTalk] https://sampl.cs.washington.edu/tvmconf/slides/Yida-Wang-TVM-AWS.pdf
.. [AWSPaper]  https://arxiv.org/pdf/1809.02697.pdf
.. [BerkeleyPaper]: https://arxiv.org/pdf/1807.06689.pdf
.. [MITPaper] http://fastdepth.mit.edu/2019_icra_fastdepth.pdf

