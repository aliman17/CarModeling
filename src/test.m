function [Bx, By, Bz] = test()

     Bx = [0, 100, 200, 300; 
          0, 100, 200, 300;
          0, 100, 200, 300];
    
    By = [0, 0, 0, 0;
          200, 200, 200, 200;
          400, 400, 400, 400];
    Bz = [0, 0, 0, 0;
          0, 0, 0, 0;
          0, 0, 0, 0];
      
     bezier_surface(Bx, By, Bz);

end