//
//  Card.m
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card
@synthesize faceUp = _faceUp;
@synthesize unplayable = _unplayable;

// Getter faceUp
-(BOOL)isFaceUp { return _faceUp; }

// Setter faceUp
-(void)setFaceUp:(BOOL)faceUp { _faceUp = faceUp; }

// Getter unplayable
-(BOOL)unplayable { return _unplayable; }

// Setter unplayable
-(void)setUnplayable:(BOOL)unplayable { _unplayable = unplayable; }

// Match between two cards, if equal return 1.
- (int) match:(Card*)card {
    int score = 0;
    
    if ([card.contents isEqualToString:self.contents])
        score = 1;
    
    return score;
    
}
@end
