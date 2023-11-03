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

