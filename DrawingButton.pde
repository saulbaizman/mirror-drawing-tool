
// class for a drawing button
class DrawingButton extends Button
{
  DrawingButton ( String cname, int ctype_size, int cx_coord, int cy_coord, int cbutton_width, int cbutton_height )
  {
    super ( cname, ctype_size, cx_coord, cy_coord, cbutton_width, cbutton_height ) ;
  }

  void update() 
  {
    if ( overRect (x_coord, y_coord, button_width, button_height ) )
    {
      button_color = button_color_on ;
      // button_text_color = button_text_color_on ;

      if (mousePressed)
      {

        if ( button_name.equals("b"))
        {
          println ("entering drawing mode") ;
          toggle_mode ( "drawing" ) ;
        }
        else
        {
          println ("entering erasing mode") ;
          //activate_erasing( ) ;
          toggle_mode ( "erasing" ) ;
        }

        // button_color = 50 ;
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

