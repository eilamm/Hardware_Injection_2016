% Creates the homepage for the hardware injection output. LLO and LHO have
% their own homepages.
function homepageHTML()
    path = '/home/eilam.morag/public_html/HWInjection/';
    server = getServerName();
    if (strcmp(server, 'L1'))
        host = 'LLO';
    else
        host = 'LHO';
    end
    title = sprintf('%s', 'Hardware Injections: ', host);
    text = sprintf('%s\n', ...
            '<!DOCTYPE html>', ...
            '<html>', ...
            '<head>', ...
                ['\t<title>', title, '</title>'], ...
                '<link rel="stylesheet" type="text/css" href="HWInjection.css"/>', ...
            '</head>', ...
            '<body>', ...
                '<div class = "header">', ...
                    '<h1>', ...
                        title, ...
                    '</h1>', ...
                '</div>', ...
                '<div class = "navBlock">', ...
                    '<table style="width:50%%">', ...
                        '<tr>', ...
                            '<th>Pulsar Navigation</th>', ...
                        '</tr>', ...
                        '<?php', ...
                            '$directories = scandir("/home/eilam.morag/public_html/HWInjection/");', ...
                            'foreach ($directories as $key => $folder) {', ...
                                'if ($key > 1 && fnmatch("*.css", $folder) == FALSE && fnmatch("*.php", $folder) == FALSE) {', ...
                                    '$path = $folder . "/" . $folder . ".php";', ...
                                    'echo "<tr><a href=$path>', ...
                                                '<td><a href=$path>$folder</a></td>', ...
                                            '</tr>";', ...
                                '}', ...
                            '}', ...
                        '?>', ...
                    '</table>', ...
                '</div>', ...
        '</body>', ...
        '</html>');


    filename = [path, 'HWInjection.php'];
    disp(['Creating file ', filename]);
    fileID = fopen(filename, 'w');
    fprintf(fileID, text);
    fclose(fileID);
end