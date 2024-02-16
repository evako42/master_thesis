
function [emg1, emg2, pos] = loaddata(xmlfile)
    data_emg = xml2struct(xmlfile);
    Nstim = length(data_emg.root.needles.needle);
    emg1 = {};
    emg2 = {};
    pos = {};
    
    for i = 1:Nstim %number of pulses in the xml file
        temp1 = data_emg.root.needles.needle{i}.mep.emg_waves.emg_wave{1}.Attributes.curveDataVolts;
        temp2 = data_emg.root.needles.needle{i}.mep.emg_waves.emg_wave{2}.Attributes.curveDataVolts;
        data(i).emg1 = textscan(temp1,'%f') ;
        data(i).emg2 = textscan(temp2,'%f') ;
        
        emg1 = [emg1, data(i).emg1{1,1}];
        emg2 = [emg2, data(i).emg2{1,1}];
        
        temp3 = data_emg.root.needles.needle{i}.mep.tms_stimulus.tms_stimulus_nena_data.stimPos.Attributes.data;
        data(i).position = textscan(temp3,'%f') ;
        pos = [pos, data(i).position{1,1}];
        
    end
    

end
    




