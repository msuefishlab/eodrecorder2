classdef calibrator_source < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        CalibratorApp                  matlab.ui.Figure
        Calibratorv1Label              matlab.ui.control.Label
        DeviceDropDownLabel            matlab.ui.control.Label
        DeviceDropDown                 matlab.ui.control.DropDown
        ChannelDropDownLabel           matlab.ui.control.Label
        ChannelDropDown                matlab.ui.control.DropDown
        TerminalConfigDropDownLabel    matlab.ui.control.Label
        TerminalConfigDropDown         matlab.ui.control.DropDown
        StimulationChannelLabel        matlab.ui.control.Label
        CalibratorChannelLabel         matlab.ui.control.Label
        CalibrateButton                matlab.ui.control.Button
        ChannelDropDown_2Label         matlab.ui.control.Label
        StimChannelDropDown            matlab.ui.control.DropDown
        TerminalConfigDropDown_2Label  matlab.ui.control.Label
        StimTerminalConfigDropDown     matlab.ui.control.DropDown
        ChannelDropDown_3Label         matlab.ui.control.Label
        RecordingChannelDropDown       matlab.ui.control.DropDown
        TerminalConfigDropDown_3Label  matlab.ui.control.Label
        RecordingTerminalConfig        matlab.ui.control.DropDown
        CalibratorWandSizemmLabel      matlab.ui.control.Label
        WandSizeEditField              matlab.ui.control.NumericEditField
        GainEditFieldLabel             matlab.ui.control.Label
        CalibrationGainEditField       matlab.ui.control.NumericEditField
        EODChannelLabel                matlab.ui.control.Label
        GainEditFieldLabel_2           matlab.ui.control.Label
        FigTItle_2                     matlab.ui.control.Label
        TankGainEditField              matlab.ui.control.NumericEditField
        calibrationplot                matlab.ui.control.UIAxes
        SaveCalibrationDataButton      matlab.ui.control.Button
        TankAmpLabel                   matlab.ui.control.Label
        TankPeak                       matlab.ui.control.NumericEditField
        CalibratorAmpLabel             matlab.ui.control.Label
        CalibrationPeak                matlab.ui.control.NumericEditField
        DateCalibratedEditFieldLabel   matlab.ui.control.Label
        DateCalibratedEditField        matlab.ui.control.EditField
        SetupDecriptionTextAreaLabel   matlab.ui.control.Label
        SetupDecriptionTextArea        matlab.ui.control.TextArea
        StaffNameEditFieldLabel        matlab.ui.control.Label
        StaffNameEditField             matlab.ui.control.EditField
        RatioEditFieldLabel            matlab.ui.control.Label
        RatioEditField                 matlab.ui.control.NumericEditField
        ResultTextAreaLabel            matlab.ui.control.Label
        ResultTextArea                 matlab.ui.control.TextArea
    end

    % 2018/02/09 AU
    % Copyright 2018 The MathWorks, Inc.

    properties (Access = public)
        DAQSession % Handle to DAQ session
    end
    
    properties (Access = private)
        DevicesInfo % Array of devices that provide analog input voltage or audio input measurements
        results % Description
    end
    
    methods (Access = private)
        
        

        
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
                    drawnow;
                    
                    numColumns = 2;
                    binFile2MAT(app, app.TempFilename, matFilepath, numColumns, metadata);
                    app.LogStatusText.Text = sprintf('Saved data to ''%s'' !', app.Filename);
                    set(app.LivePlotLine, 'XData', NaN, 'YData', NaN);
                    drawnow;
                else
                    % User clicked Cancel in "Save As" dialog
                    % Inform user that data has not been saved
                    app.LogStatusText.Text = 'Save was cancelled.';
                    set(app.LivePlotLine, 'XData', NaN, 'YData', NaN);
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
        

        function results = calibration_nation(app)
            cla(app.calibrationplot);
            output_data=0.2*sin(linspace(0,1000*pi,5000)');
            queueOutputData(app.DAQSession,output_data);
            [captured_data,time] = app.DAQSession.startForeground();
            hold(app.calibrationplot,'on');
            plot(app.calibrationplot,time,captured_data(:,1),'r-','DisplayName','Tank Electrodes');
            plot(app.calibrationplot,time,captured_data(:,2),'b-','DisplayName','Calibrator Electrode');
            legend(app.calibrationplot);
            hold(app.calibrationplot,'off');
            [tank_peak,~]=amplitude(app,app.TankGainEditField.Value,captured_data(:,1)); %tank is always first channel
            [calibrator_peak,~]=amplitude(app,app.CalibrationGainEditField.Value,captured_data(:,2)); %calibrator is always second channel
            tank_peak=round(tank_peak*100)/100; %round
            calibrator_peak=round(calibrator_peak*100)/100; %round
            
            calibration= calibrator_peak / tank_peak;
            calibration = round(calibration*1000)/1000; %round
            
            app.RatioEditField.Value=calibration;
            app.TankPeak.Value=tank_peak;
            app.CalibrationPeak.Value=calibrator_peak;
            app.DateCalibratedEditField.Value=datestr(datetime('now'));
            results.staff=app.StaffNameEditField.Value;
            results.description=app.SetupDecriptionTextArea.Value;
            results.calibrator_peak=calibrator_peak;
            results.tank_peak=tank_peak;
            results.calibration_ratio=calibration;
            results.calibration_distance=app.WandSizeEditField.Value;
            results.interpretation=strcat('Voltage values with this exact tank setup may be divided by',num2str(results.calibration_ratio), ' to convert to amplitude as measured ', num2str(app.WandSizeEditField.Value), ' mm from a fish.  Care must be taken that the tank as described in setup description is identical (water quality, geometry electrode placement, etc.)' );
            app.ResultTextArea.Value=results.interpretation;
            
        end
        
        function [amp,offset] = amplitude(~,gain,AD)
            AD = 1000 * AD / gain; %convert to actual milivolts
            offset = mean(AD);   
            ADrms =  sqrt(mean(AD.^2));
            amp = sqrt(2) * ADrms;
        end
    end          

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
         % Detect all connected devices
            devices = daq.getDevices;
            
            % Keep a subset of devices which have
            %  - analog input subsystem or audio input subsystem
            %  - voltage or audio measurement type
            devices = filterDevicesBySubsystem(app, devices, {'AnalogInput'});
            devices = filterDevicesByMeasurement(app, devices, {'Voltage'});
            
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
                        

        end

        % Value changed function: DeviceDropDown
        function DeviceDropDownValueChanged(app, event)
            value = app.DeviceDropDown.Value;
            
            if ~isempty(value)
                % Device index is offset by 1 because first element in device dropdown
                % is "Select a device" (not a device).
                deviceIndex = value-1 ;
                
                % Reset channel property options
                app.TerminalConfigDropDown.Items = {''};
                app.StimTerminalConfigDropDown.Items = {''};
                app.RecordingTerminalConfig.Items = {''};
                
                % Delete DAQ session, as a new one will be created for the newly selected device
                delete(app.DAQSession);
                app.DAQSession = [];
                
                if deviceIndex > 0
                    % If a device is selected
                    
                    % Get subsystem information to update channel dropdown list and channel property options
                    % For devices that have an analog input or an audio input subsystem, this is the first subsystem
                    subsystem = app.DevicesInfo(deviceIndex).Subsystems(1);
                    app.ChannelDropDown.Items = cellstr(string(subsystem.ChannelNames));
                    app.RecordingChannelDropDown.Items = cellstr(string(subsystem.ChannelNames));
                    
                    subsystem_output=app.DevicesInfo(deviceIndex).Subsystems(2);
                    app.StimChannelDropDown.Items = cellstr(string(subsystem_output.ChannelNames));
                    
                    % Update channel and channel property options
                    ChannelDropDownValueChanged(app, []);
                else
                    % If no device is selected
                    % Reset the channel dropdown list
                    app.ChannelDropDown.Items = {''};
                    
                    % Disable calibration start button
                    app.CalibrateButton.Enable = 'off';
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
            subsystem_out=app.DevicesInfo(deviceIndex).Subsystems(2);
            
            % Create a new DAQ session
            s = daq.createSession(vendor);
            
            measurementType = 'Voltage';
            addAnalogInputChannel(s, deviceID, value, measurementType);
            app.RecordingChannelDropDown.Value='ai1';
            addAnalogInputChannel(s, deviceID, app.RecordingChannelDropDown.Value, measurementType);
            addAnalogOutputChannel(s,deviceID,app.StimChannelDropDown.Value,measurementType);

            % Populate dropdown with available channel 'TerminalConfig' options
            app.TerminalConfigDropDown.Items = getChannelPropertyOptions(app, subsystem, 'TerminalConfig');
            app.StimTerminalConfigDropDown.Items = getChannelPropertyOptions(app, subsystem_out, 'TerminalConfig');
            app.RecordingTerminalConfig.Items = getChannelPropertyOptions(app, subsystem, 'TerminalConfig');
            
            % Update UI with the actual channel property value
            % (default value is not necessarily first in the list)
            % DropDown Value must be set as a character array in MATLAB R2017b
            app.TerminalConfigDropDown.Value = s.Channels(1).TerminalConfig;
            app.TerminalConfigDropDown.Tag='TerminalConfig';
            app.StimTerminalConfigDropDown.Value = s.Channels(3).TerminalConfig;
            app.StimTerminalConfigDropDown.Tag='TerminalConfig';
            app.RecordingTerminalConfig.Value = s.Channels(2).TerminalConfig;
            app.RecordingTerminalConfig.Tag='TerminalConfig';
            
                        
            % Store DAQ session handle in DaqSession app property
            app.DAQSession = s;
            
           
        end

        % Value changed function: TerminalConfigDropDown
        function TerminalConfigDropDownValueChanged(app, event)
            value = app.TerminalConfigDropDown.Value;

            try
                set(app.DAQSession.Channels(1), 'TerminalConfig', value);
            catch exception
                % In case of error show it and revert the change
                uialert(app.CalibratorApp, exception.message, 'Channel property error');
                event.Source.Value = event.PreviousValue;
            end
            
            % Make sure shown channel property values are not stale, as some property update can trigger changes in other properties
            % Update UI with current channel property values from DAQ session
            app.TerminalConfigDropDown.Value = app.DAQSession.Channels(1).TerminalConfig;
            
        end

        % Value changed function: StimTerminalConfigDropDown
        function StimTerminalConfigDropDownValueChanged(app, event)
            value = app.StimTerminalConfigDropDown.Value;

            try
                set(app.DAQSession.Channels(3), 'TerminalConfig', value);
            catch exception
                % In case of error show it and revert the change
                uialert(app.CalibratorApp, exception.message, 'Channel property error');
                event.Source.Value = event.PreviousValue;
            end
            
            % Make sure shown channel property values are not stale, as some property update can trigger changes in other properties
            % Update UI with current channel property values from DAQ session
            app.TerminalConfigDropDown.Value = app.DAQSession.Channels(3).TerminalConfig;
            
        end

        % Value changed function: RecordingTerminalConfig
        function RecordingTerminalConfigValueChanged(app, event)
            value = app.RecordingTerminalConfig.Value;

            try
                set(app.DAQSession.Channels(2), 'TerminalConfig', value);
            catch exception
                % In case of error show it and revert the change
                uialert(app.CalibratorApp, exception.message, 'Channel property error');
                event.Source.Value = event.PreviousValue;
            end
            
            % Make sure shown channel property values are not stale, as some property update can trigger changes in other properties
            % Update UI with current channel property values from DAQ session
            app.TerminalConfigDropDown.Value = app.DAQSession.Channels(2).TerminalConfig;
            
        end

        % Button pushed function: CalibrateButton
        function CalibrateButtonPushed(app, event)
            app.results=calibration_nation(app);
        end

        % Button pushed function: SaveCalibrationDataButton
        function SaveCalibrationDataButtonPushed(app, event)
            fn=strcat('calibration_results_',datestr(now,'mm-dd-yyyy'),'.mat');
            res=app.results;
            uisave('res',fn)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create CalibratorApp and hide until all components are created
            app.CalibratorApp = uifigure('Visible', 'off');
            app.CalibratorApp.Position = [100 100 914 606];
            app.CalibratorApp.Name = 'Calibrator';

            % Create Calibratorv1Label
            app.Calibratorv1Label = uilabel(app.CalibratorApp);
            app.Calibratorv1Label.FontSize = 24;
            app.Calibratorv1Label.Position = [14 563 232 30];
            app.Calibratorv1Label.Text = 'Calibrator v1';

            % Create DeviceDropDownLabel
            app.DeviceDropDownLabel = uilabel(app.CalibratorApp);
            app.DeviceDropDownLabel.HorizontalAlignment = 'right';
            app.DeviceDropDownLabel.Position = [20 529 42 22];
            app.DeviceDropDownLabel.Text = 'Device';

            % Create DeviceDropDown
            app.DeviceDropDown = uidropdown(app.CalibratorApp);
            app.DeviceDropDown.Items = {'Select a device'};
            app.DeviceDropDown.ValueChangedFcn = createCallbackFcn(app, @DeviceDropDownValueChanged, true);
            app.DeviceDropDown.Tooltip = {'Choose data aquisition hardware.'};
            app.DeviceDropDown.Position = [80 529 214 22];
            app.DeviceDropDown.Value = 'Select a device';

            % Create ChannelDropDownLabel
            app.ChannelDropDownLabel = uilabel(app.CalibratorApp);
            app.ChannelDropDownLabel.HorizontalAlignment = 'right';
            app.ChannelDropDownLabel.Position = [95 467 50 22];
            app.ChannelDropDownLabel.Text = 'Channel';

            % Create ChannelDropDown
            app.ChannelDropDown = uidropdown(app.CalibratorApp);
            app.ChannelDropDown.Items = {};
            app.ChannelDropDown.ValueChangedFcn = createCallbackFcn(app, @ChannelDropDownValueChanged, true);
            app.ChannelDropDown.Tooltip = {'Choose recording channel.  Currently only single channel recording is enabled.'};
            app.ChannelDropDown.Position = [151 467 100 22];
            app.ChannelDropDown.Value = {};

            % Create TerminalConfigDropDownLabel
            app.TerminalConfigDropDownLabel = uilabel(app.CalibratorApp);
            app.TerminalConfigDropDownLabel.HorizontalAlignment = 'right';
            app.TerminalConfigDropDownLabel.Position = [53 436 92 22];
            app.TerminalConfigDropDownLabel.Text = 'Terminal Config.';

            % Create TerminalConfigDropDown
            app.TerminalConfigDropDown = uidropdown(app.CalibratorApp);
            app.TerminalConfigDropDown.Items = {};
            app.TerminalConfigDropDown.ValueChangedFcn = createCallbackFcn(app, @TerminalConfigDropDownValueChanged, true);
            app.TerminalConfigDropDown.Position = [151 436 100 22];
            app.TerminalConfigDropDown.Value = {};

            % Create StimulationChannelLabel
            app.StimulationChannelLabel = uilabel(app.CalibratorApp);
            app.StimulationChannelLabel.FontWeight = 'bold';
            app.StimulationChannelLabel.Position = [10 371 122 22];
            app.StimulationChannelLabel.Text = 'Stimulation Channel';

            % Create CalibratorChannelLabel
            app.CalibratorChannelLabel = uilabel(app.CalibratorApp);
            app.CalibratorChannelLabel.FontWeight = 'bold';
            app.CalibratorChannelLabel.Position = [10 279 113 22];
            app.CalibratorChannelLabel.Text = 'Calibrator Channel';

            % Create CalibrateButton
            app.CalibrateButton = uibutton(app.CalibratorApp, 'push');
            app.CalibrateButton.ButtonPushedFcn = createCallbackFcn(app, @CalibrateButtonPushed, true);
            app.CalibrateButton.Position = [14 15 323 22];
            app.CalibrateButton.Text = 'Calibrate!';

            % Create ChannelDropDown_2Label
            app.ChannelDropDown_2Label = uilabel(app.CalibratorApp);
            app.ChannelDropDown_2Label.HorizontalAlignment = 'right';
            app.ChannelDropDown_2Label.Position = [100 342 50 22];
            app.ChannelDropDown_2Label.Text = 'Channel';

            % Create StimChannelDropDown
            app.StimChannelDropDown = uidropdown(app.CalibratorApp);
            app.StimChannelDropDown.Items = {};
            app.StimChannelDropDown.Tooltip = {'Choose recording channel.  Currently only single channel recording is enabled.'};
            app.StimChannelDropDown.Position = [156 342 100 22];
            app.StimChannelDropDown.Value = {};

            % Create TerminalConfigDropDown_2Label
            app.TerminalConfigDropDown_2Label = uilabel(app.CalibratorApp);
            app.TerminalConfigDropDown_2Label.HorizontalAlignment = 'right';
            app.TerminalConfigDropDown_2Label.Position = [61 310 92 22];
            app.TerminalConfigDropDown_2Label.Text = 'Terminal Config.';

            % Create StimTerminalConfigDropDown
            app.StimTerminalConfigDropDown = uidropdown(app.CalibratorApp);
            app.StimTerminalConfigDropDown.Items = {};
            app.StimTerminalConfigDropDown.ValueChangedFcn = createCallbackFcn(app, @StimTerminalConfigDropDownValueChanged, true);
            app.StimTerminalConfigDropDown.Position = [159 310 100 22];
            app.StimTerminalConfigDropDown.Value = {};

            % Create ChannelDropDown_3Label
            app.ChannelDropDown_3Label = uilabel(app.CalibratorApp);
            app.ChannelDropDown_3Label.HorizontalAlignment = 'right';
            app.ChannelDropDown_3Label.Position = [100 258 50 22];
            app.ChannelDropDown_3Label.Text = 'Channel';

            % Create RecordingChannelDropDown
            app.RecordingChannelDropDown = uidropdown(app.CalibratorApp);
            app.RecordingChannelDropDown.Items = {};
            app.RecordingChannelDropDown.Tooltip = {'Choose recording channel.  Currently only single channel recording is enabled.'};
            app.RecordingChannelDropDown.Position = [156 258 100 22];
            app.RecordingChannelDropDown.Value = {};

            % Create TerminalConfigDropDown_3Label
            app.TerminalConfigDropDown_3Label = uilabel(app.CalibratorApp);
            app.TerminalConfigDropDown_3Label.HorizontalAlignment = 'right';
            app.TerminalConfigDropDown_3Label.Position = [61 223 92 22];
            app.TerminalConfigDropDown_3Label.Text = 'Terminal Config.';

            % Create RecordingTerminalConfig
            app.RecordingTerminalConfig = uidropdown(app.CalibratorApp);
            app.RecordingTerminalConfig.Items = {};
            app.RecordingTerminalConfig.ValueChangedFcn = createCallbackFcn(app, @RecordingTerminalConfigValueChanged, true);
            app.RecordingTerminalConfig.Position = [159 223 100 22];
            app.RecordingTerminalConfig.Value = {};

            % Create CalibratorWandSizemmLabel
            app.CalibratorWandSizemmLabel = uilabel(app.CalibratorApp);
            app.CalibratorWandSizemmLabel.HorizontalAlignment = 'right';
            app.CalibratorWandSizemmLabel.Position = [14 49 150 22];
            app.CalibratorWandSizemmLabel.Text = 'Calibrator Wand Size (mm)';

            % Create WandSizeEditField
            app.WandSizeEditField = uieditfield(app.CalibratorApp, 'numeric');
            app.WandSizeEditField.Position = [179 49 100 22];

            % Create GainEditFieldLabel
            app.GainEditFieldLabel = uilabel(app.CalibratorApp);
            app.GainEditFieldLabel.HorizontalAlignment = 'right';
            app.GainEditFieldLabel.Position = [111 189 31 22];
            app.GainEditFieldLabel.Text = 'Gain';

            % Create CalibrationGainEditField
            app.CalibrationGainEditField = uieditfield(app.CalibratorApp, 'numeric');
            app.CalibrationGainEditField.Position = [162 190 100 22];

            % Create EODChannelLabel
            app.EODChannelLabel = uilabel(app.CalibratorApp);
            app.EODChannelLabel.FontWeight = 'bold';
            app.EODChannelLabel.Position = [14 488 82 22];
            app.EODChannelLabel.Text = 'EOD Channel';

            % Create GainEditFieldLabel_2
            app.GainEditFieldLabel_2 = uilabel(app.CalibratorApp);
            app.GainEditFieldLabel_2.HorizontalAlignment = 'right';
            app.GainEditFieldLabel_2.Position = [102 400 31 22];
            app.GainEditFieldLabel_2.Text = 'Gain';

            % Create TankGainEditField
            app.TankGainEditField = uieditfield(app.CalibratorApp, 'numeric');
            app.TankGainEditField.Position = [153 401 100 22];

            % Create FigTItle_2
            app.FigTItle_2 = uilabel(app.CalibratorApp);
            app.FigTItle_2.HorizontalAlignment = 'center';
            app.FigTItle_2.FontSize = 18;
            app.FigTItle_2.Position = [587 563 135 22];
            app.FigTItle_2.Text = 'Calibration Data';

            % Create calibrationplot
            app.calibrationplot = uiaxes(app.CalibratorApp);
            xlabel(app.calibrationplot, 'Time (s)')
            ylabel(app.calibrationplot, 'Voltage (V)')
            app.calibrationplot.PlotBoxAspectRatio = [1.95306859205776 1 1];
            app.calibrationplot.Box = 'on';
            app.calibrationplot.XGrid = 'on';
            app.calibrationplot.YGrid = 'on';
            app.calibrationplot.Position = [448 290 416 262];

            % Create SaveCalibrationDataButton
            app.SaveCalibrationDataButton = uibutton(app.CalibratorApp, 'push');
            app.SaveCalibrationDataButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCalibrationDataButtonPushed, true);
            app.SaveCalibrationDataButton.Position = [492 15 362 22];
            app.SaveCalibrationDataButton.Text = 'Save Calibration Data';

            % Create TankAmpLabel
            app.TankAmpLabel = uilabel(app.CalibratorApp);
            app.TankAmpLabel.HorizontalAlignment = 'right';
            app.TankAmpLabel.Position = [391 259 62 22];
            app.TankAmpLabel.Text = 'Tank Amp.';

            % Create TankPeak
            app.TankPeak = uieditfield(app.CalibratorApp, 'numeric');
            app.TankPeak.Editable = 'off';
            app.TankPeak.HorizontalAlignment = 'center';
            app.TankPeak.Position = [470 259 58 22];

            % Create CalibratorAmpLabel
            app.CalibratorAmpLabel = uilabel(app.CalibratorApp);
            app.CalibratorAmpLabel.HorizontalAlignment = 'right';
            app.CalibratorAmpLabel.Position = [549 258 89 22];
            app.CalibratorAmpLabel.Text = 'Calibrator Amp.';

            % Create CalibrationPeak
            app.CalibrationPeak = uieditfield(app.CalibratorApp, 'numeric');
            app.CalibrationPeak.Editable = 'off';
            app.CalibrationPeak.HorizontalAlignment = 'center';
            app.CalibrationPeak.Position = [648 258 53 22];

            % Create DateCalibratedEditFieldLabel
            app.DateCalibratedEditFieldLabel = uilabel(app.CalibratorApp);
            app.DateCalibratedEditFieldLabel.HorizontalAlignment = 'right';
            app.DateCalibratedEditFieldLabel.Position = [358 223 89 22];
            app.DateCalibratedEditFieldLabel.Text = 'Date Calibrated';

            % Create DateCalibratedEditField
            app.DateCalibratedEditField = uieditfield(app.CalibratorApp, 'text');
            app.DateCalibratedEditField.Editable = 'off';
            app.DateCalibratedEditField.Position = [462 223 419 22];

            % Create SetupDecriptionTextAreaLabel
            app.SetupDecriptionTextAreaLabel = uilabel(app.CalibratorApp);
            app.SetupDecriptionTextAreaLabel.HorizontalAlignment = 'right';
            app.SetupDecriptionTextAreaLabel.Position = [10 115 94 22];
            app.SetupDecriptionTextAreaLabel.Text = 'Setup Decription';

            % Create SetupDecriptionTextArea
            app.SetupDecriptionTextArea = uitextarea(app.CalibratorApp);
            app.SetupDecriptionTextArea.Position = [119 83 218 54];

            % Create StaffNameEditFieldLabel
            app.StaffNameEditFieldLabel = uilabel(app.CalibratorApp);
            app.StaffNameEditFieldLabel.HorizontalAlignment = 'right';
            app.StaffNameEditFieldLabel.Position = [10 151 65 22];
            app.StaffNameEditFieldLabel.Text = 'Staff Name';

            % Create StaffNameEditField
            app.StaffNameEditField = uieditfield(app.CalibratorApp, 'text');
            app.StaffNameEditField.Position = [121 151 216 22];

            % Create RatioEditFieldLabel
            app.RatioEditFieldLabel = uilabel(app.CalibratorApp);
            app.RatioEditFieldLabel.HorizontalAlignment = 'right';
            app.RatioEditFieldLabel.Position = [735 258 34 22];
            app.RatioEditFieldLabel.Text = 'Ratio';

            % Create RatioEditField
            app.RatioEditField = uieditfield(app.CalibratorApp, 'numeric');
            app.RatioEditField.Editable = 'off';
            app.RatioEditField.HorizontalAlignment = 'center';
            app.RatioEditField.Position = [781 258 100 22];

            % Create ResultTextAreaLabel
            app.ResultTextAreaLabel = uilabel(app.CalibratorApp);
            app.ResultTextAreaLabel.HorizontalAlignment = 'right';
            app.ResultTextAreaLabel.Position = [404 187 43 22];
            app.ResultTextAreaLabel.Text = 'Result:';

            % Create ResultTextArea
            app.ResultTextArea = uitextarea(app.CalibratorApp);
            app.ResultTextArea.Editable = 'off';
            app.ResultTextArea.Position = [462 151 419 60];

            % Show the figure after all components are created
            app.CalibratorApp.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = calibrator_source

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.CalibratorApp)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.CalibratorApp)
        end
    end
end