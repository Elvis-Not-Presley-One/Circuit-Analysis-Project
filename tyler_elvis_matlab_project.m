%% Tyler Elvis, 4/2/24, ENRG 108 

%% Final Project 

clc, clear
format short, format compact 

%% Objectives 

% Find the voltage and current through each component in the system.
% Use the current loop directions shown in the schematic.
% Check to determine if the resistor R5 will fail.
% Display the results using appropriate Matlab display commands.

%% Code 

    % all values of the resistors 
    R1 = 100;
    R2 = 500;
    R3 = 500;
    R4 = 750;
    R5 = 500;
    R6 = 200;
    R7 = 1000;
    R8 = 250;
    R9 = 1000;
    R10 = 750;
    R11 = 500;
    R12 = 500;
    R13 = 500;
    R14 = 500;
    
    % all values of the ERG source in volts 
    V1 = 9;
    V2 = 5;
    V3 = 15; 

    % Values of all ending terms of the equations 
        V = [0; V1; V1; 0; 0; V2; V3];  
              
        % All Ressiors * current loop matrices 
        Rcoef = [(R1+R3+R2), -R3, -R2, 0, 0, 0, 0;   
         -R2,     (R2+R4+R9),-R4, -R9, 0, 0, 0;
              -R3, -R5,(R3+R5+R7),  -R7, 0, 0, 0;
         -R7, -R8, -R6, (R7+R8+R6), 0, 0, 0;
                -R9, -R10, -R6, 0, (R9+R10+R6), 0, 0;
              -R4, -R10, 0, 0, 0, (R1+R4+R10+R13), 0;
                -R8, -R5, 0, 0, 0, 0, (R12+R14+R8+R5)];

% left div to find all I values of each loop 
I = Rcoef\V;

% Takes each of the answers from I and turns into own variable 
    I1 = I(1);
    I2 = I(2);
    I3 = I(3);
    I4 = I(4);
    I5 = I(5);
    I6 = I(6);
    I7 = I(7);

% outside loop check 
% the equatiosn of R * I values 
 Check_ = (R11+R13),(R12+R14), R1, 0, 0, 0, 0;
    
 % outside loop check end terms of equations 
 V_Check = [V2+V3];
    
 % uese left div to find the total value 
    Check = round(Check_\V_Check);

    % if else statment for the value above, so if its below or equal to
    % zero is very good but if its above zero its bad, if its above but
    % cloes to zero it still checks out. 
            if Check <=0 
                fprintf('The Voltage going through the outside loop is %4.2f and checks out \n', Check);
            else
                fprintf('The Votage going through the outside loop is %4.2f and does not check out', Check);
            end


format bank
   
% Currents going through ressistor 
    C_R1 = I1;
    C_R2 = I1 - I2;
    C_R3 = I1 - I3;
    C_R4 = I2 - I4;
    C_R5 = I3 - I5;
    C_R6 = I4 - I5 - I6;
    C_R7 = I3 - I4 - I7;
    C_R8 = I4 - I7;
    C_R9 = I2 - I5;
    C_R10 = I5 - I6;
    C_R11 = I6;
    C_R12 = I7;
    C_R13 = I6;
    C_R14 = I7;


        % Voltage running through ressistor 
        V_R1 = R1 * C_R1;
        V_R2 = R2 * C_R2;
        V_R3 = R3 * C_R3;
        V_R4 = R4 * C_R4;
        V_R5 = R5 * C_R5;
        V_R6 = R6 * C_R6;
        V_R7 = R7 * C_R7;
        V_R8 = R8 * C_R8;
        V_R9 = R9 * C_R9;
        V_R10 = R10 * C_R10;
        V_R11 = R11 * C_R11;
        V_R12 = R12 * C_R12;
        V_R13 = R13 * C_R13;
        V_R14 = R14 * C_R14;

              % Ressistor Check 
              if C_R5 <10.0 
                  fprintf("\n \n  R5 meets the requirment \n \n")
              else 
                  fprintf("\n \n R5 does not meet requirement \n \n")
              end 

     % getting all of the data nice for table 
    Ressistor = ["R1"; "R2"; "R3"; "R4"; "R5"; "R6"; "R7"; "R8"; "R9"; "R10"; "R11"; "R12"; "R13"; "R14";];
    Ohms = [R1; R2; R3; R4; R5; R6; R7; R8; R9; R10; R11; R12; R13; R14;];
    Votlage = [C_R1; C_R2; C_R3; C_R4; C_R5; C_R6; C_R7; C_R8; C_R9; C_R10; C_R11; C_R12; C_R13; C_R14;];
    Current = [ V_R1;  V_R2;  V_R3;  V_R4;  V_R5;  V_R6;  V_R7;  V_R8;  V_R9;  V_R10;  V_R11;  V_R12;  V_R13;  V_R14;];

circuit_analysis = table(Ressistor, Ohms, Votlage, Current)

