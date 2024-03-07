
#include <choreo/lib/Choreo.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  EXPECT_THROW(choreolib::ChoreoTrajectory traj =
                   choreolib::Choreo::GetTrajectory("Test"),
               std::exception);
}
