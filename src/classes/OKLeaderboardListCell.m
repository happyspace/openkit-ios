//
//  OKLeaderboardListCell.m
//  OKClient
//
//  Created by Suneet Shah on 1/11/13.
//  Copyright (c) 2013 OpenKit. All rights reserved.
//

#import "OKLeaderboardListCell.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+AFNetworking.h"


@interface OKLeaderboardListCell ()
{
    UIImageView *leaderboardIcon;
}
@end


@implementation OKLeaderboardListCell
@synthesize label1, label2, leaderboard;

- (id)init
{
    static NSString *reuseID = kOKLeaderboardListCellIdentifier;
    
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    if (self) {
        CGRect CellFrame = CGRectMake(0, 0, 300, 57);
        CGRect LeaderbordLabel = CGRectMake(68, 11, 300, 20);
        CGRect PlayersLabel = CGRectMake(68, 28, 300, 20);
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        //Initialize Label with tag 1.
        label1 = [[UILabel alloc] initWithFrame:LeaderbordLabel];
        label1.tag = 1;
        label1.font = [UIFont boldSystemFontOfSize:15];
        label1.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:label1];
        
        //Initialize Label with tag 2.
        label2 = [[UILabel alloc] initWithFrame:PlayersLabel];
        label2.tag = 2;
        label2.font = [UIFont boldSystemFontOfSize:12];
        label2.textColor = [UIColor lightGrayColor];
        label2.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:label2];
        
        // Initialize leaderboard icon
        leaderboardIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15,10, 39, 39)];
        leaderboardIcon.image = [UIImage imageNamed:@"leaderboard_icon.png"];
        leaderboardIcon.layer.masksToBounds = YES;
        leaderboardIcon.layer.cornerRadius = 19.5;
        [self.contentView addSubview:leaderboardIcon];
        
        [self setFrame:CellFrame];
    }
    return self;
}

- (void)setLeaderboard:(OKLeaderboard *)aLeaderboard
{
    leaderboard = aLeaderboard;
    
    label1.text = [leaderboard name];
    label2.text = [leaderboard playerCountString];
    
    [leaderboardIcon setImageWithURL:[NSURL URLWithString:[leaderboard icon_url]]];
}

@end

