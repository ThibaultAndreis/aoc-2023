const input = @embedFile("../inputs/dayOne.txt");
const std = @import("std");

pub fn exercice_one() !void {
    var lines = std.mem.tokenize(u8, input, "\n");
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
