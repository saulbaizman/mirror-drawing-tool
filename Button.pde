// button class
class Button 
{

  String button_name ;
  int type_size ;
  int x_coord ;
  int y_coord ;
  int button_height ;
  int button_width ;
  int button_color ;
  int button_color_off = 100 ; // gray
  int button_color_on = 255 ; // white
  int button_color_active ; // FIXME: make this green 
  int button_text_color ;
  int button_text_color_off = 255 ; // white 
  int button_text_color_on = 0 ; // white 
  int button_border_color = 0 ; // black

  int h_buffer = 0 ;


  // constructor
  Button ( String cname, int ctype_size, int cx_coord, int cy_coord, int cbutton_width, int cbutton_height ) 
  {
    println ("Creating button \"" + cname + "\"") ;
    button_name = cname ;
    type_size = ctype_size ;
    button_color = button_color_off ;
    button_text_color = button_text_color_off ;
    x_coord = cx_coord ;
    y_coord = cy_coord ;
    button_width = cbutton_width ;
    button_height = cbutton_height ;
    // make_button ( ) ;
  }

  void display ( ) 
  {
    // draw rectangle
    stroke ( button_border_color ) ;
    strokeWeight ( 1 ) ;

    fill ( button_color ) ;
    rect ( x_coord, y_coord, button_width, button_height ) ;

    pushMatrix(); 

    translate ( x_coord, y_coord ) ;

    // write text to screen
    fill ( button_text_color ) ;
    textFont ( font, type_size ) ;
    // text ( button_name, x_coord, y_coord, button_width, button_height ) ;

    // width divided by 2, minus half the width of the text
    text ( button_name, (button_width/2)-(textWidth(button_name)/2), (button_height/2)+(type_size/2)-h_buffer ) ;

    // do we need the line below?
    popMatrix(); 

    update() ;
  }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width &&  mouseY >= y && mouseY <= y+height)
    {
      return true;
    } 
    else {
      return false;
    }
  }

  // some code from http://processing.org/learning/topics/buttons.html 
  void update() 
  {
    if ( overRect (x_coord, y_coord, button_width, button_height ) )
    {
      button_color = button_color_on ;
      button_text_color = button_text_color_on ;
      //      println ("mousing over button") ;

      if (mousePressed)
      {
        println ("mouse clicked on " + button_name) ;

        if ( button_name.equals("clear"))
        {
          // FIXME: the "clear" command doesn't work well
          /*
          for (int i = 0; i< saved_coordinates.size(); i++ )
          {
           saved_coordinates.remove(i);
          }
          */
          // truncate the saved_coordinates to 0.
          saved_coordinates = new ArrayList (0) ;

          background ( 255 ) ;
          draw_heading ( ) ;
        }
      }
    } 
    else
    {
      //      println ("NOT mousing over button") ;
      button_color = button_color_off ;
      button_text_color = button_text_color_off ;
    }
  }
}

