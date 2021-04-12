

void drawOverlap() {
  for (int i = 0; i<spd; ++i) {
  updateHighestScore();
    for (int j = 0; j < pop; ++j) {
      rws[j].updateOverlap();
    }
  }
}

void drawNoOverlap() {

  for (int i = 0; i<spd; ++i) {
  updateHighestScore();

    for (int j = 0; j < pop; ++j) {
      rws[j].updateNoOverlap();
    }
  }
}

void drawGpOverlap() {
  for (int i = 0; i<spd; ++i) {
  updateHighestScore();
    for (int j = 0; j < pop; ++j) {
      rws[j].updateGpOverlap();
    }
  }
  if(uC <= 0) checkdead();
}


void consoleLogs() {


  print("\n\n\n");
  print("\nSpeed : ", spd, " (", spd/fR , ") FrameRate : ", frameRate, " Unvisited cells :", uC);


  // --------------------------------------- HIGHEST SCORE PRINTING ---------------------------------- //
  if (true) {
    String highestScoreName;
    if (highestScore.id < name_cpreset.length && highestScore.id != -1) highestScoreName = name_cpreset[highestScore.id];
    else highestScoreName = "Unknown";
    print("\n\n- Highest Score of this generation - \nId:", highestScore.id, ",", highestScoreName, "\nScore : ", 
      highestScore.val, ", ", (nf((parseFloat(highestScore.val) * 100) / (cols*rows), 0, 2)), "%");
  }
  // ------------------------------------------------------------------------------------------------ //


  print("\n");
  for (int i = 0; i < rws.length && i < rwsInConsole; ++i) {

    print("\n[", i+1, "] - Id:", scoresTab[i].id, ",", rws[scoresTab[i].id].name, ", Score : ", scoresTab[i].val, ", ", 
    (nf((parseFloat(scoresTab[i].val) * 100) / (cols*rows), 0, 2)), "%");
  }

  int totalScore = 0;
  for (int i = 0; i < rws.length; ++i)totalScore += rws[i].score;
  print("\n\nTotal Score", totalScore, ", ", (nf((parseFloat(totalScore) * 100) / (cols*rows), 0, 3)), "% of the grid.");
}

void updateHighestScore() {
  sortScores();
  if (scoresTab[0].val > highestScore.val) {
    highestScore.id = scoresTab[0].id;
    highestScore.val = scoresTab[0].val;
  }
}


int lastHighest = -1;
void dynHighlightFirst() {
  if (lastHighest != scoresTab[0].id) {
    reDrawGrid();
    drawHighlight(scoresTab[0].id);
    lastHighest = scoresTab[0].id;
  }
  drawHighlight(scoresTab[0].id);
}


void checkdead(){
    for(int i = 0; i < rws.length; ++i){
     if(!rws[i].dead && rws[i].score < (cols*rows) * (dieRatio / 100)){
        rws[i].name =  "[DEAD]" + rws[i].name;
        rws[i].dead = true;
     }
    }
}
