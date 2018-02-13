function ssd_map = ssd_patch(sample, template, overlap, top_mask, left_mask)
    if mod(size(template, 1), 2) == 0
        padding_col = template(:, 1, :);
        template = cat(2, padding_col, template);
        padding_row = template(1, :, :);
        template = cat(1, padding_row, template);
    end
    ssd_map = zeros(size(sample, 1) - size(template, 1) + 1, size(sample, 2) - size(template, 2) + 1);
    for i =  1 : size(ssd_map, 1)
        for j = 1 : size(ssd_map, 2)
            patch = sample(i : i + size(template, 1) - 1, j : j + size(template, 2) - 1, : );
            masked_patch = patch;
            if (top_mask == 1 && left_mask == 1)
                masked_patch(overlap + 1 : end, overlap + 1 : end, :) = 0;
            elseif (top_mask == 1 && left_mask == 0)
                masked_patch(overlap + 1 : end, :, :) = 0;
            elseif (top_mask == 0 && left_mask == 1)
                masked_patch(:, overlap + 1 : end, :) = 0;
            end
            dif = template - masked_patch;
            ssd = sum(dif(:).^2);
            ssd_map(i, j) = ssd;
        end
    end
end