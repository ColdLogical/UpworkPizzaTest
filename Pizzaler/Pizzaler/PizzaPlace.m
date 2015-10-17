//
//  PizzaPlace.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PizzaPlace.h"

@implementation PizzaPlace

//Example JSON Dictionary:
/*
{
        "eniroId": "14873025",
        "companyInfo": {
                "companyName": "Patricias Pizzeria",
                "orgNumber": "9697429851",
                "companyText": "Pizzor med Ã¤kta italienska rÃ¥varor. Lunchservering varje vardag. AvhÃ¤mtning och utkÃ¶rning till..."
        },
        "address": {
                "streetName": "Sveav. 8",
                "postCode": "692 30",
                "postArea": "KUMLA",
                "postBox": null
        },
        "location": {
                "coordinates": [
                                {
                                        "longitude": 15.1429787,
                                        "latitude": 59.1256764
                                },
                                {
                                        "use": "route",
                                        "longitude": 15.1429787,
                                        "latitude": 59.1256764
                                }
                                ]
        },
        "phoneNumbers": [
                         {
                                 "type": "std",
                                 "phoneNumber": "019 - 58 15 10",
                                 "label": null
                         }
                         ],
        "companyReviews": "http://www.rejta.se/omdome/681256/pizza",
        "homepage": "http://api.eniro.com/proxy/homepage/uANwPf5aVK2jvHRqZb4lSKH3eZNTZkKMhblZAytu_jJEaWl6ODDqeOnECqxafdz_5W4DHVHqLj_iMiIKYHRcuQ==",
        "facebook": null,
        "infoPageLink": "http://gulasidorna.eniro.se/f/patricias-pizzeria:14873025?search_word=pizza"
}
*/

-(void)updateWithDictionary:(NSDictionary *)dictionary {
        NSDictionary *companyInfoDictionary = dictionary[@"companyInfo"];
        if(companyInfoDictionary) {
                NSString *name = companyInfoDictionary[@"companyName"];
                if(name && ![name isEqual:[NSNull null]]) {
                        self.name = name;
                }
                
                NSString *companyText = companyInfoDictionary[@"companyText"];
                if(companyText && ![companyText isEqual:[NSNull null]]) {
                        self.companyText = companyText ;
                }
        }
        
        NSDictionary *addressDictionary = dictionary[@"address"];
        if(addressDictionary) {
                NSMutableString *address = [NSMutableString new];
                
                NSString *streetName = addressDictionary[@"streetName"] ? : nil;
                if(streetName && ![streetName isEqual:[NSNull null]]) {
                        [address appendString:streetName];
                }
                
                NSString *postCode = addressDictionary[@"postCode"] ? : nil;
                if(postCode && ![postCode isEqual:[NSNull null]]) {
                        [address appendString:@" "];
                        [address appendString:postCode];
                }
                
                NSString *postArea = addressDictionary[@"postArea"] ? : nil;
                if(postArea && ![postArea isEqual:[NSNull null]]) {
                        [address appendString:@" "];
                        [address appendString:postArea];
                }
                
                NSString *postBox = addressDictionary[@"postBox"] ? : nil;
                if(postBox && ![postBox isEqual:[NSNull null]]) {
                        [address appendString:@" "];
                        [address appendString:postBox];
                }
                
                self.address = address.copy;
        }
        
        NSArray *phoneNumbersArray = dictionary[@"phoneNumbers"];
        if(phoneNumbersArray && phoneNumbersArray.count > 0) {
                NSDictionary *phoneNumberDictionary = phoneNumbersArray[0];
                if(phoneNumberDictionary) {
                        NSString *phoneNumber = phoneNumberDictionary[@"phoneNumber"];
                        if(phoneNumber && ![phoneNumber isEqual:[NSNull null]]) {
                                self.phoneNumber = phoneNumber;
                        }
                }
        }
}

@end
