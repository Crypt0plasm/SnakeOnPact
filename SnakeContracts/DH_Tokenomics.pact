(namespace "free")
;;
;;
;; PART A      [CSS - Capabilities, Constants and Schemas]
;; PART A1      CAPABILITIES:
;; PART A2      CONSTANTS:
;; PART A3      SCHEMAS and TABLES:
;; PART B      [FUNCTIONS]
;; PART B1      INITIALISATION
;;      B2      VALIDATION
;;      B3      LISTS
;;      B4      IZ-FUNCTIONS
;;      B5      MATH
;;      B6      ACCOUNT MANAGEMENT
;;      B7      SNAPSHOTS
;;      B8      UPDATE LEDGERS
;;      B9      BIRTH
;;      B10     MINT Functions
;;      B11     BURN Functions
;;      B12     VESTING Functions
;;      B13     COIL-UNCOIL Functions
;;      B14     TRANSFER FUNCTIONS
;;      B15     REPL USAGE FUNCTIONS
;; PART C      [CREATE TABLES]
;;
;;==============================================================================
;;
;; PART A1      CAPABILITIES:
;;
;;              [No TIER Capabilities]
;;                BARONIC_RULE - governance Capability
;;                MASTERMINTER
;;                ADMIN - admin Capability
;;
;;              [Update TIER 0 Capabilities]
;;                IZSNAKE
;;                ROTATE
;;                UPDATE_AGE
;;                UPDATE_UNCOIL-LEDGERS
;;                UPDATE_SUPPLY
;;                RAW_BURN
;;                RECYCLE_TO_CODINGDIVISION
;;                RECYCLE_TO_LIQUIDITYFARMING
;;                RECYCLE_TO_SHAREHOLDERS
;;                RECYCLE_TO_SNAKEDAO
;;                RECYCLE_TO_SUBSIDIARY
;;
;;              [TIER 1 Capabilities]
;;                UPDATE-ALL_AGE
;;                FIX_ELITE
;;
;;              [BURN/MINT Capabilities]
;;                BURN_OUROBOROS
;;                BURN_UNCOIL-FEE
;;                BURN_AURYN
;;                BURN_ELITE-AURYN
;;                RECYCLE_AURYNS
;;                DIRECT_BURN
;;                ***
;;                MINT_OUROBOROS
;;                MINT_AURYN
;;                MINT_ELITE_AURYN
;;
;;              [COIL/UNCOIL Capabilities]
;;                COIL_OUROBOROS
;;                COIL_AURYN
;;                UNCOIL_AURYN
;;                UNCOIL_AURYN-HARVEST
;;                UNCOIL_ELITE-AURYN
;;                UNCOIL_ELITE-AURYN-HARVEST
;;
;;              [COMPOSED SPAWNING Capabilities]
;;                GENESIS_SPAWN
;;                DAILY_SPAWN
;;
;;              [CREDIT Capabilities]
;;                RAW_CREDIT
;;                DIRECT_CREDIT
;;                DIRECT_CREDIT_ELITE
;;                CREDIT_EXISTING
;;                CREDIT_EXISTING_ELITE
;;
;;              [DEBIT Capabilities]
;;                RAW_DEBIT
;;                DIRECT_DEBIT
;;                DIRECT_DEBIT_ELITE
;;                DEBIT_EXISTING
;;                DEBIT_EXISTING_ELITE
;;
;;              [TRANSFER Capabilities]
;;                TRANSFER
;;                ELITE_TRANSFER
;;                TRANSFER_NOFEE
;;                TRANSFER_AURYN
;;                TRANSFER_ELITE-AURYN
;;
;;              [HEROTAG Capabilities]
;;                NEWHEROTAG
;;
;;==============================================================================
;;
;; PART A2      CONSTANTS:
;;
;;==============================================================================
;;
;; PART A3      SCHEMAS and TABLES:
;;
;;==============================================================================
;;
;;
;; PART B      [FUNCTIONS]
;;
;;
;; PART B1      INITIALISATION
;;
;;                [RUN.C]BirthSnakes
;;                [XXX.R]SpawnMintingCounter
;;                [XXX.R]SpawnBurningCounter
;;                [XXX.R]SpawnSupplyCounter
;;
;;
;;      B2      VALIDATION
;;
;;                [FREE.0]EnforceSnakePrecision
;;                [FREE.0]ValidateAccount
;;                [FREE.0]ValidateAccountForTransfers
;;                [FREE.1]ValidateSenderReceiverForTransfers
;;                [FREE.1]ValidateAccountWithTransferWithPosition
;;                [FREE.1]ValidateAccountWithAmountComplex
;;                [FREE.1]ValidateAccountWithAmountSimple
;;                -------
;;                [FREE.0]EnforceAmount
;;                [FREE.0]EnforceBurningLedgerType
;;                [FREE.1]EnforceCreditDebitLedgerString
;;                [FREE.0]EnforceCreditDebitString
;;                [FREE.0]EnforceLedgerString
;;                [FREE.0]EnforcePositiveSupplyToken
;;                [FREE.0]EnforceNegativeSupplyToken
;;                -------
;;                [FREE.1]ValidateHerotag
;;                [FREE.0]Enforce-HT-Syntax
;;                [FREE.0]Enforce-HT-Uniqueness
;;                [FREE.0]Enforce-Latin-1
;;                [FREE.0]Enforce-Length
;;                -------
;;                [FREE.0]EnforcePlebeicTokenType
;;                [FREE.0]EnforceBaronicCreditTokenType
;;                [FREE.0]EnforceBaronicDebitTokenType
;;                ---
;;                enforce-reserved
;;                check-reserved
;;
;;
;;      B3      LISTS
;;
;;                [FREE.0]HighestDoubleTruth
;;                [FREE.0]HighestTripleTruth
;;                [FREE.0]HighestQuadTruth
;;                [FREE.0]HighestPentaTruth
;;                [FREE.0]HighestHexaTruth
;;                [FREE.0]HighestHeptaTruth
;;
;;
;;      B4      IZ-FUNCTIONS
;;
;;                [FREE.1]IzUncoilLedgerPositionFree
;;                [FREE.1]IzUncoilLedgerPositionOccupied
;;                [FREE.1]IzUncoilLedgerPositionLocked
;;                [FREE.2]IzUncoilLedgerPositionWhat
;;                [FREE.0]IzIntegerUncoilPosition
;;
;;
;;      B5      MATH
;;
;;                [FREE.0]Truncate
;;                [FREE.0]TruncateToSnake
;;                [FREE.0]TruncateToUnity
;;                [FREE.0]ComputeDailySpawnAmount
;;                [FREE.0]GetAuryndex
;;                [FREE.0]MakePercent
;;                [FREE.0]MakePermille
;;                ---
;;                [FREE.0]TierName
;;                [FREE.0]Tier
;;                [FREE.0]TierBoost
;;                ---
;;                [FREE.0]GetAurynUncoilFee
;;                [FREE.0]GetAurynUncoilTime
;;                [FREE.0]GetEliteAurynUncoilTimeByAmount
;;
;;
;;      B6      ACCOUNT MANAGEMENT
;;
;;                [RUN.C]SpawnSnakeAccount
;;                [RUN.C]RotateSnakeGuard
;;                [RUN.C]UpdateSnakeAccountHeroTag
;;                [XXX.R]UpdateHeroTag
;;                [XXX.R]UpdateAllSnakeAccountAge
;;                [XXX.R]UpdateSnakeAccountAge
;;
;;
;;      B7      SNAPSHOTS
;;
;;              [BURN LEDGER]
;;                GetBurnSupply
;;
;;              [SPAWN LEDGER]
;;                GetSpawnCounter
;;                GetSpawnEpoch
;;
;;              [SUPPLY LEDGER]
;;                GetSupply
;;                OuroborosSupplyLiquid
;;                AurynSupplyLiquid
;;                EliteAurynSupplyLiquid
;;                VestaSupplyLiquid
;;
;;              [UNCOIL LEDGER]
;;                GetUncoilLedgerPositionData
;;
;;              [PLEBEIC AND BARONIC LEDGERS]
;;                GetAllBaronicBalances
;;                SnapshotBaronicColumn
;;                ListBaronicColumn
;;
;;
;;      B8      UPDATE LEDGERS
;;
;;              [BURN LEDGER]
;;                DirectBurningLedgerCredit
;;                BurnedSnakePlus
;;                RecycledAurynPlus
;;                RecycledEliteAurynPlus
;;
;;              [SUPPLY LEDGER]
;;                UpdateSupply
;;                ----
;;                IncreaseSupply
;;                OuroborosPlus
;;                AurynPlus
;;                EliteAurynPlus
;;                VestedOuroborosPlus
;;                VestedAurynPlus
;;                VestedEliteAurynPlus
;;                VestaPlus
;;                SleepingVestaPlus
;;                FrozenVestaPlus
;;                GoldPlus
;;                UnityPlus
;;                EquityPlus
;;                ----
;;                DecreaseSupply
;;                OuroborosMinus
;;                AurynMinus
;;                EliteAurynMinus
;;                VestedOuroborosMinus
;;                VestedAurynMinus
;;                VestedEliteAurynMinus
;;                SleepingVestaMinus
;;                GoldMinus
;;
;;              [UNCOIL LEDGER]
;;                UpdateUncoilLedgerDataIncoming
;;                UpdateUncoilLedgerDataOutgoing
;;
;;
;;      B9      BIRTH
;;
;;                SpawnPrimordialSnakes
;;                SpawnDailySnakes
;;
;;
;;      B10     MINT Functions
;;
;;                MintOuroboros
;;                MintAuryn
;;                MintEliteAuryn
;;
;;
;;      B11     BURN Functions
;;
;;                BurnOuroboros
;;                BurnAuryn
;;                BurnEliteAuryn
;;                BurnUncoilFee
;;                ---
;;                RecycleAuryns
;;                RecycleAurynToCodingDivision
;;                RecycleAurynToLiquidityFarm
;;                RecycleAurynToShareholders
;;                RecycleAurynToSnakeDAO
;;                RecycleAurynToSubsidiaryStaking
;;
;;
;;      B12     VESTING Functions
;;
;;                GetCurrentEpochAuto
;;                GetCurrentEpochManual
;;                ---
;;                VestOuroboros
;;                UnvestOuroboros
;;                MergeVestedOuroboros
;;                VestAuryn
;;                UnvestAuryn
;;                MergeVestedAuryn
;;                VestEliteAuryn
;;                UnvestEliteAuryn
;;                MergeVestedEliteAuryn
;;
;;
;;      B13     COIL-UNCOIL Functions
;;
;;                CoilOuroboros
;;                CoilAuryn
;;                ====
;;                BestUncoilAuryn
;;                UncoilAurynPosition
;;                FinalizeUncoilAuryn
;;                FinalizeUncoilAurynPosition
;;                ---
;;                GetBestAurynUncoilPosition
;;                GetRipeAurynUncoilPosition
;;                UpdateAurynUncoilLedgerIncoming
;;                UpdateAurynUncoilLedgerOutgoing
;;                ===
;;                BestUncoilEliteAuryn
;;                UncoilEliteAurynPosition
;;                FinalizeUncoilEliteAuryn
;;                FinalizeUncoilEliteAurynPosition
;;                ---
;;                GetBestEliteAurynUncoilPosition
;;                GetRipeEliteAurynUncoilPosition
;;                UpdateEliteAurynUncoilLedgerIncoming
;;                UpdateEliteAurynUncoilLedgerOutgoing
;;                ---
;;                UpdateEliteAurynUncoilLedgerByElite
;;                FixPositionByElite
;;                ReversePositionStatus
;;                LockEliteAurynUncoilLedgerPosition
;;                UnlockEliteAurynUncoilLedgerPosition
;;
;;
;;      B14     TRANSFER FUNCTIONS
;;
;;                [T0]AbsoluteTransfer
;;                [T0]AbsoluteTransferAnew
;;                ===
;;                [T1]TransmitOuroboros
;;                [T1]TransmitAuryn
;;                [T1]TransmitEliteAuryn
;;                [T1]TransmitVesta
;;                [T1]TransmitGold
;;                [T1]TransmitUnity
;;                ...
;;                [T1]TransmitOuroborosAnew
;;                [T1]TransmitAurynAnew
;;                [T1]TransmitEliteAurynAnew
;;                [T1]TransmitVestaAnew
;;                [T1]TransmitGoldAnew
;;                [T1]TransmitUnityAnew
;;                ---
;;                [T2]RelocateTokensV1
;;                [T2]RelocateTokensV2
;;                [T2]RelocateTokensV3
;;                [T2]RelocateTokensV4
;;                [T2]RelocateTokensV5
;;                [T2]RelocateTokensV6
;;                ---
;;                [T3]CreditOuroboros
;;                [T3]DebitOuroboros
;;                [T3]CreditAuryn
;;                [T3]DebitAuryn
;;                [T3]CreditEliteAuryn
;;                [T3]DebitEliteAuryn
;;                ...
;;                [T3]CreditVestedOuroboros
;;                [T3]DebitVestedOuroboros
;;                [T3]CreditVestedAuryn
;;                [T3]DebitVestedAuryn
;;                [T3]CreditVestedEliteAuryn
;;                [T3]DebitVestedEliteAuryn
;;                ...
;;                [T3CreditBurnedOuroboros
;;                [T3CreditBOVA
;;                [T3CreditRecycledAuryn
;;                [T3CreditRecycledEliteAuryn
;;                ...
;;                [T3]CreditVesta
;;                [T3]DebitVesta
;;                [T3]CreditSleepingVesta
;;                [T3]DebitSleepingVesta
;;                [T3]CreditFrozenVesta
;;                ...
;;                [T3]CreditGold
;;                [T3]DebitGold
;;                [T3]CreditUnity
;;                [T3]DebitUnity
;;                [T3]CreditEquity
;;                ===
;;                [T4]CreditDemiourgosTokensWithExistance
;;                [T4]CreditDemiourgosTokens
;;                [T4]DebitDemiourgosTokens
;;                ===
;;                [T5]DirectBaronicCredit
;;                [T5]DirectBaronicDebit
;;                [T5]DirectPlebeicCredit
;;                [T5]DirectPlebeicDebit
;;                ===
;;                [T6]RawCreditBaronicOuroboros
;;                [T6]RawCreditBaronicAuryn
;;                [T6]RawCreditBaronicEliteAuryn
;;                [T6]RawCreditBaronicVestedOuroboros
;;                [T6]RawCreditBaronicVestedAuryn
;;                [T6]RawCreditBaronicVestedEliteAuryn
;;                [T6]RawCreditBaronicBurnedOuroboros
;;                [T6]RawCreditBaronicBOVA
;;                [T6]RawCreditBaronicRecycledAuryn
;;                [T6]RawCreditBaronicRecycledEliteAuryn
;;                [T6]RawCreditBaronicVesta
;;                [T6]RawCreditBaronicSleepingVesta
;;                [T6]RawCreditBaronicFrozenVesta
;;                [T6]RawCreditBaronicGold
;;                [T6]RawCreditBaronicUnity
;;                [T6]RawCreditBaronicEquity
;;                ...
;;                [T6]RawDebitBaronicOuroboros
;;                [T6]RawDebitBaronicAuryn
;;                [T6]RawDebitBaronicEliteAuryn
;;                [T6]RawDebitBaronicVestedOuroboros
;;                [T6]RawDebitBaronicVestedAuryn
;;                [T6]RawDebitBaronicVestedEliteAuryn
;;                [T6]RawDebitBaronicVesta
;;                [T6]RawDebitBaronicSleepingVesta
;;                [T6]RawDebitBaronicGold
;;                [T6]RawDebitBaronicUnity
;;                ...
;;                [T6]RawCreditPlebeicOuroboros
;;                [T6]RawCreditPlebeicAuryn
;;                [T6]RawCreditPlebeicEliteAuryn
;;                [T6]RawCreditPlebeicVesta
;;                [T6]RawCreditPlebeicGold
;;                [T6]RawCreditPlebeicUnity
;;                ...
;;                [T6]RawDebitPlebeicOuroboros
;;                [T6]RawDebitPlebeicAuryn
;;                [T6]RawDebitPlebeicEliteAuryn
;;                [T6]RawDebitPlebeicVesta
;;                [T6]RawDebitPlebeicGold
;;                [T6]RawDebitPlebeicUnity
;;
;;
;;      B15     REPL USAGE FUNCTIONS
;;                DisplayAccountBSL
;;                DisplayAccountAUL
;;                DisplayAccountEAUL
;;                DisplayBL
;;                DisplaySL
;;
;;==============================================================================
;;
;; PART C      [CREATE TABLES]
;;
;;==============================================================================
;;==============================================================================
;;
(module DHOuroboros  BARONIC_RULE
  @doc "DHOuroboros represents the Demiourgos.Holdings Smart-Contract module that governs\
        \all Snake Token (Ouroboros, Auryn, Elite-Auryn) functions accross the Kaden Multichain"
;;
;;==============================================================================
;;
;;  PART A1 - CAPABILITIES
;;
;;==============================================================================
;;No Tier Capabilities
  (defcap BARONIC_RULE ()
    @doc "TIER -1 Capability"
    (enforce-guard (keyset-ref-guard KEY_DEMIURG))
  )

  (defcap MASTERMINTER ()
    @doc "TIER -1 Capability \
    \ Only the MINTER_KEYSET is master minter"
    (enforce-keyset KEY_MINTER)
  )

  (defcap ADMIN ()
    @doc "TIER -1 Capability \
    \ A guard for admin-only actions, restricted to the free.DH-Master-Keyset keyset."
    (enforce-guard (keyset-ref-guard KEY_DEMIURG))
  )
  ;;============================================================================
  ;; Update Tier 0 Capabilities
  (defcap IZSNAKE:bool (account:string existance:bool)
    @doc "TIER 0 Capability \
    \ Capability that enforces the existance or non-existance of a Snake account\
    \ <true> existance, means the existance of a Snake Account is enforced\
    \ <false> existance, means the non-existance of a Snake Account is enforced"

    (with-default-read BaronicSnakeLedger account
      { "Ouroboros" : -1.0 }
      { "Ouroboros" := o }

      (let
        (
          (exists (if (= o -1.0) false true))
        )
        (enforce
          (= exists existance)    ;;true means it exists, false means it doesnt exist
          (if
            (= existance true)
            (format "Account {} doesnt exist in the Baronic Ledger, please create it first." [account])
            (format "Account {} exists in the Baronic Ledger, no need to create it anew." [account])
          )
        )
      )
    )
  )
  (defcap ROTATE (account:string)
    @doc "TIER 0 Capability \
    \ Autonomously managed capability for snake guard rotation"
    @managed
    true
  )
  (defcap UPDATE_AGE ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap UPDATE_UNCOIL-LEDGERS ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap UPDATE_SUPPLY ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap RAW_BURN ()
    @doc "TIER 0 Capability"
    true
  )
  ;;Recycle Tier 0 Capabilities
  (defcap RECYCLE_TO_CODINGDIVISION ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap RECYCLE_TO_LIQUIDITYFARMING ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap RECYCLE_TO_SHAREHOLDERS ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap RECYCLE_TO_SNAKEDAO ()
    @doc "TIER 0 Capability"
    true
  )
  (defcap RECYCLE_TO_SUBSIDIARY ()
    @doc "TIER 0 Capability"
    true
  )
  ;;Tier 1 Capabilities
  (defcap UPDATE-ALL_AGE ()
    @doc "TIER 1 Capability"
    (compose-capability (UPDATE_AGE))
  )
  (defcap FIX_ELITE ()
    @doc "TIER 1 Capability"
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )
  ;;============================================================================
  ;;BURN/MINT Capabilities
  ;;BURN
  (defcap BURN_OUROBOROS (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (DEBIT_EXISTING account))
    (compose-capability (DIRECT_BURN))
    (compose-capability (CREDIT_EXISTING account true))
    (compose-capability (UPDATE_SUPPLY))
  )
  (defcap BURN_UNCOIL-FEE (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (RAW_DEBIT AUTO_STAKING))
    (compose-capability (DIRECT_BURN))
    (compose-capability (CREDIT_EXISTING AUTO_STAKING true))
    (compose-capability (CREDIT_EXISTING account true))
    (compose-capability (UPDATE_SUPPLY))
  )
  (defcap BURN_AURYN (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (DEBIT_EXISTING account))
    (compose-capability (UPDATE_SUPPLY))
  )
  (defcap BURN_ELITE-AURYN (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (DEBIT_EXISTING_ELITE account))
    (compose-capability (UPDATE_SUPPLY))
  )
  (defcap RECYCLE_AURYNS ()
    @doc "TIER 1 Capability"
    (compose-capability (RAW_CREDIT DAO_CODINGDIVISION))
    (compose-capability (RAW_CREDIT LIQUIDITY_FARMING))
    (compose-capability (RAW_CREDIT SHAREHOLDERS))
    (compose-capability (RAW_CREDIT DAO_SNAKE))
    (compose-capability (RAW_CREDIT SUBSIDIARY_STAKING))
    (compose-capability (RECYCLE_TO_CODINGDIVISION))
    (compose-capability (RECYCLE_TO_LIQUIDITYFARMING))
    (compose-capability (RECYCLE_TO_SHAREHOLDERS))
    (compose-capability (RECYCLE_TO_SNAKEDAO))
    (compose-capability (RECYCLE_TO_SUBSIDIARY))
  )
  (defcap DIRECT_BURN ()
    @doc "TIER 1 Capability"
    (compose-capability (RAW_BURN))
  )
  ;;MINT
  (defcap MINT_OUROBOROS (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (MASTERMINTER))
    (compose-capability (CREDIT_EXISTING account true))
    (compose-capability (UPDATE_SUPPLY))
  )
  (defcap MINT_AURYN (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (CREDIT_EXISTING account true))
    (compose-capability (UPDATE_SUPPLY))
  )
  (defcap MINT_ELITE-AURYN (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (CREDIT_EXISTING_ELITE account true))
    (compose-capability (UPDATE_SUPPLY))
  )
  ;;============================================================================
  ;;COIL/UNCOIL Capabilities
  ;;1/6 Morph Capabilty = COIL_OUROBOROS
  (defcap COIL_OUROBOROS:bool (sender:string amount:decimal)
    @doc "TIER 4 Capability \
    \ The 1st Morph Capability \
    \ Capability for managing the Coil Ouroboros operation."
    (compose-capability (DEBIT_EXISTING  sender))
    (compose-capability (CREDIT_EXISTING  AUTO_STAKING true))
    (compose-capability (MINT_AURYN sender))
  )
  ;;2/6 Morph Capabilty = COIL_AURYN
  (defcap COIL_AURYN:bool (sender:string)
    @doc "TIER 4 Capability \
    \ The 2nd Morph Capability \
    \ Capability for managing the Coil Auryn operation."
    (compose-capability (DEBIT_EXISTING  sender))
    (compose-capability (CREDIT_EXISTING ELITE_HOLD true))
    (compose-capability (MINT_ELITE-AURYN sender))
  )
  ;;3/6 Morph Capabilty = UNCOIL_AURYN
  (defcap UNCOIL_AURYN:bool (sender:string)
    @doc "TIER 4 Capability \
    \ The 3rd Morph Capability \
    \ Capability for managing the initialization \
    \ of the Uncoil Auryn operation."
    (compose-capability (BURN_AURYN  sender))
    (compose-capability (RAW_DEBIT AUTO_STAKING))
    (compose-capability (BURN_UNCOIL-FEE sender))
    (compose-capability (CREDIT_EXISTING  UNCOIL_HOLD true))
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )
  ;;4/6 Morph Capabilty = UNCOIL_AURYN-HARVEST
  (defcap UNCOIL_AURYN-HARVEST:bool (sender:string)
    @doc "TIER 4 Capability \
    \ The 4th Morph Capability \
    \ Capability for managing the finalization \
    \ of the Uncoil Auryn operation."
    (compose-capability (RAW_DEBIT UNCOIL_HOLD))
    (compose-capability (CREDIT_EXISTING  sender true))
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )
  ;;5/6 Morph Capabilty = UNCOIL_ELITE-AURYN
  (defcap UNCOIL_ELITE-AURYN:bool (sender:string)
    @doc "TIER 4 Capability \
    \ The 5th Morph Capability \
    \ Capability for managing the initialization \
    \ of the Uncoil Elite-Auryn operation."
    (compose-capability (BURN_ELITE-AURYN sender))
    (compose-capability (RAW_DEBIT ELITE_HOLD))
    (compose-capability (CREDIT_EXISTING UNCOIL_HOLD true))
  )
  ;;6/6 Morph Capabilty = UNCOIL_ELITE-AURYN-HARVEST
  (defcap UNCOIL_ELITE-AURYN-HARVEST:bool (sender:string)
    @doc "TIER 4 Capability \
    \ The 6th Morph Capability \
    \ Capability for managing the finalization \
    \ of the Uncoil Elite-Auryn operation."
    (compose-capability (RAW_DEBIT UNCOIL_HOLD))
    (compose-capability (CREDIT_EXISTING sender true))
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )
  ;;============================================================================
  ;;COMPOSED SPAWNING Capabilities
  (defcap GENESIS_SPAWN (account:string)
    @doc "TIER 3 Capability"
    (compose-capability (MINT_OUROBOROS account))
    (compose-capability (DEBIT_EXISTING account))
    (compose-capability (CREDIT_EXISTING TREASURY true))
    (compose-capability (CREDIT_EXISTING DEVELOPERS true))
    (compose-capability (CREDIT_EXISTING TOKEN_SALE true))
  )
  (defcap DAILY_SPAWN (account:string)
    @doc "Both MasterMinter and DailyMinter Keys are required for the daily spwan"
    (compose-capability (MINT_OUROBOROS account))
    (compose-capability (UPDATE-ALL_AGE))
    (compose-capability (MINT_OUROBOROS AUTO_STAKING))
    (compose-capability (MINT_OUROBOROS BONDS))
    (compose-capability (MINT_OUROBOROS TREASURY))
    (compose-capability (MINT_OUROBOROS SHAREHOLDERS))
    (compose-capability (MINT_OUROBOROS DEVELOPERS))
    (compose-capability (MINT_OUROBOROS RAFFLES))
    (compose-capability (MINT_OUROBOROS LIQUIDITY_FARMING))
    (compose-capability (MINT_OUROBOROS SUBSIDIARY_STAKING))
    (compose-capability (MINT_OUROBOROS SNAKE_STAKING))
    (compose-capability (MINT_OUROBOROS VEGLD_STAKING))
    (compose-capability (DEBIT_EXISTING LIQUIDITY_FARMING))
    (compose-capability (DEBIT_EXISTING SUBSIDIARY_STAKING))
    (compose-capability (DEBIT_EXISTING SNAKE_STAKING))
    (compose-capability (DEBIT_EXISTING VEGLD_STAKING))
  )
  ;;============================================================================
  ;;CREDIT Capabilities
  ;;Tier 1
  (defcap RAW_CREDIT (receiver:string)
    @doc "TIER 1 Capability"
    (enforce (!= receiver "") "Valid Receiver for creditation!")
  )
  ;;Tier 2
  (defcap DIRECT_CREDIT (receiver:string)
    @doc "TIER 2 Capability"
    (compose-capability (RAW_CREDIT receiver))
  )
  (defcap DIRECT_CREDIT_ELITE (receiver:string)
    @doc "TIER 2 Capability"
    (compose-capability (RAW_CREDIT receiver))
    (compose-capability (FIX_ELITE))
  )
  ;;Tier 3
  (defcap CREDIT_EXISTING (receiver:string existance:bool)
    @doc "TIER 3 Capability"
    (compose-capability (DIRECT_CREDIT receiver))
    (if (= existance true)
      (compose-capability (IZSNAKE receiver true))
      (compose-capability (IZSNAKE receiver false))
    )
  )
  (defcap CREDIT_EXISTING_ELITE (receiver:string existance:bool)
    @doc "TIER 3 Capability"
    (compose-capability (DIRECT_CREDIT_ELITE receiver))
    (if (= existance true)
      (compose-capability (IZSNAKE receiver true))
      (compose-capability (IZSNAKE receiver false))
    )
  )
  ;;============================================================================
  ;;DEBIT Capabilities
  ;;Tier 1
  (defcap RAW_DEBIT (sender:string)
    @doc "TIER 1 Capability"
    (enforce (!= sender "") "Valid Sender for Debitation!")
  )
  ;;Tier 2
  (defcap DIRECT_DEBIT (sender:string)
    @doc "TIER 2 Capability"
    (enforce-guard (at "Guard" (read PlebeicSnakeLedger sender)))
    (compose-capability (RAW_DEBIT sender))
  )
  (defcap DIRECT_DEBIT_ELITE (sender:string)
    @doc "TIER 2 Capability"
    (enforce-guard (at "Guard" (read PlebeicSnakeLedger sender)))
    (compose-capability (RAW_DEBIT sender))
    (compose-capability (FIX_ELITE))
  )
  ;;Tier 3
  (defcap DEBIT_EXISTING (sender:string)
    @doc "TIER 3 Capability"
    (compose-capability (DIRECT_DEBIT sender))
    (compose-capability (IZSNAKE sender true))
  )
  (defcap DEBIT_EXISTING_ELITE (sender:string)
    @doc "TIER 3 Capability"
    (compose-capability (DIRECT_DEBIT_ELITE sender))
    (compose-capability (IZSNAKE sender true))
  )
  ;;============================================================================
  ;;TRANSFER Capabilities
  ;;Tier 3
  (defcap TRANSFER (sender:string receiver:string existance:bool)
    @doc "TIER 3 Capability"
    (enforce (!= sender receiver) "When transfering sender cannot be the receiver!")
    (compose-capability (DEBIT_EXISTING sender))
    (compose-capability (CREDIT_EXISTING receiver existance))
  )
  (defcap ELITE_TRANSFER (sender:string receiver:string existance:bool)
    @doc "TIER 3 Capability"
    (enforce (!= sender receiver) "When transfering sender cannot be the receiver!")
    (compose-capability (DEBIT_EXISTING_ELITE sender))
    (compose-capability (CREDIT_EXISTING_ELITE receiver existance))
  )
  ;;Tier 4
  (defcap TRANSFER_NOFEE (sender:string receiver:string existance:bool)
    @doc "TIER 4 Capability"
    (compose-capability (TRANSFER sender receiver existance))
  )
  (defcap TRANSFER_AURYN (sender:string receiver:string existance:bool)
    @doc "TIER 4 Capability"
    (compose-capability (TRANSFER sender receiver existance))
    (compose-capability (RECYCLE_AURYNS))
    (compose-capability (DIRECT_BURN))
    (compose-capability (CREDIT_EXISTING sender true))
  )
  (defcap TRANSFER_ELITE-AURYN (sender:string receiver:string existance:bool)
    @doc "TIER 4 Capability"
    (compose-capability (ELITE_TRANSFER sender receiver existance))
    (compose-capability (RECYCLE_AURYNS))
    (compose-capability (DIRECT_BURN))
    (compose-capability (CREDIT_EXISTING sender true))
  )
  ;;============================================================================
  ;;HEROTAG Capabilities
  ;;Tier 4
  (defcap NEWHEROTAG (account:string)
    @doc "TIER 4 Capability"
    (compose-capability (BURN_OUROBOROS account))
  )
;;
;;==============================================================================
;;
;;  A2 - CONSTANTS
;;
;;==============================================================================
;;
  (defconst SNAKE_COUNT "snake-count")
  (defconst PRIMORDIALSWAPN false)
  (defconst DECIMAL_ZERO 0.0)
  (defconst MAXIMUM_SNAKE_PRECISION 18
    "Maximum allowed precision for all Snake Tokens and Snake Token Transactions")
  (defconst UNITY_PRECISION 24
    "Maximum allowed precision for coins like UNITY and GSC")
  (defconst MINIMUM_ACCOUNT_LENGTH 3
    "Minimum account length admissible for snake coin accounts")
  (defconst MAXIMUM_ACCOUNT_LENGTH 256
    "Maximum account name length admissible for snake coin accounts")
  (defconst MINIMUM_HEROTAG_LENGTH 3
    "Minimum herotag length admissible for the snake herotag")
  (defconst MAXIMUM_HEROTAG_LENGTH 128
    "Maximum herotag length admissible for the snake herotag")

  (defconst VALID_CHAIN_IDS (map (int-to-str 10) (enumerate 0 19))
    "List of all valid Chainweb chain ids")
  ;;Blockchain constants
  (defconst CEILING 10000000.0)
  (defconst MINT_SPEED 10000.0)
  (defconst GENESIS_AMOUNT 490000.0)
  (defconst HEROTAG_UPDATE_PRICE 5.0)
  ;;Genesis Mint Allocations
  (defconst GENESIS_TREASURY 112000.0)
  (defconst GENESIS_DEVELOPERS 49000.0)
  (defconst GENESIS_SALE 245000.0)
  ;;Daily Mint Split
  (defconst SPLIT_BONDS 20.0)
  (defconst SPLIT_TREASURY 9.0)
  (defconst SPLIT_SHAREHOLDERS 10.0)
  (defconst SPLIT_DEVELOPERS 3.0)
  (defconst SPLIT_RAFFLES 3.0)
  (defconst SPLIT_LIQUIDITY_FARMING 12.0)
  (defconst SPLIT_AUTO_STAKING 15.0)
  (defconst SPLIT_SUBSIDIARY_STAKING 15.0)
  (defconst SPLIT_SNAKE_STAKING 5.0)
  (defconst SPLIT_VEGLD_STAKING 8.0)
  ;;Table Keys
  (defconst SPAWN_COUNT "Spawns")
  (defconst BURN_COUNT "Burns")
  (defconst SUPPLY_COUNT "Totals")

  ;;Keysets
  ;;TIER 0 KEYSETS
  (defconst KEY_DEMIURG "free.DH-Master-Keyset")
  (defconst KEY_MINTER "free.DH-Master-Minter-Keyset")
  ;;TIER 1 KEYSETS
  (defconst KEY_GENESIS_MINTER "free.DH-Genesis-Minter-Keyset")
  (defconst KEY_DAILY_MINTER "free.DH-Daily-Minter-Keyset")
  (defconst KEY_TOKEN_SALE "free.DH-Token-Sale-Keyset")
  ;;TIER 2 KEYSETS
  (defconst KEY_AUTO_STAKING "free.DH-Autostake-Keyset")
  (defconst KEY_ELITE_HOLD "free.DH-Elitehold-Keyset")
  (defconst KEY_UNCOIL_HOLD "free.DH-Uncoilhold-Keyset")
  (defconst KEY_VESTING_HOLD "free.DH-Vestinghold-Keyset")
  ;;Tier 3 KEYSETS
  (defconst KEY_BONDS "free.DH-Bonds-Keyset")
  (defconst KEY_TREASURY "free.DH-Treasury-Keyset")
  (defconst KEY_DEVELOPERS "free.DH-Developers-Keyset")
  (defconst KEY_RAFFLES "free.DH-Raffles-Keyset")
  ;;Tier 4 KEYSETS
  (defconst KEY_SHAREHOLDERS "free.DH-Shareholders-Keyset")
  (defconst KEY_LIQUIDITY_FARMING "free.DH-Liquidity-Farming-Keyset")
  (defconst KEY_SNAKE_STAKING "free.DH-Snake-Staking-Keyset")
  (defconst KEY_SUBSIDIARY_STAKING "free.DH-Subsidiary-Staking-Keyset")
  (defconst KEY_VEGLD_STAKING "free.DH-VEGLD-Staking-Keyset")
  ;;Tier 5 Keyset - MAIN DAOs
  (defconst KEY_DAO_SNAKE "free.DH-DAO-Snakes-Keyset")
  (defconst KEY_DAO_CODINGDIVISION "free.DH-DAO-CodingDivision-Keyset")
  (defconst KEY_DAO_VESTAXFINANCE "free.DH-DAO-VestaXFinance-Keyset")
  (defconst KEY_DAO_RENTALDIVISION "free.DH-DAO-RentalDivision-Keyset")
  (defconst KEY_DAO_CINEMACAFFE "free.DH-DAO-CinemaCaffe-Keyset")
  (defconst KEY_DAO_UNITY "free.DH-DAO-Unity-Keyset")
  (defconst KEY_DAO_OVERUNITY "free.DH-DAO-Overunity-Keyset")
  ;;Tier 6 Accounts - Entertainment DAOs
  (defconst KEY_DAO_BLOODSHED "free.DH-DAO-Bloodshed-Keyset")
  (defconst KEY_DAO_XBUNNY "free.DH-DAO-XBunny-Keyset")
  (defconst KEY_DAO_NOSFERATU "free.DH-DAO-Nosferatu-Keyset")

  ;;Accounts
  ;;TIER 1 Accounts
  (defconst GENESIS_MINTER "sender05")    ;;DH Main Account (Holds Liquidity and Team)
  (defconst DAILY_MINTER "sender06")
  (defconst TOKEN_SALE "sender07")
  ;;TIER 2 Accounts
  (defconst AUTO_STAKING "sender08")
  (defconst ELITE_HOLD "sender09")
  (defconst UNCOIL_HOLD "sender10")
  (defconst VESTING_HOLD "sender11")
  ;;TIER 3 Accounts
  (defconst BONDS "sender12")
  (defconst TREASURY "sender13")
  (defconst DEVELOPERS "sender14")
  (defconst RAFFLES "sender15")
  ;;TIER 4 Accounts
  (defconst SHAREHOLDERS "sender16")
  (defconst LIQUIDITY_FARMING "sender17")
  (defconst SNAKE_STAKING "sender18")
  (defconst SUBSIDIARY_STAKING "sender19")
  (defconst VEGLD_STAKING "sender20")
  ;;Tier 5 Accounts - MAIN Division DAOs
  (defconst DAO_SNAKE "sender21")
  (defconst DAO_CODINGDIVISION "sender22")
  (defconst DAO_VESTAXFINANCE "sender23")
  (defconst DAO_RENTALDIVISION "sender24")
  (defconst DAO_CINEMACAFFE "sender25")
  (defconst DAO_UNITY "sender26")
  (defconst DAO_OVERUNITY "sender27")
  ;;Tier 6 Accounts - Entertainment DAOs
  (defconst DAO_BLOODSHED "sender28")
  (defconst DAO_XBUNNY "sender29")
  (defconst DAO_NOSFERATU "sender30")

  ;;Herotags
  ;;TIER 1 Accounts
  (defconst HT_GENESIS_MINTER "@DH©.GenesisMinter")    ;;DH Main Account (Holds Liquidity and Team)
  (defconst HT_DAILY_MINTER "@DH©.DailyMinter")
  (defconst HT_TOKEN_SALE "@DH©.TokenSale")
  ;;TIER 2 Accounts
  (defconst HT_AUTO_STAKING "@DH©.AutostakingPool")
  (defconst HT_ELITE_HOLD "@DH©.EliteAccountPool")
  (defconst HT_UNCOIL_HOLD "@DH©.UncoilPool")
  (defconst HT_VESTING_HOLD "@DH©.VestingPool")
  ;;TIER 3 Accounts
  (defconst HT_BONDS "@DH©.Bonds")
  (defconst HT_TREASURY "@DH©.Treasury")
  (defconst HT_DEVELOPERS "@DH©.DevelopmentFund")
  (defconst HT_RAFFLES "@DH©.Giveaways")
  ;;TIER 4 Accounts
  (defconst HT_SHAREHOLDERS "@DH©.ShareholdersPool")
  (defconst HT_LIQUIDITY_FARMING "@DH©.FarmersPool")
  (defconst HT_SNAKE_STAKING "@DH©.SnakesPool")
  (defconst HT_SUBSIDIARY_STAKING "@DH©.SubsidiaryPool")
  (defconst HT_VEGLD_STAKING "@DH©.CoinStakingPool")
  ;;Tier 5 Accounts - MAIN DAOs
  (defconst HT_DAO_SNAKE "@DH©.DAO.Snakes")
  (defconst HT_DAO_CODINGDIVISION "@DH©.DAO.CodingDivision")
  (defconst HT_DAO_VESTAXFINANCE "@DH©.DAO.VestaXFinance")
  (defconst HT_DAO_RENTALDIVISION "@DH©.DAO.RentalDivision")
  (defconst HT_DAO_CINEMACAFFE "@DH©.DAO.CinemaCaffe")
  (defconst HT_DAO_UNITY "@DH©.DAO.UNITY")
  (defconst HT_DAO_OVERUNITY "@DH©.DAO.OVERUNITY")
  ;;Tier 6 Accounts - Entertainment DAOs
  (defconst HT_DAO_BLOODSHED "@DH©.DAO.Bloodshed")
  (defconst HT_DAO_XBUNNY "@DH©.DAO.XBunny")
  (defconst HT_DAO_NOSFERATU "@DH©.DAO.Nosferatu")

  ;;EliteAccountTier Definitions
  ;;Tier Names
  (defconst TIERN "Infidel")
  (defconst TIER0 "Newcomer")
  (defconst TIER1 "Partner")
  (defconst TIER2 "Investor")
  (defconst TIER3 "Entrepreneur")
  (defconst TIER4 "Baron")
  (defconst TIER5 "Mogul")
  (defconst TIER6 "Magnate")
  (defconst TIER7 "Demiurg")
  ;;Tier Numbers
  (defconst NTIERN -1)
  (defconst NTIER0 0)
  (defconst NTIER1 1)
  (defconst NTIER2 2)
  (defconst NTIER3 3)
  (defconst NTIER4 4)
  (defconst NTIER5 5)
  (defconst NTIER6 6)
  (defconst NTIER7 7)
  (defconst MAX_NEWCOMER_BOOST_PRECISION 4
    "Max allowed precision for Newcomer Boost")
  ;;TierBoosts
  (defconst TB_INFIDEL 1.0)
  (defconst TB_PARTNER 1.1)
  (defconst TB_INVESTOR 1.3)
  (defconst TB_ENTREPRENEUR 1.6)
  (defconst TB_BARON 2.0)
  (defconst TB_MOGUL 2.5)
  (defconst TB_MAGNATE 3.1)
  (defconst TB_DEMIURG 3.8)

  ;;Mockup Times
  (defconst GENESISTIME:time (time "2023-08-01T00:00:00Z"))
  (defconst TIME1:time (time "2023-08-02T12:30:00Z"))
  (defconst TIME2:time (time "2023-08-03T12:34:00Z"))
  (defconst TIME3:time (time "2023-08-04T10:34:00Z"))
  (defconst TIME4:time (time "2023-08-05T10:34:00Z"))
  (defconst TIME5:time (time "2023-08-06T10:34:00Z"))
  (defconst TIME6:time (time "2023-08-07T10:34:00Z"))
  (defconst TIME7:time (time "2023-08-08T10:34:00Z"))
  (defconst TIME8:time (time "2023-08-09T10:34:00Z"))
  (defconst TIME9:time (time "2023-08-10T10:34:00Z"))
  (defconst TIME10:time (time "2023-08-11T10:34:00Z"))
  (defconst TIME20:time (time "2023-12-23T23:59:59Z"))

  ;;Auryn Uncoil Times (dependen on Elite Account Tier)
  (defconst AURYN_UT_0 21)
  (defconst AURYN_UT_1 20)
  (defconst AURYN_UT_2 19)
  (defconst AURYN_UT_3 18)
  (defconst AURYN_UT_4 17)
  (defconst AURYN_UT_5 16)
  (defconst AURYN_UT_6 15)
  (defconst AURYN_UT_7 14)
  ;;Elite-Auryn Uncoil Times (dependen on Elite Account Tier)
  (defconst EAURYN_UT_0 70)
  (defconst EAURYN_UT_1 63)
  (defconst EAURYN_UT_2 56)
  (defconst EAURYN_UT_3 49)
  (defconst EAURYN_UT_4 42)
  (defconst EAURYN_UT_5 35)
  (defconst EAURYN_UT_6 28)
  (defconst EAURYN_UT_7 21)
  ;;Auryns Recycle Fee
  (defconst AURYN_RECYCLE-FEE 5.0)
  (defconst ELITE_AURYN_RECYCLE-FEE 10.0)
  (defconst FIFTY 50.0)
  ;; LISTS
  (defconst TYPE_BURNING_LEDGER [1 2 3])
  (defconst TYPE_PLEBEIC_TOKEN [1 2 3 11 14 15])
  (defconst TYPE_BARONIC_TOKEN (enumerate 1 16))
  (defconst TYPE_DBARONIC_TOKEN [1 2 3 4 5 6 11 12 14 15])
  (defconst DH_ACCOUNTS [GENESIS_MINTER DAILY_MINTER TOKEN_SALE
   AUTO_STAKING ELITE_HOLD UNCOIL_HOLD VESTING_HOLD
   BONDS TREASURY DEVELOPERS RAFFLES
   SHAREHOLDERS LIQUIDITY_FARMING SNAKE_STAKING SUBSIDIARY_STAKING VEGLD_STAKING
   DAO_SNAKE DAO_CODINGDIVISION DAO_VESTAXFINANCE DAO_RENTALDIVISION
   DAO_CINEMACAFFE DAO_UNITY DAO_OVERUNITY
   DAO_BLOODSHED DAO_XBUNNY DAO_NOSFERATU
  ])
  (defconst DH_ACCOUNTS_BL [AUTO_STAKING ELITE_HOLD VESTING_HOLD UNCOIL_HOLD DAILY_MINTER])
  (defconst SUPPLY_LIST_PLUS ["Ouroboros" "Auryn" "EliteAuryn"
  "VestedOuroboros" "VestedAuryn" "VestedEliteAuryn"
  "SleepingVesta" "Gold" "FrozenVesta"
   "Unity" "Equity" "Vesta"])
  (defconst SUPPLY_LIST_MINUS (take 8 SUPPLY_LIST_PLUS))
  (defconst BURN_TOKENS ["BurnedSnake" "RecycledAuryn" "RecycledEliteAuryn"])
;;
;;==============================================================================
;;
;;  PART A3 - CAPABILITIES
;;
;;==============================================================================
;;Schemas and Table Definitions
  (defschema PlebeicSnakeTokenLedgerSchema
    @doc "The multichain Snake Token Ledger"

    Guard:guard

    Ouroboros:decimal
    Auryn:decimal
    EliteAuryn:decimal

    Vesta:decimal
    Gold:decimal
    Unity:decimal
    )

  (deftable PlebeicSnakeLedger:{PlebeicSnakeTokenLedgerSchema}
    @doc "Table Keys (Row names) are the Kadena Account names."
  )

  (defschema BaronicSnakeTokenLedgerSchema
    @doc "The primordial Snake Token Ledger"

    Age:integer
    ATHT:string
    HTU:integer ;;counts how many times the herotag was rotated
                ;;creation is free, first rotation is free
                ;;each further rotation costs 5 Ouroboros, which is burned.

    Ouroboros:decimal
    Auryn:decimal
    EliteAuryn:decimal

    VestedOuroboros:decimal
    VestedAuryn:decimal
    VestedEliteAuryn:decimal

    BurnedOuroboros:decimal
    BurnedOuroborosViaAutostake:decimal
    RecycledAuryn:decimal
    RecycledEliteAuryn:decimal

    EliteAccountName:string
    EliteAccountTier:integer
    EliteAccountBoost:decimal

    Vesta:decimal
    SleepingVesta:decimal
    FrozenVesta:decimal

    Gold:decimal
    Unity:decimal
    Equity:decimal

  )

  (deftable BaronicSnakeLedger:{BaronicSnakeTokenLedgerSchema}
    @doc "Table Keys (Row names) are the Kadena Account names."
  )

  (defschema SpawnSchema
    @doc "Table with the Genesis Spawn Counter"

    spawncounter:integer
    spawnepoch:integer
  )

  (deftable SpawnCounterLedger:{SpawnSchema})

  (defschema UncoilSchema
    @doc "Schema holding the Auryn/Elite-Auryn Uncoil Data"

    P1A:decimal
    P1E:integer
    P2A:decimal
    P2E:integer
    P3A:decimal
    P3E:integer
    P4A:decimal
    P4E:integer
    P5A:decimal
    P5E:integer
    P6A:decimal
    P6E:integer
    P7A:decimal
    P7E:integer
  )

  (deftable AurynUncoilLedger:{UncoilSchema})
  (deftable EliteAurynUncoilLedger:{UncoilSchema})

  (defschema BurnSchema
    @doc "Table counting the burned Ouroboros Amount"

    BurnedSnake:decimal
    RecycledAuryn:decimal
    RecycledEliteAuryn:decimal
    )

  (deftable BurningLedger:{BurnSchema})

  (defschema SupplySchema
    @doc "Table tracking supply amounts"

    Ouroboros:decimal
    Auryn:decimal
    EliteAuryn:decimal

    VestedOuroboros:decimal
    VestedAuryn:decimal
    VestedEliteAuryn:decimal

    Vesta:decimal
    SleepingVesta:decimal
    FrozenVesta:decimal

    Gold:decimal
    Unity:decimal
    Equity:decimal
    )

  (deftable SupplyLedger:{SupplySchema})
;;
;;
;;==============================================================================
;;
;;  PART B  - FUNCTIONS
;;
;;==============================================================================
;;No Tier Capabilities
;;INITIALISATION
;;==============================================================================
  (defun BirthSnakes ()
    @doc "Initialize the module the first time it is deployed \
    \ Initializes Tables that must have at least one entry \
    \ MASTERMINTER cap is required, which enforces the KEY_MINTER key"
    (with-capability (MASTERMINTER)
      (SpawnMintingCounter)
      (SpawnBurningCounter)
      (SpawnSupplyCounter)
    )
  )
  ;;
  (defun SpawnMintingCounter ()
    @doc "Initializes the Spawn Counter with double minus 1 \
    \ Double minus 1 means no mint has been executed yet \
    \ And is used to enforce Genesis Mint can only happen in this case \
    \ Each subsequent daily mint grows the values by 1. \
    \ Only MASTERMINTER can call this function. \
    \ It is called at contract initialization."
    (require-capability (MASTERMINTER))
    (insert SpawnCounterLedger SPAWN_COUNT {"spawncounter": -1, "spawnepoch": -1})
  )
  ;;
  (defun SpawnBurningCounter ()
    @doc "Initializes the BurningLedger which saves Burning Amount Data \
    \ Starting with zero accross the line \
    \ Its stored values grow as Tokens are Burned or Recycled \
    \ Ouroboros is burned, effectively reducing supply \
    \ Auryn and Elite-Auryn is recycled on burn events \
    \ Crediting them to different target destinations."
    (require-capability (MASTERMINTER))
    (insert BurningLedger BURN_COUNT
      {"BurnedSnake": 0.0
      ,"RecycledAuryn": 0.0
      ,"RecycledEliteAuryn": 0.0})
  )
  (defun SpawnSupplyCounter ()
    @doc "Initializes the SupplyLedger which saves Supply Amount Data \
    \ Starting with zero accross the line \
    \ Its stored values grow as Tokens are minted or burned"
    (require-capability (MASTERMINTER))
    (insert SupplyLedger SUPPLY_COUNT
      {"Ouroboros": 0.0
      ,"Auryn": 0.0
      ,"EliteAuryn": 0.0
      ,"VestedOuroboros": 0.0
      ,"VestedAuryn": 0.0
      ,"VestedEliteAuryn": 0.0
      ,"Vesta": 0.0
      ,"SleepingVesta": 0.0
      ,"FrozenVesta": 0.0
      ,"Gold": 0.0
      ,"Unity": 0.0
      ,"Equity": 0.0})
  )
;;
;;ENFORCING and VALIDATION
;;==============================================================================
  (defun EnforceSnakePrecision:bool (amount:decimal)
    @doc "For transacting purposes, make sure all amounts \
    \ have a maximum of 18 decimals"
    (enforce (= (floor amount MAXIMUM_SNAKE_PRECISION) amount)
      (format "Amount violates maximum precision: {}" [amount])
    )
  )
  ;;
  (defun ValidateAccount (account:string)
    @doc "Enforce that an account name conforms to the coin contract \
    \ minimum and maximum length requirements, as well as the \
    \ latin-1 character set."
    (Enforce-Latin-1 "Account" account)
    (Enforce-Length "Account" account MINIMUM_ACCOUNT_LENGTH MAXIMUM_ACCOUNT_LENGTH)
  )
  ;;
  (defun ValidateAccountForTransfers (account:string)
    @doc "01.00.6 - (007)ValidateAccountForTransfers \
    \ Enforce that an account name isnt an account torwards transfers arent allowed. \
    \ This accounts are bundled together with the \
    \ TransferBlacklist function. \
    \ These accounts are fuelled directly, and not via the transfer function."

    (let
      (
        (iztb:bool (contains account DH_ACCOUNTS_BL))
      )
      (enforce
        (= iztb false)
        (format "You cannot transfer to a blacklisted account")
      )
    )
  )
  ;;
  (defun ValidateSenderReceiverForTransfers (sender:string receiver:string)
    (ValidateAccountForTransfers sender)
    (ValidateAccountForTransfers receiver)
  )
  ;;
  (defun ValidateAccountWithTransferWithPosition (account:string position:integer)
    @doc "Executes a triple validation, for easier use \
    \ where such a triple validation is needed"

    (ValidateAccount account)
    (ValidateAccountForTransfers account)
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect!")
  )
  ;;
  (defun ValidateAccountWithAmountComplex (account:string amount:decimal ledger-type:string credit-or-debit:string)
    (EnforceCreditDebitLedgerString credit-or-debit ledger-type)
    (ValidateAccount account)
    (EnforceAmount amount)
  )
  ;;
  (defun ValidateAccountWithAmountSimple (account:string amount:decimal)
    (ValidateAccount account)
    (EnforceAmount amount)
  )
  ;;
  (defun EnforceAmount (amount:decimal)
    (enforce (> amount 0.0) "Amount must be positive and greater than zero!")
    (EnforceSnakePrecision amount)
  )
  ;;
  (defun EnforceBurningLedgerType (type:integer)
    (enforce (= (contains type TYPE_BURNING_LEDGER) true) "Type is not correctly set for the Burning Ledger!")
  )
  ;;
  (defun EnforceCreditDebitLedgerString:bool (credit-or-debit:string ledger-type:string)
    (let*
      (
        (t1:bool (EnforceCreditDebitString credit-or-debit))
        (t2:bool (EnforceLedgerString ledger-type))
        (t3:bool (and t1 t2))
      )
      (enforce (= t3 true) "Input strings are non-conform!")
      t3
    )
  )
  ;;
  (defun EnforceCreditDebitString:bool (credit-or-debit:string)
    (let*
      (
        (t1:bool (= credit-or-debit "Credit"))
        (t2:bool (= credit-or-debit "Debit"))
        (credit-or-debit-ok:bool (or t1 t2))
      )
      (enforce (= credit-or-debit-ok true) "Input Credit/Debit string is not-conform!")
      credit-or-debit-ok
    )
  )
  ;;
  (defun EnforceLedgerString:bool (ledger-type:string)
    (let*
      (
        (t1:bool (= ledger-type "Plebeic"))
        (t2:bool (= ledger-type "Baronic"))
        (iz-ledger-type-ok:bool (or t1 t2))
      )
      (enforce (= iz-ledger-type-ok true) "Input Ledger string is not-conform!")
      iz-ledger-type-ok
    )
  )
  (defun EnforcePositiveSupplyToken  (token:string)
    (enforce (= (contains token SUPPLY_LIST_PLUS) true) "Token string incorrect!")
  )
  (defun EnforceNegativeSupplyToken  (token:string)
    (enforce (= (contains token SUPPLY_LIST_MINUS) true) "Token string incorrect!")
  )
  (defun EnforceBurnToken  (token:string)
    (enforce (= (contains token BURN_TOKENS) true) "Token string incorrect!")
  )
  ;;
  (defun ValidateHerotag:bool (herotag:string account:string)
    @doc "Validates a HeroTag, what this means is following enforcements: \
    \ Latin-1 Charset ISO-8859-1 is enforced \
    \ Min and Max Herotag Length is enforced \
    \ HT Syntax is enforced \
    \ Uniqueness is enforced"
    ;;Part1 - Enforce the Latin-1 Charset ISO-8859-1
    (Enforce-Latin-1 "Herotag" herotag)
    ;;Part 2 - Enforce Hero Tag length
    (Enforce-Length "Herotag" herotag MINIMUM_HEROTAG_LENGTH MAXIMUM_HEROTAG_LENGTH)
    ;;Part 3 - Enforce HT SYNTAX
    (Enforce-HT-Syntax herotag account)
    ;;Part 4 - Enforce HT Uniqueness
    (Enforce-HT-Uniqueness herotag)
  )
  ;;
  (defun Enforce-HT-Syntax (herotag:string account:string)
    @doc "Enforces Herotag Syntax, what this means: \
    \ All Herotags must start with the <@> character \
    \ Demiourgos Holdings based accounts must start with <@DH©>"
    (let*
      (
        (first (take 1 herotag))
        (five (take 5 herotag))
        (four (take -4 five))
        (izdh:bool (contains account DH_ACCOUNTS))
      )
      (enforce (= first "@") "Herotag must start with the @ Character")
      (if (= izdh true)
        (enforce
          (= four "DH©.")
          (format "Demiourgos.Holdings Acounts must start with @DH©.")
        )
        "No Herotag Naming Restrictions"
      )
    )
  )
  ;;
  (defun Enforce-HT-Uniqueness (herotag:string)
    @doc "Enforces that the HeroTag is unique."

    (let
      (
        (truth:bool (contains herotag (ListBaronicColumn "ATHT")))
      )
      (enforce (= truth false) "The Herotag must be unique")
    )
  )
  ;;
  (defun Enforce-Latin-1 (testname:string teststring:string)
    @doc "Enforces the Latin-1 Charset ISO-8859-1"
    (enforce
      (is-charset CHARSET_LATIN1 teststring)
      (format "{} does not conform to the Latin-1 charset ISO-8859-1: {}" [testname teststring])
    )
  )
  ;;
  (defun Enforce-Length (testname:string teststring:string min:integer max:integer)
    @doc "Enforce a min and max length for a test-string \
    \ where <testname> is the name of the string."
    (let
      (
        (string-length (length teststring))
      )
      (enforce
        (>= string-length min )
        (format "{} name does not conform to the min length requirement: {}" [testname teststring])
      )
      (enforce
        (<= string-length max)
        (format "{} name does not conform to the max length requirement: {}" [testname teststring])
      )
    )
  )
  ;;
  (defun EnforcePlebeicTokenType (type:integer)
    (enforce (= (contains type TYPE_PLEBEIC_TOKEN) true) "Type doesnt correspond to a Plebeic Token!")
  )
  ;;
  (defun EnforceBaronicCreditTokenType (type:integer)
    (enforce (= (contains type TYPE_BARONIC_TOKEN) true) "Type doesnt correspond to a Baronic Token!")
  )
  ;;
  (defun EnforceBaronicDebitTokenType (type:integer)
    (enforce (= (contains type TYPE_DBARONIC_TOKEN) true) "Type doesnt correspond to a Baronic Debit Token!")
  )
  ;;
  (defun enforce-reserved:bool (account:string guard:guard)
    @doc "Enforce reserved account name protocols. \
    \ Checks if validate-principal function is true \
    \ Coin contract uses it in <create-account>, <transfer> and <credit> functions. \
    \ Doesnt seem to be needed here."
    (if (validate-principal guard account)
      true
      (let
        (
          (r (check-reserved account))
        )
        (if (= r "")
          true
          (if (= r "k")
            (enforce false "Single-key account protocol violation")
            (enforce false (format "Reserved protocol guard violation: {}" [r]))
          )
        )
      )
    )
  )
  ;;
  (defun check-reserved:string (account:string)
    @doc "Checks ACCOUNT for reserved name and returns type if \
    \ found or empty string. Reserved names start with a \
    \ single char and colon, e.g. 'c:foo', which would return 'c' as type. \
    \ for k:xxx acounts returns <k>, for non k:xxx accounts returns <>(empty string)"
    (let
      (
        (pfx (take 2 account))
      )
      (if (= ":" (take -1 pfx)) (take 1 pfx) "")
    )
  )
;;
;;LISTS
;;==============================================================================
  (defun HighestDoubleTruth:integer (truthlist:[bool])
    @doc "Outputs the position of the highest boolean true, \
    \ from a list of 2 boolean elements."

    (enforce (= (length truthlist) 2) "List is not 2 units big!")
    (let*
      (
        (inv (reverse truthlist))
        (value
          (cond
            ((= (at 0 inv) true) 1)
            ((= (at 1 inv) true) 2)
            3
          )
        )
      )
      (- 3 value)
    )
  )
  ;;
  (defun  HighestTripleTruth:integer (truthlist:[bool])
    @doc "Outputs the position of the highest boolean true, \
    \ from a list of 3 boolean elements."

    (enforce (= (length truthlist) 3) "List is not 3 units big!")
    (let*
      (
        (inv (reverse truthlist))
        (value
          (cond
            ((= (at 0 inv) true) 1)
            ((= (at 1 inv) true) 2)
            ((= (at 2 inv) true) 3)
            4
          )
        )
      )
      (- 4 value)
    )
  )
  ;;
  (defun  HighestQuadTruth:integer (truthlist:[bool])
    @doc "Outputs the position of the highest boolean true, \
    \ from a list of 4 boolean elements."

    (enforce (= (length truthlist) 4) "List is not 4 units big!")
    (let*
      (
        (inv (reverse truthlist))
        (value
          (cond
            ((= (at 0 inv) true) 1)
            ((= (at 1 inv) true) 2)
            ((= (at 2 inv) true) 3)
            ((= (at 3 inv) true) 4)
            5
          )
        )
      )
      (- 5 value)
    )
  )
  ;;
  (defun  HighestPentaTruth:integer (truthlist:[bool])
    @doc "Outputs the position of the highest boolean true, \
    \ from a list of 5 boolean elements."

    (enforce (= (length truthlist) 5) "List is not 5 units big!")
    (let*
      (
        (inv (reverse truthlist))
        (value
          (cond
            ((= (at 0 inv) true) 1)
            ((= (at 1 inv) true) 2)
            ((= (at 2 inv) true) 3)
            ((= (at 3 inv) true) 4)
            ((= (at 4 inv) true) 5)
            6
          )
        )
      )
      (- 6 value)
    )
  )
  ;;
  (defun  HighestHexaTruth:integer (truthlist:[bool])
    @doc "Outputs the position of the highest boolean true, \
    \ from a list of 6 boolean elements."

    (enforce (= (length truthlist) 6) "List is not 6 units big!")
    (let*
      (
        (inv (reverse truthlist))
        (value
          (cond
            ((= (at 0 inv) true) 1)
            ((= (at 1 inv) true) 2)
            ((= (at 2 inv) true) 3)
            ((= (at 3 inv) true) 4)
            ((= (at 4 inv) true) 5)
            ((= (at 5 inv) true) 6)
            7
          )
        )
      )
      (- 7 value)
    )
  )
  ;;
  (defun  HighestHeptaTruth:integer (truthlist:[bool])
    @doc "Outputs the position of the highest boolean true, \
    \ from a list of 7 boolean elements."

    (enforce (= (length truthlist) 7) "List is not 7 units big!")
    (let*
      (
        (inv (reverse truthlist))
        (value
          (cond
            ((= (at 0 inv) true) 1)
            ((= (at 1 inv) true) 2)
            ((= (at 2 inv) true) 3)
            ((= (at 3 inv) true) 4)
            ((= (at 4 inv) true) 5)
            ((= (at 5 inv) true) 6)
            ((= (at 6 inv) true) 7)
            8
          )
        )
      )
      (- 8 value)
    )
  )
;;
;;IZ FUNCTIONS
;;==============================================================================
  (defun IzUncoilLedgerPositionFree:bool (account:string position:integer truth:bool)
    @doc "Checks if the given position for the account is free on \
    \ the either the Auryn or the Elite-Auryn Uncoil Ledger. \
    \ Switch between the 2 Ledger is done via the <truth> variable \
    \ <truth> = false ==> Auryn Uncoil Ledger \
    \ <truth> = true ==> Elite-Auryn Uncoil Ledger \
    \ Free means an uncoil could be executed on the position, \
    \ as such it returns <true> if position is neither occupied, nor locked."
    (ValidateAccountWithTransferWithPosition account position)
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect! [IzUncoilLedgerPositionFree]")
    (let
      (
        (a:decimal (at 0 (GetUncoilLedgerPositionData account position truth)))
        (e:integer (at 1 (GetUncoilLedgerPositionData account position truth)))
      )
      (if (and (= a 0.0) (= e 0)) true false)
    )
  )
  ;;
  (defun IzUncoilLedgerPositionOccupied:bool (account:string position:integer truth:bool)
    @doc "Checks if the given position for the account is occupied on \
    \ the either the Auryn or the Elite-Auryn Uncoil Ledger. \
    \ Switch between the 2 Ledger is done via the <truth> variable \
    \ <truth> = false ==> Auryn Uncoil Ledger \
    \ <truth> = true ==> Elite-Auryn Uncoil Ledger \
    \ Occupied means an uncoil is ongoing, \
    \ as such it returns <true> if position is neither free, nor locked."
    (ValidateAccountWithTransferWithPosition account position)
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect! [IzUncoilLedgerPositionOccupied]")
    (let
      (
        (a:decimal (at 0 (GetUncoilLedgerPositionData account position truth)))
        (e:integer (at 1 (GetUncoilLedgerPositionData account position truth)))
      )
      (if (and (> a 0.0) (> e 0)) true false)
    )
  )
  ;;
  (defun IzUncoilLedgerPositionLocked:bool (account:string position:integer)
    @doc "Checks if the given position for the account is locked on \
    \ the Elite-Auryn Uncoil Ledger. \
    \ Switch between the 2 Ledger is done via the <truth> variable \
    \ <truth> = false ==> Auryn Uncoil Ledger \
    \ <truth> = true ==> Elite-Auryn Uncoil Ledger \
    \ Locked means Elite-Account Tier is not high enough \
    \ for the position to be usable for Elite-Auryn uncoiling, \
    \ as such it returns <true> if position is neither free, nor locked."
    (ValidateAccountWithTransferWithPosition account position)
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect! [IzUncoilLedgerPositionLocked]")
    (let
      (
        (a:decimal (at 0 (GetUncoilLedgerPositionData account position true)))
        (e:integer (at 1 (GetUncoilLedgerPositionData account position true)))
      )
      (if (and (= a -1.0) (= e -1)) true false)
    )
  )
  ;;
  (defun IzUncoilLedgerPositionWhat:integer (account:string position:integer truth:bool)
    @doc "Return the type that position currently has, the types are \
    \ Type = -1, means the position is locked (only Elite-Auryn Uncoil Positions can be locked) \
    \ Type = 0, means the position is unlocked and free, ready to be used for uncoiling \
    \ Type = 1, mean the position is occupied with an ongoing uncoiling"
    (ValidateAccountWithTransferWithPosition account position)
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect! [IzUncoilLedgerPositionWhat]")
    (cond
      ((= (IzUncoilLedgerPositionFree account position truth) true) 0)
      ((= (IzUncoilLedgerPositionOccupied account position truth) true) 1)
      -1
    )
  )
  ;;
  (defun IzIntegerUncoilPosition:bool (position:integer)
    @doc "Given an integer number \
    \ Checks if this number is valid in representing an Uncoil Position \
    \ Valid integer are 1 2 3 4 5 6 and 7 \
    \ Any other integers numbers would return false. \
    \ It usage is in enforcing the result to be <true>."
    (contains position (enumerate 1 7))
  )
;;
;;MATH FUNCTIONS
;;==============================================================================
  (defun Truncate:decimal (amount:decimal decimals:integer)
    (floor amount decimals)
  )
  ;;
  (defun TruncateToSnake (amount:decimal)
    (Truncate amount MAXIMUM_SNAKE_PRECISION)
  )
  ;;
  (defun TruncateToUnity (amount:decimal)
    (Truncate amount UNITY_PRECISION)
  )
  ;;
  (defun ComputeDailySpawnAmount ()
    @doc "Outputs the daily Ouroboros Mint Issuance \
    \ Equals 10.000th of the difference between \
    \ Maximum theorethical Supply and Current actual Supply."

    (let
      (
        (x:decimal (GetSupply "Ouroboros"))
        (y:decimal CEILING)
      )
      (floor (/ (- y x) MINT_SPEED) MAXIMUM_SNAKE_PRECISION)
    )
  )
  ;;
  (defun GetAuryndex:decimal ()
    @doc "Computes the current Auryndex \
    \ Auryndex is the Index that indexes Auryn in Ouroboros. \
    \ Auryndes = Ouroboros Amount in Autostake pool \
    \ divided by the total Auryn amount. \
    \ It starts as 1.0 and becomes Supraunitary growing with a iota daily."

    (with-read BaronicSnakeLedger AUTO_STAKING
      { "Ouroboros" := x }
      (let
        (
          (y:decimal (GetSupply "Auryn"))
        )
        (if (or (= x y) (= y 0.0))
          (TruncateToSnake 1.0)
          (TruncateToSnake (/ x y))
        )
      )
    )
  )

  (defun TestFunction ()
    (select BaronicSnakeLedger (where "EliteAccountName" (= "Mogul")))
  )


  (defun MakePercent:decimal (amount:decimal percent:decimal)
    @doc "Given a number and a percent \
    \ Outputs said percent in absolute value \
    \ From the given Number "

    (enforce (> amount 0.0) "Positive amount")
    (TruncateToSnake (* amount (/ percent 100.0)) )
  )
  ;;
  (defun MakePermille:decimal (amount:decimal permille:decimal)
    @doc "Given a number and a permille \
    \ Outputs said permille in absolute value \
    \ From the given Number "

    (enforce (> amount 0.0) "Positive amount")
    (TruncateToSnake (* amount (/ permille 1000.0)))
  )
  ;;-----
  (defun TierName:string (input:decimal)
    @doc "Computes TierName as string using a decimal input."
    (enforce (>= input 0.0) "Input Decimal must be positive")
    (cond
      ((= input 0.0) TIERN)
      ((< input 500.0) TIER0)
      ((< input 1000.0) TIER1)
      ((< input 2000.0) TIER2)
      ((< input 5000.0) TIER3)
      ((< input 10000.0) TIER4)
      ((< input 20000.0) TIER5)
      ((< input 50000.0) TIER6)
      TIER7)
  )
  ;;
  (defun Tier:integer (input:decimal)
    @doc "Computes Elite Account Tier as integer using decimal input."
    (enforce (>= input 0.0) "Input Decimal must be positive")
    (cond
      ((= input 0.0) NTIERN)
      ((< input 500.0) NTIER0)
      ((< input 1000.0) NTIER1)
      ((< input 2000.0) NTIER2)
      ((< input 5000.0) NTIER3)
      ((< input 10000.0) NTIER4)
      ((< input 20000.0) NTIER5)
      ((< input 50000.0) NTIER6)
      NTIER7)
  )
  ;;
  (defun TierBoost:decimal (input:decimal)
    @doc "Computes Elite ccount Tier Boost as decimal using decimal input"
    (enforce (>= input 0.0) "Input Decimal must be positive")
    (cond
      ((= input 0.0) TB_INFIDEL)
      ((< input 500.0) (+ 1.0 (/ (floor input 0) 10000.0)))
      ((< input 1000.0) TB_PARTNER)
      ((< input 2000.0) TB_INVESTOR)
      ((< input 5000.0) TB_ENTREPRENEUR)
      ((< input 10000.0) TB_BARON)
      ((< input 20000.0) TB_MOGUL)
      ((< input 50000.0) TB_MAGNATE)
      TB_DEMIURG
    )
  )
  ;;-----
  (defun GetAurynUncoilFee:integer (amount:decimal position:integer)
    @doc "Outputs the Auryn Uncoil fee based on uncoil amount and position"
    ;;Enforces that only positions 1 through 7 may be used as input
    (enforce (> amount 0.0) "Positive amount")
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect")
    (if (< amount 50.0) (+ 7 position)
      (if (< amount 100.0) (+ 6 position)
        (if (< amount 200.0) (+ 5 position)
          (if (< amount 350.0) (+ 4 position)
            (if (< amount 550.0) (+ 3 position)
              (if (< amount 800.0) (+ 2 position) (+ position 1))
            )
          )
        )
      )
    )
  )
  ;;
  (defun GetAurynUncoilTime:integer (account:string)
    @doc "Outputs the Auryn Uncoil time, which is dependent on Elite Account Tier"
    (let
      (
        (t:integer (at 15 (GetAllBaronicBalances account)))
      )
      (cond
        ((or (= t NTIERN) (= t NTIER0)) AURYN_UT_0)
        ((= t NTIER1) AURYN_UT_1)
        ((= t NTIER2) AURYN_UT_2)
        ((= t NTIER3) AURYN_UT_3)
        ((= t NTIER4) AURYN_UT_4)
        ((= t NTIER5) AURYN_UT_5)
        ((= t NTIER6) AURYN_UT_6)
        AURYN_UT_7
      )
    )
  )
  ;;
  (defun GetEliteAurynUncoilTimeByAmount:integer (amount:decimal)
    @doc "Outputs the Elite Auryn Uncoil time, uses artificial amount as input. \
    \ The usage of artificial Amount is because the time must be computed with \
    \ the subtraction of Elite-Auryn in mind (Uncoil Elite-Auryn.)"

    (let
      (
        (t:integer (Tier amount))
      )
      (cond
        ((or (= t NTIERN) (= t NTIER0)) EAURYN_UT_0)
        ((= t NTIER1) EAURYN_UT_1)
        ((= t NTIER2) EAURYN_UT_2)
        ((= t NTIER3) EAURYN_UT_3)
        ((= t NTIER4) EAURYN_UT_4)
        ((= t NTIER5) EAURYN_UT_5)
        ((= t NTIER6) EAURYN_UT_6)
        EAURYN_UT_7
      )
    )
  )
;;
;;ACCOUNT MANAGEMENT
;;==============================================================================
  (defun SpawnSnakeAccount:string (account:string guard:guard herotag:string)
    @doc "Initializez a blank Snake Account  \
    \ Adding entries to the Plebeic and Baronic Ledgers \
    \ but also to the Uncoil Ledgers. "

    @model [(property (valid-account account))]

    (ValidateAccount account)
    ;(enforce-reserved account guard)
    (ValidateHerotag herotag account)

    ;;Enforces that Account doesnt exist
    (with-capability (IZSNAKE account false)
      (insert PlebeicSnakeLedger account
        {"Guard"   : guard
        ,"Ouroboros" : 0.0
        ,"Auryn" : 0.0
        ,"EliteAuryn" : 0.0
        ,"Vesta" : 0.0
        ,"Gold" : 0.0
        ,"Unity" : 0.0
        }
      )

      (insert AurynUncoilLedger account
        {"P1A" : 0.0
        ,"P2A" : 0.0
        ,"P3A" : 0.0
        ,"P4A" : 0.0
        ,"P5A" : 0.0
        ,"P6A" : 0.0
        ,"P7A" : 0.0
        ,"P1E" : 0
        ,"P2E" : 0
        ,"P3E" : 0
        ,"P4E" : 0
        ,"P5E" : 0
        ,"P6E" : 0
        ,"P7E" : 0
        }
      )

      (insert EliteAurynUncoilLedger account
        {"P1A" : 0.0
        ,"P2A" : -1.0
        ,"P3A" : -1.0
        ,"P4A" : -1.0
        ,"P5A" : -1.0
        ,"P6A" : -1.0
        ,"P7A" : -1.0
        ,"P1E" : 0
        ,"P2E" : -1
        ,"P3E" : -1
        ,"P4E" : -1
        ,"P5E" : -1
        ,"P6E" : -1
        ,"P7E" : -1
        }
      )

      (insert BaronicSnakeLedger account
        {"Age":0
        ,"ATHT" : herotag
        ,"HTU" : 0

        ,"Ouroboros" : 0.0
        ,"Auryn" : 0.0
        ,"EliteAuryn" : 0.0

        ,"VestedOuroboros" : 0.0
        ,"VestedAuryn" : 0.0
        ,"VestedEliteAuryn" : 0.0

        ,"EliteAccountName" : (TierName 0.0)
        ,"EliteAccountTier" : (Tier 0.0)
        ,"EliteAccountBoost" : (TierBoost 0.0)

        ,"BurnedOuroboros" : 0.0
        ,"BurnedOuroborosViaAutostake" : 0.0
        ,"RecycledAuryn" : 0.0
        ,"RecycledEliteAuryn" : 0.0

        ,"Vesta" : 0.0
        ,"SleepingVesta" : 0.0
        ,"FrozenVesta" : 0.0

        ,"Gold" : 0.0
        ,"Unity" : 0.0
        ,"Equity" : 0.0
        }
      )
    )
  )
  ;;
  (defun RotateSnakeGuard:string (account:string new-guard:guard)
    @doc "Rotates Snake Account Guard "

    (with-capability (ROTATE account)
      (with-read PlebeicSnakeLedger account
        { "Guard" := old-guard }

        (enforce-guard old-guard)

        (update PlebeicSnakeLedger account
          { "Guard" : new-guard }
        )
      )
    )
  )
  ;;
  (defun UpdateSnakeAccountHeroTag (account:string guard:guard new-herotag:string)
    @doc "Main Function that must be called to update Herotag\
    \ Protected bz NEWHEROTAG capability, which is composed with the DEBIT cap \
    \ Because the second HT change costs 5 Ouroboros which is burned."
    (ValidateAccount account)
    ;(enforce-reserved account guard)
    (with-capability (NEWHEROTAG account)
      (UpdateHeroTag account guard new-herotag)
    )
  )
  ;;
  (defun UpdateHeroTag (account:string guard:guard new-herotag:string)
    @doc "Core Function that is called to update Herotag \
    \ Cannot be used directly because it requires the NEWHEROTAG cap."
    ;;DH© Starting Herotags cannot be changed.
    (let
      (
        (izdh:bool (contains account DH_ACCOUNTS))
      )
      (enforce (= izdh false) "Demiourgos.Holdings Accounts cannot update their Herotags")
    )
    (require-capability (NEWHEROTAG account))
    (with-read BaronicSnakeLedger account
      { "ATHT" := ht , "HTU" := u}
      (enforce (!= ht new-herotag) "New Herotag Must be different than the last HeroTag")
      (ValidateHerotag new-herotag account)
      (if (>= u 1)
        (BurnOuroboros account HEROTAG_UPDATE_PRICE)
        "First Herotag update is free!"
      )
      (update BaronicSnakeLedger account
        { "ATHT" : new-herotag
          , "HTU" : (+ u 1)}
      )
    )
  )
  ;;
  (defun UpdateAllSnakeAccountAge ()
    (require-capability (UPDATE-ALL_AGE))
    (map
      (lambda
        (ac:string)
        (UpdateSnakeAccountAge ac)
      )
      (keys BaronicSnakeLedger)
    )
  )
  ;;
  (defun UpdateSnakeAccountAge (account:string)
    @doc "With each daily mint, all accounts age. \
    \ Age is incremented by 1 with each daily mint event, \
    \ as such the daily mint event acts as the age change event."
    (require-capability (UPDATE_AGE))
    (with-read BaronicSnakeLedger account
      { "Age" := a }
      (update BaronicSnakeLedger account
        { "Age" : (+ a 1)}
      )
    )
  )
;;
;;==============================================================================
;;SNAPSHOTS
;;[BurnLedger]
;;==============================================================================
(defun GetBurnSupply (token:string)
  (EnforceBurnToken token)
  (with-read BurningLedger BURN_COUNT
    { token:= supply }
    supply
  )
)
;;
;;[SpawnLedger]
;;==============================================================================
  (defun GetSpawnCounter ()
    @doc "Outputs the spawncounter from the Spawn Count Ledger"
    (with-read SpawnCounterLedger SPAWN_COUNT
      { "spawncounter":= number }
      number
    )
  )
  (defun GetSpawnEpoch ()
    @doc "Outputs the spawnepoch from the Spawn Count Ledger"
    (with-read SpawnCounterLedger SPAWN_COUNT
      { "spawnepoch":= number }
      number
    )
  )
;;
;;[SUPPLY]
;;==============================================================================
  (defun GetSupply (token:string)
    (EnforcePositiveSupplyToken token)
    (with-read SupplyLedger SUPPLY_COUNT
      { token:= supply }
      supply
    )
  )
  ;;----------------------------------------------------------------------------
  ;;
  (defun OuroborosSupplyLiquid ()
    @doc "Outputs the total Unvested Ouroboros Amount; Used for displaying purposes."
    (- (GetSupply "Ouroboros") (at 5 (GetAllBaronicBalances VESTING_HOLD)))
  )

  (defun AurynSupplyLiquid ()
    @doc "Outputs the total Unvested Auryn Amount; Used for displaying purposes."
    (- (GetSupply "Auryn") (at 9 (GetAllBaronicBalances VESTING_HOLD)))
  )

  (defun EliteAurynSupplyLiquid ()
    @doc "Outputs the total Unvested Elite-Auryn Amount; Used for displaying purposes."
    (- (GetSupply "EliteAuryn") (at 12 (GetAllBaronicBalances VESTING_HOLD)))
  )

  (defun VestaSupplyLiquid ()
    @doc "Outputs the total Unvested Elite-Auryn Amount; Used for displaying purposes."
    (- (GetSupply "Vesta") (GetSupply "SleepingVesta"))
  )
;;
;;[UncoilLedgers]
;;==============================================================================
  (defun GetUncoilLedgerPositionData (account:string position:integer truth:bool)
    @doc "Outputs either the Auryn or Elite-Auryn Uncoil Ledger Position Data \
    \ Switch between the 2 Ledger is done via the <truth> variable \
    \ <truth> = false ==> Auryn Uncoil Ledger \
    \ <truth> = true ==> Elite-Auryn Uncoil Ledger \

    \ Values = -1, means the position is locked (only Elite-Auryn Uncoil Positions can be locked) \
    \ Values = 0, means the position is unlocked and free, ready to be used for uncoiling \
    \ Values > 0, mean the position is occupied with an ongoing uncoiling and the \
    \ outputted values are the amount saved and its expiring epoch."

    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect")

    (if (= truth true)
      (with-read EliteAurynUncoilLedger account
        { "P1A" := a1, "P2A" := a2, "P3A" := a3, "P4A" := a4, "P5A" := a5, "P6A" := a6, "P7A" := a7,
          "P1E" := e1, "P2E" := e2, "P3E" := e3, "P4E" := e4, "P5E" := e5, "P6E" := e6, "P7E" := e7}
        (cond
          ((= position 1) [a1,e1])
          ((= position 2) [a2,e2])
          ((= position 3) [a3,e3])
          ((= position 4) [a4,e4])
          ((= position 5) [a5,e5])
          ((= position 6) [a6,e6])
          [a7,e7]
        )
      )
      (with-read AurynUncoilLedger account
        { "P1A" := a1, "P2A" := a2, "P3A" := a3, "P4A" := a4, "P5A" := a5, "P6A" := a6, "P7A" := a7,
          "P1E" := e1, "P2E" := e2, "P3E" := e3, "P4E" := e4, "P5E" := e5, "P6E" := e6, "P7E" := e7}
        (cond
          ((= position 1) [a1,e1])
          ((= position 2) [a2,e2])
          ((= position 3) [a3,e3])
          ((= position 4) [a4,e4])
          ((= position 5) [a5,e5])
          ((= position 6) [a6,e6])
          [a7,e7]
        )
      )
    )
  )
;;
;;[Plebeic/Baronic-Ledgers]
;;==============================================================================
  (defun GetAllBaronicBalances (account:string)
    (ValidateAccount account)
    (with-read BaronicSnakeLedger account
        { "Age" := age, "ATHT" := htg, "HTU" := htu,
          "Ouroboros" := o, "Auryn" := a, "EliteAuryn" := ea,
          "VestedOuroboros" := vo, "VestedAuryn" := va, "VestedEliteAuryn" := vea,
          "EliteAccountName" := e-name, "EliteAccountTier" := e-tier, "EliteAccountBoost" := eboost,
          "BurnedOuroboros" := bo, "BurnedOuroborosViaAutostake" := bova, "RecycledAuryn" := ra, "RecycledEliteAuryn" := rea,
          "Vesta" := v, "SleepingVesta" := sv, "FrozenVesta" := fv,
          "Gold" := g, "Unity" := u, "Equity" := e}

        (let*
          (
            (to:decimal (+ o vo))
            (ta:decimal (+ a va))
            (tea:decimal (+ ea vea))
            (gta:decimal (+ ta tea))
            (auryndex:decimal (GetAuryndex))
            (tato:decimal (TruncateToSnake (* auryndex gta)))
            (gtow:decimal (+ to tato))
            (tplv:decimal (+ v sv))
            (gtv:decimal (+ fv tplv))
            (tbo:decimal (+ bo bova))
          )
          [ age   ;;[ 0] Account age
            htg   ;;[ 1] Acount Herotag
            htu   ;;[ 2] The number of times the herotag has been updated
            gtow  ;;[ 3] Grand Total Worh in Ouroboros for the Account
            to    ;;[ 4] Total Ouroboros (Ouroboros plus VestedOuroboros)
            o     ;;[ 5] Liquid Ouroboros available on the Account
            vo    ;;[ 6] Iliquid Ouroboros available on the Account
            gta   ;;[ 7] Grand Total Auryn value in Acount
            ta    ;;[ 8] Total Auryn amount available on Account
            a     ;;[ 9] Liquid Auryn available or the Account
            va    ;;[10] Iliquid Auryn available or the Account
            tea   ;;[11] Total Elite-Auryn amount available on Account
            ea    ;;[12] Liquid Elite-Auryn available or the Account
            vea   ;;[13] Iliquid Elite-Auryn available or the Account
            e-name;;[14] Elite Account Tier Name
            e-tier;;[15] Elite Account Tier
            eboost;;[16] Elite Account Tier TierBoost
            tbo   ;;[17] Total Amount of Oroboros burned by Account
            bo    ;;[18] Amount of Ouroboros buned by Account.
            bova  ;;[19] Amount of Ourobros burned by Account by specifically Unccoiling Auryn
            ra    ;;[20] Amount of Auryn recycled by the Account
            rea   ;;[21] Amount of Elite-Auryn recycled by the Account
            gtv   ;;[22] Grand Total Vesta Amount owned by the Account
            tplv  ;;[23] Total Potential Liquid Vesta owned by the Account
            v     ;;[24] Amount of Liquid Vesta owned by the Account
            sv    ;;[25] Amount of Iliquid Vesta (Sleeping Vesta) owned by the Account
            fv    ;;[26] Amount of locked Vesta (Frozen Vesta) earned by the Account
            g     ;;[27] Amount of Gold owned by the Account
            u     ;;[28] Amount of Unity owned by the Account
            e     ;;[29] Amount of Equity earned by the Account
          ]
        )
      )
  )
  ;;
  (defun SnapshotBaronicColumn (column:string)
    @doc "Snapshots a given column fom the Baronic Snake Ledger \
    \ Outputting a list of lists with the items of every key."

    (let*
      (
        (qry
          (lambda (k BSLO)
            true
          )
        )
        (f
          (lambda (k BSLO)
            [ (at column BSLO) ]
          )
        )
      )
      (fold-db BaronicSnakeLedger (qry) (f))
    )
  )
  ;;
  (defun ListBaronicColumn (column:string)
    @doc "Makes a list of the specified column from the Baronic Snake Ledger"
    (let
      (
        (x (SnapshotBaronicColumn column))
      )
      (map
        (lambda
          (y)
          (at 0 y)
        )
        x
      )
    )
  )
;;
;;==============================================================================
;;UPDATE LEDGERS
;;[BurnLedger]
;;==============================================================================
  (defun DirectBurningLedgerCredit (amount:decimal type:integer)
    (EnforceAmount amount)
    (EnforceBurningLedgerType type)
    (require-capability (DIRECT_BURN))
    (if (= type 1) (BurnedSnakePlus amount)
      (if (= type 2) (RecycledAurynPlus amount)
        (RecycledEliteAurynPlus amount)
      )
    )
  )
  (defun BurnedSnakePlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (RAW_BURN))
    (with-read BurningLedger BURN_COUNT
      { "BurnedSnake" := current-supply }
      (update BurningLedger BURN_COUNT { "BurnedSnake" : (+ current-supply amount)})
    )
  )
  (defun RecycledAurynPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (RAW_BURN))
    (with-read BurningLedger BURN_COUNT
      { "RecycledAuryn" := current-supply }
      (update BurningLedger BURN_COUNT { "RecycledAuryn" : (+ current-supply amount)})
    )
  )
  (defun RecycledEliteAurynPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (RAW_BURN))
    (with-read BurningLedger BURN_COUNT
      { "RecycledEliteAuryn" := current-supply }
      (update BurningLedger BURN_COUNT { "RecycledEliteAuryn" : (+ current-supply amount)})
    )
  )
;;
;;[SupplyLedger]
;;==============================================================================
;;
  (defun UpdateSupply (token:string amount:decimal direction:bool)
    (EnforcePositiveSupplyToken token)
    (EnforceAmount amount)
    (if (= direction true)
      (IncreaseSupply token amount)
      (DecreaseSupply token amount)
    )
  )
  ;;----------------------------------------------------------------------------
  (defun IncreaseSupply (token:string amount:decimal)
    (EnforcePositiveSupplyToken token)
    (if (= token "Ouroboros") (OuroborosPlus amount)
      (if (= token "Auryn") (AurynPlus amount)
        (if (= token "EliteAuryn") (EliteAurynPlus amount)
          (if (= token "VestedOuroboros") (VestedOuroborosPlus amount)
            (if (= token "VestedAuryn") (VestedAurynPlus amount)
              (if (= token "VestedEliteAuryn") (VestedEliteAurynPlus amount)
                (if (= token "Vesta") (VestaPlus amount)
                  (if (= token "SleepingVesta") (SleepingVestaPlus amount)
                    (if (= token "FrozenVesta") (FrozenVestaPlus amount)
                      (if (= token "Gold") (GoldPlus amount)
                        (if (= token "Unity") (UnityPlus amount)
                          (EquityPlus amount)
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun OuroborosPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Ouroboros" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "Ouroboros" : (+ current-supply amount)})
    )
  )
  (defun AurynPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Auryn" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "Auryn" : (+ current-supply amount)})
    )
  )
  (defun EliteAurynPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "EliteAuryn" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "EliteAuryn" : (+ current-supply amount)})
    )
  )
  ;;
  (defun VestedOuroborosPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "VestedOuroboros" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "VestedOuroboros" : (+ current-supply amount)})
    )
  )
  (defun VestedAurynPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "VestedAuryn" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "VestedAuryn" : (+ current-supply amount)})
    )
  )
  (defun VestedEliteAurynPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "VestedEliteAuryn" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "VestedEliteAuryn" : (+ current-supply amount)})
    )
  )
  ;;
  (defun VestaPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Vesta" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "Vesta" : (+ current-supply amount)})
    )
  )
  (defun SleepingVestaPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "SleepingVesta" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "SleepingVesta" : (+ current-supply amount)})
    )
  )
  (defun FrozenVestaPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "FrozenVesta" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "FrozenVesta" : (+ current-supply amount)})
    )
  )
  ;;
  (defun GoldPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Gold" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "Gold" : (+ current-supply amount)})
    )
  )
  (defun UnityPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Unity" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "Unity" : (+ current-supply amount)})
    )
  )
  (defun EquityPlus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Equity" := current-supply }
      (update SupplyLedger SUPPLY_COUNT { "Equity" : (+ current-supply amount)})
    )
  )
  ;;
  ;;----------------------------------------------------------------------------
  (defun DecreaseSupply (token:string amount:decimal)
    (EnforceNegativeSupplyToken token)
    (if (= token "Ouroboros") (OuroborosMinus amount)
      (if (= token "Auryn") (AurynMinus amount)
        (if (= token "EliteAuryn") (EliteAurynMinus amount)
          (if (= token "VestedOuroboros") (VestedOuroborosMinus amount)
            (if (= token "VestedAuryn") (VestedAurynMinus amount)
              (if (= token "VestedEliteAuryn") (VestedEliteAurynMinus amount)
                (if (= token "SleepingVesta") (SleepingVestaMinus amount)
                  (GoldMinus amount)
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun OuroborosMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Ouroboros" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "Ouroboros" : (- current-supply amount)})
    )
  )
  (defun AurynMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Auryn" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "Auryn" : (- current-supply amount)})
    )
  )
  (defun EliteAurynMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "EliteAuryn" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "EliteAuryn" : (- current-supply amount)})
    )
  )
  ;;
  (defun VestedOuroborosMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "VestedOuroboros" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "VestedOuroboros" : (- current-supply amount)})
    )
  )
  (defun VestedAurynMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "VestedAuryn" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "VestedAuryn" : (- current-supply amount)})
    )
  )
  (defun VestedEliteAurynMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "VestedEliteAuryn" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "VestedEliteAuryn" : (- current-supply amount)})
    )
  )
  ;;
  (defun SleepingVestaMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "SleepingVesta" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "SleepingVesta" : (- current-supply amount)})
    )
  )
  (defun GoldMinus (amount:decimal)
    (EnforceAmount amount)
    (require-capability (UPDATE_SUPPLY))
    (with-read SupplyLedger SUPPLY_COUNT
      { "Gold" := current-supply }
      (enforce (<= amount current-supply) "Total supply cannot be drained into the negatives")
      (update SupplyLedger SUPPLY_COUNT { "Gold" : (- current-supply amount)})
    )
  )
