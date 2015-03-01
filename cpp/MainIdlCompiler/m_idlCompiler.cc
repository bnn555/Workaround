#include <IdlCompiler.h>

#include <iostream>

int main(int argc, char *argv[])
{
	int result = 0;

	std::cout << " Idl Compiler " << std::endl;

	IdlCompiler compiler(argc, argv);

	compiler.start();

	return result;
}
