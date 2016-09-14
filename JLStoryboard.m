//
//  JLStoryboard.m
//  JLStoryboard
//
//  Created by Dao on 3/30/16.
//  Copyright © 2016 JL All rights reserved.
//

#import "JLStoryboard.h"
#import "_jlViewController.h"
#import <objc/runtime.h>


@interface JLStoryboard ()
{
    NSMutableArray <UIStoryboard *> *__array;
}

- (__kindof UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)Identifier;

@end



@implementation JLStoryboard

- (void)loadStoryboard
{

    //storyboard在Bundle里面以“*.storyboardc”文件存在
    NSArray *array = [[NSBundle mainBundle] pathsForResourcesOfType:@"storyboardc" inDirectory:nil];

    __array = [NSMutableArray array];

    for (NSString *path in array)

    {
        NSString *file = [path lastPathComponent];
        //“Main.storyboard”在Bundlel存在文件Main.storyboardc和Main~iPhone.storyboardc两个文件
        if (![file rangeOfString:@"Main"].length && ![file rangeOfString:@"~"].length && ![file rangeOfString:@"LaunchScreen"].length)
        {
            NSLog(@"%@", file);
            NSString *fileName = [file stringByDeletingPathExtension];
#ifdef DEBUG
            [__array addObject:[UIStoryboard storyboardWithName:fileName bundle:nil]];
#else
            //这里设置忽略加载的Storyboard
            if ([fileName rangeOfString:@"ignore"].length == 0)
                [__array addObject:[UIStoryboard storyboardWithName:fileName bundle:nil]];
#endif
        }
    }

    //延迟加载，开发过程中优选加载编辑中的storyboard
    [__array addObject:[UIStoryboard storyboardWithName:@"Main" bundle:nil]];
}

+ (instancetype)instance
{
    static id storyboary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storyboary = [[JLStoryboard alloc] init];
        [storyboary loadStoryboard];
    });
    return storyboary;
}

+ (NSString *)theIdentifier:(id)Identifier
{
    if ([Identifier isKindOfClass:[NSString class]])
    {
        return Identifier;
    }else
    {
        return NSStringFromClass([Identifier class]);
    }
}

/********************************************************************/
/*                                                                  */
/*                                                                  */
/*                                                                  */
/*                                                                  */
/********************************************************************/
+ (UIViewController *)instantiateViewControllerWithIdentifier:(id)Identifier
{
    return [[self instance] instantiateViewControllerWithIdentifier:[self theIdentifier:Identifier]];
}


/********************************************************************/
/*                                                                  */
/*                                                                  */
/*                                                                  */
/*                                                                  */
/********************************************************************/
+ (UIViewController *)pushViewControllerWithIdentifier:(id)Identifier from:(UIViewController *)from animated:(BOOL)animated
{
    UIViewController * _jlViewController = nil;
    _jlViewController = [self instantiateViewControllerWithIdentifier:Identifier];

    if (_jlViewController)
        [from.navigationController pushViewController:_jlViewController animated:animated];

    return _jlViewController;
}



/********************************************************************/
/*                                                                  */
/*                                                                  */
/*                                                                  */
/*                                                                  */
/********************************************************************/
- (UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)Identifier
{
    NSLog(@"%@", Identifier);
    UIViewController * _jlViewController;

    for (UIStoryboard *storyboard in __array)
    {
        @try {
            _jlViewController = [storyboard instantiateViewControllerWithIdentifier:Identifier];
        } @catch (NSException *exception) {

        } @finally {
            if (_jlViewController)
                break;
        }
    }

#ifdef DEBUG
    if (!_jlViewController)
    {
        UIAlertView  *alertView = [[UIAlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
        [alertView setTitle:[NSString stringWithFormat:@"All Storyboard Havn't Found Identifier:%@",Identifier]];
        [alertView show];
    }
#endif
    return _jlViewController;
}

@end
