### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 13c363c4-77e7-11eb-0a9e-4ddc1d2d83bf
md"""

# Complexity of an algorithm

Complexity of algorithm tells us about the behaviour of time and space consumption by the algorithm with respect to the problem size ($n$) asymptotically under a certain computational model.

Let's take a closer look at various terms in this definition.

1. _Time complexity_ here means the time required to perform the number of operations.

1. _Space complexity_ refers to the memory (RAM) required to run the program and how it scales with the problem size.

1. _Problem size_ is usually parameterised (represented) in terms of a variable. Lets call it $n$. For a matrix-vector product, clearly, $n$ will represent the size of the vector. If we are considering a large scale numerical PDE solver (like CFD and FEM programs), $n$ will be the number of nodes (grid points, cells) at which the PDE is discretised. In case of gradient based optimisation algorithms, $n$ will be the dimension of the design space.

1. _Asymptotic_ behavior means the behaviour of the algorithm as $n \rightarrow \infty$. This means that for a small enough $n$, it may be case that the complexity of an algorithm presents a misleading picture. More on this later.

1. A _computational model_ makes certain assumptions on the relative cost of performing basic arithmetic and memory operations. For example, classically, all the complexity algorithms have assumed that addition, subtraction, multiplication and division can all be performed at equal cost. Hence, there is no need to distinguish between them. This simplifies the analysis greatly. In other models, addition and subtraction are ignored and only multiplications are counted. Similarly, a preliminary complexity analysis will often time ignore the time taken for memory access. Most complexity analysis also assume basic [_Turing Machine_](https://en.wikipedia.org/wiki/Turing_machine) model. In optimisation we need not worry about this.

!!! note "Serial model"
    In our priliminary analysis (as undergraduate students) we can assume instantaneous data access and only count the number of arithmetic operations [^1]. We will also asssume that all operations require equal time.

!!! note "Parallel model"
    Each of the computing node making up our parallel machine, have the properties of our serial model. On top of this, we assume that data transfer between various nodes of the parallel computer is also fast enough (as compared to the computation time required on each node) to ignore.

"""

# ╔═╡ 04911af4-77ec-11eb-181f-875c20de963c
md"""

Under such simplifications, let us look at the complexity of _vector-vector_ product. Clearly, if the size of the vector is $n$, then we have to perform $n$ multiplications. Hence the complexity is $\mathcal{O}(n)$.

If we consider _matrix-vector_ product, then we have to perform $n$ additions and $n$ multiplications for every entry of the output vector. Hence, in total, we are performing $n^2$ additions and $n^2$ multiplications. Under our computing model, cost of addition is the same as the cost of multiplications. Hence, we can say $2n^2$ operations. Hence, the time complexity is $\mathcal{O}(n^2)$. Let us assume that in practice it takes twice as much time to perform a multiplication as it does to perform additions. Then the total cost will be $(1 + 2)n^2$ operations but the order remains the same.

!!! warning "Question"
    What is the time complexity of _matrix-matrix_ multiplication?

!!! hint "Answer"
    $\mathcal{O}(n^3)$

Similarly, the space complexity of these algorithms can be calculated. However, this is not of interest to us at present.

If we consider the data parallel model of computation, then _vector-vector_ product is $\mathcal{O}(n)$ time complexity. The $n$ multiplication operations happen in the parallel mode followed by the serial ($n-1$) additions at the master node. As these additions have to be performed in a sequential manner, the overall order of the parallel execution of _vector-vector_ product is still $\mathcal{O}(n)$.

If we consider _matrix-vector_ product, the $i^{th}$ entry of the output vector is $\sum_{j=1}^{n} a_{ij} b_{j}$. The summation operation will happen in serial fashion after we gather all the products. This will take $n-1$ serial operations. Hence, the overall order is $\mathcal{O}(n)$.

However, if we consider the `trace` operator over a matrix $\mbox{tr}(A) = \sum_{i=1}^{n} a_{ii}$, the complexity remains $\mathcal{O}(n)$ for serial as well as parallel implementations.

We note here that there are some operators/functions which are not amenable to straightforward parallelisation.

|              Operation |      Serial        |   Parallel
|----------------------: | :----------------- | :-------------
|_vector-vector_ product | $\mathcal{O}(n)$   | $\mathcal{O}(n)$
|_matrix-vector_ product | $\mathcal{O}(n^2)$ | $\mathcal{O}(n)$ [^2]
|_matrix-trace_ operator  | $\mathcal{O}(n)$   | $\mathcal{O}(n)$ 

A brief introduction to complexity calculation has been given in this article. Using this as a building block, you should calculate the complexity of other matrix operator like $A^{-1}$, $\mbox{det}(A)$ etc. 

Similar methodology is to be used to calculate the complexity of gradient algorithms. 
1. A key difference is that since we do not know the exact number of steps required to reach optima for most nonlinear numerical optimisation algorithms, our complexity analysis will focus on the effect of problem size on the **time and space complexity of one step**. Overall complexity bound cannot be given in most cases. A notable exception can be _Conjugate Gradient_ algorithm for an unconstrained positive definite quadratic function.

2. Another notable difference is the level of abstraction used for calculating the complexity. In case of matrix operations, we were concerned about the calculating the complexity in terms of basic arithmetic operators. In optimisation, the compute time is heavily dependent on the form of the objective function $f(\bar{x})$. Hence, we only estimate the number of function evaluation (\# of $f(\bar{x})$ calculations) per step. This is justified since cost of $f(\bar{x})$ remains constant and hence we are only changing the constant of multiplication in the calculation of the overall computational operations. 

[^1]: This means that we are ignoring the cache available for the CPU. We are also not concerned whether we are using a single-core CPU, multi-core CPU or a GPU. A more in-depth analysis can be performed by taking all these into consideration. However, this kind of analysis will also be specific to a particular implementation of a general algorithm. Hence, it is only useful in the case of developers working on scientific computing libraries.

[^2] : A more complete analysis of parallel implementation can be found [here](http://www.cs.umsl.edu/~sanjiv/classes/cs5740/lectures/mvm.pdf).
"""

# ╔═╡ Cell order:
# ╠═13c363c4-77e7-11eb-0a9e-4ddc1d2d83bf
# ╠═04911af4-77ec-11eb-181f-875c20de963c
