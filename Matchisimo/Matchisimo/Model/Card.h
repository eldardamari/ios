//
//  Card.h
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// Name of the card
@property (strong,nonatomic) NSString* contents;

// Faced up?
@property (nonatomic, getter = isFaceUp) BOOL faceUp;

// A playable Card?
@property (nonatomic) BOOL unplayable;

- (int) match:(Card*)card;

@end
