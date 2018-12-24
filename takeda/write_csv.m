function write_csv(struct)
    %--------------------------------------------
    %  struct : ファイル名、フォルダ名、評価、コメントを
    %           含む構造体
    %    file_name : ファイル名
    %         eval : 評価
    %       coment : コメント
    %
    %     out_name : 出力ファイル名
    % out_file_type: 出力のファイル形式
    %--------------------------------------------
    out_file_type = '.csv';
    out_name = strcat( 'output_evaluation', out_file_type);
    folder_name = struct.folder;
    file_name = struct.name;
    %eval;
    %coment;
    result = sprintf("%s,%s",folder_name, file_name);
    dlmwrite(out_name, result, '-append'); 
end