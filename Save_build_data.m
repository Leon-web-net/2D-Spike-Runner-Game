% Define the math questions for Key Stage 3
maths = struct;
maths.question=  {
        'What is the result of 5 * 7?',
        'Simplify: 3x + x - 5x',
        'Calculate the area of a rectangle with length 8cm and width 4cm.',
        'What is the value of x if 2x + 3 = 11?',
        'What is the next number in the sequence: 2, 5, 8, 11, ...'}';
maths.options = {{'35', '40', '42', '45'}, 
                {'0', '-5x', 'x', '-x'}, 
                {'16 cm^2', '32 cm^2', '24 cm^2', '12 cm^2'},
                {'4', '7', '8', '9'}, 
                {'14', '15', '16', '17'}};
maths.correctAnswers = {'35', '-x', '32 cm^2', '4', '14'};

% Save the math questions into a MAT file
save('ks3_math_questions.mat', 'maths');

% % disp(maths.options{1}{1})
Endless = 0;
alive=1;
game_stats= struct;
game_stats.total_time = '2000';
game_stats.survival_time = 14;
game_stats.game_mode = 'Endless';
game_stats.name = 'Leon';
game_stats.level = '6';

if Endless
    file_name = 'Endless_Top_5.mat';
     % Load leaderboard data

    if exist(file_name, 'file') == 2
        load(file_name); % Load data without assigning it to a variable
         % Check if 'leaderboard' variable already exists
         game_stats_array = leaderboard.game_stats_array;
     else
            % Create new leaderboard if file does not exist
            game_stats_array = {};
     end

        % Add current game stats to game_stats_array
        game_stats_array{end+1} = game_stats;

        survival_times = zeros(1, numel(game_stats_array));
        for i = 1:numel(game_stats_array)
            survival_times(i) = game_stats_array{i}.survival_time;
        end

        [sorted_times, idx] = sort(survival_times, 'descend');
        game_stats_array =game_stats_array(idx);
        disp(game_stats_array{1})

        % Keep only top 5 entries
        game_stats_array = game_stats_array(1:min(5, numel(game_stats_array)));
        disp(game_stats_array{1})
 else
    if alive
        file_name = 'Normal_Top_5.mat';
        if exist(file_name, 'file') == 2
            load(file_name); % Load data without assigning it to a variable
             % Check if 'leaderboard' variable already exists
             game_stats_array = leaderboard.game_stats_array;
         else
                % Create new leaderboard if file does not exist
                game_stats_array = {};
        end

        % Add current game stats to game_stats_array
        game_stats_array{end+1} = game_stats;

         total_times = zeros(1, numel(game_stats_array));
        for i = 1:numel(game_stats_array)
            total_times(i) = game_stats_array{i}.total_time;
        end

        [sorted_times, idx] = sort(total_times, 'ascend');
        game_stats_array =game_stats_array(idx);

        % Keep only top 5 entries
        game_stats_array = game_stats_array(1:min(5, numel(game_stats_array)));
    end
end
% 
% % Save updated leaderboard back to file
leaderboard.game_stats_array = game_stats_array;
save(file_name, 'leaderboard');
disp('Leaderboard updated and saved successfully.');
disp(leaderboard)

