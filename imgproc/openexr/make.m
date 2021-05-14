clc;
verbose = false;


% -----------------------------------------------
build_files = { 'exrinfo.cpp', ...
    'exrread.cpp', ...
    'exrreadchannels.cpp', ...
    'exrwrite.cpp', ...
    'exrwritechannels.cpp'};

companion_files = { 'utilities.cpp', ...
    'ImfToMatlab.cpp', ...
    'MatlabToImf.cpp'};

additionals = {};
if(verbose == true)
    additionals = [additionals, {'-v'}];
end

for n = 1:size(build_files, 2)
    if(verbose == true)
        clc;
    end
    
    file = cell2mat(build_files(n));
    
    disp(['Building ', file]);
    
    mex(file, companion_files{:}, ...
        '-I/usr/local/include/OpenEXR', ...
        '-L/usr/local/lib', ...
        '-lIlmImf', ...
        '-lIex', ...
        '-lImath', ...
        '-lHalf', ...
        '-lIlmThread', ...
        '-largeArrayDims', ...
        additionals{:});
end

clear;
disp('Finished building OpenEXR for Matlab');