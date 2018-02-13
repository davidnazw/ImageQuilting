function ssd_map = ssd_patch_weighted(sample, sample_corr, texture_template, target_template, overlap, top_mask, left_mask, cof)
    ssd_map = zeros(size(sample, 1) - size(texture_template, 1) + 1, size(sample, 2) - size(texture_template, 2) + 1);
    for i =  1 : size(ssd_map, 1)
        for j = 1 : size(ssd_map, 2)
            patch = sample(i : i + size(texture_template, 1) - 1, j : j + size(texture_template, 2) - 1, : );
            patch_corr = sample_corr(i : i + size(target_template, 1) - 1, j : j + size(target_template, 2) - 1, : );
            masked_patch = patch;
            if (top_mask == 1 && left_mask == 1)
                masked_patch(overlap + 1 : end, overlap + 1 : end, :) = 0;
            elseif (top_mask == 1 && left_mask == 0)
                masked_patch(overlap + 1 : end, :, :) = 0;
            elseif (top_mask == 0 && left_mask == 1)
                masked_patch(:, overlap + 1 : end, :) = 0;
            end
            dif1 = texture_template - masked_patch;
            ssd1 = sum(dif1(:).^2);
            dif2 = target_template - patch_corr;
            ssd2 = sum(dif2(:).^2);
            ssd_map(i, j) = cof * ssd1 + (1-cof) * ssd2;
        end
    end
end