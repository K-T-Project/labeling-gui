function write_csv(struct)
    %--------------------------------------------
    %  struct : ファイル名、フォルダ名、評価、コメントが
    %           含まれる
    %
    %     out_name : 出力ファイル名
    % out_file_type: 出力のファイル形式
    %--------------------------------------------
    out_file_type = '.csv';
    folder_name = "output";
    out_name = strcat(folder_name, '_evaluation', out_file_type);
    dlmwrite(out_name, struct, '-append'); 
end