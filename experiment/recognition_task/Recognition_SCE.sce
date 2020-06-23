
#####################################################################################
# SCE File for Recognition  Task 
#
# associated files: Recognition_PCL, subroutines_PCL, wordlist_recognition.txt)
#
#####################################################################################


#################################################
# Header


scenario= "recognition";

active_buttons = 3;
button_codes = 1, 2, 3;					# set 1 to left arrow, set 2 to right arrow, set 3 to space

no_logfile = false;						# default
response_matching = simple_matching;			

default_font = "Arial"; 
default_font_size = 50; 
default_background_color=128,128,128;	      
default_text_color=0,0,0;

pcl_file = "Recognition_PCL.pcl";	# includes PCL file



################################################
#end of header, start scenario
begin;


# set variables ################################
$fixtime = 1000; 		# Dauer Fixationskreuz nach Wort



# define pictures ##############################
# instruction
picture {
    text {
		 description = "instruction";
       caption="mööp"; 
       font_size = 25;
    } instruction_text; x = 0; y = 0; 
} instruction_picture; 

# ready screen
picture {
    text {
		 description = "ready screen";
       caption="Bereit?
			
			
			dann weiter mit Leertaste...";
       font_size = 25;
    }; x = 0; y = 0; 
} ready_picture; 

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
       font_size = 40;
    } trial_text; x = 0; y = 0; 
	 text {
		 caption="mööp";
		 font_size = 30;
	 } left_instr_text; x = -600; y = -400;
	 text {
		 caption="mööp";
		 font_size = 30;
	 } right_instr_text; x = 600; y = -400;
} trial_picture;



# define trials ################################
# instruction			
trial {
    trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 3;	
	 stimulus_event {
			picture instruction_picture;
			code= "instruction";
    };   
}instruction_trial;

# ready trial		
trial {
    trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 3;	
	 stimulus_event {
			picture ready_picture;
			code= "ready trial";
    };   
}ready_trial;

# end
trial{
	 trial_duration = forever;
	 trial_type = specific_response;
	 terminator_button = 3;		
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
	 #target_button = 1,2;		
	 stimulus_event {
			picture trial_picture; 
			time=0;
			response_active = true;
			code= "trial";
    };
}test_trial;
