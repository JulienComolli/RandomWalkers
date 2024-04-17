
  

# Processing RandomWalkers

  

Hello I'm Julien and I made this project because I was inspired by the work of **Daniel Shiffman** : the coding challenge **[52](https://youtu.be/l__fEY1xanY)** about the *random walker*.

  

I decided to push a bit further the concept and set up an environnement where mutliple random walkers can interact with each other. I added some options to play with.

  

- [**Project**](#project)

- [**Options**](#options)

- [**Controls**](#controls)

- [**Install**](#install)

- [**Video**](#video)

  

<a  name="project"/></a>

  

## Project

  

*From now on I'll use **RW** to say random walkers.*

  

In 2D a random walker is an entity that take a steps randomly in 4 different direction, up, down, left and right.

  

The environment is a grid of cells. Each cell can either be empty (unvisited) or colored (visited). The grid is considered **completed** when all the cells are visited, it can takes a lot of steps.

  

<a  name="options"/></a>

  

## Options

  

### Basic options

  

- **Pop**  *(int)*: number of RW.

  

- **Size**  *(int)*: size in pixel of the cells.

  

- **Speed**  *(int)*: number of movement made by the RW *each frame*.

  

- **fR**  *(int)*: framerate of the simulation.

  

### Miscelanous

  
  

- **Console**  *(boolean)*: Output stats in the processing console, very useful to see what is happning if there is many RW.

  

- **showWinnerIfGridCompleted**  *(boolean)*: Automatically pause the game when the grid is completed and highlight the RW with the most cells.

  

### Behaviour

  

- **Overlap**  *(boolean)* : RW can walk over colored cells.

  

- **Drawhead**  *(boolean)*: If true, you can see the *head* of the RW : a white square.

  

- **SpawnType**  *(int)*:

	- **0** : Random spawn.

	- **1** : Try to make the RW spawn at an equal distance of each other and walls. It works only for a population of 4 at the moment. For an other number of RW it will just make them spawn in the center.

  

- **canDie**  *(boolean)* : Define if a RW can die if his territory is under the *dieRatio*.

- **dieRatio**  *(float)* : Percentage of the grid the RW need to have to stay alive.

  

### Gen persistance mode

  

This mode add the mecanic to *lock* cell. A cell become locked when a RW visit his cell **genPersistanceNb** times. If **challengeLockedCells** is set to true it is possible for another RW to *conquer* a locked cell, it needs to challenge it.

  

**genPersistanceMode**  *(boolean)* : Set to true to activate the mode.

  

**genPersistanceNb**  *(int)* : Number of time the RW need to visit a cells to "lock it".

  

**showLockedCells**  *(boolean)* : To highlights locked cells.

  

**challengeLockedCells**  *(boolean)* : If a RW encounter a locked cell he can try to conquer it.

  

*If prob set to "10", the eater will have 1/10 to eat the locked cell.*

  

*If the bigEaterProb is inferior to the smallEaterProb each RW will tend to have an equal territory*

  
  

**bigEaterProb**  *(int)* : If the eater is bigger than the eaten.

  

**smallEaterProb**  *(int)* : If the eater is smaller than the eaten.

  
  

**genLockOnlyNeighboor**  *(boolean)* : If true, the RW can lock a cell only if it's endangered : there is cells of an other RW around it. With this option only the cells at the border of the RW's territory.

  
  

### Color / Name presets

  

Check the processing **[color Reference](https://processing.org/reference/color_.html)**.

  

- **dB**  *(processing color)* : Color of the background.

- **dS**  *(processing color)* : Color of the default stroke color.

- **hS**  *(processing color)* : Color of the highlighted territory.

  
  

#### The color presets of the random walkers

  
  

The **rwsPresets.pde** file contains different presets to color and name the RW present in the simulation. The color is used to draw the territory of the RW and the name is used to recognize the RW in the console stats or win screen.

  

In the default **color** array *eight_colors* each color correspond to a name in the **name** array *eight_colors_names*. Each color correspond respectively to the names of the chosen array.*The first color of the color array correspond to the first name of the names array*.

  

If there is **no more color** in the color array to use for a RW *(when there is a population superior to the number of colors)* the program will generate a color based on the **rgbp**  *(read below)*.

  

If there is **no more name** in the name array it will simply set the RW's name to *Unknown*.

  
  

- **cpreset**  *(variable)* : Name of the array of colors presets.

- **name_cpreset**  *(variable)* : Name of the array of names presets.

- **rgbp**  *(variable)* : The pattern of rgb used to generate randomly unspecified **rgb** colors.

  

*Eg : {0, 255, 50, 120, 240, 240}, mean that all unspecified RW colors will be generated like this :*

- *Red get a random value between 0 and 255*

- *Green get a random value between 50 and 120*

- *Blue get the value of 240*

  

If you want to only use random colors following the **rgbp** patern set the **cpreset** to *none* and **cpIsPop** to *false*.

  

**cpIsPop**  *(boolean)* : If true, the population is equal to the number of colors in cpreset.

  

### Size

  

- **size** option : *(width, height)* in pixel.

  

If you want to go **fullScreen**, uncommente the line `fullScreen()` and comment by putting `//` in front ot the `size(...)` line.

  

<a  name="controls"/></a>

  

## Controls

  

- **P** : pause the simulation.

- **R** : reset the simulation (do not reset the params modified with controls keys).

  

- **O** : Activate/Deactivate overlaping.

  

- **Arrow UP** : Increase the speed slowly.

- **Arrow DOWN** : Decrease the speed slowly.

- **Arrow LEFT** : Increase the speed drastically.

- **Arrow RIGHT** : Set the speed to 1.

  

- **T** : Switch the stroke options : display the grid.

- **Y** : Activate/Deactivate the drawing of the RWs *heads*.

- **D** : Activate/Deactivate the highlighting of the locked cells.
  

- **S** : Pause/Unpause the game and highlight the RW color with the largest territory.

- **E** : Activate/Deactivate the dynamic highlighting of the largest territory, can be laggy.

- **F** : Fill the blanks of all the territories.

  
  

- **Numpad 0** : Set the spawntype to 0 for the next reset.

- **Numpad 1** : Set the spawntype to 1 for the next reset.

  

<a  name="install"/></a>

  

## How to use

  

### Prerequisites

  

In order to execute this program you must have Processing 3+ installed on your computer. Check [here](https://processing.org/download/) to download and install the right version for your system.

  

### Start

  

Download or clone the repository. Check that all the **.pde** files are in a folder named `RandomWalkers` and simply launch any **.pde** file using processing. If there is an error try to execute **RandomWalkers.pde**. Try also renaming the extracted folder `RandomWalkers`.

  

*On window double clicking on a **.pde** and using [Processing](https://processing.org) to execute it should work*

  
  

<a  name="video"/></a>

  

## Video :

  

[Coming soon]().
