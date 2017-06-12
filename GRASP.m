function [ global_best_set, global_best_dist ] = GRASP(max_iterations,...
    seed, alpha, type_of_search )
% GRASP function encompasses the greedy random initialization and the local
% search functions.

% GRASP iterates through a user defined amount of times and updates its
% best found value 
stoptrigger = 0;
i = 1;
while stoptrigger==0
    
    % Greedy Random Ititialization
    [ greedycities, ~ ] = GreedyRandomInit(seed, alpha);
    % Local Search
    [ best_set, best_dist ] = LocalSearch(greedycities, type_of_search);
    
    % Update global best set and global best distance
    if ((i==1) || (best_dist < global_best_dist))
        global_best_set = best_set;
        global_best_dist = best_dist;
        iterations = 0;
    else 
        % Counts number of times solution is unchanged
        iterations = iterations + 1;
    end
    % triggers the stoppage if iterations surpasses the max_allowed
    % iterations
    if (iterations > max_iterations)
        stoptrigger = 1;
    end
    i = 0;
    
end

