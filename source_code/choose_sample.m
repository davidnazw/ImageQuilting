function patch = choose_sample(ssd_map, sample, template_size, k)
	[~, idx] = mink(ssd_map(:), k);
    [rows, cols] = ind2sub(size(ssd_map), idx);
    randk = randi(k);
    row = rows(randk);
    col = cols(randk);
    patch = sample(row : row + template_size - 1, col : col + template_size - 1, :);
end