# Low-level interface for conduit datatype

################################################################################

const IndexT = Int64

function __init__()
    # Did we make the right guess?
    datatype_sizeof_index_t() == sizeof(IndexT) || throw(InitError(:Conduit, "sizeof(index_t) differs between C and Julia"))
    return nothing
end

################################################################################

# typedef for conduit_datatype

# This is an opaque struct in C
struct CDatatypeImpl end

"""
    CDatatype::Type
"""
struct CDatatype
    datatype::Ptr{CDatatypeImpl}
end
CDatatype() = CDatatype(Ptr{CDatatypeImpl}())

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
