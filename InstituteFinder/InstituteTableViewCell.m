//
//  InstituteTableViewCell.m
//  InstituteFinder
//
//  Created by harinath on 13/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteTableViewCell.h"

@interface InstituteTableViewCell ()

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
    
}

- (IBAction)goToDetailViewWithSender:(id)sender {
    
    [_instituteViewDelegate goToInstituteDetailViewWithInstitute:self.institute];
    
}
@end
