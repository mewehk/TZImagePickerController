//
//  TZPhotoPickerController.h
//  TZImagePickerController
//
//  Created by 谭真 on 15/12/24.
//  Copyright © 2015年 谭真. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TZAlbumModel;
@interface TZPhotoPickerController : UIViewController

@property (nonatomic, assign) BOOL isFirstAppear;
@property (nonatomic, assign) NSInteger columnNumber;
@property (nonatomic, strong) TZAlbumModel *model;

@property (nonatomic, assign) BOOL statusBarHidden;
/**
 重置状态
 */
- (void)reset;

/**
 获取改相册下的asset
 */
- (void)fetchAssetModels;

/**
 完成按钮点击
 */
- (void)doneButtonClick;

@end


@interface TZCollectionView : UICollectionView

@end
