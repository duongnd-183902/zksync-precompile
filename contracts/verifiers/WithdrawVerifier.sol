// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16VerifierWithdraw {
    // Scalar field size
    uint256 constant r = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax = 54182204790525009438464647573147660102195211568162599434885676310869962459;
    uint256 constant alphay = 18687281544146804699591233692185573440081687173892192993917529254211435440142;
    uint256 constant betax1 = 13209358449234936320930973924286573106815339907300165480456569415891356985009;
    uint256 constant betax2 = 20112466939578945047639181201970036260307559154701934730597329686789875686080;
    uint256 constant betay1 = 10540419430504920846025797304077357824753022991547284929727552935806759885511;
    uint256 constant betay2 = 20550748365419127051192377333043850772724126921006890497762998835527708645775;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 19480630654724822497672994520122557988741039333056668902834204760411875889283;
    uint256 constant deltax2 = 8164652295792631330570791862581132245741225445598562877666150162846089627591;
    uint256 constant deltay1 = 15749786566686453210865626380371667617417704120813565134475264176556232987837;
    uint256 constant deltay2 = 13190807316058688081048217801504965449943096130358640254305218530221263827666;

    uint256 constant IC0x = 21633938825299596023639858359415334970702389918951749296470863729904085624473;
    uint256 constant IC0y = 20080009804771321728128975953083647938914069878994625839675950481620417573607;

    uint256 constant IC1x = 15105266206726599159040761935960619814210655117584990301154403905982387583429;
    uint256 constant IC1y = 2985818451537976852501181483496110666781988062451575172435953997295674026690;

    uint256 constant IC2x = 13080907068793184115571797568751265689718586013867161951472372117162361129814;
    uint256 constant IC2y = 5231336379902638172750730796876459621451297471346974515239003247901473312145;

    uint256 constant IC3x = 5129857576925317010387803250153410973790890725471089600518401398455104065024;
    uint256 constant IC3y = 16986653374484533118960430586311893805764400633887806713483530628850086126635;

    uint256 constant IC4x = 9588302985380509771603316483746555324143008333670423310362190942311076054957;
    uint256 constant IC4y = 21537369748219651794357613487940285362960035057093163488637857403797422950658;

    uint256 constant IC5x = 11452151707635466064570868963237629001896420345264289376576206172123919466397;
    uint256 constant IC5y = 6701261406990527027363709482444195106829744441173662266179066652486229889924;

    uint256 constant IC6x = 15287269769384063974950542393309131160783537597057164231840330742891835966909;
    uint256 constant IC6y = 4488426630654928444331771259382867891286281192749511104347794974403847805274;

    uint256 constant IC7x = 3654374904549655540474579394253742051028342110527830330294807295075690405433;
    uint256 constant IC7y = 1907349450325157239658338026558907509957213072759747815342725965901088921926;

    uint256 constant IC8x = 2925877141398435281630492935075259979824763365075053265037798368671166040978;
    uint256 constant IC8y = 5465631738443050913884093242352586353377778555331473431759829287844760797798;

    uint256 constant IC9x = 12405284093086812279456611454533546792138321207661677005090587041587615133378;
    uint256 constant IC9y = 5304318295311233251385865189015304740820546343060874304557289907795558847845;

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[9] calldata _pubSignals
    ) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x

                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))

                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))

                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))

                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))

                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))

                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))

                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))

                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))

                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))

                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)

                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F

            checkField(calldataload(add(_pubSignals, 0)))

            checkField(calldataload(add(_pubSignals, 32)))

            checkField(calldataload(add(_pubSignals, 64)))

            checkField(calldataload(add(_pubSignals, 96)))

            checkField(calldataload(add(_pubSignals, 128)))

            checkField(calldataload(add(_pubSignals, 160)))

            checkField(calldataload(add(_pubSignals, 192)))

            checkField(calldataload(add(_pubSignals, 224)))

            checkField(calldataload(add(_pubSignals, 256)))

            checkField(calldataload(add(_pubSignals, 288)))

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
            return(0, 0x20)
        }
    }
}
