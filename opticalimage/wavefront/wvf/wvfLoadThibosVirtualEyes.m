function [sample_mean, sample_cov] = wvfLoadThibosVirtualEyes(pupilDiameterMM)
% Load Thibos mean and covariance of Zernike coefficients for human data
%
%   [sample_mean, sample_cov] = wvfLoadThibosVirtualEyes(pupilDiameterMM)
%
% Load statistical summary of the Zernike polynomial coeffcients measured
% in the human eye.  These come out in OSA order, including the j = 0
% (piston) term.
%
% For each pupil size, there are different numbers of Zernike polynomials.
% Presumably this is because as the pupil area gets bigger they felt they
% needed more basis terms?  Read the paper to understand.
%
% The data and model are described in
%   "Retinal Image Quality for Virtual Eyes Generated by a Statistical
%   Model of Ocular Wavefront Aberrations" published in Ophthalmological
%   and Physiological Optics (2009).
%
% Concerning the program, the authors write:
%   Permission is granted to use this program for scientific research
%   purposes.  Commercial users should contact Indiana University for
%   licensing arrangements.
%
%   There are no specific comments about the data.
%
% A related paper
%   Autrusseau, Thibos and Shevell (2011)
%   Vision Research
%   Chromatic and wavefront aberrations: L-, M- and S-cone stimulation with
%   typical and extreme retinal image quality
%   http://www.sciencedirect.com/science/article/pii/S0042698911003099
%
% DHB compared these calculations to the figures in the Autrusseau paper.
%
% Example:
%   pd = 6.0;
%   [sample_mean sample_cov] = vwfLoadHuman(pd);
%
% See also: s_wvfThibosModel
%
% Example:
%   s3 = wvfLoadThibosVirtualEyes(3.0);
%   s4 = wvfLoadThibosVirtualEyes(4.5);
%   s6 = wvfLoadThibosVirtualEyes(6.0);
%   s7 = wvfLoadThibosVirtualEyes(7.5);
%   N = length(s3);
%   vcNewGraphWin; plot(s3(1:N),s4(1:N),'o'); axis equal; grid on
%   vcNewGraphWin; plot(s4(1:N),s6(1:N),'o'); axis equal; grid on
%   vcNewGraphWin; plot(s6(1:N),s7(1:N),'o'); axis equal; grid on
%   vcNewGraphWin; plot(s3(1:N),s7(1:N),'o'); axis equal; grid on
%
% Copyright Wavefront Toolbox Team, 2012

if notDefined('pupilDiameterMM'), pupilDiameterMM = 6; end

%%
sample_mean = [];
switch pupilDiameterMM
    case 7.5
        load('IASstats75','S','sample_mean');
    case 6.0
        load('IASstats60','S','sample_mean');
    case 4.5
        load('IASstats45','S','sample_mean');
    case 3.0
        load('IASstats30','S','sample_mean');
        
    otherwise
        error('Unknown pupil size %.1f. Options are 3, 4.5, 6, 7.5.\n',pupilDiameterMM)
end

sample_cov = S;

end