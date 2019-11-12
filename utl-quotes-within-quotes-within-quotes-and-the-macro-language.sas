Quotes within quotes within quotes and the macro language                                                             
                                                                                                                      
  Two Solutions                                                                                                       
                                                                                                                      
     a. Just double it 'O''Leary' (I like this quote unquote solution - seems more natural? Lees Klingon?)            
        How it works in other langualges?                                                                             
                                                                                                                      
     b. double %                                                                                                      
        O%str(%')Leary or %str(O%'Leary)                                                                              
        by ed_sas_member                                                                                              
        https://communities.sas.com/t5/user/viewprofilepage/user-id/292097                                            
                                                                                                                      
     There is another 'pseudo' solution and you can find it used on the web.                                          
     Just use the backtick  "`" instead of the single quote?                                                          
                                                                                                                      
SAS Forum                                                                                                             
https://tinyurl.com/yernqozh                                                                                          
https://communities.sas.com/t5/SAS-Programming/Use-an-apostrophe-in-a-title-statement/m-p/603458                      
*                _     _                                                                                              
 _ __  _ __ ___ | |__ | | ___ _ __ ___                                                                                
| '_ \| '__/ _ \| '_ \| |/ _ \ '_ ` _ \                                                                               
| |_) | | | (_) | |_) | |  __/ | | | | |                                                                              
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|                                                                              
|_|                                                                                                                   
;                                                                                                                     
I need to materialize                                                                                                 
                                                                                                                      
     title1 "Name:" &name;                                                                                            
     ods pdf text="^S={fontweight=bold font_size=5} Name: &name.";                                                    
                                                                                                                      
where name=O'Leary                                                                                                    
                                                                                                                      
*            _               _                                                                                        
  ___  _   _| |_ _ __  _   _| |_                                                                                      
 / _ \| | | | __| '_ \| | | | __|                                                                                     
| (_) | |_| | |_| |_) | |_| | |_                                                                                      
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                     
                |_|                                                                                                   
;                                                                                                                     
 PDF Text Name: O'Leary     ** note single quotes                                                                     
                                                                                                                      
 Title statement O'Leary     ** note single quotes                                                                    
                                                                                                                      
   NAME       SEX    AGE    HEIGHT    WEIGHT                                                                          
                                                                                                                      
   Alfred      M      14     69.0      112.5                                                                          
   Alice       F      13     56.5       84.0                                                                          
   Barbara     F      13     65.3       98.0                                                                          
   Carol       F      14     62.8      102.5                                                                          
   Henry       M      14     63.5      102.5                                                                          
   James       M      12     57.3       83.0                                                                          
   Jane        F      12     59.8       84.5                                                                          
   Janet       F      15     62.5      112.5                                                                          
   Jeffrey     M      13     62.5       84.0                                                                          
   John        M      12     59.0       99.5                                                                          
   Joyce       F      11     51.3       50.5                                                                          
   Judy        F      14     64.3       90.0                                                                          
   Louise      F      12     56.3       77.0                                                                          
   Mary        F      15     66.5      112.0                                                                          
   Philip      M      16     72.0      150.0                                                                          
   Robert      M      12     64.8      128.0                                                                          
   Ronald      M      15     67.0      133.0                                                                          
   Thomas      M      11     57.5       85.0                                                                          
   William     M      15     66.5      112.0                                                                          
                                                                                                                      
                                                                                                                      
*          _       _   _                                                                                              
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                              
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                             
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                             
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                             
           _           _         _             _     _        _ _                                                     
  __ _    (_)_   _ ___| |_    __| | ___  _   _| |__ | | ___  (_) |_                                                   
 / _` |   | | | | / __| __|  / _` |/ _ \| | | | '_ \| |/ _ \ | | __|                                                  
| (_| |   | | |_| \__ \ |_  | (_| | (_) | |_| | |_) | |  __/ | | |_                                                   
 \__,_|  _/ |\__,_|___/\__|  \__,_|\___/ \__,_|_.__/|_|\___| |_|\__|                                                  
        |__/                                                                                                          
;                                                                                                                     
                                                                                                                      
                                                                                                                      
%macro pdf(name);                                                                                                     
                                                                                                                      
 %let deq=%qsysfunc(dequote(&name));                                                                                  
                                                                                                                      
 ods escapechar="^";                                                                                                  
 ods pdf file="d:/pdf/oneQuot.pdf";                                                                                   
 ods pdf text="^S={fontweight=bold font_size=5} PDF Text Name: &deq";                                                 
                                                                                                                      
 proc print data=sashelp.class;                                                                                       
 title1  "Title statement &deq";                                                                                      
 run;quit;                                                                                                            
                                                                                                                      
 ods pdf close;                                                                                                       
                                                                                                                      
%mend pdf;                                                                                                            
                                                                                                                      
%pdf('O''Leary');                                                                                                     
                                                                                                                      
*    _             _     _        _  __                                                                               
  __| | ___  _   _| |__ | | ___  (_)/ /                                                                               
 / _` |/ _ \| | | | '_ \| |/ _ \   / /                                                                                
| (_| | (_) | |_| | |_) | |  __/  / /_                                                                                
 \__,_|\___/ \__,_|_.__/|_|\___| /_/(_)                                                                               
                                                                                                                      
;                                                                                                                     
                                                                                                                      
%macro pdf(name);                                                                                                     
                                                                                                                      
 ods escapechar="^";                                                                                                  
 ods pdf file="d:/pdf/oneQuot.pdf";                                                                                   
 ods pdf text="^S={fontweight=bold font_size=5} PDF Text Name: &name";                                                
                                                                                                                      
 proc print data=sashelp.class;                                                                                       
 title1  "Title statement &name";                                                                                     
 run;quit;                                                                                                            
                                                                                                                      
 ods pdf close;                                                                                                       
                                                                                                                      
%mend pdf;                                                                                                            
                                                                                                                      
%pdf(O%str(%')Leary);                                                                                                 
                                                                                                                      
                                                                                                                      
                                                                                                                      
