module Rudash
    module GroupBy
        def group_by(collection, iteratee = self.method(:identity))

            reducer = -> (acc, current) {
                key = Rudash::DynamicArgsCount.call(iteratee, current)

                if acc[key]
                    acc[key] << current
                else
                    acc[key] = [current]
                end

                acc
            }

            self.reduce(collection, reducer, {})
        end
    end
end