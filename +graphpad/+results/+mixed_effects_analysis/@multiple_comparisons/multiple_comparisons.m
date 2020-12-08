classdef multiple_comparisons < handle
    %
    %   Class:
    %   graphpad.results.mixed_effects_analysis.multiple_comparisons
    
    %{
    
        app = graphpad.application;
        %Select the multiple comparsion of interest ...
        str = app.commands.copy()
        r = graphpad.results.mixed_effects_analysis.multiple_comparisons(str);
    
    %}
    
    
    
    properties
        n_families %??? When will this not be 1?
        n_comparisons_per_family
        Q
    end
    
    methods
        function obj = multiple_comparisons(raw_str)
            tb = sl.str.split(raw_str,'row_split',true,'d','\t');
            %Not sure if we're always going to have an empty row ...
            if sl.cellstr.emptyRow(tb,1)
                tb(1,:) = [];
            end
            %TODO: Ideally we would test for strings being present ...
            obj.n_families = str2double(tb{1,2});
            obj.n_comparisons_per_family = str2double(tb{2,2});
            obj.Q = str2double(tb{2,2});
            
            if obj.n_families ~= 1
                error('Code only works for 1 family, assumption violated')
            end
            
            %The format is going to change based on 
            %There is probably a better way to do this ...
            
            keyboard
            
            %JAH TODO: At this point ...
            
            column_names = tb(5,:);
            start_row1 = 6;
            
            %+2
            %the first part goes to an empty row
            %followed by the header names 
            %followed by the the values
            start_row2 = start_row1 + obj.n_comparisons_per_family + 2;
            test_detail_names = tb(start_row2-1,:);
            
            for i = 1:obj.n_comparisons_per_family
                
                
            end
        end
    end
end

