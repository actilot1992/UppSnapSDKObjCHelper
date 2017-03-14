
//
//  NSInvocationHelper.m
//  UppSnapSDK
//
//  Created by Axel Ros Campaña on 3/14/17.
//  Copyright © 2017 Axel Ros Campaña. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjcHelper.h"
#import <Mantle/MTLReflection.h>


@implementation ObjHelper

+ (id)processInvocationWithSelector:(SEL)selector {
    NSInvocation *invocation = [NSInvocation
                                invocationWithMethodSignature:[self.class methodSignatureForSelector:selector]];
    invocation.target = self.class;
    invocation.selector = selector;
    [invocation invoke];
    
    __unsafe_unretained id result = nil;
    [invocation getReturnValue:&result];
    return result;
    
}

+ (NSValueTransformer *)processValueTransformerWithModelClass:(Class)modelClass forClass:(Class)class {
    NSParameterAssert(modelClass != nil);
    
    NSString *classString = NSStringFromClass(modelClass);
    NSArray *parts = [classString componentsSeparatedByString:@"."];
    
    SEL selector = MTLSelectorWithKeyPattern(parts.firstObject, "JSONTransformer");
    if (![class respondsToSelector:selector]) return nil;
    
    IMP imp = [class methodForSelector:selector];
    NSValueTransformer * (*function)(id, SEL) = (__typeof__(function))imp;
    NSValueTransformer *result = function(self, selector);
    
    return result;
}

@end
