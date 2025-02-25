module Conduit

using Conduit_jll
const libconduit = Conduit_jll.libconduit

include("low_conduit_datatype.jl")
include("low_conduit_node.jl")
include("low_blueprint.jl")

include("high_conduit_datatype.jl")
include("high_conduit_node.jl")

end
