classdef eodrecorder2_source < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        DataAcquisitionLiveFigure     matlab.ui.Figure
        EODRecorder2Label             matlab.ui.control.Label
        LiveViewPanel                 matlab.ui.container.Panel
        LiveAxes                      matlab.ui.control.UIAxes
        TimewindowsSpinnerLabel       matlab.ui.control.Label
        TimewindowSpinner             matlab.ui.control.Spinner
        YmaxSpinnerLabel              matlab.ui.control.Label
        YmaxSpinner                   matlab.ui.control.Spinner
        capturedataplot               matlab.ui.control.UIAxes
        YminSpinnerLabel              matlab.ui.control.Label
        YminSpinner                   matlab.ui.control.Spinner
        AutoscaleYSwitchLabel         matlab.ui.control.Label
        AutoscaleYSwitch              matlab.ui.control.Switch
        TabGroup                      matlab.ui.container.TabGroup
        DAQSetupTab                   matlab.ui.container.Tab
        DevicePanel                   matlab.ui.container.Panel
        ChannelDropDownLabel          matlab.ui.control.Label
        ChannelDropDown               matlab.ui.control.DropDown
        MeasurementTypeDropDownLabel  matlab.ui.control.Label
        MeasurementTypeDropDown       matlab.ui.control.DropDown
        RangeDropDownLabel            matlab.ui.control.Label
        RangeDropDown                 matlab.ui.control.DropDown
        TerminalConfigDropDownLabel   matlab.ui.control.Label
        TerminalConfigDropDown        matlab.ui.control.DropDown
        CouplingDropDownLabel         matlab.ui.control.Label
        CouplingDropDown              matlab.ui.control.DropDown
        DeviceDropDownLabel           matlab.ui.control.Label
        DeviceDropDown                matlab.ui.control.DropDown
        SampleRateHzLabel             matlab.ui.control.Label
        RateSlider                    matlab.ui.control.Slider
        RateEdit                      matlab.ui.control.NumericEditField
        AcquireTab                    matlab.ui.container.Tab
        SpecimenMetadataPanel         matlab.ui.container.Panel
        WaterParametersLabel_2        matlab.ui.control.Label
        CommentsTextAreaLabel_3       matlab.ui.control.Label
        comments                      matlab.ui.control.TextArea
        DistanceEditFieldLabel_3      matlab.ui.control.Label
        caldist                       matlab.ui.control.EditField
        RatioEditFieldLabel           matlab.ui.control.Label
        calratio                      matlab.ui.control.EditField
        GainDropDown_2Label           matlab.ui.control.Label
        calibrated                    matlab.ui.control.CheckBox
        gain                          matlab.ui.control.DropDown
        VDDropDown_2Label             matlab.ui.control.Label
        vd                            matlab.ui.control.DropDown
        ACDCLabel_3                   matlab.ui.control.Label
        amplifiercoupling             matlab.ui.control.DropDown
        HPDropDown_2Label             matlab.ui.control.Label
        hp                            matlab.ui.control.DropDown
        LPDropDown_2Label             matlab.ui.control.Label
        lp                            matlab.ui.control.DropDown
        AmplifierSettingsLabel_2      matlab.ui.control.Label
        CondEditField_2Label          matlab.ui.control.Label
        cond                          matlab.ui.control.EditField
        TempLabel_3                   matlab.ui.control.Label
        temp                          matlab.ui.control.EditField
        LocationEditFieldLabel_3      matlab.ui.control.Label
        location                      matlab.ui.control.EditField
        SpeciesEditFieldLabel_3       matlab.ui.control.Label
        species                       matlab.ui.control.EditField
        SpecimenEditFieldLabel_3      matlab.ui.control.Label
        specimenno                    matlab.ui.control.EditField
        DistanceEditFieldLabel_4      matlab.ui.control.Label
        caldist_2                     matlab.ui.control.EditField
        RatioEditField_2Label         matlab.ui.control.Label
        calratio_2                    matlab.ui.control.EditField
        GainDropDownLabel             matlab.ui.control.Label
        calibrated_2                  matlab.ui.control.CheckBox
        gain_2                        matlab.ui.control.DropDown
        VDDropDownLabel               matlab.ui.control.Label
        vd_2                          matlab.ui.control.DropDown
        ACDCLabel_4                   matlab.ui.control.Label
        amplifiercoupling_2           matlab.ui.control.DropDown
        HPDropDownLabel               matlab.ui.control.Label
        hp_2                          matlab.ui.control.DropDown
        LPDropDownLabel               matlab.ui.control.Label
        lp_2                          matlab.ui.control.DropDown
        CondEditFieldLabel            matlab.ui.control.Label
        cond_2                        matlab.ui.control.EditField
        TempLabel_4                   matlab.ui.control.Label
        temp_2                        matlab.ui.control.EditField
        CommentsTextAreaLabel_4       matlab.ui.control.Label
        comments_2                    matlab.ui.control.TextArea
        InvertSelectedButton          matlab.ui.control.Button
        LocationEditFieldLabel_4      matlab.ui.control.Label
        location_2                    matlab.ui.control.EditField
        SpeciesEditFieldLabel_4       matlab.ui.control.Label
        species_2                     matlab.ui.control.EditField
        SpecimenEditFieldLabel_4      matlab.ui.control.Label
        specimenno_2                  matlab.ui.control.EditField
        AquisitionModeButtonGroup     matlab.ui.container.ButtonGroup
        SingleButton                  matlab.ui.control.ToggleButton
        TimedButton                   matlab.ui.control.ToggleButton
        StartButton                   matlab.ui.control.Button
        StopButton                    matlab.ui.control.Button
        TimedPanel                    matlab.ui.container.Panel
        LengthsecLabel                matlab.ui.control.Label
        recordlength                  matlab.ui.control.NumericEditField
        SinglePanel                   matlab.ui.container.Panel
        CaptureButton                 matlab.ui.control.Button
        LevelVLabel                   matlab.ui.control.Label
        level                         matlab.ui.control.NumericEditField
        WindowsecLabel                matlab.ui.control.Label
        window                        matlab.ui.control.NumericEditField
        nptsEditFieldLabel            matlab.ui.control.Label
        nptsEditField                 matlab.ui.control.NumericEditField
        RecordingsTab                 matlab.ui.container.Tab
        WaveFilesListBoxLabel         matlab.ui.control.Label
        WaveFilesListBox              matlab.ui.control.ListBox
        DeleteSelectedButton          matlab.ui.control.Button
        DeleteRecordingsandStartNewSessionButton  matlab.ui.control.Button
        SaveTab                       matlab.ui.container.Tab
        SavetoFileButton              matlab.ui.control.Button
        BasenameEditField             matlab.ui.control.EditField
        FilepathEditField             matlab.ui.control.EditField
        ChooseButton                  matlab.ui.control.Button
        filebrowser                   matlab.ui.control.Table
        BasenameEditFieldLabel        matlab.ui.control.Label
        FilepathEditFieldLabel        matlab.ui.control.Label
        LogStatusText                 matlab.ui.control.Label
        StatusLabel                   matlab.ui.control.Label
        savedDataView                 matlab.ui.container.Panel
        saveddataplot                 matlab.ui.control.UIAxes
        FigTItle                      matlab.ui.control.Label
        SpecimenMetadataPanel_2       matlab.ui.container.Panel
        WaterParametersLabel          matlab.ui.control.Label
        AmplifierSettingsLabel        matlab.ui.control.Label
        CalibrationSettingsLabel      matlab.ui.control.Label
    end

    % 2018/02/09 AU
    % Copyright 2018 The MathWorks, Inc.

    properties (Access = public)
        DAQSession % Handle to DAQ session
    end
    
    properties (Access = private)
        DevicesInfo % Array of devices that provide analog input voltage or audio input measurements
        DataAvailableListener % Listener for DAQ session 'DataAvailable' event
        LogRequested % Logical value, indicates whether user selected to log data to file from the UI (set by LogdatatofileSwitch)
        TimestampsFIFOBuffer % Timestamps FIFO buffer used for live plot of latest "N" seconds of acquired data
        DataFIFOBuffer  % Data FIFO buffer used for live plot of latest "N" seconds of acquired data
        FIFOMaxSize = 1E+6  % Maximum allowed FIFO buffer size for DataFIFOBuffer and TimestampsFIFOBuffer
        LivePlotLine % Handle to line plot of acquired data
        CapturedData %Handle for Captured Data
        CapturedTime % Handle for Captured Timestapms
        CapturedPlotLine %Handle to line plot of captured data
        SavedPlotLine % Handle to line plot of saved data
        TriggerTime % Acquisition start time stored as datetime
        TriggerLevel % Handle for Trigger Data
        TempFilename % Temporary binary file name, acquired data is logged to this file during acquisition
        TempFile % Handle of opened binary file, acquired data is logged to this file during acquisition
        Filename = 'longrecord.leod.mat' % Default MAT file name at app start
        Filepath = pwd % Default folder for saving the MAT file at app start
        capturestate = false % Description
        mode = 1 % Description
        wavecount = 1 % Description
        trigActive = false % Description
        trigMoment = NaN % Description
        selectedwave % Description
        eodfilepath % Description
        eodbasename % Description
    end
    
    methods (Access = private)
        
        
        function dataAvailable_Callback(app, ~, event)
        %dataAvailable_Callback Executes on DAQ session DataAvailable event
        %  This callback function gets executed periodically as more data is acquired.
        %  For a smooth live plot update, it stores the latest N seconds
        %  (specified time window) of acquired data and relative timestamps in FIFO
        %  buffers. A live plot is updated with the data in the FIFO buffer.
        %  If data logging option is selected in the UI, it also writes data to a
        %  binary file.

            % Store continuous acquisition data in FIFO data buffers
            buffersize = round(app.DAQSession.Rate * app.TimewindowSpinner.Value) + 1;
            app.TimestampsFIFOBuffer = storeDataInFIFO(app, app.TimestampsFIFOBuffer, buffersize, event.TimeStamps);
            app.DataFIFOBuffer = storeDataInFIFO(app, app.DataFIFOBuffer, buffersize, event.Data(:,1));
        
            
            if app.mode == 1
            
                set(app.TriggerLevel,'XData',[min(app.TimestampsFIFOBuffer),max(app.TimestampsFIFOBuffer)],'YData',[app.level.Value, app.level.Value]);
            
                if app.capturestate && (~app.trigActive)
                    % State: "Looking for trigger event"
                
                    % Update UI status
                    app.LogStatusText.Text= 'Waiting for trigger';
                
                    % Determine whether trigger condition is met in the latest acquired data
                    % A custom trigger condition is defined in trigDetect user function
                    [app.trigActive, app.trigMoment] = app.trigDetect(event.TimeStamps,event.Data, app.level.Value);
            
                elseif app.capturestate && app.trigActive && ((app.TimestampsFIFOBuffer(end,1)-app.trigMoment) > app.window.Value/2)
                    % State: "Acquired enough data for a complete capture"
                    % If triggered and if there is enough data in dataBuffer for triggered
                    % capture, then captureData can be obtained from dataBuffer.
                
                    % Find index of sample in dataBuffer with timestamp value trigMoment
                    trigSampleIndex = find(app.TimestampsFIFOBuffer(:,1) == app.trigMoment, 1, 'first');
                    % Find index of sample in dataBuffer to complete the capture
                    lastSampleIndex = round((trigSampleIndex + (app.npts.Value/2) * app.DAQSession.Rate));
                    firstSampleIndex = round((trigSampleIndex - ((app.npts.Value/2)-1) * app.DAQSession.Rate));
                    
                    app.CapturedData(app.wavecount).Metadata=gathermetadata(app);
                    app.CapturedData(app.wavecount).Data = app.DataFIFOBuffer(firstSampleIndex:lastSampleIndex, :);
                    app.CapturedData(app.wavecount).Time= app.TimestampsFIFOBuffer(firstSampleIndex:lastSampleIndex, :);
    
                    % Reset trigger flag, to allow for a new triggered data capture
                    app.trigActive = false;
                
                    % Update captured data plot (one line for each acquisition channel)
                    set(app.CapturedPlotLine, 'XData', app.CapturedData(app.wavecount).Time, 'YData', app.CapturedData(app.wavecount).Data);
                                %Enable Captured Data Autoscale
                
                    % Update UI to show that capture has been completed
                    app.capturestate=false;
                    app.LogStatusText.Text= '';
                    
                    app.wavecount=app.wavecount+1;
    
                
                    % Save captured data to a base workspace variable
                    % For simplicity, validation of user input and checking whether a variable
                    % with the same name already exists are not addressed in this example.
                    % Get the variable name from UI text input
                    %varName = get(hGui.VarName, 'String');
                    % Use assignin function to save the captured data in a base workspace variable
                    %assignin('base', varName, captureData);
                
                elseif app.capturestate && app.trigActive && ((app.TimestampsFIFOBuffer(end,1)-app.trigMoment) < app.window.Value/2)
                    % State: "Capturing data"
                    % Not enough acquired data to cover capture timespan during this callback execution
                    app.LogStatusText.Text= 'Triggered';
                
                elseif ~app.capturestate
                    % State: "Capture not requested"
                    % Capture toggle button is not pressed, set trigger flag and update UI
                    app.trigActive = false;
                    app.LogStatusText.Text= '';
                end
            end
            
            if app.mode ==2
                %save function
                data = [event.TimeStamps, event.Data]' ;
                fwrite(app.TempFile, data, 'double');
                    if event.TimeStamps(1)==0
                        app.TriggerTime = event.TriggerTime;
                    end
                
                if app.recordlength.Value > 0
                    timesup=timer(app,event.TimeStamps,app.recordlength.Value);
                    
                    if timesup
                        stopaquire(app)
                    end
                end
            end
            
        set(app.LivePlotLine, 'XData', app.TimestampsFIFOBuffer, 'YData', app.DataFIFOBuffer);
            if numel(app.TimestampsFIFOBuffer) > 1
                xlim(app.LiveAxes, [app.TimestampsFIFOBuffer(1), app.TimestampsFIFOBuffer(end)])
            end
        end

        function data = storeDataInFIFO(~, data, buffersize, datablock)
        %storeDataInFIFO Store continuous acquisition data in a FIFO data buffer
        %  Storing data in a finite-size FIFO buffer is used to plot the latest "N" seconds of acquired data for
        %  a smooth live plot update and without continuously increasing memory use.
        %  The most recently acquired data (DATABLOCK) is added to the buffer and if the amount of data in the 
        %  buffer exceeds the specified buffer size (BUFFERSIZE) the oldest data is discarded to cap the size of
        %  the data in the buffer to BUFFERSIZE.
        %  input DATA is the existing data buffer (column vector Nx1).
        %  BUFFERSIZE is the desired buffer size (maximum number of rows in DATA buffer) and can be changed.
        %  DATABLOCK is a new data block to be added to the buffer (column vector Kx1).
        %  output DATA is the updated data buffer (column vector Mx1).
        
        % If the data size is greater than the buffer size, keep only the
        % the latest "buffer size" worth of data
        % This can occur if the buffer size is changed to a lower value during acquisition
            if size(data,1) > buffersize
                data = data(end-buffersize+1:end,:);
            end
            
            if size(datablock,1) < buffersize
                % Data block size (number of rows) is smaller than the buffer size
                if size(data,1) == buffersize
                    % Current data size is already equal to buffer size.
                    % Discard older data and append new data block,
                    % and keep data size equal to buffer size.
                    shiftPosition = size(datablock,1);
                    data = circshift(data,-shiftPosition);
                    data(end-shiftPosition+1:end,:) = datablock;
                elseif (size(data,1) < buffersize) && (size(data,1)+size(datablock,1) > buffersize)
                    % Current data size is less than buffer size and appending the new
                    % data block results in a size greater than the buffer size.
                    data = [data; datablock];
                    shiftPosition = size(data,1) - buffersize;
                    data = circshift(data,-shiftPosition);
                    data(buffersize+1:end, :) = [];
                else
                    % Current data size is less than buffer size and appending the new
                    % data block results in a size smaller than or equal to the buffer size.
                    % (if (size(data,1) < buffersize) && (size(data,1)+size(datablock,1) <= buffersize))
                    data = [data; datablock];
                end
            else
                % Data block size (number of rows) is larger than or equal to buffer size
                data = datablock(end-buffersize+1:end,:);
            end
            
        end
        
        function [items, itemsData] = getChannelPropertyOptions(~, subsystem, propertyName)
        %getChannelPropertyOptions Get options available for a DAQ channel property
        %  Returns items and itemsData for displaying options in a dropdown component
        %  subsystem is the DAQ subsystem handle corresponding to the DAQ channel
        %  propertyName is channel property name as a character array, and can be
        %    'TerminalConfig', or 'Coupling', or 'Range'.
        %  items is a cell array of possible property values, for example {'DC', 'AC'}
        %  itemsData is [] (empty) for 'TerminalConfig' and 'Coupling', and is a cell array of
        %     available ranges for 'Range', for example {[-10 10], [-1 1]}
            
            switch propertyName
                case 'TerminalConfig'
                    items = cellstr(string(subsystem.TerminalConfigsAvailable));
                    itemsData = [];
                case 'Coupling'
                    items = cellstr(string(subsystem.CouplingsAvailable));
                    itemsData = [];
                case 'Range'
                    for ii = 1:numel(subsystem.RangesAvailable)
                        range = subsystem.RangesAvailable(ii);
                        items{ii} = sprintf('%.2f to %.2f', range.Min, range.Max);
                        itemsData{ii} = [range.Min range.Max];
                    end
            end
        end
        
        
        function setAcquisitionControlsState(app, state)
        %setAcquisitionControlsState Enable or disable group of UI components that configure acquisition
        %  STATE can be 'on' or off'
            
            app.RateEdit.Enable = state;
            app.RateSlider.Enable = state;
            app.DeviceDropDown.Enable = state;
            app.ChannelDropDown.Enable = state;
            app.MeasurementTypeDropDown.Enable = state;
            app.RangeDropDown.Enable = state;
            app.TerminalConfigDropDown.Enable = state;
            app.CouplingDropDown.Enable = state;
            app.StartButton.Enable = state;
            
            % Audio channels do not have TerminalConfig and Coupling properties,
            % so disable the corresponding UI controls
            if ~isempty(app.DAQSession) && strcmp(app.DAQSession.Channels(1).MeasurementType, 'Audio')
                app.TerminalConfigDropDown.Enable = 'off';
                app.CouplingDropDown.Enable = 'off';
            end
            
        end
        
        
        function binFile2MAT(~, filenameIn, filenameOut, numColumns, metadata)
        %BINFILE2MAT Loads 2-D array of doubles from binary file and saves data to MAT file
        % Processes all data in binary file (filenameIn) and saves it to a MAT file without loading
        % all data to memory.
        % If output MAT file (filenameOut) already exists, data is overwritten (not appended).
        % Input binary file is a matrix of doubles with numRows x numColumns
        % MAT file (filenameOut) is a MAT file with the following variables
        %   timestamps = a column vector ,  the first column in the data from binary file
        %   data = a 2-D array of doubles, includes 2nd-last columns in the data from binary file
        %   metatada = a structure, which is provided as input argument, used to provide additional
        %              data information
        %
            
            % If filenameIn does not exist, error out
            if ~exist(filenameIn, 'file')
                error('Input binary file ''%s'' not found. Specify a different file name.', filenameIn);
            end
            
            % If output MAT file already exists, delete it
            if exist(filenameOut, 'file')
                delete(filenameOut)
            end
            
            % Determine number of rows in the binary file
            % Expecting the number of bytes in the file to be 8*numRows*numColumns
            fileInfo = dir(filenameIn);
            numRows = floor(fileInfo.bytes/(8*double(numColumns)));
            
            % Create matfile object to save data loaded from binary file
            matObj = matfile(filenameOut);
            matObj.Properties.Writable = true;
            
            % Initialize MAT file
            matObj.timestamps(numRows,1) = 0;
            matObj.data(numRows,1) = 0;
            
            % Open input binary file
            fid = fopen(filenameIn,'r');
            
            % Specify how many rows to process(load and save) at a time
            numRowsPerChunk = 10E+6;
            
            % Keeps track of how many rows have been processed so far
            ii = 0;
            
            while(ii < numRows)
                
                % chunkSize = how many rows to process in this iteration
                % If it's the last iteration, it's possible the number of rows left to
                % process is different from the specified numRowsPerChunk
                chunkSize = min(numRowsPerChunk, numRows-ii);
                
                data = fread(fid, [numColumns,chunkSize], 'double');
                
                matObj.timestamps((ii+1):(ii+chunkSize), 1) = data(1,:)';
                matObj.wave((ii+1):(ii+chunkSize), 1) = data(2:end,:)';
                
                ii = ii + chunkSize;
            end
            
            fclose(fid);
            
            % Save provided metadata to MAT file
             matObj.DeviceInfo=metadata.DeviceInfo;
             matObj.Channel=metadata.Channel;
             matObj.MeasurementType=metadata.MeasurementType;
             matObj.Range=metadata.Range;
             matObj.Coupling=metadata.Coupling;
             matObj.TerminalConfig=metadata.TerminalConfig;
             matObj.Rate=metadata.Rate;
             matObj.amplifiercoupling=metadata.amplifiercoupling;
             matObj.species=metadata.species;
             matObj.location=metadata.location;
             matObj.temp=metadata.temp;
             matObj.specimenno=metadata.specimenno;
             matObj.gain=metadata.gain;
             matObj.comments=metadata.comments;
             matObj.time=metadata.time; %this should be the "time" of recording
             matObj.date=metadata.date; %this should be the "date" of recording
        end
        
        
        function filteredDevices = filterDevicesBySubsystem(~, devices, subsystemTypes)
        %filterDevicesBySubsystem Filter DAQ device array by subsystem type
        %  devices is a DAQ device info array
        %  subsystemTypes is a cell array of DAQ subsystem types, for example {'AnalogInput, 'AnalogOutput'}
        %  filteredDevices is the filtered DAQ device info array
            
            % Logical array indicating if device has any of the subsystem types provided
            hasSubsystemArray = false(numel(devices), 1);
            
            % Go through each device and see if it has any of the subsystem types provided
            for ii = 1:numel(devices)
                hasSubsystem = false;
                for jj = 1:numel(subsystemTypes)
                    hasSubsystem = hasSubsystem || ...
                        any(strcmp({devices(ii).Subsystems.SubsystemType}, subsystemTypes{jj}));
                end
                hasSubsystemArray(ii) = hasSubsystem;
            end
            filteredDevices = devices(hasSubsystemArray);
        end
        
        
        function filteredDevices = filterDevicesByMeasurement(~, devices, measurementTypes)
        %filterDevicesByMeasurement Filter DAQ device array by measurement type
        %  devices is a DAQ device info array
        %  measurementTypes is a cell array of measurement types, for example {'Voltage, 'Current'}
        %  filteredDevices is the filtered DAQ device info array
            
            % Logical array indicating if device has any of the measurement types provided
            hasMeasurementArray = false(numel(devices), 1);
            
            % Go through each device and subsystem and see if it has any of the measurement types provided
            for ii = 1:numel(devices)
                % Get array of available subsystems for the current device
                subsystems = [devices(ii).Subsystems];
                hasMeasurement = false;
                for jj = 1:numel(subsystems)
                    % Get cell array of available measurement types for the current subsystem
                    measurements = subsystems(jj).MeasurementTypesAvailable;
                    for kk = 1:numel(measurementTypes)
                        hasMeasurement = hasMeasurement || ...
                            any(strcmp(measurements, measurementTypes{kk}));
                    end
                end
                hasMeasurementArray(ii) = hasMeasurement;
            end
            filteredDevices = devices(hasMeasurementArray);
        end
        
        
        function updateRateUIComponents(app)
        %updateRateUIComponents Updates UI with current rate and time window limits
            
            % Update UI to show the actual session rate and limits
            value = app.DAQSession.Rate;
            app.RateEdit.Value = value;
            app.RateSlider.Limits = app.DAQSession.RateLimit;
            app.RateSlider.Value = value;
            
            % Update time window limits
            % Minimum time window shows 2 samples
            % Maximum time window corresponds to the maximum specified FIFO buffer size
            minTimeWindow = 1/value;
            maxTimeWindow = app.FIFOMaxSize / value;
            app.TimewindowSpinner.Limits = [minTimeWindow, maxTimeWindow];
            
        end
        
        
        function closeApp_Callback(app, ~, event, isAcquiring)
        %closeApp_Callback Executes after "Close Confirm" dialog window
        %  "Close Confirm" dialog window is launched from DataAcquisitionLiveCloseRequest.
        %   before closing app if acquisition is currently on (isAcquiring=true) clean-up 
        %   DAQ session and close file if logging.
        
            switch event.SelectedOption
                case 'OK'
                    if isAcquiring
                        % Acquisition is currently on
                        stop(app.DAQSession)
                        delete(app.DataAvailableListener)
                        delete(app.DAQSession)
                        if app.LogRequested
                            fclose(app.TempFile);
                        end
                    else
                        % Acquisition is stopped
                    end
                    
                    % Re-enable warning when session rate is adjusted to closest supported sampling rate
                    warning('on', 'daq:Session:closestRateChosen')
                    delete(app)
                case 'Cancel'
                    % Continue
            end
            
        end
    
        function metadata = gathermetadata(app)
            % Gather metadata in preparation for saving to MAT file
                % changed code to gather from DAQ session, rather than
                % panel for absolute certainty.
                
                %app.DAQSession.Channels.Device.Subsystems.Resolution
                %deviceInfo = struct(app.DAQSession.Channels.Device);
                deviceInfo = get(app.DAQSession.Channels.Device);
                deviceInfo.Vendor=get(app.DAQSession.Channels.Device.Vendor);
                deviceInfo.Subsystems=get(app.DAQSession.Channels.Device.Subsystems(1));
                %deviceInfo = rmfield(deviceInfo, 'Subsystems');
                metadata.DeviceInfo = deviceInfo;
                metadata.Channel = app.DAQSession.Channels.ID;
                metadata.MeasurementType = app.DAQSession.Channels.MeasurementType;
                metadata.Range = app.DAQSession.Channels.Range;
                if ~strcmp(app.DAQSession.Channels.MeasurementType, 'Audio')
                    metadata.Coupling = app.DAQSession.Channels.Coupling;
                    metadata.TerminalConfig = app.DAQSession.Channels.TerminalConfig;
                else
                    metadata.Coupling = [];
                    metadata.TerminalConfig = [];
                end
                metadata.Rate = app.DAQSession.Rate;
                metadata.TriggerTime = datetime(app.TriggerTime, 'ConvertFrom', 'datenum', 'TimeZone', 'local');
                
                %these are pulled from metadata panel as typed
                metadata.amplifiercoupling=app.amplifiercoupling.Value;
                metadata.gain=app.gain.Value;
                metadata.species=app.species.Value;
                metadata.location=app.location.Value;
                metadata.temp=app.temp.Value;
                metadata.specimenno=app.specimenno.Value;
                metadata.comments=app.comments.Value;
                metadata.date=datestr(now,'mmmm dd, yyyy');
                metadata.time=datestr(now,'HH:MM:SS');
                metadata.LP_filter=app.lp.Value;
                metadata.HP_filter=app.hp.Value;
                metadata.conductivity=app.cond.Value;
                metadata.vd=app.vd.Value;
                metadata.calibrated=app.calibrated.Value;
                metadata.calibrationratio=app.calratio.Value;
                metadata.calibrationdistance=app.caldist.Value;
                
        end
    
        function [trigDetected, trigMoment] = trigDetect(~, latestTimes,latestData, level)
            %TRIGDETECT Detect if trigger condition is met in acquired data
            %   [TRIGDETECTED, TRIGMOMENT] = TRIGDETECT(PREVDATA, LATESTDATA, TRIGCONFIG)
            %   Returns a detection flag (TRIGDETECTED) and the corresponding timestamp
            %   (TRIGMOMENT) of the first data point which meets the trigger condition
            %   based on signal level and slope specified by the trigger parameters
            %   structure (TRIGCONFIG).
            %   The input data (LATESTDATA) is an N x M matrix corresponding to N acquired
            %   data scans, with the timestamps as the first column, and channel data
            %   as columns 2:M. The previous data point PREVDATA (1 x M vector of timestamp
            %   and channel data) is used to determine the slope of the first data point.
            %
            %   trigConfig.Channel = index of trigger channel in session channels
            %   trigConfig.Level   = signal trigger level (V)
            %   trigConfig.Slope   = signal trigger slope (V/s)
            
            % Condition for signal trigger level
            trigCondition1 = latestData(:, 1) > level;
            
            % Combined trigger condition to be used
            trigCondition = trigCondition1; 
            
            trigDetected = any(trigCondition);
            trigMoment = [];
            if trigDetected
                % Find time moment when trigger condition has been met
                trigTimeStamps = latestTimes(trigCondition, 1);
                trigMoment = trigTimeStamps(1);
            end
        end
        
        function [timesup] = timer(~, latestTimes,endtime)
           
            trigCondition = latestTimes(:, 1) > endtime;
            
            % Combined trigger condition to be used
            
            timesup = any(trigCondition);

        end
    
        
        function items = refreshwaves(~,wavelist)
            items=cellstr(num2str((1:length(wavelist))'));
        end
        
        function clearview(app)
                %metadata.DeviceInfo = deviceInfo;
                %metadata.Channel = app.ChannelDropDown.Value;
                %metadata.MeasurementType = app.MeasurementTypeDropDown.Value;
                %metadata.Range = app.RangeDropDown.Value;
                %metadata.Coupling = app.CouplingDropDown.Value;
                %metadata.TerminalConfig = app.TerminalConfigDropDown.Value;
                %metadata.Rate = app.RateEdit.Value;
                %metadata.TriggerTime = datetime(app.TriggerTime, 'ConvertFrom', 'datenum', 'TimeZone', 'local');
                app.amplifiercoupling_2.Value='';
                app.gain_2.Value='10';
                app.species_2.Value='';
                app.location_2.Value='';
                app.temp_2.Value='';
                app.specimenno_2.Value='';
                app.comments_2.Value='';
                app.lp_2.Value='DC';
                app.hp_2.Value='50000';
                app.cond_2.Value='';
                app.vd_2.Value='0';
                app.calibrated_2.Value=0;
                app.calratio_2.Value='';
                app.caldist_2.Value='';
        end
        
        function stopaquire(app)
            if ~isempty(app.DAQSession)
                stop(app.DAQSession);
            end
            
            % Enable DAQ device, channel properties, and start acquisition UI components
            setAcquisitionControlsState(app, 'on');
            
            % Disable acquisition stop button
            app.StopButton.Enable = 'off';
            
            if app.LogRequested
                % Log data to file switch is on
                % Save logged data to MAT file (unless the user clicks Cancel in the "Save As" dialog)
                
                % Close temporary binary file
                 
                if app.TempFile ~= -1
                    fclose(app.TempFile);
                end
                
                % Gather metadata in preparation for saving to MAT file
                % Store relevant Daq device info
                
                metadata = gathermetadata(app);

                % Open "Save As" to request destination MAT file path and file name from user
                [filename, pathname] = uiputfile({'*.leod.mat'}, 'Save as',...
                    fullfile(app.Filepath, app.Filename));
                
                if ~(isequal(filename,0) || isequal(pathname,0))
                    % User specified a file name in a folder with write permission
                    app.Filename = filename;
                    app.Filepath = pathname;
                    cancelSaveAs = false;
                else
                    %  User clicked Cancel in "Save As" dialog
                    cancelSaveAs = true;
                end
                
                if ~cancelSaveAs
                    % Convert data from binary file to MAT file
                    matFilepath = fullfile(app.Filepath, app.Filename);
                    app.LogStatusText.Text = 'Saving data...';
                    drawnow
                    
                    numColumns = 2;
                    binFile2MAT(app, app.TempFilename, matFilepath, numColumns, metadata);
                    app.LogStatusText.Text = sprintf('Saved data to ''%s'' !', app.Filename);
                    app.LivePlotLine = plot(app.LiveAxes, NaN, NaN);
                else
                    % User clicked Cancel in "Save As" dialog
                    % Inform user that data has not been saved
                    app.LogStatusText.Text = 'Save was cancelled.';
                    app.LivePlotLine = plot(app.LiveAxes, NaN, NaN);
                end
            end
        end
        
        function startaquire(app)
            if ~isempty(app.DAQSession) && ~(app.DAQSession.IsRunning)
                
                % Delete existing listener for DataAvailable event
                delete(app.DataAvailableListener);
                app.DataAvailableListener = [];
                
                % Create listener for DataAvailable event and specify callback function
                app.DataAvailableListener = addlistener(app.DAQSession,'DataAvailable', ...
                    @(src,event) dataAvailable_Callback(app, src, event));
                
                % Disable DAQ device, channel properties, and start acquisition UI components
                setAcquisitionControlsState(app, 'off');
                
                % Enable acquisition stop button
                app.StopButton.Enable = 'on';
                
                if app.LogRequested
                    % If Log data to file switch is on
                    % Create and open temporary binary file to log data to disk
                    app.TempFilename = tempname;
                    app.TempFile = fopen(app.TempFilename, 'w');                    
                end
                
                % Reset FIFO buffer data
                app.DataFIFOBuffer = [];
                app.TimestampsFIFOBuffer = [];
                
                startBackground(app.DAQSession);
                
                % Clear Log status text
                app.LogStatusText.Text = '';
            end
        end
        
        function saveEOD(~,datain,matout,eodout)
            fout = fopen(eodout, 'w');
            eod=[];
             for i=1:length(datain)
                 eod(i).DeviceInfo=datain(i).Metadata.DeviceInfo;
                 eod(i).Channel=datain(i).Metadata.Channel;
                 eod(i).MeasurementType=datain(i).Metadata.MeasurementType;
                 eod(i).Range=datain(i).Metadata.Range;
                 eod(i).Coupling=datain(i).Metadata.Coupling;
                 eod(i).TerminalConfig=datain(i).Metadata.TerminalConfig;
                 eod(i).Rate=datain(i).Metadata.Rate;
                 eod(i).amplifiercoupling=datain(i).Metadata.amplifiercoupling;
                 eod(i).species=datain(i).Metadata.species;
                 eod(i).location=datain(i).Metadata.location;
                 eod(i).temp=datain(i).Metadata.temp;
                 eod(i).specimenno=datain(i).Metadata.specimenno;
                 eod(i).gain=datain(i).Metadata.gain;
                 eod(i).comments=datain(i).Metadata.comments;
                 eod(i).time=datain(i).Metadata.time; %this should be the "time" of recording
                 eod(i).date=datain(i).Metadata.date; %this should be the "date" of recording
                 eod(i).wave=datain(i).Data;
                 eod(i).LP_filter=datain(i).Metadata.LP_filter;
                 eod(i).HP_filter=datain(i).Metadata.HP_filter;
                 eod(i).conductivity=datain(i).Metadata.conductivity;
                 eod(i).vd=datain(i).Metadata.vd;
                 eod(i).calibrated=strrep(strrep(sprintf('%d', datain(i).Metadata.calibrated), '1', 'True'), '0', 'False');
                 eod(i).calibrationratio=datain(i).Metadata.calibrationratio;
                 eod(i).calibrationdistance=datain(i).Metadata.calibrationdistance;
            
                %write to binary EOD File
                version = 2; %new version for the gallant lab
                n_bits = eod(i).DeviceInfo.Subsystems.Resolution;
                adrange=2^eod(i).DeviceInfo.Subsystems.Resolution;
                n_bytes = 2;
                data_polarity = 2;
                user_data = [0 0 0 0 0 0];
                s_rate = eod(i).Rate;
                n_pts = length(eod(i).wave);
                wave = eod(i).wave;
                date = eod(i).date;
                time = eod(i).time;
                coupling= eod(i).amplifiercoupling;
                wave_text=['Time = ', time, ';',...
                    'Date = ', date, ';',...
                    'Specimen = ', eod(i).specimenno, ';',...
                    'Species = ', eod(i).species, ';',...
                    'Location = ', eod(i).location, ';',...
                    'Temperature = ', eod(i).temp, ';',...
                    'Comments = ', eod(i).comments, ';',...
                    'Gain =  ', eod(i).gain,';', ...
                    'Coupling =  ', coupling,';',...
                    'LowPass = ', eod(i).LP_filter,';',...
                    'HighPass = ', eod(i).HP_filter,';',...
                    'Conductivity = ', eod(i).conductivity,';',...
                    'VoltageDivider = ', eod(i).vd,';',...
                    'EODCalibrated = ', eod(i).calibrated,';',...
                    'EODCalibrationRatio = ', eod(i).calibrationratio,';',...
                    'EODCalibrationDistance = ', eod(i).calibrationdistance];
                nchar_text = length(strjoin(wave_text));
                %  writes a multiwave file from the data in memory to the currently opened
                fwrite(fout,version,'char');
                fwrite(fout,nchar_text,'short');
                %  convert wave_text into array of ascii integers
                fwrite(fout,strjoin(wave_text),'char');
                % output a null character to terminate string
                %count=fwrite(fout,0,'char');  
                fwrite(fout,n_bits,'char');
                fwrite(fout,n_bytes,'char');
                fwrite(fout,data_polarity,'char');
                fwrite(fout,user_data,'float');
                fwrite(fout,s_rate,'ulong');
                fwrite(fout,adrange,'float');
                fwrite(fout,n_pts,'long');
                fwrite(fout,wave,'double');
             end
            fclose(fout);
            save(matout,'eod');
        end
        
        function metaupdate(app)   
                app.CapturedData(app.selectedwave).Metadata.amplifiercoupling=app.amplifiercoupling_2.Value;
                app.CapturedData(app.selectedwave).Metadata.gain=app.gain_2.Value;
                app.CapturedData(app.selectedwave).Metadata.species=app.species_2.Value;
                app.CapturedData(app.selectedwave).Metadata.location=app.location_2.Value;
                app.CapturedData(app.selectedwave).Metadata.temp=app.temp_2.Value;
                app.CapturedData(app.selectedwave).Metadata.specimenno=app.specimenno_2.Value;
                app.CapturedData(app.selectedwave).Metadata.comments=app.comments_2.Value;
                app.CapturedData(app.selectedwave).Metadata.LP_filter=app.lp_2.Value;
                app.CapturedData(app.selectedwave).Metadata.HP_filter=app.hp_2.Value;
                app.CapturedData(app.selectedwave).Metadata.conductivity=app.cond_2.Value;
                app.CapturedData(app.selectedwave).Metadata.vd=app.vd_2.Value;
                app.CapturedData(app.selectedwave).Metadata.calibrated=app.calibrated_2.Value;
                app.CapturedData(app.selectedwave).Metadata.calibrationratio=app.calratio_2.Value;
                app.CapturedData(app.selectedwave).Metadata.calibrationdistance=app.caldist_2.Value;
        end
        
        function refresh_filebrowser(app)
             a=dir(app.eodfilepath);                         % Obtains the contents of the selected path.
             b={a(:).name}';                      % Gets the name of the files/folders of the contents and stores them appropriately in a cell array
             b(ismember(b,{'.','..'})) = [];      % Removes unnecessary '.' and '..' results from the display.
             app.filebrowser.Data=b;  
            
        end
        
    end          

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            % This function executes when the app starts, before user interacts with UI
            
            app.savedDataView.Visible="off";
            app.LiveViewPanel.Visible="on";
            
            % When the app starts, the goal is to populate the device dropdown with a list
            % of devices that can do analog input voltage or audio input measurements.
            
            % Detect all connected devices
            devices = daq.getDevices;
            
            % Keep a subset of devices which have
            %  - analog input subsystem or audio input subsystem
            %  - voltage or audio measurement type
            devices = filterDevicesBySubsystem(app, devices, {'AnalogInput', 'AudioInput'});
            devices = filterDevicesByMeasurement(app, devices, {'Voltage', 'Audio'});
            
            % Populate the device drop down list with cell array of composite device names (ID + model)
            % First element is "Select a device"
            deviceDescriptions = cellstr(string({devices.ID}') + " [" + string({devices.Model}') + "]");
            app.DeviceDropDown.Items = ['Select a device'; deviceDescriptions];
            
            % Assign dropdown ItemsData to correspond to device index + 1
            % (first item is not a device)
            app.DeviceDropDown.ItemsData = 1:numel(devices)+1;
            
            % Store DAQ device information (filtered list) into DaqDevicesInfo app property
            % This is used by other functions in the app
            app.DevicesInfo = devices;
            
            % Create a line plot and store its handle in LivePlot app property
            % This is used for updating the live plot from dataAvailable_Callback function
            app.LivePlotLine = plot(app.LiveAxes, NaN, NaN);
            
            %% Plot Trigger Line
            hold(app.LiveAxes,'on');
            app.TriggerLevel = plot(app.LiveAxes,NaN,NaN,'r');
            
            %Setup Captured Data Plot Area
            app.CapturedPlotLine = plot(app.capturedataplot, NaN, NaN);
            
            %Setup Saved Data Plot Area
            app.SavedPlotLine = plot(app.saveddataplot, NaN, NaN);
            
            % Disable start and stop acquisition buttons, as no device and channel is selected yet
            app.StartButton.Enable = 'off';
            app.StopButton.Enable = 'off';
            
            % Initialize the AutoscaleYSwitch, YminSpinner, and YmaxSpinner components in the correct
            % state (AutoscaleYSwitch enabled, YminSpinner and YmaxSpinner disabled).
            AutoscaleYSwitchValueChanged(app, []);
            
            % Disable warning when session rate is adjusted to closest supported sampling rate
            warning('off', 'daq:Session:closestRateChosen');
            
            %Enable Default Aquisition Visibility
            app.SinglePanel.Visible="on";
            app.TimedPanel.Visible="off";
            %app.OcilliscopePanel.Visible="on";
            

        end

        % Value changed function: DeviceDropDown
        function DeviceDropDownValueChanged(app, event)
            value = app.DeviceDropDown.Value;
            
            if ~isempty(value)
                % Device index is offset by 1 because first element in device dropdown
                % is "Select a device" (not a device).
                deviceIndex = value-1 ;
                
                % Reset channel property options
                app.MeasurementTypeDropDown.Items = {''};
                app.RangeDropDown.Items = {''};
                app.TerminalConfigDropDown.Items = {''};
                app.CouplingDropDown.Items = {''};
                
                % Delete DAQ session, as a new one will be created for the newly selected device
                delete(app.DAQSession);
                app.DAQSession = [];
                
                if deviceIndex > 0
                    % If a device is selected
                    
                    % Get subsystem information to update channel dropdown list and channel property options
                    % For devices that have an analog input or an audio input subsystem, this is the first subsystem
                    subsystem = app.DevicesInfo(deviceIndex).Subsystems(1);
                    app.ChannelDropDown.Items = cellstr(string(subsystem.ChannelNames));
                    
                    % Update channel and channel property options
                    ChannelDropDownValueChanged(app, []);
                else
                    % If no device is selected
                    % Reset the channel dropdown list
                    app.ChannelDropDown.Items = {''};
                    
                    % Disable acquisition start button
                    app.StartButton.Enable = 'off';
                end
            end
        end

        % Callback function
        function StartButtonPushed(app, event)
            app.LogRequested=false;
            startaquire(app);
        end

        % Callback function
        function StopButtonPushed(app, event)
            
            stopaquire(app);
            
        end

        % Value changed function: ChannelDropDown
        function ChannelDropDownValueChanged(app, event)
            value = app.ChannelDropDown.Value;
            
            % Get selected DAQ device index (to be used with DaqDevicesInfo list)
            deviceIndex = app.DeviceDropDown.Value - 1;
            deviceID = app.DevicesInfo(deviceIndex).ID;
            vendor = app.DevicesInfo(deviceIndex).Vendor.ID;
            
            % Delete existing session
            delete(app.DAQSession);
            app.DAQSession = [];
            
            % Get DAQ subsystem information (analog input or audio input)
            % Analog input or analog output subsystems are the first subsystem of the device
            subsystem = app.DevicesInfo(deviceIndex).Subsystems(1);
            
            % Create a new DAQ session
            s = daq.createSession(vendor);
            s.IsContinuous = true;
            
            % Only 'Voltage' and 'Audio' measurement types are supported in this version of the app
            % Depending on what type of device is selected, populate the UI elements channel properties
            switch subsystem.SubsystemType
                case 'AnalogInput'
                    measurementType = 'Voltage';
                    addAnalogInputChannel(s, deviceID, value, measurementType);
                    
                    app.MeasurementTypeDropDown.Items = {measurementType};
                    
                    % Populate dropdown with available channel 'TerminalConfig' options
                    app.TerminalConfigDropDown.Items = getChannelPropertyOptions(app, subsystem, 'TerminalConfig');
                    % Update UI with the actual channel property value
                    % (default value is not necessarily first in the list)
                    % DropDown Value must be set as a character array in MATLAB R2017b
                    app.TerminalConfigDropDown.Value = s.Channels(1).TerminalConfig;
                    app.TerminalConfigDropDown.Tag = 'TerminalConfig';
                    
                    % Populate dropdown with available channel 'Coupling' options
                    app.CouplingDropDown.Items =  getChannelPropertyOptions(app, subsystem, 'Coupling');
                    % Update UI with the actual channel property value
                    app.CouplingDropDown.Value = s.Channels(1).Coupling;
                    app.CouplingDropDown.Tag = 'Coupling';
                    ylabel(app.LiveAxes, 'Voltage (V)')
                case 'AudioInput'
                    measurementType = 'Audio';
                    addAudioInputChannel(s, deviceID, value, measurementType);
                    
                    app.MeasurementTypeDropDown.Items = {measurementType};
                    ylabel(app.LiveAxes, 'Normalized amplitude')
            end
            
            % Populate dropdown with available 'Range' options
            [rangeItems, rangeItemsData] = getChannelPropertyOptions(app, subsystem, 'Range');
            app.RangeDropDown.Items = rangeItems;
            app.RangeDropDown.ItemsData = rangeItemsData;
            
            % Update UI with current channel 'Range'
            currentRange = s.Channels(1).Range;
            app.RangeDropDown.Value = [currentRange.Min currentRange.Max];
            app.RangeDropDown.Tag = 'Range';
            
            % Store DAQ session handle in DaqSession app property
            app.DAQSession = s;
            
            % Update UI with current rate and time window limits
            updateRateUIComponents(app)
            
            % Enable DAQ device, channel properties, and start acquisition UI components
            setAcquisitionControlsState(app, 'on');
        end

        % Value changed function: CouplingDropDown, RangeDropDown, 
        % TerminalConfigDropDown
        function ChannelPropertyValueChanged(app, event)
            % Shared callback for RangeDropDown, TerminalConfigDropDown, and CouplingDropDown
            
            % This executes only for 'Voltage' measurement type, since for 'Audio' measurement
            % type Range never changes, and TerminalConfig and Coupling are disabled.
            
            value = event.Source.Value;
            
            % Set channel property to selected value
            % The channel property name was previously stored in the UI component Tag
            propertyName = event.Source.Tag;
            try
                set(app.DAQSession.Channels(1), propertyName, value);
            catch exception
                % In case of error show it and revert the change
                uialert(app.DataAcquisitionLiveFigure, exception.message, 'Channel property error');
                event.Source.Value = event.PreviousValue;
            end
            
            % Make sure shown channel property values are not stale, as some property update can trigger changes in other properties
            % Update UI with current channel property values from DAQ session
            currentRange = app.DAQSession.Channels(1).Range;
            app.RangeDropDown.Value = [currentRange.Min currentRange.Max];
            app.TerminalConfigDropDown.Value = app.DAQSession.Channels(1).TerminalConfig;
            app.CouplingDropDown.Value = app.DAQSession.Channels(1).Coupling;
            
        end

        % Value changing function: RateSlider
        function RateSliderValueChanging(app, event)
            changingValue = event.Value;
            app.RateEdit.Value = changingValue;
        end

        % Value changed function: RateEdit, RateSlider
        function RateSliderValueChanged(app, event)
            % Shared callback for RateSlider and RateEdit
            
            value = event.Source.Value;
            if ~isempty(app.DAQSession)
                app.DAQSession.Rate = value;
                
                % Update UI with current rate and time window limits
                updateRateUIComponents(app)
                
            end
        end

        % Value changed function: YmaxSpinner, YminSpinner
        function YmaxminSpinnerValueChanged(app, event)
            % Shared callback for YmaxSpinner and YminSpinner
            
            ymin = app.YminSpinner.Value;
            ymax = app.YmaxSpinner.Value;
            if ymax>ymin
                ylim(app.LiveAxes, [ymin, ymax]);
            else
                % If new limits are not correct, revert the change
                event.Source.Value = event.PreviousValue;
            end
        end

        % Value changed function: AutoscaleYSwitch
        function AutoscaleYSwitchValueChanged(app, event)
            value = app.AutoscaleYSwitch.Value;
            switch value
                case 'Off'
                    app.YminSpinner.Enable = 'on';
                    app.YmaxSpinner.Enable = 'on';
                    YmaxminSpinnerValueChanged(app, []);
                case 'On'
                    app.YminSpinner.Enable = 'off';
                    app.YmaxSpinner.Enable = 'off';
                    app.LiveAxes.YLimMode = 'auto';
            end
        end

        % Close request function: DataAcquisitionLiveFigure
        function DataAcquisitionLiveCloseRequest(app, event)
            
            isAcquiring = ~isempty(app.DAQSession) && app.DAQSession.IsRunning;
            if isAcquiring
                question = 'Abort acquisition and close app?';
                
            else
                % Acquisition is stopped
                question = 'Close app?';
            end
            
            uiconfirm(app.DataAcquisitionLiveFigure,question,'Confirm Close',...
                'CloseFcn',@(src,event) closeApp_Callback(app,src,event,isAcquiring));
            
        end

        % Button pushed function: CaptureButton
        function CaptureButtonPushed(app, event)
            app.capturestate=true;
            app.wavecount;
        end

        % Value changed function: level
        function levelValueChanged(app, event)
            value = app.level.Value;
        end

        % Selection changed function: AquisitionModeButtonGroup
        function AquisitionModeButtonGroupSelectionChanged(app, event)
            selectedButton = app.AquisitionModeButtonGroup.SelectedObject;
            
            %if selectedButton.Text == "Continuous"
                %do this
                %app.SinglePanel.Visible="off";
                %app.TimedPanel.Visible="off";
                %app.OcilliscopePanel.Visible="on";
                %app.mode=0;
            if selectedButton.Text=="Single"
                %reset capture session
                if app.wavecount > 1
                    answer = questdlg('Remove Currently Captured Data?', ...
                    	'Confirm Ovewrite', ...
                    	'Yes','No','No');
                    % Handle response
                    switch answer
                        case 'Yes'
                            app.wavecount = 0;
                            app.SinglePanel.Visible="on";
                            app.TimedPanel.Visible="off";
                            app.OcilliscopePanel.Visible="off";
                            app.mode=1;
                            app.LogRequested=false;
                        case 'No'
                            app.SinglePanel.Visible="on";
                            app.TimedPanel.Visible="off";
                            app.OcilliscopePanel.Visible="off";
                            app.mode=1;
                            app.LogRequested=false;
                    end
                end
                app.StartButton.Text="Start";
                app.StopButton.Text="Stop";
                app.SinglePanel.Visible="on";
                app.TimedPanel.Visible="off";
                %app.OcilliscopePanel.Visible="off";
                app.mode=1;
            else
                app.SinglePanel.Visible="off";
                app.TimedPanel.Visible="on";
                app.StartButton.Text="Start Timer";
                app.StopButton.Text="Stop Timer";
                %app.OcilliscopePanel.Visible="off";
                %stopaquire(app);
                set(app.LivePlotLine, 'XData', NaN, 'YData', NaN);
                app.mode=2;
                app.LogRequested=true;
            end
            
        end

        % Selection change function: TabGroup
        function TabGroupSelectionChanged(app, event)
            selectedTab = app.TabGroup.SelectedTab;
            if selectedTab.Title == "Recordings"
                app.savedDataView.Visible="on";
                app.LiveViewPanel.Visible="off";
                items=refreshwaves(app,app.CapturedData);
                app.WaveFilesListBox.Items=items;
            else
                app.savedDataView.Visible="off";
                app.LiveViewPanel.Visible="on";
            end
        end

        % Value changed function: WaveFilesListBox
        function WaveFilesListBoxValueChanged(app, event)
            app.selectedwave = str2num(app.WaveFilesListBox.Value);
            
               %metadata.DeviceInfo = deviceInfo;
                %metadata.Channel = app.ChannelDropDown.Value;
                %metadata.MeasurementType = app.MeasurementTypeDropDown.Value;
                %metadata.Range = app.RangeDropDown.Value;
                %metadata.Coupling = app.CouplingDropDown.Value;
                %metadata.TerminalConfig = app.TerminalConfigDropDown.Value;
                %metadata.Rate = app.RateEdit.Value;
                %metadata.TriggerTime = datetime(app.TriggerTime, 'ConvertFrom', 'datenum', 'TimeZone', 'local');
                app.amplifiercoupling_2.Value=app.CapturedData(app.selectedwave).Metadata.amplifiercoupling;
                app.gain_2.Value=app.CapturedData(app.selectedwave).Metadata.gain;
                app.species_2.Value=app.CapturedData(app.selectedwave).Metadata.species;
                app.location_2.Value=app.CapturedData(app.selectedwave).Metadata.location;
                app.temp_2.Value=app.CapturedData(app.selectedwave).Metadata.temp;
                app.specimenno_2.Value=app.CapturedData(app.selectedwave).Metadata.specimenno;
                app.comments_2.Value=app.CapturedData(app.selectedwave).Metadata.comments;
                app.lp_2.Value=app.CapturedData(app.selectedwave).Metadata.LP_filter;
                app.hp_2.Value=app.CapturedData(app.selectedwave).Metadata.HP_filter;
                app.cond_2.Value=app.CapturedData(app.selectedwave).Metadata.conductivity;
                app.vd_2.Value= app.CapturedData(app.selectedwave).Metadata.vd;
                app.calibrated_2.Value=app.CapturedData(app.selectedwave).Metadata.calibrated;
                app.calratio_2.Value=app.CapturedData(app.selectedwave).Metadata.calibrationratio;
                app.caldist_2.Value=app.CapturedData(app.selectedwave).Metadata.calibrationdistance;
                
                set(app.SavedPlotLine, 'XData', app.CapturedData(app.selectedwave).Time, 'YData', app.CapturedData(app.selectedwave).Data);
            
            
        end

        % Button pushed function: DeleteSelectedButton
        function DeleteSelectedButtonPushed(app, event)
            app.CapturedData(app.selectedwave)=[];
            items=refreshwaves(app,app.CapturedData);
            app.wavecount=length(items)+1;
            app.WaveFilesListBox.Items=items;
            clearview(app);
            set(app.SavedPlotLine, 'XData', NaN, 'YData', NaN);
        end

        % Button pushed function: StartButton
        function StartButtonPushed2(app, event)
            startaquire(app)
        end

        % Button pushed function: StopButton
        function StopButtonPushed2(app, event)
            stopaquire(app)
        end

        % Button pushed function: SavetoFileButton
        function SavetoFileButtonPushed(app, event)
            eodfile=fullfile(app.eodfilepath,[app.eodbasename,'.eod']);
            matfile=fullfile(app.eodfilepath,[app.eodbasename,'.mat']);
            
            if exist(eodfile, 'file') == 2 || exist(matfile,'file') == 2
                uialert(app.DataAcquisitionLiveFigure,'Please choose a different basename!','File Exists');
                app.LogStatusText.Text = 'Save was cancelled.';
            else
                saveEOD(app, app.CapturedData, matfile,eodfile);
                app.LogStatusText.Text = sprintf('Saved data to ''%s'' !', app.eodbasename);
                refresh_filebrowser(app);
            end
            
        end

        % Button pushed function: ChooseButton
        function ChooseButtonPushed(app, event)
            app.eodfilepath=uigetdir;
                if ~(isequal(app.eodfilepath,0))
                    % User specified a file name in a folder with write permission
                    cancelSaveAs = false;
                else
                    %  User clicked Cancel in "Save As" dialog
                    cancelSaveAs = true;
                end
                
                if ~cancelSaveAs
                     app.FilepathEditField.Value=app.eodfilepath;
                     refresh_filebrowser(app);
                else
                    % User clicked Cancel in "Save As" dialog
                end
           
        end

        % Callback function
        function FilepathEditFieldValueChanged(app, event)
            value = app.FilepathEditField.Value;
            app.eodfilepath=value;
        end

        % Value changed function: BasenameEditField
        function BasenameEditFieldValueChanged(app, event)
            value = app.BasenameEditField.Value;
            app.eodbasename=value;
        end

        % Key press function: DataAcquisitionLiveFigure
        function DataAcquisitionLiveFigureKeyPress(app, event)
            key = event.Key;
            switch key
                case 'd'
                    app.TabGroup.SelectedTab=app.DAQSetupTab;
                case 'a'
                    app.TabGroup.SelectedTab=app.AcquireTab;
                case'r'
                    app.TabGroup.SelectedTab=app.RecordingsTab;
                case 's'
                    app.TabGroup.SelectedTab=app.SaveTab;
                case 'c'
                    if app.TabGroup.SelectedTab == app.AcquireTab
                        app.CaptureButtonPushed
                    end
                case 'i'
                    if app.TabGroup.SelectedTab == app.AcquireTab
                        app.CapturedData(app.wavecount-1).Data=app.CapturedData(app.wavecount-1).Data*-1;
                        set(app.CapturedPlotLine, 'XData', app.CapturedData(app.wavecount-1).Time, 'YData', app.CapturedData(app.wavecount-1).Data);
                    end
             end
        
        end

        % Value changed function: amplifiercoupling_2, 
        % calibrated_2, calratio_2, comments_2, cond_2, gain_2, 
        % hp_2, location_2, lp_2, species_2, specimenno_2, temp_2, 
        % vd_2
        function specimenno_2ValueChanged(app, event)
            metaupdate(app)
        end

        % Value changed function: calibrated
        function calibratedValueChanged(app, event)
            value = app.calibrated.Value;
            switch value
                case false
                    app.calratio.Value="NA";
                    app.caldist.Value="NA";
                    app.calratio.Editable="off";
                    app.caldist.Editable="off";
                    app.calratio.Enable="off";
                    app.caldist.Enable="off";
                case true
                    app.calratio.Editable="on";
                    app.caldist.Editable="on";
                    app.calratio.Enable="on";
                    app.caldist.Enable="on";
            end
            
        end

        % Value changed function: window
        function windowValueChanged(app, event)
            value = app.window.Value;
            npts=value*app.RateEdit.Value;
            app.window.Value=pow2(floor(log2(npts)))/app.RateEdit.Value;
            value= app.window.Value;
            app.nptsEditField.Value=value*app.RateEdit.Value;
        end

        % Value changed function: nptsEditField
        function nptsEditFieldValueChanged(app, event)
            value = app.nptsEditField.Value;
            app.nptsEditField.Value=pow2(floor(log2(value)));
            value = app.nptsEditField.Value;
            app.window.Value=value/app.RateEdit.Value;
        end

        % Button pushed function: 
        % DeleteRecordingsandStartNewSessionButton
        function DeleteRecordingsandStartNewSessionButtonPushed(app, event)
            app.CapturedData=[];
            items=refreshwaves(app,app.CapturedData);
            app.wavecount=1;
            app.WaveFilesListBox.Items=items;
            clearview(app);
            set(app.SavedPlotLine, 'XData', NaN, 'YData', NaN);
            set(app.CapturedPlotLine, 'XData',NaN,'YData',NaN);
            set(app.LivePlotLine,'XData',NaN,'YData',NaN);
        end

        % Button pushed function: InvertSelectedButton
        function InvertSelectedButtonPushed(app, event)
            app.CapturedData(app.selectedwave).Data=app.CapturedData(app.selectedwave).Data*-1;
            items=refreshwaves(app,app.CapturedData);
            set(app.SavedPlotLine, 'XData', app.CapturedData(app.selectedwave).Time, 'YData', app.CapturedData(app.selectedwave).Data);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create DataAcquisitionLiveFigure and hide until all components are created
            app.DataAcquisitionLiveFigure = uifigure('Visible', 'off');
            app.DataAcquisitionLiveFigure.Position = [100 100 990 606];
            app.DataAcquisitionLiveFigure.Name = 'Data Acquisition Live';
            app.DataAcquisitionLiveFigure.CloseRequestFcn = createCallbackFcn(app, @DataAcquisitionLiveCloseRequest, true);
            app.DataAcquisitionLiveFigure.KeyPressFcn = createCallbackFcn(app, @DataAcquisitionLiveFigureKeyPress, true);

            % Create EODRecorder2Label
            app.EODRecorder2Label = uilabel(app.DataAcquisitionLiveFigure);
            app.EODRecorder2Label.FontSize = 24;
            app.EODRecorder2Label.Position = [14 563 232 30];
            app.EODRecorder2Label.Text = 'EOD Recorder 2';

            % Create LiveViewPanel
            app.LiveViewPanel = uipanel(app.DataAcquisitionLiveFigure);
            app.LiveViewPanel.Position = [364 15 613 578];

            % Create LiveAxes
            app.LiveAxes = uiaxes(app.LiveViewPanel);
            xlabel(app.LiveAxes, 'Time (s)')
            ylabel(app.LiveAxes, 'Voltage (V)')
            app.LiveAxes.Box = 'on';
            app.LiveAxes.XGrid = 'on';
            app.LiveAxes.YGrid = 'on';
            app.LiveAxes.Position = [12 294 588 245];

            % Create TimewindowsSpinnerLabel
            app.TimewindowsSpinnerLabel = uilabel(app.LiveViewPanel);
            app.TimewindowsSpinnerLabel.HorizontalAlignment = 'right';
            app.TimewindowsSpinnerLabel.Position = [416 549 92 22];
            app.TimewindowsSpinnerLabel.Text = 'Time window (s)';

            % Create TimewindowSpinner
            app.TimewindowSpinner = uispinner(app.LiveViewPanel);
            app.TimewindowSpinner.Step = 0.1;
            app.TimewindowSpinner.Limits = [0.01 Inf];
            app.TimewindowSpinner.Position = [519 549 78 22];
            app.TimewindowSpinner.Value = 1;

            % Create YmaxSpinnerLabel
            app.YmaxSpinnerLabel = uilabel(app.LiveViewPanel);
            app.YmaxSpinnerLabel.HorizontalAlignment = 'right';
            app.YmaxSpinnerLabel.Position = [277 549 36 22];
            app.YmaxSpinnerLabel.Text = 'Ymax';

            % Create YmaxSpinner
            app.YmaxSpinner = uispinner(app.LiveViewPanel);
            app.YmaxSpinner.Step = 0.1;
            app.YmaxSpinner.ValueChangedFcn = createCallbackFcn(app, @YmaxminSpinnerValueChanged, true);
            app.YmaxSpinner.Position = [316 549 58 22];
            app.YmaxSpinner.Value = 1;

            % Create capturedataplot
            app.capturedataplot = uiaxes(app.LiveViewPanel);
            xlabel(app.capturedataplot, 'Time (s)')
            ylabel(app.capturedataplot, 'Voltage (V)')
            app.capturedataplot.Box = 'on';
            app.capturedataplot.XGrid = 'on';
            app.capturedataplot.YGrid = 'on';
            app.capturedataplot.Position = [13 6 588 250];

            % Create YminSpinnerLabel
            app.YminSpinnerLabel = uilabel(app.LiveViewPanel);
            app.YminSpinnerLabel.HorizontalAlignment = 'right';
            app.YminSpinnerLabel.Position = [175 549 33 22];
            app.YminSpinnerLabel.Text = 'Ymin';

            % Create YminSpinner
            app.YminSpinner = uispinner(app.LiveViewPanel);
            app.YminSpinner.Step = 0.1;
            app.YminSpinner.ValueChangedFcn = createCallbackFcn(app, @YmaxminSpinnerValueChanged, true);
            app.YminSpinner.Position = [210 549 60 22];
            app.YminSpinner.Value = -1;

            % Create AutoscaleYSwitchLabel
            app.AutoscaleYSwitchLabel = uilabel(app.LiveViewPanel);
            app.AutoscaleYSwitchLabel.HorizontalAlignment = 'center';
            app.AutoscaleYSwitchLabel.Position = [9 549 70 22];
            app.AutoscaleYSwitchLabel.Text = 'Autoscale Y';

            % Create AutoscaleYSwitch
            app.AutoscaleYSwitch = uiswitch(app.LiveViewPanel, 'slider');
            app.AutoscaleYSwitch.ValueChangedFcn = createCallbackFcn(app, @AutoscaleYSwitchValueChanged, true);
            app.AutoscaleYSwitch.Position = [102 550 45 20];
            app.AutoscaleYSwitch.Value = 'On';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.DataAcquisitionLiveFigure);
            app.TabGroup.SelectionChangedFcn = createCallbackFcn(app, @TabGroupSelectionChanged, true);
            app.TabGroup.Position = [13 36 337 511];

            % Create DAQSetupTab
            app.DAQSetupTab = uitab(app.TabGroup);
            app.DAQSetupTab.Title = 'DAQ Setup';

            % Create DevicePanel
            app.DevicePanel = uipanel(app.DAQSetupTab);
            app.DevicePanel.Position = [6 1 322 479];

            % Create ChannelDropDownLabel
            app.ChannelDropDownLabel = uilabel(app.DevicePanel);
            app.ChannelDropDownLabel.HorizontalAlignment = 'right';
            app.ChannelDropDownLabel.Position = [73 401 50 22];
            app.ChannelDropDownLabel.Text = 'Channel';

            % Create ChannelDropDown
            app.ChannelDropDown = uidropdown(app.DevicePanel);
            app.ChannelDropDown.Items = {};
            app.ChannelDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelDropDownValueChanged, true);
            app.ChannelDropDown.Tooltip = {'Choose recording channel.  Currently only single channel recording is enabled.'};
            app.ChannelDropDown.Position = [129 401 100 22];
            app.ChannelDropDown.Value = {};

            % Create MeasurementTypeDropDownLabel
            app.MeasurementTypeDropDownLabel = uilabel(app.DevicePanel);
            app.MeasurementTypeDropDownLabel.HorizontalAlignment = 'right';
            app.MeasurementTypeDropDownLabel.Position = [13 367 110 22];
            app.MeasurementTypeDropDownLabel.Text = 'Measurement Type';

            % Create MeasurementTypeDropDown
            app.MeasurementTypeDropDown = uidropdown(app.DevicePanel);
            app.MeasurementTypeDropDown.Items = {};
            app.MeasurementTypeDropDown.Position = [129 367 100 22];
            app.MeasurementTypeDropDown.Value = {};

            % Create RangeDropDownLabel
            app.RangeDropDownLabel = uilabel(app.DevicePanel);
            app.RangeDropDownLabel.HorizontalAlignment = 'right';
            app.RangeDropDownLabel.Position = [82 333 41 22];
            app.RangeDropDownLabel.Text = 'Range';

            % Create RangeDropDown
            app.RangeDropDown = uidropdown(app.DevicePanel);
            app.RangeDropDown.Items = {};
            app.RangeDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelPropertyValueChanged, true);
            app.RangeDropDown.Position = [129 333 100 22];
            app.RangeDropDown.Value = {};

            % Create TerminalConfigDropDownLabel
            app.TerminalConfigDropDownLabel = uilabel(app.DevicePanel);
            app.TerminalConfigDropDownLabel.HorizontalAlignment = 'right';
            app.TerminalConfigDropDownLabel.Position = [31 266 92 22];
            app.TerminalConfigDropDownLabel.Text = 'Terminal Config.';

            % Create TerminalConfigDropDown
            app.TerminalConfigDropDown = uidropdown(app.DevicePanel);
            app.TerminalConfigDropDown.Items = {};
            app.TerminalConfigDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelPropertyValueChanged, true);
            app.TerminalConfigDropDown.Position = [129 266 100 22];
            app.TerminalConfigDropDown.Value = {};

            % Create CouplingDropDownLabel
            app.CouplingDropDownLabel = uilabel(app.DevicePanel);
            app.CouplingDropDownLabel.HorizontalAlignment = 'right';
            app.CouplingDropDownLabel.Position = [70 299 53 22];
            app.CouplingDropDownLabel.Text = 'Coupling';

            % Create CouplingDropDown
            app.CouplingDropDown = uidropdown(app.DevicePanel);
            app.CouplingDropDown.Items = {};
            app.CouplingDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelPropertyValueChanged, true);
            app.CouplingDropDown.Position = [129 299 100 22];
            app.CouplingDropDown.Value = {};

            % Create DeviceDropDownLabel
            app.DeviceDropDownLabel = uilabel(app.DevicePanel);
            app.DeviceDropDownLabel.HorizontalAlignment = 'right';
            app.DeviceDropDownLabel.Position = [21 435 42 22];
            app.DeviceDropDownLabel.Text = 'Device';

            % Create DeviceDropDown
            app.DeviceDropDown = uidropdown(app.DevicePanel);
            app.DeviceDropDown.Items = {'Select a device'};
            app.DeviceDropDown.ValueChangedFcn = createCallbackFcn(app, @DeviceDropDownValueChanged, true);
            app.DeviceDropDown.Tooltip = {'Choose data aquisition hardware.'};
            app.DeviceDropDown.Position = [69 435 160 22];
            app.DeviceDropDown.Value = 'Select a device';

            % Create SampleRateHzLabel
            app.SampleRateHzLabel = uilabel(app.DevicePanel);
            app.SampleRateHzLabel.HorizontalAlignment = 'right';
            app.SampleRateHzLabel.Position = [7 233 101 22];
            app.SampleRateHzLabel.Text = 'Sample Rate (Hz)';

            % Create RateSlider
            app.RateSlider = uislider(app.DevicePanel);
            app.RateSlider.Limits = [1e-06 250000];
            app.RateSlider.ValueChangedFcn = createCallbackFcn(app, @RateSliderValueChanged, true);
            app.RateSlider.ValueChangingFcn = createCallbackFcn(app, @RateSliderValueChanging, true);
            app.RateSlider.Tooltip = {'Sample rate determines the speed analog signals are digitized at.  100khz suggested.'};
            app.RateSlider.Position = [68 222 150 3];
            app.RateSlider.Value = 1000;

            % Create RateEdit
            app.RateEdit = uieditfield(app.DevicePanel, 'numeric');
            app.RateEdit.Limits = [1e-06 10000000];
            app.RateEdit.ValueChangedFcn = createCallbackFcn(app, @RateSliderValueChanged, true);
            app.RateEdit.Position = [127 233 100 22];
            app.RateEdit.Value = 1000;

            % Create AcquireTab
            app.AcquireTab = uitab(app.TabGroup);
            app.AcquireTab.Title = 'Acquire';

            % Create SpecimenMetadataPanel
            app.SpecimenMetadataPanel = uipanel(app.AcquireTab);
            app.SpecimenMetadataPanel.Title = 'Specimen Metadata';
            app.SpecimenMetadataPanel.FontWeight = 'bold';
            app.SpecimenMetadataPanel.Position = [7 163 320 320];

            % Create WaterParametersLabel_2
            app.WaterParametersLabel_2 = uilabel(app.SpecimenMetadataPanel);
            app.WaterParametersLabel_2.FontSize = 10;
            app.WaterParametersLabel_2.FontWeight = 'bold';
            app.WaterParametersLabel_2.Position = [5 201 90 13];
            app.WaterParametersLabel_2.Text = 'Water Parameters';

            % Create AmplifierSettingsLabel_2
            app.AmplifierSettingsLabel_2 = uilabel(app.SpecimenMetadataPanel);
            app.AmplifierSettingsLabel_2.FontSize = 10;
            app.AmplifierSettingsLabel_2.FontWeight = 'bold';
            app.AmplifierSettingsLabel_2.Position = [5 172 91 15];
            app.AmplifierSettingsLabel_2.Text = 'Amplifier Settings';

            % Create SpecimenEditFieldLabel_3
            app.SpecimenEditFieldLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.SpecimenEditFieldLabel_3.Position = [9 271 59 22];
            app.SpecimenEditFieldLabel_3.Text = 'Specimen';

            % Create specimenno
            app.specimenno = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.specimenno.Position = [69 271 168 22];
            app.specimenno.Value = '<MSU NO>';

            % Create SpeciesEditFieldLabel_3
            app.SpeciesEditFieldLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.SpeciesEditFieldLabel_3.Position = [9 244 48 22];
            app.SpeciesEditFieldLabel_3.Text = 'Species';

            % Create species
            app.species = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.species.Position = [69 244 168 22];
            app.species.Value = '<Species / OTU>';

            % Create LocationEditFieldLabel_3
            app.LocationEditFieldLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.LocationEditFieldLabel_3.Position = [9 217 51 22];
            app.LocationEditFieldLabel_3.Text = 'Location';

            % Create location
            app.location = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.location.Position = [69 217 168 22];
            app.location.Value = '<Site No>';

            % Create TempLabel_3
            app.TempLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.TempLabel_3.HorizontalAlignment = 'right';
            app.TempLabel_3.Position = [99 186 35 22];
            app.TempLabel_3.Text = 'Temp';

            % Create temp
            app.temp = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.temp.Position = [138 186 52 22];

            % Create CondEditField_2Label
            app.CondEditField_2Label = uilabel(app.SpecimenMetadataPanel);
            app.CondEditField_2Label.HorizontalAlignment = 'right';
            app.CondEditField_2Label.Position = [200 186 38 22];
            app.CondEditField_2Label.Text = 'Cond.';

            % Create cond
            app.cond = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.cond.Position = [241 186 44 22];

            % Create LPDropDown_2Label
            app.LPDropDown_2Label = uilabel(app.SpecimenMetadataPanel);
            app.LPDropDown_2Label.HorizontalAlignment = 'right';
            app.LPDropDown_2Label.Position = [4 147 25 22];
            app.LPDropDown_2Label.Text = 'LP';

            % Create lp
            app.lp = uidropdown(app.SpecimenMetadataPanel);
            app.lp.Items = {'DC', '0.1', '3', '10', '30', '100'};
            app.lp.Tooltip = {'Low pass filter setting'};
            app.lp.Position = [33 147 72 22];
            app.lp.Value = 'DC';

            % Create HPDropDown_2Label
            app.HPDropDown_2Label = uilabel(app.SpecimenMetadataPanel);
            app.HPDropDown_2Label.HorizontalAlignment = 'right';
            app.HPDropDown_2Label.Position = [117 148 18 22];
            app.HPDropDown_2Label.Text = 'HP';

            % Create hp
            app.hp = uidropdown(app.SpecimenMetadataPanel);
            app.hp.Items = {'100', '500', '1000', '3000', '5000', '10000', '20000', '30000', '50000'};
            app.hp.Tooltip = {'High pass filter setting'};
            app.hp.Position = [140 148 72 22];
            app.hp.Value = '50000';

            % Create ACDCLabel_3
            app.ACDCLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.ACDCLabel_3.HorizontalAlignment = 'right';
            app.ACDCLabel_3.Position = [215 148 43 22];
            app.ACDCLabel_3.Text = 'AC/DC';

            % Create amplifiercoupling
            app.amplifiercoupling = uidropdown(app.SpecimenMetadataPanel);
            app.amplifiercoupling.Items = {'AC', 'DC'};
            app.amplifiercoupling.Tooltip = {'Amplifier coupling'};
            app.amplifiercoupling.Position = [263 148 52 22];
            app.amplifiercoupling.Value = 'AC';

            % Create VDDropDown_2Label
            app.VDDropDown_2Label = uilabel(app.SpecimenMetadataPanel);
            app.VDDropDown_2Label.HorizontalAlignment = 'right';
            app.VDDropDown_2Label.Position = [2 120 25 22];
            app.VDDropDown_2Label.Text = 'VD';

            % Create vd
            app.vd = uidropdown(app.SpecimenMetadataPanel);
            app.vd.Items = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'};
            app.vd.Tooltip = {'Voltage divider setting.  0 for no voltage divider.'};
            app.vd.Position = [34 120 45 22];
            app.vd.Value = '0';

            % Create GainDropDown_2Label
            app.GainDropDown_2Label = uilabel(app.SpecimenMetadataPanel);
            app.GainDropDown_2Label.HorizontalAlignment = 'right';
            app.GainDropDown_2Label.Position = [102 120 31 22];
            app.GainDropDown_2Label.Text = 'Gain';

            % Create gain
            app.gain = uidropdown(app.SpecimenMetadataPanel);
            app.gain.Items = {'10', '20', '50', '100', '200', '500', '1000', '2000', '5000', '10000', '20000', '50000'};
            app.gain.Tooltip = {'Gain setting on amplifier.'};
            app.gain.Position = [139 120 68 22];
            app.gain.Value = '10';

            % Create calibrated
            app.calibrated = uicheckbox(app.SpecimenMetadataPanel);
            app.calibrated.ValueChangedFcn = createCallbackFcn(app, @calibratedValueChanged, true);
            app.calibrated.Tooltip = {'Select this only if EOD has been calibrated.'};
            app.calibrated.Text = 'Calibrated';
            app.calibrated.Position = [5 89 77 22];

            % Create RatioEditFieldLabel
            app.RatioEditFieldLabel = uilabel(app.SpecimenMetadataPanel);
            app.RatioEditFieldLabel.HorizontalAlignment = 'right';
            app.RatioEditFieldLabel.Enable = 'off';
            app.RatioEditFieldLabel.Position = [88 88 34 22];
            app.RatioEditFieldLabel.Text = 'Ratio';

            % Create calratio
            app.calratio = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.calratio.Editable = 'off';
            app.calratio.Enable = 'off';
            app.calratio.Tooltip = {'Calibration ratio from calibration program.'};
            app.calratio.Position = [126 88 58 22];
            app.calratio.Value = 'NA';

            % Create DistanceEditFieldLabel_3
            app.DistanceEditFieldLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.DistanceEditFieldLabel_3.HorizontalAlignment = 'right';
            app.DistanceEditFieldLabel_3.Enable = 'off';
            app.DistanceEditFieldLabel_3.Position = [196 88 52 22];
            app.DistanceEditFieldLabel_3.Text = 'Distance';

            % Create caldist
            app.caldist = uieditfield(app.SpecimenMetadataPanel, 'text');
            app.caldist.Editable = 'off';
            app.caldist.Enable = 'off';
            app.caldist.Tooltip = {'Calibration distance (varies by calibration wand)'};
            app.caldist.Position = [257 88 53 22];
            app.caldist.Value = 'NA';

            % Create CommentsTextAreaLabel_3
            app.CommentsTextAreaLabel_3 = uilabel(app.SpecimenMetadataPanel);
            app.CommentsTextAreaLabel_3.HorizontalAlignment = 'right';
            app.CommentsTextAreaLabel_3.Position = [4 67 63 22];
            app.CommentsTextAreaLabel_3.Text = 'Comments';

            % Create comments
            app.comments = uitextarea(app.SpecimenMetadataPanel);
            app.comments.Position = [11 9 295 59];
            app.comments.Value = {'<Put Comments Here>'};

            % Create AquisitionModeButtonGroup
            app.AquisitionModeButtonGroup = uibuttongroup(app.AcquireTab);
            app.AquisitionModeButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @AquisitionModeButtonGroupSelectionChanged, true);
            app.AquisitionModeButtonGroup.Title = 'Aquisition Mode';
            app.AquisitionModeButtonGroup.Position = [7 88 320 68];

            % Create SingleButton
            app.SingleButton = uitogglebutton(app.AquisitionModeButtonGroup);
            app.SingleButton.Text = 'Single';
            app.SingleButton.Position = [11 13 66 22];
            app.SingleButton.Value = true;

            % Create TimedButton
            app.TimedButton = uitogglebutton(app.AquisitionModeButtonGroup);
            app.TimedButton.Text = 'Timed';
            app.TimedButton.Position = [83 13 56 22];

            % Create StartButton
            app.StartButton = uibutton(app.AquisitionModeButtonGroup, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed2, true);
            app.StartButton.BackgroundColor = [0.4706 0.6706 0.1882];
            app.StartButton.FontSize = 14;
            app.StartButton.FontColor = [1 1 1];
            app.StartButton.Position = [149 11 77 26];
            app.StartButton.Text = 'Start';

            % Create StopButton
            app.StopButton = uibutton(app.AquisitionModeButtonGroup, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed2, true);
            app.StopButton.BackgroundColor = [0.6392 0.0784 0.1804];
            app.StopButton.FontSize = 14;
            app.StopButton.FontColor = [1 1 1];
            app.StopButton.Position = [235 11 76 26];
            app.StopButton.Text = 'Stop';

            % Create TimedPanel
            app.TimedPanel = uipanel(app.AcquireTab);
            app.TimedPanel.Title = 'Timed';
            app.TimedPanel.Position = [11 18 316 65];

            % Create LengthsecLabel
            app.LengthsecLabel = uilabel(app.TimedPanel);
            app.LengthsecLabel.HorizontalAlignment = 'right';
            app.LengthsecLabel.Position = [111 16 72 19];
            app.LengthsecLabel.Text = 'Length (sec)';

            % Create recordlength
            app.recordlength = uieditfield(app.TimedPanel, 'numeric');
            app.recordlength.Position = [188 12 55 22];

            % Create SinglePanel
            app.SinglePanel = uipanel(app.AcquireTab);
            app.SinglePanel.Title = 'Single';
            app.SinglePanel.Position = [7 10 320 73];

            % Create CaptureButton
            app.CaptureButton = uibutton(app.SinglePanel, 'push');
            app.CaptureButton.ButtonPushedFcn = createCallbackFcn(app, @CaptureButtonPushed, true);
            app.CaptureButton.Position = [9 24 107 22];
            app.CaptureButton.Text = 'Capture';

            % Create LevelVLabel
            app.LevelVLabel = uilabel(app.SinglePanel);
            app.LevelVLabel.HorizontalAlignment = 'right';
            app.LevelVLabel.Position = [121 31 54 15];
            app.LevelVLabel.Text = 'Level (V)';

            % Create level
            app.level = uieditfield(app.SinglePanel, 'numeric');
            app.level.ValueChangedFcn = createCallbackFcn(app, @levelValueChanged, true);
            app.level.Position = [126 8 49 22];

            % Create WindowsecLabel
            app.WindowsecLabel = uilabel(app.SinglePanel);
            app.WindowsecLabel.HorizontalAlignment = 'right';
            app.WindowsecLabel.Position = [183 31 78 15];
            app.WindowsecLabel.Text = 'Window (sec)';

            % Create window
            app.window = uieditfield(app.SinglePanel, 'numeric');
            app.window.Limits = [0 Inf];
            app.window.ValueChangedFcn = createCallbackFcn(app, @windowValueChanged, true);
            app.window.Position = [199 8 47 22];

            % Create nptsEditFieldLabel
            app.nptsEditFieldLabel = uilabel(app.SinglePanel);
            app.nptsEditFieldLabel.HorizontalAlignment = 'right';
            app.nptsEditFieldLabel.Position = [268 31 47 15];
            app.nptsEditFieldLabel.Text = 'npts';

            % Create nptsEditField
            app.nptsEditField = uieditfield(app.SinglePanel, 'numeric');
            app.nptsEditField.ValueChangedFcn = createCallbackFcn(app, @nptsEditFieldValueChanged, true);
            app.nptsEditField.Position = [268 8 47 22];

            % Create RecordingsTab
            app.RecordingsTab = uitab(app.TabGroup);
            app.RecordingsTab.Title = 'Recordings';

            % Create WaveFilesListBoxLabel
            app.WaveFilesListBoxLabel = uilabel(app.RecordingsTab);
            app.WaveFilesListBoxLabel.HorizontalAlignment = 'right';
            app.WaveFilesListBoxLabel.Position = [15 448 64 22];
            app.WaveFilesListBoxLabel.Text = 'Wave Files';

            % Create WaveFilesListBox
            app.WaveFilesListBox = uilistbox(app.RecordingsTab);
            app.WaveFilesListBox.Items = {};
            app.WaveFilesListBox.ValueChangedFcn = createCallbackFcn(app, @WaveFilesListBoxValueChanged, true);
            app.WaveFilesListBox.Position = [21 97 117 352];
            app.WaveFilesListBox.Value = {};

            % Create DeleteSelectedButton
            app.DeleteSelectedButton = uibutton(app.RecordingsTab, 'push');
            app.DeleteSelectedButton.ButtonPushedFcn = createCallbackFcn(app, @DeleteSelectedButtonPushed, true);
            app.DeleteSelectedButton.Position = [149 416 169 30];
            app.DeleteSelectedButton.Text = 'Delete Selected...';

            % Create DeleteRecordingsandStartNewSessionButton
            app.DeleteRecordingsandStartNewSessionButton = uibutton(app.RecordingsTab, 'push');
            app.DeleteRecordingsandStartNewSessionButton.ButtonPushedFcn = createCallbackFcn(app, @DeleteRecordingsandStartNewSessionButtonPushed, true);
            app.DeleteRecordingsandStartNewSessionButton.Position = [10 31 318 38];
            app.DeleteRecordingsandStartNewSessionButton.Text = 'Delete Recordings and Start New Session';

            % Create InvertSelectedButton
            app.InvertSelectedButton = uibutton(app.RecordingsTab, 'push');
            app.InvertSelectedButton.ButtonPushedFcn = createCallbackFcn(app, @InvertSelectedButtonPushed, true);
            app.InvertSelectedButton.Position = [150 376 168 30];
            app.InvertSelectedButton.Text = 'Invert Selected';

            % Create SaveTab
            app.SaveTab = uitab(app.TabGroup);
            app.SaveTab.Title = 'Save';

            % Create SavetoFileButton
            app.SavetoFileButton = uibutton(app.SaveTab, 'push');
            app.SavetoFileButton.ButtonPushedFcn = createCallbackFcn(app, @SavetoFileButtonPushed, true);
            app.SavetoFileButton.Position = [24 19 286 22];
            app.SavetoFileButton.Text = 'Save to File!';

            % Create BasenameEditField
            app.BasenameEditField = uieditfield(app.SaveTab, 'text');
            app.BasenameEditField.ValueChangedFcn = createCallbackFcn(app, @BasenameEditFieldValueChanged, true);
            app.BasenameEditField.Position = [11 72 311 22];

            % Create FilepathEditField
            app.FilepathEditField = uieditfield(app.SaveTab, 'text');
            app.FilepathEditField.Position = [11 427 311 22];

            % Create ChooseButton
            app.ChooseButton = uibutton(app.SaveTab, 'push');
            app.ChooseButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseButtonPushed, true);
            app.ChooseButton.Position = [222 459 100 22];
            app.ChooseButton.Text = 'Choose...';

            % Create filebrowser
            app.filebrowser = uitable(app.SaveTab);
            app.filebrowser.ColumnName = {'Directory Contents'};
            app.filebrowser.RowName = {};
            app.filebrowser.Position = [11 133 311 282];

            % Create BasenameEditFieldLabel
            app.BasenameEditFieldLabel = uilabel(app.SaveTab);
            app.BasenameEditFieldLabel.Position = [11 100 60 22];
            app.BasenameEditFieldLabel.Text = 'File Name';

            % Create FilepathEditFieldLabel
            app.FilepathEditFieldLabel = uilabel(app.SaveTab);
            app.FilepathEditFieldLabel.Position = [11 458 48 22];
            app.FilepathEditFieldLabel.Text = 'Filepath';

            % Create LogStatusText
            app.LogStatusText = uilabel(app.DataAcquisitionLiveFigure);
            app.LogStatusText.BackgroundColor = [1 1 1];
            app.LogStatusText.Position = [69 7 277 22];
            app.LogStatusText.Text = '';

            % Create StatusLabel
            app.StatusLabel = uilabel(app.DataAcquisitionLiveFigure);
            app.StatusLabel.Position = [20 7 43 22];
            app.StatusLabel.Text = 'Status:';

            % Create savedDataView
            app.savedDataView = uipanel(app.DataAcquisitionLiveFigure);
            app.savedDataView.Position = [364 14 613 578];

            % Create saveddataplot
            app.saveddataplot = uiaxes(app.savedDataView);
            xlabel(app.saveddataplot, 'Time (s)')
            ylabel(app.saveddataplot, 'Voltage (V)')
            app.saveddataplot.PlotBoxAspectRatio = [1.95306859205776 1 1];
            app.saveddataplot.Box = 'on';
            app.saveddataplot.XGrid = 'on';
            app.saveddataplot.YGrid = 'on';
            app.saveddataplot.Position = [13 6 588 319];

            % Create FigTItle
            app.FigTItle = uilabel(app.savedDataView);
            app.FigTItle.FontSize = 18;
            app.FigTItle.Position = [220 549 212 22];
            app.FigTItle.Text = 'Previously Captured Data';

            % Create SpecimenMetadataPanel_2
            app.SpecimenMetadataPanel_2 = uipanel(app.savedDataView);
            app.SpecimenMetadataPanel_2.Title = 'Specimen Metadata';
            app.SpecimenMetadataPanel_2.FontWeight = 'bold';
            app.SpecimenMetadataPanel_2.Position = [13 334 587 206];

            % Create WaterParametersLabel
            app.WaterParametersLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.WaterParametersLabel.FontSize = 10;
            app.WaterParametersLabel.FontWeight = 'bold';
            app.WaterParametersLabel.Position = [256 170 90 13];
            app.WaterParametersLabel.Text = 'Water Parameters';

            % Create AmplifierSettingsLabel
            app.AmplifierSettingsLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.AmplifierSettingsLabel.FontSize = 10;
            app.AmplifierSettingsLabel.FontWeight = 'bold';
            app.AmplifierSettingsLabel.Position = [256 127 91 15];
            app.AmplifierSettingsLabel.Text = 'Amplifier Settings';

            % Create CalibrationSettingsLabel
            app.CalibrationSettingsLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.CalibrationSettingsLabel.FontSize = 10;
            app.CalibrationSettingsLabel.FontWeight = 'bold';
            app.CalibrationSettingsLabel.Position = [256 40 100 22];
            app.CalibrationSettingsLabel.Text = 'Calibration Settings';

            % Create SpecimenEditFieldLabel_4
            app.SpecimenEditFieldLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.SpecimenEditFieldLabel_4.Position = [8 157 59 22];
            app.SpecimenEditFieldLabel_4.Text = 'Specimen';

            % Create specimenno_2
            app.specimenno_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.specimenno_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.specimenno_2.Position = [81 157 168 22];
            app.specimenno_2.Value = '<MSU NO>';

            % Create SpeciesEditFieldLabel_4
            app.SpeciesEditFieldLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.SpeciesEditFieldLabel_4.Position = [8 128 48 22];
            app.SpeciesEditFieldLabel_4.Text = 'Species';

            % Create species_2
            app.species_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.species_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.species_2.Position = [81 128 168 22];
            app.species_2.Value = '<Species / OTU>';

            % Create LocationEditFieldLabel_4
            app.LocationEditFieldLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.LocationEditFieldLabel_4.Position = [8 98 51 22];
            app.LocationEditFieldLabel_4.Text = 'Location';

            % Create location_2
            app.location_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.location_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.location_2.Position = [81 98 168 22];
            app.location_2.Value = '<Site No>';

            % Create CommentsTextAreaLabel_4
            app.CommentsTextAreaLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.CommentsTextAreaLabel_4.Position = [8 61 63 22];
            app.CommentsTextAreaLabel_4.Text = 'Comments';

            % Create comments_2
            app.comments_2 = uitextarea(app.SpecimenMetadataPanel_2);
            app.comments_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.comments_2.Position = [81 11 168 74];
            app.comments_2.Value = {'<Put Comments Here>'};

            % Create TempLabel_4
            app.TempLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.TempLabel_4.Position = [275 148 38 22];
            app.TempLabel_4.Text = 'Temp.';

            % Create temp_2
            app.temp_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.temp_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.temp_2.Position = [317 148 52 22];

            % Create CondEditFieldLabel
            app.CondEditFieldLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.CondEditFieldLabel.HorizontalAlignment = 'right';
            app.CondEditFieldLabel.Position = [418 148 38 22];
            app.CondEditFieldLabel.Text = 'Cond.';

            % Create cond_2
            app.cond_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.cond_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.cond_2.Position = [467 148 44 22];

            % Create LPDropDownLabel
            app.LPDropDownLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.LPDropDownLabel.HorizontalAlignment = 'right';
            app.LPDropDownLabel.Position = [260 103 25 22];
            app.LPDropDownLabel.Text = 'LP';

            % Create lp_2
            app.lp_2 = uidropdown(app.SpecimenMetadataPanel_2);
            app.lp_2.Items = {'DC', '0.1', '3', '10', '30', '100'};
            app.lp_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.lp_2.Position = [289 103 72 22];
            app.lp_2.Value = 'DC';

            % Create HPDropDownLabel
            app.HPDropDownLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.HPDropDownLabel.HorizontalAlignment = 'right';
            app.HPDropDownLabel.Position = [368 103 22 22];
            app.HPDropDownLabel.Text = 'HP';

            % Create hp_2
            app.hp_2 = uidropdown(app.SpecimenMetadataPanel_2);
            app.hp_2.Items = {'100', '500', '1000', '3000', '5000', '10000', '20000', '30000', '50000'};
            app.hp_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.hp_2.Position = [397 103 72 22];
            app.hp_2.Value = '50000';

            % Create ACDCLabel_4
            app.ACDCLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.ACDCLabel_4.HorizontalAlignment = 'right';
            app.ACDCLabel_4.Position = [476 103 43 22];
            app.ACDCLabel_4.Text = 'AC/DC';

            % Create amplifiercoupling_2
            app.amplifiercoupling_2 = uidropdown(app.SpecimenMetadataPanel_2);
            app.amplifiercoupling_2.Items = {'AC', 'DC', ''};
            app.amplifiercoupling_2.Editable = 'on';
            app.amplifiercoupling_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.amplifiercoupling_2.BackgroundColor = [1 1 1];
            app.amplifiercoupling_2.Position = [523 103 52 22];
            app.amplifiercoupling_2.Value = 'AC';

            % Create VDDropDownLabel
            app.VDDropDownLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.VDDropDownLabel.HorizontalAlignment = 'right';
            app.VDDropDownLabel.Position = [264 72 25 22];
            app.VDDropDownLabel.Text = 'VD';

            % Create vd_2
            app.vd_2 = uidropdown(app.SpecimenMetadataPanel_2);
            app.vd_2.Items = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'};
            app.vd_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.vd_2.Position = [296 72 45 22];
            app.vd_2.Value = '0';

            % Create GainDropDownLabel
            app.GainDropDownLabel = uilabel(app.SpecimenMetadataPanel_2);
            app.GainDropDownLabel.HorizontalAlignment = 'right';
            app.GainDropDownLabel.Position = [363 72 31 22];
            app.GainDropDownLabel.Text = 'Gain';

            % Create gain_2
            app.gain_2 = uidropdown(app.SpecimenMetadataPanel_2);
            app.gain_2.Items = {'10', '20', '50', '100', '200', '500', '1000', '2000', '5000', '10000', '20000', '50000'};
            app.gain_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.gain_2.Position = [400 72 68 22];
            app.gain_2.Value = '10';

            % Create calibrated_2
            app.calibrated_2 = uicheckbox(app.SpecimenMetadataPanel_2);
            app.calibrated_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.calibrated_2.Text = 'Calibrated';
            app.calibrated_2.Position = [270 16 77 22];

            % Create RatioEditField_2Label
            app.RatioEditField_2Label = uilabel(app.SpecimenMetadataPanel_2);
            app.RatioEditField_2Label.HorizontalAlignment = 'right';
            app.RatioEditField_2Label.Position = [346 16 34 22];
            app.RatioEditField_2Label.Text = 'Ratio';

            % Create calratio_2
            app.calratio_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.calratio_2.ValueChangedFcn = createCallbackFcn(app, @specimenno_2ValueChanged, true);
            app.calratio_2.Position = [390 16 51 22];

            % Create DistanceEditFieldLabel_4
            app.DistanceEditFieldLabel_4 = uilabel(app.SpecimenMetadataPanel_2);
            app.DistanceEditFieldLabel_4.HorizontalAlignment = 'right';
            app.DistanceEditFieldLabel_4.Position = [455 16 52 22];
            app.DistanceEditFieldLabel_4.Text = 'Distance';

            % Create caldist_2
            app.caldist_2 = uieditfield(app.SpecimenMetadataPanel_2, 'text');
            app.caldist_2.Position = [516 16 53 22];

            % Show the figure after all components are created
            app.DataAcquisitionLiveFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = eodrecorder2_source

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.DataAcquisitionLiveFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.DataAcquisitionLiveFigure)
        end
    end
end