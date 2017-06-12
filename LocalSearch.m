function [ best_set, best_dist ] =LocalSearch( Cities, Type_Of_Search)
% Authors:
% William Arloff <william.arloff@valpo.edu>
% Ryan Taylor <ryan.taylor@valpo.edu>

%-----------------------------------------------------------------------%
%--------------- LOCAL SEARCH PROCEDURE FOR GRASP ----------------------%
%-----------------------------------------------------------------------%

% Read Me
% Function accepts the matrix of cities in column format and chooses 
% either the 'First' method of search or the 'Best' method for the local
% search procedure. 

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
            
            
            
% Catch Error        
% Throw Error if Type_Of_Search is neither 'First' of 'Best'
if ((strcmp(Type_Of_Search,'First')==0) && ...
        (strcmp(Type_Of_Search,'Best')==0))
    msg = 'Type of search entered is neither ''First'' or ''Best''';
    error(msg)
end

% Initialize the cities
init_dist = CalcDistance(Cities);
best_dist = init_dist;
[citysize,~] = size(Cities);
% Declares the best distance and city makeup found thusfar
best_set = Cities;
    % First procedure for local Search
% LOCAL SEARCH PROCEDURE
% Search Procedure is either 'First' or 'Best' Procedure
    if (strcmp(Type_Of_Search,'First'))
        % First Procedure for Local Search 
        combos  = combinator(citysize,2,'c'); 
        [combosize,~] = size(combos);
        endsignal=0; % Signal to break out of outer while loop
        % numberofswaps = 0; % Counts the number of swaps 
        while (endsignal==0)
            % Restart the counter at one to start the list over again
            i = 1;
            % Enter into the while loop
            b = 0;
            while (b == 0)
                % Temp set becomes best set
                temp_set = best_set; 

                % Swaps the two cities referenced in the combinations
                temp = temp_set(combos(i,2),:);
                first = temp_set(combos(i,1),:);
                temp_set(combos(i,1),1) = temp(1,1);
                temp_set(combos(i,1),2) = temp(1,2);
                temp_set(combos(i,2),1) = first(1,1);
                temp_set(combos(i,2),2) = first(1,2);
                % Calculates the distance of the cities that were swapped
                temp_dist = CalcDistance(temp_set);

                % If the swap is better than the previous, then keep the
                % swap
                if (temp_dist < best_dist)
                    best_set = temp_set;
                    best_dist = temp_dist;
                    % numberofswaps = numberofswaps + 1; counts number of
                    % swaps
                    b = 1;
                end
                
                % If i reaches all the way through the combinations signal
                % the end of the procedure
                if (i == combosize)
                    % End the first while loop
                    b = 1;
                    % End the outer while loop
                    endsignal=1;
                end 
                % Add one to the counter 
                i = i + 1;
            end

        end
        
    elseif (strcmp(Type_Of_Search,'Best'))
        % Best Procedure for Local Search
        % Calculates all possible combinations
        % Without repeetition/replacement
        C = cell(1,1);
        C{1} = [1,1];

        while (isempty(C{1,1})==0)
            % Initialize the combinations of cities
            combos  = combinator(citysize,2,'c');
            [combosize,~] = size(combos);
            C = cell(combosize,1);
            counter = 0;

            % For loop iterates through the different combinations and then
            % picks out the sets that are better than the ones before

            for i=1:combosize
                % Temp set becomes best set
                temp_set = best_set;

                % Swaps the two cities referenced in the combinations
                temp = temp_set(combos(i,2),:);
                first = temp_set(combos(i,1),:);
                temp_set(combos(i,1),1) = temp(1,1);
                temp_set(combos(i,1),2) = temp(1,2);
                temp_set(combos(i,2),1) = first(1,1);
                temp_set(combos(i,2),2) = first(1,2);


                % Calculates the distance of the cities that were swapped
                temp_dist = CalcDistance(temp_set);

                % If the cities were swapped then add the set to the cell 
                % array
                
                if (temp_dist < best_dist)
                    % Tacks on the distance to the array of cities 
                    temp_set(1,3) = temp_dist;
                    % Adds the list of cities to the cell array
                    counter = counter + 1;
                    C{counter} = temp_set;
                    % Adds 1 to the counter for reference to the next empty
                    % cell array
                    
                end

            end 

            % If the Cell Array is not empty 
            if (isempty(C{1,1})==0)

                % Iterates through the cell array and chooses the array
                % with the lowest distance 
                for n = 1:counter

                    temp2 = C{n};

                    if (temp2(1,3) < best_dist)
                        tempnewbest = C{n};
                        best_dist = tempnewbest(1,3);
                    end
                end
                % Sets the new best set and best distance
                best_set = tempnewbest;
                best_dist = best_set(1,3);
            
            else
                

            end
        end
    end    
end
        
        


