# Solution to MATLAB and Simulink Challenge project <195> <'Control, Modeling, Design, and Simulation of Modern HVAC Systems'>
This is a template repo for Excellence in Innovation project solutions.

Please add the following items:

[Program link](https://github.com/mathworks/MATLAB-Simulink-Challenge-Project-Hub/blob/main/megatrends/Sustainability%20and%20Renewable%20Energy.md)

[Project description link](https://github.com/mathworks/MATLAB-Simulink-Challenge-Project-Hub/tree/main/projects/Control%2C%20Modeling%2C%20Design%2C%20and%20Simulation%20of%20Modern%20HVAC%20Systems)


# Project details
To accomplish the task of adequately control, model, design and simulate a modern HVAC system multiple iteration stages were passed through. First a simple one-room thermal Simscape model was developed. Later moist are properties were included. For the final stage a 4-room apartment was developed (see below).\n
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/4080298f-c592-4082-a85b-f2e8a6c6df30)
The measurements can be taken from below drawing:\n
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/0d0642fd-6c61-491b-8399-3e0bf29cdcda)

The apartment imitates a typical german 4-floor apartment block. It has an area of 108.8 m including a balcony. The apartment is inhabitant by a family of 4: 2 children and 2 adults. Bedroom 1 belongs to the children and bedroom 2 to the adults. Only the two bedrooms and the living room is air-conditioned. Additionaly an air-handling unit is included and the map of the air flow can be taken from the image below.
![image](https://github.com/skaraogl/-Sustainability-and-Renewable-Energy-Challenge/assets/154832924/7935ce11-48a4-4215-bc2c-d59cc7a1926e)

Fresh and new air gets introduced from bedroom 1, 2 and the living room and gets blown out from the bathroom and the kitchen. For a more realistic simulation an average weekday routine of all inhabitants is implemented (further informations are in the model). Furthermore the effects of solar radiation can be switched and off in the simulation. 

# How to run section
To latest version of model is implemented in the Simulink-file named "Task_No6.slx" located in the main directory. To properly run the model the parameter-file "PARAMETERS.m" is needed. To manually run the parameter-file is not needed, because it gets automoticaly initialised by the Simulink-file. Additionaly an archive folder is included, which contains previous Simulink-files. 
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


# Demo
Add a video or animated gif/picture to showcase the code in operation.
  
# Reference
Add reference papers, data, or supporting material that has been used, if any.
