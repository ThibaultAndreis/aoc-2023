const input = @embedFile("../inputs/dayOne.txt");
const std = @import("std");

pub fn puzzle_one() !void {
    var lines = std.mem.tokenizeScalar(u8, input, '\n');
    var sum: u128 = 0;

    while (lines.next()) |line| {
        var line_numbers = [2]u8{ 0, 0 };

        for (line) |char| {
            if (std.ascii.isDigit(char)) {
                if (line_numbers[0] == 0) {
                    line_numbers[0] = char;
                } else {
                    line_numbers[1] = char;
                }
            }
        }
        if (line_numbers[1] == 0) {
            line_numbers[1] = line_numbers[0];
        }
        std.debug.print("Line {s}\n", .{line_numbers});
        const line_value: u8 = try std.fmt.parseInt(u8, &line_numbers, 10);
        sum = sum + line_value;
        std.debug.print("Line as number {d}\n", .{line_value});
    }
    std.debug.print("Sum : {d}\n", .{sum});
}

const numbersSpelled = [_][]const u8{ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" };
pub fn puzzle_two() !void {
    var lines = std.mem.tokenizeScalar(u8, input, '\n');
    var sum: u128 = 0;
    while (lines.next()) |line| {
        var line_numbers = [2]u8{ 0, 0 };
        const lineLength = line.len;
        for (line, 0..) |char, i| {
            std.debug.print("value {d} ", .{char});
            if (std.ascii.isDigit(char)) {
                std.debug.print("is digit {d} \n", .{char});

                if (line_numbers[0] == 0) {
                    line_numbers = [2]u8{ char, char };
                } else {
                    line_numbers[1] = char;
                }
            } else if (std.ascii.isAlphabetic(char)) {
                std.debug.print("is alpha \n", .{});
                for (numbersSpelled, 1..) |number, val| {
                    const len = number.len;
                    if (len > (lineLength - i)) {
                        continue;
                    }
                    const check: []const u8 = line[i .. len + i];
                    if (std.mem.eql(u8, check, number)) {
                        var valCast: u8 = @intCast(val);
                        valCast += 48;
                        std.debug.print("Line {s} {d}\n", .{ check, valCast });
                        if (line_numbers[0] == 0) {
                            line_numbers = [2]u8{ valCast, valCast };
                        } else {
                            line_numbers[1] = valCast;
                        }
                    }
                }
            } else {
                std.debug.print("is nothing  {d}\n", .{char});
            }
        }
        std.debug.print("Line result {d} {d}\n", .{ line_numbers[0], line_numbers[1] });
        const line_value: u8 = try std.fmt.parseInt(u8, &line_numbers, 10);
        sum = sum + line_value;
        std.debug.print("Line as number {d}\n", .{line_value});
    }
    std.debug.print("Sum : {d}\n", .{sum});
}
