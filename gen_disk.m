function [ w ] = gen_disk( size_e , ep , sti ,categ)

switch categ
    case 'disk'
        
        % Create a meshgrid to
        [ X , Y ] = meshgrid( linspace( -1 , 1, size_e));
        
        disk = zeros( size_e ,  size_e);
        
        % Create a disk
        theresold = (( size_e - 80 ) - 36)/size_e ;
        
        panel = X.^2 + Y.^2;
        
        [index] = find(panel < theresold);
        disk(index) = 1;
        
        % Create a 4-D
        for xx =1: ep
            for yy = 1:sti
            w(: , : , xx, yy) = disk;
            end
        end
    case 'gauss'
        
        % Generate a guass filter
        gau = fspecial('gauss' , size_e, size_e/2);
        
        % Turn this filter into 3-D
        for xx =1: ep
            for yy = 1: sti
                w(: , : , xx, yy) = gau;
            end
        end
        
end

end

