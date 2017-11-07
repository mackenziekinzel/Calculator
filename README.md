# Calculator
iOS 10 mobile application calculator

How to Build:
1. Open and name a new single view application project in Xcode

   a. Set language to Swift and devices to universal
  
2. Go to Main.storyboard, click-and-drag a button onto the storyboard

    a. Rename the button a number from 0 to 9 to make the first number key on the calculator
  
    b. Change the font and background of the button to your liking
    
3. Open the assistant editor, hold down controll on your button, click-and-drag into ViewController

      a. Set connection to action
      
      b. Give the method a name, I used touchDigit
      
      c. Set type to UIButton

4. Copy and paste your first button to make the remaining number keys on the calculator

      a. Now, all of your buttons will be hooked up to the touchDigit method
