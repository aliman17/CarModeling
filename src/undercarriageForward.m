function [Bx, By, Bz] = undercarriageForward()

     Bx = [0, 100, 200, 300; 
          0, 100, 200, 300;
          0, 100, 200, 300];
    
    Bx = Bx / 10
    
    By = [0, 0, 0, 0;
          100, 100, 100, 100;
          200, 200, 200, 200];
    Bz = [0, 0, 0, 0;
          0, 0, 0, 0;
          0, 0, 0, 0];

end