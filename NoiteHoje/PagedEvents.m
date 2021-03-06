//
//  EventList.m
//  NoiteHoje-v2
//
//  Created by Felipe Lima on 11/12/12.
//  Copyright (c) 2012 Noite Hoje. All rights reserved.
//

#import "PagedEvents.h"
#import "APIWrapper.h"

@implementation PagedEvents

- (id)init
{
    self = [super init];
    if (self) {
        _currentPage = 0;
        _apiWrapper = [[APIWrapper alloc] init];
    }
    return self;
}

- (NSUInteger)getTotalEvents
{
    return self.events.count;
}

+ (PagedEvents *)firstPage:(ApiCallback)callback
{
    return [[[PagedEvents alloc] init] nextPage:callback];
}

+ (PagedEvents *)firstPage:(ApiCallback)callback andCity:(NSString *)city
{
    return [[[PagedEvents alloc] init] nextPage:callback andCity:city];
}

- (PagedEvents *)nextPage:(ApiCallback)callback andCity:(NSString *)city
{
    return [self getPage:self.currentPage + 1 callback:callback andCity:city];
}

- (PagedEvents *)nextPage:(ApiCallback)callback
{
    if(self.city) {
        return [self getPage:self.currentPage + 1 callback:callback andCity:self.city];
    }
    return [self getPage:self.currentPage + 1 callback:callback];
}

- (PagedEvents *)previousPage:(ApiCallback)callback
{
    return [self getPage:self.currentPage - 1 callback:callback];
}

- (PagedEvents *)getPage:(NSUInteger)page callback:(ApiCallback)callback andCity:(NSString *)city
{
    PagedEvents *evtList = [[PagedEvents alloc] init];
    evtList.currentPage = page;
    
    [_apiWrapper eventsWithCallback:^(NSArray *evts, NSUInteger currentPage, NSUInteger totalPages) {
        evtList.totalPages = totalPages;
        evtList.city = city;
        evtList.currentPage = currentPage;
        evtList.events = evts;
        callback(evtList);
    } page:evtList.currentPage andCity:city];
    
    return evtList;
}

- (PagedEvents *)getPage:(NSUInteger)page callback:(ApiCallback)callback
{
    PagedEvents *evtList = [[PagedEvents alloc] init];
    evtList.currentPage = page;
    
    [_apiWrapper eventsWithCallback:^(NSArray *evts, NSUInteger currentPage, NSUInteger totalPages) {
        evtList.totalPages = totalPages;
        evtList.currentPage = currentPage;
        evtList.events = evts;
        callback(evtList);
    } andPage:evtList.currentPage];
    
    return evtList;
}

- (BOOL)isLastPage
{
    return self.currentPage == self.totalPages;
}

@end