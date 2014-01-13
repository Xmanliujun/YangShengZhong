//
//  GengDViewController.m
//  YangShengArc
//
//  Created by XmL on 13-6-27.
//  Copyright (c) 2013年 刘军. All rights reserved.
//

#import "GengDViewController.h"
#import "MyButton.h"
#import "EveryDayViewController.h"
#import "BenDiViewController.h"
#import "RootViewController.h"
#import "GengDuoCell.h"
#import "UIImageView+WebCache.h"

#import "JieShaoViewController.h"

@interface GengDViewController ()

@end

@implementation GengDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)btnFanHui:(UIButton * )btn
{
    NSLog(@"btnFanHui");
    
    RootViewController * ra = [[RootViewController alloc] init];
    ra.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:ra];
    [self presentViewController:nav animated:YES completion:NULL];

    
    
    
}

//在线练功
-(void)zaiXianbtna:(MyButton *)btn
{
    
    NSLog(@"zaiXianbtna");
    EveryDayViewController * b = [[EveryDayViewController alloc] init];
    UINavigationController *  nav = [[UINavigationController alloc] initWithRootViewController:b];
    b.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    
}

//本地
-(void)benDibtna:(MyButton *)btn
{
    
    NSLog(@"benDibtna");
        BenDiViewController * b = [[BenDiViewController alloc] init];
        UINavigationController *  nav = [[UINavigationController alloc] initWithRootViewController:b];
        b.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    
    
}

//更多方法
-(void)gengDuobtna:(MyButton *)btn
{
    
    NSLog(@"gengDuobtna");

    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"6.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 30, 40);
    [btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bkbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = bkbtn;

    
    
    CGRect rect = self.view.bounds;
    
    
    gengTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, rect.size.height - 90) style:UITableViewStylePlain];
    gengTableView.tag = 1600;
    gengTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"全背景.png"]];
    gengTableView.delegate = self;
    gengTableView.dataSource= self;
    [self.view addSubview:gengTableView];
    
    if (self.view.bounds.size.height > 480 ){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 455, 320, 50)];
        imageView.image = [UIImage imageNamed:@"12.png"];
        [self.view addSubview:imageView];
        
        MyButton * zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        zaiXianbtn.frame = CGRectMake(0, 455, 110, 50);
        [zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1-.png"] forState:UIControlStateNormal];
        [self.view addSubview:zaiXianbtn];
        
        MyButton* benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
        benDibtn.frame = CGRectMake(110, 455, 110, 50);
        [benDibtn setImage:[UIImage imageNamed:@"底部按钮2-.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:benDibtn];
        
        MyButton*gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
        gengDuobtn.frame = CGRectMake(222, 455, 98, 50);
        [gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:gengDuobtn];
        [zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
        [benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
        [gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];

    }else if(self.view.bounds.size.height <= 480){
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 370, 320, 50)];
        imageView.image = [UIImage imageNamed:@"12.png"];
        [self.view addSubview:imageView];
        
        MyButton * zaiXianbtn = [MyButton buttonWithType:UIButtonTypeCustom];
        zaiXianbtn.frame = CGRectMake(0, 370, 110, 50);
        [zaiXianbtn setImage:[UIImage imageNamed:@"底部按钮1-.png"] forState:UIControlStateNormal];
        [self.view addSubview:zaiXianbtn];
        
        MyButton* benDibtn = [MyButton buttonWithType:UIButtonTypeCustom];;
        benDibtn.frame = CGRectMake(110, 370, 110, 50);
        [benDibtn setImage:[UIImage imageNamed:@"底部按钮2-.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:benDibtn];
        
        MyButton*gengDuobtn = [MyButton buttonWithType:UIButtonTypeCustom];
        gengDuobtn.frame = CGRectMake(222, 370, 98, 50);
        [gengDuobtn setImage:[UIImage imageNamed:@"底部按钮3.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:gengDuobtn];
        [zaiXianbtn addTarget:self action:@selector(zaiXianbtna:) forControlEvents:UIControlEventTouchUpInside];
        [benDibtn addTarget:self action:@selector(benDibtna:) forControlEvents:UIControlEventTouchUpInside];
        [gengDuobtn addTarget:self action:@selector(gengDuobtna:) forControlEvents:UIControlEventTouchUpInside];

    }
    
   
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString * cellID = [NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row];
    
    GengDuoCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell== nil) {
        cell = [[GengDuoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    if (indexPath.row == 0) {
        cell.gLabelName.text = @"Breathing exercises regimen";
        cell.gLabelJiesh.text = @"A practice of the method. Refers to inhale clean air exhaled aggregate, or concomitant pronunciation Qigong method to adjust parts of the body function. Approach is to use the full absorption of breathing, call first net gas, abdominal naturally relax, then opened the lungs inhale, then slowly put the call out of gas, in order to strengthen the breathing process, the key is to breathe.";
        
    }else if (indexPath.row == 1){
        cell.gLabelName.text = @"Tai Chi Qigong method";
        cell.gLabelJiesh.text = @"Health Taiji boxing belongs to the family. Tai Chi Master tactic by Dan, Wang Zongyue Taijiquan Theory externally. The impulsive emotional training, Tai Chi Yin and Yang Yun; outside boxing potential moves, which was imposing demeanor. Popular saying: physical strength and mental qualities while exercising.";
    
    }else if (indexPath.row == 2){
        cell.gLabelName.text = @"Taoist exercises";
        cell.gLabelJiesh.text = @"Taoist Qigong is the founding father, the inheritance has been two thousand years of history. Chuji founder of the Yuan Dynasty Dragon Taoist martial art founded by second generation spread to cattle Campbell. Taoist Qigong seek to win their hearts and static basis, this is called repairability; to consolidate as Yangjing destination, which is called afloat. Repair of the above must be implemented to support life, so life alike regimen called reactive power.";
        
    }else if (indexPath.row == 3){
        cell.gLabelName.text = @"Bagua health exercises";
        cell.gLabelJiesh.text = @"Bagua Bagua, also known as the body ﹑ tour BA Gua Zhang is a kind of palm-step method of conversion and line turn-based martial arts. Because of its criss-cross movement, divided into four positive Siyu eight directions, and the Book of Changes Eight Diagrams of the images is similar, hence the name Bagua. Some Bagua punching spectrum often manage to explain the rationale boxing Gua, Gua representatives to eight Basic Eight Palms.";
        
    }
    
    cell.selectionStyle = UITableViewCellAccessoryNone;

    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    return 80.0f;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"cell is here ");
    
    JieShaoViewController * js = [[JieShaoViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:js];
    js.numString = [NSString stringWithFormat:@"%d",indexPath.row];
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
