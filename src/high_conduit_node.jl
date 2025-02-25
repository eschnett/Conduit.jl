# High-level interface for conduit node

################################################################################

# mutable struct Node
#     cnode::CNode
#     Node(cnode::CNode) = finalizer(node_destroy, new(cnode))
# end

# function node_destroy(node::Node)
#     # TODO: Use atomic access
#     cnode = node.cnode
#     if cnode != CNode()
#         node.cnode = CNode()
#         node_destroy(cnode)
#     end
# end

struct Node
    cnode::CNode
    Node(cnode::CNode) = new(cnode)
end
Node() = Node(node_create())

function node_destroy(node::Node)
    cnode = node.cnode
    if cnode != CNode()
        node_destroy(cnode)
    end
end

function about()
    node = Node()
    about(node.cnode)
    return node::Node
end

# object and list interface methods

node_fetch(node::Node, path::AbstractString) = Node(node_fetch(node.cnode, path))
node_fetch_existing(node::Node, path::AbstractString) = Node(node_fetch_existing(node.cnode, path))
node_append(node::Node) = Node(node_append(node.cnode))
node_add_child(node::Node, name::AbstractString) = Node(node_add_child(node.cnode, name))
node_child(node::Node, idx::Integer) = Node(node_child(node.cnode, idx))
node_child_by_name(node::Node, name::AbstractString) = Node(node_child_by_name(node.cnode, name))
node_number_of_children(node::Node) = node_number_of_children(node.cnode)
node_number_of_elements(node::Node) = node_number_of_elements(node.cnode)
node_reset(node::Node) = node_reset(node.cnode)
node_move(node_a::Node, node_b::Node) = node_move(node_a.cnode, node_b.cnode)
node_swap(node_a::Node, node_b::Node) = node_swap(node_a.cnode, node_b.cnode)
node_remove_path(node::Node, path::AbstractString) = node_remove_path(node.cnode, path)
node_remove_child(node::Node, idx::Integer) = node_remove_child(node.cnode, idx)
node_remove_child_by_name(node::Node, name::AbstractString) = node_remove_child_by_name(node.cnode, name)
node_name(node::Node) = node_name(node.cnode)
node_path(node::Node) = node_path(node.cnode)
node_has_child(node::Node, name::AbstractString) = node_has_child(node.cnode, name)
node_has_path(node::Node, path::AbstractString) = node_has_path(node.cnode, path)
function node_rename_child(node::Node, current_name::AbstractString, new_name::AbstractString)
    return node_rename_child(node.cnode, current_name, new_name)
end

Base.delete!(node::Node, key::AbstractString) = (node_remove_child_by_name(node, key); node)
Base.eltype(::Node) = Pair{String,Node}
Base.getindex(node::Node, key::AbstractString) = node_child_by_name(node, key)
Base.length(node::Node) = node_number_of_children(node)
Base.in(key::AbstractString, node::Node) = node_has_child(node, key)
function Base.iterate(node::Node, idx::Int=0)
    idx >= node_number_of_children(node) && return nothing
    child = node_child(node, idx)
    return node_name(child) => child, idx + 1
end
Base.keys(node::Node) = String[node_name(node_child(node, idx)) for idx in 0:(node_number_of_children(node) - 1)]
Base.keytype(::Node) = String
function Base.setindex!(node::Node, value::Node, key::AbstractString)
    child = node_add_child(node, key)
    node_set_node(child, value)
    return node
end
Base.values(node::Node) = Node[node_child(node, idx) for idx in 0:(node_number_of_children(node) - 1)]

# node info

node_is_root(node::Node) = node_is_root(node.cnode)
node_is_data_external(node::Node) = node_is_data_external(node.cnode)
node_parent(node::Node) = Node(node_parent(node.cnode))
node_total_strided_bytes(node::Node) = node_total_strided_bytes(node.cnode)
node_total_bytes_compact(node::Node) = node_total_bytes_compact(node.cnode)
node_total_bytes_allocated(node::Node) = node_total_bytes_allocated(node.cnode)
node_is_compact(node::Node) = node_is_compact(node.cnode)
node_compatible(node::Node, other::Node) = node_compatible(node.cnode, other.cnode)
node_is_contiguous(node::Node) = node_is_contiguous(node.cnode)
node_contiguous_with_node(node::Node, other::Node) = node_contiguous_with_node(node.cnode, other.cnode)
node_contiguous_with_address(node::Node, address::Ptr) = node_contiguous_with_address(node.cnode, address::Ptr)
node_diff(node::Node, other::Node, info::Node, epsilon::Float64) = node_diff(node.cnode, other.cnode, info.cnode, epsilon)
function node_diff_compatible(node::Node, other::Node, info::Node, epsilon::Float64)
    return node_diff_compatible(node.cnode, other.cnode, info.cnode, epsilon)
