module UseCases
  class Base
    def self.repositories(*args)
      args.each do |repo_name|
        send(:define_method, "#{repo_name}_repository") do
          "#{repo_name}_repository".classify.constantize.new
        end
      end
    end
  end
end
