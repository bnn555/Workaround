#include <IdlCompilerParams.h>

#include <Common.h>

#include <iostream>
#include <string>
#include <stdlib.h>

namespace
{
	enum State
	{
		E_STATE_NO_FLAG,
		E_STATE_COMPILE_FLAG
	};

	const std::string &GetFatalError()
	{
		static const std::string C_FATAL_ERROR("fatal error");
		return C_FATAL_ERROR;
	}

	const std::string &GetEndMsg()
	{
		static const std::string C_END_MSG("compilation terminated");
		return C_END_MSG;
	}

	const std::string &GetPrefix()
	{
		static const std::string C_PREFIX("-");
		return C_PREFIX;
	}

	const std::string &GetCompileFlag()
	{
		static const std::string C_FLAG("c");
		return C_FLAG;
	}
};

IdlCompilerParams::IdlCompilerParams(const Common::Int64 &argc, 
				     Common::Char       *argv[])
 : m_files()
{
	if(1 == argc)
	{
		printError(E_CFG_ERRORS_NO_FILE);
	}
	else
	{
		parseParams(argc, argv);
	}
}

IdlCompilerParams::~IdlCompilerParams()
{
}

bool IdlCompilerParams::parseParams(const Common::Int64 &argc,
                                    Common::Char        **argv)
{
	bool result = true;
//	State state = E_STATE_NO_FLAG;

	for(Common::Int64 it = 0; it < argc; ++it)
	{
		std::string param(argv[it]);
		
		
		std::cout << param << std::endl;
	}

	return result;
}

void IdlCompilerParams::printError(const CfgErrors &err)
{
	//no input file given
	//
	std::cout << GetFatalError() << ": " 
                  << getErrorString(E_CFG_ERRORS_NO_FILE) 
                  << std::endl;
	std::cout << GetEndMsg() << std::endl;
	exit(Common::E_EXIT_CODE_ERROR);
}

const std::string &IdlCompilerParams::getErrorString(
				       const IdlCompilerParams::CfgErrors &err)
	{
		switch(err)
		{
		case E_CFG_ERRORS_NO_FILE:
		{
			static const std::string C_NO_FILE("no input files");
			return C_NO_FILE;
		}
		default:
			static const std::string C_EMPTY;
			return C_EMPTY;
		}
	}

