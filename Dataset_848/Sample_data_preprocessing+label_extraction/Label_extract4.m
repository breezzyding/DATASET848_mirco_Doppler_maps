%% Extract label from files
%==========================================================================
% Author Mr Xingzhuo Li
% date: 30/10/2019
% Version 1.0
% description: This function receives filenames and extract the label from
% the names including activity type, the performer of this activity and the
% repetition time of the activity.

% input description of format:
% the input can be a string or a cell. when a cell is received, the
% function will extract the label from every element of the cell.

% the filename PxxAxxRxx.dat tells this file records which activity, performed by which 
% person and how many repetition time it is.

% output number 1 values and meaning: one-dimension cell. each element has 
%the value from 1 to 72,indicating which person performed this activity.

% output number 2 values and meaning: one-dimension cell. each element has
% the value from 1 to 6 such as 1-walking, 2-sitting, 3-standing, 4-drink water,
% 5-pick, 6-fall.
%                                     

% output number 3 values and meaning: one-dimension cell. each element has 
% the value from 1 to 3, indicating which time this acitivity is repeated by one person.
%==========================================================================
%%
function [ number1,number2,number3] = Label_extract4(fileNames)
% number1:person
% number2:activity
% number3:repetition
type = 0;
% [number1,number2,number3] = deal()
if class(fileNames) == 'char'
    size_file = 1;
    type = 1;
else 
    size_file = size(fileNames,2); 
    type = 2;
end


for counter = 1:size_file
    if type == 1
        current_char = fileNames;
    else
        current_char = char(fileNames(counter));
    end
[null,num1,num2,num3] = deal('');    

i = 1;
    while current_char(i)~= 'P'     
    null = [null,current_char(i)];
    i = i+1;
    end   
    i = i+1;
    while current_char(i)~='A'
    num1 = [num1,current_char(i)];
    i = i+1;       
    end
    i = i+1;
    while current_char(i)~= 'R'
    num2 = [num2,current_char(i)];
    i = i+1;
    end
    i = i+1; 
    while current_char(i)~='.'&& current_char(i)~='D'&& current_char(i)~='R'
    num3 = [num3,current_char(i)];
    i = i+1;
    end
    number1(counter) = {num1(:)};
    number2(counter) = {num2(:)};    
    number3(counter) = {num3(:)};

end
end

