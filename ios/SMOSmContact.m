
#import "SMOSmContact.h"
#import "SMOSmAddAddressBookController.h"

@implementation SMOSmContact

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()


      
RCT_EXPORT_METHOD(addContact:(NSDictionary *)params callback:(RCTResponseSenderBlock)callback)
{
  //addContact 实现, 需要回传结果用callback(@[XXX]), 数组参数里面就一个NSDictionary元素即可
    
    NSString * phone = @"";
    NSString * name = @"";
    NSString * email = @"";
    
    if(params[@"phone"]){
        phone = params[@"phone"];
    }
    if(params[@"name"]){
        name = params[@"name"];
    }
    if(params[@"email"]){
        email = params[@"email"];
    }
    
    static addressBookHelper *contact = nil;
    if(!contact){
        contact = [[addressBookHelper alloc] init];
    }
    [contact addContactName:name phoneNum:phone withLabel:email callback:callback];
}

@end
  
