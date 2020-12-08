classdef commands < handle
    %
    %   graphpad.commands
    %
    %   Apparently commands can't be executed directly by the COM interface
    %   so instead we call files that will execute the commands
    %
    %   https://www.graphpad.com/guides/prism/8/user-guide/using_script_syntax.htm
    
    
    %TODO: It may be good to call a .NET click on the graphpad app to 
    %force a rerender ...
    
    %{
        app = graphpad.application();
        app.commands.copy()
        str = clipboard('paste');
        output = graphpad.utils.strToMatrix(str)
    %}
    properties
        h
        cmd_root
    end
    
    methods
        function obj = commands(h)
            if isobject(h) %assuming graphpad.application
                h = h.h;
            end
            
            obj.h = h;
            root = sl.stack.getPackageRoot();
            obj.cmd_root = fullfile(root,'commands');
        end
        function varargout = copy(obj)
            %
            %   Notes
            %   ------
            %   - This doesn't appear to work on data sheets :/
            %       => although data sheets are available in the XML code
            %       ...
            %   - This may require clicking on a sheet to activate ...
            %   - This is frustratingly unreliable ...
            %       - this may have been a bug in 8.2 or a result of my
            %       navigation testing ...
            
            %https://www.graphpad.com/guides/prism/8/user-guide/copy_and_paste.htm
            invoke(obj.h,'runcommand',fullfile(obj.cmd_root,'copy.pzc'));
            pause(0.5)
            if nargout
                varargout{1} = clipboard('paste');
            end
        end
        function exit(obj)
            %https://www.graphpad.com/guides/prism/8/user-guide/special_purpose_commands.htm
            invoke(obj.h,'runcommand',fullfile(obj.cmd_root,'exit.pzc'));
        end
        function nav_previous_sheet(obj)
            invoke(obj.h,'runcommand',fullfile(obj.cmd_root,'goto_negative.pzc'));
        end
        function nav_next_sheet(obj)
            %This apppears to jump randomly and depends on how the graphs
            %were created ...
            invoke(obj.h,'runcommand',fullfile(obj.cmd_root,'goto_positive.pzc'));
        end
        function goto_data_sheet(obj,index_1b)
            %
            %   Notes: 1b seems to work as expected, but sometimes
            %   rendering is a bit strange ...
            
            %Ideally we would be able to support names here as well ...
            file_name = sprintf('goto_data_%d.pzc',index_1b);
            fp = fullfile(obj.cmd_root,file_name);
            if ~exist(fp,'file')
                text = sprintf('GoTo D, %d',index_1b);
                h__createCommand(fp,text)
            end
            invoke(obj.h,'runcommand',fp)
        end
        function generic(obj,cmd)
            %
            %   app.commands.generic('Copy 10, 10, 1, 1')
            fp = fullfile(obj.cmd_root,'generic.pzc');
            h__createCommand(fp,cmd)
            invoke(obj.h,'runcommand',fp)
        end
    end
end

function h__createCommand(file_path,text)
    %TODO: Would need to move locally ...
    sl.io.fileWrite(file_path,text);
end

%D - Data
%I - Info
%R - results
%G - Graphs
%L - Layout
%GoTo <section: D, I, R, G, or L >, <sheet#>, V<tab#>

%GoTo G - go to the most recently viewed graph