void keyPressed() {
  if (keyCode == 'P') pausing();

  if (keyCode == 'O') overlap = !overlap;
  if (keyCode == 'R') reset();

  if (keyCode == UP) increaseSpeed();
  if (keyCode == DOWN) deacreaseSpeed();

  if (keyCode == LEFT) spd = 1;
  if (keyCode == RIGHT) spd += 100;

  if (keyCode == 'T') updateStroke();

  if (keyCode == '0') spawnType = 0;
  if (keyCode == '1') spawnType = 1;

  if (keyCode == 'S') freezeAndShowFirst();
  
  if(keyCode == 'Y') drawhead = !drawhead;

  if (keyCode == 'E') controlHighlightFirst();
  
  if(keyCode == 'F') fillBlanks();
}




void reset() {
  background(dB);
  lastMove = -1;
  gridInitCell();
  pause = false;
  //colorsInit(cpreset, rgbp);
  rwsInit();
  initScoresTab();
}

void pausing() {
  if (lastMove == 0) drawUnHighlight(scoresTab[0].id);
  pause = !pause;
  lastMove = -1; //reset lastMove
}

void freezeAndShowFirst() {
  if (lastMove == 0) {
    drawUnHighlight(scoresTab[0].id);
    reDrawGrid();

    lastMove = -1;
    pause = !pause;
    if (stroke) stroke(dS);
    else noStroke();
  } else {
    reDrawGrid();

    lastMove = 0;
    pause = true;
    sortScores();
    drawHighlight(scoresTab[0].id);

    int winSize = size*25;
    if (true) winSize = 100;
    stroke(255);
    fill(rws[scoresTab[0].id].c);
    square(width/2-(winSize/2), height/2-(winSize/2), winSize);
    fill(255);
    strokeWeight(1);
    textSize(20);
    int textWidth = 100;
    int textHeight = 180;
    textAlign(CENTER, CENTER);

    text(str(rws[scoresTab[0].id].score) + "\n" + (nf((parseFloat(rws[scoresTab[0].id].score ) * 100) / (cols*rows), 0, 2))
      + "%\n" + rws[scoresTab[0].id].name, width/2-(textWidth/2), height/2-(textHeight/2), textWidth, textHeight);
    if (stroke) stroke(dS);
    else noStroke();
  }
}

void increaseSpeed() {
  if (spd < 10) spd+=1;
  else spd+=5;
}
void deacreaseSpeed() {
  if (spd == 1) return;
  if (spd <= 10) spd-=1;
  else spd-=10;
}

void updateStroke() {
  if (stroke) stroke(dS);
  else noStroke();
  stroke = !stroke;
  if (stroke) stroke(dS);
  else noStroke();
}

void controlHighlightFirst(){
      lastHighest = -1;
    if (highlightFirst) { 
      reDrawGrid(); 
      drawUnHighlight(scoresTab[0].id);
    }
    highlightFirst = !highlightFirst;
}
