//
//  PlayingCard.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard 


- (int) matchCards:(NSArray *)cards
      withGameMode:(int) gameMode{

    int score = 0;
    if (gameMode == 2){                 // game mode 2 cards match
        if (cards.count == 1) {
            PlayingCard* otherCard = [cards lastObject];
            if(self.rank == otherCard.rank)
                score = 4;
            if (self.suit == otherCard.suit)
                score += 1;
        }
    } else {                            // game mode 3 cards match
        PlayingCard* firstCard   = [cards objectAtIndex:0];
        PlayingCard* secondeCard = [cards objectAtIndex:1];
        
        if ((self.rank == firstCard.rank) && (firstCard.rank == secondeCard.rank))
            score = 20;
        if ( (self.suit == firstCard.suit) && (firstCard.suit == secondeCard.suit))
            score += 10;
    }
    return score;
}


-(NSString*)contents {
    NSArray* rankStrings  = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;
@synthesize rank = _rank;

// G suit
-(void)setSuit:(NSString *)suit {
    
    if ([[PlayingCard vaildSuits] containsObject:suit]) {
        _suit = suit;
    }
}
// S suit
-(NSString*)suit {
    
    return _suit ? _suit : @"?";
}

// G rank
-(NSUInteger)rank{
    return _rank;
}

// S rank
-(void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

// Utills
+(NSArray*)vaildSuits {
    return @[@"♥",@"♦",@"♠",@"♣"];
}
+(NSArray*)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger)maxRank{
    return [self rankStrings].count-1;
}
@end
