(namespace "free")

;(enforce-keyset (read-keyset "DH-Master-Keyset"))
  ;@doc "Reads the a given key under the name of <DH-Master-keyset>, and then enforce it"
;(define-keyset "free.DH-Master-Keyset" (read-keyset "DH-Master-Keyset"))
;(env-data { "DH-Master-Keyset": ["6be2f485a7af75fedb4b7f1d1dba6572fb783d0fdd324685e32fbda2f89f99a6"] })
;(define-keyset "free.DH-Master-Keyset" (read-keyset "DH-Master-Keyset"))
;(define-keyset "free.DH-Master-Minter-Keyset" (read-keyset "DH-Master-Minter-Keyset"))
  ;@doc "Defines the keyset in the free namespace, using the key that was read"

;;Main Ouroboros Auryn Elite-Auryn (Snake) Smart Contract.
;; This contract employs a triple token design with vesting, therefore is a lot more complex
;; than the simple kadena coin contracts.
;;
;;
;;==============================================================================
;;
;; PART 00.1    CAPABILITIES:
;;              BARONIC_RULE - governance Capability
;;              ADMIN - admin Capability
;;              TRANSFER - transfer capability with its attached TRANSFER-mgr functions
;;              TRANSFERANEW - transfer capability used for transfer-anew
;;              IZSNAKEORNOT - checks if an account exists or not
;;              DEBIT
;;              CREDIT
;;              CREDITANEW

;;              COIL_OUROBOROS
;;              COIL_AURYN
;;                UPDATE_UNCOIL-LEDGERS
;;              UNCOIL_AURYN
;;                DEBIT_AUTOSTAKED-OUROBOROS
;;                BURN_AUTOSTAKED-OUROBOROS
;;                CREDIT_BOVA
;;              UNCOIL_AURYN-HARVEST
;;                DEBIT_UNCOILED-OUROBOROS
;;              UNCOIL_ELITE-AURYN
;;                FIX_ELITE-SIX
;;                FIX_ELITE
;;                DEBIT_ELITEHOLD-AURYN
;;              UNCOIL_ELITE-AURYN-HARVEST
;;                DEBIT_UNCOILED-AURYN
;;
;;              GENESIS_SPAWN
;;              DAILY_SPAWN
;;              MASTERMINTER
;;              NEWHEROTAG
;;              ROTATE
;;              BURN_OUROBOROS
;;              UPDATEAGE
;;
;;
;; PART 00.2    CONSTANTS
;;
;;
;; PART 00.3    SCHEMAS and TABLES
;;
;;
;; PART 01.     GENERAL FUNCTIONS

;;      01.00     UTILITY Functions
;;
;;      01.00.0    (001)BirthSnakes
;;      01.00.1    (002)EnforceSnakePrecision
;;      01.00.2a   (003)Truncate
;;      01.00.2b   (004)TruncateToSnake
;;      01.00.2c   (005)TruncateToUnity
;;      01.00.3a   (006)ValidateAccountWithTransferWithPosition
;;      01.00.3b   (007)ValidateAccountForTransfers
;;      01.00.3c   (008)ValidateAccount
;;      01.00.4a   (009)Enforce-Latin-1
;;      01.00.4b   (010)Enforce-Length
;;      01.00.6a   (d001)enforce-reserved
;;      01.00.6b   (d002)check-reserved
;;
;;
;;      01.01     HEROTAG Functions
;;
;;      01.01.1    (011)ValidateHerotag
;;      01.01.2    (012)Enforce-HT-Syntax
;;      01.01.3    (013)Enforce-HT-Uniqueness
;;      01.01.4    (014)UpdateSnakeAccountHeroTag
;;      01.01.5    (015)UpdateHeroTag
;;
;;
;;      01.02     LIST Functions
;;
;;      01.02.1    (016)MakeDemiourgosAccountList
;;      01.02.2    (017)TransferBlacklist
;;
;;
;;      01.03     IZ Functions
;;
;;      01.03.1    (018)IzHerotagUnique
;;      01.03.2    (019)IzAccountDemiourgos
;;      01.03.3    (020)IzTransferBlacklist
;;      01.03.4a   (021)IzUncoilLedgerPositionFree
;;      01.03.4b   (022)IzUncoilLedgerPositionOccupied
;;      01.03.4c   (023)IzUncoilLedgerPositionLocked
;;      01.03.4d   (024)IzUncoilLedgerPositionWhat
;;      01.03.5    (025)IzIntegerUncoilPosition
;;
;;
;;      01.04     ELITE_ACCOUNT COMPUTATION Functions
;;
;;      01.04.1    (026)FullEliteAccount
;;      01.04.2    (027)TierName
;;      01.04.3    (028)Tier
;;      01.04.4    (029)TierBoost
;;
;;
;;      01.05     BLOCKCHAIN MATH Functions
;;
;;      01.05.1    (030)ComputeDailySpawnAmount
;;      01.05.2    (031)GetAuryndex
;;      01.05.3a   (032)MakePercent
;;      01.05.3b   (033)MakePermille
;;
;;
;;      01.06     COIL/UNCOIL UTILITY F.
;;
;;      01.06.2    (034)GetUncoilLedgerPositionData
;;      01.06.3a   (035)UpdateUncoilLedgerDataIncoming
;;      01.06.3b   (036)UpdateUncoilLedgerDataOutgoing
;;      01.06.4a   (037)TakeUpdatePositionOut
;;      01.06.4b   (038)TakeUpdatePositionOutFromList
;;      01.06.5a   (039)HighestDoubleTruth
;;      01.06.5b   (040)HighestTripleTruth
;;      01.06.5c   (041)HighestQuadTruth
;;      01.06.5d   (042)HighestPentaTruth
;;      01.06.5e   (043)HighestHexaTruth
;;      01.06.5f   (044)HighestHeptaTruth
;;
;;
;; PART 02.     BALANCE RELATED Functions
;;
;;      02.01     BALANCE MANIPULATION Functions
;;
;;                 *BURN            *OUROBOROS
;;                 *CREDIT          *AURYN
;;                 *DEBIT           *ELITE.AURYN
;;                 *TRANSFER
;;                 *VEST
;;                 *UNVEST
;;                 *MERGEVESTED
;;      ===========OUROBOROS========================
;;      02.01.1    (045)BurnOuroboros              +
;;      02.01.2    (046)BurnAutostakedOuroboros    +
;;                 ===                             +
;;      02.01.3    (047)CreditOuroboros            +
;;                 ===                             +
;;      02.01.4    (048)DebitOuroboros             +
;;      02.01.5    (049)DebitAutostakedOuroboros   +
;;      02.01.6    (050)DebitUncoilHoldOuroboros   +
;;      02.01.7   +(051)DebitVestingHoldOuroboros  +
;;                 ===                             +
;;      02.01.8    (052)TransferOuroboros          +
;;      02.01.9    (053)TransferOuroborosAnew      +
;;                 ===                             +
;;      02.01.10  +(054)VestOuroboros              +
;;      02.01.11  +(055)UnvestOuroboros            +
;;      02.01.12  +(056)MergeVestedOuroboros       +
;;      ===========AURYN============================
;;      02.02.1   +(057)RecycleAuryn               +
;;                 ===                             +
;;      02.02.2    (058)CreditAuryn                +
;;                 ===                             +
;;      02.02.3    (059)DebitAuryn                 +
;;      02.02.4    (060)DebitEliteHoldAuryn        +
;;      02.02.5    (061)DebitUncoilHoldAuryn       +
;;      02.02.6   +(062)DebitVestingHoldAuryn      +
;;                 ===                             +
;;      02.02.7   +(063)TransferAuryn              +
;;      02.02.8   +(064)TransferAurynAnew          +
;;                 ===                             +
;;      02.02.9   +(065)VestAuryn                  +
;;      02.02.10  +(066)UnvestAuryn                +
;;      02.02.11  +(067)MergeVestedAuryn           +
;;      ===========ELITE-AURYN======================
;;      02.03.1   +(068)RecyleEliteAuryn           +
;;                 ===                             +
;;      02.03.2    (069)CreditEliteAuryn           +
;;                 ===                             +
;;      02.03.3    (070)DebitEliteAuryn            +
;;      02.03.4   +(071)DebitVestingHoldEliteAuryn +
;;                 ===                             +
;;      02.03.5   +(072)TransferEliteAuryn         +
;;      02.03.6   +(073)TransferEliteAurynAnew     +
;;                 ===                             +
;;      02.03.7   +(074)VestEliteAuryn             +
;;      02.03.8   +(075)UnvestEliteAuryn           +
;;      02.03.9   +(076)MergeVestedEliteAuryn      +
;;      ============================================
;;
;;
;;      02.04.    SNAKE ACCOUNT F.
;;
;;      02.04.1    (077)SpawnSnakeAccount
;;      02.04.2    (078)RotateSnakeGuard
;;
;;
;;      02.05     SNAPSHOT F.
;;
;;      02.05.1    (079)SnapshotBaronicColumn
;;      02.05.2    (080)ListBaronicColumn
;;      02.05.3    (081)GetBaronicColumnData
;;      02.05.4    (082)GetBurnData
;;                 ===
;;      02.06.1a   (083)OuroborosSupplyTotal
;;      02.06.1b   (084)OuroborosSupplyVested
;;      02.06.1c   (085)OuroborosSupply
;;      02.06.1d   (086)OuroborosBalance
;;      02.06.1e   (087)OuroborosBalanceVested
;;      02.06.1f   (088)OuroborosBalanceTotal
;;                 ===
;;      02.07.1a   (089)AurynSupplyTotal
;;      02.07.1b   (090)AurynSupplyVested
;;      02.07.1c   (091)AurynSupply
;;      02.07.1d   (092)AurynBalance
;;      02.07.1e   (093)AurynBalanceVested
;;      02.07.1f   (094)AurynBalanceTotal
;;                 ===
;;      02.08.1a   (095)GetEliteAccountTierName
;;      02.08.1b   (096)GetEliteAccountTier
;;      02.08.1c   (097)GetEliteAccountTierBoost
;;      02.08.1d   (098)EliteAurynSupplyTotal
;;      02.08.1e   (099)EliteAurynSupplyVested
;;      02.08.1f   (100)EliteAurynSupply
;;      02.08.1g   (101)EliteAurynBalance
;;      02.08.1h   (102)EliteAurynBalanceVested
;;      02.08.1i   (103)EliteAurynBalanceTotal
;;                 ===
;;      02.07.1    (104)DisplayAccountBSL
;;      02.07.2    (105)DisplayAccountAUL
;;      02.07.3    (106)DisplayAccountEAUL
;;      02.07.4    (107)DisplayBL
;;      02.07.5    (108)DisplaySL
;;
;;
;;      02.08     MINTING Functions
;;
;;      02.08.1a   (109)SpawnMintingCounter
;;      02.08.1b   (110)SpawnBurningCounter
;;      02.08.2a   (111)GetSpawnCounter
;;      02.08.2b   (112)GetSpawnEpoch
;;      02.08.3a   (113)GetBurnedOuroboros
;;      02.08.3b   (114)GetRecycledAuryn
;;      02.08.3c   (115)GetRecycledEliteAuryn
;;      02.08.4    (116)SpawnPrimordialSnakes
;;      02.08.5    (117)SpawnDailySnakes
;;      02.08.6    (118)UpdateSnakeAccountAge
;;
;;
;; PART 03.     COIL-UNCOIL Functions
;;
;;      03.01     COIL Functions
;;
;;      03.01.1    (119)CoilOuroboros
;;      03.01.2    (120)CoilAuryn
;;
;;
;;      03.02     UNCOIL AURYN Functions
;;
;;      03.02.1    (121)BestUncoilAuryn
;;      03.02.2    (122)UncoilAurynPosition
;;      03.02.3    (123)FinalizeUncoilAuryn
;;      03.02.4    (124)FinalizeUncoilAurynPosition
;;                 ===
;;      03.02.5    (125)GetAurynUncoilFee
;;      03.03.6    (126)GetAurynUncoilTime
;;      03.02.7    (127)GetBestAurynUncoilPosition
;;      03.02.8    (128)GetRipeAurynUncoilPosition
;;      03.02.9    (129)UpdateAurynUncoilLedgerIncoming
;;      03.02.10   (130)UpdateAurynUncoilLedgerOutgoing
;;
;;
;;      03.04     UNCOIL ELITE AURYN Functions
;;
;;      03.04.1    (131)BestUncoilEliteAuryn
;;      03.04.2    (132)UncoilEliteAurynPosition
;;      03.04.3    (133)FinalizeUncoilEliteAuryn
;;      03.04.4    (134)FinalizeUncoilEliteAurynPosition
;;                 ===
;;      03.04.5    (135)GetEliteAurynUncoilTimeByAmount
;;      03.04.6    (136)GetBestEliteAurynUncoilPosition
;;      03.04.7    (137)GetRipeEliteAurynUncoilPosition
;;      03.04.8    (138)UpdateEliteAurynUncoilLedgerIncoming
;;      03.04.9    (139)UpdateEliteAurynUncoilLedgerOutgoing
;;                 ===
;;      03.04.10   (140)UpdateEliteAurynUncoilLedgerByElite
;;      01.04.11   (141)FixPositionByElite
;;      01.04.12   (142)ReversePositionStatus
;;      03.04.13   (143)LockEliteAurynUncoilLedgerPosition
;;      03.04.14   (144)UnlockEliteAurynUncoilLedgerPosition
;;
;;
;; PART 04.     VESTING Functions
;;
;;      04.01     TEMPORAL FFunctions

