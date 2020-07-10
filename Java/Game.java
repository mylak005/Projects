package iminchoo;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferStrategy;
import iminchoo.display.Display;
import iminchoo.gfx.Assets;
import iminchoo.gfx.GameCamera;
import iminchoo.input.KeyManager;
import iminchoo.input.MouseManager;
import iminchoo.states.GameState;
import iminchoo.states.IntroState;
import iminchoo.states.LoadingState;
import iminchoo.states.Menu;
import iminchoo.states.Options;
import iminchoo.states.State;

public class Game implements Runnable {

  private Display display;
  private int width, height;
  public String name;
  
  private boolean running = false;
  private Thread thread;
  
  private BufferStrategy bs;
  public static Graphics g;
  
  //States
  public State gameState, menu, options, intro, loading;
  //public State loadingState;
  
  //Input
  private KeyManager keyManager;
  private MouseManager mouseManager;
  
  //Camera
  private GameCamera cam;
  
  //Handler
  private Handler handler;

  public Game(String name, int width, int height) {
    this.width = width;
    this.height = height;
    this.name = name;
    keyManager = new KeyManager();
    mouseManager = new MouseManager();
  }
  
  private void init() {
    display = new Display(name, width, height);
    display.getFrame().addKeyListener(keyManager);
    display.getFrame().addMouseListener(mouseManager);
    display.getFrame().addMouseMotionListener(mouseManager);
    display.getCanvas().addMouseListener(mouseManager);
    display.getCanvas().addMouseMotionListener(mouseManager);
    Assets.init();
    
    handler = new Handler(this);
    cam = new GameCamera(handler, 0, 0);
    
    gameState = new GameState(handler);
    intro = new IntroState(handler);
    loading = new LoadingState(handler);
    menu = new Menu(handler);
    options = new Options(handler);
    State.setState(loading);
  }
  
  private void tick() {
    keyManager.tick();
    
    if (State.getState() != null)
      State.getState().tick();
  }
  
  private void render() {
    bs = display.getCanvas().getBufferStrategy();
    if (bs == null) {
      display.getCanvas().createBufferStrategy(3);
      return;
    }
    g = bs.getDrawGraphics();
    //Clear screen
    g.clearRect(0, 0, Display.win.getBounds().width, Display.win.getBounds().height);
    g.setColor(new Color(0, 0, 0));
    g.fillRect(0, 0, Display.win.getBounds().width, Display.win.getBounds().height);
    //Draw here!
    
    if (State.getState() != null)
      State.getState().render(g);
    
    //End drawing!
    bs.show();
    g.dispose();
  }
  
  
  public void run() { 
    init(); 
    int secondNano = 1000000000;
    int fps = 60;
    double timePerTick = secondNano / fps;
    double delta = 0;
    long now;
    long lastTime = System.nanoTime();
    long timer = 0;
    int ticks = 0;
    
    while (running) {
      now = System.nanoTime();
      delta += (now - lastTime) / timePerTick;
      timer += now - lastTime;
      lastTime = now;
      
      if (delta >= 1) {
        tick();
        render();
        ticks++;
        delta--;
      }
      
      if (timer >= secondNano) {
        //System.out.println("Ticks and Frames: " + ticks);
        ticks = 0;
        timer = 0;
      }
    }
    stop();   
  }
  
  public KeyManager getKeyManager() {
    return keyManager;
  }
  
  public MouseManager getMouseManager() {
    return mouseManager;
  }
  
  public GameCamera getCamera() {
    return cam;
  }
  
  public int getWidth() {
    //System.out.println(Display.win.getBounds().width + " : " + width);
    //return Display.win.getBounds().width;
    return width;
  }
  
  public int getHeight() {
    //System.out.println(Display.win.getBounds().height + " : " + height);
    //return Display.win.getBounds().height;
    return height;
 }
  
  public synchronized void start() {
    if (running) {
      return;
    }
    running = true;
    thread = new Thread(this);
    thread.start();
  }
  
  public synchronized void stop() {
    if (!running) 
      return;
    running = false;
    try {
      thread.join();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }

}