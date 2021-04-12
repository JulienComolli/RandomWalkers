class RandomWalker {

  public int x;
  public int y;
  public int id;
  public color c;
  public int score;
  public String name;
  public boolean dead;

  RandomWalker(int id, int x, int y, color c, String name) {
    this.x = x;
    this.y = y;
    this.id = id;
    this.c = c;
    this.score = 1;
    this.name = name;
    this.dead = false;
  }


  void updateOverlap() {
    if (this.dead) return;

    fill(c);
    square(this.x, this.y, size);
    int r = floor(random(0, 4));

    if ( r==0 && this.x < (cols-1) * size) { 
      this.x+=size;
    }
    if ( r==1 && this.x > 0) { 
      this.x-=size;
    }
    if ( r==2 && this.y < (rows-1) * size) { 
      this.y+=size;
    }
    if ( r==3 && this.y > 0) { 
      this.y-=size;
    }

    int sx = this.x/size;
    int sy = this.y/size;

    if (gridCells[sx][sy].rwId == -1) {
      uC--;
      gridCells[sx][sy].rwId = this.id;
      this.score++;
    } else {
      if (gridCells[sx][sy].rwId != this.id) {
        rws[gridCells[sx][sy].rwId].score--;
        gridCells[sx][sy].rwId = this.id;
        this.score++;
      }
    };

    if (drawhead) {
      fill(255);
      square(this.x, this.y, size);
    }
  }



  void updateNoOverlap() {
    if (this.dead) return;

    fill(c);
    square(this.x, this.y, size);
    int r = floor(random(0, 4));

    int sx = this.x/size;
    int sy = this.y/size;

    if ( r==0 && this.x < (cols-1) * size && (gridCells[(this.x+size)/size][sy].rwId == -1 || gridCells[(this.x+size)/size][sy].rwId == this.id)) { 
      this.x+=size;
    }
    if ( r==1 && this.x > 0 && (gridCells[(this.x-size)/size][sy].rwId == -1 || gridCells[(this.x-size)/size][sy].rwId == this.id)) { 
      this.x-=size;
    }
    if ( r==2 && this.y < (rows-1) * size && (gridCells[sx][(this.y+size)/size].rwId == -1 || gridCells[sx][(this.y+size)/size].rwId == this.id)) { 
      this.y+=size;
    }
    if ( r==3 && this.y > 0 && (gridCells[sx][(this.y-size)/size].rwId == -1 || gridCells[sx][(this.y-size)/size].rwId ==  this.id)) { 
      this.y-=size;
    }


    if (gridCells[sx][sy].rwId == -1) {
      uC--;
      gridCells[sx][sy].rwId = this.id;
      this.score++;
    } else {
      if (gridCells[sx][sy].rwId != this.id) {

        rws[gridCells[sx][sy].rwId].score--;
        gridCells[sx][sy].rwId = this.id;
        this.score++;
      }
    };


    if (drawhead) {
      fill(255);
      square(this.x, this.y, size);
    }
  }


  void updateGpOverlap() {
    if (this.dead) return;

    fill(c);
    int sx = this.x/size;
    int sy = this.y/size;
    if (showLockedCells && gridCells[sx][sy].generation > genPersistanceNb && this.checkIfNeighboor()) {
      stroke(dS);
    }
    square(this.x, this.y, size);
    
    if (stroke) stroke(dS);
    else noStroke();
    
    int r = floor(random(0, 4));


    //print("\n", gridCells[sx + 1][sy].generation );
    if ( r==0 && this.x < (cols-1) * size) {

      if (gridCells[sx + 1][sy].rwId != this.id) {
        if (gridCells[sx + 1][sy].generation < genPersistanceNb) {
          this.x+= size;
        } else {
          if (challengeLockedCells && challengeLockedCell(this.score, rws[gridCells[sx + 1][sy].rwId].score)) {
            gridCells[sx+1][sy].generation = genPersistanceNb+1;
            this.x+=size;
          }
        }
      } else {
        this.x+= size;
      }
    }
    if ( r==1 && this.x > 0) {

      if (gridCells[sx - 1][sy].rwId != this.id) {
        if (gridCells[sx - 1][sy].generation < genPersistanceNb) {
          this.x-=size;
        } else {
          if (challengeLockedCells && challengeLockedCell(this.score, rws[gridCells[sx - 1][sy].rwId].score)) {
            gridCells[sx-1][sy].generation = genPersistanceNb+1;
            this.x-=size;
          }
        }
      } else {
        this.x-=size;
      }
    }
    if ( r==2 && this.y < (rows-1) * size) { 

      if (gridCells[sx][sy + 1].rwId != this.id) {
        if (gridCells[sx][sy + 1].generation < genPersistanceNb) {
          this.y+=size;
        } else {
          if (challengeLockedCells && challengeLockedCell(this.score, rws[gridCells[sx][sy + 1].rwId].score)) {
            gridCells[sx][sy + 1].generation = genPersistanceNb+1;
            this.y+=size;
          }
        }
      } else {
        this.y+=size;
      }
    }
    if ( r==3 && this.y > 0) { 

      if (gridCells[sx][sy - 1].rwId != this.id) {
        if (gridCells[sx][sy - 1].generation < genPersistanceNb) {
          this.y-=size;
        } else {
          if (challengeLockedCells && challengeLockedCell(this.score, rws[gridCells[sx][sy - 1].rwId].score)) {
            gridCells[sx][sy - 1].generation = genPersistanceNb+1;
            this.y-=size;
          }
        }
      } else {
        this.y-=size;
      }
    }



    if (gridCells[sx][sy].rwId == -1) {
      uC--;
      gridCells[sx][sy].rwId = this.id;
      gridCells[sx][sy].generation = 1;
      this.score++;
    } else {
      if (gridCells[sx][sy].rwId != this.id) {
        rws[gridCells[sx][sy].rwId].score--;
        gridCells[sx][sy].rwId = this.id;
        gridCells[sx][sy].generation = 1;
        this.score++;
      } else {
        if (genLockOnlyNeighboor) {
          if (checkIfNeighboor()) gridCells[sx][sy].generation++;
        } else gridCells[sx][sy].generation++;
      }
    };

    if (drawhead) {
      fill(255);
      square(this.x, this.y, size);
    }
  }

  boolean checkIfNeighboor() {
    int sx = this.x/size;
    int sy = this.y/size;

    if (this.x < (cols-1) * size && gridCells[sx + 1][sy].rwId != this.id) return true;
    if (this.x >0 && gridCells[sx - 1][sy].rwId != this.id) return true;

    if (this.y < (rows-1) * size && gridCells[sx][sy + 1].rwId != this.id) return true;
    if (this.y > 0 && gridCells[sx][sy - 1].rwId != this.id) return true;

    return false;
  }

  boolean challengeLockedCell(int eater, int eaten) {

    if (eaten * 3 < eater) {
      int rdm = floor(random(0, 4));
      if (rdm == 1) return true;
      return false;
    }
    
    if (eater > eaten) {
      int rdm = floor(random(0, bigEaterProb+1));
      if (rdm == 1) return true;
    } else {
      int rdm = floor(random(0, smallEaterProb+1));
      if (rdm == 1) return true;
    }

    return false;
  }
}
