/// 如果宏 USE_UIKIT_PUBLIC_HEADERS 已经定义且非零，或者不能包含 <UIKitCore/UIView.h> 头文件，则执行下面的代码。通常，这样的条件语句用于在不同平台或不同编译器中进行代码选择
#if (defined(USE_UIKIT_PUBLIC_HEADERS) && USE_UIKIT_PUBLIC_HEADERS) || !__has_include(<UIKitCore/UIView.h>)



/// 宏
NS_DESIGNATED_INITIALIZER
NS_HEADER_AUDIT_BEGIN()
NS_HEADER_AUDIT_END()


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIResponder.h>
#import <UIKit/UIInterface.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIAppearance.h>
#import <UIKit/UIDynamicBehavior.h>
#import <UIKit/NSLayoutConstraint.h>
#import <UIKit/UITraitCollection.h>
#import <UIKit/UIFocus.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

/// 动画的时间曲线类型
typedef NS_ENUM(NSInteger, UIViewAnimationCurve) {
    UIViewAnimationCurveEaseInOut,         // 默认值，动画以一定的加速度开始，然后逐渐减速并停止
    UIViewAnimationCurveEaseIn,            // 动画以较慢的加速度开始，并在结束时突然停止
    UIViewAnimationCurveEaseOut,           // 动画以较快的加速度开始，然后逐渐减速并停止
    UIViewAnimationCurveLinear,            // 动画以相同的速度进行
};

/// 视图内容的布局模式
typedef NS_ENUM(NSInteger, UIViewContentMode) {
    UIViewContentModeScaleToFill,         // 默认值，使内容填充整个视图框架，可能会改变内容的宽高比
    UIViewContentModeScaleAspectFit,      // 内容按比例缩放以适应视图框架，内容的全部可见，但可能会留出空白
    UIViewContentModeScaleAspectFill,     // 内容按比例缩放以填充视图框架，可能会裁剪掉一些内容以适应视图
    UIViewContentModeRedraw,              // 视图大小更改时会自动重绘内容
    UIViewContentModeCenter,              // 将内容居中显示，但不进行缩放.
    UIViewContentModeTop,
    UIViewContentModeBottom,
    UIViewContentModeLeft,
    UIViewContentModeRight,
    UIViewContentModeTopLeft,
    UIViewContentModeTopRight,
    UIViewContentModeBottomLeft,
    UIViewContentModeBottomRight,
};

/// 视图之间的过渡效果
typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
    UIViewAnimationTransitionNone,             // 没有任何过渡效果
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,    // 从右侧翻转
    UIViewAnimationTransitionCurlUp,           // 区卷向上
    UIViewAnimationTransitionCurlDown,
};

/// 视图的自动调整行为
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0,         // 不自动调整
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,    // 左边距自适应
    UIViewAutoresizingFlexibleWidth        = 1 << 1,    // 宽度自适应
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    UIViewAutoresizingFlexibleHeight       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};
 
/// 动画的一些配置
typedef NS_OPTIONS(NSUInteger, UIViewAnimationOptions) {
    UIViewAnimationOptionLayoutSubviews            = 1 <<  0, // 视图在动画执行过程中重新布局子视图。
    UIViewAnimationOptionAllowUserInteraction      = 1 <<  1, // 动画执行期间允许用户与视图交互。
    UIViewAnimationOptionBeginFromCurrentState     = 1 <<  2, // 动画从当前视图状态开始执行，而不是从默认状态开始执行。
    UIViewAnimationOptionRepeat                    = 1 <<  3, // 动画重复执行
    UIViewAnimationOptionAutoreverse               = 1 <<  4, // if repeat, run animation back and forth
    UIViewAnimationOptionOverrideInheritedDuration = 1 <<  5, // ignore nested duration
    UIViewAnimationOptionOverrideInheritedCurve    = 1 <<  6, // ignore nested curve
    UIViewAnimationOptionAllowAnimatedContent      = 1 <<  7, // animate contents (applies to transitions only)
    UIViewAnimationOptionShowHideTransitionViews   = 1 <<  8, // flip to/from hidden state instead of adding/removing
    UIViewAnimationOptionOverrideInheritedOptions  = 1 <<  9, // do not inherit any options or animation type
    
    UIViewAnimationOptionCurveEaseInOut            = 0 << 16, // default
    UIViewAnimationOptionCurveEaseIn               = 1 << 16,
    UIViewAnimationOptionCurveEaseOut              = 2 << 16,
    UIViewAnimationOptionCurveLinear               = 3 << 16,
    
    UIViewAnimationOptionTransitionNone            = 0 << 20, // default
    UIViewAnimationOptionTransitionFlipFromLeft    = 1 << 20,
    UIViewAnimationOptionTransitionFlipFromRight   = 2 << 20,
    UIViewAnimationOptionTransitionCurlUp          = 3 << 20,
    UIViewAnimationOptionTransitionCurlDown        = 4 << 20,
    UIViewAnimationOptionTransitionCrossDissolve   = 5 << 20,
    UIViewAnimationOptionTransitionFlipFromTop     = 6 << 20,
    UIViewAnimationOptionTransitionFlipFromBottom  = 7 << 20,

    UIViewAnimationOptionPreferredFramesPerSecondDefault     = 0 << 24,
    UIViewAnimationOptionPreferredFramesPerSecond60          = 3 << 24,
    UIViewAnimationOptionPreferredFramesPerSecond30          = 7 << 24,
    
} API_AVAILABLE(ios(4.0));

/// 帧动画的一些配置
typedef NS_OPTIONS(NSUInteger, UIViewKeyframeAnimationOptions) {
    UIViewKeyframeAnimationOptionLayoutSubviews            = UIViewAnimationOptionLayoutSubviews,
    UIViewKeyframeAnimationOptionAllowUserInteraction      = UIViewAnimationOptionAllowUserInteraction, // turn on user interaction while animating
    UIViewKeyframeAnimationOptionBeginFromCurrentState     = UIViewAnimationOptionBeginFromCurrentState, // start all views from current value, not initial value
    UIViewKeyframeAnimationOptionRepeat                    = UIViewAnimationOptionRepeat, // repeat animation indefinitely
    UIViewKeyframeAnimationOptionAutoreverse               = UIViewAnimationOptionAutoreverse, // if repeat, run animation back and forth
    UIViewKeyframeAnimationOptionOverrideInheritedDuration = UIViewAnimationOptionOverrideInheritedDuration, // ignore nested duration
    UIViewKeyframeAnimationOptionOverrideInheritedOptions  = UIViewAnimationOptionOverrideInheritedOptions, // do not inherit any options or animation type
    
    UIViewKeyframeAnimationOptionCalculationModeLinear     = 0 << 10, // default
    UIViewKeyframeAnimationOptionCalculationModeDiscrete   = 1 << 10,
    UIViewKeyframeAnimationOptionCalculationModePaced      = 2 << 10,
    UIViewKeyframeAnimationOptionCalculationModeCubic      = 3 << 10,
    UIViewKeyframeAnimationOptionCalculationModeCubicPaced = 4 << 10
} API_AVAILABLE(ios(7.0));
    
