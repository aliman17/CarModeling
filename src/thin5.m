function thin5()

    x = 0;
    df = 0.3;

    [X, Y, Z, dx, dy, dz] = edge_fit2('side5', 'top');
    [X2, Y2, Z2, dx2, dy2, dz2] = edge_fit2('thin6', 'left');
    
    % Edge
    Bx = [X(1),x,x,X2(1); 
          x,x,x,x;
          x,x,x,x;
          X(1),x,x,X2(4)];
    % Rectangle
    Bx = square(Bx);
    % Correct edge
    Bx(4, :) = X;
    Bx(:, 4) = X2;
    Bx(:, 3) = X2+dx2;
    
    Bx = Bx + [x,x,x,x; 
               x,x,x,x;
               x,x,x,x;
               x,x,x,x];
      
    % Edge
    By = [Y(1),x,x,Y2(1); 
          x,x,x,x;
          x,x,x,x;
          Y(1),x,x,Y2(4)];
    % Rectangle
    By = square(By);
    % Correct edge
    By(4, :) = Y;
    By(:, 4) = Y2;
    By(:, 3) = Y2+dy2;
    
    By = By + [x,5,x,x; 
               x,x,x,x;
               x,x,x,x;
               x,x,x,x];
           
    Bz = [Z(1),x,x,Z2(1); 
          x,x,x,x;
          x,x,x,x;
          Z(1),x,x,Z2(4)];
    % Rectangle
    Bz = square(Bz);
    % Correct edge
    Bz(4, :) = Z;
    Bz(:, 4) = Z2;
    Bz(:, 3) = Z2+dz2;
    
    Bz = Bz + [x,x,x,x; 
               x,x,x,x;
               x,x,x,x;
               x,x,x,x];
      
    

    % Write matrices into file
    storeMatrices('thin5', Bx, By, Bz);
     
    % This enables to run from this file
    if (nargin == 0)
        figure('units','normalized','outerposition',[0 0 1 1]);
        car3();
         view([0 90]);
%         view([0 0]);
    end

end