
//
//  CAAddAddressBookController.m
//  Smobiler
//
//  Created by zzx on 16/9/6.
//
//

#import "SMOSmAddAddressBookController.h"
#import <AddressBook/AddressBook.h>

@interface addressBookHelper ()
{
}
@end

@implementation addressBookHelper

// 添加联系人（联系人名称、号码、号码备注标签）
- (void)addContactName:(NSString*)name phoneNum:(NSString*)num withLabel:(NSString*)email callback:(RCTResponseSenderBlock)callback
{
    _mCallback = callback;
    // 创建一条空的联系人
    ABRecordRef record = ABPersonCreate();
    CFErrorRef error;
    // 设置联系人的名字
    ABRecordSetValue(record, kABPersonLastNameProperty, (__bridge CFTypeRef)name, &error);
    // 添加联系人电话号码以及该号码对应的标签名
    ABMutableMultiValueRef multi = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(multi, (__bridge CFTypeRef)num, kABPersonPhoneMobileLabel, NULL);
    ABRecordSetValue(record, kABPersonPhoneProperty, multi, &error);
    CFRelease(multi);
    //添加email及对应的标签名
    if(email.length > 0)
    {
        ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)email, kABWorkLabel, NULL);
        ABRecordSetValue(record, kABPersonEmailProperty, multiEmail, &error);
        CFRelease(multiEmail);
    }
    
    ABNewPersonViewController* controller = [[ABNewPersonViewController alloc] init];
    controller.displayedPerson = record;
    controller.newPersonViewDelegate = self;
    UINavigationController *newNavigationController = [[UINavigationController alloc]
                                                       initWithRootViewController:controller];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:newNavigationController animated:YES completion:nil];
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    
    //设置状态栏颜色
    _UIStatusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(nullable ABRecordRef)person
{
    if(person){
        _mCallback(@[@{@"success":@true}]);
    }else{   //取消
        _mCallback(@[@{@"success":@false}]);
    }
    [[UIApplication sharedApplication] setStatusBarStyle:_UIStatusBarStyle];
    [newPersonView dismissViewControllerAnimated:YES completion:nil];
}

@end
