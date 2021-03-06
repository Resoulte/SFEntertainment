
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SFTopicType) {
    SFTopicTypeAll = 1,
    SFTopicTypeImage = 10,
    SFTopicTypeWord = 29,
    SFTopicTypeVoice = 31,
    SFTopicTypeVideo = 41
};

UIKIT_EXTERN CGFloat const SFHeaderViewH;
UIKIT_EXTERN CGFloat const SFHeaderViewY;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const SFTopicCellMargin;
/** 精华-cell-文字内容的Y值 */
UIKIT_EXTERN CGFloat const SFTopicCellTextY;
/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const SFTopicCellBottomBarH;