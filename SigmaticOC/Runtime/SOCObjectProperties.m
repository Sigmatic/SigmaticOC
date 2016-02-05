#import "SOCObjectProperties.h"
#import "SOCProperty.h"
#import "SOCStringExtension.h"
#import <objc/runtime.h>

static NSMutableDictionary *existingClassPropertiesMap;
static NSDictionary *internalPrimitiveTypesMap;

@implementation SOCObjectProperties


+ (NSArray *)getClassProperties:(Class)aClass {
    if (aClass == [NSObject class]) {
        return [NSArray new];
    }
    NSString *className = NSStringFromClass(aClass);
    NSArray *existingProperties = [self classPropertiesMap][className];
    if (existingProperties == nil) {
        existingProperties = [self generatePropertiesForClass:aClass];
        [self classPropertiesMap][className] = existingProperties;
    }
    return existingProperties;
}

+ (NSArray *)generatePropertiesForClass:(Class)aClass {
    NSMutableArray *allProperties = [NSMutableArray new];
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList(aClass, &propertyCount);
    for (unsigned int i = 0; i < propertyCount; i++) {
        objc_property_t property = properties[i];
        SOCProperty *newProperty = [[SOCProperty alloc] init];
        const char *propertyName = property_getName(property);
        newProperty.name = @(propertyName);
        const char *cAttributes = property_getAttributes(property);
        NSString *attributesString = @(cAttributes);
        NSArray *attributesSplits = [attributesString componentsSeparatedByString:@","];
        newProperty.isReadOnly = [self isPropertyReadOnly:attributesSplits];
        newProperty.iVarName = [self iVarName:attributesSplits];
        newProperty.customGetter = [self customGetter:attributesSplits];
        newProperty.customSetter = [self customSetter:attributesSplits];
        newProperty.isNonatomic = [self isNonAtomic:attributesSplits];
        newProperty.isCopying = [self isCopying:attributesSplits];
        newProperty.isWeak = [self isWeaklyReferenced:attributesSplits];
        NSString *typeAttribute = [self typeAttribute:attributesSplits];
        newProperty.propertyType = [self typeForAttribute:typeAttribute];

        if (newProperty.propertyType == SOCPropertyTypeObject) {
            NSString *className = [self classNameFromTypeAttribute:typeAttribute];
            newProperty.objectClass = NSClassFromString(className);
            newProperty.isMutable = [self isMutableProperty:className];
            newProperty.protocols = [self protocolsFromTypeAttribute:typeAttribute];
        } else if (newProperty.propertyType == SOCPropertyTypeStruct) {
            newProperty.structName = [self structNameFromTypeAttribute:typeAttribute];
            newProperty.structDefinition = [self structDefinitionsFromTypeAttribute:typeAttribute];
        } else if (newProperty.propertyType == SOCPropertyTypePrimitive) {
            newProperty.primitiveType = [self primitiveTypeFromTypeAttribute:typeAttribute];
        }
        [allProperties addObject:newProperty];
    }
    free(properties);
    NSArray *superclassProperties = [self getClassProperties:[aClass superclass]];
    return [allProperties arrayByAddingObjectsFromArray:superclassProperties];
}

+ (SOCPrimitiveType)primitiveTypeFromTypeAttribute:(NSString *)attribute {
    NSString *primitiveTypeChar = [attribute substringFromIndex:1];
    return [self primitiveTypesMapForCharacter:primitiveTypeChar];
}

+ (NSString *)structNameFromTypeAttribute:(NSString *)attribute {
    NSString *structNameBegin = [attribute substringFromIndex:2];
    NSScanner *scanner = [NSScanner scannerWithString:structNameBegin];
    NSString *structName = nil;
    [scanner scanCharactersFromSet:[NSCharacterSet alphanumericCharacterSet]
                        intoString:&structName];
    return structName;
}

+ (NSArray *)structDefinitionsFromTypeAttribute:(NSString *)attribute {
    NSScanner *scanner = [NSScanner scannerWithString:attribute];
    [scanner scanUpToString:@"=" intoString:NULL];
    [scanner scanString:@"=" intoString:NULL];
    NSString *primitivesString = nil;
    [scanner scanUpToString:@"}" intoString:&primitivesString];
    NSMutableArray *primitives = [[NSMutableArray alloc] initWithCapacity:primitivesString.length];
    [primitivesString forEachCharacter:^(NSString *character) {
        [primitives addObject:@([self primitiveTypesMapForCharacter:character])];
    }];
    return primitives;
}

