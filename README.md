# sieve-of-eratosthenes
graphical display of the sieve of Eratosthenes, an ancient but effective method to find primes

<img src="https://github.com/nickmmark/sieve-of-eratosthenes/blob/main/Sieve_64000.gif">
Graphical display highlighting the primes in the first n=64,000 numbers

## Context
I'm hardly a mathematician but it's obvious to even me that there is something mysterious and wonderful about prime numbers. One elegant way to see this for yourself is using an ancient technique called the Sieve of Eratosthenes. It is named for the 3rd century BCE mathematician, Eratosthenes of Cyrene (Greek: Ἐρατοσθένης) (276-195/194 BCE).

The [approach is fairly simple](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes):
1. Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
2. Initially, let p equal 2, the smallest prime number.
3. Enumerate the multiples of p by counting in increments of p from 2p to n, and mark them in the list (these will be 2p, 3p, 4p, ...; the p itself should not be marked).
4. Find the smallest number in the list greater than p that is not marked. If there was no such number, stop. Otherwise, let p now equal this new number (which is the next prime), and repeat from step 3.
5. When the algorithm terminates, the numbers remaining not marked in the list are all the primes below n.

We can see how it works for the first n=400 numbers
<img src="https://github.com/nickmmark/sieve-of-eratosthenes/blob/main/Sieve_400.gif">

Interesting patterns start to emerge with a larger n=10000
<img src ="https://github.com/nickmmark/sieve-of-eratosthenes/blob/main/Sieve_10000.gif">

And really interesting at n=64000; note the recurring patterns and the presence of [twin primes](https://en.wikipedia.org/wiki/Twin_prime)
<img src="https://github.com/nickmmark/sieve-of-eratosthenes/blob/main/Sieve_64000.gif">


## Some notes
The Sieve of Eratosthenes is a simple and elegant way to *understand* the distribution of primes, but it's not a great way to *find* the primes! The Time Complexity of this algorithm is O(n log log n), which is pretty bad. It's memory management is even worse as it has to keep the entire array in memory and search through it for every operation. Thus this version in Processing may look pretty but it's far from efficient. It also tends to break if you set n above 64,000.

## The Code
```
int n = 400; // Define the range of numbers to check for primes
boolean[] isPrime; // This array will be used to keep track of prime numbers
int currentNumber = 2; // This will keep track of the current number being evaluated
int gridSize;
boolean done = false; // Flag to indicate when the sieve is complete

void setup() {
  size(800, 800); // Size of the window
  gridSize = width / int(sqrt(n)); // Size of each grid cell
  
  // Initialize boolean array, default values are false
  isPrime = new boolean[n+1];
  for (int i = 2; i <= n; i++) {
    isPrime[i] = true; // Assume all numbers are prime initially
  }
  
  frameRate(3); // Control the speed of the animation (10 frames per second)
  background(0); // Set background to BLACK
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
        fill(0, 255, 0); // GREEN for prime numbers
      } else {
        fill(0, 0, 255); // BLUE for non-prime numbers
      }
      rect(x, y, gridSize, gridSize); // Draw the rectangle for the grid cell
      fill(0); // Black for text
      text(i, x + 3, y + gridSize - 3); // Place the number in the cell
    }
  }
}
```
