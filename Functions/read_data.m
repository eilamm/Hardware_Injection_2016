% Eilam Morag
% February 21, 2016
% Reads in the frequency data for a given day, month, year and frequency
% range (give the first frequency in the range). Returns the data in vector data
function filenames = read_data(day, month, year, server)
    % Uncomment below path for Hann-windowed SFTs
%     path = ['/home/pulsar/public_html/fscan/H1_DUAL_ARM/H1_DUAL_ARM_HANN/',...
%            'H1_DUAL_ARM_HANN/'];
    % Below path for Tukey-windowed SFTS
    path = 'Nothing';
    if (strcmp(server, 'L1'))
        path = ['/home/pulsar/public_html/fscan/L1_DUAL_ARM/L1_DUAL_ARM_DCREADOUT_TUKEY/',...
           'L1_DUAL_ARM_DCREADOUT_TUKEY/'];
        chan = 'L1_GDS-CALIB_STRAIN';
    elseif (strcmp(server, 'H1'))
        path = ['/home/pulsar/public_html/fscan/H1_DUAL_ARM/H1_DUAL_ARM_TUKEY/',...
           'H1_DUAL_ARM_TUKEY/'];
        chan = 'H1_GDS-CALIB_STRAIN';
    end
    
    filenames = '';   
       
    y = num2str(year);
    if (month < 10)
        m = ['0', num2str(month)];
    else
        m = num2str(month);
    end
    if (day < 10)
        d = ['0', num2str(day)];
    else
        d = num2str(day);
    end
    
    temp = [path, '/fscans_', y, '_', m, '_', d, '*'];
    folder = dir(temp);
    path = [path, folder.name];
    
    
    
        
    path = [path, '/', chan, '/sfts/tmp/'];
    filetype = [path, '*.sft'];

    folder = dir(filetype); % Structure containing all the sfts in directory
    
    % if there's no SFTs in a folder, or if there's too many (e.g. Feb 23,
    % 2017), then don't make a symlink for that folder
    if (isempty(folder) || length(folder) > 1000)
        % Do nothing
        disp(['No sfts for date: ',  num2str(month), '/', num2str(day), '/', num2str(year)]);
    else
    
        name = Date([month, day, year]).date2str_num();
        symlink = sft2symlink(path, name);
        filenames = [symlink, '/*.sft;'];
%         for i = 1:length(folder)
%             file_path = [folder_path, folder(i).name];
%             symlink = sft2symlink(file_path, folder(i).name);
%             filenames = [filenames, symlink, ';'];
% %             filenames = [filenames, folder_path, folder(i).name, ';' ];
%         end
        
    end
    
end