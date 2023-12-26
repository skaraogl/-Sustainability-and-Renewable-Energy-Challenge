cd('C:\Users\Selim\SK_Code\-Sustainability-and-Renewable-Energy-Challenge')
%% ====================== PARAMETERS TASK NO. 3 ======================
% TEMPERATURES -------------------------------------------------------
% Initial bedroom temprature / °C
T_INIT_BDR = 20; 
% Initial outside temperature (winter) / °C
T_INIT_OUT = 2.9;
% Convert Celsius to Kelvin
Conv_C_to_K = 273.15;
% Temperature of heater / °C
T_HEATER = 50;

% GEOMETRICS ---------------------------------------------------------
% Bedroom size / m²
P_AREA_BDR = 15;
% Room height / m
P_RM_HEIGHT = 2.5;
% Window area / m²
P_AREA_WIN = 1.82;
% Wall area / m²
P_AREA_WALL = sqrt(P_AREA_BDR)*P_RM_HEIGHT-P_AREA_WIN;
% Window tickness / m
P_THICK_WIN = 0.024;
% Wall tickness / m
P_THICK_WALL = 0.3;

% THERMODYNAMICS -----------------------------------------------------
% Air density at 20 °C / (kg/m³)
P_AIR_DENSITY = 1.2041;
% Heat capacity of air under room conditions / J/(g*K)
P_CP_AIR = 1012;
% Mass of inside air / kg
P_M_AIR = P_AIR_DENSITY*P_AREA_BDR*P_RM_HEIGHT;
% U-value (thermal transmittance) of insulated wall with PUR layer / (W/(m²*K))
U_WALL = 0.32;
% U-value (thermal transmittance) of insulated glass window / (W/(m²*K))
U_WINDOW = 3.0;
% Thermal resistance of wall / (K/W)
R_WALL = 1/(U_WALL*P_AREA_WALL);
% Thermal resistance of window / (K/W)
R_WINDOW = 1/(U_WINDOW*P_AREA_WIN);
% Specific heating power / (W/m²)
P_SPEC_HEAT = 45;
% Max. heating power / W
P_MAX_HEAT = P_SPEC_HEAT*P_AREA_BDR;
% Air flow of heater / (kg/sec)
P_HEATER_AIR_FLOW = 1;