function write_csv(struct)
    %--------------------------------------------
    %  struct : �t�@�C�����A�t�H���_���A�]���A�R�����g��
    %           �܂ލ\����
    %    file_name : �t�@�C����
    %         eval : �]��
    %       coment : �R�����g
    %
    %     out_name : �o�̓t�@�C����
    % out_file_type: �o�͂̃t�@�C���`��
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