;;
;;[UncoilLedgers]
;;==============================================================================
;;
  (defun UpdateUncoilLedgerDataIncoming (account:string position:integer amount:decimal epoch:integer truth:bool)
    @doc "Writes coiling data in either the Auryn or Elite-Auryn Uncoil Ledger \
    \ Switch between the 2 Ledger is done via the <truth> variable \
    \ <truth> = false ==> Auryn Uncoil Ledger \
    \ <truth> = true ==> Elite-Auryn Uncoil Ledger "


    (require-capability (UPDATE_UNCOIL-LEDGERS))
    (if (= truth true)
      (if (= position 1) (update EliteAurynUncoilLedger account { "P1A" : amount, "P1E" : epoch})
        (if (= position 2) (update EliteAurynUncoilLedger account { "P2A" : amount, "P2E" : epoch})
          (if (= position 3) (update EliteAurynUncoilLedger account { "P3A" : amount, "P3E" : epoch})
            (if (= position 4) (update EliteAurynUncoilLedger account { "P4A" : amount, "P4E" : epoch})
              (if (= position 5) (update EliteAurynUncoilLedger account { "P5A" : amount, "P5E" : epoch})
                (if (= position 6) (update EliteAurynUncoilLedger account { "P6A" : amount, "P6E" : epoch})
                  (update EliteAurynUncoilLedger account { "P7A" : amount, "P7E" : epoch})
                )
              )
            )
          )
        )
      )
      (if (= position 1) (update AurynUncoilLedger account { "P1A" : amount, "P1E" : epoch})
        (if (= position 2) (update AurynUncoilLedger account { "P2A" : amount, "P2E" : epoch})
          (if (= position 3) (update AurynUncoilLedger account { "P3A" : amount, "P3E" : epoch})
            (if (= position 4) (update AurynUncoilLedger account { "P4A" : amount, "P4E" : epoch})
              (if (= position 5) (update AurynUncoilLedger account { "P5A" : amount, "P5E" : epoch})
                (if (= position 6) (update AurynUncoilLedger account { "P6A" : amount, "P6E" : epoch})
                  (update AurynUncoilLedger account { "P7A" : amount, "P7E" : epoch})
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun UpdateUncoilLedgerDataOutgoing (account:string position:integer truth:bool operable:bool)
    @doc "Removes coiling data from either the Auryn or Elite-Auryn Uncoil Ledger \
    \ Switch between the 2 Ledger is done via the <truth> variable \
    \ <truth> = false ==> Auryn Uncoil Ledger \
    \ <truth> = true ==> Elite-Auryn Uncoil Ledger \
    \ Data written is either 0.0/0, meaning the position remains ocuppied after data removal \
    \ Data written as -1.0/1, means the position will become locked after data removal \
    \ Swith between these 2 variants is the <operable> variable \
    \ <operable> = true ==> Position remains open \
    \ <operable> = false ==> Position will be locked after data removal."

    (require-capability (UPDATE_UNCOIL-LEDGERS))
    (let
      (
        (amount:decimal (if (= operable true) 0.0 -1.0))
        (epoch:integer (if (= operable true) 0 -1))
      )
      (if (= truth true)
        (if (= position 1) (update EliteAurynUncoilLedger account { "P1A" : amount, "P1E" : epoch})
          (if (= position 2) (update EliteAurynUncoilLedger account { "P2A" : amount, "P2E" : epoch})
            (if (= position 3) (update EliteAurynUncoilLedger account { "P3A" : amount, "P3E" : epoch})
              (if (= position 4) (update EliteAurynUncoilLedger account { "P4A" : amount, "P4E" : epoch})
                (if (= position 5) (update EliteAurynUncoilLedger account { "P5A" : amount, "P5E" : epoch})
                  (if (= position 6) (update EliteAurynUncoilLedger account { "P6A" : amount, "P6E" : epoch})
                    (update EliteAurynUncoilLedger account { "P7A" : amount, "P7E" : epoch})
                  )
                )
              )
            )
          )
        )
        (if (= position 1) (update AurynUncoilLedger account { "P1A" : amount, "P1E" : epoch})
          (if (= position 2) (update AurynUncoilLedger account { "P2A" : amount, "P2E" : epoch})
            (if (= position 3) (update AurynUncoilLedger account { "P3A" : amount, "P3E" : epoch})
              (if (= position 4) (update AurynUncoilLedger account { "P4A" : amount, "P4E" : epoch})
                (if (= position 5) (update AurynUncoilLedger account { "P5A" : amount, "P5E" : epoch})
                  (if (= position 6) (update AurynUncoilLedger account { "P6A" : amount, "P6E" : epoch})
                    (update AurynUncoilLedger account { "P7A" : amount, "P7E" : epoch})
                  )
                )
              )
            )
          )
        )
      )
    )
  )
;;
;;
;;[Plebeic/Baronic-Ledgers]
;;==============================================================================
;;
  ;;
  ;;
  ;;
;;
;;==============================================================================
;;MINT
  (defun SpawnPrimordialSnakes (account:string)
    @doc "Mints the Genesis Snake Token Amount, equal to 490.000 \
    \ Only the GENESIS_MINTER that provides the KEY_MINTER key is allowed to execute this mint \
    \ Moreover it can only be executed when the total Ouroboros Supply is ZERO \
    \ And once executed, it can never be executed again.\
    \ After Mint, designated Amounts are diverted towards Sale, Treasury and Developers Funds."

    (ValidateAccount account)
    (enforce (= account GENESIS_MINTER) "Function caller is not the legitimate GENESIS Minter")

    (let
      (
        (c:integer (GetSpawnCounter))
        (e:integer (GetSpawnEpoch))
        (ouroborossupply:decimal (GetSupply "Ouroboros"))
        (x:decimal GENESIS_TREASURY)
        (y:decimal GENESIS_DEVELOPERS)
        (z:decimal GENESIS_SALE)
      )
      (enforce (and (= c -1) (= e -1)) "Genesis has been minted")
      (enforce (= ouroborossupply 0.0) "Supply is non-zero, Genesis amount must must have allready been minted")

      (with-capability (GENESIS_SPAWN account)
        (MintOuroboros account GENESIS_AMOUNT)
        (update SpawnCounterLedger SPAWN_COUNT
          { "spawncounter" : (+ 1 (GetSpawnCounter)), "spawnepoch" : (+ 1 (GetSpawnEpoch))}
        )

        (DebitOuroboros account x)
        (CreditOuroboros TREASURY x true)

        (DebitOuroboros account y)
        (CreditOuroboros DEVELOPERS y true)

        (DebitOuroboros account z)
        (CreditOuroboros TOKEN_SALE z true)
      )
    )
  )
  ;;
  (defun SpawnDailySnakes (account:string spawningtime:time)
    @doc "Mints the Daily Issuance, and transfer it to its designated target destinations \
    \ in their designated amounts and forms, depending on target designation \
    \ It can be called only once per day. \
    \ spawningtime mockups mint time, for testing purpose, on mainnet it is automatically \
    \ taken from Blockchain data. WENLIVE"

    (ValidateAccount account)
    (enforce (= account DAILY_MINTER) "Only the daily minter can mint the Daily supply")

    (let*
      (
        (dailyamount:decimal (ComputeDailySpawnAmount))
        (ouroborossupply:decimal (GetSupply "Ouroboros"))

        (epochatmint:integer (GetCurrentEpochManual spawningtime))
        (spawncounter:integer (GetSpawnCounter))
        (spawnepoch:integer (GetSpawnEpoch))
        (epochdiff:integer (- epochatmint spawnepoch))

        (a:decimal (MakePercent dailyamount SPLIT_BONDS))
        (b:decimal (MakePercent dailyamount SPLIT_TREASURY))
        (c:decimal (MakePercent dailyamount SPLIT_SHAREHOLDERS))
        (d:decimal (MakePercent dailyamount SPLIT_DEVELOPERS))
        (e:decimal (MakePercent dailyamount SPLIT_RAFFLES))
        (f:decimal (MakePercent dailyamount SPLIT_LIQUIDITY_FARMING))
        (g:decimal (MakePercent dailyamount SPLIT_AUTO_STAKING))
        (h:decimal (MakePercent dailyamount SPLIT_SUBSIDIARY_STAKING))
        (i:decimal (MakePercent dailyamount SPLIT_SNAKE_STAKING))
        (j:decimal (- dailyamount (+ i (+ h (+ g (+ f (+ e (+ d (+ c (+ a b))))))))))

        (autostake-balance:decimal (at 5 (GetAllBaronicBalances AUTO_STAKING)))
      )
      (enforce (>= spawncounter 0) "Genesis must be minted first")
      (enforce (> epochatmint 0) "Daily amount can only be minted starting with epoch 1")
      (enforce (> ouroborossupply 0.0) "Supply is zero, Genesis mint must be used first")
      (enforce (>= epochdiff 1) "Daily mint allready minted this epoch")
      (enforce (> autostake-balance 0.0) "Autostake fill cannot happen on empty pool")

      (with-capability (DAILY_SPAWN account)
        (UpdateAllSnakeAccountAge)


        (MintOuroboros AUTO_STAKING g)
        (MintOuroboros BONDS a)
        (MintOuroboros TREASURY b)
        (MintOuroboros SHAREHOLDERS c)
        (MintOuroboros DEVELOPERS d)
        (MintOuroboros RAFFLES e)
        (MintOuroboros LIQUIDITY_FARMING f)
        (MintOuroboros SUBSIDIARY_STAKING h)
        (MintOuroboros SNAKE_STAKING i)
        (MintOuroboros VEGLD_STAKING j)

        (CoilOuroboros LIQUIDITY_FARMING f)
        (CoilOuroboros SUBSIDIARY_STAKING h)
        (CoilOuroboros SNAKE_STAKING i)
        (CoilOuroboros VEGLD_STAKING j)

        (update SpawnCounterLedger SPAWN_COUNT
          { "spawncounter" : (+ 1 (GetSpawnCounter))
          , "spawnepoch" : epochatmint}
        )
      )
      (format "Daily amount spawned today is {} Ouroboros." [dailyamount])
    )
  )
;;==============================================================================
;;MINT Functions
  (defun MintOuroboros (account:string amount:decimal)

    (require-capability (MINT_OUROBOROS account))
    ;;STEP1 - Crediting the account with the minted Ouroboros
    (CreditOuroboros account amount true)
    ;;STEP2 - Update Total Ouroboros Supply
    (UpdateSupply"Ouroboros" amount true)
  )

  (defun MintAuryn (account:string amount:decimal)
    (require-capability (MINT_AURYN account))
    ;;STEP1 - Crediting the account with the minted Ouroboros
    (CreditAuryn account amount true)
    ;;STEP2 - Update Total Ouroboros Supply
    (UpdateSupply "Auryn" amount true)
  )

  (defun MintEliteAuryn (account:string amount:decimal)
    (require-capability (MINT_ELITE-AURYN account))
    ;;STEP1 - Crediting the account with the minted Ouroboros
    (CreditEliteAuryn account amount true)
    ;;STEP2 - Update Total Ouroboros Supply
    (UpdateSupply "EliteAuryn" amount true)
  )
;;
;;==============================================================================
;;
  ;;
  ;;
  ;;
;;
;;==============================================================================
;;BURN Functions
  (defun BurnOuroboros (account:string amount:decimal)
    @doc "Burns Ouroboros Amount from Account balance\
    \ Function is protected by the BURN_OUROBOROS Capability"

    (require-capability (BURN_OUROBOROS account))
    ;;STEP1 - Debits the Account of Ouroboros
    (DebitOuroboros account amount)
    ;;STEP2 - Credits the burnedOuoboros to the Burning Ledger
    (DirectBurningLedgerCredit amount 1)
    ;;STEP3 - Credits the accounts BurnedOuroboros field.
    (CreditBurnedOuroboros account amount)
    ;;STEP4 - Update Total Ouroboros Supply
    (UpdateSupply "Ouroboros" amount false)
  )

  (defun BurnAuryn (account:string amount:decimal)
    @doc "Burns Auryn Amount from Account balance\
    \ Function is protected by the BURN_AURYN Capability"

    (require-capability (BURN_AURYN account))
    ;;STEP1 - Debits the Account of Ouroboros
    (DebitAuryn account amount)
    ;;STEP2 - Update Total Ouroboros Supply
    (UpdateSupply "Auryn" amount false)
  )

  (defun BurnEliteAuryn (account:string amount:decimal)
    @doc "Burns Auryns Amount from Account balance\
    \ Function is protected by the BURN_ELITE-AURYN Capability"

    (require-capability (BURN_ELITE-AURYN account))
    ;;STEP1 - Debits the Account of Ouroboros
    (DebitEliteAuryn account amount)
    ;;STEP2 - Update Total Ouroboros Supply
    (UpdateSupply "EliteAuryn" amount false)
  )

  ;;
  (defun BurnUncoilFee:string (amount:decimal bywhom:string)
    @doc "Burns Ouroboros Amount from Autostake Pool\
    \ Function is protected by the BURN_AUTOSTAKED-OUROBOROS Capability.\
    \ When uncoiling Auryn, is used to manually burn the uncoil fee."

    (require-capability (BURN_UNCOIL-FEE bywhom))

    ;;STEP1 - DEBITING Directly the fee amount from AUTO_STAKING on Plebeic Ledger
    (RawDebitPlebeicOuroboros AUTO_STAKING amount)
    ;;STEP2 - DEBITING Directly the fee amount from AUTO_STAKING on Baronic Ledger
    (RawDebitBaronicOuroboros AUTO_STAKING amount)
    ;;STEP3  - Credits the burned fee amount to the Burning Ledger
    (DirectBurningLedgerCredit amount 1)
    ;;STEP4  - Updates burn amount entry in AUTO_STAKING account.
    (CreditBurnedOuroboros AUTO_STAKING amount)
    ;;STEP5  - Saves amount on the acount who has executed the burn via Auryn Uncoil
    ;;         in the BurnedOuroborosViaAutostake field.
    ;;         this is the only way this field is updated with increased amounts.
    (CreditBOVA bywhom amount)
    ;;STEP6  - Update Total Ouroboros Supply
    (UpdateSupply "Ouroboros" amount false)
  )
  ;;----------------------------------------------------------------------------
  (defun RecycleAuryns (amount:decimal)
    (require-capability (RECYCLE_AURYNS))
    (let*
      (
        (x:decimal (TruncateToSnake (/ amount 5.0)))
        (r:decimal (TruncateToSnake (* x 4.0)))
        (y:decimal (- amount r))
      )
      (RecycleAurynToCodingDivision x)    ;;sender22
      (RecycleAurynToLiquidityFarm x)     ;;sender17
      (RecycleAurynToShareholders x)      ;;sender16
      (RecycleAurynToSnakeDAO x)          ;;sender21
      (RecycleAurynToSubsidiaryStaking y) ;;sender19
    )
  )
  (defun RecycleAurynToCodingDivision (amount:decimal)
    (require-capability (RECYCLE_TO_CODINGDIVISION))
    (RawCreditPlebeicAuryn DAO_CODINGDIVISION amount)
    (RawCreditBaronicAuryn DAO_CODINGDIVISION amount)
  )

  (defun RecycleAurynToLiquidityFarm (amount:decimal)
    (require-capability (RECYCLE_TO_LIQUIDITYFARMING))
    (RawCreditPlebeicAuryn LIQUIDITY_FARMING amount)
    (RawCreditBaronicAuryn LIQUIDITY_FARMING amount)
  )

  (defun RecycleAurynToShareholders (amount:decimal)
    (require-capability (RECYCLE_TO_SHAREHOLDERS))
    (RawCreditPlebeicAuryn SHAREHOLDERS amount)
    (RawCreditBaronicAuryn SHAREHOLDERS amount)
  )

  (defun RecycleAurynToSnakeDAO (amount:decimal)
    (require-capability (RECYCLE_TO_SNAKEDAO))
    (RawCreditPlebeicAuryn DAO_SNAKE amount)
    (RawCreditBaronicAuryn DAO_SNAKE amount)
  )

  (defun RecycleAurynToSubsidiaryStaking (amount:decimal)
    (require-capability (RECYCLE_TO_SUBSIDIARY))
    (RawCreditPlebeicAuryn SUBSIDIARY_STAKING amount)
    (RawCreditBaronicAuryn SUBSIDIARY_STAKING amount)
  )
;;
;;==============================================================================
;;
  ;;
  ;;
  ;;
;;
;;==============================================================================
;;VESTING Functions
  (defun GetCurrentEpochAuto ()
    ;;(at "block-time" (chain-data))
    @doc "Returns the live Epoch using live time from Blockchain Data"

    (let
      (
        (x:decimal (diff-time (at "block-time" (chain-data)) GENESISTIME))
      )
      (floor (/ x 86400.0))
    )
  )
  (defun GetCurrentEpochManual (input:time)
    ;;(at "block-time" (chain-data))
    @doc "Returns the mockup Epoch using mockup input time for testing purposes. \
    \ Has no use when code is deployed live."

    (let
      (
        (x:decimal (diff-time input GENESISTIME))
      )
      (floor (/ x 86400.0))
    )
    ;(SecondsToDays (diff-time input GENESISTIME))
    ;;(diff-time (time FUTURETIME) (time GENESISTIME))
  )
  ;;----------------------------------------------------------------------------
  (defun VestOuroboros (amount:decimal vesting:integer)
    @doc "Vests an Ouroboros amount with <vesting> nr. of days"
    true
  )
  (defun UnvestOuroboros (amount:decimal)
    @doc "Unvests a batch of Vested Ouroboros, converting it back \
    \ to free liquid Ouroboros \
    \ Only possible if vesting has expired."
    true
  )
  (defun MergeVestedOuroboros (amount:decimal)
    @doc "Merge 2 or more batches of Vested Ouroboros \
    \ The amount is added, and the vesting time \
    \ is is computed usng weigthed arithmetic mean. "
    true
  )
  ;;
  (defun VestAuryn  (amount:decimal vesting:integer)
    @doc "Vests an Auryn  amount with <vesting> nr. of days"
    true
  )
  (defun UnvestAuryn  (amount:decimal)
    @doc "Unvests a batch of Vested Auryn , converting it back \
    \ to free liquid Auryn  \
    \ Only possible if vesting has expired."
    true
  )
  (defun MergeVestedAuryn  (amount:decimal)
    @doc "Merge 2 or more batches of Vested Auryn  \
    \ The amount is added, and the vesting time \
    \ is is computed usng weigthed arithmetic mean. "
    true
  )
  ;;
  (defun VestEliteAuryn  (amount:decimal vesting:integer)
    @doc "Vests an Elite Auryn  amount with <vesting> nr. of days"
    true
  )
  (defun UnvestEliteAuryn  (amount:decimal)
    @doc "Unvests a batch of Vested Elite Auryn , converting it back \
    \ to free liquid Elite Auryn  \
    \ Only possible if vesting has expired."
    true
  )
  (defun MergeVestedEliteAuryn  (amount:decimal)
    @doc "Merge 2 or more batches of Vested Elite Auryn  \
    \ The amount is added, and the vesting time \
    \ is is computed usng weigthed arithmetic mean. "
    true
  )
;;
;;==============================================================================
;;
  ;;
  ;;
  ;;
;;
;;==============================================================================
;;COIL-UNCOIL Functions
  (defun CoilOuroboros (sender:string amount:decimal)
    @doc "Coils Ouroboros, (staking) it to the Autostake Pool \
    \ Happens without delays. Autostake Pool cannot coil Ouroboros. \
    \ This enforcement exists in the COIL_OUROBOROS capability "

    (ValidateAccountForTransfers sender)

    (let*
      (
        (auryndex:decimal (GetAuryndex))
        (aurynamount:decimal (TruncateToSnake (/ amount auryndex)))
      )
      (with-capability (COIL_OUROBOROS sender amount)
        (DebitOuroboros sender amount)
        (CreditOuroboros AUTO_STAKING amount true)
        (MintAuryn sender aurynamount)
      )
    )
  )
  ;;
  (defun CoilAuryn (sender:string amount:decimal)
    @doc "Coils Auryn, (staking) it to the Elite Account Hold \
    \ Happens without delays. Elite Hold cannot coil Auryn. \
    \ This enforcement exists in the COIL_AURYN capability "

    (ValidateAccountForTransfers sender)

    (with-capability (COIL_AURYN sender)
      (DebitAuryn sender amount)
      (CreditAuryn ELITE_HOLD amount true)
      (MintEliteAuryn sender amount)
    )

  )
;;==============================================================================
  (defun BestUncoilAuryn (sender:string amount:decimal inputtime:time)
    @doc "Main Function that must be used when Uncoiling Auryn \
    \ It unstakes Ouroboros from the Autostake Pool, and uses \
    \ the cheapest Auryn Uncoil position that exists. \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE \
    \ Uncoiling Auryn debits the Autostake pool for Ouroboros and saves the debited amount \
    \ to the Auryn Uncoil Ledger. The Autostake Pool is also debited the Uncoil burning fee. \
    \ To finalize the Auryn Uncoil, one must wait for the required time to pass, then \
    \ initiate the FinalizeUncoilAuryn, which finally credits the user the Ouroboros amount."

    (with-read BaronicSnakeLedger sender
      { "Auryn" := a }
      (let
        (
          (p:integer (GetBestAurynUncoilPosition sender))
        )
        (enforce (!= p 0.0) "No free Auryn Uncoil Positions that can be used for unstake")
        (enforce (<= amount a) (format "Not enough Auryn balance to uncoil {} Auryn" [amount]))
        (with-capability (UNCOIL_AURYN sender)
          (UncoilAurynPosition sender amount p inputtime)
        )
        (format "Uncoil position {} was used to uncoil {} Auryn" [p amount])
      )

    )
  )
  ;;
  (defun UncoilAurynPosition (sender:string amount:decimal position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Auryn Uncoil procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    (ValidateAccountForTransfers sender)
    (ValidateAccountWithTransferWithPosition sender position)

    (require-capability (UNCOIL_AURYN sender))
    (with-read BaronicSnakeLedger AUTO_STAKING
      { "Ouroboros" := o }
      (let*
        (
          (auryndex:decimal (GetAuryndex))
          (ouroborosamount:decimal
            (if (= amount (GetSupply "Auryn"))
              o
              ;;(at 5 (GetAllBaronicBalances AUTO_STAKING))
              (TruncateToSnake (* amount auryndex))
            )
          )
          (fee:integer (GetAurynUncoilFee amount position))
          (feeabsolute:decimal (MakePermille ouroborosamount (dec fee)))
          (ouroborosleft:decimal (- ouroborosamount feeabsolute))
          (uncoiltime:integer (GetAurynUncoilTime sender))
          (currentepoch:integer (GetCurrentEpochManual inputtime))
          (expiringepoch:integer (+ uncoiltime currentepoch))
        )
        ;;STEP1 - Debit Auryn from the sender
        (BurnAuryn sender amount)
        ;;STEP2 - DEBITING Directly the ouroborosleft from AUTO_STAKING on Plebeic Ledger
        (RawDebitPlebeicOuroboros AUTO_STAKING ouroborosleft)
        ;;STEP3 - DEBITING Directly ouroborosleft from AUTO_STAKING on Baronic Ledger
        (RawDebitBaronicOuroboros AUTO_STAKING ouroborosleft)
        ;;STEP4 - while th absolute fee is burned
        (BurnUncoilFee feeabsolute sender)
        ;;STEP5 - Crediting the the remaining Ouroboros Amount to the UNCOIL_HOLD
        (CreditOuroboros UNCOIL_HOLD ouroborosleft true)
        ;;STEP6 - Updating the AurynUncoilLedger with ouroborosleft and its expiring epoch
        (UpdateAurynUncoilLedgerIncoming sender position ouroborosleft expiringepoch)
        (format "Uncoiling {} Auryn (generating {} OURO) on position {} incurred a fee of {}‰ ({} OURO), leaving {} OURO to be claimed after {} days at epoch {}." [amount ouroborosamount position fee feeabsolute ouroborosleft uncoiltime expiringepoch])
      )
    )
  )
  ;;
  (defun FinalizeUncoilAuryn (sender:string inputtime:time)
    @doc "Main Function that must be used when finalizing Uncoiling Auryn \
    \ It finally credits the Ouroboros that was initially debited from the Autostake Pool, the the unstaker \
    \ It uses the first Auryn Uncoil Position that is ripe for finalization \
    \ It fails if no ripe positions are detected, and only works \
    \ when ripe positions exist (these are saved in the Auryn Uncoil Ledger) \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    (let
      (
        (p:integer (GetRipeAurynUncoilPosition sender inputtime))
      )
      (enforce (!= p 0) "No ripe Auryn Uncoil positions to harvest.")
      (with-capability (UNCOIL_AURYN-HARVEST sender)
        (FinalizeUncoilAurynPosition sender p inputtime)
      )
    )
  )
  ;;
  (defun FinalizeUncoilAurynPosition (sender:string position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Auryn Uncoil finalisation procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    (ValidateAccountWithTransferWithPosition sender position)

    (require-capability (UNCOIL_AURYN-HARVEST sender))
    (let
      (
        (epochnow:integer (GetCurrentEpochManual inputtime))
        (harvestamount:decimal (at 0 (GetUncoilLedgerPositionData sender position false)))
        (harvestepoch:integer (at 1 (GetUncoilLedgerPositionData sender position false)))
      )
      (enforce (>= epochnow harvestepoch) "You cannot harvest position yet")

      ;;STEP1 - DEBITING Directly the Uncoil Hold from the Plebeic Ledger of Ouroboros
      (RawDebitPlebeicOuroboros UNCOIL_HOLD harvestamount)
      ;;STEP2 - DEBITING Directly the Uncoil Hold from the Baronic Ledger of Ouroboros
      (RawDebitBaronicOuroboros UNCOIL_HOLD harvestamount)
      ;;STEP3 - Credit Sender the amount debited previously
      (CreditOuroboros sender harvestamount true)
      ;;STEPT4 - Updating the Auryn Uncoil-Ledger
      (UpdateAurynUncoilLedgerOutgoing sender position)
      (format "Harvested {} OURO from position {} at epoch {}." [harvestamount position epochnow])
    )
  )
  ;;----------------------------------------------------------------------------
  (defun GetBestAurynUncoilPosition:integer (account:string)
    @doc "Outputs the cheapest Auryn Uncoil Position \
    \ If no position is found, which happens when all positions are occupied, \
    \ it outputs 0.0"
    ;;Blacklisted accounts are not allowed to execute this function
    (ValidateAccount account)
    (ValidateAccountForTransfers account)

    (let*
      (
        (p1:bool (IzUncoilLedgerPositionFree account 1 false))
        (p2:bool (IzUncoilLedgerPositionFree account 2 false))
        (p3:bool (IzUncoilLedgerPositionFree account 3 false))
        (p4:bool (IzUncoilLedgerPositionFree account 4 false))
        (p5:bool (IzUncoilLedgerPositionFree account 5 false))
        (p6:bool (IzUncoilLedgerPositionFree account 6 false))
        (p7:bool (IzUncoilLedgerPositionFree account 7 false))
        (tl [p1 p2 p3 p4 p5 p6 p7])
        (value
          (cond
            ((= (at 0 tl) true) 1)
            ((= (at 1 tl) true) 2)
            ((= (at 2 tl) true) 3)
            ((= (at 3 tl) true) 4)
            ((= (at 4 tl) true) 5)
            ((= (at 5 tl) true) 6)
            ((= (at 6 tl) true) 7)
            0
          )
        )
      )
      value
    )
  )
  ;;
  (defun GetRipeAurynUncoilPosition:integer (account:string inputtime:time)
    @doc "Detects if an Auryn Uncoil position is ripe for harvesting \
    \ If no ripe position is found, which happens either when positions are unused \
    \ or when not enought time has elapsed, it returns 0.0 \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    ;;Blacklisted accounts are not allowed to execute this function
    (ValidateAccount account)
    (ValidateAccountForTransfers account)
    (let
      (
        (epochnow:integer (GetCurrentEpochManual inputtime))
      )
      (with-read AurynUncoilLedger account
        { "P1E" := e1, "P2E" := e2, "P3E" := e3, "P4E" := e4, "P5E" := e5, "P6E" := e6, "P7E" := e7}
        (if (and (>= epochnow e1) (!= e1 0)) 1
          (if (and (>= epochnow e2) (!= e2 0)) 2
            (if (and (>= epochnow e3) (!= e3 0)) 3
              (if (and (>= epochnow e4) (!= e4 0)) 4
                (if (and (>= epochnow e5) (!= e5 0)) 5
                  (if (and (>= epochnow e6) (!= e6 0)) 6
                    (if (and (>= epochnow e7) (!= e7 0)) 7 0)
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun UpdateAurynUncoilLedgerIncoming (account:string position:integer amount:decimal epoch:integer)
    @doc "Updates the Auryn Ledger on the given position with specified amount and expiring epoch \
    \ Used when writing Auryn Uncoil Data to the Uncoil Auryn Ledger \
    \ This data is later retrieved when the Auryn Uncoil will be finalized "

    (enforce (> amount 0.0) "Positive amount")
    (enforce (> epoch 0) "Positive amount")
    ;;WENLIVE line to set free on mainnet
    ;(enforce (> epoch (GetCurrentEpochAuto)) "Epoch to write must be higher than current epoch")

    (let
      (
        (type:integer (IzUncoilLedgerPositionWhat account position false))
      )
      (enforce (= type 0) "Position must be free in order to use it!")
      (UpdateUncoilLedgerDataIncoming account position amount epoch false)
    )
  )
  ;;
  (defun UpdateAurynUncoilLedgerOutgoing (account:string position:integer)
    @doc "Updates the Auryn Ledger on the given position with null data \
    \ Used when finalizing an Auryn Uncoil event, to basically clear the used position\
    \ As such double Zeros are written on input position (for balance and epoch) \
    \ Only non free position can be cleared with this function. \
    \ Clearence is protected by the UPDATE_UNCOIL-LEDGERS capability"

    ;;The Body that updates the the UncoilLedgers requires the UPDATE_UNCOIL-LEDGERS capability.
    (let
      (
        (type:integer (IzUncoilLedgerPositionWhat account position false))
      )
      (enforce (= type 1) "Position must be occupied in order to clear it!")
      (UpdateUncoilLedgerDataOutgoing account position false true)
    )
  )
;;==============================================================================
  (defun BestUncoilEliteAuryn (sender:string amount:decimal inputtime:time)
    @doc "Main Function that must be used when Uncoiling Elite-Auryn \
    \ It unstakes Auryn from the Elite Hold, and uses \
    \ the highest Elite-Auryn Uncoil position that exists open for uncoiling. \
    \ The Elite-Auryn Uncoil Position and Unlock Period used depends on the amount\
    \ of Elite-Auryn the user remains with, after the uncoiling Elite-Auryn amount \
    \ was subtracted from the users balance. \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE \
    \ Uncoiling Elite-Auryn debits the Uncoil Hold for Auryn and saves the debited amount \
    \ to the Elite-Auryn Uncoil Ledger. \
    \ To finalize the Elite-Auryn Uncoil, one must wait for the required time to pass, then \
    \ initiate the FinalizeUncoilEliteAuryn, which finally credits the user the Auryn amount."

    (with-read BaronicSnakeLedger sender
      { "EliteAuryn" := ea }
      (let
        (
          (p:integer (GetBestEliteAurynUncoilPosition sender amount))
        )
        (enforce (!= p 0.0) "No free Elite-Auryn Uncoil Positions that can be used for unstake")
        (enforce (<= amount ea) (format "Not enough Elite-Auryn balance to uncoil {} Elite-Auryn" [amount]))
        (with-capability (UNCOIL_ELITE-AURYN sender)
          (UncoilEliteAurynPosition sender amount p inputtime)
        )
      )
    )
  )
  ;;
  (defun UncoilEliteAurynPosition (sender:string amount:decimal position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Elite-Auryn Uncoil procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    (ValidateAccountForTransfers sender)
    (ValidateAccountWithTransferWithPosition sender position)

    (require-capability (UNCOIL_ELITE-AURYN sender))
    (let*
      (
        (tea:decimal (at 11 (GetAllBaronicBalances sender)))
        (fea:decimal (- tea amount))

        (uncoiltime:integer (GetEliteAurynUncoilTimeByAmount fea))
        (currentepoch:integer (GetCurrentEpochManual inputtime))
        (expiringepoch:integer (+ uncoiltime currentepoch))
      )

      ;;STEP 1 - Debit Elite-Auryn from the sender
      (BurnEliteAuryn sender amount)
      ;;STEP2 - DEBITING Directly the Elite Hold from the Plebeic Ledger of Auryn
      (RawDebitPlebeicAuryn ELITE_HOLD amount)
      ;;STEP3 - DEBITING Directly the Elite Hold from the Baronic Ledger of Auryn
      (RawDebitBaronicAuryn ELITE_HOLD amount)
      ;;STEP4 - Crediting the Auryn Amount to the Uncoil Hold
      (CreditAuryn UNCOIL_HOLD amount true)
      ;;STEP5 - Saving the amount to the Elite-Auryn Uncoil-Ledger with its expiring epoch
      (UpdateEliteAurynUncoilLedgerIncoming sender amount position expiringepoch fea)
   )
  )
  ;;
  (defun FinalizeUncoilEliteAuryn (sender:string inputtime:time)
  @doc "Main Function that must be used when finalizing Uncoiling Elite-Auryn \
  \ It finally credits the Auryn that was initially debited from the Elite Hold, the the unstaker \
  \ It uses the first Elite-Auryn Uncoil Position that is ripe for finalization \
  \ It fails if no ripe positions are detected, and only works \
  \ when ripe positions exist (these are saved in the Elite-Auryn Uncoil Ledger) \
  \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
  \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    (let
      (
        (p:integer (GetRipeEliteAurynUncoilPosition sender inputtime))
      )
      (enforce (!= p 0) "No ripe Elite Auryn Uncoil positions to harvest.")
      (with-capability (UNCOIL_ELITE-AURYN-HARVEST sender)
        (FinalizeUncoilEliteAurynPosition sender p inputtime)
      )
    )
  )
  ;;
  (defun FinalizeUncoilEliteAurynPosition (sender:string position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Elite-Auryn Uncoil finalisation procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    @model [(property (valid-account sender))]

    (ValidateAccountWithTransferWithPosition sender position)

    (require-capability (UNCOIL_ELITE-AURYN-HARVEST sender))
    (let
      (
        (epochnow:integer (GetCurrentEpochManual inputtime))
        (harvestamount:decimal (at 0 (GetUncoilLedgerPositionData sender position true)))
        (harvestepoch:integer (at 1 (GetUncoilLedgerPositionData sender position true)))
        (tea:decimal (at 11 (GetAllBaronicBalances sender)))
      )

      (enforce (>= epochnow harvestepoch) "You cannot harvest position yet")

      ;;STEP1 - DEBITING Directly the Uncoil Hold from the Plebeic Ledger of Auryn
      (RawDebitPlebeicAuryn UNCOIL_HOLD harvestamount)
      ;;STEP2 - DEBITING Directly the Uncoil Hold from the Baronic Ledger of Auryn
      (RawDebitBaronicAuryn UNCOIL_HOLD harvestamount)
      ;;STEP3 - CREDIT the Auryn to the sender
      (CreditAuryn sender harvestamount true)
      ;;STEP4 - Clear Position in Elite-Auryn Uncoil-Ledger
      (UpdateEliteAurynUncoilLedgerOutgoing sender position tea)

    )
  )
  ;;----------------------------------------------------------------------------
  (defun GetBestEliteAurynUncoilPosition:integer (account:string amount:decimal)
    @doc "Outputs the best Elite-Auryn Uncoil Position, given amount that is to be taken out \
    \ If no position is found, which happens when all positions are occupied, \
    \ it outputs 0"

    ;;Blacklisted accounts are not allowed to execute this function
    (ValidateAccount account)
    (ValidateAccountForTransfers account)

    (let*
      (
        (all-balance (GetAllBaronicBalances account))
        (ea:decimal (at 12 all-balance))
        (oea:decimal (- ea amount))
        (tea:decimal (at 11 all-balance))
        (rtn:string (TierName (- tea amount)))

        (p1:bool (IzUncoilLedgerPositionFree account 1 true))
        (p1r:integer (if (= p1 true) 1 0))
        (p2:bool (IzUncoilLedgerPositionFree account 2 true))
        (p3:bool (IzUncoilLedgerPositionFree account 3 true))
        (p4:bool (IzUncoilLedgerPositionFree account 4 true))
        (p5:bool (IzUncoilLedgerPositionFree account 5 true))
        (p6:bool (IzUncoilLedgerPositionFree account 6 true))
        (p7:bool (IzUncoilLedgerPositionFree account 7 true))
        (tl [p1 p2 p3 p4 p5 p6 p7])

        (ht2:integer (HighestDoubleTruth (take 2 tl)))
        (ht3:integer (HighestTripleTruth (take 3 tl)))
        (ht4:integer (HighestQuadTruth (take 4 tl)))
        (ht5:integer (HighestPentaTruth (take 5 tl)))
        (ht6:integer (HighestHexaTruth (take 6 tl)))
        (ht7:integer (HighestHeptaTruth tl))
      )
      (enforce (>= oea 0.0) (format "Not enough Elite-Auryn balance to uncoil {} Elite-Auryn" [amount]))
      (cond
        ((or (or (= rtn TIERN) (= rtn TIER0)) (= rtn TIER1)) p1r)
        ((= rtn TIER2) ht2)
        ((= rtn TIER2) ht2)
        ((= rtn TIER3) ht3)
        ((= rtn TIER4) ht4)
        ((= rtn TIER5) ht5)
        ((= rtn TIER6) ht6)
        ((= rtn TIER7) ht7)
        0
      )
    )
  )
  ;;
  (defun GetRipeEliteAurynUncoilPosition:integer (account:string inputtime:time)
    @doc "Detects if an Elite-Auryn Uncoil position is ripe for harvesting \
    \ If no ripe position is found, which happens either when positions are unused \
    \ or when not enought time has elapsed, it returns 0 \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    ;;Blacklisted accounts are not allowed to execute this function
    (ValidateAccount account)
    (ValidateAccountForTransfers account)

    (let
      (
        (epochnow:integer (GetCurrentEpochManual inputtime))
      )
      (with-read EliteAurynUncoilLedger account
        { "P1E" := e1, "P2E" := e2, "P3E" := e3, "P4E" := e4, "P5E" := e5, "P6E" := e6, "P7E" := e7}
        (if (and (>= epochnow e1) (> e1 0)) 1
          (if (and (>= epochnow e2) (> e2 0)) 2
            (if (and (>= epochnow e3) (> e3 0)) 3
              (if (and (>= epochnow e4) (> e4 0)) 4
                (if (and (>= epochnow e5) (> e5 0)) 5
                  (if (and (>= epochnow e6) (> e6 0)) 6
                    (if (and (>= epochnow e7) (> e7 0)) 7 0)
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun UpdateEliteAurynUncoilLedgerIncoming (account:string amount:decimal position:integer epoch:integer future-ea:decimal)
    @doc "Updates the Elite-Auryn Uncoil Ledger on the given position \
    \ with specified amount and expiring epoch. \
    \ Used when writing Elite-Auryn Uncoil Data to the Elite Auryn Uncoil Ledger. \
    \ It also additionally checks the other 6 positions of the Elite-Auryn Uncoil Ledger \
    \ against the Elite Account, and locks or unlocks them as needed. \
    \ The written data is later retrieved when the Elite-Auryn Uncoil will be finalized.\
    \ Requires Capability FIX_ELITE-SIX --> FIX_ELITE-SIX --> UPDATE_UNCOIL-LEDGERS"

    (enforce (> amount 0.0) "Positive amount")
    (enforce (> epoch 0) "Positive amount")
    ;;WENLIVE line to set free on mainnet
    ;(enforce (> epoch (GetCurrentEpochAuto)) "Epoch to write must be higher than current epoch")

    ;;The Body that updates the the UncoilLedgers requires the UPDATE_UNCOIL-LEDGERS capability.
    (let
      (
        (type:integer (IzUncoilLedgerPositionWhat account position true))
        (futuretier (Tier future-ea))
      )

      (enforce (= type 0) "Position must be free in order to use it!")
      ;;Update Elite-Auryn Uncoil-Ledger for position.
      (UpdateUncoilLedgerDataIncoming account position amount epoch true)
    )
  )
  ;;
  (defun UpdateEliteAurynUncoilLedgerOutgoing (account:string position:integer future-ea:decimal)
    @doc "Updates the Auryn Ledger on the given position when finalizing \
    \ an Elite-Auryn Uncoil event, to basically clear the used position.\
    \ The data that will be written depends on the Elite Account Tier, checked \
    \ against the position that must be cleared, at the time of event execution \
    \ As such the data to b e written will be either (-1.0/-1) or (0.0/0) \
    \ Requires Capability FIX_ELITE-SIX --> FIX_ELITE-SIX --> UPDATE_UNCOIL-LEDGERS"

    (let*
      (
        (type:integer (IzUncoilLedgerPositionWhat account position true))
        (futuretier:integer (Tier future-ea))
      )

      (enforce (= type 1) "Position must be occupied in order to clear it!")
      ;;; Much check if it needs to be cleared of locked.

      ;;Update Elite-Auryn Uncoil-Ledger for position.
      (if (or (or (= futuretier NTIERN) (= futuretier NTIER0)) (= futuretier NTIER1))
        (UpdateUncoilLedgerDataOutgoing account position true true)
        (if (> position futuretier)
          (UpdateUncoilLedgerDataOutgoing account position true false)
          (UpdateUncoilLedgerDataOutgoing account position true true)
        )
      )
    )
  )
  ;;----------------------------------------------------------------------------
  (defun UpdateEliteAurynUncoilLedgerByElite (account:string amount:decimal)
    @doc "Updates the Elite-Auryn Uncoil Ledger everytime \
    \ the Elite-Auryn balance is modified."

    (let*
      (
        (t:integer (Tier amount))
        (p2:integer (IzUncoilLedgerPositionWhat account 2 true))
        (p3:integer (IzUncoilLedgerPositionWhat account 3 true))
        (p4:integer (IzUncoilLedgerPositionWhat account 4 true))
        (p5:integer (IzUncoilLedgerPositionWhat account 5 true))
        (p6:integer (IzUncoilLedgerPositionWhat account 6 true))
        (p7:integer (IzUncoilLedgerPositionWhat account 7 true))
      )

      (FixPositionByElite account 2 p2 t)
      (FixPositionByElite account 3 p3 t)
      (FixPositionByElite account 4 p4 t)
      (FixPositionByElite account 5 p5 t)
      (FixPositionByElite account 6 p6 t)
      (FixPositionByElite account 7 p7 t)
    )
  )
  ;;
  (defun FixPositionByElite (account:string position:integer type:integer tier:integer)
    @doc "Fixes the Elite-Auryn Uncoil Ledger position, executing a reverse in type \
    \ from (-1.0/-1) to (0.0/0) and viceversa, after checking the Elite Account Tier \
    \ against the Elite-Auryn Uncoil Ledger Position. Type 1 (ongoing uncoiling) \
    \ are left untouched. \
    \ This is the core function called by UpdateEliteAurynUncoilLedgerByElite, \
    \ which is the function that is executed everytime Elite-Auryn Balance changes."

    (require-capability (FIX_ELITE))
    (if (= type 1)
      (format "Position {} cannot be modified because it is of type {}, and is therefore occupied" [position type])
      (cond
        ((and (and (= position 2) (= tier -1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 0)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 2)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 3)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 4)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 5)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 6)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 2) (= tier 7)) (= type -1)) (ReversePositionStatus account position type))

        ((and (and (= position 3) (= tier -1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 0)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 2)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 3)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 4)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 5)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 6)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 3) (= tier 7)) (= type -1)) (ReversePositionStatus account position type))

        ((and (and (= position 4) (= tier -1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 0)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 2)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 3)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 4)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 5)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 6)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 4) (= tier 7)) (= type -1)) (ReversePositionStatus account position type))

        ((and (and (= position 5) (= tier -1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 0)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 2)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 3)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 4)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 5)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 6)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 5) (= tier 7)) (= type -1)) (ReversePositionStatus account position type))

        ((and (and (= position 6) (= tier -1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 0)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 2)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 3)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 4)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 5)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 6)) (= type -1)) (ReversePositionStatus account position type))
        ((and (and (= position 6) (= tier 7)) (= type -1)) (ReversePositionStatus account position type))

        ((and (and (= position 7) (= tier -1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 0)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 1)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 2)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 3)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 4)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 5)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 6)) (= type 0)) (ReversePositionStatus account position type))
        ((and (and (= position 7) (= tier 7)) (= type -1)) (ReversePositionStatus account position type))
        "Attempting to fix position, however it doesnt need fixing!"
      )
    )
  )
  ;;
  (defun ReversePositionStatus (account:string position:integer type:integer)
    @doc "Reverses Elite-Auryn Uncoil Ledger position type fluctuating \
    \ between locked and unlocked. Type 1 positions are left untouched."
    (if (= type 0)
      (LockEliteAurynUncoilLedgerPosition account position)
      (UnlockEliteAurynUncoilLedgerPosition account position)
    )
  )
  ;;
  (defun LockEliteAurynUncoilLedgerPosition (account:string position:integer)
    @doc "Locks a free Elite-Auryn Uncoil Ledger Position."

    (ValidateAccountWithTransferWithPosition account position)
    (enforce (!= position 1.0) "First Position in the EliteAurynUncoiLedger must always be free.")

    (let
      (
        (type:integer (IzUncoilLedgerPositionWhat account position true))
      )
      (enforce (= type 0) "Position must be free in order to lock it!")
      (UpdateUncoilLedgerDataOutgoing account position true false)
    )
  )
  ;;
  (defun UnlockEliteAurynUncoilLedgerPosition (account:string position:integer)
      @doc "Unlocks a free Elite-Auryn Uncoil Ledger Position."

    (ValidateAccountWithTransferWithPosition account position)
    (enforce (!= position 1) "First Position in the EliteAurynUncoiLedger must always be free.")

    (let
      (
        (type:integer (IzUncoilLedgerPositionWhat account position true))
      )
      (enforce (= type -1) "Position must be free in order to lock it!")
      (UpdateUncoilLedgerDataOutgoing account position true true)
    )
  )
