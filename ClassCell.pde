class Cell{
  public boolean isOccupied; 
  public int rwId;
  public int generation;
  
  Cell(){
    this.generation = 0;
    this.rwId = -1;
    this.isOccupied = false;
  }
}
