
Create a new OS X application.

Start laying out your UI. The basis of this single window app is an NSTabView. An NSTabView let’s us switch between two views in the same window.

Your tab view will have the following three sections: 

- Numbers and number formatters
- Words and speech synthesizers
- A third tab for free exploration

## Numbers Tab

Add label
Add text field
Add slider
Add label
Add radio (NSMatrix)

Create outlets in your AppDelegate.h file. Recall that IBOutlet is defined to nothing. It’s just a flag for Xcode and Interface Builder that provides context and allows for that drag-drop circle in the code. You only need outlets for UI elements you want to change or access in code.


### Actions

Add actions in your AppDelegate.m file and connect them to the appropriate UI controls
- sliderChanged
- numberFieldChanged
- radioChanged

These Methods should all have the method signature `- (IBAction)someCoolMethodName:(id)sender`. IBAction is similar to IBOutlet. It is defined to void, and just adds context for Xcode and Interface Builder to update the UI appropriately. Make sure to name your methods something descriptive. Generally, methods should start with vowels and indicate what action you will perform, not what action was performed to call the method. That is, `changeTextFieldColor:` is a better name than `colorButtonPressed:`.

On Slider Change
  Log out the integer value of the slider
  Change the `stringValue` of the label

On Number Field Change
  Log out integer value of the number field
  Change the `stringValue` of the label

On Radio Change
  Log out radio and see what row & column are selected
  Change the number format of your NSNumberFormatter
  Update UI to represent output of new number formatter

### NSNumberFormatter

You need to make an NSNumberFormatter object that the AppDelegate instance owns. This is done by using the @property syntax in the .h file. Its memory management semantics should be `strong`. 

Now use your formatter to format the numbers coming from the slider and input to the label.  Make sure your number output label has enough room to show the whole string. You’ll need some way to convert NSNumber objects into NSString objects. There is probably some method on NSNumberFormatter along the lines of `-(NSString*)makeStringFromSomeNumber:(NSNumber*)num`. Don’t take my word for it, check the  documentation. [NSNumberFormatter at Apple documentation](https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/classes/NSNumberFormatter_Class/Reference/Reference.html). I strongly recommend you install [Dash Documentation Browser](http://kapeli.com/dash). Another alternative is [AppKiDo](http://appkido.com/).

Find out how to change the number output format of your formatter. Use the docs.

Generally formatters can convert both ways. String to number. Number to string. [So what?](https://www.youtube.com/watch?v=YlyXZG2dupo)


### Further customization with the inspector panel

Change some properties on your label

- Font. Negative points for “Comic Sans MS” ;)
- Should word wrap. No clipping or truncation.

Change some properties on the slider

- min value
- max value
- current value

All labels should have appropriate placeholder text.



## Text To Speech Tab

- Use an NSSpeechSynthesizer
- Become the delegate for NSSpeechSynthesizer

UI

An NSTextView or NSTextField to get user input.

Have a 'start speaking' button that is disabled while the synthesizer is speaking. Enable the button again when the synthesizer is done speaking.

Add a NSSegmentedControl for voice selection. You may choose the voices. Only a few are necessary.

Add two buttons that populate the text view with some text of your choice. Corporate mission statements sound funny when spoken by a robot. 



## Omakase Tab

This is all yours. What goes in here is up to you. [Omakase](http://en.wikipedia.org/wiki/Omakase) style.

Some suggestions to get the creative neurons flowing:

- Change color and or font of a text input via button clicks.
- Take text input and write it backwards into a label on button click or via live updating.
- Highlight or words where a speech synthesizer is speaking. (advanced)
- Surprise us. Make us happy. Have fun and explore Objective-C.






## Exploration

- Update your slider continuously, not only after letting go of the knob
- Keep all UI elements in sync. Update other fields when slider or input value changes.


## Reference

1. For a discussion of strong vs weak ownership of an object, check this StackOverflow answer  written by someone you know ;) [StackOverflow](http://stackoverflow.com/questions/11013587/differences-between-strong-and-weak-in-objective-c/18344946#18344946)