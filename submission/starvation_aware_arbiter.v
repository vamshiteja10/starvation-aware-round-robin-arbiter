
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

    integer k;
    integer idx;
    integer chosen;
    integer i;
    reg found;

    // Combinational arbitration:
    // Give priority to older requests.
    // Use round-robin order to break ties.
    always @(*) begin
        grant  = {N{1'b0}};
        chosen = -1;
        found  = 1'b0;
        idx    = 0;

        // First, search for an aged request.
        for (k = 0; k < N; k = k + 1) begin
            idx = (rr_ptr + k) % N;

            if (!found && req[idx] &&
                age[idx] >= AGE_THRESHOLD) begin
                chosen = idx;
                found  = 1'b1;
            end
        end

        // If no aged request exists, use round-robin priority.
        if (!found) begin
            for (k = 0; k < N; k = k + 1) begin
                idx = (rr_ptr + k) % N;

                if (!found && req[idx]) begin
                    chosen = idx;
                    found  = 1'b1;
                end
            end
        end

        // Generate a one-hot grant only when the resource is ready.
        if (ready && chosen >= 0) begin
            case (chosen)
                0: grant[0] = 1'b1;
                1: grant[1] = 1'b1;
                2: grant[2] = 1'b1;
                3: grant[3] = 1'b1;
                default: grant = {N{1'b0}};
            endcase
        end
    end

    // Sequential logic:
    // Track request waiting age and update round-robin pointer.
    always @(posedge clk) begin
        if (rst) begin
            rr_ptr <= 0;

            for (i = 0; i < N; i = i + 1)
                age[i] <= 0;
        end else begin
            for (i = 0; i < N; i = i + 1) begin
                if (!req[i] || (ready && grant[i]))
                    age[i] <= 0;
                else if (!grant[i] &&
                         age[i] < AGE_THRESHOLD)
                    age[i] <= age[i] + 1'b1;
            end

            if (ready && chosen >= 0)
                rr_ptr <= (chosen + 1) % N;
        end
    end

endmodule
