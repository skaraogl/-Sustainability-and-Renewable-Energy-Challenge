cd('C:\Users\Selim\SK_Code\-Sustainability-and-Renewable-Energy-Challenge')
%% TEMPERATURES -------------------------------------------------------
% Initial bedroom temprature / °C
T_INIT_BDR = 16; 
% Initial outside temperature (winter) / °C
T_INIT_OUT = 2.9;
% Convert Celsius to Kelvin
Conv_C_to_K = 273.15;
% Temperature of heater / °C
T_HEATER = 50;

%% GEOMETRICS ---------------------------------------------------------
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
% Thickness of one glass in window / m
P_THICK_GLASS = 0.004;
% Thickness of brick layer / m
P_THICK_BRICK = 0.175;
% Thickness of PUR layer / m
P_THICK_PUR = P_THICK_WALL - P_THICK_BRICK;

%% DENSITIES ---------------------------------------------------------
% Air density at 20 °C / (kg/m³)
P_DENSITY_AIR = 1.2041;
% Density of glass / (kg/m³)
P_DENSITY_GLASS = 0.0025;
% Density of bricks / (kg/m³)
P_DENSITY_BRICK = 2/(10^-3);
% Density of PUR / (kg/m³)
P_DENSITY_PUR = 150;

%% MASSES ------------------------------------------------------------
% Mass of inside air / kg
P_M_AIR = P_DENSITY_AIR*P_AREA_BDR*P_RM_HEIGHT;
% Mass of brick layer / kg
P_M_BRICK = P_AREA_WALL*P_THICK_BRICK*P_DENSITY_BRICK;
% Mass of PUR layer / kg
P_M_PUR = P_AREA_WALL*P_THICK_PUR*P_DENSITY_PUR;
% Mass of wall / kg
P_M_WALL = P_M_BRICK + P_M_PUR;
% Specific mass of window per area / (kg/m²)
P_M_WINDOW_SPEC = 20;
% Mass of 2-layer glass window / kg
% P_M_WINDOW = P_AREA_WIN*P_THICK_GLASS*P_DENSITY_GLASS*2;
P_M_WINDOW = P_AREA_WIN*P_M_WINDOW_SPEC;

%% THERMODYNAMICS -----------------------------------------------------
% Heat capacity of air under room conditions / J/(g*K)
P_CP_AIR = 1012;
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
% Emissivity of glass / 1
P_EM_GLASS = 0.94;
% Emissivity of plastered brick wall / 1
P_EM_WALL = 0.94;
% Heat capacity of glass / J/(kg*K)
P_CP_GLASS = 720;
% Heat capacity of bricks / J/(kg*K)
P_CP_BRICK = 920;
% Heat capacity of PUR / J/(kg*K)
P_CP_PUR = 1400;
% Heat capacity wall / J/(kg*K)
P_CP_WALL = (P_M_BRICK/P_M_WALL)*P_CP_BRICK+(P_M_PUR/P_M_WALL)*P_CP_PUR;