/// 系统动画类型，用于在执行一些系统动画时指定动画类型  -- 很多类型都删掉了，可以不用关注
typedef NS_ENUM(NSUInteger, UISystemAnimation) {
    UISystemAnimationDelete,    // removes the views from the hierarchy when complete
} API_AVAILABLE(ios(7.0));

/// 视图的着色调整模式。着色调整模式控制视图在应用 tint color 时的行为
typedef NS_ENUM(NSInteger, UIViewTintAdjustmentMode) {
    UIViewTintAdjustmentModeAutomatic,  // 表示视图应该根据其内容和上下文决定是否应用 tint color。
    
    UIViewTintAdjustmentModeNormal,     // 表示视图应用 tint color
    UIViewTintAdjustmentModeDimmed,     // 表示视图应用 dimmed tint color
} API_AVAILABLE(ios(7.0));

/// 表示视图的语义内容属性。这个属性是用于指定视图的语义意义，以便于更好地适应用户的文化习惯和特定的布局方向
typedef NS_ENUM(NSInteger, UISemanticContentAttribute) {
    UISemanticContentAttributeUnspecified = 0,  // 表示未指定语义内容属性，这是默认值。
    UISemanticContentAttributePlayback,         // 表示该视图的语义内容属性是用于音频或视频播放的。
    UISemanticContentAttributeSpatial,          // 表示该视图的语义内容属性是空间的。
    UISemanticContentAttributeForceLeftToRight, // 表示该视图的语义内容属性是从左到右的。该值可用于将用户界面元素强制显示为从左到右的排列方式，即使用户界面的当前语言是从右到左的。
    UISemanticContentAttributeForceRightToLeft  // 表示该视图的语义内容属性是从右到左的。该值可用于将用户界面元素强制显示为从右到左的排列方式，即使用户界面的当前语言是从左到右的。
} API_AVAILABLE(ios(9.0));




NS_SWIFT_UI_ACTOR   /// NS_SWIFT_UI_ACTOR 是一个宏定义，用于指示一个 Objective-C 类型在 Swift 中应该作为一个异步安全的并发执行的类型进行导入。它被用于异步执行的 UI 更新场景，以确保线程安全。



/// 于定义一个坐标空间
@protocol UICoordinateSpace <NSObject>
/// 将给定的点从当前坐标空间转换为另一个坐标空间中的点
- (CGPoint)convertPoint:(CGPoint)point toCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace API_AVAILABLE(ios(8.0));
/// 将给定的点从另一个坐标空间转换为当前坐标空间中的点。
- (CGPoint)convertPoint:(CGPoint)point fromCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace API_AVAILABLE(ios(8.0));
/// 将给定的矩形从当前坐标空间转换为另一个坐标空间中的矩形。
- (CGRect)convertRect:(CGRect)rect toCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace API_AVAILABLE(ios(8.0));
/// 将给定的矩形从另一个坐标空间转换为当前坐标空间中的矩形。
- (CGRect)convertRect:(CGRect)rect fromCoordinateSpace:(id <UICoordinateSpace>)coordinateSpace API_AVAILABLE(ios(8.0));

/// 只读属性，用于描述视图在其自身坐标系中的位置和大小
@property (readonly, nonatomic) CGRect bounds API_AVAILABLE(ios(8.0));

@end




@class UIBezierPath, UIEvent, UIWindow, UIViewController, UIColor, UIGestureRecognizer, UIMotionEffect, CALayer, UILayoutGuide, UIKeyboardLayoutGuide;




UIKIT_EXTERN API_AVAILABLE(ios(2.0)) NS_SWIFT_UI_ACTOR
@interface UIView : UIResponder <NSCoding, UIAppearance, UIAppearanceContainer, UIDynamicItem, UITraitEnvironment, UICoordinateSpace, UIFocusItem, UIFocusItemContainer, CALayerDelegate>


- (instancetype)initWithFrame:(CGRect)frame NS_DESIGNATED_INITIALIZER;
/// 用于从一个 NSCoder 对象中解码数据来初始化当前对象。这个方法通常在从 nib 文件中创建对象时调用，因为 nib 文件是以二进制形式存储的，需要使用 NSCoder 对象进行解码。     该方法有一个参数 coder，表示用于解码数据的 NSCoder 对象。方法返回一个可选类型的实例对象，表示初始化成功后的当前对象。如果初始化失败，则返回 nil。
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;


@property(class, nonatomic, readonly) Class layerClass;                        // default is [CALayer class]. Used when creating the underlying layer for the view.
@property(nonatomic,readonly,strong)  CALayer  *layer;              // returns view's layer. Will always return a non-nil value. view is layer's delegate


@property(nonatomic,getter=isUserInteractionEnabled) BOOL userInteractionEnabled;  // default is YES. if set to NO, user events (touch, keys) are ignored and removed from the event queue.
@property(nonatomic)                                 NSInteger tag;                // default is 0


/// 当前视图是否是第一响应者
@property(nonatomic,readonly) BOOL canBecomeFocused API_AVAILABLE(ios(9.0)); // NO by default
/// 视图对象是否处于焦点状态.
/// 只有当当前视图对象可以成为第一响应者时，该属性才有意义。如果当前视图对象不能成为第一响应者，那么该属性的值将始终为 NO
/// 如果当前视图对象是第一响应者，或者是第一响应者的祖先视图对象，则该属性返回 YES，否则返回 NO
@property (readonly, nonatomic, getter=isFocused) BOOL focused API_AVAILABLE(ios(9.0));
/// The identifier of the focus group that this view belongs to. If this is nil, subviews inherit their superview's focus group.
/// 当前视图对象所属的焦点组标识符
@property (nonatomic, readwrite, nullable, copy) NSString *focusGroupIdentifier API_AVAILABLE(ios(14.0)) API_UNAVAILABLE(tvos, watchos);
/// The priority this item has in its focus group. The higher the priority, the more likely it is to get picked when focus moves into this group.
/// Note: this method can only be used to increase an item's priority, not decrease it. For example if an item is currently selected, the actual priority of this item will be determined by MAX(focusGroupPriority, UIFocusGroupPrioritySelected).
/// 当前视图对象所属焦点组的优先级
@property (nonatomic, readwrite) UIFocusGroupPriority focusGroupPriority API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);
/// Describes a visual effect to apply when this item is focused. If this property is nil no effect will be applied when this view becomes focused.
/// 控制当前视图对象在响应焦点环的过渡效果
@property (nonatomic, readwrite, nullable, copy) UIFocusEffect *focusEffect API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(tvos, watchos);



