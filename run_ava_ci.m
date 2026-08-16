repoRoot = fileparts(mfilename('fullpath'));

avaRoot = fullfile(repoRoot, 'vendor', 'ava');
inputCsv = fullfile(repoRoot, 'fixtures', 'input.csv');

assert(isfolder(avaRoot), ...
    'AVA source directory was not found: %s', avaRoot);
assert(isfile(inputCsv), ...
    'Input fixture was not found: %s', inputCsv);

addpath(fullfile(repoRoot, 'matlab'));
addpath(genpath(avaRoot));

set(groot, 'defaultFigureVisible', 'off');

previousFolder = cd(repoRoot);
restoreFolder = onCleanup(@() cd(previousFolder));

ava_ci_entry( ...
    'fixtures/input.csv', ...
    'results/ava_native.csv', ...
    'results/ava_native.mat' ...
);