# Low-level interface

################################################################################

const IndexT = Int

function __init__()
    # Did we make the right guess?
    datatype_sizeof_index_t() == sizeof(IndexT) || throw(InitError(Conduit, "sizeof(index_t) differs between C and Julia"))
    return nothing
end

################################################################################

# typedef for conduit_node

# This is an opaque struct in C
struct CNodeImpl end

struct CNode
    ptr::Ptr{CNodeImpl}
end
CNode() = CNode(Ptr{CNodeImpl}())
Base.cconvert(::Type{Ptr{CNodeImpl}}, cnode::CNode) = cnode.ptr
Base.cconvert(::Type{CNode}, ptr::Ptr{CNodeImpl}) = CNode(ptr)

# typedef for conduit_datatype

# This is an opaque struct in C
struct CDatatypeImpl end

struct CDatatype
    datatype::Ptr{CDatatypeImpl}
end
CDatatype() = CDatatype(Ptr{CDatatypeImpl}())

################################################################################
# conduit

function about(cnode::CNode)
    @ccall libconduit.conduit_about(cnode::Ptr{CNodeImpl})::Nothing
end

################################################################################
# conduit_datatype

function datatype_sizeof_index_t()
    return Int(@ccall libconduit.conduit_datatype_sizeof_index_t()::Cint)
end

function datatype_id(cdatatype::CDatatype)
    return Int(@ccall libconduit.conduit_datatype_id(cdatatype::Ptr{CDatatypeImpl})::IndexT)
end

function datatype_name(cdatatype::CDatatype)
    cstr = @ccall libconduit.conduit_datatype_name(cdatatype::Ptr{CDatatypeImpl})::Cstring
    str = unsafe_string(cstr)
    @ccall libconduit.conduit_datatype_name_destroy(cstr::Cstring)::Nothing
    return str
end

function datatype_number_of_elements(cdatatype::CDatatype)
    return Int(@ccall libconduit.conduit_datatype_number_of_elements(cdatatype::Ptr{CDatatypeImpl})::IndexT)
end

function datatype_offset(cdatatype::CDatatype)
    return Int(@ccall libconduit.conduit_datatype_offset(cdatatype::Ptr{CDatatypeImpl})::IndexT)
end

function datatype_stride(cdatatype::CDatatype)
    return Int(@ccall libconduit.conduit_datatype_stride(cdatatype::Ptr{CDatatypeImpl})::IndexT)
end

function datatype_element_bytes(cdatatype::CDatatype)
    return Int(@ccall libconduit.conduit_datatype_element_bytes(cdatatype::Ptr{CDatatypeImpl})::IndexT)
end

function datatype_endianness(cdatatype::CDatatype)
    return Int(@ccall libconduit.conduit_datatype_endianness(cdatatype::Ptr{CDatatypeImpl})::IndexT)
end

function datatype_element_index(cdatatype::CDatatype, idx::Integer)
    return Int(@ccall libconduit.conduit_datatype_element_index(cdatatype::Ptr{CDatatypeImpl}, idx::IndexT)::IndexT)
end

