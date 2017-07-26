//
//  CAAddAddressBookController.h
//  Smobiler
//
//  Created by zzx on 16/9/6.
//
//

#ifndef Smobiler_CAAddAddressBook_h
#define Smobiler_CAAddAddressBook_h

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

@interface addressBookHelper : NSObject<UINavigationControllerDelegate, ABNewPersonViewControllerDelegate>
{
    UIStatusBarStyle _UIStatusBarStyle;
}
@property (nonatomic, copy) RCTResponseSenderBlock mCallback;

// 添加联系人
// name 　　　　-> 联系人姓名
// phoneNum    -> 电话号码
// email　　　　-> email
- (void)addContactName:(NSString*)name phoneNum:(NSString*)num withLabel:(NSString*)email callback:(RCTResponseSenderBlock)callback;

@end
#endif