end
node_info(node::Node, nres::Node) = node_info(node.cnode, nres.cnode)
node_print(node::Node) = node_print(node.cnode)
node_print_detailed(node::Node) = node_print_detailed(node.cnode)

# compaction methods

node_compact_to(node::Node, nres::Node) = node_compate_to(node.cnode, nres.cnode)

# update methods

node_update(node::Node, other::Node) = node_update(node.cnode, other.cnode)
node_update_compatible(node::Node, other::Node) = node_update_compatible(node.cnode, other.cnode)
node_update_external(node::Node, other::Node) = node_update_external(node.cnode, other.cnode)

# basic io, parsing, and generation

node_parse(node::Node, schema::AbstractString, protocol::AbstractString) = node_parse(node.cnode, schema, protocol)
function node_generate(node::Node, schema::AbstractString, protocol::AbstractString, data::Ptr)
    return node_generate(node.cnode, schema, protocol, data)
end
function node_generate_external(node::Node, schema::AbstractString, protocol::AbstractString, data::Ptr)
    return node_generate_external(node.cnode, schema, protocol, data)
end
node_save(node::Node, path::AbstractString, protocol::AbstractString) = node_save(node.cnode, path, protocol)
node_load(node::Node, path::AbstractString, protocol::AbstractString) = node_load(node.cnode, path, protocol)

# Conduit Node to_string Methods

node_to_json(node::Node) = node_to_json(node.cnode)
node_to_json_with_options(node::Node, opts::Node) = node_to_json_with_options(node.cnode, opts.cnode)
node_to_yaml(node::Node) = node_to_yaml(node.cnode)
node_to_yaml_with_options(node::Node, opts::Node) = node_to_yaml_with_options(node.cnode, opts.cnode)
node_to_string(node::Node) = node_to_string(node.cnode)
node_to_string_with_options(node::Node, opts::Node) = node_to_string_with_options(node.cnode, opts.cnode)
node_to_summary_string(node::Node) = node_to_summary_string(node.cnode)
node_to_summary_string_with_options(node::Node, opts::Node) = node_to_summary_string_with_options(node.cnode, opts.cnode)

# Conduit Node "Set" Methods

# set for generic types
# set_path for generic types
# set_external for generic types
# set_path_external for generic types

node_set_node(node::Node, data::Node) = node_set_node(node.cnode, data.cnode)
node_set_path_node(node::Node, path::AbstractString, data::Node) = node_set_path_node(node.cnode, path, data.cnode)
node_set_external_node(node::Node, data::Node) = node_set_external_node(node.cnode, data.cnode)
function node_set_path_external_node(node::Node, path::AbstractString, data::Node)
    return node_set_path_external_node(node.cnode, path, data.cnode)
end

Base.setindex!(node::Node, data::Node) = node_set_node(node, data)
# Base.setindex!(node::Node, data::Node, path::AbstractString) = node_set_path_node(node, path, data)

# set for string cases

# set
# set_path
# set_external
# set_path_external

node_set(node::Node, value::AbstractString) = node_set_char8_str(node.cnode, value)
node_set_external(node::Node, value::AbstractString) = node_set_external_char8_str(node.cnode, value)
node_set_path(node::Node, path::AbstractString, value::AbstractString) = node_set_path_char8_str(node.cnode, path, value)
function node_set_path_external(node::Node, path::AbstractString, value::AbstractString)
    return node_set_path_external_char8_str(node.cnode, path, value)
end

Base.setindex!(node::Node, value::AbstractString) = node_set(node, value)
# Base.setindex!(node::Node, value::AbstractString, path::AbstractString) = node_set_path(node, path, value)

# set for numeric types

