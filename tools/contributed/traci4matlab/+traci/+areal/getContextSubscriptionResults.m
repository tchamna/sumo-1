function contextSubscriptionResults = getContextSubscriptionResults(detID)
%getContextSubscriptionResults Get the context subscription results for the
%   last time step.
%   contextSubscriptionResults = getContextSubscriptionResults(DETID) 
%   Returns the context subscription results for the last time step and the
%   given areal detector. If no areal detector id is given, all subscription results are 
%   returned in a containers.Map data struccure. If the areal detector id is unknown 
%   or the subscription did for any reason return no data, 'None' is 
%   returned.
%   It is not possible to retrieve older subscription results than the ones
%   from the last time step.

%   Copyright 2016 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: getContextSubscriptionResults.m 31 2016-09-28 15:16:56Z afacostag $

global arealSubscriptionResults
if isempty(arealSubscriptionResults)
    throw(MException('traci:FatalTraCIError',...
        'You have to subscribe to the variable'));
end
if nargin < 1
    detID=None;
end
contextSubscriptionResults = arealSubscriptionResults.getContext(detID);