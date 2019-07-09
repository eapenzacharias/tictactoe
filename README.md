
# Project: Object Oriented Programming

  

This builds a Tic Tac Toe game as a project of the Main Ruby curriculum at [Microverse](https://www.microverse.org/) - @microverseinc

* The goal was learn about main concepts of Object Oriented Programming.

* The project was completed using ruby.

  

#### [Assignment link](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)

  

#### [Live version]()

  

#### How to use

  

You can run the game by running this command inside the bin folder:

`$ ruby main.rb`

This is the game board:
~~~~
-------------
| 1 | 2 | 3 |
|---+---+---|
| 4 | 5 | 6 |
|---+---+---|
| 7 | 8 | 9 |
-------------
~~~~
  
  You can choose an available tile by entering the number
  
`$ 5`

Will result in:
~~~~
-------------
| 1 | 2 | 3 |
|---+---+---|
| 4 | x | 6 |
|---+---+---|
| 7 | 8 | 9 |
-------------
~~~~

If the tile you choose is not available, or if your input is not valid you will be asked to enter a valid tile.

`$ x`
~~~~Please enter a valid tile~~~~

The game will not countinue until you choose a valid tile.

If complete a row, a column or a diagonal you win the game, and will prompt:
~~~~
*************************************************
**************** CONGRATULATIONS ****************
*************************************************
**************** x Player Wins! *****************
*************************************************
~~~~

If neither of the players win, it will prompt: 
~~~~
*************************************************
****************    GAME OVER    ****************
*************************************************
****************  It's a Draw!  *****************
*************************************************
~~~~

Once the game is finished you will be asked if you want to keep playing:
~~~~
Do you wanna keep playing? y/n
~~~~

If you enter `$ y`  or  `$ Y` the game will start over again if you give any other input the game will prompt:
`Bye bye`

And finish the execution.

In case you want to exit type `ctrl + c` and it will finish the execution
#### Authors

*  [@codingAngarita](https://github.com/codingAngarita)

*  [@eapenzacharias](https://github.com/eapenzacharias)
