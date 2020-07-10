package iminchoo;

public class Launcher {
  
  public static int gameWidth = 1280, gameHeight = 720;
  
  public static void main(String[] args) {
    Game game = new Game("Iminchoo", gameWidth, gameHeight);
    game.start();
  }
}
