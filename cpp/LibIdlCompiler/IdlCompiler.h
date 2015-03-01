#ifndef _IDL_COMPILER_H_
#define _IDL_COMPILER_H_

#include <IdlCompilerParams.h>

class IdlCompiler
{
public:
	IdlCompiler(const Common::Int64 &argc, Common::Char *argv[]);
	~IdlCompiler();

	void start();

private:
	IdlCompilerParams m_params;

};

#endif //_IDL_COMPILER_H_
