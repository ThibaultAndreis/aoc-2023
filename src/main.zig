const std = @import("std");
const dayOne = @import("code/dayOne.zig");

pub fn main() !void {
    try dayOne.puzzle_one();
    try dayOne.puzzle_two();
}
