# Calculator
iOS 10 mobile application calculator

## How to Build:
#### 1. Open and name a new single view application project in Xcode

      a. Set language to Swift and devices to universal
  
#### 2. Go to Main.storyboard, click-and-drag a button onto the storyboard

    a. Rename the button a number from 0 to 9 to make the first number key on the calculator
  
    b. Change the font and background of the button to your liking
    
#### 3. Open the assistant editor, hold down controll on your button, click-and-drag into ViewController

      a. Set connection to action
      
      b. Give the method a name, I used "touchDigit"
      
      c. Set type to UIButton

#### 4. Copy and paste your first button to make the remaining number keys on the calculator

      a. Now, all of your buttons will be hooked up to the touchDigit method
      
#### 5. Create a variable "digit" within your method and set it equal to the title of its sender, the button

      a. Use "let" instead of "var" in this case
      
      b. Be sure to unwrap the optional currentTitle
      
      c. let digit = sender.currentTitle!

#### 6. Create a label for the display where the calculations will appear

      a. Set the title of the label to 0, use right-aligned text
      
      b. Control & drag to make an outlet connection
      
      c. Name the outlet "display"

#### 7. Create a variable "textCurrentlyInDisplay" and set it equal to the text of the display

      a. let textCurrentlyInDisplay = display!.text!

#### 8. Set the display text to textCurrentlyInDisplay + digit

      a. display!.text = textCurrentlyInDisplay + digit

#### 9. Create a boolian variable "userIsInTheMiddleOfTyping" and set it to false

      a. var userIsInTheMiddleOfTyping = false

#### 10. Create an if-else statement for userIsInTheMiddleOfTyping

      a. For if, use the textCurrentlyInDisplay variable that we created

#### 11.  For else, set the display text equal to digit

      a. display!.text = digit
      
      b. Set userIsInTheMiddleOfTyping to true
      
#### 12.  

#### 13. 

#### 14. 

#### 15.  

#### 16. 

