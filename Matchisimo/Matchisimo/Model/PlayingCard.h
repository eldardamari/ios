//
//  PlayingCard.h
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong,nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;
+(NSArray*)vaildSuits;
+(NSUInteger)maxRank;
@end
