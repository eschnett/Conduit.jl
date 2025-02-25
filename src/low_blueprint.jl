# Low-level interface for blueprint

################################################################################
# conduit_blueprint_mcarray c interface

"""
    blueprint_mcarray_verify(cnode::CNode, cinfo::CNode)::Bool

Result: `cinfo`.

Verify passed node confirms to the blueprint mcarray protocol.
"""
function blueprint_mcarray_verify(cnode::CNode, cinfo::CNode)
    return Bool(@ccall libconduit.conduit_blueprint_mcarray_verify(cnode::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl})::Cint)
end

"""
    blueprint_mcarray_verify_sub_protocol(protocol::AbstractString, cnode::CNode, cinfo::CNode)::Bool

Result: `cinfo`.

Verify passed node confirms to given blueprint mcarray sub protocol.
"""
function blueprint_mcarray_verify_sub_protocol(protocol::AbstractString, cnode::CNode, cinfo::CNode)
    return Bool(
        @ccall libconduit.conduit_blueprint_mcarray_verify_sub_protocol(
            protocol::Cstring, cnode::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl}
        )::Cint
    )
end

"""
    blueprint_mcarray_is_interleaved(cnode::CNode)::Bool
"""
function blueprint_mcarray_is_interleaved(cnode::CNode)
    return Bool(@ccall libconduit.conduit_blueprint_mcarray_is_interleaved(cnode::Ptr{CNodeImpl})::Cint)
end

"""
    blueprint_mcarray_to_contiguous(cnode::CNode, cdest::CNode)::Bool

Result: `cdest`.
"""
function blueprint_mcarray_to_contiguous(cnode::CNode, cdest::CNode)
    return Bool(@ccall libconduit.conduit_blueprint_mcarray_to_contiguous(cnode::Ptr{CNodeImpl}, cdest::Ptr{CNodeImpl})::Cint)
end

"""
    blueprint_mcarray_to_interleaved(cnode::CNode, cdest::CNode)::Bool

Result: `cdest`.
"""
function blueprint_mcarray_to_interleaved(cnode::CNode, cdest::CNode)
    return Bool(@ccall libconduit.conduit_blueprint_mcarray_to_interleaved(cnode::Ptr{CNodeImpl}, cdest::Ptr{CNodeImpl})::Cint)
end

"""
    blueprint_mcarray_examples_xyz(mcarray_type::AbstractString, npts::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mcarray_examples_xyz(mcarray_type::AbstractString, npts::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_mcarray_examples_xyz(mcarray_type::Cstring, npts::IndexT, cres::Ptr{CNodeImpl})::Nothing
end

################################################################################
# conduit_blueprint_mesh c interface

"""
    blueprint_mesh_verify(cnode::CNode, cinfo::CNode)::Bool

Result: `cinfo`.

Verify passed node confirms to the blueprint mesh protocol.
"""
function blueprint_mesh_verify(cnode::CNode, cinfo::CNode)
    return Bool(@ccall libconduit.conduit_blueprint_mesh_verify(cnode::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl})::Cint)
end

"""
    blueprint_mesh_verify_sub_protocol(protocol::AbstractString, cnode::CNode, cinfo::CNode)::Bool

Result: `cinfo`.

Verify passed node confirms to given blueprint mesh sub protocol.
"""
function blueprint_mesh_verify_sub_protocol(protocol::AbstractString, cnode::CNode, cinfo::CNode)
    return Bool(
        @ccall libconduit.conduit_blueprint_mesh_verify_sub_protocol(
            protocol::Cstring, cnode::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl}
        )::Cint
    )
end

"""
    blueprint_mesh_generate_index(cmesh::CNode, ref_path::AbstractString, num_domains::Integer, cindex_out::CNode)::Nothing

Result: `cindex_out`.

Generate mesh::index from valid mesh.
"""
function blueprint_mesh_generate_index(cmesh::CNode, ref_path::AbstractString, num_domains::Integer, cindex_out::CNode)
    @ccall libconduit.conduit_blueprint_mesh_generate_index(
        cmesh::Ptr{CNodeImpl}, ref_path::Cstring, num_domains::IndexT, cindex_out::Ptr{CNodeImpl}
    )::Nothing
end

"""
    blueprint_mesh_partition(cmesh::CNode, coptions::CNode, coutput::CNode)::Nothing

Result: `coutput`.

