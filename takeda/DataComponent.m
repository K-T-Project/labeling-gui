classdef DataComponent
    properties
        name string
        folder string
        eval string
        comment string
    end
    
    methods
        function obj = DataComponent(folder,name)
            obj.name = string(strrep(name,'\','/'));
            obj.folder = string(strrep(folder,'\','/'));
            obj.eval = "";
            obj.comment = "";
        end
    end
end