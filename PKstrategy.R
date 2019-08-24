
# Puzzler ridder source: https://fivethirtyeight.com/features/whats-the-optimal-way-to-play-horse/

library(lpSolve)
library(lpSolveAPI)

# Methodology from:
# https://vanderbei.princeton.edu/542/lectures/lec8.pdf
# https://optimization.mccormick.northwestern.edu/index.php/Matrix_game_(LP_for_game_theory)

# Goalie
saveOpt <- make.lp( 0, 7 )
set.objfn( saveOpt, c( rep(0,6), 1 ) )
lp.control(saveOpt, sense='max')
add.constraint( saveOpt, c( 0, rep(-.7,5), 1 ), "<=", 0 )
add.constraint( saveOpt, c( -.9, 0, rep(-.9,4), 1 ), "<=", 0 )
add.constraint( saveOpt, c( rep(-.8,2), 0, rep(-.8,3), 1 ), "<=", 0 )
add.constraint( saveOpt, c( rep(-.8,3), 0, rep(-.8,2), 1 ), "<=", 0 )
add.constraint( saveOpt, c( rep(-1,4), 0, rep(-1,1), 1 ), "<=", 0 )
add.constraint( saveOpt, c( rep(-.9,5), 0, 1 ), "<=", 0 )
add.constraint( saveOpt, c( rep(1,6), 0), "=", 1 )


# View
write.lp(saveOpt, filename="C:/Users/DTRManning/Documents/R/Puzzlers/2019_07_12/Soccer/view.txt")

# Solve
solve( saveOpt )
get.objective( saveOpt )
get.variables( saveOpt )
get.constraints( saveOpt )

# Shooter
saveOpt <- make.lp( 0, 7 )
set.objfn( saveOpt, c( rep(0,6), -1 ) )
lp.control(saveOpt, sense='min')
add.constraint( saveOpt, c( .9, 1, .8, .8, .9, 0, -1 ), ">=", 0 )
add.constraint( saveOpt, c( .9, 1, .8, .8, 0, .7, -1 ), ">=", 0 )
add.constraint( saveOpt, c( .9, 1, .8, 0, .9, .7, -1 ), ">=", 0 )
add.constraint( saveOpt, c( .9, 1, 0, .8, .9, .7, -1 ), ">=", 0 )
add.constraint( saveOpt, c( .9, 0, .8, .8, .9, .7, -1 ), ">=", 0 )
add.constraint( saveOpt, c( 0, 1, .8, .8, .9, .7, -1 ), ">=", 0 )
add.constraint( saveOpt, c( rep(1,6), 0), "=", 1 )


# View
write.lp(saveOpt, filename="C:/Users/DTRManning/Documents/R/Puzzlers/2019_07_12/Soccer/view.txt")

# Solve
solve( saveOpt )
get.objective( saveOpt )
get.variables( saveOpt )
get.constraints( saveOpt )


