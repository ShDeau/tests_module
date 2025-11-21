import rand

type Base_Types = int | f64 | string | bool
enum Test_Outputs {
    crash
    correct
    uncorrect
    bad_arguments
}

fn main () {
    mut args1 := []Base_Types{}
    args1 << Base_Types(1)
    args1 << Base_Types(1.0)
    args1 << Base_Types(false)
    args1 << Base_Types("vrai")
    print_args(args1)

    test_fun(plus_un, args_plus_un, prec_plus_un, postc_plus_un)
}

fn make_data (work_type Base_Types) []Base_Types {
    //returns a set of 1000 data to test
    mut data := []Base_Types{}
    match work_type {
        int {
            data = [Base_Types(-1), Base_Types(0), Base_Types(1)]
            for _ in 0..997 {
                data << Base_Types(rand.int())
            }
            // possible repeats ? doesn't matter because of other args
        }

        f64 {
            data = [Base_Types(-1.0), Base_Types(0.0), Base_Types(1.0)]
            for _ in 0..997 {
                data << Base_Types(rand.f64())
            }
            // possible repeats ? doesn't matter because of other args
        }

        string {
            data = [Base_Types("")]
            for _ in 0..999 {
                data << Base_Types(rand.string(rand.int_in_range(1, 50) or {1}))
            }
            // possible repeats ? doesn't matter because of other args
            // lack of space or special characters
            // max length of 50
        }

        bool {
            data = [Base_Types(false), Base_Types(true)]
            for _ in 0..998 {
                data << Base_Types(rand.int() % 2 == 1)
            }
            // possible repeats ? doesn't matter because of other args
            //
        }
    }
    assert(data.len == 1000)
    return data
}

fn test_fun (to_test fn ([]Base_Types) []Base_Types, args []Base_Types, prec fn ([]Base_Types) bool, postc fn ([]Base_Types, []Base_Types) bool) {
    mut data_to_test := [][]Base_Types{}
    for i in args {
        data_to_test << make_data(i)
    }

    mut test_results := []Test_Outputs{}

    for i in 0..1000 {
        arg_i := []Base_Types{len: args.len, init: data_to_test[index][i]}
        print_args(arg_i)
        if prec(arg_i) {
            postc_verified := postc(arg_i, to_test(arg_i))
            if postc_verified {
                test_results << .correct
            } else {
                test_results << .uncorrect
            }
        } else {
            test_results << .bad_arguments
        }
    }
    println("\n${to_test} OK !")
    println("${test_results}")
}

fn print_args (args []Base_Types) {
    print("args : [")
    for i in args {
        match i {
            int {print("${i}, ")}
            f64 {print("${i}, ")}
            string {print("${i}, ")}
            bool {print("${i}, ")}
        }
    }
    println("]")
}

fn save_test (args [][]Base_Types, out []Test_Outputs) ! {
	mut file := os.open_file('test_ouput.txt', 'w')!
	for i in 0..out.len {
        to_write := ""
        arg_i := []Base_Types{len: args.len, init: data_to_test[index][i]}
        to_write = to_write +
	}
	unsafe { file.write_ptr(u32(app.map.len), int(sizeof(u32))) }
	unsafe { file.write_ptr(u32(app.map[0].len), int(sizeof(u32))) }
	for i in 0 .. app.map.len {
		unsafe { file.write_ptr(app.map[i].data, app.map[i].len * int(sizeof(Tiles))) }
	}
	for i in 0 .. app.map.len {
		unsafe { file.write_ptr(app.plant_map[i].data, app.map[i].len * int(sizeof(Plant))) }
	}
	for i in 0 .. app.map.len {
		unsafe { file.write_ptr(app.seed_map[i].data, app.map[i].len * int(sizeof(Seed))) }
	}
	unsafe { file.write_ptr(app.player, int(sizeof(Gardener))) }
	unsafe { file.write_ptr(app.infected_huge_tree.infected, int(sizeof(bool))) }
	file.close()
}















fn plus_un (x []Base_Types) []Base_Types {
    prems := x[0]
    if prems is int {
        return [Base_Types( prems + 1 )]
    }
    else {
        return []Base_Types{}
    }
}

fn prec_plus_un (x []Base_Types) bool {
    prems := x[0]
    return prems is int && prems >= 0
}

fn postc_plus_un (e []Base_Types, s []Base_Types) bool {
    prems_e := e[0]
    prems_s := s[0]
    return prems_e is int && prems_s is int && prems_s == prems_e + 1
}

const args_plus_un := [Base_Types(0)]
