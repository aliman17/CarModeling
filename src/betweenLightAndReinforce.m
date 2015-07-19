function [Bx, By, Bz] = betweenLightAndReinforce(main)

    [BxR, ByR, BzR] = frontReinforce(true);
    [BxFL, ByFL, BzFL] = frontLight(true);
    [BxFU, ByFU, BzFU] = bonnetUnderGutter(true);
    
    x = 0;
    Bx = [x, x, x, x; 
          x, x, x, x; 
          x, x, x, x; 
          x, x, x, x;];
      
    % Going from the front window
    By = [x, x, x, x; 
          x,20,20,x;
          x,40,40,x;
          x,60,60,x];
      
    Bz = [x, x, x, x; 
          x,x,x,x;
          x,x,x,x;
          x,x,x,x];

     Bx(1,:) = BxFU(4,:);
     Bx(:,4) = BxR(:,1);
     Bx(:,1) = BxFL(:,4);
     Bx(4,:) = equal_split(Bx(4, 1), Bx(4, 4), 4)
     
     By = [ByFU(4,:); ByFU(4,:); ByFU(4,:); ByFU(4,:)] - By;
     By(:,1) = ByFL(:,4);
     By(1,:) = ByFU(4,:);
     By(:,4) = ByR(:,1);
     
     Bz = [BzFU(4,:); BzFU(4,:); BzFU(4,:); BzFU(4,:)];
     Bz(:,1) = BzFL(:,4);
     Bz(1,:) = BzFU(4,:);
     Bz(:,4) = BzR(:,1);
     
     Bx = coonsPatch(Bx, 'normal');
%      By = coonsPatch(By, 'normal');
%      Bz = coonsPatch(Bz, 'normal');
     
    % Write matrices into file
    storeMatrices('betweenLightAndReinforce', Bx, By, Bz);
     
    % This enables to run from this file
    if (nargin == 0)
        figure('units','normalized','outerposition',[0 0 1 1]);
        car3();
        view([0 90]);
    end
end