/// 视图对象的语义内容
@property (nonatomic) UISemanticContentAttribute semanticContentAttribute API_AVAILABLE(ios(9.0));

// This method returns the layout direction implied by the provided semantic content attribute relative to the application-wide layout direction (as returned by UIApplication.sharedApplication.userInterfaceLayoutDirection).返回与给定语义内容属性相对应的用户界面布局方向
+ (UIUserInterfaceLayoutDirection)userInterfaceLayoutDirectionForSemanticContentAttribute:(UISemanticContentAttribute)attribute API_AVAILABLE(ios(9.0));

// This method returns the layout direction implied by the provided semantic content attribute relative to the provided layout direction. For example, when provided a layout direction of RightToLeft and a semantic content attribute of Playback, this method returns LeftToRight. Layout and drawing code can use this method to determine how to arrange elements, but might find it easier to query the container view’s effectiveUserInterfaceLayoutDirection property instead. 根据给定的语义内容属性和相对于布局方向的方向来返回适当的用户界面布局方向
+ (UIUserInterfaceLayoutDirection)userInterfaceLayoutDirectionForSemanticContentAttribute:(UISemanticContentAttribute)semanticContentAttribute relativeToLayoutDirection:(UIUserInterfaceLayoutDirection)layoutDirection API_AVAILABLE(ios(10.0));

// Returns the user interface layout direction appropriate for arranging the immediate content of this view. Always consult the effectiveUserInterfaceLayoutDirection of the view whose immediate content is being arranged or drawn. Do not assume that the value propagates through the view’s subtree.返回视图的有效用户界面布局方向，它是基于视图的语义内容属性和父视图的布局方向计算出的
@property (readonly, nonatomic) UIUserInterfaceLayoutDirection effectiveUserInterfaceLayoutDirection API_AVAILABLE(ios(10.0));

@end

/// 视图的几何结构和布局属性
@interface UIView(UIViewGeometry)

// animatable. do not use frame if view is transformed since it will not correctly reflect the actual location of the view. use bounds + center instead.
@property(nonatomic) CGRect            frame;

// use bounds/center and not frame if non-identity transform.
@property(nonatomic) CGRect            bounds;      // default bounds is zero origin, frame size. animatable
@property(nonatomic) CGPoint           center;      // center is center of frame, relative to anchorPoint. animatable
// 用于设置视图的转换（旋转、缩放、平移等）
@property(nonatomic) CGAffineTransform transform;   // default is CGAffineTransformIdentity. animatable. Please use this property instead of the affineTransform property on the layer
// 设置视图的 3D 变换
@property(nonatomic) CATransform3D     transform3D API_AVAILABLE(ios(13.0),tvos(13.0)); // default is CATransform3DIdentity. animatable. Please use this property instead of the transform property on the layer

// 默认情况下，该值为1.0，表示在标准分辨率下绘制视图的内容。
// 如果将其设置为其他值，例如2.0，那么视图的内容将会以高分辨率绘制，以适应高分辨率设备的屏幕。
// 通常，这个属性会在支持高分辨率显示的设备上被设置为2.0
@property(nonatomic) CGFloat           contentScaleFactor API_AVAILABLE(ios(4.0));

/* Defines the anchor point of the layer's bounds rect, as a point in
 * normalized layer coordinates - '(0, 0)' is the bottom left corner of
 * the bounds rect, '(1, 1)' is the top right corner. Defaults to
 * '(0.5, 0.5)', i.e. the center of the bounds rect. */
// 视图的中心点。修改 anchorPoint 可以更改视图的旋转和缩放中心
@property(nonatomic) CGPoint anchorPoint API_AVAILABLE(ios(16.0));

// 这个属性是用于控制视图是否启用多点触控（即同时识别多个手指的操作）。
// 如果设置为YES，则视图将支持多点触控；如果设置为NO，则视图将忽略多个手指的同时操作，默认为NO
@property(nonatomic,getter=isMultipleTouchEnabled) BOOL multipleTouchEnabled API_UNAVAILABLE(tvos);   // default is NO
// 是一个用于控制视图是否是排他性触摸的属性。
// 如果将此属性设置为YES，则在视图接收到触摸事件时，系统会防止其他视图接收到触摸事件。
// 如果将此属性设置为NO，则允许多个视图同时接收触摸事件
@property(nonatomic,getter=isExclusiveTouch) BOOL       exclusiveTouch API_UNAVAILABLE(tvos);         // default is NO

// 这个方法的作用是判断在该view的坐标系中，指定点point是否在该view的bounds内，
// 如果在，则该view成为事件的接收者，否则事件继续向下传递，直到找到合适的接收者为止。
// 如果在传递过程中，某个view的userInteractionEnabled属性设置为NO，那么该view及其子view都不会响应事件。
// 该方法可以重写以自定义view的点击范围，也可以在调用super方法前后做一些额外的逻辑处理
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event;   // recursively calls -pointInside:withEvent:. point is in the receiver's coordinate system
// 给定点是否在视图的边界内
//当用户在触摸屏幕上时，iOS会调用该方法来确定触摸点是否位于视图的边界内。默认情况下，如果点在视图的边界内，该方法将返回YES，否则将返回NO。可以通过覆盖该方法来自定义视图的交互方式，例如创建一个响应点击事件的自定义视图
- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event;   // default returns YES if point is in bounds

// 当前坐标系下的点、面转换成另一个坐标系下的点、面
- (CGPoint)convertPoint:(CGPoint)point toView:(nullable UIView *)view;
- (CGPoint)convertPoint:(CGPoint)point fromView:(nullable UIView *)view;
- (CGRect)convertRect:(CGRect)rect toView:(nullable UIView *)view;
- (CGRect)convertRect:(CGRect)rect fromView:(nullable UIView *)view;


// 表示当视图的大小更改时，其子视图是否自动调整大小
@property(nonatomic) BOOL               autoresizesSubviews; // default is YES. if set, subviews are adjusted according to their autoresizingMask if self.bounds changes
// 表示UIView相对于它的superview自动调整尺寸和位置的方式
@property(nonatomic) UIViewAutoresizing autoresizingMask;    // simple resize. default is UIViewAutoresizingNone

