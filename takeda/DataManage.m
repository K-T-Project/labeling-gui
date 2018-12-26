classdef DataManage < handle
    properties
        data DataComponent
        currentnumber int16
        datanumber int16
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
            %img = imread(char(sprintf("%s/%s",obj.data(obj.currentnumber).folder,obj.data(obj.currentnumber).name)));
            img = imread(char(obj.CurrentFullNameGet()));
        end
        
        function str = CurrentNameGet(obj)
            %str = obj.data(obj.currentnumber).name;
            str = obj.NameGet(obj.currentnumber);
        end
        
        function str = NameGet(obj,i)
            str = obj.data(i).name;
        end
        
        function str = CurrentFullNameGet(obj)
            str = obj.FullNameGet(obj.currentnumber);
        end
        
        function str = FullNameGet(obj,i)
            str = sprintf("%s/%s",obj.data(i).folder,obj.data(i).name);
        end
            
            
        function str = CurrentEvalGet(obj)
            str = obj.EvalGet(obj.currentnumber);
        end
        
        function str = EvalGet(obj,i)
            str = obj.data(i).eval;
        end
        
        function CurrentEvalSet(obj,str)
            obj.data(obj.currentnumber).eval = str;
        end
        
    end
end