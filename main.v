import rand

type base_types = int | f32 | string | bool

fn main () {
}

fn make_data (work_type base_types) []base_types {
    //returns a set of 1000 data to test
    match work_type with {
        int {
            mut data = [-1, 0, 1]
            for i in 0..997 {
                data << rand.int()
            }
            // possible repeats ? doesn't matter because of other args

        }

        f32 {
            mut data = [-1., 0., 1.]
            for i in 0..997 {
                data << rand.f32()
            }
            // possible repeats ? doesn't matter because of other args
        }

        string {
            mut data = [""]
            for i in 0..999 {
                data << rand.string(rand.int_in_range(1, 50))
            }
            // possible repeats ? doesn't matter because of other args
            // lack of space or special characters
            // max length of 50
        }

        bool {
            mut data = [false, true]
            for i in 0 998 {
                data << rand.int() % 2 == 1
            }
            // possible repeats ? doesn't matter because of other args
            //
        }
    }
    assert(data.len == 1000)
    return data
}

fn test_fun (to_test fn ([]base_types) []base_types, args []base_types, prec fn ([]base_types) []base_types, postc fn ([]base_types) []base_types) {
    return []base_types{}
}
