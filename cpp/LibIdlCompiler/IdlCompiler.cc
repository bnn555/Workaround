#include <IdlCompiler.h>

#include <iostream>

IdlCompiler::IdlCompiler(const Common::Int64 &argc, Common::Char *argv[])
 : m_params(argc, argv)
{
}

IdlCompiler::~IdlCompiler()
{
}

void IdlCompiler::start()
{
	std::cout << "start compiling...\n";
	std::cout << "compilation terminted";
}
