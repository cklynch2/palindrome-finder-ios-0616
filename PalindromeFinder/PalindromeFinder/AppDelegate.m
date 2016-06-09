//
//  AppDelegate.m
//  PalindromeFinder
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *string = @"I'm not a palindrome but I have CAPITALS and punc.tua,tion!";
    [self isPalindrome:string];
    
    NSString *papayaWar = @"No, sir! Away! A papaya war is on.";
    BOOL papayaWarPalindrome = [self isPalindrome:papayaWar];
    NSLog(@"Is papaya war a palindrome? %d", papayaWarPalindrome);
    
    return YES;
}

-(BOOL)isPalindrome:(NSString *)string {
    
    // Make a lowercase copy of the argument string.
    NSString *lowercaseString = string.lowercaseString;
    
    // Define an empty string to accept only letters from the lowercase argument string. Define another empty reversed string.
    NSString *lowercaseWithoutPunctuationOrSpaces = @"";
    NSString *reversedLowercaseWithoutPunctuationOrSpaces = @"";
    
    // Iterate over the characters in the lowercase string.
    for (NSUInteger i = 0; i < lowercaseString.length; i++) {
        unichar frontCharacter = [lowercaseString characterAtIndex: i];
        unichar backCharacter = [lowercaseString characterAtIndex: lowercaseString.length - (i + 1)];
        
        // Only add letters to the empty strings, skipping punctuations marks and spaces by referencing ASCII codes.
        if (97 <= frontCharacter && frontCharacter <= 122) {
            lowercaseWithoutPunctuationOrSpaces = [lowercaseWithoutPunctuationOrSpaces stringByAppendingFormat:@"%C", frontCharacter];
        }
        if (97 <= backCharacter && backCharacter <= 122) {
            reversedLowercaseWithoutPunctuationOrSpaces = [reversedLowercaseWithoutPunctuationOrSpaces stringByAppendingFormat:@"%C", backCharacter];
        }
    }
    NSLog(@"This is the lowercase string without spaces or punctuation: %@", lowercaseWithoutPunctuationOrSpaces);
    NSLog(@"This is the reversed string that we're comparing against: %@", reversedLowercaseWithoutPunctuationOrSpaces);
    
    // Check to see if the reversed string is the same as the forward string, return YES isPalidrome if they are the same.
    if ([lowercaseWithoutPunctuationOrSpaces isEqualToString:reversedLowercaseWithoutPunctuationOrSpaces]) {
        return YES;
    }
    return NO;
}

@end
