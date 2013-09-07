//
//  MatchisimoViewController.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "MatchisimoViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface MatchisimoViewController ()
// Label to count flips.
@property (weak, nonatomic) IBOutlet UITextField *flipsCounter;
@property (nonatomic) int flipcount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UITextField *scoreLabel;
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode23;
@property (weak, nonatomic) IBOutlet UILabel *userMsgLabel;
@property (nonatomic) int gameModeNumber;
@end

@implementation MatchisimoViewController

// Getter for a game - lazy intantioation.
- (IBAction)gameMode:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0){
        self.gameModeNumber = 2;
    } else {
        self.gameModeNumber = 3;
    }
}
-(CardMatchingGame*)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardsCount:self.cardButtons.count
                                                          usingDeck:[[PlayingCardDeck alloc] init]
                                                       withGameMode:self.gameModeNumber];
    return _game;
}


// setter for array of cards
-(void)setCardButtons:(NSArray *)cardButtons {
    
    _cardButtons = cardButtons;
    self.gameModeNumber = 2;
    [self updateUI];
}

-(void)updateUI
{
    //UIImage *cardBackImage = [UIImage imageNamed:@"cardBackImage.jpg"];
    //[cardButton setImage:cardBackImage forState:UIControlStateNormal];
    
    for(UIButton* cardButton in self.cardButtons){
        Card* card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        // updating title of card
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled  = !card.unplayable;
        cardButton.alpha    = card.unplayable ? 0.5 : 1.0;  // setting alpha to a match card
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    }
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
    Card* card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipcount++;
    self.userMsgLabel.text = [NSString stringWithFormat:@"Flliped Up %@",card.contents];
    [self updateUI];
}

- (IBAction)dealCardsButton:(UIButton *)sender {
    for(UIButton *cardButton in self.cardButtons){
        [cardButton setTitle:@"" forState:UIControlStateSelected|UIControlStateNormal|UIControlStateDisabled];
        cardButton.selected = NO;
        cardButton.enabled = YES;
        cardButton.alpha = 1.0;
        self.flipsCounter.text = [NSString stringWithFormat:@"Flips: %d",0];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",0];
        self.userMsgLabel.text = [NSString stringWithFormat:@""];

        self.game = nil;
    }
}
@end
