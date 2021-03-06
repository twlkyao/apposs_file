module AppossFile
  module Worker
    module Git
      extend self
      
      def init_scripts refer_url
        [ "git clone #{refer_url} target" ]
      end

      def pre_scripts refer_url, download_folder
        [
          "rm -rf #{download_folder}/target.tgz",
          "cd target && git fetch origin && git reset --hard origin/master",
          "cd target && tar cz . --exclude=.git -f #{download_folder}/target.tgz",
        ]
      end
    end
  end
end
