function ftd -d "Parse and display a list of todo.txt files"
    set -l options (fish_opt -s v -l verbose) (fish_opt -s h -l help)
    set options $options
    argparse $options -- $argv

    if test -n "$_flag_h"
      echo "USAGE"
      return 0
    end

    read -laz paths

    for p in $paths
        echo (dirname $p)

        # Iterate over lines and put in 3 buckets:
        # done
        # not done with prio
        # not done without prio
        # Sort the not done with prio bucket and then
        # just concat all 3 buckets together
        set -l done
        set -l not_done_with_prio
        set -l not_done_no_prio

        for l in (cat $p)
            if test (string match -r "^x\s+" $l)
                set -a done $l
            else if test (string match -r "\([A-Z]\)" $l)
                set -a not_done_with_prio $l
            else
                set -a not_done_no_prio $l
            end
        end

        for l in (string join \n $not_done_with_prio | sort)
            printf "\t[ ] %s\n" $l
        end

        for l in $not_done_no_prio
            printf "\t[ ] %s\n" $l
        end

        if test -n "$_flag_v"
          for l in $done
              printf "\t[x] %s\n" $l
          end
          printf "\t %u/%u" (count $done) (wc -l < $p)
          printf "\n"
        end

        printf "\n"
    end
end