function datatype_is_empty(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_empty(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_object(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_object(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_list(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_list(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_number(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_number(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_floating_point(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_floating_point(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_integer(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_integer(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_signed_integer(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_signed_integer(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_unsigned_integer(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_unsigned_integer(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_int8(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_int8(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_int16(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_int16t(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_int32(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_int32(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_int64(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_int64(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_uint8(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_uint8(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_uint16(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_uint16t(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_uint32(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_uint32(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_uint64(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_uint64(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_float32(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_float32(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_float64(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_float64(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_char(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_char(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_short(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_short(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_int(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_int(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_long(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_long(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_unsigned_char(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_unsigned_char(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_unsigned_short(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_unsigned_short(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_unsigned_int(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_unsigned_int(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_unsigned_long(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_unsigned_long(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_float(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_float(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_double(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_double(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_string(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_string(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_char8_str(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_char8_str(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_little_endian(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_little_endian(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_is_big_endian(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_is_big_endian(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

function datatype_endianness_matches_machine(cdatatype::CDatatype)
    return Bool(@ccall libconduit.conduit_datatype_endianness_matches_machine(cdatatype::Ptr{CDatatypeImpl})::Cint)
end

################################################################################
# conduit_node

# conduit_node creation and destruction

function node_create()
    return CNode(@ccall libconduit.conduit_node_create()::Ptr{CNodeImpl})
end

function node_destroy(cnode::CNode)
    @ccall libconduit.conduit_node_destroy(cnode.ptr::Ptr{CNodeImpl})::Nothing
end

# object and list interface methods

function node_fetch(cnode::CNode, path::AbstractString)
    return CNode(@ccall libconduit.conduit_node_fetch(cnode::Ptr{CNodeImpl}, path::Cstring)::Ptr{CNodeImpl})
end

function node_fetch_existing(cnode::CNode, path::AbstractString)
    return CNode(@ccall libconduit.conduit_node_fetch_existing(cnode::Ptr{CNodeImpl}, path::Cstring)::Ptr{CNodeImpl})
end

function node_append(cnode::CNode)
    return CNode(@ccall libconduit.conduit_node_append(cnode::Ptr{CNodeImpl})::Ptr{CNodeImpl})
end

function node_add_child(cnode::CNode, name::AbstractString)
    return CNode(@ccall libconduit.conduit_node_add_child(cnode::Ptr{CNodeImpl}, name::Cstring)::Ptr{CNodeImpl})
end

function node_child(cnode::CNode, idx::Integer)
    return CNode(@ccall libconduit.conduit_node_child(cnode::Ptr{CNodeImpl}, idx::IndexT)::Ptr{CNodeImpl})
end

function node_child_by_name(cnode::CNode, name::AbstractString)
    return CNode(@ccall libconduit.conduit_node_child_by_name(cnode::Ptr{CNodeImpl}, name::Cstring)::Ptr{CNodeImpl})
end

function node_number_of_children(cnode::CNode)
    return Int(@ccall libconduit.conduit_node_number_of_children(cnode::Ptr{CNodeImpl})::IndexT)
end

function node_number_of_elements(cnode::CNode)
    return Int(@ccall libconduit.conduit_node_number_of_elements(cnode::Ptr{CNodeImpl})::IndexT)
end

function node_reset(cnode::CNode)
    return @ccall libconduit.conduit_node_reset(cnode::Ptr{CNodeImpl})::Nothing
end

function node_move(cnode_a::CNode, cnode_b::CNode)
    return @ccall libconduit.conduit_node_move(cnode_a::Ptr{CNodeImpl}, cnode_b::Ptr{CNodeImpl})::Nothing
end

function node_swap(cnode_a::CNode, cnode_b::CNode)
    return @ccall libconduit.conduit_node_swap(cnode_a::Ptr{CNodeImpl}, cnode_b::Ptr{CNodeImpl})::Nothing
end

function node_remove_path(cnode::CNode, path::AbstractString)
    return @ccall libconduit.conduit_node_remove_path(cnode::Ptr{CNodeImpl}, path::Cstring)::Nothing
end

function node_remove_child(cnode::CNode, idx::Integer)
    return @ccall libconduit.conduit_node_remove_child(cnode::Ptr{CNodeImpl}, idx::IndexT)::Nothing
end

function node_remove_child_by_name(cnode::CNode, name::AbstractString)
    return @ccall libconduit.conduit_node_remove_child_by_name(cnode::Ptr{CNodeImpl}, name::Cstring)::Nothing
end

function node_name(cnode::CNode)
    cstr = @ccall libconduit.conduit_node_name(cnode::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_path(cnode::CNode)
    cstr = @ccall libconduit.conduit_node_path(cnode::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_has_child(cnode::CNode, name::AbstractString)
    return Bool(@ccall libconduit.conduit_node_has_child(cnode::Ptr{CNodeImpl}, name::Cstring)::Cint)
end

function node_has_path(cnode::CNode, path::AbstractString)
    return Bool(@ccall libconduit.conduit_node_has_path(cnode::Ptr{CNodeImpl}, path::Cstring)::Cint)
end

function node_rename_child(cnode::CNode, current_name::AbstractString, new_name::AbstractString)
    return @ccall libconduit.conduit_node_rename_child(cnode::Ptr{CNodeImpl}, current_name::Cstring, new_name::Cstring)::Nothing
end

# node info

function node_is_root(cnode::CNode)
    return Bool(@ccall libconduit.conduit_node_is_root(cnode::Ptr{CNodeImpl})::Cint)
end

function node_is_data_external(cnode::CNode)
    return Bool(@ccall libconduit.conduit_node_is_data_external(cnode::Ptr{CNodeImpl})::Cint)
end

function node_parent(cnode::CNode)
    return CNode(@ccall libconduit.conduit_parent(cnode::Ptr{CNodeImpl})::Ptr{CNodeImpl})
end

function node_total_strided_bytes(cnode::CNode)
    return Int(@ccall libconduit.conduit_node_total_strided_bytes(cnode::Ptr{CNodeImpl})::IndexT)
end

function node_total_bytes_compact(cnode::CNode)
    return Int(@ccall libconduit.conduit_node_total_bytes_compact(cnode::Ptr{CNodeImpl})::IndexT)
end

function node_total_bytes_allocated(cnode::CNode)
    return Int(@ccall libconduit.conduit_node_total_bytes_allocated(cnode::Ptr{CNodeImpl})::IndexT)
end

function node_is_compact(cnode::CNode)
    return Bool(@ccall libconduit.conduit_node_is_compact(cnode::Ptr{CNodeImpl})::Cint)
end

function node_compatible(cnode::CNode, cother::CNode)
    return Bool(@ccall libconduit.conduit_node_is_compact(cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl})::Cint)
end

function node_is_contiguous(cnode::CNode)
    return Bool(@ccall libconduit.conduit_node_is_contiguous(cnode::Ptr{CNodeImpl})::Cint)
end

function node_contiguous_with_node(cnode::CNode, cother::CNode)
    return Bool(@ccall libconduit.conduit_node_contiguous_with_other(cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl})::Cint)
end

function node_contiguous_with_address(cnode::CNode, address::Ptr)
    return Bool(@ccall libconduit.conduit_node_contiguous_with_address(cnode::Ptr{CNodeImpl}, address::Ptr{Cvoid})::Cint)
end

function node_diff(cnode::CNode, cother::CNode, cinfo::CNode, epsilon::Float64)
    return Bool(
        @ccall libconduit.conduit_node_diff(
            cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl}, epsilon::Cdouble
        )::Cint
    )
end

function node_diff_compatible(cnode::CNode, cother::CNode, cinfo::CNode, epsilon::Float64)
    return Bool(
        @ccall libconduit.conduit_node_diff_compatible(
            cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl}, cinfo::Ptr{CNodeImpl}, epsilon::Cdouble
        )::Cint
    )
end

function node_info(cnode::CNode, cnres::CNode)
    @ccall libconduit.conduit_node_info(cnode::Ptr{CNodeImpl}, cnres::Ptr{CNodeImpl})::Nothing
end

function node_print(cnode::CNode)
    @ccall libconduit.conduit_node_print(cnode::Ptr{CNodeImpl})::Nothing
end

function node_print_detailed(cnode::CNode)
    @ccall libconduit.conduit_node_print_detailed(cnode::Ptr{CNodeImpl})::Nothing
end

# compaction methods

function node_compact_to(cnode::CNode, cnres::CNode)
    @ccall libconduit.conduit_node_compact_to(cnode::Ptr{CNodeImpl}, cnres::Ptr{CNodeImpl})::Nothing
end

# update methods

function node_update(cnode::CNode, cother::CNode)
    @ccall libconduit.conduit_node_update(cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl})::Nothing
end

function node_update_compatible(cnode::CNode, cother::CNode)
    @ccall libconduit.conduit_node_update_compatible(cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl})::Nothing
end

function node_update_external(cnode::CNode, cother::CNode)
    @ccall libconduit.conduit_node_update_external(cnode::Ptr{CNodeImpl}, cother::Ptr{CNodeImpl})::Nothing
end

# basic io, parsing, and generation

function node_parse(cnode::CNode, schema::AbstractString, protocol::AbstractString)
    @ccall libconduit.conduit_node_parse(cnode::Ptr{CNodeImpl}, schema::Cstring, protocol::Cstring)::Nothing
end

function node_generate(cnode::CNode, schema::AbstractString, protocol::AbstractString, data::Ptr)
    @ccall libconduit.conduit_node_generate(cnode::Ptr{CNodeImpl}, schema::Cstring, protocol::Cstring, data::Ptr{Cvoid})::Nothing
end

function node_generate_external(cnode::CNode, schema::AbstractString, protocol::AbstractString, data::Ptr)
    @ccall libconduit.conduit_node_generate_external(
        cnode::Ptr{CNodeImpl}, schema::Cstring, protocol::Cstring, data::Ptr{Cvoid}
    )::Nothing
end

function node_save(cnode::CNode, path::AbstractString, protocol::AbstractString)
    @ccall libconduit.conduit_node_save(cnode::Ptr{CNodeImpl}, path::Cstring, protocol::Cstring)::Nothing
end

function node_load(cnode::CNode, path::AbstractString, protocol::AbstractString)
    @ccall libconduit.conduit_node_load(cnode::Ptr{CNodeImpl}, path::Cstring, protocol::Cstring)::Nothing
end

# Conduit Node to_string Methods

function node_to_json(cnode::CNode)
    cstr = @ccall libconduit.conduit_node_to_json(cnode::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_json_with_options(cnode::CNode, copts::CNode)
    cstr = @ccall libconduit.conduit_node_to_json_with_options(cnode::Ptr{CNodeImpl}, copts::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_yaml(cnode::CNode)
    cstr = @ccall libconduit.conduit_node_to_yaml(cnode::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_yaml_with_options(cnode::CNode, copts::CNode)
    cstr = @ccall libconduit.conduit_node_to_yaml_with_options(cnode::Ptr{CNodeImpl}, copts::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_string(cnode::CNode)
    cstr = @ccall libconduit.conduit_node_to_string(cnode::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_string_with_options(cnode::CNode, copts::CNode)
    cstr = @ccall libconduit.conduit_node_to_string_with_options(cnode::Ptr{CNodeImpl}, copts::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_summary_string(cnode::CNode)
    cstr = @ccall libconduit.conduit_node_to_summary_string(cnode::Ptr{CNodeImpl})::Cstring
    str = unsafe_summary_string(cstr)
    Libc.free(cstr)
    return str
end

function node_to_summary_string_with_options(cnode::CNode, copts::CNode)
    cstr = @ccall libconduit.conduit_node_to_summary_string_with_options(cnode::Ptr{CNodeImpl}, copts::Ptr{CNodeImpl})::Cstring
    str = unsafe_string(cstr)
    Libc.free(cstr)
    return str
end

# Conduit Node "Set" Methods

# set for generic types

function node_set_node(cnode::CNode, data::CNode)
    @ccall libconduit.conduit_node_set_node(cnode::Ptr{CNodeImpl}, data::Ptr{CNodeImpl})::Nothing
end

# set_path for generic types

function node_set_path_node(cnode::CNode, path::AbstractString, data::CNode)
    @ccall libconduit.conduit_node_set_path_node(cnode::Ptr{CNodeImpl}, path::Cstring, data::Ptr{CNodeImpl})::Nothing
end

# set_external for generic types

function node_set_external_node(cnode::CNode, data::CNode)
    @ccall libconduit.conduit_node_set_external_node(cnode::Ptr{CNodeImpl}, data::Ptr{CNodeImpl})::Nothing
end

# set_path_external for generic types

function node_set_path_external_node(cnode::CNode, path::AbstractString, data::CNode)
    @ccall libconduit.conduit_node_set_path_external_node(cnode::Ptr{CNodeImpl}, path::Cstring, data::Ptr{CNodeImpl})::Nothing
end

# set for string cases

# set

function node_set_char8_str(cnode::CNode, value::AbstractString)
    @ccall libconduit.conduit_node_set_char8_str(cnode::Ptr{CNodeImpl}, value::Cstring)::Nothing
end

# set_path

function node_set_path_char8_str(cnode::CNode, path::AbstractString, value::AbstractString)
    @ccall libconduit.conduit_node_set_path_char8_str(cnode::Ptr{CNodeImpl}, path::Cstring, value::Cstring)::Nothing
end

# set_external

function node_set_external_char8_str(cnode::CNode, value::AbstractString)
    @ccall libconduit.conduit_node_set_external_char8_str(cnode::Ptr{CNodeImpl}, value::Cstring)::Nothing
end

# set_path_external

function node_set_path_external_char8_str(cnode::CNode, path::AbstractString, value::AbstractString)
    @ccall libconduit.conduit_node_set_path_external_char8_str(cnode::Ptr{CNodeImpl}, path::Cstring, value::Cstring)::Nothing
end

# set for numeric types

# For both bitwidth style and c style numeric types, we provide these variants
# of "set":
#
# * set: scalar, pointer, and pointer detailed variants
# * set_path: scalar, pointer, and pointer detailed variants
# * set_external: pointer, and pointer detailed variants
# * set_path_external: pointer, and pointer detailed variants

# set bitwidth style signed integer scalar types
# set bitwidth style unsigned integer scalar types
# set bitwidth style floating point scalar types
# set for cstyle types

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
    (Cchar, :char),
    (Cshort, :short),
    (Cint, :int),
    (Clong, :long),
    (Cchar, :signed_char),
    (Cshort, :signed_short),
    (Cint, :signed_int),
    (Clong, :signed_long),
    (Cuchar, :unsigned_char),
    (Cushort, :unsigned_short),
    (Cuint, :unsigned_int),
    (Culong, :unsigned_long),
    (Cfloat, :float),
    (Cdouble, :double),
]
    @eval begin

        # set for bitwidth style types

        # set for scalar bitwidth style types
        function $(Symbol(:node_set_, name))(cnode::CNode, value::$type)
            @ccall libconduit.$(Symbol(:conduit_node_set_, name))(cnode::Ptr{CNodeImpl}, value::$type)::Nothing
        end

        # set via bitwidth style pointers for (scalar and array types)
        function $(Symbol(:node_set_, name, :_ptr))(cnode::CNode, data::Ptr{$type}, num_elements::Integer)
            @ccall libconduit.$(Symbol(:conduit_node_set_, name, :_ptr))(
                cnode::Ptr{CNodeImpl}, data::Ptr{$type}, num_elements::IndexT
            )::Nothing
        end
        function $(Symbol(:node_set_, name, :_ptr_detailed))(
            cnode::CNode,
            data::Ptr{$type},
            num_elements::Integer,
            offset::Integer,
            stride::Integer,
            element_bytes::Integer,
            endianness::Integer,
        )
            @ccall libconduit.$(Symbol(:conduit_node_set_, name, :_ptr_detailed))(
                cnode::Ptr{CNodeImpl},
                data::Ptr{$type},
                num_elements::IndexT,
                offset::IndexT,
                stride::IndexT,
                element_bytes::IndexT,
                endianness::IndexT,
            )::Nothing
        end

        # set_path for bitwidth style types

        # set_path for scalar bitwidth style types
        function $(Symbol(:node_set_path_, name))(cnode::CNode, path::AbstractString, value::$type)
            @ccall libconduit.$(Symbol(:conduit_node_set_path_, name))(cnode::Ptr{CNodeImpl}, path::Cstring, value::$type)::Nothing
        end

        # set_path via bitwidth style pointers for (scalar and array types)
        function $(Symbol(:node_set_path_, name, :_ptr))(
            cnode::CNode, path::AbstractString, data::Ptr{$type}, num_elements::Integer
        )
            @ccall libconduit.$(Symbol(:conduit_node_set_path_, name, :_ptr))(
                cnode::Ptr{CNodeImpl}, path::Cstring, data::Ptr{$type}, num_elements::IndexT
            )::Nothing
        end
        function $(Symbol(:node_set_path_, name, :_ptr_detailed))(
            cnode::CNode,
            path::AbstractString,
            data::Ptr{$type},
            num_elements::Integer,
            offset::Integer,
            stride::Integer,
            element_bytes::Integer,
            endianness::Integer,
        )
            @ccall libconduit.$(Symbol(:conduit_node_set_path_, name, :_ptr_detailed))(
                cnode::Ptr{CNodeImpl},
                path::Cstring,
                data::Ptr{$type},
                num_elements::IndexT,
                offset::IndexT,
                stride::IndexT,
                element_bytes::IndexT,
                endianness::IndexT,
            )::Nothing
        end

        # set_external for bitwidth style types

        # set_external for scalar bitwidth style types
        function $(Symbol(:node_set_external_, name))(cnode::CNode, value::$type)
            @ccall libconduit.$(Symbol(:conduit_node_set_external_, name))(cnode::Ptr{CNodeImpl}, value::$type)::Nothing
        end

        # set_external via bitwidth style pointers for (scalar and array types)
        function $(Symbol(:node_set_external_, name, :_ptr))(cnode::CNode, data::Ptr{$type}, num_elements::Integer)
            @ccall libconduit.$(Symbol(:conduit_node_set_external_, name, :_ptr))(
                cnode::Ptr{CNodeImpl}, data::Ptr{$type}, num_elements::IndexT
            )::Nothing
        end
        function $(Symbol(:node_set_external_, name, :_ptr_detailed))(
            cnode::CNode,
            data::Ptr{$type},
            num_elements::Integer,
            offset::Integer,
            stride::Integer,
            element_bytes::Integer,
            endianness::Integer,
        )
            @ccall libconduit.$(Symbol(:conduit_node_set_external_, name, :_ptr_detailed))(
                cnode::Ptr{CNodeImpl},
                data::Ptr{$type},
                num_elements::IndexT,
                offset::IndexT,
                stride::IndexT,
                element_bytes::IndexT,
                endianness::IndexT,
            )::Nothing
        end

        # set_path_external for bitwidth style types

        # set_path_external for scalar bitwidth style types
        function $(Symbol(:node_set_path_external_, name))(cnode::CNode, path::AbstractString, value::$type)
            @ccall libconduit.$(Symbol(:conduit_node_set_path_external_, name))(
                cnode::Ptr{CNodeImpl}, path::Cstring, value::$type
            )::Nothing
        end

        # set_path_external via bitwidth style pointers for (scalar and array types)
        function $(Symbol(:node_set_path_external_, name, :_ptr))(
            cnode::CNode, path::AbstractString, data::Ptr{$type}, num_elements::Integer
        )
            @ccall libconduit.$(Symbol(:conduit_node_set_path_external_, name, :_ptr))(
                cnode::Ptr{CNodeImpl}, path::Cstring, data::Ptr{$type}, num_elements::IndexT
            )::Nothing
        end
        function $(Symbol(:node_set_path_external_, name, :_ptr_detailed))(
            cnode::CNode,
            path::AbstractString,
            data::Ptr{$type},
            num_elements::Integer,
            offset::Integer,
            stride::Integer,
            element_bytes::Integer,
            endianness::Integer,
        )
            @ccall libconduit.$(Symbol(:conduit_node_set_path_external_, name, :_ptr_detailed))(
                cnode::Ptr{CNodeImpl},
                path::Cstring,
                data::Ptr{$type},
                num_elements::IndexT,
                offset::IndexT,
                stride::IndexT,
                element_bytes::IndexT,
                endianness::IndexT,
            )::Nothing
        end
    end
end

# leaf access

# leaf value access (generic)

# direct data access

# direct data pointer access

function node_data_ptr(cnode::CNode)
    return @ccall libconduit.conduit_node_data_ptr(cnode::Ptr{CNodeImpl})::Ptr{Cvoid}
end

# element pointer access

function node_element_ptr(cnode::CNode, idx::Integer)
    return @ccall libconduit.conduit_node_element_ptr(cnode::Ptr{CNodeImpl}, idx::IndexT)::Ptr{Cvoid}
end

# fetch_path direct data pointer access

function node_fetch_path_ptr(cnode::CNode, path::AbstractString)
    return @ccall libconduit.conduit_node_fetch_path_ptr(cnode::Ptr{CNodeImpl}, path::Cstring)::Ptr{Cvoid}
end

# fetch_path element pointer pointer access

function node_fetch_path_element_ptr(cnode::CNode, path::AbstractString, idx::Integer)
    return @ccall libconduit.conduit_node_fetch_path_element_ptr(cnode::Ptr{CNodeImpl}, path::Cstring, idx::IndexT)::Ptr{Cvoid}
end

# string access

# as string

function node_as_char8_str(cnode::CNode)
    return unsafe_string(@ccall libconduit.conduit_node_as_char8_str(cnode::Ptr{CNodeImpl})::Cstring)
end

# fetch_path_as string

function node_fetch_path_as_char8_str(cnode::CNode, path::AbstractString)
    return unsafe_string(@ccall libconduit.conduit_node_fetch_path_as_char8_str(cnode::Ptr{CNodeImpl}, path::Cstring)::Cstring)
end

# as bitwidth signed integer scalar access
# as bitwidth unsigned integer scalar access
# as bitwidth floating point scalar access
# leaf value access (native c style types)

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
    (Cchar, :char),
    (Cshort, :short),
    (Cint, :int),
    (Clong, :long),
    (Cchar, :signed_char),
    (Cshort, :signed_short),
    (Cint, :signed_int),
    (Clong, :signed_long),
    (Cuchar, :unsigned_char),
    (Cushort, :unsigned_short),
    (Cuint, :unsigned_int),
    (Culong, :unsigned_long),
    (Cfloat, :float),
    (Cdouble, :double),
]
    @eval begin

        # leaf value access (bitwidth style types)

        function $(Symbol(:node_as_, name))(cnode::CNode)
            return @ccall libconduit.$(Symbol(:conduit_node_as_, name))(cnode::Ptr{CNodeImpl})::$type
        end

        function $(Symbol(:node_as_, name, :_ptr))(cnode::CNode)
            return @ccall libconduit.$(Symbol(:conduit_node_as_, name, :_ptr))(cnode::Ptr{CNodeImpl})::Ptr{$type}
        end

        # leaf value access via path (bitwidth style types)

        function $(Symbol(:node_fetch_path_as_, name))(cnode::CNode, path::AbstractString)
            return @ccall libconduit.$(Symbol(:conduit_node_fetch_path_as_, name))(cnode::Ptr{CNodeImpl}, path::Cstring)::$type
        end

        function $(Symbol(:node_fetch_path_as_, name, :_ptr))(cnode::CNode, path::AbstractString)
            return @ccall libconduit.$(Symbol(:conduit_node_fetch_path_as_, name, :_ptr))(
                cnode::Ptr{CNodeImpl}, path::Cstring
            )::Ptr{$type}
        end
    end
end

# Get the dtype for the node.

function node_dtype(cnode::CNode)
    return CDatatype(@ccall libconduit.conduit_node_dtype(cnode::Ptr{CNodeImpl})::Ptr{CDatatypeImpl})
end
