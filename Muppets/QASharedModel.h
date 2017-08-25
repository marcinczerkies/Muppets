//
//  QASharedModel.h
//  Soluciones
//
//  Created by Marcin Czerkies on 28/09/15.
//  Copyright © 2015 Marcin Czerkies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QASharedModel : NSObject

@property NSMutableArray* FavouritesList;


+ (QASharedModel *) qaSharedModel;
//- (void)showUserAnswers;
//- (NSString *)getAnswerUserAnswerForQuestionId:(NSUInteger)QuestionId;
//- (void)deleteFromQAListQuestionId:(NSUInteger)QuestionId;
//- (void)clear;
@end
