function [d_e_mfcc, d_e_fbe, dstl] = compare_using_eucleadian(dire)
wav_folder = {dire};

for i = 1:length(wav_folder)
    aa = dir(fullfile(wav_folder{i}, '*.wav'));
end

for row= 1:length(aa)
         acq_fn_1 = fullfile(wav_folder{i}, aa(row).name);
        [signal_1, fs_1] = audioread(acq_fn_1);
   for column = 1:length(aa)
        acq_fn_2 = fullfile(wav_folder{i}, aa(column).name);
        [signal_2, fs_2] = audioread(acq_fn_2);
        [dist, ix, iy] = dtw(signal_1,signal_2);
        dstl(row,column) = dist;
        s1 = signal_1(ix);
          s1(isnan(s1)) = 0;
       [mfcc1, FBE1, frames1] = mfcc_modified_no_image(s1, fs_1, 25, 10, 0.97, 20, 12, 22, 300, 1700);
        s2 = signal_2(iy);
          s2(isnan(s2)) = 0;
           mfcc1(isnan(mfcc1)) = 0;
            
       [mfcc2, FBE2, frames2] = mfcc_modified_no_image(s2, fs_2, 25, 10, 0.97, 20, 12, 22, 300, 1700);
       mfcc2(isnan(mfcc2)) = 0;
       if isempty(mfcc2)
       d_e_mfcc(row,column) = 0;
        d_e_fbe(row,column) = 0;
       else
        d_e_mfcc(row,column) = sqrt(sum((mfcc1(:)-mfcc2(:)).^2));
        d_e_fbe(row,column) = sqrt(sum((FBE1(:)-FBE2(:)).^2));
       end
   end 
end