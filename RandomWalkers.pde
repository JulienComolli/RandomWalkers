/*

 P : pause the simulation.
 R : reset the simulation (do not reset the params modified with controls keys).
 
 
 O : activate or desactivate overlaping (RW walking on each other colors).
 
 Arrow UP : Increase the speed slowly.
 Arrow DOWN : Decreaste the speed slowly.
 Arrow LEFT : Increase the speed drastically.
 Arrow RIGHT : Set the speed to 1.
 
 T : Switch the Stroke option.
 
 
 S : (Un)pause the game, (Un)highlight the RW color with the largest territory.
 
 E : (De)activate the dynamic highlighting of the RW with the largest territory.
 
 F : Fill the blanks of the global territory.
 
 
 
 */

void setup() {

  // -------------------------------------------------------------- OPTIONS -------------------------------------------------------------- //

  /* !!! SEE README TO !!! */

  //---- Basic options
  pop = 8; 
  size = 5;
  spd = 10; 
  fR = 60;


  //---- Miscealanous

  console = true;
  showWinnerIfGridCompleted = false;


  //---- Behaviour
  canDie = true;
  dieRatio = (1.0/pop*100.0) / 2;
  overlap = true;
  drawhead = true;
  spawnType = 1;

  //---- GEN PERSITANCE
  genPersistanceMode = true; // Lock cells if it's visited more than [genPersistanceNb] times by the same RW.

  genPersistanceNb = 1; //Number of time the RW need to visit a cells to "lock it".
  showLockedCells = true; //Highlight the locked cells

  challengeLockedCells = true; //If a RW encounting a locked cells can try to eat it.
  //If prob set to "10", the eater will have 1/10 to eat the locked cell.
  bigEaterProb = 1; //If the eater is bigger than the eaten.
  smallEaterProb = 2; //If the eater is smaller than the eaten.

  genLockOnlyNeighboor = true;

  //---- Color presets (CHECK rwsPresets.pde)

  dB = color(69);
  dS = color(10);
  hS = color(220);

  /*[Cpreset] is the color presets of the RWS. If there is 4 colors in the presets the first 4 rws
   will get respectively each colors. And the other will follow the [rgbp].
   [Name] is important to recognize the colors in the console log if you want to keep track
   of the percentage.
   [rgbp] is the pattern of rgb used to generate randomly unspecified colors.*/

  cpreset = eight_colors; 
  name_cpreset = eight_colors_names; 
  rgbp = classic;
  cpIsPop = false;   //The population of RW is equal to the number of colors in the chosen preset

  //---- SIZE

  size(1400, 700);
  //fullScreen();

  // ------------------------------------------------------------ END OF OPTIONS ------------------------------------------------------------ //


  // --- Options Variables --- //
  if (cpIsPop && cpreset.length > 0) pop = cpreset.length;

  if (size < 3) stroke = false;

  if (stroke) stroke(dS);
  else noStroke();

  if (console) graphics+= 1;

  // --- Init the grid --- //
  cols = width / size;
  rows = height / size;
  gridInitCell();

  uC =cols * rows;
  print("\nCells : ", uC);

  // --- Init the colors --- //
  colorsInit(cpreset, rgbp);


  // --- Init the RW --- //
  rwsInit();
  rwsInConsole = rws.length;
  // --- Init the scores --- //
  initScoresTab();

  pause = false;
  background(dB);
  frameRate(fR);
}


void draw() {
  if (!pause) {
    if (overlap) {
      if (!genPersistanceMode) drawOverlap();
      else {
        drawGpOverlap();
      }
    } else drawNoOverlap();
  }

  if (highlightFirst) dynHighlightFirst();

  if (graphics > 0) {
    if (console) consoleLogs();
    if (showWinnerIfGridCompleted && uC <= 0) freezeAndShowFirst();
  }
}



//Global Options
int pop;  //Nb of Rw
//If true the population of RW is equal to the number of colors in the chosen preset
boolean cpIsPop;
boolean overlap;
boolean drawhead;

boolean genPersistanceMode = true;
int genPersistanceNb = 10;

int size;
int spd;

int cols, rows, uC; //uC = unvistedCells
Cell[][] gridCells;


color[] rwColors; //Array of color used when initializing RW
color[] cpreset;
String[] name_cpreset;
int[] rgbp;




int lastMove = -1; //0 = countFirst;
int fR = 60;

// Options
boolean pause = false;
boolean canDie = true;
float dieRatio = 30;
boolean highlightFirst = false;
boolean stroke = false;
boolean console = true;
int rwsInConsole = 6;
boolean showWinnerIfGridCompleted = false;
boolean showLockedCells = false;
boolean challengeLockedCells = false;
boolean genLockOnlyNeighboor = false;
int bigEaterProb = 10;
int smallEaterProb = 80;
int spawnType; // 0 = random / 1 = "equal distance" (real equal distance work only for 4 rw) / 2 = same spot


// Graphics
color dB = color(69);  //default background
color dS = color(10);  //default stroker color
color glS = color(55, 220, 69);
color hS = color(220); //highlighted stroke 1
color hS2 = color(150); //highlighted stroke 2
int graphics = 0; //to keep track of the graphics to show

RandomWalker[] rws; // RandomWalkers array
Scores[] scoresTab; // RW's scores
Scores highestScore = new Scores();
