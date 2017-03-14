//
//  NSInvocationHelper.h
//  UppSnapSDK
//
//  Created by Axel Ros Campaña on 3/14/17.
//  Copyright © 2017 Axel Ros Campaña. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/MTLReflection.h>

@interface ObjHelper : NSObject

+ (id)processInvocationWithSelector:(SEL)selector;
+ (NSValueTransformer *)processValueTransformerWithModelClass:(Class)modelClass forClass:(Class)class;

@end
