//
//  NSObject+ahnNSObjectSwitch.m
//  objectSwitch
//
//  Created by Alexander Nagl on 7/17/13.
//  Copyright (c) 2013 Alexander Nagl.
/*
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "NSObject+ahnObjectSwitch.h"


@implementation NSObject (ObjectSwitch)



-(bool)switchWithBoolBlock:(bool(^)(id baseObject, id caseObject))compairBlock WithCases:(NSArray *)cases withStatements:(void(^)(id caseObject))statements,...{
    
    void (^eachBlock)(id caseObject);
    va_list argumentList;
    
    if (statements && cases.count > 0){
        if (compairBlock(self, [cases objectAtIndex:0])){
            statements([cases objectAtIndex:0]);
            return YES;
        }
    }
    
    va_start(argumentList, statements);
    for (int i = 1; i < cases.count && (eachBlock = va_arg(argumentList, void(^)(id caseObject))); i++){
        if (compairBlock(self,[cases objectAtIndex:i])){
            eachBlock([cases objectAtIndex:i]);
            return YES;
        }
        
        va_end(argumentList);
        
    }
    return NO;
}


-(NSArray*)arraySwitchWithBoolBlock:(bool(^)(id baseObject, id caseObject))compairBlock WithCases:(NSArray *)cases withStatements:(void(^)(id caseObject))statements,...{
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    
    void (^eachBlock)(NSString *caseString);
    va_list argumentList;
    
    if (statements && cases.count > 0){
        if (compairBlock(self, [cases objectAtIndex:0])){
            statements([cases objectAtIndex:0]);
            [array addObject:[cases objectAtIndex:0]];
        }
    }
    
    va_start(argumentList, statements);
    for (int i = 0; i < cases.count && (eachBlock = va_arg(argumentList, void(^)(id caseObject))); i++){
        if (compairBlock(self,[cases objectAtIndex:i])){
            eachBlock([cases objectAtIndex:i]);
            [array addObject:[cases objectAtIndex:i]];
        }
        
        va_end(argumentList);
        
    }
    NSArray *returnArray = [[[NSArray alloc]initWithArray:array]autorelease];
    [array release];
    
    return returnArray;
}



@end
