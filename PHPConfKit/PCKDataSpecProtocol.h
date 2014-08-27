//
//  PCKDataSpecProtocol.h
//  This is the spec to let the client app to hold the required secret of the remote data sets.
//
//  Created by vincent on 2014/08/27.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @protocol PCKDataSpec
 This is the abstract interface to let client to maintain the request secrets.
 */
@protocol PCKDataSpec <NSObject>

@required

/*! Init with the spec array, the content of the array must follow the order required properties listed below.
 @param specArray The content of the array must follow the order required properties listed below.
 */
- (id)initWithSpecArray:(NSArray *)specArray;

@property (readonly) NSString *requestTemplate;         //! @property requestTemplate template for request URL.

@property (readonly) NSString *dataVersion;             //! @property dataVersion 資料版本

@property (readonly) NSString *sessionR0;               //! @property sessionR0 議程 - 國際會議廳
@property (readonly) NSString *sessionR2;               //! @property sessionR2 議程 - 第二會議室
@property (readonly) NSString *venueMap;                //! @property venueMap 會場地圖

@property (readonly) NSString *sponsorGold;             //! @property sponsorGold 贊助 - 黃金級
@property (readonly) NSString *sponsorSilver;           //! @property sponsorSilver 贊助 - 白銀級
@property (readonly) NSString *sponsorDiamond;          //! @property sponsorDiamond 贊助 - 鑽石級
@property (readonly) NSString *sponsorSpecialThanks;    //! @property sponsorSpecialThanks 贊助 - 特別感謝

@property (readonly) NSString *confBulletin;            //! @property confBulletin Conf - 公告
@property (readonly) NSString *confAbout;               //! @property confAbout Conf - 關於
@property (readonly) NSString *confTeam;                //! @property confTeam Conf - 工作人員
@property (readonly) NSString *appTeam;                 //! @property appTeam Conf - App Team

@end
