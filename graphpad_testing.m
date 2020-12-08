% Set Prism = CreateObject("Prism.command")
% Prism.SetPath (”C:\data\july99”)
% Prism.visible
% Prism.runcommand (“c:\prism5\doseresp.pzc")
% Prism.quit

h = actxGetRunningServer('Prism.command');
h = actxserver('Prism.command');
 
%Makes program visible
invoke(h,'visible')

%Opens file
h2 = invoke(h,'Open','D:\repos\matlab_git\bladder_analysis\data_files\summary_data\2017_StateDependentStim\test.pzfx');
%h2: NaN

invoke(h,'runcommand','C:\temp_graphpad\copy.pzc');

%This may block with a prompt
%invoke(h,'Open','rapid.pzt')

%https://stackoverflow.com/questions/1636908/manual-way-to-call-com-object-through-net
wtf = System.Type.GetTypeFromProgID('Prism.command');

obj = System.Activator.CreateInstance(wtf)

var type = Type.GetTypeFromProgID(progIdString);
var obj = Activator.CreateInstance(type);
var server = (IComponentServer)obj;



% Set Prism = CreateObject("Prism.command")
% Prism.SetPath (”C:\data\july99”)
% Prism.visible
% Prism.runcommand (“c:\prism5\doseresp.pzc")
% Prism.quit
% 
% Set Prism = Nothing