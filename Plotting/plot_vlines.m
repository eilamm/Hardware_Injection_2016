% Plots vertical dashed lines to denote the month ends in the range
% contained by startDate and endDate
% NOTE: Turns "hold" on
function plot_vlines(startDate, endDate)
    hold on;
    day = startDate;
    i = 0;
    while (day <= endDate)
        if (day.last_of_month() == 1)
            line([i i], ylim, 'LineStyle', '--');
        end
        day = day.next_day();
        i = i + 1;
    end
end