// 方法会根据视图的内容，计算并返回一个最佳适应给定大小的大小。这个方法不会改变视图的大小，只会返回一个合适的大小建议。通常，这个方法会在创建或修改视图后调用，以确保其布局的正确性。例如，在一个UITableViewCell中，这个方法被调用来计算一个合适的高度，以便它能够容纳所有的内容
- (CGSize)sizeThatFits:(CGSize)size;     // return 'best' size to fit given size. does not actually resize view. Default is return existing view size
// 方法可以自动调整视图的大小，使其适合其中的内容。该方法基于视图中当前的内容，计算适合内容的最小大小，并将视图的大小更改为计算出的大小。通常在添加、更改视图内容或约束后使用该方法。
- (void)sizeToFit;                       // calls sizeThatFits: with current view bounds and changes bounds size.

@end



/// 视图的层级关系和视图树的操作(交互)
@interface UIView(UIViewHierarchy)

@property(nullable, nonatomic,readonly) UIView       *superview;
@property(nonatomic,readonly,copy) NSArray<__kindof UIView *> *subviews;
@property(nullable, nonatomic,readonly) UIWindow     *window;

- (void)removeFromSuperview;
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index;
- (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2;

- (void)addSubview:(UIView *)view;
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview;
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview;

- (void)bringSubviewToFront:(UIView *)view;
- (void)sendSubviewToBack:(UIView *)view;

- (void)didAddSubview:(UIView *)subview;
- (void)willRemoveSubview:(UIView *)subview;

- (void)willMoveToSuperview:(nullable UIView *)newSuperview;
- (void)didMoveToSuperview;
- (void)willMoveToWindow:(nullable UIWindow *)newWindow;
- (void)didMoveToWindow;

- (BOOL)isDescendantOfView:(UIView *)view;  // returns YES for self.
- (nullable __kindof UIView *)viewWithTag:(NSInteger)tag; // recursive search. includes self

// Allows you to perform layout before the drawing cycle happens. -layoutIfNeeded forces layout early
- (void)setNeedsLayout;
- (void)layoutIfNeeded;

- (void)layoutSubviews;    // override point. called by layoutIfNeeded automatically. As of iOS 6.0, when constraints-based layout is used the base implementation applies the constraints-based layout, otherwise it does nothing.

/* -layoutMargins returns a set of insets from the edge of the view's bounds that denote a default spacing for laying out content.
 If preservesSuperviewLayoutMargins is YES, margins cascade down the view tree, adjusting for geometry offsets, so that setting
 the left value of layoutMargins on a superview will affect the left value of layoutMargins for subviews positioned close to the
 left edge of their superview's bounds
   If your view subclass uses layoutMargins in its layout or drawing, override -layoutMarginsDidChange in order to refresh your
 view if the margins change.
   On iOS 11.0 and later, please support both user interface layout directions by setting the directionalLayoutMargins property
 instead of the layoutMargins property. After setting the directionalLayoutMargins property, the values in the left and right
 fields of the layoutMargins property will depend on the user interface layout direction.
 */
@property (nonatomic) UIEdgeInsets layoutMargins API_AVAILABLE(ios(8.0));

/* directionalLayoutMargins.leading is used on the left when the user interface direction is LTR and on the right for RTL.
 Vice versa for directionalLayoutMargins.trailing.
 */
@property (nonatomic) NSDirectionalEdgeInsets directionalLayoutMargins API_AVAILABLE(ios(11.0),tvos(11.0));

@property (nonatomic) BOOL preservesSuperviewLayoutMargins API_AVAILABLE(ios(8.0)); // default is NO - set to enable pass-through or cascading behavior of margins from this view’s parent to its children
@property (nonatomic) BOOL insetsLayoutMarginsFromSafeArea API_AVAILABLE(ios(11.0),tvos(11.0));  // Default: YES

- (void)layoutMarginsDidChange API_AVAILABLE(ios(8.0));

@property (nonatomic,readonly) UIEdgeInsets safeAreaInsets API_AVAILABLE(ios(11.0),tvos(11.0));
- (void)safeAreaInsetsDidChange API_AVAILABLE(ios(11.0),tvos(11.0));

/* The edges of this guide are constrained to equal the edges of the view inset by the layoutMargins
 */
@property(readonly,strong) UILayoutGuide *layoutMarginsGuide API_AVAILABLE(ios(9.0));

/// This content guide provides a layout area that you can use to place text and related content whose width should generally be constrained to a size that is easy for the user to read. This guide provides a centered region that you can place content within to get this behavior for this view.
@property (nonatomic, readonly, strong) UILayoutGuide *readableContentGuide  API_AVAILABLE(ios(9.0));

/* The top of the safeAreaLayoutGuide indicates the unobscured top edge of the view (e.g, not behind
 the status bar or navigation bar, if present). Similarly for the other edges.
 */
@property(nonatomic,readonly,strong) UILayoutGuide *safeAreaLayoutGuide API_AVAILABLE(ios(11.0),tvos(11.0));

/// Follows the keyboard when on screen and docked. When the keyboard is offscreen or undocked, keyboardLayoutGuide.topAnchor matches the view's safeAreaLayoutGuide.bottomAnchor.
@property(nonatomic,readonly,strong) UIKeyboardLayoutGuide *keyboardLayoutGuide API_AVAILABLE(ios(15.0)) API_UNAVAILABLE(watchos, tvos);

@end



/// 视图渲染的方法和属性
@interface UIView(UIViewRendering)

- (void)drawRect:(CGRect)rect;

- (void)setNeedsDisplay;
- (void)setNeedsDisplayInRect:(CGRect)rect;

@property(nonatomic)                 BOOL              clipsToBounds;              // When YES, content and subviews are clipped to the bounds of the view. Default is NO.
@property(nullable, nonatomic,copy)            UIColor          *backgroundColor UI_APPEARANCE_SELECTOR; // default is nil. Can be useful with the appearance proxy on custom UIView subclasses.
@property(nonatomic)                 CGFloat           alpha;                      // animatable. default is 1.0
@property(nonatomic,getter=isOpaque) BOOL              opaque;                     // default is YES. opaque views must fill their entire bounds or the results are undefined. the active CGContext in drawRect: will not have been cleared and may have non-zeroed pixels
@property(nonatomic)                 BOOL              clearsContextBeforeDrawing; // default is YES. ignored for opaque views. for non-opaque views causes the active CGContext in drawRect: to be pre-filled with transparent pixels
@property(nonatomic,getter=isHidden) BOOL              hidden;                     // default is NO. doesn't check superviews
@property(nonatomic)                 UIViewContentMode contentMode;                // default is UIViewContentModeScaleToFill
@property(nonatomic)                 CGRect            contentStretch API_DEPRECATED("", ios(3.0, 6.0)) API_UNAVAILABLE(tvos); // animatable. default is unit rectangle {{0,0} {1,1}}. Now deprecated: please use -[UIImage resizableImageWithCapInsets:] to achieve the same effect.

@property(nullable, nonatomic,strong)          UIView           *maskView API_AVAILABLE(ios(8.0));

/*
 -tintColor always returns a color. The color returned is the first non-default value in the receiver's superview chain (starting with itself).
 If no non-default value is found, a system-defined color is returned.
 If this view's -tintAdjustmentMode returns Dimmed, then the color that is returned for -tintColor will automatically be dimmed.
 If your view subclass uses tintColor in its rendering, override -tintColorDidChange in order to refresh the rendering if the color changes.
 */
@property(null_resettable, nonatomic, strong) UIColor *tintColor API_AVAILABLE(ios(7.0));

/*
 -tintAdjustmentMode always returns either UIViewTintAdjustmentModeNormal or UIViewTintAdjustmentModeDimmed. The value returned is the first non-default value in the receiver's superview chain (starting with itself).
 If no non-default value is found, UIViewTintAdjustmentModeNormal is returned.
 When tintAdjustmentMode has a value of UIViewTintAdjustmentModeDimmed for a view, the color it returns from tintColor will be modified to give a dimmed appearance.
 When the tintAdjustmentMode of a view changes (either the view's value changing or by one of its superview's values changing), -tintColorDidChange will be called to allow the view to refresh its rendering.
 */
@property(nonatomic) UIViewTintAdjustmentMode tintAdjustmentMode API_AVAILABLE(ios(7.0));

/*
 The -tintColorDidChange message is sent to appropriate subviews of a view when its tintColor is changed by client code or to subviews in the view hierarchy of a view whose tintColor is implicitly changed when its superview or tintAdjustmentMode changes.
 */
- (void)tintColorDidChange API_AVAILABLE(ios(7.0));

@end



/// 定义了一些关于动画的方法，这些方法可以用来创建和执行视图动画，以及设置动画属性和选项
@interface UIView(UIViewAnimation)

+ (void)setAnimationsEnabled:(BOOL)enabled;                         // ignore any attribute changes while set.
@property(class, nonatomic, readonly) BOOL areAnimationsEnabled;
+ (void)performWithoutAnimation:(void (NS_NOESCAPE ^)(void))actionsWithoutAnimation API_AVAILABLE(ios(7.0));

@property(class, nonatomic, readonly) NSTimeInterval inheritedAnimationDuration API_AVAILABLE(ios(9.0));

@end



/// 执行带有块语法的动画
@interface UIView(UIViewAnimationWithBlocks)

+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC API_AVAILABLE(ios(4.0));

+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC API_AVAILABLE(ios(4.0)); // delay = 0.0, options = 0

+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations API_AVAILABLE(ios(4.0)); // delay = 0.0, options = 0, completion = NULL

/* Performs `animations` using a timing curve described by the motion of a spring. When `dampingRatio` is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop. You can use the initial spring velocity to specify how fast the object at the end of the simulated spring was moving before it was attached. It's a unit coordinate system, where 1 is defined as traveling the total animation distance in a second. So if you're changing an object's position by 200pt in this animation, and you want the animation to behave as if the object was moving at 100pt/s before the animation started, you'd pass 0.5. You'll typically want to pass 0 for the velocity. */
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC API_AVAILABLE(ios(7.0));

+ (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC API_AVAILABLE(ios(4.0));

+ (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC API_AVAILABLE(ios(4.0)); // toView added to fromView.superview, fromView removed from its superview

/* Performs the requested system-provided animation on one or more views. Specify additional animations in the parallelAnimations block. These additional animations will run alongside the system animation with the same timing and duration that the system animation defines/inherits. Additional animations should not modify properties of the view on which the system animation is being performed. Not all system animations honor all available options.
 */
+ (void)performSystemAnimation:(UISystemAnimation)animation onViews:(NSArray<__kindof UIView *> *)views options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))parallelAnimations completion:(void (^ __nullable)(BOOL finished))completion NS_SWIFT_DISABLE_ASYNC API_AVAILABLE(ios(7.0));

/* Call this method from within an animation block to repeat animations, otherwise has no effect. The total duration of a repeating animation can be computed via (outerAnimationDuration * repeatCount * autoreverses ? 2 : 1). */
+ (void)modifyAnimationsWithRepeatCount:(CGFloat)count autoreverses:(BOOL)autoreverses animations:(void(NS_NOESCAPE ^)(void))animations API_AVAILABLE(ios(13.0),tvos(13.0));

@end



/// 提供用于在关键帧之间执行动画的方法。可以定义动画的多个关键帧，然后在它们之间进行过渡，从而创建一个更复杂、更生动的动画
@interface UIView (UIViewKeyframeAnimations)

+ (void)animateKeyframesWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewKeyframeAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion API_AVAILABLE(ios(7.0));
+ (void)addKeyframeWithRelativeStartTime:(double)frameStartTime relativeDuration:(double)frameDuration animations:(void (^)(void))animations API_AVAILABLE(ios(7.0)); // start time and duration are values between 0.0 and 1.0 specifying time and duration relative to the overall time of the keyframe animation

@end



/// 添加和管理手势识别器的方法
@interface UIView (UIViewGestureRecognizers)

@property(nullable, nonatomic,copy) NSArray<__kindof UIGestureRecognizer *> *gestureRecognizers API_AVAILABLE(ios(3.2));

- (void)addGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer API_AVAILABLE(ios(3.2));
- (void)removeGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer API_AVAILABLE(ios(3.2));

// called when the recognizer attempts to transition out of UIGestureRecognizerStatePossible if a touch hit-tested to this view will be cancelled as a result of gesture recognition
// returns YES by default. return NO to cause the gesture recognizer to transition to UIGestureRecognizerStateFailed
// subclasses may override to prevent recognition of particular gestures. for example, UISlider prevents swipes parallel to the slider that start in the thumb
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer API_AVAILABLE(ios(6.0));

@end
    


/// 提供了添加动态效果（motion effect）的方法，使得视图在设备运动时可以产生视差效果，从而增加视图的交互性和可玩性。通过添加不同的动态效果，可以为应用程序提供更加生动的交互体验。常用的动态效果包括视差效果（parallax effect）、旋转效果（tilt effect）等等
@interface UIView (UIViewMotionEffects)

/*! Begins applying `effect` to the receiver. The effect's emitted keyPath/value pairs will be
    applied to the view's presentation layer.
 
    Animates the transition to the motion effect's values using the present UIView animation
    context. */
- (void)addMotionEffect:(UIMotionEffect *)effect API_AVAILABLE(ios(7.0));

/*! Stops applying `effect` to the receiver. Any affected presentation values will animate to
    their post-removal values using the present UIView animation context. */
- (void)removeMotionEffect:(UIMotionEffect *)effect API_AVAILABLE(ios(7.0));

@property (copy, nonatomic) NSArray<__kindof UIMotionEffect *> *motionEffects API_AVAILABLE(ios(7.0));

@end


//
// UIView Constraint-based Layout Support
//

typedef NS_ENUM(NSInteger, UILayoutConstraintAxis) {
    UILayoutConstraintAxisHorizontal = 0,
    UILayoutConstraintAxisVertical = 1
};

// Installing Constraints

/* A constraint is typically installed on the closest common ancestor of the views involved in the constraint.
 It is required that a constraint be installed on _a_ common ancestor of every view involved.  The numbers in a constraint are interpreted in the coordinate system of the view it is installed on.  A view is considered to be an ancestor of itself.
 在视图层次结构中安装和卸载自动布局约束。这些方法是与 Auto Layout 相关的，允许在运行时修改视图的布局约束
 */
@interface UIView (UIConstraintBasedLayoutInstallingConstraints)

@property(nonatomic,readonly) NSArray<__kindof NSLayoutConstraint *> *constraints API_AVAILABLE(ios(6.0));

- (void)addConstraint:(NSLayoutConstraint *)constraint API_AVAILABLE(ios(6.0)); // This method will be deprecated in a future release and should be avoided.  Instead, set NSLayoutConstraint's active property to YES.
- (void)addConstraints:(NSArray<__kindof NSLayoutConstraint *> *)constraints API_AVAILABLE(ios(6.0)); // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint activateConstraints:].
- (void)removeConstraint:(NSLayoutConstraint *)constraint API_AVAILABLE(ios(6.0)); // This method will be deprecated in a future release and should be avoided.  Instead set NSLayoutConstraint's active property to NO.
- (void)removeConstraints:(NSArray<__kindof NSLayoutConstraint *> *)constraints API_AVAILABLE(ios(6.0)); // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint deactivateConstraints:].
@end




// Core Layout Methods

/* To render a window, the following passes will occur, if necessary.
 
 update constraints
 layout
 display
 
 Please see the conceptual documentation for a discussion of these methods.
 定义了一些在使用基于约束的布局时使用的核心方法
 */

@interface UIView (UIConstraintBasedLayoutCoreMethods)
- (void)updateConstraintsIfNeeded API_AVAILABLE(ios(6.0)); // Updates the constraints from the bottom up for the view hierarchy rooted at the receiver. UIWindow's implementation creates a layout engine if necessary first.
- (void)updateConstraints API_AVAILABLE(ios(6.0)) NS_REQUIRES_SUPER; // Override this to adjust your special constraints during a constraints update pass
- (BOOL)needsUpdateConstraints API_AVAILABLE(ios(6.0));
- (void)setNeedsUpdateConstraints API_AVAILABLE(ios(6.0));
@end




// Compatibility and Adoption  提供了一些用于兼容旧版 Auto Layout API 的方法
@interface UIView (UIConstraintBasedCompatibility)

/* By default, the autoresizing mask on a view gives rise to constraints that fully determine
 the view's position. This allows the auto layout system to track the frames of views whose
 layout is controlled manually (through -setFrame:, for example).
 When you elect to position the view using auto layout by adding your own constraints,
 you must set this property to NO. IB will do this for you.
 */
@property(nonatomic) BOOL translatesAutoresizingMaskIntoConstraints API_AVAILABLE(ios(6.0)); // Default YES

/* constraint-based layout engages lazily when someone tries to use it (e.g., adds a constraint to a view).  If you do all of your constraint set up in -updateConstraints, you might never even receive updateConstraints if no one makes a constraint.  To fix this chicken and egg problem, override this method to return YES if your view needs the window to use constraint-based layout.
 */
@property(class, nonatomic, readonly) BOOL requiresConstraintBasedLayout API_AVAILABLE(ios(6.0));

@end

// Separation of Concerns
@interface UIView (UIConstraintBasedLayoutLayering)

/* Constraints do not actually relate the frames of the views, rather they relate the "alignment rects" of views.  This is the same as the frame unless overridden by a subclass of UIView.  Alignment rects are the same as the "layout rects" shown in Interface Builder 3.  Typically the alignment rect of a view is what the end user would think of as the bounding rect around a control, omitting ornamentation like shadows and engraving lines.  The edges of the alignment rect are what is interesting to align, not the shadows and such.
 */

/* These two methods should be inverses of each other.  UIKit will call both as part of layout computation.
 They may be overridden to provide arbitrary transforms between frame and alignment rect, though the two methods must be inverses of each other.
 However, the default implementation uses -alignmentRectInsets, so just override that if it's applicable.  It's easier to get right.
 A view that displayed an image with some ornament would typically override these, because the ornamental part of an image would scale up with the size of the frame.
 Set the NSUserDefault UIViewShowAlignmentRects to YES to see alignment rects drawn.
 */
- (CGRect)alignmentRectForFrame:(CGRect)frame API_AVAILABLE(ios(6.0));
- (CGRect)frameForAlignmentRect:(CGRect)alignmentRect API_AVAILABLE(ios(6.0));

/* override this if the alignment rect is obtained from the frame by insetting each edge by a fixed amount.  This is only called by alignmentRectForFrame: and frameForAlignmentRect:.
 */
@property(nonatomic, readonly) UIEdgeInsets alignmentRectInsets API_AVAILABLE(ios(6.0));

- (UIView *)viewForBaselineLayout API_DEPRECATED("Override -viewForFirstBaselineLayout or -viewForLastBaselineLayout as appropriate, instead", ios(6.0, 9.0)) API_UNAVAILABLE(tvos);

/* -viewForFirstBaselineLayout is called by the constraints system when interpreting
 the firstBaseline attribute for a view.
    For complex custom UIView subclasses, override this method to return the text-based
 (i.e., UILabel or non-scrollable UITextView) descendant of the receiver whose first baseline
 is appropriate for alignment.
    UIView's implementation returns [self viewForLastBaselineLayout], so if the same
 descendant is appropriate for both first- and last-baseline layout you may override
 just -viewForLastBaselineLayout.
 */
@property(readonly,strong) UIView *viewForFirstBaselineLayout API_AVAILABLE(ios(9.0));

/* -viewForLastBaselineLayout is called by the constraints system when interpreting
 the lastBaseline attribute for a view.
    For complex custom UIView subclasses, override this method to return the text-based
 (i.e., UILabel or non-scrollable UITextView) descendant of the receiver whose last baseline
 is appropriate for alignment.
    UIView's implementation returns self.
 */
@property(readonly,strong) UIView *viewForLastBaselineLayout API_AVAILABLE(ios(9.0));

/* Override this method to tell the layout system that there is something it doesn't natively understand in this view, and this is how large it intrinsically is.  A typical example would be a single line text field.  The layout system does not understand text - it must just be told that there's something in the view, and that that something will take a certain amount of space if not clipped.
 
 In response, UIKit will set up constraints that specify (1) that the opaque content should not be compressed or clipped, (2) that the view prefers to hug tightly to its content.
 
 A user of a view may need to specify the priority of these constraints.  For example, by default, a push button
 -strongly wants to hug its content in the vertical direction (buttons really ought to be their natural height)
 -weakly hugs its content horizontally (extra side padding between the title and the edge of the bezel is acceptable)
 -strongly resists compressing or clipping content in both directions.
 
 However, you might have a case where you'd prefer to show all the available buttons with truncated text rather than losing some of the buttons. The truncation might only happen in portrait orientation but not in landscape, for example. In that case you'd want to setContentCompressionResistancePriority:forAxis: to (say) UILayoutPriorityDefaultLow for the horizontal axis.
 
 The default 'strong' and 'weak' priorities referred to above are UILayoutPriorityDefaultHigh and UILayoutPriorityDefaultLow.
 
 Note that not all views have an intrinsicContentSize.  UIView's default implementation is to return (UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric).  The _intrinsic_ content size is concerned only with data that is in the view itself, not in other views. Remember that you can also set constant width or height constraints on any view, and you don't need to override intrinsicContentSize if these dimensions won't be changing with changing view content.
 */
UIKIT_EXTERN const CGFloat UIViewNoIntrinsicMetric API_AVAILABLE(ios(6.0)); // -1
@property(nonatomic, readonly) CGSize intrinsicContentSize API_AVAILABLE(ios(6.0));
- (void)invalidateIntrinsicContentSize API_AVAILABLE(ios(6.0)); // call this when something changes that affects the intrinsicContentSize.  Otherwise UIKit won't notice that it changed.

- (UILayoutPriority)contentHuggingPriorityForAxis:(UILayoutConstraintAxis)axis API_AVAILABLE(ios(6.0));
- (void)setContentHuggingPriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis API_AVAILABLE(ios(6.0));

- (UILayoutPriority)contentCompressionResistancePriorityForAxis:(UILayoutConstraintAxis)axis API_AVAILABLE(ios(6.0));
- (void)setContentCompressionResistancePriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis API_AVAILABLE(ios(6.0));
@end

// Size To Fit

UIKIT_EXTERN const CGSize UILayoutFittingCompressedSize API_AVAILABLE(ios(6.0));
UIKIT_EXTERN const CGSize UILayoutFittingExpandedSize API_AVAILABLE(ios(6.0));

@interface UIView (UIConstraintBasedLayoutFittingSize)
/* The size fitting most closely to targetSize in which the receiver's subtree can be laid out while optimally satisfying the constraints. If you want the smallest possible size, pass UILayoutFittingCompressedSize; for the largest possible size, pass UILayoutFittingExpandedSize.
 Also see the comment for UILayoutPriorityFittingSizeLevel.
 */
- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize API_AVAILABLE(ios(6.0)); // Equivalent to sending -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: with UILayoutPriorityFittingSizeLevel for both priorities.
- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority API_AVAILABLE(ios(8.0));
@end

@interface UIView (UILayoutGuideSupport)

/* UILayoutGuide objects owned by the receiver.
 */
@property(nonatomic,readonly,copy) NSArray<__kindof UILayoutGuide *> *layoutGuides API_AVAILABLE(ios(9.0));

/* Adds layoutGuide to the receiver, passing the receiver in -setOwningView: to layoutGuide.
 */
- (void)addLayoutGuide:(UILayoutGuide *)layoutGuide API_AVAILABLE(ios(9.0));

/* Removes layoutGuide from the receiver, passing nil in -setOwningView: to layoutGuide.
 */
- (void)removeLayoutGuide:(UILayoutGuide *)layoutGuide API_AVAILABLE(ios(9.0));
@end

@class NSLayoutXAxisAnchor,NSLayoutYAxisAnchor,NSLayoutDimension;
@interface UIView (UIViewLayoutConstraintCreation)
/* Constraint creation conveniences. See NSLayoutAnchor.h for details.
 */
@property(nonatomic,readonly,strong) NSLayoutXAxisAnchor *leadingAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutXAxisAnchor *trailingAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutXAxisAnchor *leftAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutXAxisAnchor *rightAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutYAxisAnchor *topAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutYAxisAnchor *bottomAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutDimension *widthAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutDimension *heightAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutXAxisAnchor *centerXAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutYAxisAnchor *centerYAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutYAxisAnchor *firstBaselineAnchor API_AVAILABLE(ios(9.0));
@property(nonatomic,readonly,strong) NSLayoutYAxisAnchor *lastBaselineAnchor API_AVAILABLE(ios(9.0));

@end

// Debugging

/* Everything in this section should be used in debugging only, never in shipping code.  These methods may not exist in the future - no promises.
 */
@interface UIView (UIConstraintBasedLayoutDebugging)

/* This returns a list of all the constraints that are affecting the current location of the receiver.  The constraints do not necessarily involve the receiver, they may affect the frame indirectly.
 Pass UILayoutConstraintAxisHorizontal for the constraints affecting [self center].x and CGRectGetWidth([self bounds]), and UILayoutConstraintAxisVertical for the constraints affecting[self center].y and CGRectGetHeight([self bounds]).
 */
- (NSArray<__kindof NSLayoutConstraint *> *)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis API_AVAILABLE(ios(6.0));

/* If there aren't enough constraints in the system to uniquely determine layout, we say the layout is ambiguous.  For example, if the only constraint in the system was x = y + 100, then there are lots of different possible values for x and y.  This situation is not automatically detected by UIKit, due to performance considerations and details of the algorithm used for layout.
 The symptom of ambiguity is that views sometimes jump from place to place, or possibly are just in the wrong place.
 -hasAmbiguousLayout runs a check for whether there is another center and bounds the receiver could have that could also satisfy the constraints.
 -exerciseAmbiguousLayout does more.  It randomly changes the view layout to a different valid layout.  Making the UI jump back and forth can be helpful for figuring out where you're missing a constraint.
 */
@property(nonatomic, readonly) BOOL hasAmbiguousLayout API_AVAILABLE(ios(6.0));

- (void)exerciseAmbiguityInLayout API_AVAILABLE(ios(6.0));
@end

/* Everything in this section should be used in debugging only, never in shipping code.  These methods may not exist in the future - no promises.
 */
@interface UILayoutGuide (UIConstraintBasedLayoutDebugging)

/* This returns a list of all the constraints that are affecting the current location of the receiver.  The constraints do not necessarily involve the receiver, they may affect the frame indirectly.
 Pass UILayoutConstraintAxisHorizontal for the constraints affecting [self center].x and CGRectGetWidth([self bounds]), and UILayoutConstraintAxisVertical for the constraints affecting[self center].y and CGRectGetHeight([self bounds]).
 */
- (NSArray<__kindof NSLayoutConstraint *> *)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis API_AVAILABLE(ios(10.0));

/* If there aren't enough constraints in the system to uniquely determine layout, we say the layout is ambiguous.  For example, if the only constraint in the system was x = y + 100, then there are lots of different possible values for x and y.  This situation is not automatically detected by UIKit, due to performance considerations and details of the algorithm used for layout.
 The symptom of ambiguity is that views sometimes jump from place to place, or possibly are just in the wrong place.
 -hasAmbiguousLayout runs a check for whether there is another center and bounds the receiver could have that could also satisfy the constraints.
 */
@property(nonatomic, readonly) BOOL hasAmbiguousLayout API_AVAILABLE(ios(10.0));
@end

@interface UIView (UIStateRestoration)
@property (nullable, nonatomic, copy) NSString *restorationIdentifier API_AVAILABLE(ios(6.0));
- (void) encodeRestorableStateWithCoder:(NSCoder *)coder API_AVAILABLE(ios(6.0));
- (void) decodeRestorableStateWithCoder:(NSCoder *)coder API_AVAILABLE(ios(6.0));
@end

@interface UIView (UISnapshotting)
/*
* When requesting a snapshot, 'afterUpdates' defines whether the snapshot is representative of what's currently on screen or if you wish to include any recent changes before taking the snapshot.
 
 If called during layout from a committing transaction, snapshots occurring after the screen updates will include all changes made, regardless of when the snapshot is taken and the changes are made. For example:
 
     - (void)layoutSubviews {
         UIView *snapshot = [self snapshotViewAfterScreenUpdates:YES];
         self.alpha = 0.0;
     }
 
 The snapshot will appear to be empty since the change in alpha will be captured by the snapshot. If you need to animate the view during layout, animate the snapshot instead.

* Creating snapshots from existing snapshots (as a method to duplicate, crop or create a resizable variant) is supported. In cases where many snapshots are needed, creating a snapshot from a common superview and making subsequent snapshots from it can be more performant. Please keep in mind that if 'afterUpdates' is YES, the original snapshot is committed and any changes made to it, not the view originally snapshotted, will be included.
 */
- (nullable UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates API_AVAILABLE(ios(7.0));
- (nullable UIView *)resizableSnapshotViewFromRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates withCapInsets:(UIEdgeInsets)capInsets API_AVAILABLE(ios(7.0));  // Resizable snapshots will default to stretching the center
// Use this method to render a snapshot of the view hierarchy into the current context. Returns NO if the snapshot is missing image data, YES if the snapshot is complete. Calling this method from layoutSubviews while the current transaction is committing will capture what is currently displayed regardless if afterUpdates is YES.
- (BOOL)drawViewHierarchyInRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates API_AVAILABLE(ios(7.0));
@end

@interface UIView (DeprecatedAnimations)

/* Deprecated in iOS 13.0. Please use the block-based animation API instead. */

+ (void)beginAnimations:(nullable NSString *)animationID context:(nullable void *)context                       API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)commitAnimations                                                                                        API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationDelegate:(nullable id)delegate                                                              API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationWillStartSelector:(nullable SEL)selector                                                    API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationDidStopSelector:(nullable SEL)selector                                                      API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationDuration:(NSTimeInterval)duration                                                           API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationDelay:(NSTimeInterval)delay                                                                 API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationStartDate:(NSDate *)startDate                                                               API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationCurve:(UIViewAnimationCurve)curve                                                           API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationRepeatCount:(float)repeatCount                                                              API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationRepeatAutoreverses:(BOOL)repeatAutoreverses                                                 API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationBeginsFromCurrentState:(BOOL)fromCurrentState                                               API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));
+ (void)setAnimationTransition:(UIViewAnimationTransition)transition forView:(UIView *)view cache:(BOOL)cache   API_DEPRECATED("Use the block-based animation API instead", ios(2.0, 13.0));

