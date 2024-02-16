data_emg = xml2struct('resting_MD.nnm');
Nstim = length(data_emg.root.needles.needle);
Nchan = length(data_emg.root.needles.needle{i}.mep.emg_waves.emg_wave);

for i = 1:Nstim %number of stimuli in the xml file
    for j = 1:Nchan
    emg = data_emg.root.needles.needle{i}.mep.emg_waves.emg_wave{j}.Attributes.curveDataVolts;
    position = data_emg.root.needles.needle{i}.mep.tms_stimulus.tms_stimulus_nena_data.stimPos.Attributes.data;
    end
end
    
 