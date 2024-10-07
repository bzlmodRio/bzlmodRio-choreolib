package choreolibjava;

import choreo.Choreo;

public final class Main {
  private Main() {}

  public static void main(String[] args) {
    var maybeTraj = Choreo.loadTrajectory("Trajectory");
    System.out.println(maybeTraj);
  }
}
