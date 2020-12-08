classdef sheet < handle
    %
    %   Class:
    %   graphpad.sheet
    %
    %   I'm not sure what I want to do with this ...
    
    properties
        commands %  graphpad.commands
    end
    
    methods
        function obj = sheet(commands)
            obj.commands = commands;
        end
        function copyRaw(obj)
            %Copy entire sheet to clipboard
            obj.commands.copy();
        end
        function copyToCell(obj)
            
        end
    end
end

%SetSheetTitle [new_name] <K>
%SetSheetTitle renames the sheet. If you specify K, the first K characters of 
%the sheet name are retained, and the rest is renamed.

