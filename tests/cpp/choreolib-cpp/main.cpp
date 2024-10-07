
#include <choreo/Choreo.h>

#include <iostream>

int main() {
  choreo::Choreo::LoadTrajectory<choreo::SwerveSample>("Test");
  std::cout << "Hello World" << std::endl;
  // std::cout << xxx << std::endl;
  return 0;
}
