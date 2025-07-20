classdef Player_movement < handle

    properties (Access = public)
        momentum double = [0 0]
        vel      double = [0 0]
    end
    

    methods (Access = public)
        function addMom(obj)
            obj.momentum(1) = obj.momentum(1) + 1;
        end
    end

end