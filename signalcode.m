function [signal_modulate_code,signal_phase] = signalcode(settings,code_table)
    global modulate_code_nco;  %% ��Ƶ�����λ
    
    Ncoh = settings.Ncoh;
    signal_modulate_code=[];
    for i=1:Ncoh
        modulate_code_nco = modulate_code_nco + settings.code_word + settings.fd_code;%��Ƶ���� + ������Ƶ����
        modulate_code_nco = mod(modulate_code_nco,2^32*2046);%��Ҫ����һ�������ڣ�2^32 ����һ����Ƭ��2046��Ƭ��һ������
        index = 1+fix(modulate_code_nco/2^32);%������2^32����ʾҪ��λ���¸���Ƭ
        c = code_table(index);%�����
        signal_modulate_code = [signal_modulate_code,c];
        if 1 == i 
            signal_phase = modulate_code_nco/2^32*360;
        end
    end