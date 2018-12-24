function write_csv(data)
    %--------------------------------------------
    %    data : �N���X�\��
    %  folder : �t�H���_��
    %    name : �t�@�C����
    %    eval : �]��
    % comment : �R�����g
    %
    %     out_name : �o�̓t�@�C����
    % out_file_type: �o�͂̃t�@�C���`��
    %--------------------------------------------
    out_file_type = '.csv';
    init_out_name = strcat('output_evaluation', out_file_type);
    [out_name,path] = uiputfile('*.csv', 'File Selection', init_out_name);
    num = size(data,2);
    if path
        fileID = fopen(out_name,'w');
        fprintf(fileID,"�t�H���_��,�t�@�C����,�]��,�R�����g\n");
        for i=1:num
            fprintf(fileID,"%s,%s,%s,%s\n",data(1,i).folder, data(1,i).name, data(1,i).eval, data(1,i).comment);
        end
        fclose(fileID); 
    end
    
end