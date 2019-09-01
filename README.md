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
- 
```

## My Approach
When taking on this challenge I have tried to break it down into smaller steps, these can be seen below. I have tried to consider all edge cases for this, they will be below the steps I have taken. Firstly I mapped out some user stories as seen above. Then I designed my app in terms of what classes and methods I would need, and implemented them in the sequence below.

- Firstly initialize the project - readme, initialize git, lib and spec folders, gemfile (with all dependencies added in), and bitmap-editor.rb file to run the program from.

- Next I have chosen to create a method within the canvas class that will draw a new blank canvas, made up of m amount of n length arrays.

- Then I have added a show method to show the current canvas and a test to make sure this outputs the correct format in the terminal.

-
