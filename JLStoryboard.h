//
//  JLStoryboard.h
//  JLStoryboard
//
//  Created by Dao on 3/30/16.
//  Copyright © 2016 JL All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JLStoryboard : NSObject


/**
 *  根据Identifier/Class获取对应ViewController
 *
 */
+ (__kindof UIViewController *)instantiateViewControllerWithIdentifier:(id)Identifier;


/**
 *  根据Identifier/Class跳转至相应ViewController[同时返回该ViewController]
 *
 */
+ (__kindof UIViewController *)pushViewControllerWithIdentifier:(id)Identifier from:(UIViewController*)from animated:(BOOL)animated;



@end
