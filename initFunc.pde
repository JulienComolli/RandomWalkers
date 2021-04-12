void gridInitCell() {
  gridCells = new Cell[cols][rows];
  uC = cols*rows;
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      gridCells[i][j] = new Cell();
    }
  }
}

void colorsInit(color[] cpr, int[] rgb) {
  rwColors = new color[pop];

  for (int i = 0; i < pop; ++i) {
    if (i < cpr.length) {
      rwColors[i] = cpr[i];
    } else {
      rwColors[i] = color(random(rgb[0], rgb[1]), 
        random(rgb[2], rgb[3]), 
        random(rgb[4], rgb[5]));
    }
  }
}

void rwsInit() {
  rws = new RandomWalker[pop];

  if (spawnType == 0) {
    for (int i = 0; i < rws.length; ++i) {

      while (true) {
        int tcols = floor(random(0, cols));
        int trows = floor(random(0, rows));
        int x = tcols * size;
        int y = trows * size;
        if (gridCells[tcols][trows].rwId == -1) {
          String rwname;
          if (i < name_cpreset.length) rwname = name_cpreset[i];
          else rwname = "(" + str(parseInt(red(rwColors[i]))) + ","+ str(parseInt(green(rwColors[i]))) + ","+ str(parseInt(blue(rwColors[i]))) + ")";
          rws[i] = new RandomWalker(i, x, y, rwColors[i], rwname);
          gridCells[tcols][trows].rwId = i;
          uC--;
          break;
        }
      }
    }
  } else if (spawnType == 1) {

    if (pop != 4) initEqual();
    else initEqualPop4();
  } else if (spawnType == 2) {
  }
}


void initScoresTab() {
  highestScore.val = 0;
  highestScore.id = 0;

  scoresTab = new Scores[rws.length];
  for (int i = 0; i < rws.length; ++i) {
    scoresTab[i] = new Scores();
  }
}
