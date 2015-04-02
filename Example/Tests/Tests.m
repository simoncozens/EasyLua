//
//  EasyLuaTests.m
//  EasyLuaTests
//
//  Created by David Holtkamp on 03/30/2015.
//  Copyright (c) 2014 David Holtkamp. All rights reserved.
//

#import "EasyLua.h"
#import "ObjCTest.h"

SpecBegin(EasyLua)


describe(@"EasyLua Tests", ^{
    
    beforeAll(^
    {
        EasyLua* instance = [EasyLua sharedEasyLua];
        expect(instance).notTo.equal(nil);
        [instance runLuaBundleFile:@"LuaTest"];
    });
    
    
    it(@"can run string", ^{
        [ObjCTest setLastTestState:false];
        [[EasyLua sharedEasyLua] runLuaString:@"SetTestValue(true)"];
        expect([ObjCTest getLastTestState]).equal(true);
        [[EasyLua sharedEasyLua] runLuaString:@"SetTestValue(false)"];
        expect([ObjCTest getLastTestState]).equal(false);
    });
    
    it(@"can handle strings", ^{
        [ObjCTest setLastTestState:false];
        [[EasyLua sharedEasyLua] runLuaString:@"TestStrings()"];
        expect([ObjCTest getLastTestState]).equal(true);
    });
    
    it(@"can handle bools", ^{
        [ObjCTest setLastTestState:false];
        [[EasyLua sharedEasyLua] runLuaString:@"TestGettingBool()"];
        expect([ObjCTest getLastTestState]).equal(true);
    });
    
    it(@"can interpret bool types", ^{
        [ObjCTest setLastTestState:false];
        [[EasyLua sharedEasyLua] runLuaString:@"TestBoolTypes()"];
        expect([ObjCTest getLastTestState]).equal(true);
    });
    
    
    
    
    it(@"We can call into Lua", ^{
        
        [[EasyLua sharedEasyLua] callVoidReturningLuaFunction:@"TestVoidFunction" withArguments:@[@"TestString", @124.2, [NSNumber numberWithBool:true]]];
        bool b_val = [[EasyLua sharedEasyLua] callBoolReturningLuaFunction:@"TestBoolFunction" withArguments:@[@"TestString", @124.2, [NSNumber numberWithBool:true]]];
        double d_val = [[EasyLua sharedEasyLua] callNumberReturningLuaFunction:@"TestNumberFunction" withArguments:@[@"TestString", @124.2, [NSNumber numberWithBool:true]]];
        NSString* s_val = [[EasyLua sharedEasyLua] callStringReturningLuaFunction:@"TestStringFunction" withArguments:@[@"TestString", @124.2, [NSNumber numberWithBool:true]]];
        
        expect(d_val).to.equal(124.2);
        expect(b_val).to.equal(true);
        expect([s_val isEqualToString:@"TestString"]).equal(true);
    });
    
});

SpecEnd
