
% Generates the webpage for a given pulsar 
function pulsarHTML2(i)
    load('Pulsar-parameters/pulsars.mat', 'pulsar_list');
    p = pulsar_list(i+1);
    clear pulsar_list
    pulsarInfo = p.pulsar2strWebpage();
    %% Initializing variables
    nospace = sprintf('Pulsar%02d', i);
    
    server = getServerName();
    if (strcmp(server, 'L1'))
        host = 'LLO';
    else
        host = 'LHO';
    end
    
    title = sprintf('%s: Pulsar %02d', host, i);
    
    path = sprintf('%s/%s/', getWebsiteLocation(), nospace);
    plot_c = sprintf('current/cumulativePlot.png');
    plot_d = sprintf('current/dailyPlot.png');
    plot_h0 = sprintf('current/h0Plot.png');
    plot_cosiota = sprintf('current/cosiotaPlot.png');
    plot_phi0 = sprintf('current/phi0Plot.png');
    plot_psi = sprintf('current/psiPlot.png');

    nextPulsar = i + 1;
    prevPulsar = i - 1; 
    if (i == 14)
	nextPulsar = 0;
	prevPulsar = 12;
    elseif (i == 12)
	nextPulsar = 14;
    elseif (i == 0);
	prevPulsar = 14;
    end
    %% HTML text
    text = sprintf(['<!DOCTYPE html>\n', ...
            '<html>\n', ...
            '<head>\n', ...
            '    <title>%1$s</title>\n', ...
            '    <meta charset="utf-8"/>\n', ...
            '    <link rel="stylesheet" type="text/css" href="pulsar.css"/>\n', ...
            '</head>\n', ...
            '<body>\n', ...
            '    <h1>\n', ...
            '    %1$s\n', ...
            '    </h1>\n', ...
	    '    <h2>\n', ...
	    '        Frequency: %2$.3f Hz &mdash; Spindown: %3$.3e Hz/s &mdash; cos(iota): %4$.3f\n', ...   
	    '    </h2>\n', ...
            '    <div class = "data">\n', ...
            '        <img class="plot_c" id="plot_c" height="530" width="707" src="%5$s"/>\n', ...
            '        <img class="plot_d" id="plot_d" height="530" width="707" src="%6$s"/>\n', ...
            '        <img class="plot_h0" id="plot_h0" height="530" width="707" src="%7$s"/>\n', ...
            '        <img class="plot_cosiota" id="plot_d" height="530" width="707" src="%8$s"/>\n', ...
            '        <img class="plot_phi0" id="plot_d" height="530" width="707" src="%9$s"/>\n', ...
            '        <img class="plot_psi" id="plot_d" height="530" width="707" src="%10$s"/>\n', ...
            '    </div>\n', ...
	    '    <div class = "text">\n', ...
	    '        <a href="current/FStatList.txt">See data in table form</a>\n', ...
	    '    </div>\n', ...
	    '    <div class = "pulsarNav">\n', ...
	    '        <a href="../Pulsar%11$02d/Pulsar%11$02d.html"> Go to Pulsar %11$d</a>\n', ...
	    '        <a href="../Pulsar%12$02d/Pulsar%12$02d.html"> Go to Pulsar %12$d</a>\n', ...
	    '    </div>\n', ...
	    '    <h4>\n', ...
            '        <a href="../HWInjection.html">Back to homepage</a>\n', ...
	    '    </h4>\n', ...
            '</body>\n', ...
            '</html>'], ...
		title, p.f0, p.fdot, cos(p.iota), plot_c, plot_d, plot_h0, plot_cosiota, plot_phi0, plot_psi, prevPulsar, nextPulsar);
    
    %% Saving the file
    filename = sprintf('%s', path, nospace, '.html');
    fileID = fopen(filename, 'w');
    if (fileID ~= -1)
	fprintf('Creating file %s\n', filename);
    end
    fprintf(fileID, text);
    fclose(fileID);
    %% Updating CSS file
    pulsarCSS(path);
end
