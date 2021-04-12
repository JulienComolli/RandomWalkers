// --------------------------------------------------------- Type 1 ---------------------------------------------------------
void initEqual() {
  int spacing = (cols/pop)/2;
  int middlerow = rows / 2;
  int middlecol = cols / 2 - ((pop/2) * spacing);
  for (int i = 0; i < rws.length; ++i) {
    int tcols = middlecol * size;
    String rwname;
    if (i < name_cpreset.length) rwname = name_cpreset[i];
    else rwname = "Unknown";
    rws[i] = new RandomWalker(i, tcols, middlerow*size, rwColors[i], rwname);
    gridCells[tcols/size][middlerow].rwId = i;
    middlecol += spacing;
    uC--;
  }
}

void initEqualPop4() {
  //print("\n Cols * Rows", cols, rows); 
  int x1 = cols / 4;
  int y1 = rows / 4;
  String rwname;
  if (0 < name_cpreset.length) rwname = name_cpreset[0];
  else rwname = "Unknown";
  rws[0] = new RandomWalker(0, x1*size, y1*size, rwColors[0], rwname);
  //print("\n", x1, y1);
  gridCells[x1][y1].rwId = 0;

  int x2 = cols / 4 * 3;
  int y2 = rows / 4;
  if (1 < name_cpreset.length) rwname = name_cpreset[1];
  else rwname = "Unknown";
  rws[1] = new RandomWalker(1, x2*size, y2*size, rwColors[1], rwname);
  //print("\n", x2, y2);
  gridCells[x2][y2].rwId = 1;

  int x3 = cols / 4;
  int y3 = (rows / 4) * 3;
  if (2 < name_cpreset.length) rwname = name_cpreset[2];
  else rwname = "Unknown";
  rws[2] = new RandomWalker(2, x3*size, y3*size, rwColors[2], rwname);
  //print("\n", x3, y3);
  gridCells[x3][y3].rwId = 2;

  int x4 =  cols / 4 * 3;
  int y4 =  (rows / 4) * 3;
  if (3 < name_cpreset.length) rwname = name_cpreset[3];
  else rwname = "Unknown";
  rws[3] = new RandomWalker(3, x4*size, y4*size, rwColors[3], rwname);
  //print("\n", x4, y4);
  gridCells[x4][y4].rwId = 3;
  uC -= 4;
}
// --------------------------------------------------------------------------------------------------------------------------
