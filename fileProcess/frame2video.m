function frame2video(varargin)
    nVarargs = length(varargin);
    if nVarargs < 2
        display('not enough parameters');
        return;
    end
    framesPath = varargin{1};
    videoName = varargin{2};
    if nVarargs == 3
        fps = varargin{3};
    end
    
    %framesPath ????????????????????
    %videoName ??????????????
    %fps ??,??25
    list = dir([framesPath '*.jpg']);
    startFrame = 1; %??????  
    endFrame = length(list); %?????  
      
    if(exist('videoName','file'))  
        delete videoName.avi
    end  
    
    %?????????  
    aviobj=VideoWriter(videoName);  %????avi?????????????  
    aviobj.FrameRate=fps;  
      
    open(aviobj);%Open file for writing video data  
    %????  
    for i=startFrame:10:endFrame
        frames=imread([framesPath,list(i).name]);  
        writeVideo(aviobj,frames);  
    end  
    close(aviobj);% ??????  
end