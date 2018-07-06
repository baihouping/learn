//
//  ViewController.m
//  排版相关的知识
//
//  Created by 曹欣宗 on 2018/7/6.
//  Copyright © 2018年 com.xin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSTextContainer *textContainer;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSString *textString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textString = @"我们我们IsIII哈哈III";
    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 100.0);
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:self.textString];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    self.textContainer = [[NSTextContainer alloc] initWithSize:textViewRect.size];
    [layoutManager addTextContainer:self.textContainer];
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewRect textContainer:self.textContainer];
    [self.view addSubview:textView];
    [textStorage beginEditing];
    NSDictionary *attrsDic = @{NSTextEffectAttributeName:NSTextEffectLetterpressStyle};
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.textString attributes:attrsDic];
    [textStorage setAttributedString:attrStr];
    [self markWord:@"我" inTextStorage:textStorage];
    [self markWord:@"I" inTextStorage:textStorage];
    [textStorage endEditing];
}

- (void)markWord:(NSString *)word inTextStorage:(NSTextStorage *)textStorage {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:word options:0 error:nil];
    NSArray *matches = [regex matchesInString:self.textString options:0 range:NSMakeRange(0, self.textString.length)];
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        [textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:matchRange];
    }
}


@end
