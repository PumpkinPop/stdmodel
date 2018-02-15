function [G_c,G_s]= makeGaborFilter(n, sfvec, thetavec)
 
% Orientaion
nO = length(thetavec);
% Spatial frequency
nF=length(sfvec);

% cell arrays for filters
G_c = cell(nO,nF); % Cosinusoid gabor filters
G_s = cell(nO,nF); % Sinsoid gabor filters

for sfind = 1:nF
    sf = sfvec(sfind);    
    n1=n/(sf/2);
    [x, y] = meshgrid(linspace(1/n, 1/(sf/2), n1));
    for thetaind = 1:nO
        theta = thetavec(thetaind);
        
        % Rotation the 2D gabors
        wave_c = cos(theta);
        wave_s = sin(theta);

        % complex harmonic
        h = exp(1i*(wave_c*x+wave_s*y)*pi*2*sf);
        
        % Gauss with spatial frequence
        Gauss = fspecial('gauss',n1, n1/4);
        
        % 2D Gabor
        Gabor_A = Gauss.*h;
        
        % subtract mean to make sure its mean is 0
        Gabor_A = Gabor_A - mean(Gabor_A(:));
       
        % Cos Gabor
        Gabor_c = imag(Gabor_A);
        Gabor_s = real(Gabor_A);
        
        %Normalization
        norm_Gabor_c=Gabor_c.*1/norm(Gabor_c);
        norm_Gabor_s=Gabor_s.*1/norm(Gabor_s);
       
        
        % Scale the gobors
        G_c{ thetaind,sfind}=norm_Gabor_c;
        G_s{thetaind,sfind}=norm_Gabor_s;
        
    end
end