+ (NSArray *)protocolsFromTypeAttribute:(NSString *)attribute {
    NSString *classNameAndProtocols = [self extractClassNameAndProtocolsString:attribute];
    NSScanner *scanner = [NSScanner scannerWithString:classNameAndProtocols];
    NSMutableArray *protocols = [NSMutableArray new];
    while ([scanner scanString:@"<" intoString:NULL]) {
        NSString *protocolName = nil;
        [scanner scanUpToString:@">" intoString:&protocolName];
        [protocols addObject:NSProtocolFromString(protocolName)];
        [scanner scanString:@">" intoString:NULL];
    }
    return protocols;
}

+ (NSString *)classNameFromTypeAttribute:(NSString *)attribute {
    NSString *classNameAndProtocols = [self extractClassNameAndProtocolsString:attribute];
    NSScanner *scanner = [NSScanner scannerWithString:classNameAndProtocols];
    NSString *className = nil;
    [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"\"<"] intoString:&className];
    return className;
}

+ (NSString *)extractClassNameAndProtocolsString:(NSString *)attribute {
    NSString *classNameAndProtocols = [attribute substringFromIndex:3];
    return classNameAndProtocols;
}

+ (BOOL)isMutableProperty:(NSString *)propertyType {
    return [propertyType contains:@"Mutable"];
}

+ (BOOL)isPropertyReadOnly:(NSArray *)attributes {
    return [attributes containsObject:@"R"];
}

+ (NSMutableDictionary *)classPropertiesMap {
    if (existingClassPropertiesMap == nil) {
        existingClassPropertiesMap = [NSMutableDictionary new];
    }
    return existingClassPropertiesMap;
}

+ (SOCPrimitiveType)primitiveTypesMapForCharacter:(NSString *)character {
    NSNumber *type = [self primitiveTypesMap][character];
    if (type) {
        return (SOCPrimitiveType) type.integerValue;
    }
    return SOCPrimitiveTypeUnknown;
}

+ (NSDictionary *)primitiveTypesMap {
    if (internalPrimitiveTypesMap == nil) {
        internalPrimitiveTypesMap = @{@"c" : @(SOCPrimitiveTypeChar),
                @"C" : @(SOCPrimitiveTypeUChar),
                @"B" : @(SOCPrimitiveTypeBool),
                @"i" : @(SOCPrimitiveTypeInt),
                @"I" : @(SOCPrimitiveTypeUInt),
                @"l" : @(SOCPrimitiveTypeLong),
                @"L" : @(SOCPrimitiveTypeULong),
                @"q" : @(SOCPrimitiveTypeLongLong),
                @"Q" : @(SOCPrimitiveTypeULongLong),
                @"d" : @(SOCPrimitiveTypeDouble),
                @"f" : @(SOCPrimitiveTypeFloat),
                @"s" : @(SOCPrimitiveTypeShort),
                @"S" : @(SOCPrimitiveTypeUShort)};
    }
    return internalPrimitiveTypesMap;
}

+ (NSString *)iVarName:(NSArray *)attributes {
    for (NSString *attribute in attributes) {
        if ([attribute hasPrefix:@"V"]) {
            return [attribute substringFromIndex:1];
        }
    }
    return nil;
}

+ (NSString *)customSetter:(NSArray *)attributes {
    for (NSString *attribute in attributes) {
        if ([attribute hasPrefix:@"S"]) {
            return [attribute substringFromIndex:1];
        }
    }
    return nil;
}

+ (NSString *)customGetter:(NSArray *)attributes {
    for (NSString *attribute in attributes) {
        if ([attribute hasPrefix:@"G"]) {
            return [attribute substringFromIndex:1];
        }
    }
    return nil;
}

+ (SOCPropertyType)typeForAttribute:(NSString *)attribute {
    if ([attribute hasPrefix:@"T@?"]) {
        return SOCPropertyTypeFunction;
    } else if ([attribute hasPrefix:@"T@"]) {
        return SOCPropertyTypeObject;
    } else if ([attribute hasPrefix:@"T:"]) {
        return SOCPropertyTypeSelector;
    } else if ([attribute hasPrefix:@"T#"]) {
        return SOCPropertyTypeClass;
    } else if ([attribute hasPrefix:@"T{"]) {
        return SOCPropertyTypeStruct;
    }
    return SOCPropertyTypePrimitive;
}

+ (BOOL)isCopying:(NSArray *)attributes {
    return [attributes containsObject:@"C"];
}

+ (BOOL)isNonAtomic:(NSArray *)attributes {
    return [attributes containsObject:@"N"];
}

+ (BOOL)isWeaklyReferenced:(NSArray *)attributes {
    return [attributes containsObject:@"W"];
}

+ (NSString *)typeAttribute:(NSArray *)attributes {
    for (NSString *attribute in attributes) {
        if ([attribute hasPrefix:@"T"]) {
            return attribute;
        }
    }
    return nil;
}

@end