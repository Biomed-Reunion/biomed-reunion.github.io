function RemappedMonoColorImage = RGB2Mono(InputRGBImage, MappingDarkestRGBColor)
    MappingDarkestRGBColor = double(MappingDarkestRGBColor);
    GrayScaleImage = rgb2gray(InputRGBImage);
    Min = double(min(GrayScaleImage(:)));
    Max = double(max(GrayScaleImage(:)));
    
    RemappedMonoColorImage = uint8(zeros(height(GrayScaleImage), width(GrayScaleImage), 3));
    for i = 1 : 3
        RemappedMonoColorImage(:, :, i) =  uint8( ...
            (255 - MappingDarkestRGBColor(i)) / (Max - Min) * ...
            double(GrayScaleImage) ...
            + (MappingDarkestRGBColor(i) * Max - 255 * Min) / (Max - Min) ...
            );
    end
end
