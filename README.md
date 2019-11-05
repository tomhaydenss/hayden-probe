# Hayden::Probe

Welcome to Hayden's Probe, a funny tool to simulate a surface exploration of an arbitrary planet.

## Usage

After checking out the repo, run `bundle install` to install dependencies.

    $ bundle install

You should start this application by creating a surface that will be explored by probes. You should inform surface's dimensions represented by the upper-right coordinate. In the following example a surface with 5 columns and 5 rows will be created.

    $ bundle exec bin/hayden-probe surface_exploration

    Please, inform the surface's dimensions, represented by upper-right coordinate
    Coordinate X (minimum 3 and maximum 100): 5
    Coordinate Y (minimum 3 and maximum 25): 5

The next step is to inform the probe's position represented by coordinates X and Y and also by direction that means for which side the probe is facing to (north, south, east or weast).

    Please, inform the probe's position and direction
    Coordinate X: 1
    Coordinate Y: 2
    Direction (N/S/E/W): N

Now you should inform the movements sequence that the probe will do. Just follow the instructions and give these information.

    Please, inform the sequence of movements that the probe should do
    Ex: If you wish the probe to turn Left, Move forward, turn Left again, Move forward twice
        You should type the following sequence: LMLMM
    Movements alloweds are M = Move forward, L = Turn Left and R = Turn Right
    Movements sequence: LMLMLMLMM
    ┌──────┐
    │      │
    │      │
    │ N    │
    │      │
    │      │
    │      │
    └──────┘
    Result: 1 3 N

If you desire to add another probe, so type 'y' for the following question and fill the next probe's information.

    Do you want to add another probe (y/n)? y
    Please, inform the probe's positions and direction
    Coordinate X: 3
    Coordinate Y: 3
    Direction (N/S/E/W): E
    Please, inform the sequence of movements that the probe should do
    Ex: If you wish the probe to turn Left, Move forward, turn Left again, Move forward twice
        You should type the following sequence: LMLMM
    Movements alloweds are M = Move forward, L = Turn Left and R = Turn Right
    Movements sequence: MMRMMRMRRM
    ┌──────┐
    │      │
    │      │
    │ N    │
    │      │
    │     E│
    │      │
    └──────┘
    Result: 5 1 E

You can also continuing add new probes or exploring other surfaces as well. Enjoy!

    Do you want to add another probe (y/n)? n
    Do you want to explore another surface (y/n)? n

## Assumptions

The following rules was not specified, so they are assumptions:

- Surface's Dimensions:
  - Minimum height: 3
  - Maximum height: 25
  - Minimum width: 3
  - Maximum width: 100
- Probe's Movements:
  - Can not land on a position already landed by another probe
  - Can not overflow surface's limit
  - Invalid moves described above will be ignored and probe will stay on the same position

## Test

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests.

    $ bundle install
    $ bundle exec rspec
