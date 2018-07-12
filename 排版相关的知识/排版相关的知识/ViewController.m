//
//  ViewController.m
//  排版相关的知识
//
//  Created by 曹欣宗 on 2018/7/6.
//  Copyright © 2018年 com.xin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSTextContainer *textContainer;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSString *textString;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test1];
//    [self test2];
}

- (void)test1 {
        self.textString = @"们我们I哈哈胜利大街分手快乐京东方开始劳动局福克斯劳动局复考了世纪东方看来是绝地逢生开单啦福建省考的风景I";
        CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 100.0);
        NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:self.textString];
        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
        [textStorage addLayoutManager:layoutManager];
        self.textContainer = [[NSTextContainer alloc] initWithSize:textViewRect.size];
        [layoutManager addTextContainer:self.textContainer];
        UITextView *textView = [[UITextView alloc] initWithFrame:textViewRect textContainer:self.textContainer];
        self.textView = textView;
        [self.view addSubview:textView];
        [textStorage beginEditing];
        NSDictionary *attrsDic = @{NSTextEffectAttributeName:NSTextEffectLetterpressStyle};
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:self.textString attributes:attrsDic];
        [textStorage setAttributedString:attrStr];
        [self markWord:@"我" inTextStorage:textStorage];
        [self markWord:@"I" inTextStorage:textStorage];
        [textStorage endEditing];
}

-(void)test2 {
    NSTextStorage *storage = [[NSTextStorage alloc] initWithString:@"未选择的路-弗罗斯特\n\n黄色的树林里分出两条路，\n可惜我不能同时去涉足，\n我在那路口久久伫立，\n我向着一条路极目望去，\n直到它消失在丛林深处。\n但我却选了另外一条路，\n它荒草萋萋，十分幽寂，\n显得更诱人、更美丽，\n虽然在这两条小路上，\n都很少留下旅人的足迹，\n虽然那天清晨落叶满地，\n两条路都未经脚印污染。\n啊，留下一条路等改日再见！\n但我知道路径延绵无尽头，\n恐怕我难以再回返。\n也许多少年后在某个地方，\n我将轻声叹息把往事回顾，\n一片树林里分出两条路，\n而我选了人迹更少的一条，\n从此决定了我一生的道路。"];
    // 高亮容器里面的某些内容
    [storage addAttribute:NSForegroundColorAttributeName
                    value:[UIColor redColor]
                    range:NSMakeRange(0, 5)];
    [storage addAttribute:NSForegroundColorAttributeName
                    value:[UIColor greenColor]
                    range:NSMakeRange(6, 4)];
    // 给内容容器添加布局(可以添加多个)
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    [storage addLayoutManager:layoutManager];
    // 带有内容和布局的容器
    NSTextContainer *textContainer = [NSTextContainer new];
    [layoutManager addTextContainer:textContainer];
    // 设置textContainer中要排斥的路径
    UIImage *image = [UIImage imageNamed:@"show"];
    
    CGRect areaRect = CGRectMake(5, 5, image.size.width, image.size.height);
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithRect:areaRect];
    textContainer.exclusionPaths = @[ovalPath];
    // 给TextView添加带有内容和布局的容器
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 20, 300, 400)
                                               textContainer:textContainer];
    textView.layer.borderWidth = 1;
    textView.scrollEnabled = YES;
    textView.editable      = NO;
    [self.view addSubview:textView];
    // 要显示的图片
    UIImageView *showImageView = [[UIImageView alloc] initWithFrame:areaRect];
    showImageView.image = image;
    [textView addSubview:showImageView];
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
