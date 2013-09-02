//
//  MatchisimoViewController.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "MatchisimoViewController.h"
#import "PlayingCardDeck.h"

@interface MatchisimoViewController ()
// Label to count flips.
@property (weak, nonatomic) IBOutlet UITextField *flipsCounter;
@property (nonatomic) int flipcount;
@property (strong,nonatomic) PlayingCardDeck* deck;
@end

@implementation MatchisimoViewController

// Getter for Deck
-(PlayingCardDeck*)deck {

    // constructor
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

// Setter for flip counter variable
- (void) setFlipcount:(int)flipcount
{
    _flipcount = flipcount;
    self.flipsCounter.text = [NSString stringWithFormat:@"Flips: %d",self.flipcount];
}

// Action when card is pressed.
- (IBAction)flipCard:(UIButton *)sender
{
    //lets change the selcted card picture each draw
    [sender setTitle:[self.deck drawRandom].contents forState:UIControlStateSelected];
    
    // updating counter
    if(sender.isSelected)
        self.flipcount++;
    
    sender.selected = !sender.isSelected;
}

@end