for (type, name) in [
    (Int8, :int8),
    (Int16, :int16),
    (Int32, :int32),
    (Int64, :int64),
    (UInt8, :uint8),
    (UInt16, :uint16),
    (UInt32, :uint32),
    (UInt64, :uint64),
    (Float32, :float32),
    (Float64, :float64),
]
    @eval begin
        node_set(node::Node, value::$type) = $(Symbol(:node_set_, name))(node.cnode, value)
        node_set_path(node::Node, path::AbstractString, value::$type) = $(Symbol(:node_set_path_, name))(node.cnode, path, value)
        node_set_external(node::Node, value::$type) = $(Symbol(:node_set_external_, name))(node.cnode, value)
        node_set_path_external(node::Node, path::AbstractString, value::$type) =
            $(Symbol(:node_set_path_external_, name))(node.cnode, path, value)

        node_set(node::Node, value::AbstractVector{$type}) = $(Symbol(:node_set_, name, :_ptr))(node.cnode, value)
        node_set_path(node::Node, path::AbstractString, value::AbstractVector{$type}) =
            $(Symbol(:node_set_path_, name, :_ptr))(node.cnode, path, value)
        node_set_external(node::Node, value::AbstractVector{$type}) = $(Symbol(:node_set_external_, name, :_ptr))(node.cnode, value)
        node_set_path_external(node::Node, path::AbstractString, value::AbstractVector{$type}) =
            $(Symbol(:node_set_path_external_, name, :_ptr))(node.cnode, path, value)

        Base.setindex!(node::Node, value::$type) = (node_set(node, value); node)
        # Base.setindex!(node::Node, value::$type, path::AbstractString) = (node_set_path(node, path, value); node)
        Base.setindex!(node::Node, value::AbstractVector{$type}) = (node_set(node, value); node)
        # function Base.setindex!(node::Node, value::AbstractVector{$type}, path::AbstractString)
        #     node_set_path(node, path, value)
        #     return node
        # end
    end
end

# leaf access

node_as(::Type{String}, node::Node) = node_as_char8_str(node.cnode)
function node_fetch_path_as(::Type{String}, node::Node, path::AbstractString)
    return node_fetch_patch_as_char8_str(node.cnoe, path::AbstractString)
end

for (type, name) in [
    (Int8, :int8),
    (Int16, :int16),
    (Int32, :int32),
    (Int64, :int64),
    (UInt8, :uint8),
    (UInt16, :uint16),
    (UInt32, :uint32),
    (UInt64, :uint64),
    (Float32, :float32),
    (Float64, :float64),
]
    @eval begin
        node_as(::Type{$type}, node::Node) = $(Symbol(:node_as_, name))(node.cnode)
        node_as(::Type{Ptr{$type}}, node::Node) = $(Symbol(:node_as_, name, :_ptr))(node.cnode)

        node_fetch_path_as(::Type{$type}, node::Node) = $(Symbol(:node_fetch_path_as_, name))(node.cnode)
        node_fetch_path_as(::Type{Ptr{$type}}, node::Node) = $(Symbol(:node_fetch_path_as_, name, :_ptr))(node.cnode)
    end
end

# Get the dtype for the node.

node_dtype(node::Node) = node_dtype(node.cnode)

function dtype_to_jtype(dtype::Datatype)
    if datatype_is_empty(dtype)
        return Nothing
    elseif datatype_is_object(dtype)
        @assert false           # TODO: Handle this
    elseif datatype_is_list(dtype)
        @assert false           # TODO: Handle this
    elseif datatype_is_number(dtype)
        if datatype_is_floating_point(dtype)
            datatype_is_float32(dtype) && return Float32
            datatype_is_float64(dtype) && return Float64
        elseif datatype_is_integer(dtype)
            if datatype_is_signed_integer(dtype)
                datatype_is_int8(dtype) && return Int8
                datatype_is_int16(dtype) && return Int16
                datatype_is_int32(dtype) && return Int32
                datatype_is_int64(dtype) && return Int64
            elseif datatype_is_unsigned_integer(dtype)
                datatype_is_uint8(dtype) && return UInt8
                datatype_is_uint16(dtype) && return UInt16
                datatype_is_uint32(dtype) && return UInt32
                datatype_is_uint64(dtype) && return UInt64
            end
        end
    elseif datatype_is_string(dtype)
        datatype_is_char8_str(dtype) && return String
    end
    @assert false               # TODO: Handle this -- this is an error?
end

function node_get(node::Node)
    dtype = node_dtype(node)
    jtype = dtype_to_jtype(dtype)
    return node_as(jtype, node)::jtype
end

function node_get_array(node::Node)
    dtype = node_dtype(node)
    jtype = dtype_to_jtype(dtype)
    # TODO: Check all of these:
    # TODO: Use a StridedView if necessary
    # CONDUIT_API conduit_index_t conduit_datatype_offset(const conduit_datatype *cdatatype);
    # CONDUIT_API conduit_index_t conduit_datatype_stride(const conduit_datatype *cdatatype);
    # CONDUIT_API conduit_index_t conduit_datatype_element_bytes(const conduit_datatype *cdatatype);
    # CONDUIT_API conduit_index_t conduit_datatype_endianness(const conduit_datatype *cdatatype);
    # CONDUIT_API conduit_index_t conduit_datatype_element_index(const conduit_datatype *cdatatype, conduit_index_t idx);
    length = conduit_datatype_number_of_elements(dtype)
    ptr = node_as(Ptr{jtype}, node)
    return unsafe_wrap(Array, ptr, (length,))::Vector{jtype}
end
