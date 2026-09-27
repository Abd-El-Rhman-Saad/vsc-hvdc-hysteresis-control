function Iabc_ref = generate_ref(P, Q, wt)
    Vm = 90000; % Peak phase voltage from the sheet
    
    % Calculate peak current
    S = sqrt(P^2 + Q^2);
    Im = (2/3) * (S / Vm);
    
    % Calculate power factor angle
    phi = atan2(Q, P);
    
    % Generate 3-phase reference currents
    Ia = Im * sin(wt - phi);
    Ib = Im * sin(wt - 2*pi/3 - phi);
    Ic = Im * sin(wt + 2*pi/3 - phi);
    
    Iabc_ref = [Ia; Ib; Ic];
end