Partition a mesh
"""
function blueprint_mesh_partition(cmesh::CNode, coptions::CNode, coutput::CNode)
    @ccall libconduit.onduit_blueprint_mesh_partition(
        cmesh::Ptr{CNodeImpl}, coptions::Ptr{CNodeImpl}, coutput::Ptr{CNodeImpl}
    )::Nothing
end

"""
    blueprint_mesh_flatten(cmesh::CNode, coptions::CNode, coutput::CNode)::Nothing

Result: `coutput`.

Flatten a mesh to a table
"""
function blueprint_mesh_flatten(cmesh::CNode, coptions::CNode, coutput::CNode)
    @ccall libconduit.conduit_blueprint_mesh_flatten(
        cmesh::Ptr{CNodeImpl}, coptions::Ptr{CNodeImpl}, coutput::Ptr{CNodeImpl}
    )::Nothing
end

"""
    blueprint_mesh_examples_basic(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_basic(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_mesh_examples_basic(
        mesh_type::Cstring, nx::IndexT, ny::IndexT, nz::IndexT, cres::Ptr{CNodeImpl}
    )::Nothing
end

"""
    blueprint_mesh_examples_braid(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_braid(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_mesh_examples_braid(
        mesh_type::Cstring, nx::IndexT, ny::IndexT, nz::IndexT, cres::Ptr{CNodeImpl}
    )::Nothing
end

"""
    blueprint_mesh_examples_julia(
        nx::Integer,
        ny::Integer,
        x_min::AbstractFloat,
        x_max::AbstractFloat,
        y_min::AbstractFloat,
        y_max::AbstractFloat,
        c_re::AbstractFloat,
        c_im::AbstractFloat,
        cres::CNode,
    )::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_julia(
    nx::Integer,
    ny::Integer,
    x_min::AbstractFloat,
    x_max::AbstractFloat,
    y_min::AbstractFloat,
    y_max::AbstractFloat,
    c_re::AbstractFloat,
    c_im::AbstractFloat,
    cres::CNode,
)
    @ccall libconduit.conduit_blueprint_mesh_examples_julia(
        mesh_type::Cstring,
        nx::IndexT,
        ny::IndexT,
        x_min::Float64,
        x_max::Float64,
        y_min::Float64,
        y_max::Float64,
        c_re::Float64,
        c_im::Float64,
        cres::Ptr{CNodeImpl},
    )::Nothing
end

"""
    blueprint_mesh_examples_spiral(ndomains::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_spiral(ndomains::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_mesh_examples_spiral(ndomains::IndexT, cres::Ptr{CNodeImpl})::Nothing
end

"""
    blueprint_mesh_examples_polytess(nlevels::Integer, nz::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_polytess(nlevels::Integer, nz::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_mesh_examples_polytess(ndomains::IndexT, nz::IndexT, cres::Ptr{CNodeImpl})::Nothing
end

"""
    blueprint_mesh_examples_misc(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_misc(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_mesh_examples_misc(
        mesh_type::Cstring, nx::IndexT, ny::IndexT, nz::IndexT, cres::Ptr{CNodeImpl}
    )::Nothing
end

################################################################################
# conduit_blueprint_table c interface

"""
    blueprint_table_verify(cnode::CNode, cinfo::CNode)::Bool

Result: `cinfo`.

Verify passed node conforms to the blueprint table protocol.
"""
function blueprint_table_verify(cnode::CNode, cinfo::CNode)
    return Bool(@ccall libconduit.conduit_blueprint_table_verify(cnode::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl})::Cint)
end

"""
    blueprint_table_verify_sub_protocol(protocol::AbstractString, cnode::CNode, cinfo::CNode)::Bool

Result: `cinfo`.

Verify passed node conforms to the blueprint table protocol.
"""
function blueprint_table_verify_sub_protocol(protocol::AbstractString, cnode::CNode, cinfo::CNode)
    return Bool(
        @ccall libconduit.conduit_blueprint_table_verify_sub_protocol(
            protocol::Cstring, cnode::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl}
        )::Cint
    )
end

"""
    blueprint_table_examples_basic(nx::Integer, ny::Integer, nz::Integer, cres::CNode)::Nothing

Result: `cres`.

Interface to generate example table blueprint data.
"""
function blueprint_table_examples_basic(nx::Integer, ny::Integer, nz::Integer, cres::CNode)
    @ccall libconduit.conduit_blueprint_table_examples_basic(nx::IndexT, ny::IndexT, nz::IndexT, cres::Ptr{CNodeImpl})::Nothing
end
