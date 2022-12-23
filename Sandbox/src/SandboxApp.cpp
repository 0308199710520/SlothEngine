#include <SlothEngine.h>

class Sandbox : public SE::Application
{
public:
	Sandbox() = default;

	~Sandbox() = default;
};    

SE::Application* CreateApplication()
{
	return new Sandbox();
}