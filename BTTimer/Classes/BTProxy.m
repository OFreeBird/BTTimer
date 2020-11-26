//
//  BTProxy.m
//  BTTimer
//
//  Created by joly on 2020/11/25.
//

#import "BTProxy.h"
#import <objc/message.h>

@interface BTProxy()
@property(nonatomic,weak) id object;
@end

@implementation BTProxy

+ (instancetype)proxyWithTransformObject:(id)object {
    
    BTProxy * proxy = [BTProxy alloc];
    proxy.object = object;
    
    return proxy;
}

-(id)forwardingTargetForSelector:(SEL)aSelector {
    return self.object;
}

//// sel - imp -
//// 消息转发 self.object
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
//
//    if (self.object) {
//    }else{
//        NSLog(@"麻烦收集 stack111");
//    }
//    return [self.object methodSignatureForSelector:sel];
//
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation{
//
//    if (self.object) {
//        [invocation invokeWithTarget:self.object];
//    }else{
//        NSLog(@"麻烦收集 stack");
//    }
//
//}

@end
