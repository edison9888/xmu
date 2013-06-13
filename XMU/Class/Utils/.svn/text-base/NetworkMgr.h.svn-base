//
//  NetworkMgr.h
//  AiCamera
//
//  Created by linxg on 12-12-11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CodecDelegate.h"
#import "NetworkModel.h"

@class ASIHTTPRequest;
@class ASIFormDataRequest;
@class ASINetworkQueue;

#define KNetworkMgrNotificationStart(s) [@"kNetworkMgrNotificationStart-" stringByAppendingString:keyMaker(s, nil)]
#define kNetworkMgrNotificationSuccess(s) [@"kNetworkMgrNotificationSuccess-" stringByAppendingString:keyMaker(s, nil)]
#define kNetworkMgrNotificationFailed(s) [@"kNetworkMgrNotificationFailed-" stringByAppendingString:keyMaker(s, nil)]


typedef enum
{
	ENetworkMgrUTF8Encoding = 0,
	ENetworkMgrGb2312Encoding,
	ENetworkMgrReservrEncoding
} NetworkMgrEncoding;

/*
 * NetworkObserver 网络层托管协议
 * 
 * GetSuccess网络请求成功调用，GetFailed网络请求失败是调用
 *
 **/
@protocol NetworkObserver <NSObject>

/*
 * 输入：无
 * 输出：无
 * 参数：notification
 * NetworkModel *data =	[[notification userInfo] objectForKey:@"data"];
 **/
- (void) GetStart:(NSNotification *)notification;

/*
 * 输入：无
 * 输出：无
 * 参数：notification
 * NetworkModel *data =	[[notification userInfo] objectForKey:@"data"];
 **/
- (void) GetSuccess:(NSNotification *)notification;


/*
 * 输入：无
 * 输出：无
 * 参数：notification
 * NetworkModel *data =	[[notification userInfo] objectForKey:@"data"];
 **/
- (void) GetFailed:(NSNotification *)notification;

@end


/*
 * NetworkMgr 网络层
 * 
 * 通过封装asihttprequst实现异步加载，
 * get请求参数封装 http://host:port/action?a=1&b=2&c=3
 * post请求参数封装 url：http://host:port/action?{"a":"1", "b":"2", "c","3"}
 **/

@interface NetworkMgr : NSObject {
	
	ASINetworkQueue *_queue;
	NSMutableArray *_notifications;
	NSTimeInterval _maxAge;

	//缺省字符编码为ENetworkMgrUTF8Encoding
	NSInteger _encoding;
	
	//缺省编码、编码模块
	id <CodecDelegate> _codec;
	
}

/*
 * 缓存时间，单位秒
 **/
@property (nonatomic)NSTimeInterval maxAge;


/*
 * 字符编码，NetworkMgrEncoding
 **/
@property (nonatomic)NSInteger encoding;


/*
 * 描述：获取网络模块实例
 * 输入：无
 * 输出：NetworkMgr实例
 **/
+ (NetworkMgr *) sharedInstance;

/*
 * 描述：释放网络模块实例
 * 输入：无
 * 输出：无
 **/
+ (void) releaseInstance;


/*
 * 描述：get网络请求
 * 输入：t_url：服务器地址， param：json参数， observer：观者者指针实现NetworkObserver协议， flag：NSString标志， cache：是否取缓存数据
 * 输出：返回1
 **/
- (NSInteger) Get:(NSString *)t_url 
			param:(NSDictionary *)param 
		 observer:(id)observer
			 flag:(id)flag
		cache:(BOOL)cache;

/*
 * 描述：post网络请求
 * 输入：t_url：服务器地址， param：json参数， observer：观者者指针实现NetworkObserver协议， flag：NSString标志， cache：是否取缓存数据
 * 输出：返回1
 **/
- (NSInteger) Post:(NSString *)t_url 
			 param:(NSDictionary *)t_param 
		  observer:(id)observer 
			  flag:(id)flag
			 cache:(BOOL)cache;


/*
 * 描述：新增网络请求
 * 输入：request：请求实例， observer：观者者指针实现NetworkObserver协议， flag：NSString标志
 * 输出：返回1
 **/
- (NSInteger) addRequest:(ASIHTTPRequest *)request observer:(id)observer flag:(id)flag;


/*
 * 描述：取消所有网络请求
 * 输入：无
 * 输出：返回1
 **/
- (NSInteger) cancelAllRequest;

/*
 * 描述：取消指定url网络请求
 * 输入：无
 * 输出：返回1
 **/
- (NSInteger) cancelRequest:(NSString *)t_url;

/*
 * 描述：是否存在网络请求
 * 输入：无
 * 输出：返回请求是否运行
 **/
- (BOOL) isRunning;

/*
 * 描述：网络是否可用
 * 输入：无
 * 输出：返回网络是否可以用
 **/
- (BOOL) isNetworkAviable;

/*
 * 描述：获取缓存数据
 * 输入：t_url：服务器地址， param：请求参数
 * 输出：缓存数据
 * 备至：顺序遍历get参数、post参数来获取是否有缓存数据
 **/
- (NSData *) cacheData:(NSString *)t_url param:(NSDictionary *)param;


/*
 * 设置缺省编码、解码方式 
 **/
- (void) setDefaultCodec:(id <CodecDelegate>)codec;

/*
 * 获取缺省编码、解码方式
 **/
- (id <CodecDelegate>) defaultCodec;

@end
