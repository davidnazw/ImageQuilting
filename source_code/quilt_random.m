function image = quilt_random(sample, outsize, patchsize)
    outsize_temp = ceil(outsize / patchsize) * patchsize;
    image = zeros(outsize_temp, outsize_temp * patchsize, 3);
    for i = 1 : ceil(outsize / patchsize)
        for j = 1 : ceil(outsize / patchsize)
            x = max(randi(size(sample, 2) - patchsize), 1);
            y = max(randi(size(sample, 1) - patchsize), 1);
            patch = sample(y + 1 : y + patchsize, x + 1 : x + patchsize , :);
            image((i-1) * patchsize + 1 : i * patchsize, (j-1) * patchsize + 1 : j * patchsize, :) = patch;
        end
    end
    image = image(1 : outsize , 1: outsize, :);
end