package choreolibjava;

import choreo.Choreo;
import org.junit.jupiter.api.Test;

class BasicTest {
  @Test
  void basicTest() {
    var maybeTraj = Choreo.loadTrajectory("Trajectory");
    System.out.println(maybeTraj);
  }
}
