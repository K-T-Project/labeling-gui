classdef Data
    properties
        name
        folder
        eval
        comment
    end
    
    methods
      function obj = Data(folder,name)
          obj.folder = string(folder);
          obj.name = string(name);
          obj.eval = "";
          obj.comment = "";
      end
    
    end
end