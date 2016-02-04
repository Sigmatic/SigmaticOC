#import <Foundation/Foundation.h>
#import "SOCSampleParent.h"


struct NewStructStyle {
    BOOL someValue;
    int otherSomething;
};

NS_ASSUME_NONNULL_BEGIN

@interface SOCSampleObject : SOCSampleParent

@property(nonatomic) struct NewStructStyle structStyleProperty;
@property(atomic, nullable) SEL someSelection;
@property(atomic, nullable) Class parentShitClass;
@property(nonatomic, copy) NSString *(^completion)(NSString *, NSArray *);
@property(nonatomic) BOOL normalBool;
@property(nonatomic) NSArray *anotherSArray;
@property(nonatomic, readonly) BOOL readBool;
@property(nonatomic, getter=isCustomGetterBool) BOOL customGetterBool;

NS_ASSUME_NONNULL_END

@end