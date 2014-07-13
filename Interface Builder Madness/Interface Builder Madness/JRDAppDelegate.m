//
//  JRDAppDelegate.m
//  Interface Builder Madness
//
//  Created by Jordan Dobson on 7/8/14.
//  Copyright (c) 2014 Jordan Dobson. All rights reserved.
//

#import "JRDAppDelegate.h"

@implementation JRDAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    // TAB 1 ////////////////////////////////////////////

    // Init Formatter & Get Selected row in Index

    self.formatter = [[NSNumberFormatter alloc] init];

    [[self numberFormat] selectCellAtRow: 0 column: 0];
    [[self numberFormat] sendAction];

    // TAB 2 ///////////////////////////////////////////

    NSArray  *voices      = [NSSpeechSynthesizer availableVoices];

    self.voice1 = voices[ voices.count - 1 ];
    self.voice2 = voices[ 10 ];
    self.voice3 = voices[ 17 ];

    NSString *voice1Label = [self.voice1 componentsSeparatedByString:@"."].lastObject;
    NSString *voice2Label = [self.voice2 componentsSeparatedByString:@"."].lastObject;
    NSString *voice3Label = [self.voice3 componentsSeparatedByString:@"."].lastObject;

    [self.voiceSelection setLabel: voice1Label forSegment:0];
    [self.voiceSelection setLabel: voice2Label forSegment:1];
    [self.voiceSelection setLabel: voice3Label forSegment:2];

    [self.voiceSelection setSelectedSegment:0];

    self.synthesizer = [[NSSpeechSynthesizer alloc] initWithVoice: self.voice1];
    self.synthesizer.delegate = self;

    // TAB 3 ////////////////////////////////////////

    self.theArray = [[NSMutableArray alloc] init];
    NSString *arrayVoice = @"com.apple.speech.synthesis.voice.Alex";
    self.recordSynth = [[NSSpeechSynthesizer alloc] initWithVoice: arrayVoice];
    self.recordSynth.delegate = self;
}

// TAB 1 ////////////////////////////////////////////////

-(IBAction)udpateNumberLabelWithSliderValue:(id)sender {
    NSString *convertedString = [self.formatter stringFromNumber:@(_numberSlider.integerValue)];
    if(convertedString != NULL){
        _numberOutput.stringValue = convertedString;
    }
}

-(IBAction)updateNumberLabelWithFieldValue:(id)sender {

    NSString *convertedField = [self.formatter stringFromNumber: @(_numberField.integerValue)];
    if(convertedField != NULL){
        _numberOutput.stringValue = convertedField;
    }
}

-(IBAction)updateFormatfromRadioButtons:(id)sender {

    NSInteger selectedRow   = _numberFormat.selectedRow;
    NSNumber  *pulledNumber = [self.formatter numberFromString:_numberOutput.stringValue];

    switch (selectedRow) {
        case 1:
            self.formatter.numberStyle = NSNumberFormatterScientificStyle;
            break;
        case 2:
            self.formatter.numberStyle = NSNumberFormatterDecimalStyle;
            break;
        default:
            self.formatter.numberStyle = NSNumberFormatterSpellOutStyle;
            break;
    }

    if(pulledNumber != NULL){
        _numberOutput.stringValue = [self.formatter stringFromNumber:pulledNumber];
    }
}

// TAB 2 /////////////////////////////////////////////////////////////////////////////////


-(IBAction)speakContentsOfTextView:(id)sender {
    NSLog(@"Start Speaking");
    [self.startSpeaking setEnabled: NO];
    [self.synthesizer startSpeakingString: self.speakField.string];
}

-(IBAction)speakABCs:(id)sender {
    [self.speakField setString: @"a b c d e f g, h i j k LMNOP, q r s, t u v, w x, y, and z."];
    [self.startSpeaking setEnabled: NO];

    [self.synthesizer startSpeakingString: self.speakField.string];
}

-(IBAction)speakPledge:(id)sender {
    [self.speakField setString: @"I pledge allegiance to the ram, and the solid states of flash storage, and to the performance for which is stands, one system, under Mac,  double the pixels, with nVidia, and Retina, for ALL."];
    [self.startSpeaking setEnabled: NO];

    [self.synthesizer startSpeakingString: self.speakField.string];
}

-(void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking
{
    NSLog(@"Stopped Speaking");
    [self.startSpeaking setEnabled: YES];
}

-(IBAction)updateSpeechSynthesizerVoice:(id)sender {
    switch (self.voiceSelection.selectedSegment) {
        case 1:
            NSLog(@"Voice1");
            [self.synthesizer setVoice: self.voice2];
            break;
        case 2:
            [self.synthesizer setVoice: self.voice3];
            break;
        default:
            [self.synthesizer setVoice: self.voice1];
            break;
    }
}


// TAB 3 /////////////////////////////////////////////////////////////////////////////////

-(IBAction)moveTextFromFieldToResult:(id)sender {
    // Get current Input
    NSString *curInput = _arrayField.stringValue;

    // Put In Array
    [self.theArray addObject:curInput];
    _arrayField.stringValue = @"";
    [self.resultField setString: [_theArray componentsJoinedByString:@"   \n"]];
}

-(IBAction)playTextInResultField:(id)sender {
    [self.recordSynth startSpeakingString: self.resultField.string];
}

@end