;;      04.01.1    (145)GetCurrentEpochAuto
;;      04.01.2    (146)GetCurrentEpochManual
;;
;; PART 02      CREATE TABLES
;;
;;==============================================================================
;;
;;
;;
(module DHOuroboros  BARONIC_RULE
  @doc "DHOuroboros represents the Demiourgos.Holdings Smart-Contract module that governs\
        \all Snake Token (Ouroboros, Auryn, Elite-Auryn) functions accross the Kaden Multichain"

  @model
    [ (defproperty conserves-mass
        (= (column-delta PlebeicSnakeLedger "Ouroboros") 0.0)
      )
        ;;(= (column-delta PlebeicSnakeLedger "Auryn") 0.0)
        ;;(= (column-delta PlebeicSnakeLedger "EliteAuryn") 0.0))

      (defproperty valid-account (account:string)
        (and
          (>= (length account) 3)
          (<= (length account) 256)
        )
      )

      ;(defproperty eighteen-precision:bool (amount:decimal)
      ;  (enforce (= (floor amount MAXIMUM_SNAKE_PRECISION) amount)
      ;    (format "Amount violates maximum precision: {}" [amount])
      ;  )
      ;)
    ]
;;==============================================================================
;;
;;
;;==============================================================================
;; PART 00.1 - CAPABILITIES
;;
;;  Generic Capabilities
;;  ====================
  (defcap BARONIC_RULE ()
    ;true
    (enforce-guard (keyset-ref-guard KEY_DEMIURG))
  )

  (defcap ADMIN ()
    @doc "A guard for admin-only actions, restricted to the free.DH-Master-Keyset keyset."
    (enforce-guard (keyset-ref-guard KEY_DEMIURG))
    ;(enforce-keyset "free.DH-Master-Keyset")
  )
;; Transfer Capabilities
;; =====================
  (defcap TRANSFER:bool
    ( sender:string
      receiver:string
      amount:decimal
    )
    @doc "Capability needed for transfering Snake Tokens\
    \to an existing account."
    @managed amount TRANSFER-mgr
    (enforce (!= sender receiver) "same sender and receiver")
    (EnforceSnakePrecision amount)
    (enforce (> amount 0.0) "Positive amount")
    (compose-capability (DEBIT sender))
    (compose-capability (CREDIT receiver))
  )

  (defcap TRANSFERANEW:bool
    ( sender:string
      receiver:string
      receiver-guard:guard
      amount:decimal
    )
    @doc "Capability needed for transfering Snake Tokens\
    \to an account that doesnt exist yet"
    @managed amount TRANSFER-mgr
    (enforce (!= sender receiver) "same sender and receiver")
    (EnforceSnakePrecision amount)
    (enforce (> amount 0.0) "Positive amount")
    (compose-capability (DEBIT sender))
    (compose-capability (CREDITANEW receiver receiver-guard))
  )

  ;;Function needed for the TRANSFER Capability
  (defun TRANSFER-mgr:decimal ( managed:decimal requested:decimal)
    @doc "Function needed for managed transfers"
    (let
      (
        (newbal (- managed requested))
      )
      (enforce (>= newbal 0.0) (format "TRANSFER exceeded for balance {}" [managed]) )
      newbal
    )
  )

  (defcap IZSNAKEORNOT:bool (account:string guard:guard truth:bool)
    @doc "Capability that enforces the existance or non-existance of a Snake account\
    \<true> truth, means the existance of a Snake Account is enforced\
    \<false> truth, means the non-existance of a Snake Account is enforced"

    (with-default-read PlebeicSnakeLedger account
      { "Ouroboros" : -1.0, "Guard" : guard }
      { "Ouroboros" := bp, "Guard" := retg }
      (enforce (= retg guard)
        "account guards do not match")

      (let
        (
          (is-new-p (if (= bp -1.0) false true))
        )
        (enforce
          (= is-new-p truth)   ;;true means it exists, false means it doesnt exist
          (if
            (= truth true)
            (format "Account {} doesnt exist in the Plebeic Ledger, please create it first." [account])
            (format "Account {} exists in the Plebeic Ledger, no need to create it anew." [account])
          )
        )
      )

      (with-default-read BaronicSnakeLedger account
        { "Ouroboros" : -1.0 }
        { "Ouroboros" := bb }

        (let
          (
            (is-new-b (if (= bb -1.0) false true))
          )
          (enforce
            (= is-new-b truth)    ;;true means it exists, false means it doesnt exist
            (if
              (= truth true)
              (format "Account {} doesnt exist in the Baronic Ledger, please create it first." [account])
              (format "Account {} exists in the Baronic Ledger, no need to create it anew." [account])
            )
          )
        )
      )
    )
  )

  (defcap CREDIT (receiver:string)
    "Capability for managing crediting operations for existing Snake Accounts"
    ;;Enforces sender must exist
    (let
      (
        (receiver-guard:guard (at "Guard" (read PlebeicSnakeLedger receiver)))
      )
      (enforce (!= receiver "") "Valid Receiver")
      (compose-capability (IZSNAKEORNOT receiver receiver-guard true))
    )
  )

  (defcap DEBIT (sender:string)
    "Capability for managing debiting operations"
    ;;Enforces sender must exist
    (let
      (
        (sender-guard:guard (at "Guard" (read PlebeicSnakeLedger sender)))
      )
      (enforce-guard sender-guard)
      (enforce (!= sender "") "Valid Sender")
      (compose-capability (IZSNAKEORNOT sender sender-guard true))
    )
  )

  (defcap CREDIT_ELITE-AURYN (receiver:string)
    (compose-capability (CREDIT receiver))
    (compose-capability (FIX_ELITE-SEVEN))
  )

  (defcap DEBIT_ELITE-AURYN (receiver:string)
    (compose-capability (DEBIT receiver))
    (compose-capability (FIX_ELITE-SEVEN))
  )

  (defcap FIX_ELITE-SEVEN ()
    (compose-capability (FIX_ELITE))
  )

  (defcap CREDITANEW (receiver:string receiver-guard:guard)
    "Capability for managing crediting operations for non-existing Snake Accounts\
    \Used for the TRANSFERANEW capability needed in the TransferAnew functions\
    \TransferAnew functions are for Ouroboros, Auryn and Elite-Auryn"
    ;;Enforces sender must exist
    (enforce (!= receiver "") "Valid Receiver")
    (compose-capability (IZSNAKEORNOT receiver receiver-guard false))
  )

  ;;1/6 Morph Capabilty = COIL_OUROBOROS
  (defcap COIL_OUROBOROS:bool (sender:string amount:decimal)
    @doc "The 1st Morph Capability \
    \ Capability for managing the Coil Ouroboros operation."

    (compose-capability (DEBIT sender))
    (compose-capability (CREDIT AUTO_STAKING))
    (compose-capability (CREDIT sender))
  )

  ;;2/6 Morph Capabilty = COIL_AURYN
  (defcap COIL_AURYN:bool (sender:string)
    @doc "The 2nd Morph Capability \
    \ Capability for managing the Coil Auryn operation."

    (compose-capability (DEBIT sender))
    (compose-capability (CREDIT ELITE_HOLD))
    (compose-capability (CREDIT_ELITE-AURYN sender))

  )

  (defcap UPDATE_UNCOIL-LEDGERS ()
    true
  )

  ;;3/6 Morph Capabilty = UNCOIL_AURYN
  (defcap UNCOIL_AURYN:bool (sender:string)
    @doc "The 3rd Morph Capability \
    \ Capability for managing the initialization \
    \ of the Uncoil Auryn operation."

    (compose-capability (DEBIT sender))
    (compose-capability (DEBIT_AUTOSTAKED-OUROBOROS))
    (compose-capability (BURN_AUTOSTAKED-OUROBOROS sender))
    (compose-capability (CREDIT UNCOIL_HOLD))
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )


  (defcap DEBIT_AUTOSTAKED-OUROBOROS ()
    true
  )
  (defcap BURN_AUTOSTAKED-OUROBOROS (sender:string)
    (compose-capability (CREDIT_BOVA sender))
  )
  (defcap CREDIT_BOVA (sender:string)
    (compose-capability (CREDIT sender))
  )

  ;;4/6 Morph Capabilty = UNCOIL_AURYN-HARVEST
  (defcap UNCOIL_AURYN-HARVEST:bool (sender:string)
    @doc "The 4th Morph Capability \
    \ Capability for managing the finalization \
    \ of the Uncoil Auryn operation."

    (compose-capability (DEBIT_UNCOILED-OUROBOROS))
    (compose-capability (CREDIT sender))
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )

  (defcap DEBIT_UNCOILED-OUROBOROS ()
    true
  )

  ;;5/6 Morph Capabilty = UNCOIL_ELITE-AURYN
  (defcap UNCOIL_ELITE-AURYN:bool (sender:string)
    @doc "The 5th Morph Capability \
    \ Capability for managing the initialization \
    \ of the Uncoil Elite-Auryn operation."

    (compose-capability (DEBIT sender))
    (compose-capability (DEBIT_ELITEHOLD-AURYN))
    (compose-capability (CREDIT UNCOIL_HOLD))
    (compose-capability (FIX_ELITE-SIX))
  )

  (defcap FIX_ELITE-SIX ()
    (compose-capability (FIX_ELITE))
  )
  (defcap FIX_ELITE ()
    (compose-capability (UPDATE_UNCOIL-LEDGERS))
  )
  (defcap DEBIT_ELITEHOLD-AURYN ()
    true
  )

  ;;6/6 Morph Capabilty = UNCOIL_ELITE-AURYN-HARVEST
  (defcap UNCOIL_ELITE-AURYN-HARVEST:bool (sender:string)
    @doc "The 6th Morph Capability \
    \ Capability for managing the finalization \
    \ of the Uncoil Elite-Auryn operation."

    (compose-capability (DEBIT_UNCOILED-AURYN))
    (compose-capability (CREDIT sender))
    (compose-capability (FIX_ELITE-SIX))
  )

  (defcap DEBIT_UNCOILED-AURYN ()
    true
  )

  (defcap GENESIS_SPAWN (account:string amount:decimal )
    @doc "Both MasterMinter and GeneisMinter Keys are required for the Genesis Mint"
    (compose-capability (MASTERMINTER))
    (enforce (= amount GENESIS_AMOUNT) "Genesis Spawn must be 490.000,0")
    (compose-capability (DEBIT account))
    (compose-capability (CREDIT account))
    (compose-capability (CREDIT TREASURY))
    (compose-capability (CREDIT DEVELOPERS))
    (compose-capability (CREDIT TOKEN_SALE))
  )

  (defcap DAILY_SPAWN (account:string)
    @doc "Both MasterMinter and DailyMinter Keys are required for the daily spwan"
    (enforce (= account DAILY_MINTER) "Capability sender is not the legitimate DAILY Minter, Capability fail!")
    (compose-capability (MASTERMINTER))
    (compose-capability (DEBIT account))
    (compose-capability (DEBIT LIQUIDITY_FARMING))  ;;delivered as Auryn
    (compose-capability (DEBIT SUBSIDIARY_STAKING)) ;;delivered as Auryn
    (compose-capability (DEBIT SNAKE_STAKING))      ;;delivered as Auryn
    (compose-capability (DEBIT VEGLD_STAKING))      ;;delivered as Auryn
    (compose-capability (CREDIT account))
    (compose-capability (CREDIT AUTO_STAKING))
    (compose-capability (CREDIT BONDS))
    (compose-capability (CREDIT TREASURY))
    (compose-capability (CREDIT SHAREHOLDERS))
    (compose-capability (CREDIT DEVELOPERS))
    (compose-capability (CREDIT RAFFLES))
    (compose-capability (CREDIT LIQUIDITY_FARMING))
    (compose-capability (CREDIT SUBSIDIARY_STAKING))
    (compose-capability (CREDIT SNAKE_STAKING))
    (compose-capability (CREDIT VEGLD_STAKING))
  )

  (defcap MASTERMINTER ()
    @doc "Only the MINTER_KEYSET is master minter"
    (enforce-keyset KEY_MINTER)
  )

  (defcap NEWHEROTAG (account:string)
    (compose-capability (BURN_OUROBOROS account))
  )

  (defcap ROTATE (account:string)
    @doc "Autonomously managed capability for snake guard rotation"
    @managed
    true
  )

  (defcap BURN_OUROBOROS (account:string)
    (compose-capability (DEBIT account))
  )


  (defcap UPDATEAGE ()
    true
  )

