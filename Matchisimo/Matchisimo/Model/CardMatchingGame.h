//
//  CardMatchingGame.h
//  Matchisimo
//
//  Created by Eldar Damari on 9/7/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
// initializer
-(id)initWithCardsCount:(NSUInteger)numberOfCards
              usingDeck:(Deck*)deck
           withGameMode:(int)mode;

// flip a card in deck
- (void)flipCardAtIndex:(NSUInteger)index;

// Card at index
-(Card*)cardAtIndex:(NSUInteger)index;

// Score of the game for each action
@property (nonatomic, readonly) int score;


@end
