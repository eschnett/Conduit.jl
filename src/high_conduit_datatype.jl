# High-level interface for conduit datatype

################################################################################

struct Datatype
    cdataset::CDatatype
    Datatype(cdataset::CDatatype) = new(cdataset)
end
Datatype() = Datatype(dataset_create())

function dataset_destroy(dataset::Datatype)
    cdataset = dataset.cdataset
    if cdataset != CDatatype()
        dataset_destroy(cdataset)
    end
end

datatype_id(datatype::Datatype) = datatype_id(datatype.cdatatype)
datatype_name(datatype::Datatype) = datatype_name(datatype.cdatatype)
datatype_number_of_elements(datatype::Datatype) = datatype_number_of_elements(datatype.cdatatype)
datatype_offset(datatype::Datatype) = datatype_offset(datatype.cdatatype)
datatype_stride(datatype::Datatype) = datatype_stride(datatype.cdatatype)
datatype_element_bytes(datatype::Datatype) = datatype_element_bytes(datatype.cdatatype)
datatype_endianness(datatype::Datatype) = datatype_endianness(datatype.cdatatype)
datatype_element_index(datatype::Datatype, idx::Integer) = datatype_element_index(datatype.cdatatype, idx)
datatype_is_empty(datatype::Datatype) = datatype_is_empty(datatype.cdatatype)
datatype_is_object(datatype::Datatype) = datatype_is_object(datatype.cdatatype)
datatype_is_list(datatype::Datatype) = datatype_is_list(datatype.cdatatype)
datatype_is_number(datatype::Datatype) = datatype_is_number(datatype.cdatatype)
datatype_is_floating_point(datatype::Datatype) = datatype_is_floating_point(datatype.cdatatype)
datatype_is_integer(datatype::Datatype) = datatype_is_integer(datatype.cdatatype)
datatype_is_signed_integer(datatype::Datatype) = datatype_is_signed_integer(datatype.cdatatype)
datatype_is_unsigned_integer(datatype::Datatype) = datatype_is_unsigned_integer(datatype.cdatatype)
datatype_is_int8(datatype::Datatype) = datatype_is_int8(datatype.cdatatype)
datatype_is_int16(datatype::Datatype) = datatype_is_int16(datatype.cdatatype)
datatype_is_int32(datatype::Datatype) = datatype_is_int32(datatype.cdatatype)
datatype_is_int64(datatype::Datatype) = datatype_is_int64(datatype.cdatatype)
datatype_is_uint8(datatype::Datatype) = datatype_is_uint8(datatype.cdatatype)
datatype_is_uint16(datatype::Datatype) = datatype_is_uint16(datatype.cdatatype)
datatype_is_uint32(datatype::Datatype) = datatype_is_uint32(datatype.cdatatype)
datatype_is_uint64(datatype::Datatype) = datatype_is_uint64(datatype.cdatatype)
datatype_is_float32(datatype::Datatype) = datatype_is_float32(datatype.cdatatype)
datatype_is_float64(datatype::Datatype) = datatype_is_float64(datatype.cdatatype)
datatype_is_char(datatype::Datatype) = datatype_is_char(datatype.cdatatype)
datatype_is_short(datatype::Datatype) = datatype_is_short(datatype.cdatatype)
datatype_is_int(datatype::Datatype) = datatype_is_int(datatype.cdatatype)
datatype_is_long(datatype::Datatype) = datatype_is_long(datatype.cdatatype)
datatype_is_unsigned_char(datatype::Datatype) = datatype_is_unsigned_char(datatype.cdatatype)
datatype_is_unsigned_short(datatype::Datatype) = datatype_is_unsigned_short(datatype.cdatatype)
datatype_is_unsigned_int(datatype::Datatype) = datatype_is_unsigned_int(datatype.cdatatype)
datatype_is_unsigned_long(datatype::Datatype) = datatype_is_unsigned_long(datatype.cdatatype)
datatype_is_float(datatype::Datatype) = datatype_is_float(datatype.cdatatype)
datatype_is_double(datatype::Datatype) = datatype_is_double(datatype.cdatatype)
datatype_is_string(datatype::Datatype) = datatype_is_string(datatype.cdatatype)
datatype_is_char8_str(datatype::Datatype) = datatype_is_char8_str(datatype.cdatatype)
datatype_is_little_endian(datatype::Datatype) = datatype_is_little_endian(datatype.cdatatype)
datatype_is_big_endian(datatype::Datatype) = datatype_is_big_endian(datatype.cdatatype)
datatype_endianness_matches_machine(datatype::Datatype) = datatype_endianness_matches_machine(datatype.cdatatype)
