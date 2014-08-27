//
//  PCKDataSpecProtocol.h
//  This is the spec to let the client app to hold the required secret of the remote data sets.
//
//  Created by vincent on 2014/08/27.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PCKDataSpec <NSObject>

@required

/*! Init with the spec array, the content of the array must follow the order required properties listed below.
 */
- (id)initWithSpecArray:(NSArray *)specArray;

@property (readonly) NSString *requestTemplate;         //! @property Request URL Template

@property (readonly) NSString *dataVersion;             //! @property 資料版本

@property (readonly) NSString *sessionR0;               //! @property 議程 - 國際會議廳
@property (readonly) NSString *sessionR2;               //! @property 議程 - 第二會議室
@property (readonly) NSString *venueMap;                //! @property 會場地圖

@property (readonly) NSString *sponsorGold;             //! @property 贊助 - 黃金級
@property (readonly) NSString *sponsorSilver;           //! @property 贊助 - 白銀級
@property (readonly) NSString *sponsorDiamond;          //! @property 贊助 - 鑽石級
@property (readonly) NSString *sponsorSpecialThanks;    //! @property 贊助 - 特別感謝

@property (readonly) NSString *confBulletin;            //! @property Conf - 公告
@property (readonly) NSString *confAbout;               //! @property Conf - 關於
@property (readonly) NSString *confTeam;                //! @property Conf - 工作人員
@property (readonly) NSString *appTeam;                 //! @property Conf - App Team

@end
