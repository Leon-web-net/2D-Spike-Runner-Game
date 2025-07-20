classdef Sound_class
    
    properties
        audioPlayer
    end
    
    methods
        function obj = Sound_class(inputArg1,inputArg2)
            %SOUND_CLASS Construct an instance of this class
            %   Detailed explanation goes here
            obj.audioPlayer = audioplayer();
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.audioPlayer + inputArg;
        end
    end
end

