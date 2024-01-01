cd('C:\Users\Selim\SK_Code\-Sustainability-and-Renewable-Energy-Challenge')
%% TABLES
addpath('C:\Users\Selim\SK_Code\-Sustainability-and-Renewable-Energy-Challenge\Data')
load('TBL_TEMP')
load('TBL_CO2')

% TBL_TEMP = table(TBL_TEMP.DATE_yyyymmddhh, DATE_sec, ...
%     TBL_TEMP.T_C, TBL_TEMP.RM_p100,'VariableNames',["DATE_yyyymmddhh", ...
%     "DATE_sec","T_C","RM_p100"]);
%%
% TBL_CO2 = table(["Sleep"; "Resting/low activity work";"Normal work";"Hardwork"], ...
%     (0:1:3)',[0.013;0.02;0.1;0.35],'VariableNames',["Activity","Activity_ID","CO2_Emiss_cmh"]);


%% TEMPERATURES -------------------------------------------------------
% Initial bedroom temprature / °C
T_INIT_BDR = 18; 
% Initial outside temperature (winter) / °C
T_INIT_OUT = 2.9;
% Convert Celsius to Kelvin
Conv_C_to_K = 273.15;
% Temperature of heater / °C
T_HEATER = 50;
% Temperature of cooler / °C
T_COOLER = 12;
% Temperature of human / °C
T_HUMAN = 37;
% Temperature of breath / °C
T_BREATH = 34;

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
% Surface area of human / m²
P_AREA_HUMAN = 1.73;
% Volume of bedroom air / m³
P_V_BDR = P_AREA_BDR*P_RM_HEIGHT;
% Diameter of duct / m
P_DIA_DUCT = 0.15;
% Cross-sectional area of duct / m²
P_AREA_DUCT = pi/4*P_DIA_DUCT^2;
% Max. threshhold of CO2 amount in air / ppm
P_MAX_CO2 = 1000;
% Initial CO2 amount in air / ppm
P_INIT_CO2 = 420;

%% DENSITIES ---------------------------------------------------------
% Air density at 20 °C / (kg/m³)
P_DENSITY_AIR = 1.2041;
% Density of glass / (kg/m³)
P_DENSITY_GLASS = 0.0025;
% Density of bricks / (kg/m³)
P_DENSITY_BRICK = 2/(10^-3);
% Density of PUR / (kg/m³)
P_DENSITY_PUR = 150;
% Density of CO2 / (kg/m³)
P_DENSITY_CO2 = 1.98;

%% AIR PROPERTIES -----------------------------------------------------
% Initial Rel. humidity in the bedroom / %
RH_INIT_BDR = 40;
% Vapor produced by human / (kg/sec)
P_M_HUMAN_VAPOR = 500*10^-3/(24*3600);
% CO2 emitted by human / (kg/sec)
P_M_HUMAN_CO2 = 0.02*P_DENSITY_CO2/3600;

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
% Weight of human / kg
P_M_HUMAN = 80;

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
P_AC_AIR_FLOW = 1;
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
% Heat capacity of human / (kJ/kg*K)
P_CP_HUMAN = 2.98;
% Heat transfer coefficient human / (W/(m²*K))
P_A_HUMAN = 4.5;
% Heat gain human / W
P_HUMAN = 100;
% Heat produced by desktop pc / W
P_PC = 250;
% Mass air flow of HVAC system / kg/sec
P_HANDLER_AIR_FLOW = 0.1;