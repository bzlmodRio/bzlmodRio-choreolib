
#include <choreo/Choreo.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  auto maybeTrajectory =
      choreo::Choreo::LoadTrajectory<choreo::SwerveSample>("Test");
  EXPECT_FALSE(maybeTrajectory);
}
