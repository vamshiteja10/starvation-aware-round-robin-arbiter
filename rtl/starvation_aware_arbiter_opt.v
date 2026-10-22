module starvation_aware_arbiter #(
    parameter N = 4,
    parameter AGE_WIDTH = 4,
    parameter AGE_THRESHOLD = 3
)(
    input  wire         clk,
    input  wire         rst,
    input  wire         ready,
    input  wire [N-1:0] req,
    output reg  [N-1:0] grant
);

    reg [1:0] rr_ptr;
    reg [AGE_WIDTH-1:0] age [0:N-1];

    reg [N-1:0] aged_req;
    reg [N-1:0] aged_selected;
    reg [N-1:0] rr_selected;

    integer i;

    // Parallel Boolean equations for a 4-requester
    // round-robin priority selector.
    function [N-1:0] rr_select;
        input [N-1:0] mask;
        input [1:0] ptr;
        begin
            rr_select = {N{1'b0}};

            rr_select[0] = mask[0] &
                (((ptr == 2'd0)) |
                 ((ptr == 2'd1) & ~mask[1] & ~mask[2] & ~mask[3]) |
                 ((ptr == 2'd2) & ~mask[2] & ~mask[3]) |
                 ((ptr == 2'd3) & ~mask[3]));

            rr_select[1] = mask[1] &
                (((ptr == 2'd0) & ~mask[0]) |
                 ((ptr == 2'd1)) |
                 ((ptr == 2'd2) & ~mask[2] & ~mask[3] & ~mask[0]) |
                 ((ptr == 2'd3) & ~mask[3] & ~mask[0]));

            rr_select[2] = mask[2] &
                (((ptr == 2'd0) & ~mask[0] & ~mask[1]) |
                 ((ptr == 2'd1) & ~mask[1]) |
                 ((ptr == 2'd2)) |
                 ((ptr == 2'd3) & ~mask[3] & ~mask[0] & ~mask[1]));

            rr_select[3] = mask[3] &
                (((ptr == 2'd0) & ~mask[0] & ~mask[1] & ~mask[2]) |
                 ((ptr == 2'd1) & ~mask[1] & ~mask[2]) |
                 ((ptr == 2'd2) & ~mask[2]) |
                 ((ptr == 2'd3)));
        end
    endfunction

    // Detect requests whose age has reached the threshold.
    always @(*) begin
        for (i = 0; i < N; i = i + 1)
            aged_req[i] = req[i] &&
                          (age[i] >= AGE_THRESHOLD);
    end

    // Prefer aged requests; otherwise use ordinary round-robin.
    always @(*) begin
        aged_selected = rr_select(aged_req, rr_ptr);
        rr_selected   = rr_select(req, rr_ptr);

        if (ready) begin
            if (|aged_req)
                grant = aged_selected;
            else
                grant = rr_selected;
        end else begin
            grant = {N{1'b0}};
        end
    end

    // Age tracking and round-robin pointer update.
    always @(posedge clk) begin
        if (rst) begin
            rr_ptr <= 2'd0;
            for (i = 0; i < N; i = i + 1)
                age[i] <= {AGE_WIDTH{1'b0}};
        end else begin
            for (i = 0; i < N; i = i + 1) begin
                if (!req[i] || (ready && grant[i]))
                    age[i] <= {AGE_WIDTH{1'b0}};
                else if (!grant[i] &&
                         age[i] < AGE_THRESHOLD)
                    age[i] <= age[i] + 1'b1;
            end

            case (grant)
                4'b0001: rr_ptr <= 2'd1;
                4'b0010: rr_ptr <= 2'd2;
                4'b0100: rr_ptr <= 2'd3;
                4'b1000: rr_ptr <= 2'd0;
                default: rr_ptr <= rr_ptr;
            endcase
        end
    end

endmodule
