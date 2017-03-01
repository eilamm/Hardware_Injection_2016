% Creates the CSS file for the homepage for the hardware injection project
function homepageCSS()
    text = ['' ,...
    '.navBlock td a {\n', ...
            'display: block;\n', ...
            'text-decoration: none;\n', ...
    '}\n', ...
    '.header {\n', ...
            'text-align: center;\n', ...
            'font-family: Helvetica;\n', ...
    '}\n', ...
    'h2 {\n', ...
            'text-align: center;\n', ...
            'font-family: Helvetica;\n', ...
    '}\n', ...
    '.navBlock table {\n', ...
            'text-align: center;\n', ...
            'width: 50%%;\n', ...
            'margin-left: 25%%;\n', ...
            'margin-right: 25%%;\n', ...
            'font-family: Helvetica;\n', ...
            'border-bottom: 2px solid #ddd;\n', ...
            'border-collapse: collapse;\n', ...
            'overflow-y: auto;\n', ...
    '}\n', ...
    '.navBlock tr:hover {\n', ...
            'background: lime;\n', ...
    '}\n', ...
    '.navBlock tr:first-child:hover {\n', ...
            'background: white;\n', ...
    '}\n', ...
    '.navBlock th {\n', ...
            'font-size: 20px;\n', ...
            'border-bottom: 2px solid #ddd;\n', ...
    '}\n', ...
    '.navBlock th:hover {\n', ...
            'background: white;\n', ...
    '}\n', ...
    '.navBlock td {\n', ...
            'font-size: 18px;\n', ...
    '}\n'];

    filename = [path, 'HWInjection.css'];
    disp(['Creating file ', filename]);
    fileID = fopen(filename, 'w');
    fprintf(fileID, text);
    fclose(fileID); 
end