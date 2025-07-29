import styles from './CohortDetails.module.css';

function CohortDetails(props) {
    const status = props.cohort.currentStatus;

    return (
        <div className={styles.box}>
            <h3 style={{ color: status === "ongoing" ? "green" : "blue" }}>
                {props.cohort.cohortCode} - {props.cohort.technology}
            </h3>
            <dl>
                <dt>Started On</dt>
                <dd>{props.cohort.startDate}</dd>
                <dt>Current Status</dt>
                <dd>{status}</dd>
                <dt>Coach</dt>
                <dd>{props.cohort.coachName}</dd>
                <dt>Trainer</dt>
                <dd>{props.cohort.trainerName}</dd>
            </dl>
        </div>
    );
}

export default CohortDetails;