;;
;;
;;==============================================================================
;;
  ;;
  ;;
  ;;
;;
;;==============================================================================
;;TRANSFER FUNCTIONS
  (defun AbsoluteTransfer (sender:string receiver:string amount:decimal type:integer)
    (EnforcePlebeicTokenType type)

    (if (= type 1)
      (with-capability (TRANSFER_NOFEE sender receiver true)
        (TransmitOuroboros sender receiver amount)
      )
      (if (= type 2)
        (with-capability (TRANSFER_AURYN sender receiver true)
          (TransmitAuryn sender receiver amount)
        )
        (if (= type 3)
          (with-capability (TRANSFER_ELITE-AURYN sender receiver true)
            (TransmitEliteAuryn sender receiver amount)
          )
          (if (= type 11)
            (with-capability (TRANSFER_NOFEE sender receiver true)
              (TransmitVesta sender receiver amount)
            )
            (if (= type 14)
              (with-capability (TRANSFER_NOFEE sender receiver true)
                (TransmitGold sender receiver amount)
              )
              (with-capability (TRANSFER_NOFEE sender receiver true)
                (TransmitUnity sender receiver amount)
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun AbsoluteTransferAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal type:integer )
    (EnforcePlebeicTokenType type)

    (if (= type 1)
      (with-capability (TRANSFER_NOFEE sender receiver false)
        (TransmitOuroborosAnew sender receiver receiver-guard receiver-herotag amount)
      )
      (if (= type 2)
        (with-capability (TRANSFER_AURYN sender receiver false)
          (TransmitAurynAnew sender receiver receiver-guard receiver-herotag amount)
        )
        (if (= type 3)
          (with-capability (TRANSFER_ELITE-AURYN sender receiver false)
            (TransmitEliteAurynAnew sender receiver receiver-guard receiver-herotag amount)
          )
          (if (= type 11)
            (with-capability (TRANSFER_NOFEE sender receiver false)
              (TransmitVestaAnew sender receiver receiver-guard receiver-herotag amount)
            )
            (if (= type 14)
              (with-capability (TRANSFER_NOFEE sender receiver false)
                (TransmitGoldAnew sender receiver receiver-guard receiver-herotag amount)
              )
              (with-capability (TRANSFER_NOFEE sender receiver false)
                (TransmitUnityAnew sender receiver receiver-guard receiver-herotag amount)
              )
            )
          )
        )
      )
    )
  )
;;==============================================================================
  (defun TransmitOuroboros (sender:string receiver:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver true))
    (RelocateTokensV1 sender receiver amount true)
  )
  (defun TransmitAuryn (sender:string receiver:string amount:decimal)
    (require-capability (TRANSFER_AURYN sender receiver true))
    (let*
      (
        (ra:decimal (MakePercent amount AURYN_RECYCLE-FEE))
        (ca:decimal (- amount ra))
      )
      (DebitAuryn sender ra)
      (RecycleAuryns ra)
      (CreditRecycledAuryn sender ra)
      (DirectBurningLedgerCredit ra 2)
      (RelocateTokensV2 sender receiver ca true)
    )
  )
  (defun TransmitEliteAuryn (sender:string receiver:string amount:decimal)
    (require-capability (TRANSFER_ELITE-AURYN sender receiver true))
    (let*
      (
        (ra:decimal (MakePercent amount ELITE_AURYN_RECYCLE-FEE))
        (ca:decimal (- amount ra))
      )
      (DebitEliteAuryn sender ra)
      (RecycleAuryns ra)
      (CreditRecycledEliteAuryn sender ra)
      (DirectBurningLedgerCredit ra 3)
      (RelocateTokensV3 sender receiver ca true)
    )
  )
  (defun TransmitVesta (sender:string receiver:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver true))
    (RelocateTokensV4 sender receiver amount true)
  )
  (defun TransmitGold (sender:string receiver:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver true))
    (RelocateTokensV5 sender receiver amount true)
  )
  (defun TransmitUnity (sender:string receiver:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver true))
    (RelocateTokensV6 sender receiver amount true)
  )
  ;;----------------------------------------------------------------------------
  (defun TransmitOuroborosAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver false))
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)
    (RelocateTokensV1 sender receiver amount false)
  )
  (defun TransmitAurynAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    (require-capability (TRANSFER_AURYN sender receiver false))
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)
    (let*
      (
        (ra:decimal (MakePercent amount AURYN_RECYCLE-FEE))
        (ca:decimal (- amount ra))
      )
      (DebitAuryn sender ra)
      (RecycleAuryns ra)
      (CreditRecycledAuryn sender ra)
      (DirectBurningLedgerCredit ra 2)
      (RelocateTokensV2 sender receiver ca false)
    )
  )
  (defun TransmitEliteAurynAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    (require-capability (TRANSFER_ELITE-AURYN sender receiver false))
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)
    (let*
      (
        (ra:decimal (MakePercent amount ELITE_AURYN_RECYCLE-FEE))
        (ca:decimal (- amount ra))
      )
      (DebitEliteAuryn sender ra)
      (RecycleAuryns ra)
      (CreditRecycledEliteAuryn sender ra)
      (DirectBurningLedgerCredit ra 3)
      (RelocateTokensV3 sender receiver ca false)
    )
  )
  (defun TransmitVestaAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver false))
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)
    (RelocateTokensV4 sender receiver amount false)
  )
  (defun TransmitGoldAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver false))
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)
    (RelocateTokensV5 sender receiver amount false)
  )
  (defun TransmitUnityAnew (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    (require-capability (TRANSFER_NOFEE sender receiver false))
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)
    (RelocateTokensV6 sender receiver amount false)
  )
  ;;----------------------------------------------------------------------------
  (defun RelocateTokensV1 (sender:string receiver:string amount:decimal existance:bool)
    (ValidateSenderReceiverForTransfers sender receiver)
    (require-capability (TRANSFER sender receiver existance))
    (DebitOuroboros sender amount)
    (CreditOuroboros receiver amount existance)
  )
  (defun RelocateTokensV2 (sender:string receiver:string amount:decimal existance:bool)
    (ValidateSenderReceiverForTransfers sender receiver)
    (require-capability (TRANSFER sender receiver existance))
    (DebitAuryn sender amount)
    (CreditAuryn receiver amount existance)
  )
  (defun RelocateTokensV3 (sender:string receiver:string amount:decimal existance:bool)
    (ValidateSenderReceiverForTransfers sender receiver)
    (require-capability (ELITE_TRANSFER sender receiver existance))
    (DebitEliteAuryn sender amount)
    (CreditEliteAuryn receiver amount existance)
  )
  (defun RelocateTokensV4 (sender:string receiver:string amount:decimal existance:bool)
    (ValidateSenderReceiverForTransfers sender receiver)
    (require-capability (TRANSFER sender receiver existance))
    (DebitVesta sender amount)
    (CreditVesta receiver amount existance)
  )
  (defun RelocateTokensV5 (sender:string receiver:string amount:decimal existance:bool)
    (ValidateSenderReceiverForTransfers sender receiver)
    (require-capability (TRANSFER sender receiver existance))
    (DebitGold sender amount)
    (CreditGold receiver amount existance)
  )
  (defun RelocateTokensV6 (sender:string receiver:string amount:decimal existance:bool)
    (ValidateSenderReceiverForTransfers sender receiver)
    (require-capability (TRANSFER sender receiver existance))
    (DebitUnity sender amount)
    (CreditUnity receiver amount existance)
  )
  ;;----------------------------------------------------------------------------
  (defun CreditOuroboros (account:string amount:decimal existance:bool)
    @doc "Credits Ouroboros Amount to the Account balance."
    (CreditDemiourgosTokensWithExistance account amount 1 "Plebeic" existance)
    (CreditDemiourgosTokensWithExistance account amount 1 "Baronic" existance)
  )
  (defun DebitOuroboros (account:string amount:decimal)
    @doc "Debits Ouroboros Amount from the Account balance."
    (DebitDemiourgosTokens account amount 1 "Plebeic")
    (DebitDemiourgosTokens account amount 1 "Baronic")
  )
  (defun CreditAuryn (account:string amount:decimal existance:bool)
    @doc "Credits Auryn Amount to the Account balance."
    (CreditDemiourgosTokensWithExistance account amount 2 "Plebeic" existance)
    (CreditDemiourgosTokensWithExistance account amount 2 "Baronic" existance)
  )
  (defun DebitAuryn (account:string amount:decimal)
    @doc "Debits Auryn Amount from the Account balance."
    (DebitDemiourgosTokens account amount 2 "Plebeic")
    (DebitDemiourgosTokens account amount 2 "Baronic")
  )
  (defun CreditEliteAuryn (account:string amount:decimal existance:bool)
    @doc "Credits Elite-Auryn Amount to the Account balance."
    (CreditDemiourgosTokensWithExistance account amount 3 "Plebeic" existance)
    (CreditDemiourgosTokensWithExistance account amount 3 "Baronic" existance)
  )
  (defun DebitEliteAuryn (account:string amount:decimal)
    @doc "Debits Elite-Auryn Amount from the Account balance."
    (DebitDemiourgosTokens account amount 3 "Plebeic")
    (DebitDemiourgosTokens account amount 3 "Baronic")
  )
  ;;----------------------------------------------------------------------------
  (defun CreditVestedOuroboros (account:string amount:decimal)
    @doc "Credits Vested Ouroboros Amount to the Account balance."
    (CreditDemiourgosTokens account amount 4 "Baronic")
  )
  (defun DebitVestedOuroboros (account:string amount:decimal)
    @doc "Debits Vested Ouroboros Amount from the Account balance."
    (DebitDemiourgosTokens account amount 4 "Baronic")
  )
  (defun CreditVestedAuryn (account:string amount:decimal)
    @doc "Credits Vested Auryn Amount to the Account balance."
    (CreditDemiourgosTokens account amount 5 "Baronic")
  )
  (defun DebitVestedAuryn (account:string amount:decimal)
    @doc "Debits Vested Auryn Amount from the Account balance."
    (DebitDemiourgosTokens account amount 5 "Baronic")
  )
  (defun CreditVestedEliteAuryn (account:string amount:decimal)
    @doc "Credits Vested Elite-Auryn Amount to the Account balance."
    (CreditDemiourgosTokens account amount 6 "Baronic")
  )
  (defun DebitVestedEliteAuryn (account:string amount:decimal)
    @doc "Debits Vested Elite-Auryn Amount from the Account balance."
    (DebitDemiourgosTokens account amount 6 "Baronic")
  )
  ;;----------------------------------------------------------------------------
  (defun CreditBurnedOuroboros (account:string amount:decimal)
    @doc "Credits Burned Ouroboros Amount to the Account balance."
    (CreditDemiourgosTokens account amount 7 "Baronic")
  )
  (defun CreditBOVA (account:string amount:decimal)
    @doc "Credits Burned Ouroboros via Autostake (BOVA) Amount to the Account balance."
    (CreditDemiourgosTokens account amount 8 "Baronic")
  )
  (defun CreditRecycledAuryn (account:string amount:decimal)
    @doc "Credits Recycle Auryn Amount to the Account balance."
    (CreditDemiourgosTokens account amount 9 "Baronic")
  )
  (defun CreditRecycledEliteAuryn (account:string amount:decimal)
    @doc "Credits Recycle Elite-Auryn Amount to the Account balance."
    (CreditDemiourgosTokens account amount 10 "Baronic")
  )
  ;;----------------------------------------------------------------------------
  (defun CreditVesta (account:string amount:decimal existance:bool)
    @doc "Credits Vesta Amount to the Account balance."
    (CreditDemiourgosTokensWithExistance account amount 11 "Plebeic" existance)
    (CreditDemiourgosTokensWithExistance account amount 11 "Baronic" existance)
  )
  (defun DebitVesta (account:string amount:decimal)
    @doc "Debits Vesta Amount from the Account balance."
    (DebitDemiourgosTokens account amount 11 "Plebeic")
    (DebitDemiourgosTokens account amount 11 "Baronic")
  )
  (defun CreditSleepingVesta (account:string amount:decimal)
    @doc "Credits Sleeping-Vesta Amount to the Account balance."
    (CreditDemiourgosTokens account amount 12 "Baronic")
  )
  (defun DebitSleepingVesta (account:string amount:decimal)
    @doc "Debits Sleeping-Vesta Amount from the Account balance."
    (DebitDemiourgosTokens account amount 12 "Baronic")
  )
  (defun CreditFrozenVesta (account:string amount:decimal)
    @doc "Credits Frozen-Vesta Amount to the Account balance."
    (CreditDemiourgosTokens account amount 13 "Baronic")
  )
  ;;----------------------------------------------------------------------------
  (defun CreditGold (account:string amount:decimal existance:bool)
    @doc "Credits Gold Amount to the Account balance."
    (CreditDemiourgosTokensWithExistance account amount 14 "Plebeic" existance)
    (CreditDemiourgosTokensWithExistance account amount 14 "Baronic" existance)
  )
  (defun DebitGold (account:string amount:decimal)
    @doc "Debits Gold Amount from the Account balance."
    (DebitDemiourgosTokens account amount 14 "Plebeic")
    (DebitDemiourgosTokens account amount 14 "Baronic")
  )
  (defun CreditUnity (account:string amount:decimal existance:bool)
    @doc "Credits Unity Amount to the Account balance."
    (CreditDemiourgosTokensWithExistance account amount 15 "Plebeic" existance)
    (CreditDemiourgosTokensWithExistance account amount 15 "Baronic" existance)
  )
  (defun DebitUnity (account:string amount:decimal)
    @doc "Debits Unity Amount from the Account balance."
    (DebitDemiourgosTokens account amount 15 "Plebeic")
    (DebitDemiourgosTokens account amount 15 "Baronic")
  )
  (defun CreditEquity (account:string amount:decimal)
    @doc "Credits Equity Amount to the Account balance."
    (CreditDemiourgosTokens account amount 16 "Baronic")
  )
  ;;============================================================================
  (defun CreditDemiourgosTokensWithExistance (account:string amount:decimal type:integer ledger-type:string existance:bool)
    (EnforceLedgerString ledger-type)

    (if (or (= type 3) (= type 6))
      (require-capability (CREDIT_EXISTING_ELITE account existance))
      (require-capability (CREDIT_EXISTING account existance))
    )

    (if (= ledger-type "Plebeic")
      (DirectPlebeicCredit account amount type)
      (DirectBaronicCredit account amount type)
    )
  )
  (defun CreditDemiourgosTokens (account:string amount:decimal type:integer ledger-type:string)
    (EnforceLedgerString ledger-type)

    (if (or (= type 3) (= type 6))
      (require-capability (CREDIT_EXISTING_ELITE account true))
      (require-capability (CREDIT_EXISTING account true))
    )

    (if (= ledger-type "Plebeic")
      (DirectPlebeicCredit account amount type)
      (DirectBaronicCredit account amount type)
    )
  )
  (defun DebitDemiourgosTokens (account:string amount:decimal type:integer ledger-type:string)
    (EnforceLedgerString ledger-type)

    (if (or (= type 3) (= type 6))
      (require-capability (DEBIT_EXISTING_ELITE account))
      (require-capability (DEBIT_EXISTING account))
    )

    (if (= ledger-type "Plebeic")
      (DirectPlebeicDebit account amount type)
      (DirectBaronicDebit account amount type)
    )
  )
  ;;============================================================================
  (defun DirectBaronicCredit (account:string amount:decimal type:integer)

    (ValidateAccountWithAmountComplex account amount "Baronic" "Credit")
    (EnforceBaronicCreditTokenType type)

    (if (or (= type 3) (= type 6))
      (require-capability (DIRECT_CREDIT_ELITE account))
      (require-capability (DIRECT_CREDIT account))
    )

    (if (= type 1) (RawCreditBaronicOuroboros account amount)
      (if (= type 2) (RawCreditBaronicAuryn account amount)
        (if (= type 3) (RawCreditBaronicEliteAuryn account amount)
          (if (= type 4) (RawCreditBaronicVestedOuroboros account amount)
            (if (= type 5) (RawCreditBaronicVestedAuryn account amount)
              (if (= type 6) (RawCreditBaronicVestedEliteAuryn account amount)
                (if (= type 7) (RawCreditBaronicBurnedOuroboros account amount)
                  (if (= type 8) (RawCreditBaronicBOVA account amount)
                    (if (= type 9) (RawCreditBaronicRecycledAuryn account amount)
                      (if (= type 10) (RawCreditBaronicRecycledEliteAuryn account amount)
                        (if (= type 11) (RawCreditBaronicVesta account amount)
                          (if (= type 12) (RawCreditBaronicSleepingVesta account amount)
                            (if (= type 13) (RawCreditBaronicFrozenVesta account amount)
                              (if (= type 14) (RawCreditBaronicGold account amount)
                                (if (= type 15) (RawCreditBaronicUnity account amount)
                                  (RawCreditBaronicEquity account amount)
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun DirectBaronicDebit (account:string amount:decimal type:integer)

    (ValidateAccountWithAmountComplex account amount "Baronic" "Debit")
    (EnforceBaronicDebitTokenType type)

    (if (or (= type 3) (= type 6))
      (require-capability (DIRECT_DEBIT_ELITE account))
      (require-capability (DIRECT_DEBIT account))
    )

    (if (= type 1) (RawDebitBaronicOuroboros account amount)
      (if (= type 2) (RawDebitBaronicAuryn account amount)
        (if (= type 3) (RawDebitBaronicEliteAuryn account amount)
          (if (= type 4) (RawDebitBaronicVestedOuroboros account amount)
            (if (= type 5) (RawDebitBaronicVestedAuryn account amount)
              (if (= type 6) (RawDebitBaronicVestedEliteAuryn account amount)
                (if (= type 11) (RawDebitBaronicVesta account amount)
                  (if (= type 12) (RawDebitBaronicSleepingVesta account amount)
                    (if (= type 14) (RawDebitBaronicGold account amount)
                      (RawDebitBaronicUnity account amount)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  ;;
  (defun DirectPlebeicCredit (account:string amount:decimal type:integer)
    (ValidateAccountWithAmountComplex account amount "Plebeic" "Credit")
    (EnforcePlebeicTokenType type)

    (if (= type 3)
      (require-capability (DIRECT_CREDIT_ELITE account))
      (require-capability (DIRECT_CREDIT account))
    )

    (if (= type 1) (RawCreditPlebeicOuroboros account amount)
      (if (= type 2) (RawCreditPlebeicAuryn account amount)
        (if (= type 3) (RawCreditPlebeicEliteAuryn account amount)
          (if (= type 11) (RawCreditPlebeicVesta account amount)
            (if (= type 14) (RawCreditPlebeicGold account amount)
              (RawCreditPlebeicUnity account amount)
            )
          )
        )
      )
    )
  )
  ;;
  (defun DirectPlebeicDebit (account:string amount:decimal type:integer)
    (ValidateAccountWithAmountComplex account amount "Plebeic" "Debit")
    (EnforcePlebeicTokenType type)

    (if (= type 3)
      (require-capability (DIRECT_DEBIT_ELITE account))
      (require-capability (DIRECT_DEBIT account))
    )

    (if (= type 1) (RawDebitPlebeicOuroboros account amount)
      (if (= type 2) (RawDebitPlebeicAuryn account amount)
        (if (= type 3) (RawDebitPlebeicEliteAuryn account amount)
          (if (= type 11) (RawDebitPlebeicVesta account amount)
            (if (= type 14) (RawDebitPlebeicGold account amount)
              (RawDebitPlebeicUnity account amount)
            )
          )
        )
      )
    )
  )
;;==============================================================================
;;RAW-CREDIT-BARONIC============================================================
;;
  (defun RawCreditBaronicOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "Ouroboros" := o }
      (let
        (
          (creditamount:decimal (+ o amount))
        )
        (update BaronicSnakeLedger account { "Ouroboros" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "Auryn" := a }
      (let
        (
          (creditamount:decimal (+ a amount))
        )
        (update BaronicSnakeLedger account { "Auryn" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "EliteAuryn" := ea, "VestedEliteAuryn" := vea }
      (let*
        (
          (creditamount:decimal (+ ea amount))
          (tea:decimal (+ creditamount vea))
        )
        (update BaronicSnakeLedger account
          { "EliteAuryn" : creditamount
          , "EliteAccountName" : (TierName tea)
          , "EliteAccountTier" : (Tier tea)
          , "EliteAccountBoost" : (TierBoost tea)
          }
        )
        (UpdateEliteAurynUncoilLedgerByElite account tea)
      )
    )
  )
  (defun RawCreditBaronicVestedOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "VestedOuroboros" := vo }
      (let
        (
          (creditamount:decimal (+ vo amount))
        )
        (update BaronicSnakeLedger account { "VestedOuroboros" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicVestedAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "VestedAuryn" := va }
      (let
        (
          (creditamount:decimal (+ va amount))
        )
        (update BaronicSnakeLedger account { "VestedAuryn" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicVestedEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "EliteAuryn" := ea, "VestedEliteAuryn" := vea }
      (let*
        (
          (creditamount:decimal (+ vea amount))
          (tea:decimal (+ creditamount ea))
        )
        (update BaronicSnakeLedger account
          { "EliteAuryn" : creditamount
          , "EliteAccountName" : (TierName tea)
          , "EliteAccountTier" : (Tier tea)
          , "EliteAccountBoost" : (TierBoost tea)
          }
        )
        (UpdateEliteAurynUncoilLedgerByElite account tea)
      )
    )
  )
  (defun RawCreditBaronicBurnedOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "BurnedOuroboros" := bo }
      (let
        (
          (creditamount:decimal (+ bo amount))
        )
        (update BaronicSnakeLedger account { "BurnedOuroboros" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicBOVA (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "BurnedOuroborosViaAutostake" := bova }
      (let
        (
          (creditamount:decimal (+ bova amount))
        )
        (update BaronicSnakeLedger account { "BurnedOuroborosViaAutostake" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicRecycledAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "RecycledAuryn" := ra }
      (let
        (
          (creditamount:decimal (+ ra amount))
        )
        (update BaronicSnakeLedger account { "RecycledAuryn" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicRecycledEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "RecycledEliteAuryn" := rea }
      (let
        (
          (creditamount:decimal (+ rea amount))
        )
        (update BaronicSnakeLedger account { "RecycledEliteAuryn" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "Vesta" := v }
      (let
        (
          (creditamount:decimal (+ v amount))
        )
        (update BaronicSnakeLedger account { "Vesta" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicSleepingVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "SleepingVesta" := sv }
      (let
        (
          (creditamount:decimal (+ sv amount))
        )
        (update BaronicSnakeLedger account { "SleepingVesta" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicFrozenVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "FrozenVesta" := fv }
      (let
        (
          (creditamount:decimal (+ fv amount))
        )
        (update BaronicSnakeLedger account { "FrozenVesta" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicGold (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "Gold" := g }
      (let
        (
          (creditamount:decimal (+ g amount))
        )
        (update BaronicSnakeLedger account { "Gold" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicUnity (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "Unity" := u }
      (let
        (
          (creditamount:decimal (+ u amount))
        )
        (update BaronicSnakeLedger account { "Unity" : creditamount })
      )
    )
  )
  (defun RawCreditBaronicEquity (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read BaronicSnakeLedger account
      { "Equity" := e }
      (let
        (
          (creditamount:decimal (+ e amount))
        )
        (update BaronicSnakeLedger account { "Equity" : creditamount })
      )
    )
  )
;;==============================================================================
;;RAW-DEBIT-BARONIC============================================================
;;
  (defun RawDebitBaronicOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "Ouroboros" := o }
      (enforce (<= amount o) "Insufficient funds to debit Ouroboros from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- o amount))
        )
        (update BaronicSnakeLedger account { "Ouroboros" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "Auryn" := a }
      (enforce (<= amount a) "Insufficient funds to debit Auryn from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- a amount))
        )
        (update BaronicSnakeLedger account { "Auryn" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "EliteAuryn" := ea, "VestedEliteAuryn" := vea }
      (enforce (<= amount ea) "Insufficient funds to debit Elite-Auryn from the Baronic Ledger!")
      (let*
        (
          (creditamount:decimal (- ea amount))
          (tea:decimal (+ creditamount vea))
        )
        (update BaronicSnakeLedger account
          { "EliteAuryn" : creditamount
          , "EliteAccountName" : (TierName tea)
          , "EliteAccountTier" : (Tier tea)
          , "EliteAccountBoost" : (TierBoost tea)
          }
        )
        (UpdateEliteAurynUncoilLedgerByElite account tea)
      )
    )
  )
  (defun RawDebitBaronicVestedOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "VestedOuroboros" := vo }
      (enforce (<= amount vo) "Insufficient funds to debit Vested Ouroboros from the Barnonic Ledger!")
      (let
        (
          (creditamount:decimal (- vo amount))
        )
        (update BaronicSnakeLedger account { "VestedOuroboros" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicVestedAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "VestedAuryn" := va }
      (enforce (<= amount va) "Insufficient funds to debit Vested Auryn from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- va amount))
        )
        (update BaronicSnakeLedger account { "VestedAuryn" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicVestedEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "EliteAuryn" := ea, "VestedEliteAuryn" := vea }
      (enforce (<= amount vea) "Insufficient funds to debit Vested Elite-Auryn from the Baronic Ledger!")
      (let*
        (
          (creditamount:decimal (- vea amount))
          (tea:decimal (+ creditamount ea))
        )
        (update BaronicSnakeLedger account
          { "EliteAuryn" : creditamount
          , "EliteAccountName" : (TierName tea)
          , "EliteAccountTier" : (Tier tea)
          , "EliteAccountBoost" : (TierBoost tea)
          }
        )
        (UpdateEliteAurynUncoilLedgerByElite account tea)
      )
    )
  )
  (defun RawDebitBaronicVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "Vesta" := v }
      (enforce (<= amount v) "Insufficient funds to debit Vesta from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- v amount))
        )
        (update BaronicSnakeLedger account { "Vesta" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicSleepingVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "SleepingVesta" := sv }
      (enforce (<= amount sv) "Insufficient funds to debit Sleeping Vesta from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- sv amount))
        )
        (update BaronicSnakeLedger account { "SleepingVesta" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicGold (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "Gold" := g }
      (enforce (<= amount g) "Insufficient funds to debit Gold from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- g amount))
        )
        (update BaronicSnakeLedger account { "Gold" : creditamount })
      )
    )
  )
  (defun RawDebitBaronicUnity (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read BaronicSnakeLedger account
      { "Unity" := u }
      (enforce (<= amount u) "Insufficient funds to debit Unity from the Baronic Ledger!")
      (let
        (
          (creditamount:decimal (- u amount))
        )
        (update BaronicSnakeLedger account { "Unity" : creditamount })
      )
    )
  )
;;==============================================================================
;;RAW-CREDIT-PLEBEIC============================================================
;;
  (defun RawCreditPlebeicOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read PlebeicSnakeLedger account
      { "Ouroboros" := o }
      (let
        (
          (creditamount:decimal (+ o amount))
        )
        (update PlebeicSnakeLedger account { "Ouroboros" : creditamount })
      )
    )
  )
  (defun RawCreditPlebeicAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read PlebeicSnakeLedger account
      { "Auryn" := a }
      (let
        (
          (creditamount:decimal (+ a amount))
        )
        (update PlebeicSnakeLedger account { "Auryn" : creditamount })
      )
    )
  )
  (defun RawCreditPlebeicEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read PlebeicSnakeLedger account
      { "EliteAuryn" := ea }
      (let
        (
          (creditamount:decimal (+ ea amount))
        )
        (update PlebeicSnakeLedger account { "EliteAuryn" : creditamount })
      )
    )
  )
  (defun RawCreditPlebeicVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read PlebeicSnakeLedger account
      { "Vesta" := v }
      (let
        (
          (creditamount:decimal (+ v amount))
        )
        (update PlebeicSnakeLedger account { "Vesta" : creditamount })
      )
    )
  )
  (defun RawCreditPlebeicGold (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read PlebeicSnakeLedger account
      { "Gold" := g }
      (let
        (
          (creditamount:decimal (+ g amount))
        )
        (update PlebeicSnakeLedger account { "Gold" : creditamount })
      )
    )
  )
  (defun RawCreditPlebeicUnity (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_CREDIT account))
    (with-read PlebeicSnakeLedger account
      { "Unity" := u }
      (let
        (
          (creditamount:decimal (+ u amount))
        )
        (update PlebeicSnakeLedger account { "Unity" : creditamount })
      )
    )
  )
;;==============================================================================
;;RAW-DEBIT-PLEBEIC============================================================
;;
  (defun RawDebitPlebeicOuroboros (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read PlebeicSnakeLedger account
      { "Ouroboros" := o }
      (enforce (<= amount o) "Insufficient funds to debit Ouroboros from the Plebeic Ledger!")
      (let
        (
          (creditamount:decimal (- o amount))
        )
        (update PlebeicSnakeLedger account { "Ouroboros" : creditamount })
      )
    )
  )
  (defun RawDebitPlebeicAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read PlebeicSnakeLedger account
      { "Auryn" := a }
      (enforce (<= amount a) "Insufficient funds to debit Auryn from the Plebeic Ledger!")
      (let
        (
          (creditamount:decimal (- a amount))
        )
        (update PlebeicSnakeLedger account { "Auryn" : creditamount })
      )
    )
  )
  (defun RawDebitPlebeicEliteAuryn (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read PlebeicSnakeLedger account
      { "EliteAuryn" := ea }
      (enforce (<= amount ea) "Insufficient funds to debit Elite-Auryn from the Plebeic Ledger!")
      (let
        (
          (creditamount:decimal (- ea amount))
        )
        (update PlebeicSnakeLedger account { "EliteAuryn" : creditamount })
      )
    )
  )
  (defun RawDebitPlebeicVesta (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read PlebeicSnakeLedger account
      { "Vesta" := v }
      (enforce (<= amount v) "Insufficient funds to debit Vesta from the Plebeic Ledger!")
      (let
        (
          (creditamount:decimal (- v amount))
        )
        (update PlebeicSnakeLedger account { "Vesta" : creditamount })
      )
    )
  )
  (defun RawDebitPlebeicGold (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read PlebeicSnakeLedger account
      { "Gold" := g }
      (enforce (<= amount g) "Insufficient funds to debit Gold from the Plebeic Ledger!")
      (let
        (
          (creditamount:decimal (- g amount))
        )
        (update PlebeicSnakeLedger account { "Gold" : creditamount })
      )
    )
  )
  (defun RawDebitPlebeicUnity (account:string amount:decimal)
    (ValidateAccountWithAmountSimple account amount)
    (require-capability (RAW_DEBIT account))
    (with-read PlebeicSnakeLedger account
      { "Unity" := u }
      (enforce (<= amount u) "Insufficient funds to debit Unity from the Plebeic Ledger!")
      (let
        (
          (creditamount:decimal (- u amount))
        )
        (update PlebeicSnakeLedger account { "Unity" : creditamount })
      )
    )
  )
;;==============================================================================
;;REPL-Usage Functions==========================================================
;;
  (defun DisplayAccountBSL (account:string)
    @doc "Displays Baronic Ledger Data for the account"
    (read BaronicSnakeLedger account)
  )
  (defun DisplayAccountPSL (account:string)
    @doc "Displays Baronic Ledger Data for the account"
    (read PlebeicSnakeLedger account)
  )
  (defun DisplayAccountAUL (account:string)
    @doc "Displays Auryn Ledger Data for the account"
    (read AurynUncoilLedger account)
  )

  (defun DisplayAccountEAUL (account:string)
    @doc "Displays Elite-Auryn Ledger Data for the account"
    (read EliteAurynUncoilLedger account)
  )
  (defun DisplayBL()
    @doc "Displays the Burning Ledger"
    (read BurningLedger BURN_COUNT)
  )
  (defun DisplaySL()
    @doc "Displays the Spwaning Ledger"
    (read SpawnCounterLedger SPAWN_COUNT)
  )
  (defun DisplaySL2()
    @doc "Displays the Spwaning Ledger"
    (read SupplyLedger SUPPLY_COUNT)
  )

;;
)
;;

(create-table PlebeicSnakeLedger)
(create-table BaronicSnakeLedger)
(create-table SpawnCounterLedger)
(create-table AurynUncoilLedger)
(create-table EliteAurynUncoilLedger)
(create-table BurningLedger)
(create-table SupplyLedger)
