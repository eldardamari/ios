//
//  CardMatchingGame.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/7/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong,nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@property (nonatomic) int gamePlayMode;
@end

@implementation CardMatchingGame

-(id)initWithCardsCount:(NSUInteger)numberOfCards
              usingDeck:(Deck*)deck
           withGameMode:(int)mode
{
    self = [super init];
    
    if (self) {
        self.gamePlayMode = mode;           // setting game platMode 2 or 3
        for (int i=0 ; i < numberOfCards ; i++) {
            Card* card = [deck drawRandom];
            if (deck){
                self.cards[i] = card;
            } else {
                self = nil;
            }
        }
    }
    return self;
}
// getter cards
-(NSMutableArray*)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(Card*)cardAtIndex:(NSUInteger)index
{
    return (index <= self.cards.count) ? self.cards[index] : nil;

}
#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENELTY 2

-(void)flipCardAtIndex:(NSUInteger)index
{
    Card* card = [self cardAtIndex:index];
    NSMutableArray* cardsToMatch = [[NSMutableArray alloc] init];
    int numberOfFlips = 0;
    
    if (!card.unplayable) {
        if (!card.isFaceUp) {
        // check if any other card is faced up
            for(Card* otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.unplayable){
                    self.score -= FLIP_COST;
                    numberOfFlips++;
                    
                    [cardsToMatch addObject:otherCard]; // adding a cards
                }
            }
            if (self.gamePlayMode == 3 && numberOfFlips != 2){
                card.faceUp = !card.isFaceUp;
                return;
            }
            
                // calculating the match points
            int matchPoints = [card matchCards:cardsToMatch
                                  withGameMode:self.gamePlayMode];
            if(matchPoints){                        // got any points :)
                card.unplayable = YES;
                for(Card* matchCard in cardsToMatch){
                        matchCard.unplayable = YES;
                }
                self.score += matchPoints * MATCH_BONUS;
            } else {                                // no points!
                for(Card* matchCard in cardsToMatch){
                    matchCard.faceUp = NO;
                }
                self.score -= matchPoints * MISMATCH_PENELTY;
            }
        }
        }
        card.faceUp = !card.isFaceUp;
}


@end
