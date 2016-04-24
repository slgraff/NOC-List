//
//  DetailViewController.m
//  NOC List
//
//  Created by Ben Gohlke on 1/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

//
// 17. By the empty circle to the left of this IBOutlet, it looks like this property is not connected to its storyboard
//     object. How do we do that?
//
@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;

//
// 18. We need properties for the other two labels here so we can reference them in code.
//
@property (weak, nonatomic) IBOutlet UILabel *realNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelNumLabel;



// Why is this here?
// A: Because you love us
- (void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail view

- (void)setAgent:(Agent *)newAgent
{
    if (_agent != newAgent) // _agent is equivalent to self.agent in this situation
    {
        _agent = newAgent;  // Don't use self.agent here instead of _agent, will cause infinite loop
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // What is being checked here?
    // A: We are checking to see if self.agent exists. If true, execute code
    if (self.agent)
    {
        //
        // 19. We need to set the title of this view to "Agent #", where # is the agent's last name (use the cover name). But
        //     the Agent object only has a name property with the first and last name in a single string. How do we get just
        //     the last name?
        //
        //     (hint: We did something similar to this in HW 1)
        //
        
        // More complicated way to extract agent last name
//        // Get agent cover name
//        NSString *agentName = self.agent.coverName;
//        
//        // Separate name into component 'words'
//        NSArray *nameComponents = [agentName componentsSeparatedByString:@""];
//        
//        // Grab last name, i.e. last component, from nameComponents
//        NSString *lastName = nameComponents.lastObject;
        
        // One line solution to extracing agent last name and setting view title
        self.title = [NSString stringWithFormat:@"Agent %@", [self.agent.coverName componentsSeparatedByString: @" "][1]];
    
        //
        // 20. Once we have the last name of the agent from the code above, how do we set the view's title to the right
        //     string?
        //
        
        // More verbose way to set title
//        NSString *viewTitle =  [@"Agent " stringByAppendingString:lastName];
//        self.title = viewTitle;
        
        
        
        //
        // 21. We need to set the three labels in our view to the agent's cover name, real name, and access label.
        //
        //     The level label will be a little trickier, because the level property is an NSInteger. We also want that label
        //     to read "Level #". How do we do that?
        //

        self.coverNameLabel.text = self.agent.coverName;
        self.realNameLabel.text = self.agent.realName;
        self.levelNumLabel.text = [NSString stringWithFormat:@"Level %ld", (long)self.agent.accessLevel];
        
    }
}

- (void)viewDidLoad
{
    // What does this do?
    // A: Executes the viewDidLoad method of the superClass, UIViewController
    [super viewDidLoad];
    
    //
    // 22. We need to make sure to call the configureView method so the detail view will be populated with the agent's data.
    //     How do we do that?
    //
    
    [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end