# Canvas Editor
This is a basic command line program designed to simulate a basic canvas editor. The tech stack I have chosen for this is ruby and rspec for testing. Below I will detail instructions for use and my approach when solving this task. I have chosen to follow a TDD approach for this.

## Instructions for use
- First, in your command line run:
```
git clone https://github.com/samkitchen94/canvas-editor-tech-test.git
```
- Then again in your command line run:
```
bundle install
```
- Then navigate to this repository in your command line and run:
```
ruby bitmap-editor.rb
```
- Now the program will be running. Then enter the following commands to create and interact with your canvas:


## User Stories
```
- As a user, I would like to initialise a blank canvas
- As a user, I would like to be able to see my canvas
- As a user, I would like to change the colour of a specific coordinate on my canvas
- As a user, I would like to clear my canvas so it is blank
- As a user, I would like to colour in a specific part of a row on my canvas
- As a user, I would like to colour in a specific part of a column on my canvas
```

## My Approach
When taking on this challenge I have tried to break it down into smaller steps, these can be seen below. I have tried to consider all edge cases for this, they will be below the steps I have taken. Firstly I mapped out some user stories as seen above. Then I designed my app in terms of what classes and methods I would need, and implemented them in the sequence below.

I have decided to use a Canvas class the holds all methods related to manipulating and generating the canvas, and then methods relating to the program itself (such as running the program, selecting what to do with each user input, and error messages) within the CanvasEditor class.

I also noted down all of the possible edge case scenarios that needed to be implemented, these can be seen below.

I'm unsure where to keep a lot of the tests, I have decided to keep the majority of them so they are testing the CanvasEditor class as this tests the entire program as opposed to just the method called on the Canvas class.

- Firstly initialize the project - readme, initialize git, lib and spec folders, gemfile (with all dependencies added in), and bitmap-editor.rb file to run the program from.

- Next I have chosen to create a method within the canvas class that will draw a new blank canvas, made up of m amount of n length arrays.

- Then I have added a show method to show the current canvas and a test to make sure this outputs the correct format in the terminal. All this does is joins each array together and puts them one after the other.

- Next I have implemented how to close the program with command "X" - this is easy to implement but harder to test.

- Next I have implemented the help menu - this still needs filling out properly but the functionality works. The help_menu method is private as it only needs to be called internally.

- Next I have decided to focus on colouring in one specific pixel.

- And now, clearing the canvas so it is blank. This is just replacing everything in @canvas with an "O".

- Next colouring in specific rows and columns between specific rows (inclusive). I'm getting a warning that the flip flop operator is depreciated but I think this is the most succinct way to implement this feature. Colouring horizontal sections was a little trickier - here I had to create an array of numbers between X1 & X2 (inclusive) and then use the colour_specific_pixel method on each pixel position in the array.

- The choose_selection method is getting a bit messy - time to change it to a case statement from a big if/else statement.

- Next I will focus on the scale feature. I have added a scale up feature but it will duplicate all the coloured in pixels - not sure of a way around this.

## Edge cases to be considered
- User cannot build a canvas larger than 250 or smaller than 1.
- User cannot clear a canvas if one hasn't been created.


## Things I have been unable to add in
- I have struggled to test the help menu - I could copy the entire output into the tests and say "expect { canvas_editor.choose_selection("?") }.to output.." but this seems unnecessary - and I'm unable to use the rspec matcher include.
