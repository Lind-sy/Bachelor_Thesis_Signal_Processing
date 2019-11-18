tree30 = vowel_clasification(16000, 5000, 1000, 300, 30 , 30, 'mfcc', 'tree');
%%
tree10 = vowel_clasification(16000, 5000, 1000, 300, 10 , 10, 'mfcc', 'tree');
%%
tree20 = vowel_clasification(16000, 5000, 1000, 300, 20 , 20, 'mfcc', 'tree');
tree50 = vowel_clasification(16000, 5000, 1000, 300, 50 , 50, 'mfcc', 'tree');
%%

tree30_2 = vowel_clasification(16000, 5000, 1000, 300, 30 , 30, 'lpcc', 'tree');
tree10_2 = vowel_clasification(16000, 5000, 1000, 300, 10 , 10, 'lpcc', 'tree');
tree20_2 = vowel_clasification(16000, 5000, 1000, 300, 20 , 20, 'lpcc', 'tree');
%%
tree50_2 = vowel_clasification(16000, 5000, 1000, 300, 50 , 50, 'lpcc', 'tree');
%%
tree30 = vowel_clasification(16000, 5000, 1000, 300, 30 , 30, 'mfcc', 'knn');
tree10 = vowel_clasification(16000, 5000, 1000, 300, 10 , 10, 'mfcc', 'knn');
tree20 = vowel_clasification(16000, 5000, 1000, 300, 20 , 20, 'mfcc', 'knn');
tree50 = vowel_clasification(16000, 5000, 1000, 300, 50 , 50, 'mfcc', 'knn');
%%

tree30_2 = vowel_clasification(16000, 5000, 1000, 300, 30 , 30, 'lpcc', 'knn');
tree10_2 = vowel_clasification(16000, 5000, 1000, 300, 10 , 10, 'lpcc', 'knn');
tree20_2 = vowel_clasification(16000, 5000, 1000, 300, 20 , 20, 'lpcc', 'knn');
tree50_2 = vowel_clasification(16000, 5000, 1000, 300, 50 , 50, 'lpcc', 'knn');
%%
tree30 = vowel_clasification(16000, 5000, 1000, 300, 30 , 30, 'mfcc', 'svm');
tree10 = vowel_clasification(16000, 5000, 1000, 300, 10 , 10, 'mfcc', 'svm');
tree20 = vowel_clasification(16000, 5000, 1000, 300, 20 , 20, 'mfcc', 'svm');
tree50 = vowel_clasification(16000, 5000, 1000, 300, 50 , 50, 'mfcc', 'svm');
%%

tree30_2 = vowel_clasification(16000, 5000, 1000, 300, 30 , 30, 'lpcc', 'svm');
tree10_2 = vowel_clasification(16000, 5000, 1000, 300, 10 , 10, 'lpcc', 'svm');
tree20_2 = vowel_clasification(16000, 5000, 1000, 300, 20 , 20, 'lpcc', 'svm');
tree50_2 = vowel_clasification(16000, 5000, 1000, 300, 50 , 50, 'lpcc', 'svm');
