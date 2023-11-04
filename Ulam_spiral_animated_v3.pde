int spiralWidth = 600; // Width of the spiral
int numSteps; // Number of steps in the spiral
int cellSize = 2; // Size of each cell in the spiral
boolean[] isPrime; // This array will be used to keep track of prime numbers
int gridSize;
int maxNumber;
int n = 1; // Current number to be plotted
int x, y; // Current position for plotting
int dx = 0;
int dy = -cellSize;
int stepSize = 1; // Current step size
int stepsInCurrentDirection = 0;
String lastPrime = ""; // String to hold the last prime number

void settings() {
  gridSize = spiralWidth / cellSize;
  numSteps = gridSize;
  size(spiralWidth, spiralWidth);
}

void setup() {
  background(0); // Set background to black
  
  // Initialize primes up to maxNumber using the Sieve of Eratosthenes
  maxNumber = numSteps * numSteps;
  isPrime = new boolean[maxNumber + 1];
  for (int i = 2; i <= maxNumber; i++) {
    isPrime[i] = true;
  }
  for (int i = 2; i * i <= maxNumber; i++) {
    if (isPrime[i]) {
      for (int j = i * i; j <= maxNumber; j += i) {
        isPrime[j] = false;
      }
    }
  }
  
  // Initialize drawing position to the center of the canvas
  x = width / 2;
  y = height / 2;
  
  frameRate(800); // Adjust frame rate for smoother or faster animation
}

void draw() {
  if (n <= maxNumber) {
    // Map the current number to a color value for the gradient
    float colorValue = map(n, 1, maxNumber, 0, 255);
    stroke(colorValue, 255 - colorValue, 0); // Gradient color

    // Draw a point if the current number is prime
    if (isPrime[n]) {
      point(x, y);
      lastPrime = String.valueOf(n); // Update the last prime number
    }
    
    // Update position
    x += dx;
    y += dy;
    stepsInCurrentDirection++;
    
    // Change direction if needed and update stepSize
    if (stepsInCurrentDirection == stepSize) {
      stepsInCurrentDirection = 0;
      // Change direction: right, down, left, up
      if (dx == 0) {
        dx = -dy;
        dy = 0;
      } else {
        dy = dx;
        dx = 0;
      }
      // Increase the step size after a full set of steps in both directions
      if (dy == 0) {
        stepSize += cellSize;
      }
    }
    
    n++; // Move on to the next number
  } else {
    // Animation is complete, display the last prime number
    fill(255); // White color for the text
    textSize(16); // Set text size
    text("Last Prime: " + lastPrime, 10, height - 10); // Position the text at the bottom left
    noLoop(); // Stop the draw loop
  }
}
