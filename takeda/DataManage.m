classdef DataManage
    properties
        data
        currentnumber
        datanumber
    end
    
    methods
        function obj = DataManage(rawdata)
            j = 1;
            obj.data = DataComponent.empty;
            for i = 1 :length(rawdata)
                if ~strcmp(rawdata(i).name,'ID.png')
                    obj.data(j) = DataComponent(rawdata(i).folder,rawdata(i).name);
                    j = j + 1;
                end
            end
            
            obj.currentnumber = 1;
            obj.datanumber = length(obj.data);
        end
 
        function img = CurrentImageGet(obj)
            img = imread(char(sprintf("%s/%s",obj.data(obj.currentnumber).folder,obj.data(obj.currentnumber).name)));
        end
        
        function str = CurrentNameGet(obj)
            str = obj.data(obj.currentnumber).name;
        end
        
    end
end