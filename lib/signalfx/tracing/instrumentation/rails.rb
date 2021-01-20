module SignalFx
  module Tracing
    module Instrumenter
      module Rails

        Register.add_lib :Rails, self

        class << self

          def instrument(opts = {})
            return if @instrumented

            # check for required gems
            begin
              require 'active_support'
              require 'rails'
              require 'rails/instrumentation'
              puts e.message
            rescue LoadError
              return
            end


            exclude_events = opts.fetch(:exclude_events, [])
            tracer = opts.fetch(:tracer, OpenTracing.global_tracer)

            ::Rails::Instrumentation.instrument(tracer: tracer, exclude_events: exclude_events)

            @instrumented = true
          end
        end
      end
    end
  end
end
