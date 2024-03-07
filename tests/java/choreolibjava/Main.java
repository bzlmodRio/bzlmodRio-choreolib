package choreolibjava;

import com.choreo.lib.Choreo;
import com.choreo.lib.ChoreoTrajectory;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    ChoreoTrajectory traj = Choreo.getTrajectory("Trajectory");
    System.out.println(traj);
  }
}
