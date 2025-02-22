import Pkg
using Pkg
Pkg.activate(".")
include("Diffusion.jl")
Diffusion.main()