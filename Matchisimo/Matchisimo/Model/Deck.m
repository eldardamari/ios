//
//  Deck.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "Deck.h"
@interface Deck()
// The Deck! muhaaa
@property (strong,nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray*)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

// adding card to deck.
-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop) {
        // need to check if card not nill.
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

// drawing a random card
-(Card*)drawRandom {
    Card* randomCard = nil;
    
    if(self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end
