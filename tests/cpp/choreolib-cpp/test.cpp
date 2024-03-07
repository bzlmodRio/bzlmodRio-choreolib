
#include "gtest/gtest.h"
#include <choreo/lib/Choreo.h>

TEST(BasicTest, BasicTest) {
    EXPECT_THROW(choreolib::ChoreoTrajectory traj = choreolib::Choreo::GetTrajectory("Test"), std::exception);
}