#include <HelloWorld.h>
#include <Demo.h>

#include <iostream>

HelloWorld::HelloWorld()
{
}

HelloWorld::~HelloWorld()
{
}

void HelloWorld::say()
{
	Demo d;
	std::cout << "Hello World!!!\n";
}

