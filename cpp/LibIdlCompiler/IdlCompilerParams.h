#ifndef _IDL_COMPILER_PARAM_H_
#define _IDL_COMPILER_PARAM_H_

#include <CommonTypes.h>

#include <string>
#include <list>

class IdlCompilerParams
{
public:
	IdlCompilerParams(const Common::Int64 &argc, Common::Char **argv);
	~IdlCompilerParams();

private:
	enum CfgErrors
	{
		E_CFG_ERRORS_NO_FILE
	};

	std::list<std::string> m_files;

	bool parseParams(const Common::Int64 &argc, Common::Char **argv);

        void printError(const CfgErrors &err);
	const std::string &getErrorString(const CfgErrors &err);
};

#endif //_IDL_COMPILER_PARAM_H_
