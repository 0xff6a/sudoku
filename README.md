Sudoku Solver
=============
[![Code Climate](https://codeclimate.com/github/foxjerem/sudoku/badges/gpa.svg)](https://codeclimate.com/github/foxjerem/sudoku) [![Test Coverage](https://codeclimate.com/github/foxjerem/sudoku/badges/coverage.svg)](https://codeclimate.com/github/foxjerem/sudoku)

Command line sudoku solver that uses recursion to solve any sudoku (even a blank one)

Ruby Version
------------
Ruby 2.1.2

Classes:
-------
- Cell: holds neighbour cell and candidate values, can solve itself
- Grid: manages the collection of cells
- Puzzle: solves sudoku puzzle given an input string

Workings:
---------
- Cell are initialised as empty
- Grid creates associations between each cell and its neighbours on initialisation
- Cell holds a list of candidate values derived from its neighbours' values
- When the candidate list holds only a single variable, the cell is solved and adopts this as its value
- Simple sudoku are solved by iteratively calling the solve method on each cell until they are all solved
- Harder sudokus cannot be completed using this approach
- Solving these required implementing a recursive algorithm that guesses a value for a blank cell from its candidates and then attempts to solve the puzzle. This process is repeated until a solution is found


Running the application
-----------------------
```shell
$ bundle
$ ruby run.rb 800000000003600000070090200050007000000045700000100030001000068008500010090000400
```
**Sample Output    
```shell
Processing.....    

[8, 1, 2, 7, 5, 3, 6, 4, 9]
[9, 4, 3, 6, 8, 2, 1, 7, 5]
[6, 7, 5, 4, 9, 1, 2, 8, 3]
[1, 5, 4, 2, 3, 7, 8, 9, 6]
[3, 6, 9, 8, 4, 5, 7, 2, 1]
[2, 8, 7, 1, 6, 9, 5, 3, 4]
[5, 2, 1, 9, 7, 4, 3, 6, 8]
[4, 3, 8, 5, 2, 6, 9, 1, 7]
[7, 9, 6, 3, 1, 8, 4, 5, 2]
```

Running the test suite
----------------------
```shell
$ bundle
$ rspec
```
