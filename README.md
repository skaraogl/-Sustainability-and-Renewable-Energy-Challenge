# Solution to MATLAB and Simulink Challenge project <195> <'Control, Modeling, Design, and Simulation of Modern HVAC Systems'>
This is a template repo for Excellence in Innovation project solutions.

Please add the following items:

[Program link](https://github.com/mathworks/MATLAB-Simulink-Challenge-Project-Hub/blob/main/megatrends/Sustainability%20and%20Renewable%20Energy.md)

[Project description link](https://github.com/mathworks/MATLAB-Simulink-Challenge-Project-Hub/tree/main/projects/Control%2C%20Modeling%2C%20Design%2C%20and%20Simulation%20of%20Modern%20HVAC%20Systems)


# Project details
## Framework
To accomplish the task of adequately to control, model, design and simulate a modern HVAC system multiple iteration stages were passed through. First a simple one-room thermal Simscape model was developed. Later moist air properties were included. For the final stage a 3-room apartment was developed (see below).

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/4080298f-c592-4082-a85b-f2e8a6c6df30)

The measurements can be taken from below drawing:

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/0d0642fd-6c61-491b-8399-3e0bf29cdcda)

The apartment imitates a typical german 3-room apartment. It has an area of 108.8 m² including a balcony. The outer walls are thermally insulated consisting of a brick layer plus an PUR layer. The internal walls can be distingueshed into 2 groups: First load-bearing and second non-load-bearing walls. The load-bearing walls are from brick and the non-load-bearing walls are from porous/pervious concrete. The ceiling is from concrete containing a generic thermal insulation layer. Closed doors are not included in the model to ease the simulation. Currently the simulation time is 1 week and the sample time is 1 sec. Because previously the simulation would encounter an error after the inclusion of the moist air Simcape domain, in the Solver Configuration block the "Backward Euler" local solver with a sample time of 1 sec was set (see image below) 

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/6dc1dbec-a76b-4231-87c2-2588f3aed2d1)


The apartment is inhabited by a family of 4: 2 children and 2 adults. Bedroom 1 belongs to the children and bedroom 2 to the adults. Only the two bedrooms and the living room is air-conditioned. Additionally an air-handling unit is included and the map of the air flow can be taken from the image below.

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/7935ce11-48a4-4215-bc2c-d59cc7a1926e)

Fresh and new air gets introduced from bedroom 1, 2 and the living room and gets blown out from the bathroom and the kitchen. For a more realistic simulation an average weekday routine of all inhabitants is implemented (further informations are in the model). Furthermore the effects of solar radiation can be switched on and off in the simulation. 

## Air-conditioning and air-handling unit
As already mentioned only bedroom 1, 2 and the living room are air-conditioned. The AC in the simulation is realized by a simple PI control generating an activation signal for the cooling and heating power (see below).

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/41a0bded-4e44-45db-951b-9b2969156ab9)

Because the AC can either heat or cool at one point at a time, the signal gets splitted (for cooling inverted) and then saturated. These activation signals get then inputed into subsystems were the generic heating and cooling power is calculated (see below images).

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/69fa59d2-6faa-44d6-afa8-1a4786fea9fc)

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/6ccfb8a0-c21a-43fc-931d-1b398f1752c4)

As you have seen from the first image of this sub-chapter the AC control unit gets interfered by a de-humidifying functionality. Together with the air handler air flow intensity calculation from the control panel (as the name suggests) the moist air is de-humidified. The logic behind is partially implemented within StateFlow (see below). If the relative humidity in the appropiate moist air chamber surpasses 85 % the AC is deactivated immidiately until the humidity level is again below 85 %.

![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/0160df0a-9ecb-4c38-87dd-80ce08d257f0)

The parameters of the PI controller were gained by the PID Tuner App and the breakpoints within the 2-D look-up table for the air handler flow control by an iterative approach.

# How to run section
To latest version of model is implemented in the Simulink-file named "Task_No6.slx" located in the main directory. To properly run the model the parameter-file "PARAMETERS.m" is needed. To manually run the parameter-file is not needed, because it gets automatically initialised by the Simulink-file. Additionally an archive folder is included, which contains previous Simulink-files. 
The simulation can be adjusted and varied by the control panel, which is segmented into 5 areas (see below).
## Adjust Temperature and Solar Irradiance
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/3df5f0af-d536-486a-9edb-a603bff0dbcc)
## Adjust shading of windows located at the east-, north- and south-side of the building
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/827fd449-4c80-46a0-a90d-57bfe509ced7)
## Adjust the daily routine of the inhabitants
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/bb6a2cab-49d9-4ae3-a8fd-4849317fa57b)
## Activate Air conditioning
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/df1d6914-2da4-4f29-a1a0-c733bec747fc)
## Activate Air handling system
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/2989a053-5f43-4bfa-9fad-726c96f96d59)

Following Toolboxes are necessary:
- Simulink
- Simscape
- Simulink: Control Tuning Toolbox

# Demo
## Control panel overview
Select all framework conditions of the simulation:

https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/9db50f72-6082-49ff-9e37-df074bbd9b34

## Simulation of hottest day in 2023 (July 15th 2023) in Cologne, Germany.
Example demonstration of a simulation for the hottest day in 2023 in Cologne, Germany. The PI controller holds the temperatures in bedroom 1, 2 and the living room almost constant at 20 °C reference temperature. Only in short periods the temperatures increase. This is due to the de-humidifier. Because the humidity levels are too high the controller is deactived, resulting in increasing indoor temperatures, because of the higher outdoor temperatures. The humidity levels of the 3 important rooms is at 85 % at their highest limit and the CO2 levels are mostly kept under the limit of 2000 ppm.

### Legend
TEMPERATURE | HUMIDITY | CO2
--- | --- | ---
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/834cfca5-548f-4c79-8085-ed024b71739c) | ![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/fe10b743-ba65-4dee-a86c-d40133a91d24) | ![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/329e5231-bebf-40c6-bf86-602bb0de1ac6)

https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/138de5fb-c1bf-4253-9f8e-490f1ef1bf59

# Reference
Following references were used:
- https://de.mathworks.com/help/simscape/ug/house-heating-system.html
- https://de.mathworks.com/help/simscape/ug/vehicle-hvac-system.html
- https://www.matlabexpo.com/content/dam/mathworks/mathworks-dot-com/images/events/matlabexpo/de/2017/gebaude-und-anlagensimulation-mit-matlab-und-simulink-am-beispiel-des-ffg-projekts-saluh.pdf

The sources of used parameter values are included in the following doc-file:

[ParameterList.docx](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/files/13845761/ParameterList.docx)