@end

@interface UIView (UserInterfaceStyle)

/* Set `overrideUserInterfaceStyle` to cause this view and its subviews to have a specific `UIUserInterfaceStyle`.
 * Reading this property does not return the current `UIUserInterfaceStyle`. Use `traitCollection.userInterfaceStyle` instead.
 *
 * Whenever possible, use the `overrideUserInterfaceStyle` property on `UIViewController` instead.
 *
 * Use this property only when:
 * - You want a particular style on a single view or small view hierarchy.
 * - You want a particular style on an entire `UIWindow` and its view controllers and presentations,
 *   but don't want to force your entire application to have that style.
 *
 *  (If you do want your entire application to have a certain style, don't use this, but instead
 *   set the `UIUserInterfaceStyle" key in your Info.plist.)
 *
 * When set on an ordinary `UIView`:
 * - This property affects only the traits of this view and its subviews.
 * - It does not affect any view controllers, or any subviews that are owned by different view controllers.
 *
 * When set on a `UIWindow`:
 * - This property affects the `rootViewController` and thus the entire view controller and view hierarchy.
 * - It also affects presentations that happen inside the window.
 */
@property (nonatomic) UIUserInterfaceStyle overrideUserInterfaceStyle API_AVAILABLE(ios(13.0), tvos(13.0)) API_UNAVAILABLE(watchos);

