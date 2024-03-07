package choreolibjava;

import com.choreo.lib.Choreo;
import com.choreo.lib.ChoreoTrajectory;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    ChoreoTrajectory traj = Choreo.getTrajectory("Trajectory");
    System.out.println(traj);
  }
}
