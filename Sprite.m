      classdef Sprite< handle

    properties (Access = public)
        vel      single = [-6 0]
        sprite_image   matlab.ui.control.Image
        alive   int16 = 1
        player_damage int16 = 10
        ceiling int16
        gnd_lvl  int16
    end
    

    methods (Access = public)

        % def __init__(self) initialise properties
        function obj = Sprite(ground_level,image,right_screen,level,screen_height)
            height = ground_level + min(randi([0 15*level]),ground_level*3);
            left_bottom = [right_screen, height];
            min_vel= max(-25, -5-level*2);
            obj.vel(1) = randi([min_vel, -5]);
            obj.sprite_image = image;
            obj.sprite_image.Position = [left_bottom 19 18];
            % obj.sprite_image.ImageSource = 'Images\Enemies\RAPS\raps_1.png';
            obj.sprite_image.ImageSource = 'Images/Enemies/RAPS/raps_1.png';
            obj.gnd_lvl = ground_level;
            rand = randi([1,4]);
            if level>1 && rand == 3
                obj.ceiling = min(randi([ground_level+20+level*8,screen_height]));
                obj.vel(2) = randi([2,10+level]);
                obj.vel(1) = obj.vel(1)+3;
            end
        end
%
         function delete_sprite(obj)
            % Delete any resources associated with the sprite
            
            delete(obj.sprite_image); % Delete the UI image component
            delete(obj);
         end

         function damage=collision(obj,player_pos)
            damage = 0;
            sprite_pos = obj.sprite_image.Position;
             % Calculate the coordinates of the right and top edges for both objects
            player_right = player_pos(1) + player_pos(3)-8;
            player_top = player_pos(2) + player_pos(4);
            sprite_right = sprite_pos(1) + sprite_pos(3);
            sprite_top = sprite_pos(2) + sprite_pos(4);
            
             % Check for collision along both axes
             is_colliding = ~(player_right < sprite_pos(1) || ...
                 player_pos(1)+8 > sprite_right || ...
                 player_top < sprite_pos(2) || ...
                 player_pos(2) > sprite_top);
             if(is_colliding)
                 damage= -obj.player_damage;
                 obj.alive = 0;
             end
             % disp(is_colliding)
             
         end
        
         function update_vel(obj)
                if obj.vel(2) ~= 0
                    if(obj.sprite_image.Position(2)-1<obj.gnd_lvl || (obj.sprite_image.Position(2)+obj.sprite_image.Position(4)+1)>obj.ceiling )
                        disp("invert vel_Y")
                        obj.vel(2) = -obj.vel(2);
                    end
                end
         end

    end

end