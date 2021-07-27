function [F1, F2] =  F(W, H, Pm, Pe, D)
    W0 = 2*pi*60;
    F1 = (W0/(2*H))*(Pm - Pe - D*(W-W0)/W0);
    F2 = W - W0;
end
