/*

 The End is Where We Start From: Week 3
 
 */

/*

 TO DO
 - replace type on drawing and erase labels to be icons
 - implement eraser tool
 - store the motions, then redraw them after a pause
 
 FIXME
 - make the program accept regular colors in 0,0,0 format, not just a single integer
 
 
 */

boolean DEBUG = true ;

PFont font ;

String line1 = "palindrome interface";
String line2 = "version 0.2";


boolean first_run = true ;

int canvas_size_x = 700 ;
int canvas_size_y = canvas_size_x ;
int background_color = 255 ;

int brush_diameter = 4 ;
int eraser_diameter = 16 ;

float start_time ;
float end_time ;


TextButton clear_button ;
TextButton save_button ;

DrawingButton brush_button ;
DrawingButton erase_button ;

String default_mode = "drawing" ;
String current_mode ;

ArrayList saved_coordinates = new ArrayList ( ) ;


void setup( ) 
{


  size (canvas_size_x, canvas_size_y+50);
  background(background_color);
  smooth ( ) ;
  font = loadFont("HelveticaNeue-18.vlw");

  current_mode = default_mode ;

  draw_heading ( ) ;

  // clear_button = new Button ("clear", 18, (width/2)-95, 20, 80, 20);
  clear_button = new TextButton ("clear", 18, 66, 20, 80, 24);
  clear_button.h_buffer = 2 ; // horizontal buffer for vertical centering
  clear_button.button_color_off = 0;

  save_button = new TextButton ( "save", 18, 148, 20, 80, 24) ;
  save_button.h_buffer = 2 ;
  save_button.button_color_off = 0;


  brush_button = new DrawingButton ( "b", 10, 14, 20, 24, 24 ) ;
  brush_button.h_buffer = 1 ;
  erase_button = new DrawingButton ( "e", 10, 40, 20, 24, 24 ) ;
  erase_button.h_buffer = 1 ;

  // activate brush tool

  toggle_mode ( current_mode ) ;
  // change drawing button to "selected" state
}

void draw ( )
{
  clear_button.display ( ) ;
  save_button.display ( ) ;
  brush_button.display ( ) ;
  erase_button.display ( ) ;

  if ( current_mode.equals("drawing"))
  {
    //println ( "entering drawing mode" ) ;
    brush_button.button_color = 100 ;
    erase_button.button_color = 20 ;
    activate_drawing ( ) ;
    // make the cursor clickable
  }

  if ( current_mode.equals("erasing"))
  {
    //println ( "entering erasing mode" ) ;
    erase_button.button_color = 100 ;
    brush_button.button_color = 20 ;
    activate_erasing ( ) ;
  }
}

void toggle_mode ( String new_mode )
{

  current_mode = new_mode ;
}

void activate_drawing ( ) 
{
  if ( mousePressed && mouseY > 50 && pmouseY > 50 )
  {
    draw_correct ( ) ;
    save_mirrored ( ) ;
  }
}

void mousePressed ( )
{
  if ( current_mode.equals("drawing") )
  {  
    start_time = millis () ;
  }
}

void activate_erasing ( ) 
{
  if ( mousePressed && mouseY > (50+eraser_diameter) && pmouseY > (50+eraser_diameter) )
  {
    strokeWeight(eraser_diameter);
    stroke(255);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void draw_correct ( )
{
  strokeWeight(brush_diameter);
  stroke(0);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void save_mirrored ( )
{
  /*
  strokeWeight(brush_diameter);
   stroke(0);
   line((width-mouseX), mouseY, (width-pmouseX), pmouseY);
   */
  saved_coordinates.add ( new CoordinateSaver ( (width-mouseX), mouseY, (width-pmouseX), pmouseY ) ) ;

  //    println ( saved_coordinates ) ;

  /*
  if (mouseX > (width/2))
   {
   line((width-mouseX), mouseY, (width-pmouseX), pmouseY);
   }
   else
   {
   line((width-mouseX), mouseY, (width-pmouseX), pmouseY);
   }
   */
}


void mouseReleased()
{
  if ( current_mode.equals("drawing") )
  {  
    end_time = millis() ;
    
    // this conditional prevents a nasty dot from appearing in the header
    if ( mouseY > 50 && pmouseY > 50 )
    {
      //delay(2000) ;
      draw_mirror_image ( end_time - start_time ) ;
    }
  } 

  println ("start time: " + (start_time ) ) ;
  println ("end time: " + (end_time  ) ) ;
  println ("elapsed time: " + ( end_time - start_time ) ) ;
}

void draw_mirror_image ( float duration )
{
  strokeWeight(brush_diameter);
  stroke(0);
  line((width-mouseX), mouseY, (width-pmouseX), pmouseY);

  for (int i = 0; i< saved_coordinates.size(); i++ )
  {
    CoordinateSaver coords = (CoordinateSaver) saved_coordinates.get(i);
    line(coords.mx, coords.my, coords.pmx, coords.pmy);
  }
}

void draw_heading ()
{

  println ( "drawing heading" ) ;
  int h1_text_color = 100 ;
  int h1_text_size = 30 ;
  int h2_text_color = 200 ;
  int h2_text_size = 9 ;

  fill ( h1_text_color ) ;
  textAlign ( LEFT) ;
  //textMode(SCREEN);
  textFont ( font, h1_text_size) ;
  text (line1, (width/2)+15, 40);


  fill(h2_text_color);
  //textMode(SCREEN);
  textFont(font, h2_text_size);
  text (line2, width-50, 40);

  // draw a line to separate the header 
  stroke(h2_text_color);
  line(0, 50, width, 50);
}

