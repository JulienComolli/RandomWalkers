
void drawHighlight(int id) {
  stroke(hS);
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      if (gridCells[i][j].rwId == id) {
        fill(rws[id].c);
        square(i*size, j*size, size);
      }
    }
  }
  if (stroke) stroke(dS);
  else noStroke();
}

void drawUnHighlight(int id) {
  if (stroke) stroke(dS);
  else noStroke();
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      if (gridCells[i][j].rwId == id) {
        fill(rws[id].c);
        square(i*size, j*size, size);
      }
    }
  }
}

void reDrawGrid() {
  background(dB);
  for (int i = 0; i < cols; ++i) {
    for (int j = 0; j < rows; ++j) {
      if (gridCells[i][j].rwId != -1) {
        fill(rws[gridCells[i][j].rwId].c);
        square(i*size, j*size, size);
      }
    }
  }
}

void fillBlanks(){
  //Fill from above
   for(int i = 0; i < cols; ++i){
     int lastSeenColor = -1;
     for(int j = 0; j < rows; ++j){
       if(gridCells[i][j].rwId != -1){
         lastSeenColor = gridCells[i][j].rwId;
       }
       if(gridCells[i][j].rwId == -1 && lastSeenColor != -1){
         uC--;
         gridCells[i][j].rwId = lastSeenColor;
         rws[lastSeenColor].score++;
       }
     }
   }
   //Fill from below
    for(int i = 0; i < cols; ++i){
     int lastSeenColor = -1;
     for(int j = rows-1; j >= 0; --j){
       if(gridCells[i][j].rwId != -1){
         lastSeenColor = gridCells[i][j].rwId;
       }
       if(gridCells[i][j].rwId == -1 && lastSeenColor != -1){
         uC--;
         gridCells[i][j].rwId = lastSeenColor;
         rws[lastSeenColor].score++;
       }

     }
   }

  reDrawGrid();
}
