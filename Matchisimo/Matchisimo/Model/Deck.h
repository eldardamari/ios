//
//  Deck.h
//  Matchisimo
//
//  Created by Eldar Damari on 9/2/13.
//  Copyright (c) 2013 Eldar Damari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

-(void)addCard:(Card*)card atTop:(BOOL)atTop;
-(Card*)drawRandom;

@end
