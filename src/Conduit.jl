module Conduit

using Conduit_jll
const libconduit = Conduit_jll.libconduit

include("low.jl")
include("high.jl")

end
