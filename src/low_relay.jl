# Low-level interface for relay

################################################################################
# conduit_relay io c interface

"""
    relay_about(cnode::CNode)::Nothing

Result: `cnode`.
"""
function relay_about(cnode::CNode)
    @ccall libconduit_relay.conduit_relay_about(cnode::Ptr{CNodeImpl})::Nothing
end

"""
    relay_initialize()::Nothing
"""
function relay_initialize()
    @ccall libconduit_relay.conduit_relay_initialize()::Nothing
end

"""
    relay_finalize()::Nothing
"""
function relay_finalize()
    @ccall libconduit_relay.conduit_relay_finalize()::Nothing
end

"""
    relay_io_save(cnode::CNode, path::AbstractString, protocol::AbstractString, coptions::CNode)::Nothing

`save` works like a 'set' to the file.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_save(cnode::CNode, path::AbstractString, protocol::AbstractString, coptions::CNode)
    @ccall libconduit_relay.conduit_relay_io_save(
        cnode::Ptr{CNodeImpl}, path::Cstring, protocol::Cstring, coptions::Ptr{CNodeImpl}
    )::Nothing
end

"""
    relay_io_save_merged(cnode::CNode, path::AbstractString, protocol::AbstractString, coptions::CNode)::Nothing

`save_merged` works like an update to the file.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_save_merged(cnode::CNode, path::AbstractString, protocol::AbstractString, coptions::CNode)
    @ccall libconduit_relay.conduit_relay_io_save_merged(
        cnode::Ptr{CNodeImpl}, path::Cstring, protocol::Cstring, coptions::Ptr{CNodeImpl}
    )::Nothing
end

"""
    relay_io_add_step(cnode::CNode, path::AbstractString)::Nothing

`add_step` adds a new time step of data to the file.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_add_step(cnode::CNode, path::AbstractString)
    @ccall libconduit_relay.conduit_relay_io_add_step(cnode::Ptr{CNodeImpl}, path::Cstring)::Nothing
end

"""
    relay_io_load(path::AbstractString, protocol::AbstractString, coptions::CNode, cnode::CNode)::Nothing

Result: `coptions`, `cnode`.

`load` works like a 'set', the node is reset and then populated.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_load(path::AbstractString, protocol::AbstractString, coptions::CNode, cnode::CNode)
    @ccall libconduit_relay.conduit_relay_io_load(
        path::Cstring, protocol::Cstring, coptions::Ptr{CNodeImpl}, cnode::Ptr{CNodeImpl}
    )::Nothing
end

"""
    relay_io_load_step_and_domain(
        path::AbstractString, protocol::AbstractString, step::Integer, domain::Integer, coptions::CNode, cnode::CNode
    )::Nothing

Result: `coptions`, `cnode`.

For simpler use cases, accepts NULL for protocol and options.
"""
function relay_io_load_step_and_domain(
    path::AbstractString, protocol::AbstractString, step::Integer, domain::Integer, coptions::CNode, cnode::CNode
)
    @ccall libconduit_relay.conduit_relay_io_load_step_and_domain(
        path::Cstring, protocol::Cstring, step::Cint, domain::Cint, coptions::Ptr{CNodeImpl}, cnode::Ptr{CNodeImpl}
    )::Nothing
end

"""
    relay_io_query_number_of_steps(path::AbstractString)::Int

`query_number_of_steps` returns the number of time steps.
"""
function relay_io_query_number_of_steps(path::AbstractString)
    return Int(@ccall ibconduit_relay.conduit_relay_io_query_number_of_steps(path::Cstring)::Cint)
end

"""
    relay_io_query_number_of_domains(path::AbstractString)::Int

`query_number_of_domains` returns the number of domains.
"""
function relay_io_query_number_of_domains(path::AbstractString)
    return Int(@ccall ibconduit_relay.conduit_relay_io_query_number_of_domains(path::Cstring)::Cint)
end
