//
//  NetworkModel.h
//  NetworkMgr
//
//  Created by YK on 13-5-17.
//
//

#import <Foundation/Foundation.h>

@interface NetworkModel : NSObject
{
    //请求部分
    id _observer;//观察者
    BOOL _iscache;//是否缓存
    NSString *_url;//带参数url
    NSString *_urlex;//不带参数url
    NSString *_flag;//标志
    NSString *_method;//GET/POST

    
    //响应部分
    NSInteger _statusCode;//http返回值
    NSError *_error;//http返回错误
    NSString *_dataString;//返回数据，转换为字符流
    NSData *_data;//返回数据
}

@property (nonatomic, assign)id observer;//观察者
@property (nonatomic, assign)BOOL iscache;//是否缓存
@property (nonatomic, retain)NSString *url;//带参数url
@property (nonatomic, retain)NSString *urlex;//不带参数url
@property (nonatomic, retain)NSString *flag;//标志
@property (nonatomic, retain)NSString *method;//GET/POST

@property (nonatomic, assign)NSInteger statusCode;//http返回值
@property (nonatomic, retain)NSError *error;//http返回错误
@property (nonatomic, retain)NSString *dataString;//返回数据，转换为字符流
@property (nonatomic, retain)NSData *data;//返回数据

@end
