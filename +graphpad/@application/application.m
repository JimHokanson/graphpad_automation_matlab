classdef application < handle
    %
    %   Class:
    %   graphpad.application
    %
    %   https://www.graphpad.com/guides/prism/8/user-guide/using_scripts.htm
    
    properties
        h
        commands
    end
    
    methods
        function obj = application(varargin)
            %
            %   app = graphpad.application(varargin)
            
            in.visible = true;
            in = sl.in.processVarargin(in,varargin);
            
            try
                obj.h = actxGetRunningServer('Prism.command');
            catch ME
                %Note, this line launches Prism
                obj.h = actxserver('Prism.command');
                
                if in.visible
                   invoke(obj.h,'visible') 
                end
            end
            obj.commands = graphpad.commands(obj.h);
        end
        function exit(obj)
            %TODO: This should invalidate the application
        end
    end
end

