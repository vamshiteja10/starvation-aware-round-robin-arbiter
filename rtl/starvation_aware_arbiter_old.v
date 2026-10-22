module starvation_aware_arbiter #(
    parameter N = 4,
    parameter AGE_WIDTH = 4,
    parameter AGE_THRESHOLD = 8
)(
    input  wire         clk,
    input  wire         rst,
    input  wire [N-1:0] req,
    output reg  [N-1:0] grant
);

    reg [1:0] rr_ptr;
    reg [AGE_WIDTH-1:0] age [0:N-1];

    integer k;
    integer idx;
    integer chosen;
    integer seq_i;
    reg found;

    // Aged requests have priority; ties follow round-robin order.
    always @(*) begin
        grant  = {N{1'b0}};
        chosen = -1;
        found  = 1'b0;
        idx    = 0;

        for (k = 0; k < N; k = k + 1) begin
            idx = (rr_ptr + k) % N;
            if (!found && req[idx] &&
                age[idx] >= AGE_THRESHOLD) begin
                chosen = idx;
                found  = 1'b1;
            end
        end

        if (!found) begin
            for (k = 0; k < N; k = k + 1) begin
                idx = (rr_ptr + k) % N;
                if (!found && req[idx]) begin
                    chosen = idx;
                    found  = 1'b1;
                end
            end
        end

        if (chosen >= 0)
            grant[chosen] = 1'b1;
    end

    always @(posedge clk) begin
        if (rst) begin
            rr_ptr <= 0;
            for (seq_i = 0; seq_i < N; seq_i = seq_i + 1)
                age[seq_i] <= 0;
        end else begin
            for (seq_i = 0; seq_i < N; seq_i = seq_i + 1) begin
                if (!req[seq_i] || grant[seq_i])
                    age[seq_i] <= 0;
                else if (age[seq_i] < AGE_THRESHOLD)
                    age[seq_i] <= age[seq_i] + 1'b1;
            end

            if (chosen >= 0)
                rr_ptr <= (chosen + 1) % N;
        end
    end

endmodule
