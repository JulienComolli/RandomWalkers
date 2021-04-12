class Scores {
  public int id;
  public int val;

  Scores() {}
  
}

void sortScores() {

  for (int i = 0; i < rws.length; ++i) {
    scoresTab[i].val = rws[i].score;
    scoresTab[i].id = rws[i].id;
  }

  for (int i = 0; i < rws.length; ++i) {
    int max = i;
    for (int j = i; j < rws.length; ++j) {
      if (scoresTab[max].val < scoresTab[j].val) max = j;
    }
    
    Scores tmpSc = scoresTab[i];
    scoresTab[i] = scoresTab[max];
    scoresTab[max] = tmpSc;
  }
}
