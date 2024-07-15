# Convolutional Image Processing on RISC-V Using Branch Prediction

## Methodology ##

**RISCV Processor**

RISC-V is an open standard instruction set architecture (ISA) based on the principles of reduced instruction set computing (RISC). It is designed to be simple, efficient, and extensible, allowing for customization and scalability across various applications, from embedded systems to high-performance computing. This flexibility and openness make RISC-V an attractive option for developing energy-efficient processors tailored to specific needs without being tied to a single company's technology. The challenges faced by RISC-V processors in efficiently executing conditional branches have led to the adoption of branch predictors. These predictors aim to predict branch direction and addresses based on previous outcomes. 
A 32-bit RISC-V based processor was developed and implemented in Verilog HDL to assess the performance of specialized hardware. This processor features a five-stage pipelined architecture with BP, hazard detection, stalling, and forwarding capabilities, all enhancing its performance and efficiency. It supports the standard RV32I instruction set, encompassing the six core instruction formats (R/I/S/U/B/J).



**Design of RISCV with Branch Predictor**

After gaining an understanding of the RISC-V processor, its architecture, and various BP techniques such as static, dynamic and tournament prediction, a RISC-V processor equipped with a two-bit saturating counter predictor demonstrated potential for improved efficiency in terms of both speed and accuracy. Each branch is associated with a two-bit counter. For our 2-level predictor, the BHT is 2 bits wide. It keeps a record of the previous few branches in a program. There are two levels to this BP.
* First-level (pattern history table): Shift registers record the last p branch outcomes (1 = taken, 0 = not taken), and the recorded pattern indexes into the BHT to select a 2-bit predictor for the prediction.
    
* Second-level (saturating counters): The BHT functions as a saturating counter, incrementing when the branch is taken and decrementing when it is not, without wrapping around. The counter ranges from 0 to 3, where 2 or 3 indicates a taken prediction, and 0 or 1 indicates a not-taken prediction.

The output for the final prediction is the next address for the branch. The output comes from a multiplexer. The selector for this multiplexer is determined by the output of the AND gate. The selection logic used here works as follows: if the BP is 'taken' (1) and the target branch address is found (1), the selector is set to '1', indicating that the final prediction is given. Otherwise, it moves to the next address (PC+1).
![b1](https://github.com/user-attachments/assets/71780201-c89b-4fbc-9520-628a477125bf)

![b2](https://github.com/user-attachments/assets/a8ce7b92-4187-4bdf-b830-0627988f8a8d)

**Coupling the Branch Predictor to the Processor**

This section discusses the modifications made to the processor to integrate the branch predictor. The control unit has been modified to accommodate the new instructions BEQ, BLT, and JAL. To determine which type of branch instruction to execute, the control signals zero and less are used. The zero control signal is generated if the two registers have equal values, while less is generated when the first register has a value less than the second register. Since the funct3 values of the branch signals differ, the variations in the bit values, along with the control signals zero and less, are used to distinguish between the branch instructions. Three additional modules have been created: a branch detector, a branch table, and a branch address generator. The branch detector module calculates the entry or new state for the branch table based on the current state and the type of branching. The branch table module updates the BHT with the new state whenever the branch control signal is set to 1. The Branch table has 2-bit values, which are initially set to 0. The branch address generator calculates the branching and jump addresses based on the opcode. It also assigns the values of the control signals branch and jump.

**Implementation of Convolution**

To verify the efficiency of the branch predictor, a convolution operation was implemented, which involves several loops and branches. Convolution in image processing is the process of applying a kernel (or filter) to an image to extract features such as edges by combining pixel values in a specified neighbourhood. The algorithm iterates over the total number of rows and columns of the input image. The output is then stored and printed. The inner loop iterates over the number of rows and columns of the kernel, multiplying the weights with the input cells and adding the results. Algorithm 1 illustrating the convolution process for IF. The Algorithm highlights the involvement of loops in the process.
After understanding the algorithm, the next step was to create a convolution code in Assembly Level Language. A test input and kernel matrix were used to verify the algorithm 1. Using the RARS RISC-V compiler, the convolution code was implemented, and the desired output was obtained. The instructions written in Assembly Level Language were translated to Machine Level Language to make it compatible with the RISC-V processor.

![Matrix](https://github.com/user-attachments/assets/20e10257-9305-4fe9-a066-2158c946e7e2)

## Experimental Results

**Experimental Setup**

The experimental setup involved four phases. In the first phase, a 5-stage pipelined, 32-bit RISC-V processor was designed to serve as a benchmark. This processor could run the RV32I base integer instruction set and includes a hazard detection and forwarding unit to handle data hazards. The second phase focused on designing a branch predictor and integrating it with the processor. Control Hazards are handled by using a branch predictor. In this case, a 2-bit saturating counter predictor is used. A BHT stores whether the condition of this branch was taken or not taken at the last time it was executed.To determine the speed-up provided by the branch predictor, certain applications that required efficient BP were identified. Convolution for image processing was selected, as rapid BP was needed to improve performance. Thus, the third phase involved developing a convolution algorithm comprising multiple loops. This algorithm was coded in RISC-V assembly language, simulated, and verified using the RARS tool (RISC-V Assembler and Runtime Simulator). The assembly code was then converted to machine code and stored in the instruction memory of the processor. The final phase involved simulating the convolution code on the Xilinx Vivado 2023.2 simulator. The code was executed on both the benchmark processor and the processor with the branch predictor, and their performances were compared. For functional verification of the hardware, an input matrix with non-zero elements was selected, and the output waveform was observed.

![b4](https://github.com/user-attachments/assets/366ec200-968e-426c-90ce-d94bdea9ef6b)

**Results and Discussion**

The RISC-V assembly code is assembled and verified using the RARS simulator. A test input and kernel function are used to validate the convolution algorithm, where the 'x' operator represents the convolution operation.
The results are shown in the data segment section. The text segment in the figure contains the written assembly code, with each assembly instruction's corresponding instruction code also displayed. The data segment represents the data memory where the input values of image pixels or test inputs are stored. After the convolution process, the updated pixel values or test inputs are stored. The status of various registers used in the program is also visible next to the text segment. Running the convolution code on the benchmark 5-stage RISC-V processor takes a total of 830x clock cycles to complete, with a CPI (Cycles Per Instruction) of 2.4x. However, when running the convolution code using the 2-bit BP, it completes in 404x clock cycles, with a CPI of 1.2x. Therefore, as expected, the processor with the branch predictor runs the convolution code faster, using fewer clock cycles and achieving a better CPI. The algorithm was also implemented on the processor with a 2-bit branch predictor. The simulation results include clock cycles, PC values, the instruction codes stored in the instruction memory obtained from the RARS tool, and the nine output cells of the matrix stored in the memory locations. In order to compare these results with those obtained from the RARS tool, the identical input values were stored in the data memory of the RISC-V architecture.The simulation results show that after executing the instruction codes, the memory values are updated and match exactly with the results from the RARS tool, verifying the functionality of the implemented RISC-V core. After completing the behavioral simulations, the developed architecture was synthesized and implemented on the Kintex-7 KC705 Evaluation Platform (xc7k325tffq900-2). Resource utilization and power consumption were measured and reported. When compared to existing RISC-V processor designs, our implementation showed marked improvements in both the speed and efficiency of convolution operations.

![Behavioural_Simulation_Convolution](https://github.com/user-attachments/assets/6ecc3609-31c9-48ff-9a70-fb0f3097c003)

![Resource util](https://github.com/user-attachments/assets/a064c226-8404-4494-9e12-0a88dfc4c646)
