#ifndef _COMMON_TYPES_H_
#define _COMMON_TYPES_H_

#include <cstdint>

namespace Common
{
	typedef std::size_t   Size;
	typedef int8_t   Int8;
	typedef uint8_t  UInt8;
        typedef int16_t  Int16;
        typedef uint16_t UInt16;
	typedef int32_t  Int32;
	typedef uint32_t UInt32;
	typedef int64_t  Int64;
	typedef uint64_t UInt64;
	//char type is different from signed char(Int8)
	typedef char     Char;
}

#endif //_COOMON_TYPES_H_
