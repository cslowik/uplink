//
//  Rating.swift
//  Uplink
//
//  Created by Chris Slowik on 3/29/25.
//

import Foundation

// MARK: Ratings

let uplinkRatings: [(name: String, score: Int)] = [
    ("Unregistered", 0),
    ("Registered", 1),
    ("Beginner", 2),
    ("Novice", 6),
    ("Confident", 15),
    ("Intermediate", 35),
    ("Skilled", 60),
    ("Experienced", 90),
    ("Knowledgeable", 125),
    ("Uber-Skilled", 160),
    ("Professional", 220),
    ("Elite", 300),
    ("Mage", 400),
    ("Expert", 600),
    ("Veteren", 1000),
    ("Techno-mage", 1500),
    ("TERMINAL", 2500)
]

let neuromancerRatings: [(name: String, score: Int)] = [
    ("Morally bankrupt", -1024),
    ("Sociopathic", -512),
    ("Indiscriminate", -128),
    ("Notorious", -32),
    ("Untrustworthy", -16),
    ("Neutral", 0),
    ("Agressive", 32),
    ("Single minded", 64),
    ("Activist", 256),
    ("Anarchic", 1024),
    ("Revolutionary", 2048)
]

let neuromancerChange: [Int] = [
    0,   // Special
    0,   // Steal file
    5,   // Destroy file
    0,   // Find data
   -5,   // Change data
  -20,   // Frame user
  -30,   // Trace user
  -10,   // Change account
   30,   // Remove computer
   60,   // Remove company
  -60    // Remove user
]

class Rating: Codable {
    var uplinkRating: Int = 0
    var neuromancerRating: Int = 0
    var uplinkScore: Int = 0
    var neuromancerScore: Int = 0
    var creditRating = 0
    
    func getUplinkRatingString(rating: Int) -> String {
        return uplinkRatings[rating].0
    }
    func getNeuromancerRatingString(rating: Int) -> String {
        return neuromancerRatings[rating].0
    }
    
    func ChangeUplinkScore(amount: Int) {
        if (amount < 0 && uplinkRating <= 2) {
            return
        }
        if (amount == 0) {
            return
        }

        uplinkScore += amount
        
        if (amount < 0 && uplinkScore < uplinkRatings[2].1) {
            uplinkScore = uplinkRatings[2].1
        }
        
        // Find the new uplinkrating (it might / might not have changed)
        let oldRating = uplinkRating
        
        for i in 0..<(uplinkRatings.count - 1) {
            if ( uplinkScore >= uplinkRatings[i].score &&
                uplinkScore < uplinkRatings[i+1].score ) {
                uplinkRating = i
            }
        }
        
        // Special case - highest uplink rating
        if (uplinkScore >= uplinkRatings.last!.1) {
            uplinkRating = uplinkRatings.count-1
        }
            
        // Special case - less points than minimum rating
        if (uplinkScore < uplinkRatings[2].1 ) {
            uplinkScore = uplinkRatings[2].1
            uplinkRating = 2
        }

        //TODO: think about this, does it need to be here or player or what
        /*
        // Special case - player needs to be told about Connection Analyser
        if ( strcmp ( owner, "PLAYER" ) == 0 ) {

            if ( uplinkrating == 6 && oldrating < 6 ) {
                if ( !game->GetWorld ()->GetPlayer ()->gateway.HasHUDUpgrade (HUDUPGRADE_CONNECTIONANALYSIS) ) {
        
                    Message *m = new Message ();
                    m->SetTo ( "PLAYER" );
                    m->SetFrom ( "Uplink Corporation" );
                    m->SetSubject ( "Information for Skilled Agents" );
                    m->SetBody ( "Firstly allow us to congratulate you on your recent successes.  We have been following your "
                                 "career with interest.  As an up-and-coming Agent, you will find a number "
                                 "of new opportunities are now available to you.  At this point we feel we should give "
                                 "you an important piece of information.\n\n"
                                 "Now that the stakes are higher, you will certainly begin to encounter computer systems "
                                 "that are more secure than before.  These systems can be difficult to attack.\n\n"
                                 "Most of our Agents now use the HUD-Connection-Analyser to get around these systems.  "
                                 "This item of software was designed by Uplink Corporation specifically for bypassing security "
                                 "systems, and can be purchased from Uplink Internal Services.  It is designed to be used "
                                 "in conjunction with Security-Bypassers, also available from that site.\n\n"
                                 "Uplink Corporation wishes you luck." );
                    m->Send ();

                }
            }

        }
         */

            
        if ( uplinkRating > oldRating ) {
            // Send a congrats message to the owner
            // From: internal@uplink.net
            // To: player
            // Subject: congratulations
            // body: "Congratulations Agent <handle>, you have reached the next Uplink rating. Your rating is now "
            if (uplinkRating > creditRating) {
                creditRating = uplinkRating
            }
        }
        else if ( uplinkRating < oldRating ) {
            // Score has gone down
            // Send a warning message to the owner
            // From: internal@uplink.net
            // To: player
            // Subject: Uplink WARNING
            // body: "This is a warning, Agent <handle>. Your performance recently has been unsatisfactory. As such we have been forced to review your case, and have decided to decrease your Uplink rating. Your rating is now ___. We hope this is sufficient to make our point clear. Uplink Corp will not tolerate failure."
        }
        else {
            // Score has not changed
        }

    }
    
    func changeNeuromancerScore (amount: Int) {
        neuromancerScore += amount
        
        // Find the new neuromancer rating (it might / might not have changed)
        let oldRating = neuromancerRating
        
        for i in 0..<(neuromancerRatings.count - 1) {
            if ( neuromancerScore >= neuromancerRatings[i].score &&
                 neuromancerScore < neuromancerRatings[i+1].score ) {
                neuromancerRating = i
            }
        }
  
        
        // Special case - highest rating
        if ( neuromancerScore >= neuromancerRatings.last!.1 ) {
            neuromancerRating = neuromancerRatings.count - 1
        }

        // Special case - less points than minimum rating (ie negative)
        if ( neuromancerScore < neuromancerRatings[0].score ) {
            neuromancerRating = 0
        }
            
        if ( neuromancerRating > oldRating ) {
            // Score has gone up
            // Send a congrats message to the owner
            // body: "Agent <handle> your Neuromancer rating appears to have changed. Your rating is now "
            // Subject: Neuromancer rating change
            // from internal@uplink.net
        }
        else if ( neuromancerRating < oldRating ) {
            // Score has gone down
            // It appears your Neuromancer rating has changed, in view of your recent actions. Your new rating is
            // Subject: Neuromancer rating change
        }
        else {
            // Score has not changed
        }

    }
    
    func print() {
        Swift.print("Rating:")
        Swift.print("Uplink Score: \(uplinkScore)")
        Swift.print("Neuromancer Score: \(neuromancerScore)")
        Swift.print("Credit Rating: \(creditRating)")
    }
}
