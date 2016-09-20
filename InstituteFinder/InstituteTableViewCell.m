//
//  InstituteTableViewCell.m
//  InstituteFinder
//
//  Created by harinath on 13/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteTableViewCell.h"
#import "IFHttpClient.h"
#import <UIImageView+AFNetworking.h>

@interface InstituteTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *phoneLbl;

@end


@implementation InstituteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellAtIndexPath:(NSIndexPath *)indexPath {
    
    self.nameLbl.text = self.institute.name;
    self.phoneLbl.text = self.institute.phoneNumber;

    __weak typeof(self) weakSelf = self;
    
        [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.institute.imageurl]] placeholderImage:[UIImage imageNamed:@"User"] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
//            __strong typeof(weakSelf) strongSelf = weakSelf;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.imageView.image = image;
                weakSelf.imageView.contentMode = UIViewContentModeScaleAspectFill;
                weakSelf.imageView.clipsToBounds = YES;
                [weakSelf.imageView setNeedsDisplay];
            });
            
            
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            
        }];
    
   }

- (IBAction)goToDetailViewWithSender:(id)sender {
    
    [_instituteViewDelegate goToInstituteDetailViewWithInstitute:self.institute];
    
}
@end