;;==============================================================================
;;
;;
;;==============================================================================
;; PART 00.2 - CONSTANTS
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
  (defconst KEY_DAO_CODINGDIVISION "sfree.DH-DAO-CodingDivision-Keyset")
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
  (defconst TIME2:time (time "2023-08-02T12:34:00Z"))
  (defconst TIME3:time (time "2023-08-03T10:34:00Z"))
  (defconst TIME4:time (time "2023-08-23T23:59:59Z"))

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
;;==============================================================================
;;
;;
;;==============================================================================
;; PART 00.3 - Schemas and Table Definitions
;;
  (defschema PlebeicSnakeTokenLedgerSchema
    @doc "The multichain Snake Token Ledger"
    @model [(invariant (>= Ouroboros 0.0))
            (invariant (>= Auryn 0.0))
            (invariant (>= EliteAuryn 0.0))]
            ;(invariant (enforce (= (EnforceSnakePrecision Ouroboros) true)))
            ;(invariant (enforce (= (EnforceSnakePrecision Auryn) true)))
            ;(invariant (enforce (= (EnforceSnakePrecision EliteAuryn) true)))]
    Ouroboros:decimal
    Auryn:decimal
    EliteAuryn:decimal
    Guard:guard)

  (deftable PlebeicSnakeLedger:{PlebeicSnakeTokenLedgerSchema}
    @doc "Table Keys (Row names) are the Kadena Account names."
  )

  (defschema BaronicSnakeTokenLedgerSchema
    @doc "The primordial Snake Token Ledger"
    @model [(invariant (>= Age 0))
            (invariant (>= HTU 0))
            (invariant (>= Ouroboros 0.0))
            (invariant (>= Auryn 0.0))
            (invariant (>= EliteAuryn 0.0))
            (invariant (>= VestedOuroboros 0.0))
            (invariant (>= VestedAuryn 0.0))
            (invariant (>= VestedEliteAuryn 0.0))
            (invariant (>= BurnedOuroboros 0.0))
            (invariant (>= BurnedOuroborosViaAutostake 0.0))
            (invariant (>= RecycledAuryn 0.0))
            (invariant (>= RecycledEliteAuryn 0.0))
            (invariant (>= Vesta 0.0))
            (invariant (>= SleepingVesta 0.0))
            (invariant (>= FrozenVesta 0.0))
            (invariant (>= Gold 0.0))
            (invariant (>= Unity 0.0))
            (invariant (>= Equity 0.0))]


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
    @model [ (invariant (>= spawncounter -1)) ]

    spawncounter:integer
    spawnepoch:integer
  )

  (deftable SpawnCounterLedger:{SpawnSchema})

  (defschema AurynUncoilSchema
    @doc "Schema holding the Auryn Uncoil Data"

    @model [(invariant (>= P1A 0.0))
            (invariant (>= P2A 0.0))
            (invariant (>= P3A 0.0))
            (invariant (>= P4A 0.0))
            (invariant (>= P5A 0.0))
            (invariant (>= P6A 0.0))
            (invariant (>= P7A 0.0))
            (invariant (>= P1E 0))
            (invariant (>= P2E 0))
            (invariant (>= P3E 0))
            (invariant (>= P4E 0))
            (invariant (>= P5E 0))
            (invariant (>= P6E 0))
            (invariant (>= P7E 0))]

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

  (deftable AurynUncoilLedger:{AurynUncoilSchema})

  (defschema EliteAurynUncoilSchema
    @doc "Schema holding the Elite Auryn Uncoil Data"

    @model [(invariant (>= P1A -1.0))
            (invariant (>= P2A -1.0))
            (invariant (>= P3A -1.0))
            (invariant (>= P4A -1.0))
            (invariant (>= P5A -1.0))
            (invariant (>= P6A -1.0))
            (invariant (>= P7A -1.0))
            (invariant (>= P1E -1))
            (invariant (>= P2E -1))
            (invariant (>= P3E -1))
            (invariant (>= P4E -1))
            (invariant (>= P5E -1))
            (invariant (>= P6E -1))
            (invariant (>= P7E -1))]

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

  (deftable EliteAurynUncoilLedger:{EliteAurynUncoilSchema})

  (defschema BurnSchema
    @doc "Table counting the burned Ouroboros Amount"
    @model [ (invariant (>= BurnedSnake 0)) ]

    BurnedSnake:decimal
    RecycledAuryn:decimal
    RecycledEliteAuryn:decimal
    )

  (deftable BurningLedger:{BurnSchema})
;;
;;==============================================================================
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.00     UTILITY Functions
;;      01.00.0    (001)BirthSnakes
;;
;;==============================================================================
;;
  (defun BirthSnakes ()
    @doc "Initialize the module the first time it is deployed \
    \ Initializes Tables that must have at least one entry \
    \ MASTERMINTER cap is required, which enforces the KEY_MINTER key"

    (with-capability (MASTERMINTER)
      (SpawnMintingCounter)
      (SpawnBurningCounter)
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.00     UTILITY Functions
;;      01.00.1    (002)EnforceSnakePrecision
;;
;;==============================================================================
;;
  (defun EnforceSnakePrecision:bool (amount:decimal)
    @doc "For transacting purposes, make sure all amounts \
    \ have a maximum of 18 decimals"

    (enforce
      (= (floor amount MAXIMUM_SNAKE_PRECISION)
        amount)
      (format "Amount violates maximum precision: {}" [amount])
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.00     UTILITY Functions
;;      01.00.2a   (003)Truncate
;;      01.00.2b   (004)TruncateToSnake
;;      01.00.2c   (005)TruncateToUnity
;;
;;==============================================================================
;;
  (defun Truncate:decimal (amount:decimal decimals:integer)
    @doc "Truncates a decimal number to the specified amount of decimals \
    \ Used when doing math that outputs specific coin amounts"

    (floor amount MAXIMUM_SNAKE_PRECISION)
  )
  ;;
  (defun TruncateToSnake (amount:decimal)
    @doc "Truncates a decimal number to 18 decimals \
    \ Used when doing math that must output Snake Token specific coin amounts \
    \ or amounts that must be restricted to 18 decimals"

    (Truncate amount MAXIMUM_SNAKE_PRECISION)
  )
  ;;
  (defun TruncateToUnity (amount:decimal)
    @doc "Truncates a decimal number to 24 decimals \
    \ Used when doing math that must output Unity/GSC specific coin amounts \
    \ or amounts that must be restricted to 24 decimals"

    (Truncate amount UNITY_PRECISION)
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.00     UTILITY Functions
;;      01.00.3a   (006)ValidateAccountWithTransferWithPosition
;;      01.00.3b   (007)ValidateAccountForTransfers
;;      01.00.3c   (008)ValidateAccount
;;
;;==============================================================================
;;
  (defun ValidateAccountWithTransferWithPosition (account:string position:integer)
    @doc "Executes a triple validation, for easier use \
    \ where such a triple validation is needed"

    (ValidateAccount account)
    (ValidateAccountForTransfers account)
    (enforce (= (IzIntegerUncoilPosition position) true) "Position number is incorrect!")
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
        (iztb (IzTransferBlacklist account))
      )
      (enforce
        (= iztb false)
        (format "You cannot transfer to a blacklisted account")
      )
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.00     UTILITY Functions
;;      01.00.4a   (009)Enforce-Latin-1
;;      01.00.4b   (010)Enforce-Length
;;
;;==============================================================================
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.00     UTILITY Functions
;;      01.00.6a   (d001)enforce-reserved
;;      01.00.6a   (d001)enforce-reserved
;;
;;==============================================================================
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
;;==============================================================================
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.01     HEROTAG Functions
;;      01.01.1    (011)ValidateHerotag
;;
;;==============================================================================
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.01     HEROTAG Functions
;;      01.01.2    (012)Enforce-HT-Syntax
;;
;;==============================================================================
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
        (izdh (IzAccountDemiourgos account))
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.01     HEROTAG Functions
;;      01.01.3    (013)Enforce-HT-Uniqueness
;;
;;==============================================================================
;;
  (defun Enforce-HT-Uniqueness (herotag:string)
    @doc "Enforces that the HeroTag is unique."

    (let
      (
        (truth:bool (IzHerotagUnique herotag))
      )
      (enforce (= truth false) "The Herotag must be unique")
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.01     HEROTAG Functions
;;      01.01.4    (014)UpdateSnakeAccountHeroTag
;;
;;==============================================================================
;;
  (defun UpdateSnakeAccountHeroTag (account:string guard:guard new-herotag:string)
    @doc "Main Function that must be called to update Herotag\
    \ Protected bz NEWHEROTAG capability, which is composed with the DEBIT cap \
    \ Because the second HT change costs 5 Ouroboros which is burned."

    @model [(property (valid-account account))]

    (ValidateAccount account)
    ;(enforce-reserved account guard)

    (with-capability (NEWHEROTAG account)
      (UpdateHeroTag account guard new-herotag)
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.01     HEROTAG Functions
;;      01.01.5    (015)UpdateHeroTag
;;
;;==============================================================================
;;
  (defun UpdateHeroTag (account:string guard:guard new-herotag:string)
    @doc "Core Function that is called to update Herotag \
    \ Cannot be used directly because it requires the NEWHEROTAG cap."


    ;;DH© Starting Herotags cannot be changed.
    (let
      (
        (izdh (IzAccountDemiourgos account))
      )
      (enforce (= izdh false) "Demiourgos.Holdings Accounts cannot update their Herotags")
    )

    (require-capability (NEWHEROTAG account))
    (with-read PlebeicSnakeLedger account
      { "Guard" := g }
      ; making sure only account owners can change their herotag
      (enforce (= g guard) "Account guards do not match!")
      (with-read BaronicSnakeLedger account
        { "ATHT" := ht , "HTU" := u}
        (enforce (!= ht new-herotag) "New Herotag Must be different than the last HeroTag")
        (ValidateHerotag new-herotag account)
        (if (>= u 1) (BurnOuroboros account HEROTAG_UPDATE_PRICE) "First Herotag update is free.")
        (update BaronicSnakeLedger account
          { "ATHT" : new-herotag
            , "HTU" : (+ u 1)}
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.02     LIST Functions
;;      01.02.1    (016)MakeDemiourgosAccountList
;;
;;==============================================================================
;;
  (defun MakeDemiourgosAccountList ()
    @doc "List of all Demiourgos.Holdings Accounts"

    [GENESIS_MINTER DAILY_MINTER TOKEN_SALE
     AUTO_STAKING ELITE_HOLD UNCOIL_HOLD VESTING_HOLD
     BONDS TREASURY DEVELOPERS RAFFLES
     SHAREHOLDERS LIQUIDITY_FARMING SNAKE_STAKING SUBSIDIARY_STAKING VEGLD_STAKING
     DAO_SNAKE DAO_CODINGDIVISION DAO_VESTAXFINANCE DAO_RENTALDIVISION
     DAO_CINEMACAFFE DAO_UNITY DAO_OVERUNITY
     DAO_BLOODSHED DAO_XBUNNY DAO_NOSFERATU
    ]
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.02     LIST Functions
;;      01.02.2    (017)TransferBlacklist
;;
;;==============================================================================
;;
  (defun TransferBlacklist ()
    @doc "List of all Transfer Blacklisted Accounts.\
    \ Transfers towards these accounts must not be allowed. \
    \ Instead these accounts are fuelled indirectly"

    [AUTO_STAKING ELITE_HOLD VESTING_HOLD UNCOIL_HOLD DAILY_MINTER]
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.03     IZ Functions
;;      01.03.1    (018)IzHerotagUnique
;;
;;==============================================================================
;;
  (defun IzHerotagUnique:bool (herotag:string)
    @doc "Checks if Herotag is unique \
    \ Returns <false> if Herotag is unique "

    (contains herotag (ListBaronicColumn "ATHT"))

  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.03     IZ Functions
;;      01.03.2    (019)IzAccountDemiourgos
;;
;;==============================================================================
;;
  (defun IzAccountDemiourgos (account:string)
    @doc "Checks if the account is a Demiourgos Account \
    \ Returns <true> if it is "

    (contains account (MakeDemiourgosAccountList))
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.03     IZ Functions
;;      01.03.3    (020)IzTransferBlacklist
;;
;;==============================================================================
;;
  (defun IzTransferBlacklist (account:string)
    @doc "Checks if the account is transfer blacklisted \
    \ Returns <true> if it is "

    (contains account (TransferBlacklist))
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.03     IZ Functions
;;      01.03.4a   (021)IzUncoilLedgerPositionFree
;;      01.03.4b   (022)IzUncoilLedgerPositionOccupied
;;      01.03.4c   (023)IzUncoilLedgerPositionLocked
;;      01.03.4d   (024)IzUncoilLedgerPositionWhat
;;
;;==============================================================================
;;
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.03     IZ Functions
;;      01.03.5    (025)IzIntegerUncoilPosition
;;
;;==============================================================================
;;
  (defun IzIntegerUncoilPosition:bool (position:integer)
    @doc "Given an integer number \
    \ Checks if this number is valid in representing an Uncoil Position \
    \ Valid integer are 1 2 3 4 5 6 and 7 \
    \ Any other decimal would return false. \
    \ It usage is in enforcing the result to be <true>."

    (contains position [1 2 3 4 5 6 7])
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.04     ELITE_ACCOUNT COMPUTATION Functions
;;      01.04.1    (026)FullEliteAccount
;;
;;==============================================================================
;;
  (defun FullEliteAccount (input:decimal)
    @doc "Ouputs 3 variables in a list, their order is \
    \ Elite Account Tier Name, Elite Account Tier, Elite Account Tier Boost."

    [(TierName input) (Tier input) (TierBoost input)]

  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.04     ELITE_ACCOUNT COMPUTATION Functions
;;      01.04.2    (027)TierName
;;
;;==============================================================================
;;
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.04     ELITE_ACCOUNT COMPUTATION Functions
;;      01.04.3    (028)Tier
;;
;;==============================================================================
;;
  (defun Tier:integer (input:decimal)
    @doc "Computes Elite Account Tier as integer using decimal input."

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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.04     ELITE_ACCOUNT COMPUTATION Functions
;;      01.04.4    (029)TierBoost
;;
;;==============================================================================
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
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.05     BLOCKCHAIN MATH Functions
;;      01.05.1    (030)ComputeDailySpawnAmount
;;
;;==============================================================================
;;
  (defun ComputeDailySpawnAmount ()
    @doc "Outputs the daily Ouroboros Mint Issuance \
    \ Equals 10.000th of the difference between \
    \ Maximum theorethical Supply and Current actual Supply."

    (let
      (
        (x:decimal (OuroborosSupplyTotal))
        (y:decimal CEILING)
      )
      (floor (/ (- y x) MINT_SPEED) MAXIMUM_SNAKE_PRECISION)
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.05     BLOCKCHAIN MATH Functions
;;      01.05.2    (031)GetAuryndex
;;
;;==============================================================================
;;
  (defun GetAuryndex:decimal ()
    @doc "Computes the current Auryndex \
    \ Auryndex is the Index that indexes Auryn in Ouroboros. \
    \ Auryndes = Ouroboros Amount in Autostake pool \
    \ divided by the total Auryn amount. \
    \ It starts as 1.0 and becomes Supraunitary growing with a iota daily."

    (let
      (
        (x:decimal (OuroborosBalance AUTO_STAKING))
        (y:decimal (AurynSupplyTotal))
      )
      (if (or (= x y) (= y 0.0))
        (TruncateToSnake 1.0)
        (TruncateToSnake (/ x y))
      )
    )
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.05     BLOCKCHAIN MATH Functions
;;      01.05.3a   (032)MakePercent
;;      01.05.3b   (033)MakePermille
;;
;;==============================================================================
;;
  (defun MakePercent:decimal (amount:decimal percent:decimal)
    @doc "Given a number and a percent \
    \ Outputs said percent in absolute value \
    \ From the given Number "

    (enforce (> amount 0.0) "Positive amount")
    (TruncateToSnake (* amount (/ percent 100.0)))
  )
  ;;
  (defun MakePermille:decimal (amount:decimal permille:decimal)
    @doc "Given a number and a permille \
    \ Outputs said permille in absolute value \
    \ From the given Number "

    (enforce (> amount 0.0) "Positive amount")
    (TruncateToSnake (* amount (/ permille 1000.0)))
  )
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.06     COIL/UNCOIL UTILITY F.
;;      01.06.2    (034)GetUncoilLedgerPositionData
;;
;;==============================================================================
;;
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.06     COIL/UNCOIL UTILITY F.
;;      01.06.3a   (035)UpdateUncoilLedgerDataIncoming
;;      01.06.3b   (036)UpdateUncoilLedgerDataOutgoing
;;
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
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.06     COIL/UNCOIL UTILITY F.
;;      01.06.4a   (037)TakeUpdatePositionOut
;;      01.06.4b   (038)TakeUpdatePositionOutFromList
;;
;;==============================================================================
;;
  (defun TakeUpdatePositionOut (position:integer)
    @doc "Creates a list of positions, excludind the input position."

    (let*
      (
        (pl [1 2 3 4 5 6 7])
        (first (take (- position 1) pl))
        (second (drop position pl))
      )
      (+ first second)
    )
  )
;;
(defun TakeUpdatePositionOutFromList (position:integer inputlist:[integer])
  @doc "Creates a list of Position Types, excludind the input position."

  (enforce (=  (length inputlist) 7) "List must be 7 elements long")
  (let*
    (
      (first (take (- position 1) inputlist))
      (second (drop position inputlist))
    )
    (+ first second)
  )
)
;;
;;==============================================================================
;; PART 01.     GENERAL FUNCTIONS
;;      01.06     COIL/UNCOIL UTILITY F.
;;      01.06.5a   (039)HighestDoubleTruth
;;      01.06.5b   (040)HighestTripleTruth
;;      01.06.5c   (041)HighestQuadTruth
;;      01.06.5d   (042)HighestPentaTruth
;;      01.06.5e   (043)HighestHexaTruth
;;      01.06.5f   (044)HighestHeptaTruth
;;
;;==============================================================================
;;
  (defun  HighestDoubleTruth:integer (truthlist:[bool])
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
;;==============================================================================
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.1    (045)BurnOuroboros
;;
;;==============================================================================
;;
  (defun BurnOuroboros:string (account:string amount:decimal)
    @doc "Burns Ouroboros Amount from Account balance\
    \ Function is protected by the BURN_OUROBOROS Capability"

    @model [(property (> amount 0.0))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "Burn Ouroboros Amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (BURN_OUROBOROS account))

    ;;Debits the Account of Ouroboros
    (DebitOuroboros account amount)

    ;;Credits the burned Amount to the burning Ledger
    (with-read BurningLedger BURN_COUNT
      { "BurnedSnake" := bs }
      (update BurningLedger BURN_COUNT
        { "BurnedSnake" : (+ bs amount) }
      )
    )

    ;;Updates entry in own account.
    (with-read BaronicSnakeLedger account
      { "BurnedOuroboros" := bo }
      (update BaronicSnakeLedger account
        { "BurnedOuroboros" : (+ bo amount) }
      )
    )

  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.2    (046)BurnAutostakedOuroboros
;;
;;==============================================================================
;;
  (defun BurnAutostakedOuroboros:string (amount:decimal bywhom:string)
    @doc "Burns Ouroboros Amount from Autostake Pool\
    \ Function is protected by the BURN_AUTOSTAKED-OUROBOROS Capability.\
    \ When uncoiling Auryn, is used to manually burn the uncoil fee."

    @model [(property (> amount 0.0))
            (property (valid-account AUTO_STAKING))]

    (ValidateAccount AUTO_STAKING)
    (enforce (> amount 0.0) "debit amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (BURN_AUTOSTAKED-OUROBOROS bywhom))

    ;;Debits the Autostake Pool "manually":
    ;;DEBITING Directly the Autostake fee amount from the Plebeic Ledger
    (with-read PlebeicSnakeLedger AUTO_STAKING
      { "Ouroboros" :=op }
      (enforce (<= amount op) "You cannot drain all Autostake Pool (plebeic) with fees")
      (update PlebeicSnakeLedger AUTO_STAKING
        { "Ouroboros" : (- op amount) }
      )
    )
    ;;DEBITING Directly the Autostake fee amount from the Baronic Ledger
    (with-read BaronicSnakeLedger AUTO_STAKING
      { "Ouroboros" := ob }
      (enforce (<= amount ob) "You cannot drain all Autostake Pool (baronic) with fees")
      (update BaronicSnakeLedger AUTO_STAKING
        { "Ouroboros" : (- ob amount) }
      )
    )
    ;;Credits the burned fee amount to the burning Ledger
    (with-read BurningLedger BURN_COUNT
      { "BurnedSnake" := bs }
      (update BurningLedger BURN_COUNT
        { "BurnedSnake" : (+ bs amount) }
      )
    )
    ;;Updates entry in AUTO_STAKING account.
    (with-read BaronicSnakeLedger AUTO_STAKING
      { "BurnedOuroboros" := bo }
      (update BaronicSnakeLedger AUTO_STAKING
        { "BurnedOuroboros" : (+ bo amount) }
      )
    )
    ;;Updates entry in senders account
    (with-read BaronicSnakeLedger bywhom
      { "BurnedOuroborosViaAutostake" := bova }
      (update BaronicSnakeLedger bywhom
        { "BurnedOuroborosViaAutostake" : (+ bova amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.3    (047)CreditOuroboros
;;
;;==============================================================================
;;
  (defun CreditOuroboros:string (account:string guard:guard amount:decimal truth:bool)
    @doc "Credits Ouroboros Amount to Account balance\
    \ Truth <true> is used for standard credit, while\
    \ Truth <false> is used for credit to a new non existing account"

    @model [(property (> amount 0.0))
            (property (eighteen-precision amount))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)
    (if (= truth true)
      (require-capability (CREDIT account))
      (require-capability (CREDITANEW account guard))
    )

    ;;
    ;;Update Plebeic Ledger
    (with-read PlebeicSnakeLedger account
      { "Ouroboros" := o1, "Guard" := retg }
      ; we don't want to overwrite an existing guard with the user-supplied one
      (enforce (= retg guard) "Account guards do not match!")

      (let
        (
          (oa1:decimal (+ o1 amount))
        )
        ;;
        (update PlebeicSnakeLedger account
          { "Ouroboros" : oa1
            , "Guard"   : retg
          }
        )
      )
    )
    ;;
    ;;Update Baronic Ledger
    (with-read BaronicSnakeLedger account
      { "Ouroboros" := o2 }

      (let
        (
          (oa2:decimal (+ o2 amount))
        )
        (update BaronicSnakeLedger account
          { "Ouroboros" : oa2}
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.4    (048)DebitOuroboros
;;
;;==============================================================================
;;
  (defun DebitOuroboros:string (account:string amount:decimal)
    @doc "Debit Ouroboros Amount from Account balance"

    @model [(property (> amount 0.0))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "debit amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (DEBIT account))
    ;;
    ;;Update Plebeic Ledger
    (with-read PlebeicSnakeLedger account
      { "Ouroboros" := o1 }
      (enforce (<= amount o1) "Insufficient funds")
      (update PlebeicSnakeLedger account
        { "Ouroboros" : (- o1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger
    (with-read BaronicSnakeLedger account
      { "Ouroboros" := o2 }
      (enforce (<= amount o2) "Insufficient funds")
      (update BaronicSnakeLedger account
        { "Ouroboros" : (- o2 amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.5    (049)DebitAutostakedOuroboros
;;
;;==============================================================================
;;
  (defun DebitAutostakedOuroboros:string (amount:decimal)
    @doc "Debit Ouroboros Amount from the Autostake Pool \
    \ the main difference is that this is protected by a special \
    \ capability so that debiting the Autostake Pool \
    \ doesnt require the Autostake Pool keys."

    @model [(property (> amount 0.0))
            (property (valid-account AUTO_STAKING))]

    (enforce (> amount 0.0) "Debited Autostaked amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (DEBIT_AUTOSTAKED-OUROBOROS))
    ;;
    ;;Update Plebeic Ledger for the Autostake Account
    (with-read PlebeicSnakeLedger AUTO_STAKING
      { "Ouroboros" := o1 }
      (enforce (<= amount o1) "Insufficient funds")
      (update PlebeicSnakeLedger AUTO_STAKING
        { "Ouroboros" : (- o1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger for the Autostake Account
    (with-read BaronicSnakeLedger AUTO_STAKING
      { "Ouroboros" := o2 }
      (enforce (<= amount o2) "Insufficient funds")
      (update BaronicSnakeLedger AUTO_STAKING
        { "Ouroboros" : (- o2 amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.6    (050)DebitUncoilHoldOuroboros
;;
;;==============================================================================
;;
  (defun DebitUncoilHoldOuroboros:string (amount:decimal)
    @doc "Debit Ouroboros Amount from the Uncoil Hold \
    \ the main difference is that this is protected by a special \
    \ capability so that debiting the Uncoil Hold \
    \ doesnt require the Uncoil Hold keys."

    @model [(property (> amount 0.0))
            (property (valid-account UNCOIL_HOLD))]

    (enforce (> amount 0.0) "Debited UncoilHold amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (DEBIT_UNCOILED-OUROBOROS))
    ;;
    ;;Update Plebeic Ledger for the Autostake Account
    (with-read PlebeicSnakeLedger UNCOIL_HOLD
      { "Ouroboros" := o1 }
      (enforce (<= amount o1) "Insufficient funds")
      (update PlebeicSnakeLedger UNCOIL_HOLD
        { "Ouroboros" : (- o1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger for the Autostake Account
    (with-read BaronicSnakeLedger UNCOIL_HOLD
      { "Ouroboros" := o2 }
      (enforce (<= amount o2) "Insufficient funds")
      (update BaronicSnakeLedger UNCOIL_HOLD
        { "Ouroboros" : (- o2 amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.7   +(051)DebitVestingHoldOuroboros
;;
;;==============================================================================
;;
  (defun DebitVestingHoldOuroboros:string (amount:decimal)
    @doc "Debit Ouroboros Amount from the Vesting Hold \
    \ the main difference is that this is protected by a special \
    \ capability so that debiting the Vesting Hold \
    \ doesnt require the Vesting Hold keys."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.8    (052)TransferOuroboros
;;
;;==============================================================================
;;
  (defun TransferOuroboros:string (sender:string receiver:string amount:decimal)
    @doc "Transfers Ouroboros from on account to another \
    \ Requires that both accounts exist."

    @model [(property conserves-mass)
            (property (> amount 0.0))
            (property (valid-account sender))
            (property (valid-account receiver))
            (property (!= sender receiver))]

    ;;Sender and Receiver cannot be the transfer blacklisted Accounts
    (ValidateAccountForTransfers sender)
    (ValidateAccountForTransfers receiver)

    (enforce (!= sender receiver) "sender cannot be the receiver of a transfer")
    (ValidateAccount sender)
    (ValidateAccount receiver)

    (enforce (> amount 0.0) "transfer amount must be positive")
    (EnforceSnakePrecision amount)

    (with-capability (TRANSFER sender receiver amount)
      (DebitOuroboros sender amount)
      (with-read PlebeicSnakeLedger receiver
        { "Guard" := g }
        (CreditOuroboros receiver g amount true)
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.9    (053)TransferOuroborosAnew
;;
;;==============================================================================
;;
  (defun TransferOuroborosAnew:string (sender:string receiver:string receiver-guard:guard receiver-herotag:string amount:decimal)
    @doc "Transfers Ouroboros from one account to an account that doesnt exist yet \
    \ Receiver account must not exist, in oder for the function to work. \
    \ Sender is responsible for generaing the HeroTag of the Receiver \
    \ However the HeroTag can be changed one time for free by the receiver. \
    \ Each subsequent change after that will burn 5 Ouroboros."

    @model [(property conserves-mass)
            (property (> amount 0.0))
            (property (valid-account sender))
            (property (valid-account receiver))
            (property (!= sender receiver))]

    ;;Create receiver Snake Account; Fails if account allready exists.
    (SpawnSnakeAccount receiver receiver-guard receiver-herotag)

    ;;Sender and Receiver cannot be the transfer blacklisted Accounts
    (ValidateAccountForTransfers sender)
    (ValidateAccountForTransfers receiver)

    (enforce (!= sender receiver) "sender cannot be the receiver of a transfer")
    (ValidateAccount sender)
    (ValidateAccount receiver)

    (enforce (> amount 0.0) "transfer amount must be positive")
    (EnforceSnakePrecision amount)

    (with-capability (TRANSFERANEW sender receiver receiver-guard amount)
      (DebitOuroboros sender amount)
      (with-read PlebeicSnakeLedger receiver
        { "Guard" := g }
        (enforce (= g receiver-guard) "Transfer must happen to the created Snake Account")
        (CreditOuroboros receiver g amount false)
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.10   +(054)VestOuroboros
;;
;;==============================================================================
;;
  (defun VestOuroboros (amount:decimal vesting:integer)
    @doc "Vests an Ouroboros amount with <vesting> nr. of days"

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.11  +(055)UnvestOuroboros
;;
;;==============================================================================
;;
  (defun UnvestOuroboros (amount:decimal)
    @doc "Unvests a batch of Vested Ouroboros, converting it back \
    \ to free liquid Ouroboros \
    \ Only possible if vesting has expired."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.01     BALANCE MANIPULATION Functions
;;      02.01.12  +(056)MergeVestedOuroboros
;;
;;==============================================================================
;;
  (defun MergeVestedOuroboros (amount:decimal)
    @doc "Merge 2 or more batches of Vested Ouroboros \
    \ The amount is added, and the vesting time \
    \ is is computed usng weigthed arithmetic mean. "

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.1   +(057)RecycleAuryn
;;
;;==============================================================================
;;
  (defun RecycleAuryn  (amount:decimal)
    @doc "Recycles Auryn, which is a form of Burn \
    \ While Ouroboros is burned effectively, \
    \ burning Auryn doest effectivel burn it, but rather \
    \ moves it to special designated destinations. "

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.2    (058)CreditAuryn
;;
;;==============================================================================
;;
  (defun CreditAuryn:string (account:string guard:guard amount:decimal)
    @doc "Credits Auryn Amount to Account balance. \
    \ Auryn is created either by Coiling Ouroboros or \
    \ by Uncoiing Elite-Auryn. "

    @model [(property (> amount 0.0))
            (property (eighteen-precision amount))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)
    ;;Autostaking Account cannot be credited Auryn
    ;;Autostake Pool cannot autostake
    (enforce (!= account AUTO_STAKING) "Autostake Pool cannot hold Auryn")

    (require-capability (CREDIT account))
    ;;
    ;;Update Plebeic Ledger
    (with-read PlebeicSnakeLedger account
      { "Auryn" := a1, "Guard" := retg }
      ; we don't want to overwrite an existing guard with the user-supplied one
      (enforce (= retg guard) "Account guards do not match!")

      (let
        (
          (aa1:decimal (+ a1 amount))
        )
        ;;
        (update PlebeicSnakeLedger account
          { "Auryn" : aa1
            , "Guard"   : retg
          }
        )
      )
    )
    ;;
    ;;Update Baronic Ledger
    (with-read BaronicSnakeLedger account
      { "Auryn" := a2 }

      (let
        (
          (aa2:decimal (+ a2 amount))
        )
        (update BaronicSnakeLedger account
          { "Auryn" : aa2}
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.3    (059)DebitAuryn
;;
;;==============================================================================
;;
  (defun DebitAuryn:string (account:string amount:decimal)
    @doc "Debits Auryn Amount from Account balance."

    @model [(property (> amount 0.0))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "debit amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (DEBIT account))
    ;;
    ;;Update Plebeic Ledger
    (with-read PlebeicSnakeLedger account
      { "Auryn" := a1 }
      (enforce (<= amount a1) "Insufficient funds")
      (update PlebeicSnakeLedger account
        { "Auryn" : (- a1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger
    (with-read BaronicSnakeLedger account
      { "Auryn" := a2 }
      (enforce (<= amount a2) "Insufficient funds")
      (update BaronicSnakeLedger account
        { "Auryn" : (- a2 amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.4    (060)DebitEliteHoldAuryn
;;
;;==============================================================================
;;
  (defun DebitEliteHoldAuryn (amount:decimal)
    @doc "Debits Auryn from the Elite Hold \
    \ Used when uncoiling Elite-Auryn."

    @model [(property (> amount 0.0))
            (property (valid-account ELITE_HOLD))]

    (enforce (> amount 0.0) "Debited Auryn amount to the Elite Hold must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (DEBIT_ELITEHOLD-AURYN))
    ;;
    ;;Update Plebeic Ledger for the Autostake Account
    (with-read PlebeicSnakeLedger ELITE_HOLD
      { "Auryn" := a1 }
      (enforce (<= amount a1) "Insufficient funds")
      (update PlebeicSnakeLedger ELITE_HOLD
        { "Auryn" : (- a1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger for the Autostake Account
    (with-read BaronicSnakeLedger ELITE_HOLD
      { "Auryn" := a2 }
      (enforce (<= amount a2) "Insufficient funds")
      (update BaronicSnakeLedger ELITE_HOLD
        { "Auryn" : (- a2 amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.5    (061)DebitUncoilHoldAuryn
;;
;;==============================================================================
;;
  (defun DebitUncoilHoldAuryn (amount:decimal)
    @doc "Debits Auryn from the Uncoil Hold \
    \ Used when finalizig uncoiling Elite-Auryn."

    @model [(property (> amount 0.0))
            (property (valid-account UNCOIL_HOLD))]

    (enforce (> amount 0.0) "Debited UncoilHold amount must be positive")
    (EnforceSnakePrecision amount)
    (require-capability (DEBIT_UNCOILED-AURYN))
    ;;
    ;;Update Plebeic Ledger for the Autostake Account
    (with-read PlebeicSnakeLedger UNCOIL_HOLD
      { "Auryn" := o1 }
      (enforce (<= amount o1) "Insufficient funds")
      (update PlebeicSnakeLedger UNCOIL_HOLD
        { "Auryn" : (- o1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger for the Autostake Account
    (with-read BaronicSnakeLedger UNCOIL_HOLD
      { "Auryn" := o2 }
      (enforce (<= amount o2) "Insufficient funds")
      (update BaronicSnakeLedger UNCOIL_HOLD
        { "Auryn" : (- o2 amount) }
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.6   +(062)DebitVestingHoldAuryn
;;
;;==============================================================================
;;
  (defun DebitVestingHoldAuryn (amount:decimal)
    @doc "Debits Auryn from the Vesting Hold \
    \ Used when unvesting Auryn."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.7   +(063)TransferAuryn
;;
;;==============================================================================
;;
  (defun TransferAuryn (amount:decimal)
    @doc "Transfer Auryn from one accoun to another. \
    \ Both acconts must exist. \
    \ A 5% volumetric fee is requred for the transfer \
    \ which is recycled."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.8   +(064)TransferAurynAnew
;;
;;==============================================================================
;;
  (defun TransferAurynAew (amount:decimal)
    @doc "Transfer Auryn from one accoun to another account that doesnt exist. \
    \ Same as for the normal Transfer function,  \
    \ A 5% volumetric fee is requred for the transfer \
    \ which is recycled."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.9   +(065)VestAuryn
;;
;;==============================================================================
;;
  (defun VestAuryn  (amount:decimal vesting:integer)
    @doc "Vests an Auryn  amount with <vesting> nr. of days"

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.10  +(066)UnvestAuryn
;;
;;==============================================================================
;;
  (defun UnvestAuryn  (amount:decimal)
    @doc "Unvests a batch of Vested Auryn , converting it back \
    \ to free liquid Auryn  \
    \ Only possible if vesting has expired."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.02     BALANCE MANIPULATION Functions
;;      02.02.11  +(067)MergeVestedAuryn
;;
;;==============================================================================
;;
  (defun MergeVestedAuryn  (amount:decimal)
    @doc "Merge 2 or more batches of Vested Auryn  \
    \ The amount is added, and the vesting time \
    \ is is computed usng weigthed arithmetic mean. "

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.1   +(068)RecyleEliteAuryn
;;
;;==============================================================================
;;
  (defun RecycleEliteAuryn  (amount:decimal)
    @doc "Recycles EliteAuryn, which is a form of Burn \
    \ While Ouroboros is burned effectively, \
    \ burning EliteAuryn doest effectivel burn it, but rather \
    \ moves it to special designated destinations. "

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.2    (069)CreditEliteAuryn
;;
;;==============================================================================
;;
  (defun CreditEliteAuryn:string (account:string guard:guard amount:decimal)
    @doc "Credit Elite Auryn Amount to Account balance"

    @model [(property (> amount 0.0))
            (property (eighteen-precision amount))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)
    ;;Elite Hold cannot own Elite-Auryn (Elite Account cannot stake into elite)
    ;;Elite Account cannot stake into Elite Account
    (enforce (!= account ELITE_HOLD) "Elite Hold cannot own Elite-Auryn")

    (require-capability (CREDIT_ELITE-AURYN account))
    ;;
    ;;Update Plebeic Ledger
    (with-read PlebeicSnakeLedger account
      { "EliteAuryn" := ea1, "Guard" := retg }
      ; we don't want to overwrite an existing guard with the user-supplied one
      (enforce (= retg guard) "Account guards do not match!")

      (let
        (
          (eaa1:decimal (+ ea1 amount))
        )
        ;;
        (update PlebeicSnakeLedger account
          { "EliteAuryn" : eaa1
            , "Guard"   : retg
          }
        )
      )
    )
    ;;
    ;;Update Baronic Ledger
    (with-read BaronicSnakeLedger account
      { "EliteAuryn" := ea2, "VestedEliteAuryn" := vea2}


      ;; (is-new isnt needed because account must always exist.)
      ;; (is-new2 (if (= ea -1.0) (enforce-reserved account guard) false))
      (let*
        (
          (eaa2:decimal (+ ea2 amount))
          (tea2:decimal (+ eaa2 vea2))
        )
        (update BaronicSnakeLedger account
          { "EliteAuryn" : eaa2

          , "EliteAccountName" : (TierName tea2)
          , "EliteAccountTier" : (Tier tea2)
          , "EliteAccountBoost" : (TierBoost tea2)
          }
        )

        ;;Modify entries in the EAUL when EliteAuryn balance changes
        (UpdateEliteAurynUncoilLedgerByElite account tea2)

      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.3    (070)DebitEliteAuryn
;;
;;==============================================================================
;;
  (defun DebitEliteAuryn:string (account:string amount:decimal truth:bool)
    @doc "Debits Elite Auryn Amount from Account balance. \
    \ Truth set to true updates the Elite-Auryn Uncoil Ledger \
    \ False variant is needed for the UncoilEliteAurynPosition. \
    \ because the the Elite-Auryn Uncoil Ledger is updated in that transaction."

    @model [(property (> amount 0.0))
            (property (valid-account account))]

    (ValidateAccount account)
    (enforce (> amount 0.0) "debit amount must be positive")
    (EnforceSnakePrecision amount)
    (if (= truth true)
        (require-capability (DEBIT_ELITE-AURYN account))
        (require-capability (DEBIT account))
    )
    ;;
    ;;Update Plebeic Ledger
    (with-read PlebeicSnakeLedger account
      { "EliteAuryn" := ea1 }
      (enforce (<= amount ea1) "Insufficient funds")
      (update PlebeicSnakeLedger account
        { "EliteAuryn" : (- ea1 amount) }
      )
    )
    ;;
    ;;Update Baronic Ledger
    (with-read BaronicSnakeLedger account
      { "EliteAuryn" := ea2, "VestedEliteAuryn" := vea2 }
      (enforce (<= amount ea2) "Insufficient funds")

      (let*
        (
          (eaa2:decimal (- ea2 amount))
          (tea2:decimal (+ eaa2 vea2))
        )
        (update BaronicSnakeLedger account
          { "EliteAuryn" : eaa2
            , "EliteAccountName" : (TierName tea2)
            , "EliteAccountTier" : (Tier tea2)
            , "EliteAccountBoost" : (TierBoost tea2)
          }
        )
        ;;Modify entries in the EAUL when EliteAuryn balance changes
        (if (= truth true)
          (UpdateEliteAurynUncoilLedgerByElite account tea2)
          (format "Debiting Elite Auryn without updating the Elite Uncoil Ledger (truth set to {})." [truth])
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.4   +(071)DebitVestingHoldEliteAuryn
;;
;;==============================================================================
;;
  (defun DebitVestingHoldEliteAuryn (amount:decimal)
    @doc "Debits Elite Auryn from the Vesting Hold \
    \ Used when unvesting Elite Auryn."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.5   +(072)TransferEliteAuryn
;;
;;==============================================================================
;;
  (defun TransferEliteAuryn (amount:decimal)
    @doc "Transfer Auryn from one account to another. \
    \ Both acconts must exist. \
    \ A 10% volumetric fee is requred for the transfer \
    \ which is recycled."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.6   +(073)TransferEliteAurynAnew
;;
;;==============================================================================
;;
  (defun TransferEliteAurynAew (amount:decimal)
    @doc "Transfer Elite Auryn from one account to another account that doesnt exist. \
    \ Same as for the normal Transfer function,  \
    \ A 10% volumetric fee is requred for the transfer \
    \ which is recycled."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.7   +(074)VestEliteAuryn
;;
;;==============================================================================
;;
  (defun VestEliteAuryn  (amount:decimal vesting:integer)
    @doc "Vests an Elite Auryn  amount with <vesting> nr. of days"

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.8    +(075)UnvestEliteAuryn
;;
;;==============================================================================
;;
  (defun UnvestEliteAuryn  (amount:decimal)
    @doc "Unvests a batch of Vested Elite Auryn , converting it back \
    \ to free liquid Elite Auryn  \
    \ Only possible if vesting has expired."

    true
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.03     BALANCE MANIPULATION Functions
;;      02.03.9   +(076)MergeVestedEliteAuryn
;;
;;==============================================================================
;;
  (defun MergeVestedEliteAuryn  (amount:decimal)
    @doc "Merge 2 or more batches of Vested Elite Auryn  \
    \ The amount is added, and the vesting time \
    \ is is computed usng weigthed arithmetic mean. "

    true
  )
;;
;;==============================================================================
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.04.    SNAKE ACCOUNT F.
;;      02.04.1    (077)SpawnSnakeAccount
;;
;;==============================================================================
;;
  (defun SpawnSnakeAccount:string (account:string guard:guard herotag:string)
    @doc "Initializez a blank Snake Account  \
    \ Adding entries to the Plebeic and Baronic Ledgers \
    \ but also to the Uncoil Ledgers. "

    @model [(property (valid-account account))]

    (ValidateAccount account)
    ;(enforce-reserved account guard)
    (ValidateHerotag herotag account)

    ;;Enforces that Account doesnt exist
    (with-capability (IZSNAKEORNOT account guard false)
      (insert PlebeicSnakeLedger account
        {"Ouroboros" : 0.0
        ,"Auryn" : 0.0
        ,"EliteAuryn" : 0.0
        ,"Guard"   : guard
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
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.04.    SNAKE ACCOUNT F.
;;      02.04.2    (078)RotateSnakeGuard
;;
;;==============================================================================
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
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.05.1    (079)SnapshotBaronicColumn
;;
;;==============================================================================
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
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.05.2    (080)ListBaronicColumn
;;
;;==============================================================================
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
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.05.3    (081)GetBaronicColumnData
;;
;;==============================================================================
;;
  (defun GetBaronicColumnData (account:string column:string)
    @doc "Returns the Data of a given Baronic Column for a given Snake Account"

    (with-read BaronicSnakeLedger account
      { column:= data }
      data
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.05.4    (082)GetBurnData
;;
;;==============================================================================
;;
  (defun GetBurnData (column:string)
    @doc "Returns the Data of a given Column in the Burning Ledger"

    (with-read BurningLedger BURN_COUNT
      { column:= data }
      data
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.06.1a   (083)OuroborosSupplyTotal
;;      02.06.1b   (084)OuroborosSupplyVested
;;      02.06.1c   (085)OuroborosSupply
;;      02.06.1d   (086)OuroborosBalance
;;      02.06.1e   (087)OuroborosBalanceVested
;;      02.06.1f   (088)OuroborosBalanceTotal
;;
;;==============================================================================
;;
  (defun OuroborosSupplyTotal ()
    @doc "Outputs total Ouroboros Amount; Used in computing the daily minting amount."

    (fold (+) 0.0 (ListBaronicColumn "Ouroboros"))
  )
  ;;
  (defun OuroborosSupplyVested ()
    @doc "Outputs total Vested Ouroboros Amount; Used for displaying purposes."

    (OuroborosBalance VESTING_HOLD)
  )
  ;;
  (defun OuroborosSupply ()
    @doc "Outputs the total Unvested Ouroboros Amount; Used for displaying purposes."

    (let
      (
        (to:decimal (OuroborosSupplyTotal))
        (tvo:decimal (OuroborosSupplyVested))
      )
      (- to tvo)
    )
  )
  ;;
  (defun OuroborosBalance (account:string)
    @doc "Outputs the Unvested Ouroboros Balance for the Input Account"

    (GetBaronicColumnData account "Ouroboros")
  )
  ;;
  (defun OuroborosBalanceVested (account:string)
    @doc "Outputs the Vested Ouroboros Balance for the Input Account"

    (GetBaronicColumnData account "VestedOuroboros")
  )
  ;;
  (defun OuroborosBalanceTotal (account:string)
    @doc "Outputs the Ttal Ouroboros Balance for the Input Account"

    (let
      (
        (o:decimal (OuroborosBalance account))
        (vo:decimal (OuroborosBalanceVested account))
      )
      (+ o vo)
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.07.1a   (089)AurynSupplyTotal
;;      02.07.1b   (090)AurynSupplyVested
;;      02.07.1c   (091)AurynSupply
;;      02.07.1d   (092)AurynBalance
;;      02.07.1e   (093)AurynBalanceVested
;;      02.07.1f   (094)AurynBalanceTotal
;;
;;==============================================================================
;;
  (defun AurynSupplyTotal ()
    @doc "Outputs total Auryn Amount; Used for displaying purposes"

    (fold (+) 0.0 (ListBaronicColumn "Auryn"))
  )
  ;;
  (defun AurynSupplyVested ()
    @doc "Outputs total Vested Auryn Amount; Used for displaying purposes."

    (AurynBalance VESTING_HOLD)
  )
  ;;
  (defun AurynSupply ()
    @doc "Outputs the total Unvested Auryn Amount; Used for displaying purposes."

    (let
      (
        (ta:decimal (AurynSupplyTotal))
        (tva:decimal (AurynSupplyVested))
      )
      (- ta tva)
    )
  )
  ;;
  (defun AurynBalance (account:string)
    @doc "Outputs the Unvested Auryn Balance for the Input Account"

    (GetBaronicColumnData account "Auryn")
  )
  ;;
  (defun AurynBalanceVested (account:string)
    @doc "Outputs the Vested Auryn Balance for the Input Account"

    (GetBaronicColumnData account "VestedAuryn")
  )
  ;;
  (defun AurynBalanceTotal (account:string)
    @doc "Outputs the Total Auryn Balance for the Input Account"

    (let
      (
        (a:decimal (AurynBalance account))
        (va:decimal (AurynBalanceVested account))
      )
      (+ a va)
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.08.1a   (095)GetEliteAccountTierName
;;      02.08.1b   (096)GetEliteAccountTier
;;      02.08.1c   (097)GetEliteAccountTierBoost
;;      02.08.1d   (098)EliteAurynSupplyTotal
;;      02.08.1e   (099)EliteAurynSupplyVested
;;      02.08.1f   (100)EliteAurynSupply
;;      02.08.1g   (101)EliteAurynBalance
;;      02.08.1h   (102)EliteAurynBalanceVested
;;      02.08.1i   (103)EliteAurynBalanceTotal
;;
;;==============================================================================
;;
  (defun GetEliteAccountTierName (account:string)
    @doc "Returns the Tier Name of an Elite Snake Account"

    (GetBaronicColumnData account "EliteAccountName")
  )
  ;;
  (defun GetEliteAccountTier (account:string)
    @doc "Returns the Tier of an Elite Snake Account"

    (GetBaronicColumnData account "EliteAccountTier")
  )
  ;;
  (defun GetEliteAccountTierBoost (account:string)
    @doc "Returns the Tier Boost of an Elite Snake Account"

    (GetBaronicColumnData account "EliteAccountBoost")
  )
  ;;
  (defun EliteAurynSupplyTotal ()
    @doc "Outputs total Elite Auryn Amount; Used for displaying purposes"

    (fold (+) 0.0 (ListBaronicColumn "EliteAuryn"))
  )
  ;;
  (defun EliteAurynSupplyVested ()
    @doc "Outputs total Vested Elite Auryn Amount; Used for displaying purposes."

    (EliteAurynBalance VESTING_HOLD)
  )
  ;;
  (defun EliteAurynSupply ()
    @doc "Outputs the total Unvested Elite Auryn Amount; Used for displaying purposes."

    (let
      (
        (tea:decimal (EliteAurynSupplyTotal))
        (tvea:decimal (EliteAurynSupplyVested))
      )
      (- tea tvea)
    )
  )
  ;;
  (defun EliteAurynBalance (account:string)
    @doc "Outputs the Unvested Elite Auryn Balance for the Input Account"

    (GetBaronicColumnData account "EliteAuryn")
  )
  ;;
  (defun EliteAurynBalanceVested (account:string)
    @doc "Outputs the Vested Elite Auryn Balance for the Input Account"

    (GetBaronicColumnData account "VestedEliteAuryn")
  )
  ;;
  (defun EliteAurynBalanceTotal (account:string)
    @doc "Outputs the Total Elite Auryn Balance for the Input Account"

    (let
      (
        (ea:decimal (EliteAurynBalance account))
        (vea:decimal (EliteAurynBalanceVested account))
      )
      (+ ea vea)
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.05     SNAPSHOT F.
;;      02.07.1    (104)DisplayAccountBSL
;;      02.07.2    (105)DisplayAccountAUL
;;      02.07.3    (106)DisplayAccountEAUL
;;      02.07.4    (107)DisplayBL
;;      02.07.5    (108)DisplaySL
;;
;;==============================================================================
;;
  (defun DisplayAccountBSL (account:string)
    @doc "Displays Baronic Ledger Data for the account"
    (read BaronicSnakeLedger account)
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
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.08     MINTING Functions
;;      02.08.1a   (109)SpawnMintingCounter
;;      02.08.1b   (110)SpawnBurningCounter
;;
;;==============================================================================
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
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.08     MINTING Functions
;;      02.08.2a   (111)GetSpawnCounter
;;      02.08.2b   (112)GetSpawnEpoch
;;
;;==============================================================================
;;
  (defun GetSpawnCounter ()
    @doc "Outputs the spawncounter from the Spawn Count Ledger"

    (with-read SpawnCounterLedger SPAWN_COUNT
      { "spawncounter":= number }
      number
    )
  )
  (defun GetSpawnEpoch ()
    @doc "01.7.2b - (91)GetSpawnCounter  \
    \ Outputs the spawnepoch from the Spawn Count Ledger"

    (with-read SpawnCounterLedger SPAWN_COUNT
      { "spawnepoch":= number }
      number
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.08     MINTING Functions
;;      02.08.3a   (113)GetBurnedOuroboros
;;      02.08.3b   (114)GetRecycledAuryn
;;      02.08.3c   (115)GetRecycledEliteAuryn
;;
;;==============================================================================
;;
  (defun GetBurnedOuroboros ()
    @doc "Outputs the total amount of Burned Ouroboros from the Burning Ledger"

    (with-read BurningLedger BURN_COUNT
      { "BurnedSnake":= number }
      number
    )
  )
  (defun GetRecycledAuryn ()
    @doc "Outputs the total amount of Recycled Auryn from the Burning Ledger"

    (with-read BurningLedger BURN_COUNT
      { "RecycledAuryn":= number }
      number
    )
  )
  (defun GetRecycledEliteAuryn ()
    @doc "Outputs the total amount of Recycled Elite Auryn from the Burning Ledger"

    (with-read BurningLedger BURN_COUNT
      { "RecycledEliteAuryn":= number }
      number
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.08     MINTING Functions
;;      02.08.4    (116)SpawnPrimordialSnakes
;;
;;==============================================================================
;;
  (defun SpawnPrimordialSnakes (account:string guard:guard)
    @doc "Mints the Genesis Snake Token Amount, equal to 490.000 \
    \ Only the GENESIS_MINTER that provides the KEY_MINTER key is allowed to execute this mint \
    \ Moreover it can only be executed when the total Ouroboros Supply is ZERO \
    \ And once executed, it can never be executed again.\
    \ After Mint, designated Amounts are diverted towards Sale, Treasury and Developers Funds."

    (ValidateAccount account)
    (enforce (= account GENESIS_MINTER) "Function caller is not the legitimate GENESIS Minter")

    ;;Enforcing that genesis mint is executed when no entries have been entered
    ;; in the SpawnCounterLedger
    (let
      (
        (c:integer (GetSpawnCounter))
        (e:integer (GetSpawnEpoch))
      )
      (enforce (and (= c -1) (= e -1)) "Genesis has been minted")
    )

    ;;Enforcing genesis mint can only happen when total supply is zero
    ;; and that it can only be done with a quantity equal to GENESIS_AMOUNT
    (let
      (
        (ouroborossupply:decimal (OuroborosSupplyTotal))
        (initialamount:decimal GENESIS_AMOUNT)
      )
      ;dailyamount
      (enforce (= ouroborossupply 0.0) "Supply is non-zero, Genesis amount must must have allready been minted")
      (EnforceSnakePrecision initialamount)

      (with-capability (GENESIS_SPAWN account initialamount)

        (emit-event (TRANSFER "" account initialamount)) ;v3
        (CreditOuroboros account guard initialamount true)

      ;;Update Counter Table, making it 0 0 , which means gensis amount has
      ;; been succesfully minted.
        (update SpawnCounterLedger SPAWN_COUNT
          { "spawncounter" : (+ 1 (GetSpawnCounter)), "spawnepoch" : (+ 1 (GetSpawnEpoch))}
        )

        ;;Deliver Genesis Mint Allocations to target Destinations
        (let
          (
            (a:decimal GENESIS_TREASURY)
            (b:decimal GENESIS_DEVELOPERS)
            (c:decimal GENESIS_SALE)
          )
          ;;Transfer to Treasury Genesis Mint Allocation
          (DebitOuroboros account a)
          (with-read PlebeicSnakeLedger TREASURY
            { "Guard" := z }
            (CreditOuroboros TREASURY z a true)
          )
          ;;Transfer to Developers Genesis Mint Allocation
          (DebitOuroboros account b)
          (with-read PlebeicSnakeLedger DEVELOPERS
            { "Guard" := z }
            (CreditOuroboros DEVELOPERS z b true)
          )
          ;;Transfer to Sale Genesis Mint Allocation
          (DebitOuroboros account c)
          (with-read PlebeicSnakeLedger TOKEN_SALE
            { "Guard" := z }
            (CreditOuroboros TOKEN_SALE z c true)
          )
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.08     MINTING Functions
;;      02.08.5    (117)SpawnDailySnakes
;;
;;==============================================================================
;;
  (defun SpawnDailySnakes (account:string guard:guard spawningtime:time)
    @doc "Mints the Daily Issuance, and transfer it to its designated target destinations \
    \ in their designated amounts and forms, depending on target designation \
    \ It can be called only once per day. \
    \ spawningtime mockups mint time, for testing purpose, on mainnet it is automatically \
    \ taken from Blockchain data. WENLIVE"

    ;;spawningtime is mockup replacement for actual time which will be called
    ;; via the automatic timing function variant.
    ;; (at "block-time" (chain-data))
    ;;WENLIVE spawning time must be taken out
    (ValidateAccount account)
    (enforce (= account DAILY_MINTER) "Function caller is not the legitimate DAILY Minter")

    (with-read SpawnCounterLedger SPAWN_COUNT
      { "spawncounter":= number }
      (enforce (>= number 0) "Genesis must be minted first")
    )

    (let
      (
        (dailyamount:decimal (ComputeDailySpawnAmount))
        (ouroborossupply:decimal (OuroborosSupplyTotal))
        (epochatmint:integer (GetCurrentEpochManual spawningtime))
      )
      ;;WENLIVE use (GetCurrentEpochAuto)
      ;dailyamount
      (enforce (> epochatmint 0) "Daily amount can only be minted starting with epoch 1")
      (enforce (> ouroborossupply 0.0) "Supply is zero, Genesis mint must be used first")
      (EnforceSnakePrecision dailyamount)
      (let
        (
          (epochdiff:integer (- epochatmint (GetSpawnEpoch)))
        )
        (enforce (>= epochdiff 1) "Daily mint allready minted this epoch")
      )

      (with-capability (UPDATEAGE)
        (map
          (lambda
            (ac:string)
            (UpdateSnakeAccountAge ac)
          )
          (keys BaronicSnakeLedger)
        )
      )

      (with-capability (DAILY_SPAWN account)
        (emit-event (TRANSFER "" account dailyamount)) ;v3
        (with-capability (CREDIT account)
          (CreditOuroboros account guard dailyamount true)
        )

      ;;Update Counter Table
        (update SpawnCounterLedger SPAWN_COUNT
          { "spawncounter" : (+ 1 (GetSpawnCounter)), "spawnepoch" : epochatmint}
        )

        (let*
          (
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
          )
          ;;Transfer to Autostaking
          ;;Autostaking must be filled first
          (DebitOuroboros account g)
          (with-read PlebeicSnakeLedger AUTO_STAKING
            { "Guard" := z, "Ouroboros" := o}
            (enforce (> o 0.0) "Autostake fill cannot happen on empty pool")
            (CreditOuroboros AUTO_STAKING z g true)
          )
          ;;Transfer to Bonds
          (DebitOuroboros account a)
          (with-read PlebeicSnakeLedger BONDS
            { "Guard" := z }
            (CreditOuroboros BONDS z a true)
          )
          ;;Transfer to Treasury
          (DebitOuroboros account b)
          (with-read PlebeicSnakeLedger TREASURY
            { "Guard" := z }
            (CreditOuroboros TREASURY z b true)
          )
          ;;Transfer to Shareholders
          (DebitOuroboros account c)
          (with-read PlebeicSnakeLedger SHAREHOLDERS
            { "Guard" := z }
            (CreditOuroboros SHAREHOLDERS z c true)
          )
          ;;Transfer to Developers
          (DebitOuroboros account d)
          (with-read PlebeicSnakeLedger DEVELOPERS
            { "Guard" := z }
            (CreditOuroboros DEVELOPERS z d true)
          )
          ;;Transfer to Raffles
          (DebitOuroboros account e)
          (with-read PlebeicSnakeLedger RAFFLES
            { "Guard" := z }
            (CreditOuroboros RAFFLES z e true)
          )

          ;;Transfer to Liqudity Farming + COIL
          (DebitOuroboros account f)
          (with-read PlebeicSnakeLedger LIQUIDITY_FARMING
            { "Guard" := z }
            (CreditOuroboros LIQUIDITY_FARMING z f true)
          )
          ;;Deliver Daily Liquidity Farming as Auryn
          (CoilOuroboros LIQUIDITY_FARMING f)


          ;;Transfer to Subsidiary Staking + COIL
          (DebitOuroboros account h)
          (with-read PlebeicSnakeLedger SUBSIDIARY_STAKING
            { "Guard" := z }
            (CreditOuroboros SUBSIDIARY_STAKING z h true)
          )
          ;;Deliver Daily Subsidiary Stakingas Auryn
          (CoilOuroboros SUBSIDIARY_STAKING h)

          ;;Transfer to Snake Staking + COIL
          (DebitOuroboros account i)
          (with-read PlebeicSnakeLedger SNAKE_STAKING
            { "Guard" := z }
            (CreditOuroboros SNAKE_STAKING z i true)
          )
          ;;Deliver Daily Snake Staking as Auryn
          (CoilOuroboros SNAKE_STAKING i)

          ;;Transfer to VEGLD Staking + COIL
          (DebitOuroboros account j)
          (with-read PlebeicSnakeLedger VEGLD_STAKING
            { "Guard" := z }
            (CreditOuroboros VEGLD_STAKING z j true)
          )
          ;;Deliver Daily vEGLD Staking as Auryn
          (CoilOuroboros VEGLD_STAKING j)
          ;(- dailyamount (+ i (+ h (+ g (+ f (+ e (+ d (+ c (+ a b)))))))))
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 02.     BALANCE RELATED Functions
;;      02.08     MINTING Functions
;;      02.08.6    (118)UpdateSnakeAccountAge
;;
;;==============================================================================
;;
  (defun UpdateSnakeAccountAge (account:string)
    @doc "With each daily mint, all accounts age. \
    \ Age is incremented by 1 with each daily mint event, \
    \ as such the daily mint event acts as the age change event."

    (require-capability (UPDATEAGE))
    (with-read BaronicSnakeLedger account
      { "Age" := a }
      (update BaronicSnakeLedger account
        { "Age" : (+ a 1)}
      )
    )
  )
;;
;;==============================================================================
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.01     COIL Functions
;;      03.01.1    (119)CoilOuroboros
;;
;;==============================================================================
;;
  (defun CoilOuroboros (sender:string amount:decimal)
    @doc "Coils Ouroboros, (staking) it to the Autostake Pool \
    \ Happens without delays. Autostake Pool cannot coil Ouroboros. \
    \ This enforcement exists in the COIL_OUROBOROS capability "

    @model [(property (> amount 0.0))
            (property (valid-account sender))
            (property (valid-account AUTO_STAKING))
            (property (!= sender AUTO_STAKING))]


    (ValidateAccount sender)
    (ValidateAccountForTransfers sender)
    (enforce (> amount 0.0) "Ouroboros Coil Amount must be positive!")
    (EnforceSnakePrecision amount)

    (with-capability (COIL_OUROBOROS sender amount)
      (let*
        (
          (auryndex:decimal (GetAuryndex))
          (aurynamount:decimal (TruncateToSnake (/ amount auryndex)))
        )

        ;:Step 1 - Debiting Ouroboros from the sender, that is to be coiled
        (DebitOuroboros sender amount)
        ;;Step 2 - Crediting it to the Autostake Pool
        (with-read PlebeicSnakeLedger AUTO_STAKING
          { "Guard" := z }
          (CreditOuroboros AUTO_STAKING z amount true)
        )
        ;;Step 3 - Crediting Auryn to the Sender in decreasing amounts (when index > 1)
        (with-read PlebeicSnakeLedger sender
          { "Guard" := z }
          (CreditAuryn sender z aurynamount)
        )
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.01     COIL Functions
;;      03.01.2    (120)CoilAuryn
;;
;;==============================================================================
;;
  (defun CoilAuryn (sender:string amount:decimal)
    @doc "Coils Auryn, (staking) it to the Elite Account Hold \
    \ Happens without delays. Elite Hold cannot coil Auryn. \
    \ This enforcement exists in the COIL_AURYN capability "

    @model [(property (> amount 0.0))
            (property (valid-account sender))
            (property (valid-account ELITE_HOLD))
            (property (!= sender ELITE_HOLD))]

    (ValidateAccount sender)
    (ValidateAccountForTransfers sender)
    (enforce (> amount 0.0) "Auryn Coil Amount must be positive!")
    (EnforceSnakePrecision amount)

    (with-capability (COIL_AURYN sender)
      ;:Step 1 - Debiting Auryn from the sender, that is to be coiled
      (DebitAuryn sender amount)
      ;;Step 2 - Crediting it to the Elite Account
      (with-read PlebeicSnakeLedger ELITE_HOLD
        { "Guard" := z }
        (CreditAuryn ELITE_HOLD z amount)
      )
      ;;Step 3 - Crediting Elite Auryn to the Sender 1:1 ratio)
      (with-read PlebeicSnakeLedger sender
        { "Guard" := z }
        (CreditEliteAuryn sender z amount)
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.1    (121)BestUncoilAuryn
;;
;;==============================================================================
;;
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

    (let*
      (
        (p:integer (GetBestAurynUncoilPosition sender))
        (a:decimal (AurynBalance sender))
        (oa:decimal (- a amount))
      )
      (enforce (!= p 0.0) "No free Auryn Uncoil Positions that can be used for unstake")
      (enforce (>= oa 0.0) (format "Not enough Auryn balance to uncoil {} Auryn" [amount]))
      (with-capability (UNCOIL_AURYN sender)
        (UncoilAurynPosition sender amount p inputtime)
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.2    (122)UncoilAurynPosition
;;
;;==============================================================================
;;
  (defun UncoilAurynPosition (sender:string amount:decimal position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Auryn Uncoil procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    @model [(property (> amount 0.0))
            (property (valid-account sender))
            (property (valid-account AUTO_STAKING))
            (property (!= sender AUTO_STAKING))]

    (ValidateAccountWithTransferWithPosition sender position)
    (EnforceSnakePrecision amount)
    (enforce (> amount 0.0) "Auryn Uncoil amount must be positive")

    (require-capability (UNCOIL_AURYN sender))
    (let*
      (
        (auryndex:decimal (GetAuryndex))
        (ouroborosamount:decimal
          (if (= sender (AurynSupplyTotal))
            (OuroborosBalance AUTO_STAKING)
            (TruncateToSnake (* amount auryndex))
          )
        )
        (fee:integer (GetAurynUncoilFee amount position))
        (feeabsolute:decimal (MakePermille ouroborosamount (dec fee)))
        (ouroborosleft:decimal (- ouroborosamount feeabsolute))
      )
      ;;IF Sender amount equal Total Auryn Supply, it means the sender
      ;; is the only staker in autostake. The  Ouroboros amount is the
      ;; total amount held by autostake.
      ;; this is done in order to extract all Autostake Supply in this case

      ;;Step 1 - Debit Auryn from the sender
      (DebitAuryn sender amount)
      ;;Step 2 - Debit Ouroboros from the Autostake Account
      ;;Debiting the Ouroborosleft, while the fee absolute is burned
      (DebitAutostakedOuroboros ouroborosleft)
      (BurnAutostakedOuroboros feeabsolute sender)

      ;;Step 3 - Crediting increased Ouroboros amount to the sender
      ;;Crediting the Ouroboros Amount to the UNCOIL_HOLD while
      ;; writing an entry in the Uncoil Auryn Ledger
      ;; with the amount and time
      ;; WENLIVE GetCurrentEpochManual must be replaced with auto
      (let*
        (
          (uncoiltime:integer (GetAurynUncoilTime sender))
          (currentepoch:integer (GetCurrentEpochManual inputtime))
          (expiringepoch:integer (+ uncoiltime currentepoch))
        )
        ;;3.1 Crediting the the remaining Ouroboros Amount to the UNCOIL_HOLD
        (with-read PlebeicSnakeLedger UNCOIL_HOLD
          { "Guard" := z }
          ;(with-capability (CREDIT UNCOIL_HOLD)
          ;;(CREDIT UNCOIL_HOLD) is allready composed in UNCOILAURYN capability
          (CreditOuroboros UNCOIL_HOLD z ouroborosleft true)
          ;)
        )
        ;;3.2 Saving the same Amount of Ouroborosleft, to the AurynUncoilLedger
        ;;  together with its expiring epoch in the AurynUncoilLedger
        (UpdateAurynUncoilLedgerIncoming sender position ouroborosleft expiringepoch)
        ;)
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.3    (123)FinalizeUncoilAuryn
;;
;;==============================================================================
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
        (p:decimal (GetRipeAurynUncoilPosition sender inputtime))
      )
      (enforce (!= p 0.0) "No ripe Auryn Uncoil positions to harvest.")
      (with-capability (UNCOIL_AURYN-HARVEST sender)
        (FinalizeUncoilAurynPosition sender p inputtime)
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.4    (124)FinalizeUncoilAurynPosition
;;
;;==============================================================================
;;
  (defun FinalizeUncoilAurynPosition (sender:string position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Auryn Uncoil finalisation procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    @model [(property (> amount 0.0))
            (property (valid-account sender))
            (property (valid-account UNCOIL_HOLD))
            (property (!= sender UNCOIL_HOLD))]

    (ValidateAccountWithTransferWithPosition sender position)

    (require-capability (UNCOIL_AURYN-HARVEST sender))
    (let
      (
        (epochnow:integer (GetCurrentEpochManual inputtime))
        (harvestamount:decimal (at 0 (GetUncoilLedgerPositionData sender position false)))
        (harvestepoch:integer (at 1 (GetUncoilLedgerPositionData sender position false)))
      )

      (enforce (>= epochnow harvestepoch) "You cannot harvest position yet")
      ;;Step 1 - Debit Uncoil Hold manually
      ;;DEBITING Directly the Uncoil Hold from the Plebeic Ledger
      (DebitUncoilHoldOuroboros harvestamount)

      ;;Step 2 - Credit sender the harvested Ouroboros
      (with-read PlebeicSnakeLedger sender
        { "Guard" := z }
        (CreditOuroboros sender z harvestamount true)
      )
      ;;Step 3 - Clear Position in AurynUncoilLedger
      (UpdateAurynUncoilLedgerOutgoing sender position)
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.5    (125)GetAurynUncoilFee
;;
;;==============================================================================
;;
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.6    (126)GetAurynUncoilTime
;;
;;==============================================================================
;;
  (defun GetAurynUncoilTime:integer (account:string)
    @doc "Outputs the Auryn Uncoil time, which is dependent on Elite Account Tier"

    (let
      (
        (t:integer (GetEliteAccountTier account))
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.7    (127)GetBestAurynUncoilPosition
;;
;;==============================================================================
;;
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.8    (128)GetRipeAurynUncoilPosition
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.9    (129)UpdateAurynUncoilLedgerIncoming
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.02     UNCOIL AURYN Functions
;;      03.02.10   (130)UpdateAurynUncoilLedgerOutgoing
;;
;;==============================================================================
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
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.1    (131)BestUncoilEliteAuryn
;;
;;==============================================================================
;;
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

    (let*
      (
        (p:integer (GetBestEliteAurynUncoilPosition sender amount))
        (ea:decimal (EliteAurynBalance sender))
        (oea:decimal (- ea amount))
      )
      (enforce (!= p 0.0) "No free Elite-Auryn Uncoil Positions that can be used for unstake")
      (enforce (>= oea 0.0) (format "Not enough Elite-Auryn balance to uncoil {} Elite-Auryn" [amount]))
      (with-capability (UNCOIL_ELITE-AURYN sender)
        (UncoilEliteAurynPosition sender amount p inputtime)
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.2    (132)UncoilEliteAurynPosition
;;
;;==============================================================================
;;
  (defun UncoilEliteAurynPosition (sender:string amount:decimal position:integer inputtime:time)
    @doc "The Core Function that actually executes all the Elite-Auryn Uncoil procedures \
    \ The steps are described within the function \
    \ Uses inputtime as a way to mock Uncoil time for testing purposes. \
    \ Mainnet variant gets auto time from blockchain data. #WENLIVE "

    @model [(property (> amount 0.0))
            (property (valid-account sender))]

    (ValidateAccountWithTransferWithPosition sender position)
    (EnforceSnakePrecision amount)
    (enforce (> amount 0.0) "Elite-Auryn Uncoil amount must be positive")

    (require-capability (UNCOIL_ELITE-AURYN sender))
    (let*
      (
        (tea:decimal (EliteAurynBalanceTotal sender))
        (fea:decimal (- tea amount))

        (uncoiltime:integer (GetEliteAurynUncoilTimeByAmount fea))
        (currentepoch:integer (GetCurrentEpochManual inputtime))
        (expiringepoch:integer (+ uncoiltime currentepoch))
      )

      ;;Step 1 - Debit EliteAuryn from the sender
      (DebitEliteAuryn sender amount false)
      ;;Step 2 - Debit Auryn from the Elite Account Hold
      (DebitEliteHoldAuryn amount)

      ;;Step 3.1 Crediting the Auryn Amount to the Uncoil Hold
      (with-read PlebeicSnakeLedger UNCOIL_HOLD
        { "Guard" := z }
        ;;(CREDIT UNCOIL_HOLD) is allready composed in UNCOILAURYN capability
        ;(CreditAuryn UNCOIL_HOLD z sender true)
        (CreditAuryn UNCOIL_HOLD z amount)  ;;with true now
      )
      ;;Step 3.2 Saving the same Amount of Ouroborosleft, to the AurynUncoilLedger
      ;;  together with its expiring epoch in the AurynUncoilLedger
      (UpdateEliteAurynUncoilLedgerIncoming sender amount position expiringepoch fea)
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.3    (133)FinalizeUncoilEliteAuryn
;;
;;==============================================================================
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
        (p:decimal (GetRipeEliteAurynUncoilPosition sender inputtime))
      )
      (enforce (!= p 0.0) "No ripe Elite Auryn Uncoil positions to harvest.")
      (with-capability (UNCOIL_ELITE-AURYN-HARVEST sender)
        (FinalizeUncoilEliteAurynPosition sender p inputtime)
      )
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.4    (134)FinalizeUncoilEliteAurynPosition
;;
;;==============================================================================
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
        (tea:decimal (EliteAurynBalanceTotal sender))
      )

      (enforce (>= epochnow harvestepoch) "You cannot harvest position yet")
      ;;Step 1 - Debit Uncoil Hold manually
      ;;DEBITING Directly the Uncoil Hold from the Plebeic Ledger
      (DebitUncoilHoldAuryn harvestamount)

      ;;Step 2 - Credit sender the harvested Auryn
      (with-read PlebeicSnakeLedger sender
        { "Guard" := z }
        ;(CreditAuryn sender z harvestamount true)
        (CreditAuryn sender z harvestamount)
      )
      ;;Step 3 - Clear Position in AurynUncoilLedger
      ;(UpdateEliteAurynUncoilLedgerOutgoing sender position)

      (UpdateEliteAurynUncoilLedgerOutgoing sender position tea)

    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.5    (135)GetEliteAurynUncoilTimeByAmount
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.6    (136)GetBestEliteAurynUncoilPosition
;;
;;==============================================================================
;;
  (defun GetBestEliteAurynUncoilPosition:integer (account:string amount:decimal)
    @doc "Outputs the best Elite-Auryn Uncoil Position, given amount that is to be taken out \
    \ If no position is found, which happens when all positions are occupied, \
    \ it outputs 0"

    ;;Blacklisted accounts are not allowed to execute this function
    (ValidateAccount account)
    (ValidateAccountForTransfers account)

    (let*
      (
        (ea:decimal (EliteAurynBalance account))
        (oea:decimal (- ea amount))
      )
      (enforce (>= oea 0.0) (format "Not enough Elite-Auryn balance to uncoil {} Elite-Auryn" [amount]))
      (let*
        (
          (tea:decimal (EliteAurynBalanceTotal account))
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
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.7    (137)GetRipeEliteAurynUncoilPosition
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.8    (138)UpdateEliteAurynUncoilLedgerIncoming
;;
;;==============================================================================
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
    (require-capability (FIX_ELITE-SIX))
    (let*
      (
        (type:integer (IzUncoilLedgerPositionWhat account position true))
        (positionlistshort (TakeUpdatePositionOut position))
        (p1:integer (IzUncoilLedgerPositionWhat account 1 true))
        (p2:integer (IzUncoilLedgerPositionWhat account 2 true))
        (p3:integer (IzUncoilLedgerPositionWhat account 3 true))
        (p4:integer (IzUncoilLedgerPositionWhat account 4 true))
        (p5:integer (IzUncoilLedgerPositionWhat account 5 true))
        (p6:integer (IzUncoilLedgerPositionWhat account 6 true))
        (p7:integer (IzUncoilLedgerPositionWhat account 7 true))
        (typelist [p1 p2 p3 p4 p5 p6 p7])
        (typelistshort (TakeUpdatePositionOutFromList position typelist))
        (futuretier (Tier future-ea))
      )

      (enforce (= type 0) "Position must be free in order to use it!")
      ;;Updating the amount uncoil amount
      (UpdateUncoilLedgerDataIncoming account position amount epoch true)

      (FixPositionByElite account (at 0 positionlistshort) (at 0 typelistshort) futuretier)
      (FixPositionByElite account (at 1 positionlistshort) (at 1 typelistshort) futuretier)
      (FixPositionByElite account (at 2 positionlistshort) (at 2 typelistshort) futuretier)
      (FixPositionByElite account (at 3 positionlistshort) (at 3 typelistshort) futuretier)
      (FixPositionByElite account (at 4 positionlistshort) (at 4 typelistshort) futuretier)
      (FixPositionByElite account (at 5 positionlistshort) (at 5 typelistshort) futuretier)
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.9    (139)UpdateEliteAurynUncoilLedgerOutgoing
;;
;;==============================================================================
;;
  (defun UpdateEliteAurynUncoilLedgerOutgoing (account:string position:integer future-ea:decimal)
    @doc "Updates the Auryn Ledger on the given position when finalizing \
    \ an Elite-Auryn Uncoil event, to basically clear the used position.\
    \ The data that will be written depends on the Elite Account Tier, checked \
    \ against the position that must be cleared, at the time of event execution \
    \ As such the data to b e written will be either (-1.0/-1) or (0.0/0) \
    \ Requires Capability FIX_ELITE-SIX --> FIX_ELITE-SIX --> UPDATE_UNCOIL-LEDGERS"

    (require-capability (FIX_ELITE-SIX))
    (let*
      (
        (type:integer (IzUncoilLedgerPositionWhat account position true))
        (positionlistshort (TakeUpdatePositionOut position))
        (p1:integer (IzUncoilLedgerPositionWhat account 1 true))
        (p2:integer (IzUncoilLedgerPositionWhat account 2 true))
        (p3:integer (IzUncoilLedgerPositionWhat account 3 true))
        (p4:integer (IzUncoilLedgerPositionWhat account 4 true))
        (p5:integer (IzUncoilLedgerPositionWhat account 5 true))
        (p6:integer (IzUncoilLedgerPositionWhat account 6 true))
        (p7:integer (IzUncoilLedgerPositionWhat account 7 true))
        (typelist [p1 p2 p3 p4 p5 p6 p7])
        (typelistshort (TakeUpdatePositionOutFromList position typelist))
        (futuretier (Tier future-ea))
      )

      (enforce (= type 1) "Position must be occupied in order to clear it!")
      ;;; Much check if it needs to be cleared of locked.

      (if (or (or (= futuretier NTIERN) (= futuretier NTIER0)) (= futuretier NTIER1))
        (UpdateUncoilLedgerDataOutgoing account position true true)
        (if (> (floor position) futuretier)
          (UpdateUncoilLedgerDataOutgoing account position true false)
          (UpdateUncoilLedgerDataOutgoing account position true true)
        )
      )

      (FixPositionByElite account (at 0 positionlistshort) (at 0 typelistshort) futuretier)
      (FixPositionByElite account (at 1 positionlistshort) (at 1 typelistshort) futuretier)
      (FixPositionByElite account (at 2 positionlistshort) (at 2 typelistshort) futuretier)
      (FixPositionByElite account (at 3 positionlistshort) (at 3 typelistshort) futuretier)
      (FixPositionByElite account (at 4 positionlistshort) (at 4 typelistshort) futuretier)
      (FixPositionByElite account (at 5 positionlistshort) (at 5 typelistshort) futuretier)
    )
  )
;;
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.10   (140)UpdateEliteAurynUncoilLedgerByElite
;;
;;==============================================================================
;;
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      01.04.11   (141)FixPositionByElite
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      01.04.12   (142)ReversePositionStatus
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.13   (143)LockEliteAurynUncoilLedgerPosition
;;
;;==============================================================================
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
;;==============================================================================
;; PART 03.     COIL-UNCOIL Functions
;;      03.04     UNCOIL ELITE AURYN Functions
;;      03.04.14   (144)UnlockEliteAurynUncoilLedgerPosition
;;
;;==============================================================================
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
;;==============================================================================
;;==============================================================================
;; PART 04.     VESTING Functions
;;      04.01     TEMPORAL FFunctions
;;      04.01.1    (145)GetCurrentEpochAuto
;;
;;==============================================================================
;;
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
;;
;;==============================================================================
;; PART 04.     VESTING Functions
;;      04.01     TEMPORAL FFunctions
;;      04.01.2    (146)GetCurrentEpochManual
;;
;;==============================================================================
;;
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
;;

  (defun SplitDemiourgosHoldings (amount:decimal type:integer)
    @doc "Credits a certain token amount to Demiourgos.Holdings \
    \ 50% goes to the Snakes-DAO, and 50% goes to the Shareholders Pool \
    \ type 1 = OUROBOROS, type 2 = Auryn, type 3 = Elite-Auryn \
    \ Protected by capability DISTRIBUTE_WEALTH"

    (enforce (> amount 0.0) "Token Amount must be positive!")
    (EnforceSnakePrecision amount)

    (let*
      (
        (sdao:decimal (TruncateToSnake (/ amount 2.0)))
        (dshs:decimal (- amount sdao))
      )
      true

    )
  )

  (defun DirectCreditOuroborosPlebeicGuarded (account:string amount:decimal guard:guard)

    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)

    (with-read PlebeicSnakeLedger account
      { "Ouroboros" := o, "Guard" := g }
      (enforce (= g guard) "Account guards do not match!")
      (let
        (
          (summ:decimal (+ o amount))
        )
        (update PlebeicSnakeLedger account
          { "Ouroboros" : summ , "Guard"   : g}
        )
      )
    )
  )

  (defun DirectCreditOuroborosPlebeic (account:string amount:decimal)

    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)

    (with-read PlebeicSnakeLedger account
      { "Ouroboros" := o }
      (let
        (
          (summ:decimal (+ o amount))
        )
        (update PlebeicSnakeLedger account
          { "Ouroboros" : summ }
        )
      )
    )
  )

  (defun DirectCreditOuroborosBaronicGuarded (account:string amount:decimal guard:guard)
    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)

    (with-read PlebeicSnakeLedger account
      { "Guard" := g }
      (enforce (= g guard) "Account guards do not match!")
      (with-read BaronicSnakeLedger account
        { "Ouroboros" := o }
        (let
          (
            (summ:decimal (+ o amount))
          )
          (update BaronicSnakeLedger account
            { "Ouroboros" : summ }
          )
        )
      )
    )
  )

  (defun DirectCreditOuroborosBaronic (account:string amount:decimal)
    (ValidateAccount account)
    (enforce (> amount 0.0) "Credit amount must be positive")
    (EnforceSnakePrecision amount)


    (with-read BaronicSnakeLedger account
      { "Ouroboros" := o }
      (let
        (
          (summ:decimal (+ o amount))
        )
        (update BaronicSnakeLedger account
          { "Ouroboros" : summ }
        )
      )
    )
  )

  (defun DFR (account:string)
    (with-default-read BaronicSnakeLedger account
        { "Ouroboros" : -1.0 }
        { "Ouroboros" := balance }
    balance
    )
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

;(if a b
;  (if c d
;    (if e f
;      (if g h
;        (if i j
;          (if k l
;            m
;          )
;        )
;      )
;    )
;  )
;)
