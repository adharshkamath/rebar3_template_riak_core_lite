%% -*- mode: erlang; -*-
{deps, [{riak_core, {pkg, riak_core_lite}}, riak_core_lite_util]}.

{relx, [{release, { {{ name }} , "0.1.0"},
         [{{ name }}, sasl]},

        {dev_mode, true},
        {include_erts, false},
        {extended_start_script, true},

        {sys_config, "config/sys.config"},
        {vm_args, "config/vm.args"},

        {overlay, [
            {mkdir, "etc"},
            {mkdir, "bin"},
            {mkdir, "data/ring"},
            {mkdir, "log/sasl"}
        ]}
]}.

{profiles, [
    {prod, [{relx, [{dev_mode, false}, {include_erts, true}]}]},
    {dev1, [{relx, [
                {sys_config, "config/sys_dev1.config"},
                {vm_args, "config/vm_dev1.args"}
    ]}]},
    {dev2, [{relx, [
                {sys_config, "config/sys_dev2.config"},
                {vm_args, "config/vm_dev2.args"}
    ]}]},
    {dev3, [{relx, [
                {sys_config, "config/sys_dev3.config"},
                {vm_args, "config/vm_dev3.args"}
    ]}]}
]}.
