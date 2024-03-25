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

contract Groth16VerifierSwap {
    // Scalar field size
    uint256 constant r = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax = 18473105225523318162538096439335862575277234882649897012956714290567815750438;
    uint256 constant alphay = 18415919143988980154444121902620439750299345087528763078908669726930273311693;
    uint256 constant betax1 = 14586223354496205538563206298269738110165906713365622991090290777510240567136;
    uint256 constant betax2 = 6829837727373616701557883306696313874981739284233148858027190936974096417394;
    uint256 constant betay1 = 20931685436222146977942978724004750787344981517587312222814158558877462189912;
    uint256 constant betay2 = 19300016641063009515694734809031855745178209238165444155708172032360208496786;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 19161679938464100726765640856522068659769240914081235043428867144986696202426;
    uint256 constant deltax2 = 9766159365249264449493152706020127697975780833003341644991430869621206320167;
    uint256 constant deltay1 = 3991341661015389134798508463418064883634023187435511490997428244864683965393;
    uint256 constant deltay2 = 2156790339396615489203434532257105027548622729681503162210046387477275287900;

    uint256 constant IC0x = 4273410902381862771791711052144283478212686634635469464283910609733999878355;
    uint256 constant IC0y = 11897817655738853148896479096763695605459513078551677784955262464218466940222;

    uint256 constant IC1x = 12937558626906204498162068389304066062102564019252169698770455188343988560850;
    uint256 constant IC1y = 5112619619747528774699777423803438946227926270117549867188909015708169813255;

    uint256 constant IC2x = 7037050923962849150603408512622099504775275299770029799304830769303164050306;
    uint256 constant IC2y = 2438557010186031402579879596818033702906402946692956783271477603434854771985;

    uint256 constant IC3x = 15816713884569734545458760268847697166887265702022061604185150265257313623027;
    uint256 constant IC3y = 19138512374069660884411193598256964389804078028704133925786634575728106414066;

    uint256 constant IC4x = 11427175411754000364106844621984680833609700323766982894569019633700117042169;
    uint256 constant IC4y = 3407614328449589114572343047814333739365064055612545274547487421431516771780;

    uint256 constant IC5x = 7903485367422835649077750029545186822643255711588652403794965622984219904719;
    uint256 constant IC5y = 7570247278943384875853047591881195808627311466946140344155668208541472578160;

    uint256 constant IC6x = 4650988593352091342851182353497887996034372875039289566256967635816151680252;
    uint256 constant IC6y = 5711070255425637381655530647489960681763188208974925075154945367332602356228;

    uint256 constant IC7x = 12285264397630414734010562175364533722270562134486535010088311395039256513863;
    uint256 constant IC7y = 2098528572850762012606272894800002648207247901433137722949246390933334247981;

    uint256 constant IC8x = 13105930172221895006005753014849115111933120759601478493117359336203531101228;
    uint256 constant IC8y = 599692282115865394153157049480890579332290843988264430008088427985874797965;

    uint256 constant IC9x = 15887482012359710054274344115474990540639988638352151339926167014677935274335;
    uint256 constant IC9y = 6246572452842778988962862882716854311865820871939571348382677392122446178166;

    uint256 constant IC10x = 11011559902892918105126590103446098012454465885858686015942030032664787616660;
    uint256 constant IC10y = 1173805850047376764857451973305942690825311220440548741275363238561480169819;

    uint256 constant IC11x = 19110234613058427321123053860287106249354480693928079445831845358161020021939;
    uint256 constant IC11y = 21149821323909989508503785390154705222337044875010599468906047776961224629226;

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[11] calldata _pubSignals
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

                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))

                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))

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

            checkField(calldataload(add(_pubSignals, 320)))

            checkField(calldataload(add(_pubSignals, 352)))

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
            return(0, 0x20)
        }
    }
}
