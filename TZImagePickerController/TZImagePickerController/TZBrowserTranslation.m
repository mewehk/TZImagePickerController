//
//  TZBrowserTranslation.m
//  TZImagePickerController
//
//  Created by 余意 on 2019/11/6.
//

#import "TZBrowserTranslation.h"

#import "UIView+Layout.h"

@implementation TZBrowserTranslation

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //注意这里是还原 所以toView和fromView 身份互换了 toView是ViewController.view
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];

    //获取相应的视图
    UIView * containerView = [transitionContext containerView];
    UIView * tempView = [[containerView subviews] firstObject];

    //在fromView 下面插入toView 不然回来的时候回黑屏
    [containerView insertSubview:toView belowSubview:fromView];

    toView.alpha = 0;
    fromView.alpha = 1;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toView.alpha = 1;
        fromView.alpha = 0;
    } completion:^(BOOL finished) {
        //标记转场
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];

        //转场成功的处理
        if (![transitionContext transitionWasCancelled])
        {
            [tempView removeFromSuperview];
            toView.hidden = NO;
        }
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
