#import <Foundation/Foundation.h>
#import "SOCSampleParent.h"


struct NewStructStyle {
    BOOL someValue;
    int otherSomething;
};

@interface SOCSampleObject : SOCSampleParent

@property(nonatomic) struct NewStructStyle structStyleProperty;
@property(atomic) SEL someSelection;
@property(atomic) Class parentShitClass;
@property(nonatomic, copy) NSString *(^completion)(NSString *, NSArray *);
@property(nonatomic) BOOL normalBool;
@property(nonatomic) NSArray *anotherSArray;
@property(nonatomic, readonly) BOOL readBool;
@property(nonatomic, getter=isCustomGetterBool) BOOL customGetterBool;

@end