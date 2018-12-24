function write_csv(data)
    %--------------------------------------------
    %    data : クラス構造
    %  folder : フォルダ名
    %    name : ファイル名
    %    eval : 評価
    % comment : コメント
    %
    %     out_name : 出力ファイル名
    % out_file_type: 出力のファイル形式
    %--------------------------------------------
    out_file_type = '.csv';
    init_out_name = strcat('output_evaluation', out_file_type);
    [out_name,path] = uiputfile('*.csv', 'File Selection', init_out_name);
    num = size(data,2);
    if path
        fileID = fopen(out_name,'w');
        fprintf(fileID,"フォルダ名,ファイル名,評価,コメント\n");
        for i=1:num
            fprintf(fileID,"%s,%s,%s,%s\n",data(1,i).folder, data(1,i).name, data(1,i).eval, data(1,i).comment);
        end
        fclose(fileID); 
    end
    
end