
#####################################################################################
# SCE File for Learning  Task 
#
# associated files: Learning_PCL, subroutines_PCL, wordlist_learning.txt)
#
#####################################################################################


#################################################
# Header


scenario= "Learning";

active_buttons = 1;
button_codes = 1;					# set 3 to space

no_logfile = false;						# default
response_matching = simple_matching;			

default_font = "Arial"; 
default_font_size = 50; 
default_background_color=128,128,128;	      
default_text_color=0,0,0;

pcl_file = "Learning_PCL.pcl";	#includes PCL file



################################################
#end of header, start scenario
begin;


# set variables ################################
$fixtime = 1500; 		# Dauer Fixationskreuz nach Wort



# define texts ##################################
text{caption="bekannt";} bek;
text{caption="neu";} neu;



# define pictures ##############################
# instruction
picture {
    text {
		 description = "instruction";
       caption="Lies jedes Wort laut vor und merke es dir dabei so gut wie möglich!
			
			
			weiter mit der Leertaste...";
       font_size = 25;
    }; x = 0; y = 0; 
} instruction_picture; 

# ready screen
picture {
    text {
		 description = "ready screen";
       caption="Bereit?
			
			
			dann weiter mit der Leertaste...";
       font_size = 25;
    }; x = 0; y = 0; 
} ready_picture; 

# ready screen2
picture {
    text {
		 description = "ready screen2";
       caption="Sehr gut! Bereit für die zweite Runde?
			
			
			dann weiter mit der Leertaste...";
       font_size = 25;
    }; x = 0; y = 0; 
} ready_picture2; 

# default screen
picture {
    text {
		 description = "default screen"; 
       caption=" "; 
       font_size = 30;
    }; x = 0; y = 0; 
} default_picture;

# end screen
picture {
    text {
		 description = "end screen"; 
       caption="Geschafft!"; 
       font_size = 30;
    }; x = 0; y = 0; 
} end_picture;

# fixation
picture {
    text {
       description = "fixation"; 
       caption="+"; 
       font_size = 30;
    }; x = 0; y = 0; 
} fixation_picture;

# trial
picture {
    text {
       description = "trial"; 
       caption="mööp"; 
       font_size = 30;
    } trial_text; x = 0; y = 0; 
} trial_picture;



# define trials ################################
# instruction			
trial {
    trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 1;	
	 stimulus_event {
			picture instruction_picture;
			code= "instruction";
    };   
}instruction_trial;

# ready trial		
trial {
    trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 1;	
	 stimulus_event {
			picture ready_picture;
			code= "ready trial";
    };   
}ready_trial;

# ready trial 2		
trial {
    trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 1;	
	 stimulus_event {
			picture ready_picture2;
			code= "ready trial2";
    };   
}ready_trial2;

# end
trial{
	 trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 1;		
	 stimulus_event {
			picture end_picture;
			time=0;
			code= "end";
    };
}end_trial;

# default trial
trial{
    trial_duration = 1000;
	 all_responses = false;
    stimulus_event {
			 picture default_picture; 
			 time = 0; 
			 code= "default";
    };
}default_trial; 

# fixation
trial{
    trial_duration=$fixtime; 
	 all_responses = false;
    stimulus_event {
			 picture fixation_picture; 
			 time = 0; 
			 code= "fixation";
    };
}fixation_trial; 
	
# trial
trial{
	 trial_duration = 5000;
	 trial_type = fixed;
	 all_responses = false;
	 stimulus_event {
			picture trial_picture;
			time=0;
			response_active = true;
			code= "trial";
    };
}test_trial;
