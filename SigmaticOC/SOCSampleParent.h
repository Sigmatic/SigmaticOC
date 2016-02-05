//
// Created by Hisham Alabri on 5/02/2016.
// Copyright (c) 2016 Sigmatic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SOCSampleParent : NSObject

@property(nonatomic, setter=setTheCustomSetterBool:) BOOL customSetterBool;
@property(nonatomic, weak) NSString *normalString;
@property(nonatomic, assign) NSMutableString *mutableString;
@property(nonatomic, strong) id <UIAlertViewDelegate, UIApplicationDelegate, UITextFieldDelegate> delegates;


@end