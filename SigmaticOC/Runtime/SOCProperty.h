#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SOCPropertyType) {
    SOCPropertyTypePrimitive,
    SOCPropertyTypeStruct,
    SOCPropertyTypeSelector,
    SOCPropertyTypeClass,
    SOCPropertyTypeFunction,
    SOCPropertyTypeObject
};

typedef NS_ENUM(NSInteger, SOCPrimitiveType) {
    SOCPrimitiveTypeUnknown,
    SOCPrimitiveTypeChar,
    SOCPrimitiveTypeUChar,
    SOCPrimitiveTypeBool,
    SOCPrimitiveTypeInt,
    SOCPrimitiveTypeUInt,
    SOCPrimitiveTypeLong,
    SOCPrimitiveTypeULong,
    SOCPrimitiveTypeLongLong,
    SOCPrimitiveTypeULongLong,
    SOCPrimitiveTypeDouble,
    SOCPrimitiveTypeFloat,
    SOCPrimitiveTypeShort,
    SOCPrimitiveTypeUShort
};

@interface SOCProperty : NSObject

@property(nonatomic) SOCPropertyType propertyType;

@property(nonatomic) NSString *name;

@property(nonatomic) Class objectClass;

@property(nonatomic) SOCPrimitiveType primitiveType;

@property(nonatomic) NSString *structName;
@property(nonatomic) NSArray *structDefinition;

@property(nonatomic) NSArray *protocols;

@property(nonatomic) BOOL isMutable;

@property(nonatomic) BOOL isReadOnly;

@property(nonatomic) BOOL isCopying;

@property(nonatomic) BOOL isNonatomic;

@property(nonatomic) BOOL isWeak;

@property(nonatomic) NSString *iVarName;

@property(nonatomic) NSString *customGetter;
@property(nonatomic, readonly) SEL getter;

@property(nonatomic) NSString *customSetter;
@property(nonatomic, readonly) SEL setter;

@property(nonatomic) Class sourceClass;

- (BOOL)setValueTo:(id)newValue onObject:(id)object;

- (id)getValueFrom:(id)object;

@end