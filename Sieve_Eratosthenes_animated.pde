int n = 1600; // Define the range of numbers to check for primes
boolean[] isPrime; // This array will be used to keep track of prime numbers
int currentNumber = 2; // This will keep track of the current number being evaluated
int gridSize;
boolean done = false; // Flag to indicate when the sieve is complete

void setup() {
  size(400, 400); // Size of the window
  gridSize = width / int(sqrt(n)); // Size of each grid cell
  
  // Initialize boolean array, default values are false
  isPrime = new boolean[n+1];
  for (int i = 2; i <= n; i++) {
    isPrime[i] = true; // Assume all numbers are prime initially
  }
  
  frameRate(10); // Control the speed of the animation (10 frames per second)
  background(255); // Set background to white
  textSize(gridSize / 3);
  fill(0); // Black for text
}

void draw() {
  if (!done) {
    if (currentNumber * currentNumber <= n) {
      if (isPrime[currentNumber]) {
        for (int j = currentNumber * currentNumber; j <= n; j += currentNumber) {
          isPrime[j] = false; // Mark multiples of currentNumber as non-prime
        }
      }
      currentNumber++;
    } else {
      done = true;
    }

    // Redraw the grid with the updated prime information
    for (int i = 2; i <= n; i++) {
      int col = (i - 1) % int(sqrt(n));
      int row = (i - 1) / int(sqrt(n));
      int x = col * gridSize;
      int y = row * gridSize;
      
      if (isPrime[i]) {
        fill(0, 255, 0); // Green for prime numbers
      } else {
        fill(255, 0, 0); // Red for non-prime numbers
      }
      rect(x, y, gridSize, gridSize); // Draw the rectangle for the grid cell
      fill(0); // Black for text
      text(i, x + 3, y + gridSize - 3); // Place the number in the cell
    }
  }
}
