classdef static_file
    %
    %   Class:
    %   graphpad.static_file
    %
    %   Instance of a Prism file that is not dynamically updated ...
    
    %{
        fp = 'C:\Users\Jim\Desktop\stats_temp\cv10.pzfx';
        f = graphpad.static_file(fp);
    %}
    properties
        
    end
    
    methods
        function obj = static_file(file_path)
            %
            %   f = graphpad.static_file(file_path);
%             dom = xmltree(file_path);
            %childNodes.item
            %s = parseXML(file_path);
            %atts = dom.getAttributes();
            %c = dom.getChildNodes
            
            dom = xmlread(file_path);
            keyboard
        end
    end
end