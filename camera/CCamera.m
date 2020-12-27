classdef CCamera
    %CCAMERA Computational Camera
    %   Allows for more complex camera designs, potentially including:
    %   * Burst captures, including support for camera and object motion
    %   * More sophisticated ISP features
    %   *     including support for "Intents" provided by the user
    %   *     and potentially for multiple camera modules used for one
    %         photo
    
    properties
        cmodule; % 1 (or more) CModules
        isp;     % an ip or maybe something that extends an ip
        
    end
    
    methods
        function obj = CCamera(inputArg1,inputArg2)
            %CCAMERA Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = TakePicture(obj, 'scene', scene, 'intent', intent)
            %TakePicture Main function telling us to create a photo
            
            % scene can be either a scene struct (static)
            % or an array of scenes or a CSCene (in theory)
            % unless we want to force the caller to generat a CScerne
            % to simplify our life. That gives us .preview, .render
            % with support for motion and an array of shutter times
            % 
            % In addition to main intents, someday we could get fancy
            % and allow the user to specify one of a multiple of cameras
            % (like Wide-angle, or Telephoto)
            
            % Determine how to capture & process based on desired outcome
            % For complex intents, process may involve taking a preview
            % of the scene (maybe just the first frame of a multiple scene
            % input, so maybe we don't need to do a CScene.Preview?
            
            switch intent
                case {'Auto', 'Portrait', 'Scenic', 'Action', ...
                        'Night'}
                    % split these apart as they are implemented
                    % we might also want to add more "techie" intents
                    % like 'burst' rather than relying on them being
                    % activated based on some other user choice
                case 'HDR'
                    % use the bracketing code
                case 'burst'
                    % not sure burst is ever really a "user intent" but
                    % it might make sense to allow it. Otherwise it could
                    % just be the way a particular camera implements
                    % some of the other intents
                case 'pro'
                    % here we allow the user to set exposure time,
                    % focus, exposure comp if AutoExpose, WB, etc.
                    % Might force camera to a specific module also?
                    % Zoom is settable, but might be digital??
                    % Aperture also, maybe some shutter modes at some point
                case 'otherwise'
                    error("Unknown photo intent");
            end
            
            function save(obj, sFileName)
                save(sFileName, obj);
            end
            
            function load(obj, lFileName)
                % how do we make sure this gets loaded into us
                % or should we just have an initializer that uses load?
                load(lFileName, obj)
            end
    end
end

