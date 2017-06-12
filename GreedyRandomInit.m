function [ used, total ] = GreedyRandomInit(cities, randsize)
% Authors:
% William Arloff <william.arloff@valpo.edu>
% Ryan Taylor <ryan.taylor@valpo.edu>

% For detailed explination of Greedy random intialisation see the Main file

% Find random initial city and randomize the set of cities given
citiesrand = cities(randperm(length(cities)),:);
n = length(citiesrand);
startcity = randperm(n,1);
unused = citiesrand;
[initsize,~] = size(cities);
p2 = 1:initsize;

% Initialize used and unused sets
used=[];
used(1,:) = unused(startcity,:);
unused(startcity,:) = [];



% While loop contineus the search for greedy random solutions until there
% are no more cities to choose from
    while (isempty(unused)==0)
        
        d = 1000000; % Initialize d to be a large number
        [ind,~] = size(unused);
        [P,~] = size(used);  %Gets the size of the unused set
        
        INDEX = [];
        counter = 1;
        for i=1:ind % Loops thru the unused set
            
            % Caluclates distance 
            % [last val of used set, changing values of unused set]
            X = [used(P,1),used(P,2);unused(i,1),unused(i,2)];
            
            dt = CalcDistance(X); % Distance formula 
              
            % Save distance
            INDEX(counter,1) = i;
            INDEX(counter,2) = dt;
            counter = counter + 1;         
        end
        
        % Find the randsize closest cities to the next city
        % And randomly choose one of them
            B = sortrows(INDEX,2);
            [szu,~] = size(unused);
            
            
            if (szu>randsize) 
                ran = randi(randsize);
            else 
                ran = randi(szu);
            end
            val = B(ran,1);  
            [sz,~] = size(used);
            used(sz+1,:) = unused(val,:);
            unused(val,:) = []; 
    end
  
    % Calculates the final distance of the greedy path taken
    x = used(p2,1);
    x = [x;x(1)];
    y = used(p2,2);
    y = [y;y(1)];
    
    total1 = sqrt(diff(x).^2 + diff(y).^2);  
    total2 = sum(total1);
    
    total = total2;
    
    

end



