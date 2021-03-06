%% -*- mode: erlang; -*-
[
 { {{ name }}, []},
  %% logger config
  {kernel, [

    % logger formatters
    {logger, [
      {handler, default, logger_std_h,
        #{level => info,
          formatter => {logger_formatter, #{single_line => false, max_size => 2048}},
          config => #{type => standard_io}}}
    ]},

    % main level
    {logger_level, info}
  ]},


  {riak_core, [
    %% riak directories
    {ring_state_dir, "data/dev1/data_riak_core"},
    {platform_data_dir, "data/dev1/data_riak_core"},

    %% determines how many vnodes will be used
    %% also determines the number of files the log is sliced into
    %% has to be an exponent of 2
    %% low number will decrease file accesses (good for testing) and boot time
    %% high number enables scaling and generates smaller log files
    {ring_creation_size, 64},

    {handoff_port, 8199}
  ]}
].
