class TextButton extends Button
{

  // constructor

  TextButton ( String cname, int ctype_size, int cx_coord, int cy_coord, int cbutton_width, int cbutton_height )
  {
    super ( cname, ctype_size, cx_coord, cy_coord, cbutton_width, cbutton_height ) ;
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
        
        if ( button_name.equals("save"))
        {
          println ( "saving picture" ) ;
          save ( "processing-frame.png" ) ;
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


