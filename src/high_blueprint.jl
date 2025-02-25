# High-level interface for blueprint

################################################################################
# conduit_blueprint_mcarray c interface

"""
    blueprint_mcarray_verify(node::Node, info::Node)::Bool

Result: `info`.

Verify passed node confirms to the blueprint mcarray protocol.
"""
blueprint_mcarray_verify(node::Node, info::Node) = blueprint_mcarray_verify(node.cnode, info.cnode)

"""
    blueprint_mcarray_verify_sub_protocol(protocol::AbstractString, node::Node, info::Node)::Bool

Result: `info`.

Verify passed node confirms to given blueprint mcarray sub protocol.
"""
function blueprint_mcarray_verify_sub_protocol(protocol::AbstractString, node::Node, info::Node)
    return blueprint_mcarray_verify_sub_protocol(protocol, node.cnode, info.cnode)
end

"""
    blueprint_mcarray_is_interleaved(node::Node)::Bool
"""
blueprint_mcarray_is_interleaved(node::Node) = blueprint_mcarray_is_interleaved(node.cnode)

"""
    blueprint_mcarray_to_contiguous(node::Node, dest::Node)::Bool

Result: `dest`.
"""
blueprint_mcarray_to_contiguous(node::Node, dest::Node) = blueprint_mcarray_to_contiguous(node.cnode, dest.cnode)

"""
    blueprint_mcarray_to_interleaved(node::Node, dest::Node)::Bool

Result: `dest`.
"""
blueprint_mcarray_to_interleaved(node::Node, dest::Node) = blueprint_mcarray_to_interleaved(node.cnode, dest.cnode)

"""
    blueprint_mcarray_examples_xyz(mcarray_type::AbstractString, npts::Integer, res::Node)::Nothing

Result: `res`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mcarray_examples_xyz(mcarray_type::AbstractString, npts::Integer, res::Node)
    return blueprint_mcarray_examples_xyz(mcarray_type, npts, res.cnode)
end

################################################################################
# conduit_blueprint_mesh c interface

"""
    blueprint_mesh_verify(node::Node, info::Node)::Bool

Result: `info`.

Verify passed node confirms to the blueprint mesh protocol.
"""
blueprint_mesh_verify(node::Node, info::Node) = blueprint_mesh_verify(node.cnode, info.cnode)

"""
    blueprint_mesh_verify_sub_protocol(protocol::AbstractString, node::Node, info::Node)::Bool

Result: `info`.

Verify passed node confirms to given blueprint mesh sub protocol.
"""
function blueprint_mesh_verify_sub_protocol(protocol::AbstractString, node::Node, info::Node)
    return blueprint_mesh_verify_sub_protocol(protocol, node.cnode, info.cnode)
end

"""
    blueprint_mesh_generate_index(mesh::Node, ref_path::AbstractString, num_domains::Integer, index_out::Node)::Nothing

Result: `index_out`.

Generate mesh::index from valid mesh.
"""
function blueprint_mesh_generate_index(mesh::Node, ref_path::AbstractString, num_domains::Integer, index_out::Node)
    return blueprint_mesh_generate_index(mesh.cnode, ref_path, num_domains, index_out.cnode)
end

"""
    blueprint_mesh_partition(mesh::Node, options::Node, output::Node)::Nothing

Result: `output`.

Partition a mesh
"""
function blueprint_mesh_partition(mesh::Node, options::Node, output::Node)
    return blueprint_mesh_partition(mesh.cnode, options.cnode, output.cnode)
end

"""
    blueprint_mesh_flatten(mesh::Node, options::Node, output::Node)::Nothing

Result: `output`.

Flatten a mesh to a table
"""
blueprint_mesh_flatten(mesh::Node, options::Node, output::Node) = blueprint_mesh_flatten(mesh.cnode, options.cnode, output.cnode)

"""
    blueprint_mesh_examples_basic(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, res::Node)::Nothing

Result: `res`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_basic(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, res::Node)
    return blueprint_mesh_examples_basic(mesh_type, nx, ny, nz, res.cnode)
end

"""
    blueprint_mesh_examples_braid(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, res::Node)::Nothing

Result: `res`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_braid(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, res::Node)
    return blueprint_mesh_examples_braid(mesh_type, nx, ny, nz, res.cnode)
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
        res::Node,
    )::Nothing

Result: `res`.

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
    res::Node,
)
    return blueprint_mesh_examples_julia(nx, ny, x_min, x_max, y_min, y_max, c_re, c_im, res.cnode)
end

"""
    blueprint_mesh_examples_spiral(ndomains::Integer, res::Node)::Nothing

Result: `res`.

Interface to generate example mesh blueprint data.
"""
blueprint_mesh_examples_spiral(ndomains::Integer, res::Node) = blueprint_mesh_examples_spiral(ndomains, res.cnode)

"""
    blueprint_mesh_examples_polytess(nlevels::Integer, nz::Integer, res::Node)::Nothing

Result: `cres`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_polytess(nlevels::Integer, nz::Integer, res::Node)
    return blueprint_mesh_examples_polytess(nlevels, nz, res.cnode)
end

"""
    blueprint_mesh_examples_misc(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, res::Node)::Nothing

Result: `res`.

Interface to generate example mesh blueprint data.
"""
function blueprint_mesh_examples_misc(mesh_type::AbstractString, nx::Integer, ny::Integer, nz::Integer, res::Node)
    return blueprint_mesh_examples_misc(mesh_type, nx, ny, nz, res.cnode)
end

"""
    blueprint_mesh_examples_generate(example_name::AbstractString, opts::Node, res::Node)

Result: `res`.

generates a named example mesh using options.
expects opts node to contains relevant args for each example.
"""
function blueprint_mesh_examples_generate(example_name::AbstractString, opts::Node, res::Node)
    return blueprint_mesh_examples_generate(example_name, opts.cnode, res.cnode)
end

"""
    blueprint_mesh_examples_generate_default_options(example_name::AbstractString, opts::Node)

Result: `opts`.

creates the default options for a given example
"""
function blueprint_mesh_examples_generate_default_options(example_name::AbstractString, opts::Node)
    return blueprint_mesh_examples_generate_default_options(example_name, opts.cnode)
end

################################################################################
# conduit_blueprint_table c interface

"""
    blueprint_table_verify(node::Node, info::Node)::Bool

Result: `info`.

Verify passed node conforms to the blueprint table protocol.
"""
blueprint_table_verify(node::Node, info::Node) = blueprint_table_verify(node.cnode, info.cnode)

"""
    blueprint_table_verify_sub_protocol(protocol::AbstractString, node::Node, info::Node)::Bool

Result: `info`.

Verify passed node conforms to the blueprint table protocol.
"""
function blueprint_table_verify_sub_protocol(protocol::AbstractString, node::Node, info::Node)
    return blueprint_table_verify_sub_protocol(protocol, node.cnode, info.cnode)
end

"""
    blueprint_table_examples_basic(nx::Integer, ny::Integer, nz::Integer, res::Node)::Nothing

Result: `res`.

Interface to generate example table blueprint data.
"""
function blueprint_table_examples_basic(nx::Integer, ny::Integer, nz::Integer, res::Node)
    return blueprint_table_examples_basic(nx, ny, nz, res.cnode)
end
