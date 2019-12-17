% test5, assignment2, 2018.

close all;
clear;

I = [   0.141886338627215   0.959492426392903   0.933993247757551   0.392227019534168;
        0.421761282626275   0.655740699156587   0.678735154857773   0.655477890177557;
        0.915735525189067   0.035711678574190   0.757740130578333   0.171186687811562;
        0.792207329559554   0.849129305868777   0.743132468124916   0.706046088019609];

I_N = [ 0                   0                   0                   0;
        -0.279874943999060   0.303751727236316   0.255258092899777  -0.263250870643388;
        -0.493974242562792   0.620029020582397  -0.079004975720560   0.484291202365995;
        0.123528195629513  -0.813417627294588   0.014607662453417  -0.534859400208047];

I_S = [ 0.279874943999060  -0.303751727236316  -0.255258092899777   0.263250870643388;
        0.493974242562792  -0.620029020582397   0.079004975720560  -0.484291202365995;
        -0.123528195629513   0.813417627294588  -0.014607662453417   0.534859400208047;
                   0                   0                   0                   0];

I_E = [ 0.817606087765688  -0.025499178635352  -0.541766228223382                   0;
        0.233979416530312   0.022994455701187  -0.023257264680217                   0;
        -0.880023846614878   0.722028452004144  -0.586553442766772                   0;
        0.056921976309223  -0.105996837743861  -0.037086380105307                   0];

I_W = [ 0  -0.817606087765688   0.025499178635352   0.541766228223382;
        0  -0.233979416530312  -0.022994455701187   0.023257264680217;
        0   0.880023846614878  -0.722028452004144   0.586553442766772;
        0  -0.056921976309223   0.105996837743861   0.037086380105307];




[nabla_N, nabla_S, nabla_E, nabla_W] = create_nearest_neighbor_difference_arrays(I);

d1 = sum(abs(I_N(:)-nabla_N(:)));
d2 = sum(abs(I_S(:)-nabla_S(:)));
d3 = sum(abs(I_E(:)-nabla_E(:)));
d4 = sum(abs(I_W(:)-nabla_W(:)));

if d1>10^-3 || d2>10^-3 || d3>10^-3 || d4>10^-3
    error('Error when calculating nearest neighbor difference array, in each case the error level should be less than 0.001, but you got %e, %e, %e and %e.\n', ...
        d1, d2, d3, d4);
else
    fprintf('Calculating nearest neighbor difference array seems OK (errors: %e, %e, %e, %e).\n', d1, d2, d3, d4);
end




