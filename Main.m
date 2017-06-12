% Authors:
% William Arloff <william.arloff@valpo.edu>

% Below is code for a GRASP algorithm for the Traveling salesman problem
% The algorithm works by calling the Greedy Random Initialization 
% to get a greedy randomization of the cities. Next the code implements the
% Local search function which takes the initialized cities and searches for
% an even better solution.  The Code below will output the final set of
% best found cities, the greedy initialization of cities, the best found
% distance from the greedy intitialization, and the best found distance for
% the local search.

% The three main functions are as follows


% --------------------- Greedy Random Initialization -------------------%
%[ used, total ] = GreedyRandomInit(cities, randsize) 

        % Cities --->  Matrix of cities inputted into the function
                        % For greedy random initialization
        % randsize ---->   The number of random cities that the greedy 
                       % algorithm will pick from when chosing the 
                       % next greedy solution, if there is a randsize of 4
                       % then one of the 4 best cities that are next will
                       % chosen at random to be the next city in the greedy
                       % random solution. Enter an integer from 1 to the
                       % size of the amount of cities entered. This is
                       % called the restricted candidate list randsize
                       % determines the size of the restricted candidate
                       % list
                       
        % used -------->  Used is the set of cities that have been found
                       % by the greedy random method
                       
        % total ------>   Total is the total distance of the path traveled
                        % by the final set of cities.
                        
% ------------------------ LOCAL SEARCH --------------------------------%

% [ best_set, best_dist ] =LocalSearch( Cities, Type_Of_Search)

            % Cities ------ Cities are the x and y coordinates of the
                           % Cities in column form
                           
                           
            % Type_Of_Search ----- Type of search must be either entered as
                           % 'Best' or 'First' signaling which type of
                           % local search is desired.  For more information
                           % on the best or first procedure, see the main
                           % file.

            % best_set ---------- The output of cities that the local
                           % search found to be the optimal solution
                           
            % best_dist ----------- The total distance of the path of the
                                    % cities.

%---------------------------- GRASP ------------------------------------%

%  [ global_best_set, global_best_dist ] = GRASP(max_iterations,...
%    cities, randsize, type_of_search )
            
            % max_iterations ------- Number of allowed iterations where no 
                                    % better solutions are found

            % global_best_set ----- The best found set by GRASP
            
            % global_best_dist ----- The best found distance of the set of
                                    % cities in grasp
                                   

%///////////////////////////////////////////////////////////////////////
%////////////////////////// IMPORTANT \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

% THE PLOTTSP FUNCTION IS A FUNCTION FROM MATLAB CENTRAL THAT PLOTS
% THE CITIES OF A TRAVELING SALESMAN PROBLEM. We did not develop the code
% and give all the credit to the developer

% This code was developed by 
% Author: Jonas Lundgren <splinefit@gmail.com> 2012

% Copyright (c) 2012, Jonas Lundgren
% All rights reserved.

% THE COMBINATOR FUNCTION IS A FUNCITON FROM MATLAB CENTRAL THAT WE USED TO
% PERFORM COMBINATIONS OF CITIES FOR OUR ALGORITHM. We did not develop the 
% code and give all the credit to the developer

% This code was developed by 
% Author:   Matt Fig
% Contact:  popkenai@yahoo.com
% Date:     5/30/2009


%------------------------------ METHOD --------------------------------%

%       The code first creates a greedy random initialization of the cities
% First the code randomly mixes the cities and chooses at random a start
% point, Next code finds the next 'randsize' amount of closest cities 
% and chooses randomly which of those cities to pick next. The code places
% the cities into two piles, a used pile and an unused pile cities chosen
% will enter the used pile in order, and will be deleted from the unused
% pile, the code iterates until the unused pile is empty. The greedy random
% initialization then caluclates the distance of the path and outputs the
% set of cities, and the distance.

%       The code then passes this greedy random initializaton of cities to the 
% local search procedure. The local search procedure has two types of local
% search.  
        
%         The 'First' procedure for local search iterates through all
% possible combinations of city swaps, until it finds a swap that has a
% distance lower than the best distance found.  The set that includes the
% swapped cities becomes the best found set thus far and then the 'First'
% procedure iterates through all of the possible city swaps again
% and attempts to find a new set of cities with a smaller distance.  The
% procedure is called 'First' because it chooses the first better solution
% and keeps that solution.  The 'First' procedure ends by trying all
% possible swaps and not finding a swap that gives a smaller total
% distance.
% 
%         The 'Best' Procedure for local search iterates through all
% possible combinations of city swaps and keeps all of the sets of cities
% with swaps that have a lower total distance then the best city set found.
% The procedure then chooses the set of cities with the lowest distance
% from that set of sets of cities.
% The procedure sets that set of cities as the best set of cities, and the
% total distance of those cities as the best distance found thus far. The
% procedure continues this process until there are no sets of cities with
% better total distances.

%       The GRASP function encompasses both the greedy random intitialization,and
% the local search procedures, the grasp function runs the greedy random,
% and local search in that order and keeps the best set of cities. The
% GRASP algorithm stops when there is no change over a user defined number
% of iterations.

%       The code then plots the output of the local search outputs to the screen
% the greedy initial random distance and the local search
% distance.  The final set of cities is in the workspace labeled 
% global_best_set

% ---------------------------- DIRECTIONS ------------------------------- %

%       First run the Main file.  Then enter the number of cities you wish to
% perform GRASP on. The code will upload the cities.  Next input the size
% of the restricted candidate list for the Greedy Random Initialization
% function. We recommend a range of 1-7.  
%       Next, enter the number of iterations GRASP will go through.
% We recommend 20-50 iterations.  Next Enter the type of local search you
% wish to be performed, the options are 'First' and 'Best' 
% Use single quotations for your input of 'Best' of 'First'. in our input. For more
% information on first and best read the sections on first and best in the
% method section.  The Code will output the sum of the distances for the
% cities and a plot of the cities and the path traveled. The array of the
% best found cities can be found in the workspace under 'global_best_set'.

%________________________________________________________________________%


% Clears the figures, workspace, and command window
clear
clc
clf

% Loads the cities

%Asks user for number of cities 
x = input('Enter number of cities desired: 29, 48, 70 or 76: ');
if (x==29)
    loadbays29();
elseif (x==48)
    loadatt48();
elseif (x==70)
    loadst70();
elseif (x==76)
    loadpr76();
else
    error...
        ('Number entered was not either 29, 48, 70, or 76.')
end


%loadbays29();
%loadatt48();
%loadst70();
%loadpr76();

% Loads the cities chosen
load('cities.mat')


%--------------------------- USER INPUTS --------------------------------%
disp(' ');
disp('Enter the size of the Restricted Candidate List for the GRI function')
randsize = input('(We recommend 1-7): ');
disp(' ');
disp('Enter the number of allowed iterations without change for GRASP: ');
max_iterations = input('(We recommend 20-100): ');
disp(' ');
type_of_search = input('Enter the type of Local Search, ''Best'' or ''First'': ');
disp(' ');

% randsize = 3;
% max_iterations = 50;
% type_of_search = 'First';

%------------------------------------------------------------------------%

cities=cities';
[ind,~] = size(cities);
p = 1:ind;

% Runs the GRASP ALGORITHM
[ global_best_set, global_best_dist ] = GRASP(max_iterations,...
    cities, randsize, type_of_search );

% Plots the citeis
tspplot(p, global_best_set, p);

% Display outputs

disp(['Best distance found by GRASP: ' num2str(global_best_dist)]);







