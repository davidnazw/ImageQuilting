function image = quilt_cut(sample, outsize, patchsize, overlap)
    outsize_temp = outsize + patchsize;
    image = zeros(outsize_temp, outsize_temp, 3);
    n = ceil((outsize - overlap) / (patchsize - overlap));
    for i = 1 : n
        for j = 1 : n
            row = (patchsize - overlap) * (i-1) + 1;
            col = (patchsize - overlap) * (j-1) + 1;
            template = image(row : row + patchsize - 1, col : col + patchsize - 1, :);
            if(i == 1)
                top_mask = 0;
            else
                top_mask = 1;
            end
            if(j == 1)
                left_mask = 0;
            else
                left_mask = 1;
            end
            ssd_map = ssd_patch(sample, template, overlap, top_mask, left_mask);
            patch = choose_sample(ssd_map, sample, size(template, 1), 4);
            if(i ~= 1)
                template_top = template(1:overlap, :, :);
                patch_top = patch(1:overlap, :, :);
                top_err = rgb2gray((template_top - patch_top).^2);
                [top_mask, ~] = cut(top_err);
                template_top = template_top - template_top.*top_mask;
                patch_top = patch_top.*top_mask;
                overlap_top = template_top + patch_top;
                patch(1:overlap, :, :) = overlap_top;
            end
            if (j ~= 1)
                template_shifted = image(row : row + patchsize - 1, col - patchsize + overlap: col - 1+ overlap, :);
                template_left = template(:, 1:overlap, :);
                patch_left = patch(:, 1:overlap, :);
                left_err = rgb2gray((template_left - patch_left).^2);
                [left_mask, bestpath] = cut(transpose(left_err));
                left_mask = transpose(left_mask);
                template_left = template_left - template_left.*left_mask;
                patch_left = patch_left.*left_mask;
                overlap_left = template_left + patch_left;
                patch_backup = patch;
                patch(:,1:overlap,:) = overlap_left;
%                 figure; imshow(cat(2, template_shifted, patch));
%                 figure; imshow(cat(2, template_shifted, patch_backup));
            end
            image(row : row + patchsize - 1, col : col + patchsize - 1, :) = patch;
        end 
    end
    image = image(1 : outsize , 1: outsize, :);
end
