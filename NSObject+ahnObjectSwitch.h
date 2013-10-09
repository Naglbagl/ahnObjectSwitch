//
//  NSObject+ahnNSObjectSwitch.h
//  objectSwitch
//
//  Created by Alexander Nagl on 7/17/13.
//  Copyright (c) 2013 Alexander Nagl. All rights reserved.
/*
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import <Foundation/Foundation.h>

@interface NSObject (ObjectSwitch)

//Switch where you give it a bool operator it will use to compair the strings with. If it find a match it will stop compairing the rest of the objects
-(bool)switchWithBoolBlock:(bool(^)(id baseObject, id caseObject))compairBlock WithCases:(NSArray *)cases withStatements:(void(^)(id caseObject))statements,...;

//Switch where you give it a bool returning block it will use to compair the objects with. If it find a match it will add it to the return array of those objects

-(NSArray*)arraySwitchWithBoolBlock:(bool(^)(id baseObject, id caseObject))compairBlock WithCases:(NSArray *)cases withStatements:(void(^)(id caseObject))statements,...;


@end
