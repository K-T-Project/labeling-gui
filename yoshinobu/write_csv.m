function write_csv(struct)
    %--------------------------------------------
    %  struct : �t�@�C�����A�t�H���_���A�]���A�R�����g��
    %           �܂܂��
    %
    %     out_name : �o�̓t�@�C����
    % out_file_type: �o�͂̃t�@�C���`��
    %--------------------------------------------
    out_file_type = '.csv';
    folder_name = "output";
    out_name = strcat(folder_name, '_evaluation', out_file_type);
    dlmwrite(out_name, struct, '-append'); 
end