@end


@interface UIView (UIContentSizeCategoryLimit)

/// Specify content size category limits. Setting one or both of these properties will limit the
/// content size category for this view (and its subviews) to a minimum or a maximum value.
/// You can use this to limit the support content size categories on part of your view hierarchy.
/// Setting this to nil removes the limit on the minimum or maximum.
/// Limits will be applied immediately and when future content size category updates occur.
///
/// Specifying a minimum limit that is greater than the maximum limit (or vice versa) will effectively
/// only use the maximum limit.
///
/// Example:
///
///     // limit the support content size categories between .medium and .accessibilityExtraLarge (included).
///     view.minimumContentSizeCategory = UIContentSizeCategoryMedium;
///     view.maximumContentSizeCategory = UIContentSizeCategoryAccessibilityExtraLarge;

@property (nonatomic, copy, nullable) UIContentSizeCategory minimumContentSizeCategory API_AVAILABLE(ios(15.0));
@property (nonatomic, copy, nullable) UIContentSizeCategory maximumContentSizeCategory API_AVAILABLE(ios(15.0));

/// Will return a string with a log of all the superviews of this view, alongside with what
/// content size category each view has and if that view has limits applied.
/// This is for debugging purposes only.
@property (nonatomic, copy, readonly) NSString *appliedContentSizeCategoryLimitsDescription API_AVAILABLE(ios(15.0));

@end

NS_HEADER_AUDIT_END(nullability, sendability)

#else
#import <UIKitCore/UIView.h>
#endif
