function image = quilt_simple(sample, outsize, patchsize, overlap)
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
            patch = choose_sample(ssd_map, sample, size(template, 1), 7);
            image(row : row + patchsize - 1, col : col + patchsize - 1, :) = patch;
        end 
    end
    image = image(1 : outsize , 1: outsize, :);
end
