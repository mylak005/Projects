package iminchoo;

import iminchoo.gfx.GameCamera;
import iminchoo.input.KeyManager;
import iminchoo.input.MouseManager;
import iminchoo.maps.Map00;

public class Handler {
  
  private Game game;
  private Map00 map00;
  
  public Handler(Game game) {
    this.game= game;
  }
  
  public GameCamera getCamera() {
    return game.getCamera();
  }
  
  public KeyManager getKeyManager() {
    return game.getKeyManager();
  }
  
  public MouseManager getMouseManager() {
    return game.getMouseManager();
  }
  
  public int getWidth() {
    return game.getWidth();
  }
  
  public int getHeight() {
    return game.getHeight();
  }
  
  public Game getGame() {
    return game;
  }

  public void setGame(Game game) {
    this.game = game;
  }

  public Map00 getMap00() {
    return map00;
  }

  public void setMap00(Map00 map00) {
    this.map00 = map00;
  }

}
