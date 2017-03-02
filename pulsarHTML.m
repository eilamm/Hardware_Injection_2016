% Generates the webpage for a given pulsar 
function pulsarHTML(date, i)
    %% Initializing variables
    if (i < 10)
        pulsar = ['Pulsar 0', num2str(i)];
        nospace = ['Pulsar0', num2str(i)];        
    else
    	pulsar = ['Pulsar ', num2str(i)];
        nospace = ['Pulsar', num2str(i)];
    end
    
    server = getServerName();
    if (strcmp(server, 'L1'))
        host = 'LLO';
    else
        host = 'LHO';
    end
    
    title = [pulsar, ': ', host];
    
    path = sprintf('%s', '/home/eilam.morag/public_html/HWInjection/', ...
        nospace, '/');

    plot_c = sprintf('%s', 'current/', date, '_c.png');
    plot_d = sprintf('%s', 'current/', date, '_d.png');
    
    %% HTML text
    text = sprintf('%s', '<!DOCTYPE html>\n', ...
            '<html>\n', ...
            '<head>\n', ...
            '    <title>', title, '</title>\n', ...
            '    <meta charset="utf-8"/>\n', ...
            '    <link rel="stylesheet" type="text/css" href="pulsar.css"/>\n', ...
            '    <script src="../readableDate.js" type="text/javascript"></script>\n', ...
            '</head>\n', ...
            '<body>\n', ...
            '    <h1>\n', ...
            '    ', title, '\n', ...
            '    </h1>\n', ...
            '    <div class = "data">\n', ...
            '        <img class="plot_c" id="plot_c" height="530" width="707" src="', plot_c, '"/>\n', ...
            '        <img class="plot_d" id="plot_d" height="530" width="707" src="', plot_d, '"/>\n', ...
            '    </div>\n', ...
            '    <div class="date">\n', ...
            '        <h2>\n', ...
            '            Dates\n', ...
            '        </h2>\n', ...
            '        <ul>\n', ...
            '            <?php\n', ...
            '                $dirs = scandir("', path, '");\n', ...
            '                foreach ($dirs as $key => $folder) {\n', ...  
            '                    if ($key > 1 && fnmatch("*.css", $folder) == ', ...
                                    'FALSE && fnmatch("*.php", $folder) == FALSE) {\n', ...
            '                         echo "<p onclick=\\"changeDate(''$folder'')\\">$folder</p>";\n', ...
            '                    }\n', ...
            '                }\n', ...
            '            ?>\n', ...
            '        </ul>\n', ...
            '    </div>\n', ...
            '<script type="text/javascript">\n', ...
            '    function changeDate(date) {\n', ...
            '        if (date === "current") {\n', ...
            '            var folder = date.concat("/", ', date, ');\n', ...
            '        } else {\n', ...
            '            var folder = date.concat("/", date);\n', ...
            '        }', ...
            '        var plot_c = folder.concat("_c.png");\n', ...
            '        var plot_d = folder.concat("_d.png");\n', ...
            '        document.getElementById("plot_c").src = plot_c;\n', ...
            '        document.getElementById("plot_d").src = plot_d;\n', ...
            '    };\n', ...
            '</script>', ...
            '</body>\n', ...
            '</html>' );
    
    %% Saving the file
    filename = sprintf('%s', path, nospace, '.php');
    fileID = fopen(filename, 'w');
    fprintf(fileID, text);
    fclose(fileID);
    %% Updating CSS file
    pulsarCSS(path);
end