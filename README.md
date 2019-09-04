# Canvas Editor
This is a basic command line program designed to simulate a basic canvas editor. The tech stack I have chosen for this is ruby and rspec for testing. Below I will detail instructions for use and my approach when solving this task.

I have tried to keep my code as clean as possible, well tested and have tried to keep all methods as short as possible and following the Single Responsibility Principle. All methods that aren't accessed externally have been made private. The 'My Approach' section details my though process and overall plan for this challenge in more detail.

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
```
I M N
Create a new M x N canvas with all pixels coloured white (O).
C
Clears the canvas, setting all pixels to white (O).
L X Y C
Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C
Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C
Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
W F
Scales the canvas with the given factor F (in percentage). (note that this feature is only working for scaling up the canvas, not down.)
```
## User Stories
```
As a user, I would like to initialise a blank canvas
As a user, I would like to be able to see my canvas
As a user, I would like to change the colour of a specific coordinate on my canvas
As a user, I would like to clear my canvas so it is blank
As a user, I would like to colour in a specific part of a row on my canvas
As a user, I would like to colour in a specific part of a column on my canvas
```

The above user stories are the ones I successfully implemented. I was unable to implement the following due to time constraints:
```
As a user, I would like to scale up my canvas by a certain percentage
As a user, I would like to scale down my canvas by a certain percentage
As a user, I would like to fill certain regions in my canvas with another colour
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

- Next I have focused on the scale feature. I have added a scale up feature but it will duplicate all the coloured in pixels - not sure of a way around this.

- Attempted to add the reamining features but unable to due to time constraints - please see the section below for details on my though process for these and what I would have done had I had more time.

- Finally, I have tried to cover error messages for edge cases - trying to keep refactoring the app as well as I go so that everything still follows the SRP. 

## Edge cases to be considered
- User cannot build a canvas larger than 250 or smaller than 1.
- User cannot clear a canvas if one hasn't been created.
- User cannot use lowercase commands.
- Errors for incorrect format eg using letters when numbers should be used and vice versa.
- Error for when user tries to colour in coordinates for the canvas that don't exist.


## Things I have been unable to add in
- I have struggled to test the help menu - I could copy the entire output into the tests and say "expect { canvas_editor.choose_selection("?") }.to output.." but this seems unnecessary - and I'm unable to use the rspec matcher include.

- I have been unable to add the fill functionality to this app. If I had more time I would have looked into recursion more to solve this as this is key to making sure that the method fills in the other pixels around it. I understand that the method should run itself with the pixels before and after it, but I have been unable to do this due to time constraints.

- I have been unable to add a scale down feature for if the user enters a percentage less than 100 due to time constraints.
