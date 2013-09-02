//
//  PlayingCard.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

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
