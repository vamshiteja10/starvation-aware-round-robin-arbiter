module starvation_aware_arbiter_shared_select_opt #(
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
    reg [N-1:0] selected_req;
    reg [N-1:0] selected_grant;

    integer i;

    // Select the first asserted request in round-robin order.
    // This implementation is intended for the 4-requester design.
    function [N-1:0] rr_select;
        input [N-1:0] mask;
        input [1:0] ptr;
        begin
            rr_select = {N{1'b0}};

            case (ptr)
                2'd0: begin
                    if      (mask[0]) rr_select = 4'b0001;
                    else if (mask[1]) rr_select = 4'b0010;
                    else if (mask[2]) rr_select = 4'b0100;
                    else if (mask[3]) rr_select = 4'b1000;
                end

                2'd1: begin
                    if      (mask[1]) rr_select = 4'b0010;
                    else if (mask[2]) rr_select = 4'b0100;
                    else if (mask[3]) rr_select = 4'b1000;
                    else if (mask[0]) rr_select = 4'b0001;
                end

                2'd2: begin
                    if      (mask[2]) rr_select = 4'b0100;
                    else if (mask[3]) rr_select = 4'b1000;
                    else if (mask[0]) rr_select = 4'b0001;
                    else if (mask[1]) rr_select = 4'b0010;
                end

                2'd3: begin
                    if      (mask[3]) rr_select = 4'b1000;
                    else if (mask[0]) rr_select = 4'b0001;
                    else if (mask[1]) rr_select = 4'b0010;
                    else if (mask[2]) rr_select = 4'b0100;
                end

                default: rr_select = {N{1'b0}};
            endcase
        end
    endfunction

    // Identify requests that have reached the age threshold.
    always @(*) begin
        for (i = 0; i < N; i = i + 1)
            aged_req[i] = req[i] &&
                          (age[i] >= AGE_THRESHOLD);
    end

    // Choose the request mask before round-robin selection.
    // This shares one priority-selection network.
    always @(*) begin
        if (|aged_req)
            selected_req = aged_req;
        else
            selected_req = req;

        selected_grant = rr_select(selected_req, rr_ptr);
        grant = ready ? selected_grant : {N{1'b0}};
    end

    // Update ages and advance the round-robin pointer after a grant.
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

            // Boolean next-state equations for one-hot-or-zero grants.
            rr_ptr[1] <= grant[1] | grant[2] |
                         (rr_ptr[1] & ~(|grant));
            rr_ptr[0] <= grant[0] | grant[2] |
                         (rr_ptr[0] & ~(|grant));
        end
    end

endmodule
