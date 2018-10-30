module SignalFx
    module Tracing
        module Instrumenter
            class Register

                @available_libs = {}
                @initialized = false

                def self.available_libs
                    return @available_libs
                end

                def self.initialized?
                    return @initialized
                end

                def self.include_patches
                    # all of the available patches must be added to the table here
                    @available_libs[:PatchingTest] = Patches::PatchingTest::ToPatch.new

                    @initialized = true
                end

                def self.add_lib(patch_key, patch_module)
                  @available_libs[patch_key] = patch_module
                end
            end
        end
    end
end

require 'signalfx/tracing/patches/patching-test'
require 'signalfx/tracing/patches/sinatra'
