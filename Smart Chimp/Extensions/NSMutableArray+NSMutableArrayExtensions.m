//
//  NSMutableArray+NSMutableArrayExtensions.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 2/12/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "NSMutableArray+NSMutableArrayExtensions.h"

@implementation NSMutableArray (NSMutableArrayExtensions)

- (void)shuffle {
    // Fisher–Yates shuffle algorithm
    static BOOL seeded = NO;
    
    if(!seeded) {
        seeded = YES;
        srandom((int)time(NULL));
    }
    
    int count = (int) [self count];
    
    for (int i = 0; i < count; i++) {
        int nElements = count - i;
        int n = (random() % nElements) + i;
        
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
