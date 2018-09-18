function [mu,T,a,P,rho]= ISAfunction(z,T0,B1,B2,B3,B4,B5,B6,B7,gamma,R,P0,g)





B=6.5

for i=1:length(z)
       
    if z(i)<=11
        z0=0
        T(i)=T0+(B1.*(z(i)-z0))
      
        T11=T(end)
        
        
        
    elseif z(i)<=20
        z11=11
        T(i)=T11+(B2.*(z(i)-z11))
        
    
        T20=T(end)
        
    elseif z(i)<=32
        z20=20
        T(i)=T20+(B3.*(z(i)-z20))
       
         
        T32=T(end)
        
    elseif z(i)<=47
        z32=32
        T(i)=T32+(B4.*(z(i)-z32))
        
      
        T47=T(end)
        
    elseif z(i)<=51
        z47=47
        T(i)=T47+(B5.*(z(i)-z47))
       
       
        T51=T47(end)
        %%
        
        
    elseif z(i)<=71
        z51=51
        T(i)=T47+(B6.*(z(i)-z51))
      
        T51=T(end)
        z71=71
        
    elseif z(i)>71
        T(i)=T51+(B7.*(z(i)-z71))
        
 
      
        
    end
end


 Bp  =0.0065
 P   = P0.*(1-(Bp.*(z*1000).*T0.^-1)).^(g*(R.*Bp).^-1)
 P_pa=P*10.^5
 a   = sqrt(gamma*R*T)
 mu  = (1.458*10.^-6)*((T.^1.5).*(T+110.4).^-1 ) 
 rho =  P.*((R.*T).^-1)


end


