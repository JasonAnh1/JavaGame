final static float TRONGLUC = 0.6;
final static float MOVE_SPEED = 4;
final static float SPRITE_SCALE = 50.0/128;
final static float SPRITE_SIZE = 50;
final static float NHAY = 14;
Sprite p;
Sprite z;
PImage snow,crate,red_brick,brown_brick;
ArrayList<Sprite> vatTheMap;

void setup()
{
  size(800,600);
  imageMode(CENTER);
  vatTheMap = new ArrayList<Sprite>();
  p = new Sprite("tanjiro.png", 0.43,100,200);
  z = new Sprite("muzan.png", 0.2,100,200);
  red_brick = loadImage("red_brick.png");
  brown_brick = loadImage("brown_brick.png");
  crate = loadImage("crate.png");
  snow = loadImage("snow.png");
  createPlatforms("map.csv");
}
void draw()
{
  background(255);
  p.display();
  z.display();
  giaiQuyetTrungLap(p,vatTheMap);
  giaiQuyetTrungLap(z,vatTheMap);
  for(Sprite s: vatTheMap)
  s.display();
}
public boolean trenVatThe(Sprite s, ArrayList<Sprite> tuong){
              s.center_y += 5;
              ArrayList<Sprite> listTrung = kiemTraTrungList(s,tuong);
              s.center_y -= 5;
              if(listTrung.size() > 0)
              {
                return true;
              }else 
              return false;
              
}
public void giaiQuyetTrungLap(Sprite s, ArrayList<Sprite> tuong){
  //them trong luc
  s.change_y += TRONGLUC;
  // thay doi chieu doc va giai quuyet trung lap
  
  
  s.center_y += s.change_y;
  ArrayList<Sprite> listTrung = kiemTraTrungList(s,tuong);
  if(listTrung.size() > 0){
     Sprite daTrung = listTrung.get(0);
      if(s.change_y > 0){
          s.setBottom(daTrung.getTop());
      }
      else if(s.change_y < 0){
             s.setTop(daTrung.getBottom()); 
      }s.change_y =0;
  }
  //thay doi chieu ngang va giai quyet trung lap
   s.center_x += s.change_x;
   listTrung = kiemTraTrungList(s,tuong);
  if(listTrung.size() > 0){
     Sprite daTrung = listTrung.get(0);
      if(s.change_x > 0){
          s.setRight(daTrung.getLeft());
      }
      else if(s.change_x < 0){
             s.setLeft(daTrung.getRight()); 
      }
  }

  
  
}

boolean kiemTraTrung(Sprite s1,Sprite s2){
   boolean koTrungx = s1.getRight() <= s2.getLeft() || s1.getLeft() >= s2.getRight();
   boolean koTrungy = s1.getBottom() <= s2.getTop() || s1.getTop() >= s2.getBottom();
   if(koTrungx || koTrungy){
     return false; 
   }else return true;
   
}

public ArrayList<Sprite> kiemTraTrungList(Sprite s,ArrayList<Sprite> list)
{
  ArrayList<Sprite> dayTrung = new ArrayList<Sprite>();
  for(Sprite p: list)
  {
    if(kiemTraTrung(s,p))
        dayTrung.add(p);
  }
  return dayTrung;
}








// hoat dong khi nhan ban [him
void keyPressed()
{
  if(keyCode == RIGHT){
       p.change_x = MOVE_SPEED;
       
  }
  else  if(keyCode == LEFT){
       p.change_x = -MOVE_SPEED;
       
  }
  else if (keyCode == UP && trenVatThe(p,vatTheMap))
  {
    p.change_y = -NHAY;
  }
  
  else if(key == 'a'){
       z.change_x = MOVE_SPEED;
       
  }
  else  if(key == 'd'){
       z.change_x = -MOVE_SPEED;
       
  }
  else if (key == 'w' && trenVatThe(p,vatTheMap))
  {
    z.change_y = -NHAY;
  }
  //if(keyCode == UP){
  //     p.change_y = -MOVE_SPEED;
       
  //}
  //if(keyCode == DOWN){
  //     p.change_y = MOVE_SPEED;
       
  //}
}



void keyReleased()
{
   if(keyCode == RIGHT){
       p.change_x = 0;
       
  }
  if(keyCode == LEFT){
       p.change_x = 0;
       
  }
  //if(keyCode == UP){
  //     p.change_y = 0;
       
  //}
  //if(keyCode == DOWN){
  //     p.change_y = 0;
       
  //}
 
}
void createPlatforms(String filename){
  String[] lines = loadStrings(filename);
  for(int row = 0; row < lines.length; row++){
    String[] values = split(lines[row], ",");
    for(int col = 0; col < values.length; col++){
      if(values[col].equals("1")){
        Sprite s = new Sprite(red_brick, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        vatTheMap.add(s);
      }
      else if(values[col].equals("2")){
        Sprite s = new Sprite(snow, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        vatTheMap.add(s);
      }
      else if(values[col].equals("3")){
        Sprite s = new Sprite(brown_brick, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        vatTheMap.add(s);
      }
      else if(values[col].equals("4")){
        Sprite s = new Sprite(crate, SPRITE_SCALE);
        s.center_x = SPRITE_SIZE/2 + col * SPRITE_SIZE;
        s.center_y = SPRITE_SIZE/2 + row * SPRITE_SIZE;
        vatTheMap.add(s);
      }
    }
  }
  
  
}
  
  
  
  
  
  
  
  
  
  
