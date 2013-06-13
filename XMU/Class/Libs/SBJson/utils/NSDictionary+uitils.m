//
//  NSDictionary+uitils.m
//  AiCamera
//
//  Created by linxg on 12-12-12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+uitils.h"
#import "SBJson.h"


@implementation NSDictionary (utils)

- (NSData *) jsonData
{
	NSString *str = [self jsonString];
	NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
	return data;
}

- (NSString *) jsonString
{
	return [self JSONRepresentation];
}

+ (NSDictionary *) dictionaryWithJsonData:(NSData *)jdata
{
	SBJsonParser *jsonParser = [[[SBJsonParser alloc]init] autorelease];
	NSDictionary *t_dic = [jsonParser objectWithData:jdata];
	return t_dic;
}

+ (NSDictionary *) dictionaryWithJsonString:(NSString *)jstr
{
	SBJsonParser *jsonParser = [[[SBJsonParser alloc]init] autorelease];
	NSDictionary *t_dic = [jsonParser objectWithString:jstr];
	return t_dic;
}

@end
