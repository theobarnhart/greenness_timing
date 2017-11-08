% Script to process the data frame that the water balance data comes in.
% Theodore Barnhart

cd /Volumes/Users/Theo/projects/greenness_timing/data/

load('./P301_WB_transect_HourlyGapFilled_wy2010.mat');

nodes = [18,19];
sens = [7,9,11,13];

m = length(nodes);
n = length(sens);

dat = zeros(8761,(m*n)+6);

dat(:,1) = allDataAvg{1,18}.sensor{1,9}.corrDate;

%%
ind = 7;

for i=nodes
    for k=sens
        
        dat(:,ind) = allDataAvg{1,i}.sensor{1,k}.val;
        
        
        ind = ind+1; % add one to the indexer
    end
end

%% convert dates to vectors and write to the first 6 columns of the data frame

dat(:,1:6) = datevec(dat(:,1));

%% Export it all


% header: year month day hour minute second n18sm1 n18sm2 n18sm3 n18sm4 n19sm1 n19sm2 n19sm3 n19sm4
csvwrite('./p301_WB_transect_sm_WY2010.csv',dat)
