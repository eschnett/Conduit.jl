module Conduit

using Conduit_jll
const libconduit = Conduit_jll.libconduit
const libconduit_blueprint = Conduit_jll.libconduit_blueprint

include("low_conduit_datatype.jl")
include("low_conduit_node.jl")
include("low_blueprint.jl")

include("high_conduit_datatype.jl")
include("high_conduit_node.jl")
include("high_blueprint.jl")

end
