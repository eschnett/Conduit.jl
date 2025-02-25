# High-level interface for relay

################################################################################
# conduit_relay io c interface

"""
    relay_about(node::Node)::Nothing

Result: `node`.
"""
relay_about(node::Node) = relay_about(node.cnode)

# """
#     relay_initialize()::Nothing
# """
# function relay_initialize
# 
# """
#     relay_finalize()::Nothing
# """
# function relay_finalize

"""
    relay_io_save(node::Node, path::AbstractString, protocol::AbstractString, options::Node)::Nothing

`save` works like a 'set' to the file.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_save(node::Node, path::AbstractString, protocol::AbstractString, options::Node)
    return relay_io_save(node.cnode, path, protocol, options.cnode)
end

"""
    relay_io_save_merged(node::Node, path::AbstractString, protocol::AbstractString, options::Node)::Nothing

`save_merged` works like an update to the file.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_save_merged(node::Node, path::AbstractString, protocol::AbstractString, options::Node)
    return relay_io_save_merged(node.cnode, path, protocol, options.cnode)
end

"""
    relay_io_add_step(node::Node, path::AbstractString)::Nothing

`add_step` adds a new time step of data to the file.

For simpler use cases, accepts NULL for protocol and options.
"""
relay_io_add_step(node::Node, path::AbstractString) = relay_io_add_step(node.cnode, path)

"""
    relay_io_load(path::AbstractString, protocol::AbstractString, options::Node, node::Node)::Nothing

Result: `options`, `node`.

`load` works like a 'set', the node is reset and then populated.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_load(path::AbstractString, protocol::AbstractString, options::Node, node::Node)
    return relay_io_load(path, protocol, options.cnode, node.cnode)
end

"""
    relay_io_load_step_and_domain(
        path::AbstractString, protocol::AbstractString, step::Integer, domain::Integer, options::Node, node::Node
    )::Nothing

Result: `options`, `node`.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_load_step_and_domain(
    path::AbstractString, protocol::AbstractString, step::Integer, domain::Integer, options::Node, node::Node
)
    return relay_io_load_step_and_domain(path, protocol, step, domain, options.cnode, node.cnode)
end

# """
#     relay_io_query_number_of_steps(path::AbstractString)::Int
# 
# `query_number_of_steps` returns the number of time steps.
# """
# function relay_io_query_number_of_steps

# """
#     relay_io_query_number_of_domains(path::AbstractString)::Int
# 
# `query_number_of_domains` returns the number of domains.
# """
# function relay_io_query_number_of_domains
